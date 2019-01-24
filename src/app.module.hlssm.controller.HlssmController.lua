HLSSM_SUB_C_PLACE_JETTON = 11
HLSSM_SUB_C_APPLY_BANKER = 21
HLSSM_SUB_C_CANCEL_BANKER = 31
HLSSM_SUB_C_AMDIN_COMMAND = 41
HLSSM_SUB_C_COMPTETE_BANKER = 5
BR30S_SUB_S_GAME_FREE = 99
BR30S_SUB_S_GAME_START = 120
BR30S_SUB_S_PLACE_JETTON = 121
BR30S_SUB_S_GAME_END = 122
BR30S_SUB_S_APPLY_BANKER = 123
BR30S_SUB_S_CHANGE_BANKER = 124
BR30S_SUB_S_CHANGE_USER_SCORE = 125
BR30S_SUB_S_SEND_RECORD = 126
BR30S_SUB_S_PLACE_JETTON_FAIL = 127
BR30S_SUB_S_CANCEL_BANKER = 128
BR30S_SUB_S_AMDIN_COMMAND = 129
BR30S_SUB_S_COMPTETE_BANKER = 110
BR30S_SUB_S_START_SIDE = 111
HLSSM_GAME_SCENE_FREE = GAME_STATUS_FREE
HLSSM_GAME_SCENE_PLAY = GAME_STATUS_PLAY
HLSSM_GAME_SCENE_BET = GAME_STATUS_PLAY
HLSSM_GAME_SCENE_END = GAME_STATUS_PLAY + 1
slot0 = {
	[BR30S_SUB_S_GAME_FREE] = "BR30S_CMD_S_GameFree",
	[BR30S_SUB_S_GAME_START] = "BR30S_CMD_S_GameStart",
	[BR30S_SUB_S_PLACE_JETTON] = "BR30S_CMD_S_PlaceBet",
	[BR30S_SUB_S_GAME_END] = "BR30S_CMD_S_GameEndEx",
	[BR30S_SUB_S_APPLY_BANKER] = "BR30S_CMD_S_ApplyBanker",
	[BR30S_SUB_S_CHANGE_BANKER] = "BR30S_CMD_S_ChangeBanker",
	[BR30S_SUB_S_SEND_RECORD] = "BR30S_tagServerGameRecord",
	[BR30S_SUB_S_CANCEL_BANKER] = "BR30S_CMD_S_CancelBanker",
	[BR30S_SUB_S_CHANGE_USER_SCORE] = nil,
	[BR30S_SUB_S_PLACE_JETTON_FAIL] = nil,
	[BR30S_SUB_S_AMDIN_COMMAND] = nil,
	[BR30S_SUB_S_COMPTETE_BANKER] = nil,
	[BR30S_SUB_S_START_SIDE] = nil
}
HLSSM_AREA_XIAN = 0
HLSSM_AREA_PING = 1
HLSSM_AREA_ZHUANG = 2
HLSSM_AREA_XIAN_TIAN_WANG = 3
HLSSM_AREA_ZHUANG_TIAN_WANG = 4
HLSSM_AREA_TONG_DIAN_PING = 5
HLSSM_AREA_XIAN_DUI = 6
HLSSM_AREA_ZHUANG_DUI = 7
HLSSM_AREA_MAX = 8
HLSSM_MULTIPLE_XIAN = 2
HLSSM_MULTIPLE_PING = 9
HLSSM_MULTIPLE_ZHUANG = 2
HLSSM_MULTIPLE_XIAN_TIAN_WANG = 3
HLSSM_MULTIPLE_ZHUANG_TIAN_WANG = 3
HLSSM_MULTIPLE_TONG_DIAN_PING = 33
HLSSM_MULTIPLE_XIAN_DUI = 12
HLSSM_MULTIPLE_ZHUANG_DUI = 12
HlssmController = class("HlssmController")

HlssmController.ctor = function (slot0, slot1)
	slot0.model = slot1

	ClassUtil.extends(slot0, BaseGameController)
	slot0.model:setSwitchStatePos({
		onX = 141,
		offX = 83
	})
	slot0:loadTexture()
	slot0:initWinArea()
end

HlssmController.initWinArea = function (slot0)
	slot0._winAreasDic = {}
	slot1 = {
		{
			HLSSM_AREA_XIAN_DUI,
			255
		},
		{
			HLSSM_AREA_ZHUANG_DUI,
			255
		},
		{
			HLSSM_AREA_XIAN,
			HLSSM_AREA_PING,
			HLSSM_AREA_ZHUANG
		},
		{
			HLSSM_AREA_XIAN_TIAN_WANG,
			HLSSM_AREA_TONG_DIAN_PING,
			HLSSM_AREA_ZHUANG_TIAN_WANG,
			255
		}
	}

	function slot2(slot0, slot1)
		if slot0 ~= 255 then
			slot1[slot0] = true

			if not slot0._winAreasDic[slot0] then
				slot0._winAreasDic[slot0] = {}
			end

			table.insert(slot2, slot1)
		end
	end

	for slot6 = 1, 2, 1 do
		for slot10 = 1, 2, 1 do
			for slot14 = 1, 3, 1 do
				for slot18 = 1, 4, 1 do
					slot2(slot1[1][slot6], slot19)
					slot2(slot1[2][slot10], slot19)
					slot2(slot1[3][slot14], slot19)
					slot2(slot1[4][slot18], {})
				end
			end
		end
	end
end

HlssmController.loadTexture = function (slot0)
	resMgr:loadTextureAtlas(slot0:getSpriteSheetPath("plist_hlssm_font.plist"), true)
	resMgr:loadTextureAtlas(slot0:getSpriteSheetPath("brnn_openCard_plist.plist"), true)
	resMgr:loadTextureAtlas(slot0:getSpriteSheetPath("win_effect_plist.plist"), true)
end

HlssmController.onGameSceneByServer = function (slot0, slot1)
	slot4 = nil

	if ({
		[HLSSM_GAME_SCENE_FREE] = "BR30S_CMD_S_StatusFree",
		[HLSSM_GAME_SCENE_BET] = "BR30S_CMD_S_StatusPlayEx",
		[HLSSM_GAME_SCENE_END] = "BR30S_CMD_S_StatusPlayEx"
	})[gameMgr:getGameStatus()] and ffiMgr:isSizeEqual(slot1, slot2[slot3]) then
		slot4 = ffiMgr:castStruct2TableByLuaStr(slot1, slot2[slot3])
	else
		print("HlssmController:onGameSceneByServer", slot3, slot2[slot3])
	end

	audioMgr:resetVolume()
	slot0.model:setGameStatus(slot3)
	slot0.model:setBankerList({}, true)

	if slot3 == HLSSM_GAME_SCENE_FREE then
		slot0:onGameStatusFree(slot4)
	elseif slot3 == HLSSM_GAME_SCENE_BET or slot3 == HLSSM_GAME_SCENE_END then
		slot0:onGameStatusEnd(slot4)
	end
end

HlssmController.onGameStatusFree = function (slot0, slot1)
	if slot1 then
		slot0.model:setStatusData(slot1, true)
	end
end

HlssmController.onGameStatusEnd = function (slot0, slot1)
	if slot1 then
		slot0.model:setStatusData(slot1, true)
	end
end

HlssmController.onGameMessage = function (slot0, slot1, slot2)
	slot3 = nil

	if slot0[slot2] and ffiMgr:isSizeEqual(slot1, slot0[slot2]) then
		slot3 = ffiMgr:castStruct2TableByLuaStr(slot1, slot0[slot2])
	else
		print("HlssmController:onGameMessage", slot2, slot0[slot2])
	end

	if slot2 == BR30S_SUB_S_GAME_FREE then
		slot0:onSubGameFree(slot3)
	elseif slot2 == BR30S_SUB_S_GAME_START then
		slot0:onSubGameStart(slot3)
	elseif slot2 == BR30S_SUB_S_PLACE_JETTON then
		slot0:onSubPlaceJetton(slot3)
	elseif slot2 == BR30S_SUB_S_GAME_END then
		slot0:onSubGameEnd(slot3)
	elseif slot2 == BR30S_SUB_S_SEND_RECORD then
		slot0:onSubGameRecord(slot1, slot2)
	elseif slot2 == BR30S_SUB_S_APPLY_BANKER then
		slot0:onSubUserApplyBanker(slot3)
	elseif slot2 == BR30S_SUB_S_CANCEL_BANKER then
		slot0:onSubUserCancelBanker(slot3)
	elseif slot2 == BR30S_SUB_S_CHANGE_BANKER then
		slot0:onSubChangeBanker(slot3)
	elseif slot2 == BR30S_SUB_S_PLACE_JETTON_FAIL then
		tweenMsgMgr:showMsg("您的下注额不符合下注条件，请调整下注额度!")
	end
end

HlssmController.onSubGameFree = function (slot0, slot1)
	if slot1 then
		audioMgr:resetVolume()
		slot0.model:setGameStatus(HLSSM_GAME_SCENE_FREE)
		slot0.model:setUserBetAllScore(0)
		slot0.model:setLUserJettonScore({})
		slot0.model:setLAllJettonScore({})
		slot0.model:setFreeData(slot1, true)
	end
end

HlssmController.onSubGameStart = function (slot0, slot1)
	if slot1 then
		audioMgr:resetVolume()
		slot0.model:setGameStatus(HLSSM_GAME_SCENE_BET)
		slot0.model:setStartData(slot1, true)
	end
end

HlssmController.onSubGameEnd = function (slot0, slot1)
	if slot1 then
		slot0.model:setGameStatus(HLSSM_GAME_SCENE_END)

		slot2 = {
			{},
			{}
		}

		for slot6 = 1, 2, 1 do
			for slot10 = 1, slot1.cbCardCount[slot6], 1 do
				slot2[slot6][slot10] = slot1.cbTableCardArray[slot6][slot10]
			end
		end

		slot0.model:setCardArray(slot2)

		slot1.bankerUser = {
			wBankerUser = slot3.wBankerUser,
			lBankerScore = slot3.lBankerScore,
			szNickName = slot3.szNickName or gameMgr:getUserDataByChairId(slot0.model:getCurBankerUser().wBankerUser) or {}.szNickName
		}
		slot1.playerGold = Hero:getUserScore()

		slot0.model:setEndData(slot1, true)
		slot0:showPraticeTips()
	end
end

HlssmController.onSubPlaceJetton = function (slot0, slot1)
	if slot1 then
		slot0.model:setPlaceJetton(slot1)
	end
end

HlssmController.onSubGameRecord = function (slot0, slot1, slot2)
	if #slot1 % ffiMgr:sizeOf(slot0[slot2]) ~= 0 then
		slot0.model:setRecordList({})

		return
	end

	slot4 = {}

	for slot8, slot9 in ipairs(slot3) do
		table.insert(slot4, {
			cbKingWinner = slot9.cbKingWinner,
			bPlayerTwoPair = slot9.bPlayerTwoPair,
			bBankerTwoPair = slot9.bBankerTwoPair,
			cbPlayerCount = slot9.cbPlayerCount,
			cbBankerCount = slot9.cbBankerCount,
			index = #slot4 + 1
		})
	end

	slot0.model:setRecordList(slot4)
end

HlssmController.onSubUserApplyBanker = function (slot0, slot1)
	if slot1 then
		if Hero:getWChairID() == slot1.wApplyUser then
			tweenMsgMgr:showMsg("上庄成功！")
			slot0.model:setIsInBankerList(true)
		end

		if gameMgr:getUserDataByChairId(slot1.wApplyUser) and slot1.wApplyUser ~= slot0.model:getCurBankerUser() then
			table.insert(slot3, slot4)
			slot0.model:setBankerList(slot0.model:getBankerList(), true)
		end
	end
end

HlssmController.onSubUserCancelBanker = function (slot0, slot1)
	if slot1 then
		if Hero:getWChairID() == slot1.wCancelUser then
			tweenMsgMgr:showMsg("下庄成功！")
			slot0.model:setIsInBankerList(false, true)
		end

		slot3 = slot0.model:getBankerList()

		if gameMgr:getUserDataByChairId(slot1.wCancelUser) then
			for slot7, slot8 in ipairs(slot3) do
				if slot8.UserID == slot2.dwUserID then
					table.remove(slot3, slot7)
					slot0.model:setBankerList(slot3, true)

					break
				end
			end
		end
	end
end

HlssmController.onSubChangeBanker = function (slot0, slot1)
	if slot1 then
		if slot0.model:getCurBankerUser().wBankerUser == Hero:getWChairID() and slot1.wBankerUser ~= Hero:getWChairID() then
			slot0.model:setIsMeBank(false)
			slot0.model:setIsInBankerList(false, true)
		elseif slot1.wBankerUser == Hero:getWChairID() then
			slot0.model:setIsMeBank(true)
		end

		slot0.model:setWBankerTime(0)
		slot0.model:setLBankerWinScore(0)
		slot0.model:setCurBankerUser(slot1, true)

		if slot0.model:getCurBankerUser().wBankerUser ~= INVALID_WORD then
			slot1.szNickName = gameMgr:getUserDataByChairId(slot1.wBankerUser).szNickName
			slot4 = slot0.model:getBankerList()

			if gameMgr.getUserDataByChairId(slot1.wBankerUser) then
				for slot8, slot9 in ipairs(slot4) do
					if slot9.UserID == slot3.dwUserID then
						table.remove(slot4, slot8)
						slot0.model:setBankerList(slot4, true)

						break
					end
				end

				slot0.model.bankerChangedSignal:emit()
			end
		end
	end
end

HlssmController.onUserStatus = function (slot0, slot1)
	if slot1.cbUserStatus == US_LOOKON then
		return
	end

	slot2 = slot0.model:getCurBankerUser()

	if slot1.wTableID ~= INVALID_WORD and slot1.wChairID == slot2.wBankerUser then
		slot2.lBankerScore = slot1.lScore

		slot0.model:setCurBankerUser(slot2, true)

		return
	end

	if slot1.cbUserStatus == US_NULL or slot1.cbUserStatus == US_FREE then
		for slot7, slot8 in ipairs(slot3) do
			if slot8.UserID == slot1.dwUserID then
				table.remove(slot3, slot7)
				slot0.model:setBankerList(slot3, true)

				break
			end
		end
	end
end

HlssmController.onUserScore = function (slot0, slot1)
	if slot1.cbUserStatus == US_LOOKON then
		return
	end

	if slot1.dwUserID == Hero:getDwUserID() then
		Hero:setUserScore(slot1.lScore)
	end

	for slot6, slot7 in ipairs(slot2) do
		if slot7.UserID == slot1.dwUserID then
			slot2[slot6].lUserScor = slot1.lScore

			slot0.model:setBankerList(slot2, true)

			break
		end
	end

	if slot0.model:getGameStatus() == HLSSM_GAME_SCENE_END then
		Hero:setUserFakeScore(0, true)
	end
end

HlssmController.onUserEnter = function (slot0, slot1)
	if slot1.cbUserStatus == US_LOOKON then
		return
	end

	if slot1.dwUserID == Hero:getDwUserID() then
		Hero:setUserFakeScore(0, false, true)
		Hero.userScoreChangedSignal:emit()
	end
end

HlssmController.getCardPip = function (slot0, slot1)
	return (gameMgr:getCardValue(slot1) >= 10 and 0) or slot2
end

HlssmController.getCardListPip = function (slot0, slot1, slot2)
	slot3 = 0

	for slot7 = 1, slot2, 1 do
		slot3 = (slot0:getCardPip(slot1[slot7]) + slot3) % 10
	end

	return slot3
end

HlssmController.requestInOutBanker = function (slot0)
	if slot0.model:getIsInBankerList() then
		doReqServerViaStruct("请求下庄", nil, nil, MDM_GF_GAME, HLSSM_SUB_C_CANCEL_BANKER, true)
	else
		if ((gameMgr:getUserDataByChairId(Hero:getWChairID()) and slot1.lScore) or 0) < slot0.model:getLApplyBankerCondition() then
			slot4 = "您的欢乐豆不足，无法上庄\n上庄条件为：%d欢乐豆"

			if IS_HL_VERSION then
				slot3 = slot3 / 100
				slot4 = "您的金币不足，无法上庄\n上庄条件为：%d金币"
			end

			tweenMsgMgr:showMsg(string.format(slot4, slot3))

			return
		end

		doReqServerViaStruct("请求上庄", nil, nil, MDM_GF_GAME, HLSSM_SUB_C_APPLY_BANKER, true)
	end
end

HlssmController.requestPlaceJetton = function (slot0, slot1)
	if slot0.model:getGameStatus() == HLSSM_GAME_SCENE_FREE then
		tweenMsgMgr:showMsg("请稍候，还没到下注时间哟！")

		return false
	end

	if slot0.model:getGameStatus() ~= HLSSM_GAME_SCENE_BET then
		tweenMsgMgr:showMsg("请稍候，还没到下注时间哟！")

		return false
	end

	slot2 = gameMgr:getUserData(Hero:getDwUserID())

	if Hero:getUserScore() < slot0.model.jettons[5] then
		tweenMsgMgr:showMsg("您的余额不足，无法进行下注！")

		return false
	end

	if slot0.model:getCurSelectGold() == 0 then
		tweenMsgMgr:showMsg("请选择下注筹码！")

		return false
	elseif slot3 == -1 then
		tweenMsgMgr:showWhiteMsg("本局下注已满！")

		return false
	end

	return slot0:requestHlssmPlaceJetton(slot1, slot3)
end

HlssmController.requestHlssmPlaceJetton = function (slot0, slot1, slot2, slot3)
	if not slot0.model:getCurBankerUser() or not slot4.wBankerUser or slot4.wBankerUser == INVALID_WORD then
		if not slot3 then
			tweenMsgMgr:showMsg("庄上没有庄家，无法下注！")
		end

		return false
	end

	if Hero:getWChairID() == slot4.wBankerUser then
		return false
	end

	if not gameMgr:getUserDataByChairId(slot4.wBankerUser) or not slot5.dwUserID then
		return false
	end

	doReqServerViaStruct("请求下注", {
		cbBetArea = slot1,
		lBetScore = slot2
	}, "BR30S_CMD_C_PlaceBet", MDM_GF_GAME, HLSSM_SUB_C_PLACE_JETTON, "true")

	return true
end

HlssmController.getUserMaxJetton = function (slot0, slot1)
	if Hero:getWChairID() == INVALID_WORD then
		return 0
	end

	if not gameMgr:getUserData(Hero:getDwUserID()) or HLSSM_AREA_MAX <= slot1 then
		return 0
	end

	slot3 = 0
	slot4 = slot0.model:getLUserJettonScore()

	for slot8 = 0, HLSSM_AREA_MAX - 1, 1 do
		slot3 = slot3 + (slot4[slot8] or 0)
	end

	slot5 = -1
	slot6 = {
		[0] = HLSSM_MULTIPLE_XIAN,
		HLSSM_MULTIPLE_PING,
		HLSSM_MULTIPLE_ZHUANG,
		HLSSM_MULTIPLE_XIAN_TIAN_WANG,
		HLSSM_MULTIPLE_ZHUANG_TIAN_WANG,
		HLSSM_MULTIPLE_TONG_DIAN_PING,
		HLSSM_MULTIPLE_XIAN_DUI,
		HLSSM_MULTIPLE_ZHUANG_DUI
	}
	slot7 = slot0.model:getCurBankerUser()

	for slot12, slot13 in ipairs(slot8) do
		slot14 = slot7.lBankerScore or 0

		for slot18 = 0, HLSSM_AREA_MAX - 1, 1 do
			slot14 = (slot13[slot18] and slot14 - (slot4[slot18] or 0) * (slot6[slot18] - 1)) or slot14 + (slot4[slot18] or 0)
		end

		slot5 = (slot5 == -1 and slot14) or math.min(slot5, slot14)
	end

	slot9 = 0
	slot10 = slot0.model:getLMeMaxScore()
	slot11 = slot0.model:getLAreaLimitScore()
	slot12 = slot4[slot1] or 0

	if ((slot10 - slot3 > slot11 - slot12 and slot11 - slot12) or slot10 - slot3) > slot5 / (slot6[slot1] - 1) then
		slot9 = slot5 / (slot6[slot1] - 1)
	end

	if slot9 < 0 then
		slot9 = 0
	end

	return slot9
end

HlssmController.getAeraResult = function (slot0)
	if slot0.model:getCardArray() == nil or slot1[1] == nil or slot1[2] == nil then
		return nil
	end

	return {
		[0] = slot0:getCardListPip(slot1[2], #slot1[2]) < slot0:getCardListPip(slot1[1], #slot1[1]),
		slot2 == slot3,
		slot2 < slot3,
		()[0] and (slot2 == 8 or slot2 == 9),
		()[2] and (slot3 == 8 or slot3 == 9),
		()[1] and slot0:isCardArrayEquip(slot1),
		gameMgr:getCardValue(slot1[1][1]) == gameMgr:getCardValue(slot1[1][2]),
		gameMgr:getCardValue(slot1[2][1]) == gameMgr:getCardValue(slot1[2][2])
	}
end

HlssmController.isCardArrayEquip = function (slot0, slot1)
	if slot1 ~= nil and slot1[1] ~= nil and slot1[2] ~= nil and #slot1[1] == #slot1[2] then
		slot4 = true

		for slot8 = 1, slot2, 1 do
			if gameMgr:getCardValue(slot1[1][slot8]) ~= gameMgr:getCardValue(slot1[2][slot8]) then
				slot4 = false

				break
			end
		end

		return slot4
	end

	return false
end

HlssmController.getAreaRate = function (slot0, slot1)
	slot2 = {
		[0] = HLSSM_MULTIPLE_XIAN,
		HLSSM_MULTIPLE_PING,
		HLSSM_MULTIPLE_ZHUANG,
		HLSSM_MULTIPLE_XIAN_TIAN_WANG,
		HLSSM_MULTIPLE_ZHUANG_TIAN_WANG,
		HLSSM_MULTIPLE_TONG_DIAN_PING,
		HLSSM_MULTIPLE_XIAN_DUI,
		HLSSM_MULTIPLE_ZHUANG_DUI
	}

	if slot1 >= 0 and slot1 <= 7 then
		return slot2[slot1]
	end

	return 0
end

HlssmController.computeScore2Bet = function (slot0, slot1)
	slot2 = slot0.model.jettons
	slot3 = {}
	slot4 = slot1

	for slot8 = 1, 5, 1 do
		slot3[slot8] = math.modf(slot4 / slot2[slot8])
		slot4 = slot4 % slot2[slot8]

		if slot8 == 5 and slot4 > 0 then
			slot3[slot8] = slot3[slot8] + 1
		end
	end

	return slot3
end

HlssmController.getTextureName = function (slot0, slot1, slot2)
	return string.format("hlssm_luzi_item_%d_%d.png", slot1, slot2)
end

HlssmController.getResultVal = function (slot0, slot1)
	slot2 = HLSSM_RESULT_PING

	if slot1.cbBankerCount < slot1.cbPlayerCount then
		slot2 = HLSSM_RESULT_XIAN
	elseif slot1.cbPlayerCount < slot1.cbBankerCount then
		slot2 = HLSSM_RESULT_ZHUANG
	end

	return slot2
end

HlssmController.getRecordDaLuData = function (slot0, slot1)
	slot3 = 0
	slot4 = 0
	slot5 = 0
	slot6 = {}
	slot7 = {}

	for slot11, slot12 in ipairs(slot2) do
		slot13 = TableUtil.copyDataDep(slot12)

		if slot0:getResultVal(slot12) == HLSSM_RESULT_PING then
			if #slot7 > 0 then
				slot7[#slot7].pingCount = slot7[#slot7].pingCount or 0
				slot7[#slot7].pingCount = slot7[#slot7].pingCount + 1
			end
		else
			if slot5 == slot14 then
				slot4 = slot4 + 1

				table.insert(slot7, slot13)
			else
				slot3 = slot3 + 1

				table.insert(slot6, {
					slot13
				})

				slot4 = 1
			end

			slot5 = slot14
		end
	end

	return slot6
end

HlssmController.getRecordDownThreeLoadData = function (slot0, slot1, slot2)
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
					if slot4 == ((slot16 ~= 1 or ((#slot1[slot11 - slot2 - 2] ~= #slot1[slot11 - 1] or HLSSM_RESULT_ZHUANG) and HLSSM_RESULT_XIAN)) and (slot1[slot11 - slot2 - 1][slot16 - 1] ~= nil or HLSSM_RESULT_ZHUANG) and (slot1[slot11 - slot2 - 1][slot16] ~= nil or HLSSM_RESULT_XIAN) and HLSSM_RESULT_ZHUANG) then
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

HlssmController.getRecordDownThreeLoadViewData = function (slot0, slot1, slot2)
	return slot0:recordData2View(slot0:getRecordDownThreeLoadData(slot1, slot2))
end

HlssmController.recordData2View = function (slot0, slot1)
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

HlssmController.ForecastNextDownThreeLoadData = function (slot0, slot1, slot2)
	slot3 = nil

	if slot2 == HLSSM_RESULT_ZHUANG then
		slot3 = {
			cbBankerCount = 9,
			cbPlayerCount = 1
		}
	elseif slot2 == HLSSM_RESULT_XIAN then
		slot3 = {
			cbBankerCount = 1,
			cbPlayerCount = 9
		}
	end

	slot6 = 0

	if #(TableUtil.copyDataDep(slot1, true)[#TableUtil.copyDataDep(slot1, true)] or {}) > 0 then
		slot6 = slot0:getResultVal(slot5[#slot5])
	end

	if slot6 == slot2 then
		table.insert(slot5, slot3)
	else
		table.insert(slot4, {
			slot3
		})
	end

	slot8 = slot0:getRecordDownThreeLoadData(slot4, 1)
	slot9 = slot0:getRecordDownThreeLoadData(slot4, 2)

	return {
		(#slot0:getRecordDownThreeLoadData(slot4, 0) > 0 and slot7[#slot7][#slot7[#slot7]]) or 0,
		(#slot8 > 0 and slot8[#slot8][#slot8[#slot8]]) or 0,
		(#slot9 > 0 and slot9[#slot9][#slot9[#slot9]]) or 0
	}
end

HlssmController.destroy = function (slot0)
	slot0.model = nil
end

return
