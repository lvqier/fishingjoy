LhdController = class("LhdController")

requireLuaFromModule("lhd.controller.LhdControllerNet")

LhdController.ctor = function (slot0, slot1)
	slot0.model = slot1

	ClassUtil.extends(slot0, BaseGameController)
	slot0:customCtor()
end

LhdController.destroy = function (slot0)
	slot0.model = nil
end

LhdController.resetBattle = function (slot0)
	slot0:resetGame()
	slot0.model:setIsShowingBalance(false)
	slot0.model:setIsShowingMenu(false)
end

LhdController.onEnterForeground = function (slot0)
	BaseGameController.onEnterForeground(slot0)
end

LhdController.onEnterBackground = function (slot0)
	BaseGameController.onEnterBackground(slot0)
end

LhdController.customCtor = function (slot0)
	slot0.model:setSwitchStatePos({
		onX = 141.34,
		offX = 69.34
	})
	slot0:loadResourceToCache()
	slot0:initProtoFunc()
end

LhdController.loadResourceToCache = function (slot0)
	resMgr:loadTextureAtlas(LHD_BALANCE_PLIST)
	resMgr:loadTextureAtlas(LHD_NUM_FONT_PLIST)
	resMgr:loadTextureAtlas(LHD_OPEN_CARD_PLIST)
	resMgr:loadTextureAtlas(LHD_BET_SCORE_PLIST)
	resMgr:loadTextureAtlas(LHD_REWARD_SCORE_PLIST)
end

LhdController.getProtoFuncById = function (slot0, slot1)
	if slot0.netProtoFunc == nil then
		LhdPrint("----> self.netProtoFunc = nil ")

		return
	end

	return slot0.netProtoFunc[slot1]
end

LhdController.protoGamingFree = function (slot0, slot1)
	slot0.model:setGameStatus(LHD_GAMING_FREE)
	slot0:resetGame()
	slot0:setGamingTimer(slot1.leftTimer, LHD_GAMING_TIMER_FREE)
	slot0.model:dispatchEvt(LHD_EVT_GAMING_FREE, true)
end

LhdController.protoGamingBet = function (slot0, slot1)
	slot0.model:setGameStatus(LHD_GAMING_BET)
	slot0.model:setSelfCanBetMaxScore(slot1.selfCanBetMaxScore)

	if LHD_AFTER_WITHDRAWAL_CAN_BET then
	else
		slot0.model:setSelfBetStartMoney(Hero:getUserScore())
	end

	slot2 = {}

	for slot6 = 0, 2, 1 do
		slot2[slot6] = slot1.areaAllLimitBetScore[slot6 + 1]
	end

	slot0.model:setAreaAllLimitBetScore(slot2, true)
	slot0.model:setAreaSelfLimitBetScore(slot1.areaSelfLimitBetScore)
	slot0:setGamingTimer(slot1.leftTimer, LHD_GAMING_TIMER_BET)
	slot0.model:dispatchEvt(LHD_EVT_GAMING_BET, true)
end

LhdController.protoGamingEnd = function (slot0, slot1)
	clone(slot1).bUpdate = true

	slot0.model:setBalanceData(slot2)
	slot0.model:setGameStatus(LHD_GAMING_END)
	slot0:setGamingTimer(slot1.leftTimer, LHD_GAMING_TIMER_END)

	slot3 = slot0.model:getAreaSelfJettonScore()

	for slot7 = 0, 2, 1 do
		if slot3[slot7] ~= nil and slot3[slot7] > 0 then
			slot0.model:setPreGameBetData(clone(slot3))

			break
		end
	end

	table.insert(slot4, slot2.winner)

	if #slot0.model:getBalanceRealHistoryData() > 100 then
		table.remove(slot4, 1)
	end

	slot0.model:dispatchEvt(LHD_EVT_GAMING_END, slot1)
end

LhdController.protoGamingJetton = function (slot0, slot1)
	slot2 = slot0.model:getAreaAllJettonScore()
	slot2[slot1.betAreaIdx] = slot2[slot1.betAreaIdx] + slot1.betScore

	slot0.model:setAreaAllJettonScore(slot2, true)

	slot3 = 0

	for slot7 = 0, 2, 1 do
		slot3 = slot3 + slot2[slot7]
	end

	slot0.model:setSelfHasBettedScore(slot3)

	if slot1.chairId == Hero:getWChairID() then
		slot0.model:setIsCanRemand(false)

		slot4 = slot0.model:getAreaSelfJettonScore()
		slot4[slot1.betAreaIdx] = slot4[slot1.betAreaIdx] + slot1.betScore

		slot0.model:setAreaSelfJettonScore(slot4, true)
		Hero:addUserFakeScore(slot1.betScore * -1)
	end

	slot0.model:dispatchEvt(LHD_EVT_JETTON, slot1)
end

LhdController.protoGamingRemandJetton = function (slot0, slot1)
	if slot1.succeed then
		slot2 = slot0.model:getAreaAllJettonScore()
		slot3 = 0

		for slot7 = 1, 10, 1 do
			if slot1.betScore[slot7] > 0 and slot1.betNumber[slot7] > 0 then
				slot3 = slot3 + slot1.betScore[slot7] * slot1.betNumber[slot7]
			else
				break
			end
		end

		slot2[slot1.betAreaIdx] = slot2[slot1.betAreaIdx] + slot3

		slot0.model:setAreaAllJettonScore(slot2, true)

		slot4 = 0

		for slot8 = 0, 2, 1 do
			slot4 = slot4 + slot2[slot8]
		end

		slot0.model:setSelfHasBettedScore(slot4)

		if slot1.chairId == Hero:getWChairID() then
			slot0.model:setIsCanRemand(false)

			slot5 = slot0.model:getAreaSelfJettonScore()
			slot5[slot1.betAreaIdx] = slot5[slot1.betAreaIdx] + slot3

			slot0.model:setAreaSelfJettonScore(slot5, true)
			Hero:addUserFakeScore(slot3 * -1)
		end
	end

	slot0.model:dispatchEvt(LHD_EVT_REMAND_JETTON, slot1)
end

LhdController.protoRecoverGameScene = function (slot0, slot1)
	slot0.model:setGameStatus(slot1.gameStatus)
	slot0:resetGame()

	if slot1.gameStatus == LHD_GAMING_FREE then
		slot0:protoRecoverGamingFree(slot1)
	elseif slot1.gameStatus == LHD_GAMING_BET then
		slot0:protoRecoverGamingBet(slot1)
		slot0:setGamingTimer(slot1.leftTimer, LHD_GAMING_TIMER_BET)
		slot0.model:dispatchEvt(LHD_EVT_RECOVER_PLAY, slot1)
	elseif slot1.gameStatus == LHD_GAMING_END then
		slot0:protoRecoverGamingEnd(slot1)
		slot0.model:setIsFirstGame(true)

		clone(slot1.balanceData).bUpdate = true

		slot0.model:setBalanceData(slot2)
		slot0:setGamingTimer(slot1.leftTimer, LHD_GAMING_TIMER_END)
		slot0.model:dispatchEvt(LHD_EVT_RECOVER_PLAY, slot1)
	end

	slot2 = {}
	slot3 = ipairs
	slot4 = slot1.balanceHistoryData or {}

	for slot6, slot7 in slot3(slot4) do
		table.insert(slot2, slot7)
	end

	slot0.model:setBalanceRealHistoryData(TableUtil.copyData(slot2))

	if slot1.gameStatus == LHD_GAMING_END and LHD_GAMING_END_LAST_TIME <= slot1.leftTimer then
		table.remove(slot2, 100)
		table.insert(slot2, 1, 0)

		if slot1.balanceHisCount - 1 <= 0 then
			slot3 = 100
		end

		slot0.model:setBalanceHistoryCount(slot3)
	else
		slot0.model:setBalanceHistoryCount(slot1.balanceHisCount)
	end

	slot0.model:setBalanceHistoryData(slot2)
end

LhdController.protoRecoverGamingFree = function (slot0, slot1)
	slot0:setGamingTimer(slot1.leftTimer, LHD_GAMING_TIMER_FREE)
	slot0.model:setSelfCanBetMaxScore(slot1.selfCanBetMaxScore)

	slot2 = {}

	for slot6 = 0, 2, 1 do
		slot2 = slot1.areaAllLimitBetScore[slot6 + 1]
	end

	slot0.model:setAreaAllLimitBetScore(slot2, true)
	slot0.model:setAreaSelfLimitBetScore(slot1.areaSelfLimitBetScore)
	slot0.model:dispatchEvt(LHD_EVT_RECOVER_FREE, slot1)
end

LhdController.protoRecoverGamingBet = function (slot0, slot1)
	slot0.model:setSelfCanBetMaxScore(slot1.selfCanBetMaxScore)

	slot2 = slot0.model:getAreaAllJettonScore()
	slot3 = slot0.model:getAreaSelfJettonScore()
	slot4 = 0
	slot5 = slot1.selfCanBetMaxScore

	for slot9 = 0, 2, 1 do
		slot2[slot9] = slot1.areaAllBet[slot9 + 1]
		slot3[slot9] = slot1.areaSelfBet[slot9 + 1]
		slot4 = slot4 + slot1.areaAllBet[slot9 + 1]
		slot5 = slot5 - slot1.areaSelfBet[slot9 + 1]
	end

	slot0.model:setAreaAllJettonScore(slot2, true)
	slot0.model:setAreaSelfJettonScore(slot3, true)
	slot0.model:setSelfHasBettedScore(slot4)

	slot6 = {}

	for slot10 = 0, 2, 1 do
		slot6[slot10] = slot1.areaAllLimitBetScore[slot10 + 1]
	end

	slot0.model:setAreaAllLimitBetScore(slot6, true)
	slot0.model:setAreaSelfLimitBetScore(slot1.areaSelfLimitBetScore)

	if slot0:getSelfCanBetMaxScore() < slot5 then
		slot5 = slot0:getSelfCanBetMaxScore()
	end

	slot0.model:setSelfCanBetLeftScore(slot5)
end

LhdController.protoRecoverGamingEnd = function (slot0, slot1)
	slot0:protoRecoverGamingBet(slot1)

	slot2 = slot0.model:getAreaSelfJettonScore()

	for slot6 = 0, 2, 1 do
		if slot2[slot6] ~= nil and slot2[slot6] > 0 then
			slot0.model:setPreGameBetData(clone(slot2))

			break
		end
	end
end

LhdController.onUserStatus = function (slot0, slot1)
	return
end

LhdController.onUserScore = function (slot0, slot1)
	if slot1.cbUserStatus == US_LOOKON then
		return
	end

	if slot1.dwUserID == Hero:getDwUserID() then
		Hero:setUserScore(slot1.lScore)
		slot0.model:setSelfUserData(slot1, true)
	end
end

LhdController.onUserEnter = function (slot0, slot1)
	if slot1 == nil or slot1.cbUserStatus == US_LOOKON then
		return
	end

	if slot1.dwUserID == Hero:getDwUserID() then
		slot0.model:setSelfUserData(slot1, true)
	end
end

LhdController.reqBet = function (slot0, slot1)
	slot3 = LhdGetBetScoreConfig()

	if slot0.model:getGameStatus() == LHD_GAMING_BET then
		if slot0.model:getSelectingGold() == 0 then
			if Hero:getUserScore() < slot3[1] then
				tweenMsgMgr:showWhiteMsg(LHD_MSG_CONFIG.INSUFFICIENT_BALANCE)
			else
				tweenMsgMgr:showWhiteMsg(LHD_MSG_CONFIG.NO_SELECT_GOLD)
			end

			return false
		elseif slot4 == -1 then
			if Hero:getUserScore() < slot3[1] then
				tweenMsgMgr:showWhiteMsg(LHD_MSG_CONFIG.INSUFFICIENT_BALANCE)
			else
				tweenMsgMgr:showWhiteMsg(LHD_MSG_CONFIG.BETTING_FULL)
			end

			return false
		end

		if slot0:checkCanBetLimit(slot1 - 1, slot4, true) then
			return false
		end

		slot0:reqBet2Server(slot5, slot4)

		return true
	else
		tweenMsgMgr:showWhiteMsg(LHD_MSG_CONFIG.NO_BETTING_TIME)
	end

	return false
end

LhdController.reqRemandBet = function (slot0)
	if slot0.model:getHasSentRemandBet() == true then
		return
	end

	slot2 = LhdGetBetScoreConfig()
	slot3 = pairs
	slot4 = slot0:getCanRemandJettonScore() or {}

	for slot6, slot7 in slot3(slot4) do
		for slot11 = 1, 1, 0 do
			if slot0:checkCanBetLimit(slot6, slot7, true) then
				break
			end

			slot13 = {}
			slot14 = {}
			slot15 = 1
			slot16 = pairs
			slot17 = slot0:score2BetSpCount(slot7) or {}

			for slot19, slot20 in slot16(slot17) do
				if slot20 > 0 then
					slot13[slot15] = slot2[slot19]
					slot14[slot15] = slot20
					slot15 = slot15 + 1
				end
			end

			slot0:reqRemandBet2Server(slot6, slot13, slot14)

			break
		end
	end

	slot0.model:setHasSentRemandBet(true)
end

LhdController.addBalanceHistory = function (slot0, slot1, slot2)
	table.insert(slot3, slot1)

	if #slot0.model:getBalanceHistoryData() > 100 then
		table.remove(slot3, 1)
	end

	if slot2 == nil then
		if slot0.model:getBalanceHistoryCount() + 1 > 100 then
			slot4 = 1
		end

		slot0.model:setBalanceHistoryCount(slot4)
	else
		slot0.model:setBalanceHistoryCount(slot2)
	end

	slot0.model:setBalanceHistoryData(slot3, true)
end

LhdController.setGamingTimer = function (slot0, slot1, slot2)
	slot0.model:setGameTimer({
		timer = slot1,
		timerType = slot2
	}, true)
end

LhdController.resetGame = function (slot0)
	slot0.model:setBalanceData({})
	slot0.model:setSelectingGold(0)
	slot0.model:setSelfHasBettedScore(0)
	slot0.model:setSelfCanBetLeftScore(0)
	slot0.model:setStarerHasBetted(false)
	slot0.model:setHasSentRemandBet(false)
	slot0.model:setAreaAllJettonScore({
		[0] = 0,
		0,
		0
	})
	slot0.model:setAreaSelfJettonScore({
		[0] = 0,
		0,
		0
	})
	slot0.model:setIsFirstGame(false)
	slot0.model:setIsCanRemand(true)
	Hero:setUserFakeScore(0, true)

	slot0.model._balanceHistoryData = TableUtil.copyData(slot1)

	slot0.model:dispatchEvt(LHD_EVT_RESET_GAME, true)
end

LhdController.getSelfCanBetMaxScore = function (slot0)
	if LHD_AFTER_WITHDRAWAL_CAN_BET then
		return slot0.model:getSelfCanBetMaxScore()
	else
		slot1 = slot0.model:getAreaSelfJettonScore()
		slot2 = 0

		for slot6 = 0, 2, 1 do
			slot2 = slot2 + slot1[slot6]
		end

		if slot0.model:getAreaSelfLimitBetScore() < slot0.model:getSelfCanBetMaxScore() then
			selfCanBetLeftScore = slot4
		end

		if slot3 - slot2 < 0 then
			slot5 = 0
		end

		return slot5
	end
end

LhdController.score2BetSpCount = function (slot0, slot1)
	if slot1 == nil then
		LhdPrint("----> score2BetSpCount : score = nil ")

		return
	end

	if slot1 < 0 then
		slot1 = 0
	end

	slot2 = LhdGetBetScoreConfig()
	slot3 = {}
	slot4 = slot1

	for slot8 = LHD_BET_BTN_NUM, 1, -1 do
		slot3[slot8] = math.modf(slot4 / slot2[slot8])
		slot4 = slot4 % slot2[slot8]

		if slot8 == 1 and slot4 > 0 then
			slot3[slot8] = slot3[slot8] + 1
		end
	end

	return slot3
end

LhdController.getCanRemandJettonScore = function (slot0)
	slot2 = slot0.model:getAreaSelfJettonScore()
	slot3 = {}

	if slot0.model:getPreGameBetData() ~= nil then
		if slot2 ~= nil then
			for slot7 = 0, 2, 1 do
				if slot1[slot7] ~= nil then
					if slot2[slot7] ~= nil then
						if slot2[slot7] < slot1[slot7] then
							slot3[slot7] = slot1[slot7] - slot2[slot7]
						end
					else
						slot3[slot7] = slot1[slot7]
					end
				end
			end
		else
			for slot7 = 0, 2, 1 do
				if slot1[slot7] ~= nil then
					slot3[slot7] = slot1[slot7]
				end
			end
		end
	end

	for slot7 = 0, 2, 1 do
		if slot3[slot7] ~= nil and slot3[slot7] > 0 and slot0:checkCanBetLimit(slot7, slot3[slot7], false) then
			slot3[slot7] = nil
		end
	end

	return slot3
end

LhdController.checkCanBetLimit = function (slot0, slot1, slot2, slot3)
	if slot0.model:getAreaAllLimitBetScore()[slot1] < (slot0.model:getAreaAllJettonScore()[slot1] or 0) + slot2 then
		if slot3 then
			tweenMsgMgr:showWhiteMsg(LHD_MSG_CONFIG.AREA_LIMIT_FULL)
		end

		return true
	end

	slot6 = slot0.model:getAreaSelfLimitBetScore()
	slot7 = slot0.model:getAreaSelfJettonScore()
	slot8 = 0

	for slot12 = 0, 2, 1 do
		slot8 = slot8 + slot7[slot12]
	end

	if slot6 < slot8 + slot2 then
		if slot3 then
			tweenMsgMgr:showWhiteMsg(LHD_MSG_CONFIG.SELF_LIMIT_FULL)
		end

		return true
	end

	return false
end

LhdController.getCanRemandJetton = function (slot0)
	if slot0.model:getIsCanRemand() == false then
		return false
	end

	slot1 = false
	slot2 = slot0:getCanRemandJettonScore()
	slot3 = 0

	for slot7 = 0, 2, 1 do
		if slot2[slot7] ~= nil and slot2[slot7] > 0 then
			slot1 = true
			slot3 = slot3 + slot2[slot7]
		end
	end

	if LHD_AFTER_WITHDRAWAL_CAN_BET then
		if Hero:getUserScore() < slot3 then
			slot1 = false
		end
	elseif slot0.model:getSelfBetStartMoney() < slot3 then
		slot1 = false
	end

	return slot1
end

LhdController.playLhdGameEffect = function (slot0, slot1)
	if slot1 == nil or slot1 == "" then
		return
	end

	slot0:playGameEffect(slot1)
end

LhdController.createSpine = function (slot0, slot1, slot2)
	slot3 = nil
	slot4 = string.format(LHD_SPINE_FILE_PATH, slot1.FileName, slot1.FileName)
	slot3 = (slot2 ~= true or sp.SkeletonAnimation:createWithBinaryFile(slot4 .. ".skel", slot4 .. ".atlas")) and sp.SkeletonAnimation:create(slot4 .. ".json", slot4 .. ".atlas")

	if slot3 ~= nil and slot1.CompleteHide == true then
		slot3:registerSpineEventHandler(function ()
			slot0:setVisible(false)
		end, sp.EventType.ANIMATION_COMPLETE)
	end

	return slot3
end

LhdController.getBalancePointTextureZP = function (slot0, slot1, slot2)
	if slot1 == LHD_BALANCE_DRAGON then
		return "lhd_dragon.png"
	elseif slot1 == LHD_BALANCE_TIGER then
		return "lhd_tiger.png"
	elseif slot1 == LHD_BALANCE_DRAW then
		return "lhd_draw.png"
	end
end

LhdController.getBalancePointTextureDL = function (slot0, slot1, slot2)
	if slot1 == LHD_BALANCE_DRAGON then
		return "lhd_balance2_ring_loong.png"
	elseif slot1 == LHD_BALANCE_TIGER then
		return "lhd_balance2_ring_tiger.png"
	end
end

LhdController.getBalancePointTextureDYZ = function (slot0, slot1, slot2)
	if slot1 == LHD_BALANCE_DRAGON then
		return "lhd_balance2_ring_loongr_small.png"
	elseif slot1 == LHD_BALANCE_TIGER then
		return "lhd_balance2_ring_tigger_small.png"
	end
end

LhdController.getBalancePointTextureXL = function (slot0, slot1, slot2)
	if slot1 == LHD_BALANCE_DRAGON then
		return "lhd_balance2_green_loong_small.png"
	elseif slot1 == LHD_BALANCE_TIGER then
		return "lhd_balance2_red_tiger_small.png"
	end
end

LhdController.getBalancePointTextureXQL = function (slot0, slot1, slot2)
	if slot1 == LHD_BALANCE_DRAGON then
		return "lhd_balance2_green_cr.png"
	elseif slot1 == LHD_BALANCE_TIGER then
		return "lhd_balance2_red_cr.png"
	end
end

LhdController.getBalanceDaLuData = function (slot0, slot1)
	slot3 = 0
	slot4 = 0
	slot5 = 0
	slot6 = {}
	slot7 = {}

	for slot11, slot12 in ipairs(slot2) do
		if slot12 ~= nil and slot12 ~= 0 and slot12 ~= LHD_BALANCE_ERROR then
			if slot12 == LHD_BALANCE_DRAW then
				if #slot7 > 0 then
					slot7[#slot7].drawCount = slot7[#slot7].drawCount or 0
					slot7[#slot7].drawCount = slot7[#slot7].drawCount + 1
				end
			else
				if slot5 == slot12 then
					slot4 = slot4 + 1

					table.insert(slot7, {
						result = slot12
					})
				else
					slot3 = slot3 + 1

					table.insert(slot6, {
						{
							result = slot12
						}
					})

					slot4 = 1
				end

				slot5 = slot12
			end
		else
			break
		end
	end

	return slot6
end

LhdController.getBalanceDownThreeLoadData = function (slot0, slot1, slot2)
	slot3 = 0
	slot4 = 0
	slot5 = slot2 + 2
	slot6 = {}
	slot7 = nil

	for slot11, slot12 in ipairs(slot1) do
		if slot5 <= slot11 then
			for slot16, slot17 in ipairs(slot12) do
				slot18 = nil

				if slot11 ~= slot5 or slot16 ~= 1 then
					if slot4 == ((slot16 ~= 1 or ((#slot1[slot11 - slot2 - 2] ~= #slot1[slot11 - 1] or LHD_BALANCE_DRAGON) and LHD_BALANCE_TIGER)) and (slot1[slot11 - slot2 - 1][slot16 - 1] ~= nil or LHD_BALANCE_DRAGON) and (slot1[slot11 - slot2 - 1][slot16] ~= nil or LHD_BALANCE_TIGER) and LHD_BALANCE_DRAGON) then
						table.insert(slot7, slot18)
					else
						table.insert(slot6, {
							slot18
						})
					end

					slot4 = slot18
				end
			end
		end
	end

	return slot6
end

LhdController.getBalanceDownThreeLoadViewData = function (slot0, slot1, slot2)
	return slot0:recordData2View(slot0:getBalanceDownThreeLoadData(slot1, slot2))
end

LhdController.recordData2View = function (slot0, slot1)
	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot4 = {}

	for slot8, slot9 in ipairs(slot1) do
		slot3 = 0

		while true do
			slot4[slot2] = slot4[slot2 + 1] or {}

			if slot4[slot2][1] == nil then
				break
			end
		end

		for slot13, slot14 in ipairs(slot9) do
			if slot3 == 0 then
				if slot13 == 7 or slot4[slot2][slot13] ~= nil then
					slot4[slot2 + 1] = slot4[slot2 + 1] or {}
					slot4[slot2 + 1][slot13 - 1] = slot14
					slot3 = slot13
				else
					slot4[slot2][slot13] = slot14
				end
			else
				slot4[slot15] = slot4[(slot2 + slot13) - slot3 + 1] or {}
				slot4[slot15][slot3 - 1] = slot14
			end
		end
	end

	return slot4
end

LhdController.ForecastNextDownThreeLoadData = function (slot0, slot1, slot2)
	if TableUtil.copyDataDep(slot1, true)[#TableUtil.copyDataDep(slot1, true)] or {}[#(TableUtil.copyDataDep(slot1, true)[#TableUtil.copyDataDep(slot1, true)] or )].result == slot2 then
		table.insert(slot4, slot2)
	else
		table.insert(slot3, {
			slot2
		})
	end

	slot6 = slot0:getBalanceDownThreeLoadData(slot3, 1)
	slot7 = slot0:getBalanceDownThreeLoadData(slot3, 2)

	return {
		(#slot0:getBalanceDownThreeLoadData(slot3, 0) > 0 and slot5[#slot5][#slot5[#slot5]]) or 0,
		(#slot6 > 0 and slot6[#slot6][#slot6[#slot6]]) or 0,
		(#slot7 > 0 and slot7[#slot7][#slot7[#slot7]]) or 0
	}
end

return
