SUB_S_OxQZB_GAME_START_CALL_BANKER = 120
SUB_S_OxQZB_GAME_START_BET = 121
SUB_S_OxQZB_GAME_START_OPEN_CARD = 122
SUB_S_OxQZB_GAME_END = 123
SUB_S_OxQZB_GAME_FREE = 124
SUB_S_OxQZB_CALL_BANKER = 125
SUB_S_OxQZB_ADD_SCORE = 126
SUB_S_OxQZB_OPEN_CARD = 127
SUB_S_OxQZB_PLAYER_EXIT = 128
SUB_S_DAOJISHI = 130
QZNNB_GAME_SCENE_FREE = GAME_STATUS_FREE
QZNNB_GAME_SCENE_COUNTDOWN = GAME_STATUS_PLAY
QZNNB_GAME_SCENE_BANK = GAME_STATUS_PLAY + 1
QZNNB_GAME_SCENE_BET = GAME_STATUS_PLAY + 2
QZNNB_GAME_STATE_SENDCARD = 3
QZNNB_GAME_STATE_OPENCARD = GAME_STATUS_PLAY + 3
QZNNB_GAME_SCENE_END = GAME_STATUS_PLAY + 4
slot0 = 0.01
slot1 = true

QznnbController.onGameMessage = function (slot0, slot1, slot2)
	if slot2 == SUB_S_OxQZB_GAME_START_CALL_BANKER then
		slot0:onSubGameStartCallBanker(slot1)
	elseif slot2 == SUB_S_OxQZB_CALL_BANKER then
		slot0:onSubCallBanker(slot1)
	elseif slot2 == SUB_S_OxQZB_GAME_START_BET then
		slot0:onSubGameStartBet(slot1)
	elseif slot2 == SUB_S_OxQZB_ADD_SCORE then
		slot0:onSubAddScore(slot1)
	elseif slot2 == SUB_S_OxQZB_GAME_START_OPEN_CARD then
		slot0:onSubSendCard(slot1)
	elseif slot2 == SUB_S_OxQZB_OPEN_CARD then
		slot0:onSubOpenCard(slot1)
	elseif slot2 == SUB_S_OxQZB_PLAYER_EXIT then
		slot0:onSubUserQuit(slot1)
	elseif slot2 == SUB_S_OxQZB_GAME_END then
		slot0:onSubGameEnd(slot1)
	elseif slot2 == SUB_S_DAOJISHI then
		slot0:onSubCountdown(slot1)
	end
end

QznnbController.onSubCountdown = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "OxQZB_CMD_S_Daojishi") then
		trace("onSubCountdown")
		trace_r(slot2)
		slot0:onGameCountdownByServer(ffiMgr:castStruct2TableByLuaStr(slot1, "OxQZB_CMD_S_Daojishi"))
	end
end

QznnbController.updataUserData = function (slot0, slot1)
	if slot1.wTableID ~= Hero:getWTableID() or slot1.cbUserStatus == US_FREE then
		return
	end

	slot0.model:getMyTableUserData()[gameMgr:switchViewChairID(slot1.wChairID)] = slot1

	slot0.model:setMyTableUserData(slot0.model.getMyTableUserData(), true)
end

QznnbController.onUserScore = function (slot0, slot1)
	slot2 = slot0.model:getMyTableUserData()
	slot3 = gameMgr:switchViewChairID(slot1.wChairID)

	if slot1.cbUserStatus == US_OFFLINE and not slot2[slot3] then
		return
	end

	slot0:updataUserData(slot1)
end

QznnbController.onUserEnter = function (slot0, slot1)
	if slot1.dwUserID == Hero:getDwUserID() then
		slot0.model:setMyTableUserData({}, true)
	end

	slot0:updataUserData(slot1)
end

QznnbController.onEnterBattle = function (slot0)
	slot0.model:setCanShowReadyStart(true)
	slot0.model:setCanShowStart(false)
	BaseGameController.onEnterBattle(slot0)
end

QznnbController.onUserStatus = function (slot0, slot1)
	slot2 = slot0.model:getMyTableUserData()

	if slot1.dwUserID == Hero:getDwUserID() then
		if (slot2[1] and slot2[1].wTableID) ~= slot1.wTableID then
			for slot6, slot7 in pairs(slot2) do
				slot2[slot6] = nil
			end
		end

		slot2[1] = slot1

		print_r(slot1)

		if slot1.cbUserStatus == US_SIT then
			slot0.model.roomKindChangedSignal:emit()
			slot0:setCd(slot1.wChairID, slot0)
		elseif slot1.cbUserStatus == US_READY then
			slot0:setCd(slot1.wChairID, 0)
		elseif slot1.cbUserStatus == US_FREE then
			if slot0.isChangingTable then
				slot0:resetBattle()
				gameMgr:setIsStartGame(false)

				slot0.isChangingTable = nil

				slot0.model:setCanShowReadyStart(true)
				slot0.model:setGameState(QZNNB_GAME_SCENE_FREE)
			end

			slot0.model:setMyTableUserData({
				slot1
			})
		end

		slot0.isChangingTable = nil

		if slot1.cbUserStatus ~= US_FREE then
			for slot7, slot8 in ipairs(slot3) do
				if US_FREE < slot8.cbUserStatus and slot8.cbUserStatus ~= US_OFFLINE then
					slot2[gameMgr:switchViewChairID(slot8.wChairID)] = slot8
				end

				if slot8.cbUserStatus == US_SIT then
				end
			end
		end

		slot0.model.myTableUserDataChangedSignal:emit()
	elseif slot1.wTableID == Hero:getWTableID() then
		if US_FREE < slot1.cbUserStatus then
			slot4 = slot2[gameMgr:switchViewChairID(slot1.wChairID)]
			slot2[gameMgr.switchViewChairID(slot1.wChairID)] = slot1

			if slot1.cbUserStatus == US_SIT then
				if slot0:checkPlayStatusByChairID(slot1.wChairID) then
				else
					slot0:setCd(slot1.wChairID, nil)
				end
			elseif slot1.cbUserStatus == US_READY then
				slot0:setCd(slot1.wChairID, 0)
			elseif slot1.cbUserStatus == US_OFFLINE and not slot4 then
				slot2[slot3] = nil
			end

			slot0.model.myTableUserDataChangedSignal:emit()
		end
	else
		slot3 = false

		for slot7, slot8 in pairs(slot2) do
			if slot8 and slot8.dwUserID == slot1.dwUserID then
				slot0:setCd(slot8.wChairID, 0)

				slot2[slot7] = nil
				slot3 = true
			end
		end

		if slot3 then
			slot0.model.myTableUserDataChangedSignal:emit()
		end
	end

	slot0.model:setIsShowingReady(slot2[1] ~= nil and (slot3.cbUserStatus == US_SIT or slot3.cbUserStatus == US_READY) and not (slot0.model:getIsShowingWin() or slot0.model:getIsShowingFailed() or slot0.model:getIsShowingResult()))
end

QznnbController.checkPlayStatus = function (slot0, slot1)
	slot0.model:setCbPlayStatus(slot1)

	if slot1[Hero:getWChairID() + 1] == 1 then
		slot0.model:setCbDynamicJoin(false)
		slot0.model:setTipType(nil)

		return true
	end

	slot0.model:setCanShowReadyStart(false)
	slot0.model:setCbDynamicJoin(true)
	slot0.model:setTipType(1)
	slot0:setCd(Hero:getWChairID(), nil)

	return false
end

QznnbController.checkPlayStatusByChairID = function (slot0, slot1)
	if slot0.model:getGameState() == QZNNB_GAME_SCENE_FREE or slot2 == QZNNB_GAME_SCENE_END then
		return true
	else
		return slot0.model:getCbPlayStatus()[slot1 + 1] == 1
	end
end

QznnbController.checkCanFlipCardByChairID = function (slot0, slot1)
	slot2 = true

	if slot0.model:getFleeInfo()[slot0.model:getBankUserChairId() + 1] == QZNNB_GAME_SCENE_BET then
		slot2 = false
	elseif slot3[slot1 + 1] == QZNNB_GAME_SCENE_BANK or slot5 == QZNNB_GAME_SCENE_BET then
		slot2 = false
	end

	return slot2
end

QznnbController.getCurrenPlayerCount = function (slot0)
	slot1 = 0
	slot2 = slot0.model:getCbPlayStatus() or {}

	for slot6, slot7 in pairs(slot2) do
		if slot7 == 1 then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

QznnbController.onGameSceneByServer = function (slot0, slot1)
	audioMgr:resetVolume()
	slot0.model:setGameState(QZNNB_GAME_SCENE_FREE)

	slot2 = QZNNB_GAME_SCENE_FREE

	if ffiMgr:isSizeEqual(slot1, "OxQZB_CMD_S_Status") then
		slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "OxQZB_CMD_S_Status")
	else
		return
	end

	trace("onGameSceneByServer,pStatus.cbStatus:", slot2.cbStatus)

	if slot0 then
		trace_r(slot2)
	end

	slot0.model:setLCellScore(slot2.lCellScore)

	if slot2.cbStatus == QZNNB_GAME_SCENE_FREE or slot3 == QZNNB_GAME_SCENE_END then
		slot0.model:setCanShowReadyStart(true)
		slot0.model:setGameState(QZNNB_GAME_SCENE_FREE)
		slot0.model.isAutoChangedSignal:emit()

		slot4 = slot0.model:getMyTableUserData()

		for slot8 = 1, slot0.model:getChairCount(), 1 do
			if slot4[slot8] and slot9.cbUserStatus then
				if slot8 == 1 and slot9.cbUserStatus == US_SIT then
					slot0:setCd(slot9.wChairID, slot1)
				elseif slot9.cbUserStatus == US_READY then
					slot0:setCd(slot9.wChairID, 0)
				end
			end
		end

		slot0:onGameCountdownByServer({
			cbOpen = (slot2.cbDaojishi > 0 and 1) or 0,
			cbSec = slot2.cbDaojishi
		})
	elseif slot3 == QZNNB_GAME_SCENE_BANK then
		if not slot0:checkPlayStatus(slot2.cbPlayStatus) then
			slot0.model:setCanShowReadyStart(false)
			slot0.model:setIsFirstRound(false)
		end

		slot2.cbCardData = slot2.cbHandCardData[Hero:getWChairID() + 1]

		slot0:checkGameStartCallBanker(slot2)
		slot0:checkBankerState(slot2.cbCallMultiple)
	elseif slot3 == QZNNB_GAME_SCENE_BET then
		if not slot0:checkPlayStatus(slot2.cbPlayStatus) then
			slot0.model:setCanShowReadyStart(false)
			slot0.model:setIsFirstRound(false)
		end

		slot2.cbCardData = slot2.cbHandCardData[Hero:getWChairID() + 1]

		slot0:checkGameStartCallBanker(slot2)
		slot0:checkBankerState(slot2.cbCallMultiple)
		slot0:checkBetState(slot2.wBankerUser, slot2.cbMaxBetMultiple)
		slot0:checkAddScoreState(slot2.cbBetMultiple)
	elseif slot3 == QZNNB_GAME_STATE_OPENCARD then
		if not slot0:checkPlayStatus(slot2.cbPlayStatus) then
			slot0.model:setCanShowReadyStart(false)
			slot0.model:setIsFirstRound(false)
		end

		slot2.cbCardData = slot2.cbHandCardData[Hero:getWChairID() + 1]

		slot0:checkGameStartCallBanker(slot2)
		slot0:checkBankerState(slot2.cbCallMultiple)
		slot0:checkBetState(slot2.wBankerUser, slot2.cbMaxBetMultiple)
		slot0:checkAddScoreState(slot2.cbBetMultiple)
		slot0:checkSendCardState(slot2.cbHandCardData)
	elseif slot3 == QZNNB_GAME_SCENE_COUNTDOWN then
		slot0:onGameCountdownByServer(slot4)
		slot0.model:setIsFirstRound(false)
		slot0.model:setTipType(1)
	else
		print("GameScene游戏状态是", slot3)
	end
end

QznnbController.checkAddScoreState = function (slot0, slot1)
	slot0.model:setIsShowingBetMoney(true)

	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if slot7 ~= 0 then
			slot0.model:setGameBet({
				wBetUser = slot6 - 1,
				lBetMultiple = slot7
			}, true)

			slot2[slot6 - 1] = ()["lBetMultiple"]
		end
	end

	slot0.model:setAllGameBet(slot2)
	slot0.model:setIsShowingBattle(true)
end

QznnbController.onSubGameEnd = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "OxQZB_CMD_S_GameEnd") then
		slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "OxQZB_CMD_S_GameEnd")

		trace("onSubGameEnd")

		if slot0 then
			trace_r(slot2)
		end

		if slot0.model:getCbDynamicJoin() then
			slot0.model:setCanShowReadyStart(true)
			slot0.model:setTipType(nil)
			slot0.model:setIsFirstRound(true)
		end

		slot0.model:setFleeInfo(slot2.cbFleeInfo)
		slot0.model:setGameScore(slot2.lGameScore)
		slot0.model:setSendCardData(slot2.cbCardData)

		slot3 = nil
		slot4 = true

		for slot8, slot9 in ipairs(slot2.lGameScore) do
			if slot8 == Hero:getWChairID() + 1 then
				slot3 = slot9
			end

			if slot9 ~= 0 then
				slot4 = false
			end
		end

		slot0.model:setCloseScore(slot3, true)

		if not slot4 then
			slot0.model:setGameState(QZNNB_GAME_SCENE_END)
		else
			slot0.model:setCanShowReadyStart(true)
			slot0.model:setGameState(QZNNB_GAME_SCENE_FREE)
		end

		slot6 = false

		for slot10, slot11 in pairs(slot5) do
			if slot11.cbUserStatus == US_OFFLINE then
				slot0:setCd(slot11.wChairID, nil)

				slot5[slot10] = nil
				slot6 = true
			end
		end

		if slot6 then
			slot0.model.myTableUserDataChangedSignal:emit()
		end

		slot0:showPraticeTips()
	end
end

QznnbController.onSubUserQuit = function (slot0, slot1)
	print("对方用户强退")

	if ffiMgr:isSizeEqual(slot1, "OxQZB_CMD_S_PlayerExit") then
		table.insert(slot3, ffiMgr:castStruct2TableByLuaStr(slot1, "OxQZB_CMD_S_PlayerExit").wPlayerID)

		slot6 = slot0.model:getMyTableUserData()[1]

		if (slot0.model:getGameState() == QZNNB_GAME_SCENE_BANK or slot4 == QZNNB_GAME_SCENE_BET) and #slot3 >= slot0:getCurrenPlayerCount() - 1 then
			tweenMsgMgr:showWhiteMsg("对方用户强退")
			slot0.model:setCanShowReadyStart(true)
			slot0.model:setGameState(QZNNB_GAME_SCENE_FREE)
		end
	end
end

QznnbController.onSubOpenCard = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "OxQZB_CMD_S_OpenCard") then
		slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "OxQZB_CMD_S_OpenCard")

		trace("onSubOpenCard")

		if slot0 then
			trace_r(slot2)
		end

		if slot0.model:getCbDynamicJoin() then
		end

		slot0.model:setTanPaiCurrentUser(slot2.wPlayerID, true)
		slot0:setCd(slot2.wPlayerID, nil)
	end

	slot0.model:setGameState(QZNNB_GAME_STATE_OPENCARD)
end

QznnbController.onSubAddScore = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "OxQZB_CMD_S_Bet") then
		slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "OxQZB_CMD_S_Bet")

		trace("onSubAddScore")

		if slot0 then
			trace_r(slot2)
		end

		if slot0.model:getCbDynamicJoin() then
		end

		slot0.model:getAllGameBet()[slot2.wBetUser] = slot2.lBetMultiple

		slot0.model:setAllGameBet(slot3, true)
		slot0.model:setGameBet(slot2, true)
		slot0:setCd(slot2.wBetUser, nil)
		slot0.model:setIsShowingBetMoney(true)
		slot0.model:setIsShowingBattle(true)
	end
end

QznnbController.checkSendCardState = function (slot0, slot1)
	print("checkSendCardState, cardDatas", Hero:getWChairID())
	print_r(slot1)

	if slot0.model:getCbDynamicJoin() then
	else
		slot0.model:setTipType(nil)
	end

	slot0.model:setSendCardData(slot1)
	slot0.model:setIsShowingBet(false)
	slot0.model:setGameState(QZNNB_GAME_STATE_SENDCARD)

	for slot6, slot7 in pairs(slot2) do
		if slot0:checkPlayStatusByChairID(slot7.wChairID) then
			slot0:setCd(slot7.wChairID, 7)
		else
			slot0:setCd(slot7.wChairID, nil)
		end
	end
end

QznnbController.onSubSendCard = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "OxQZB_CMD_S_GameStartOpenCard") then
		slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "OxQZB_CMD_S_GameStartOpenCard")

		trace("onSubSendCard")

		if slot0 then
			trace_r(slot2)
		end

		slot0:checkSendCardState(slot2.cbCardData)
	end
end

QznnbController.checkBetState = function (slot0, slot1, slot2)
	if slot0.model:getCbDynamicJoin() then
	else
		slot0.model:setTipType(nil)
	end

	slot3 = slot1 == Hero:getWChairID()
	slot4 = slot0.model:getMyTableUserData()

	slot0.model:setBankUserChairId(slot1, true)
	slot0.model:setAllGameBet({})

	if not slot0.model:getCbDynamicJoin() then
		if not slot3 then
			slot0.model:setCbMaxBetMultiple(slot2)
			slot0.model:setIsShowingBet(true)

			if slot0.model:getIsAuto() then
				if slot0.model:getAutoBetType() == 0 then
					slot5 = math.random(1, 4)
				end

				slot0:reqquestBet(slot5)
			end
		else
			slot0.model:setTipType(3)
			slot0.model:setIsShowingBet(false)
		end
	else
		slot0.model:setIsShowingBet(false)
	end

	slot0.model:setIsShowingCallBanker(false)
	slot0.model:setIsShowingBanker(true, true)
	slot0.model:setGameState(QZNNB_GAME_SCENE_BET)
end

QznnbController.onSubGameStartBet = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "OxQZB_CMD_S_GameStartBet") then
		slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "OxQZB_CMD_S_GameStartBet")

		trace("onSubGameStartBet")

		if slot0 then
			trace_r(slot2)
		end

		if slot0.model:getCbDynamicJoin() then
		end

		slot0:checkBetState(slot2.wBankerUser, slot2.cbMaxBetMultiple)
	end
end

QznnbController.checkBankerState = function (slot0, slot1)
	print("checkBankerState")
	print_r(slot1)

	if slot0.model:getCbDynamicJoin() then
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if slot7 ~= 255 and slot0:checkPlayStatusByChairID(slot6 - 1) then
			slot0.model:setRobTimes({
				wCallBanker = slot6 - 1,
				bMultiple = slot7
			}, true)

			slot2[slot6 - 1] = ()["bMultiple"]
		end
	end

	slot0.model:setAllRobTimes(slot2)
	slot0.model:setIsShowingRobTimes(true)
	slot0.model:setIsShowingBattle(true)
end

QznnbController.onSubCallBanker = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "OxQZB_CMD_S_CallBanker") then
		slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "OxQZB_CMD_S_CallBanker")

		trace("onSubCallBanker")

		if slot0 then
			trace_r(slot2)
		end

		if slot0.model:getCbDynamicJoin() then
		end

		slot0.model:getAllRobTimes()[slot2.wCallBanker] = slot2.bMultiple

		slot0.model:setAllRobTimes(slot3, true)
		slot0.model:setRobTimes(slot2, true)
		slot0:setCd(slot2.wCallBanker, nil)
		slot0.model:setIsShowingRobTimes(true)
		slot0.model:setIsShowingBattle(true)
	end
end

QznnbController.checkGameStartCallBanker = function (slot0, slot1)
	slot0.model:setFleeInfo({})
	slot0.model:setGameState(QZNNB_GAME_SCENE_FREE)

	if not slot0:checkPlayStatus(slot1.cbPlayStatus) then
	end

	slot2 = {
		{
			79,
			79,
			79,
			79,
			79
		},
		{
			79,
			79,
			79,
			79,
			79
		},
		{
			79,
			79,
			79,
			79,
			79
		},
		{
			79,
			79,
			79,
			79,
			79
		},
		{
			79,
			79,
			79,
			79,
			79
		}
	}

	if not slot0.model:getIsBlind() then
		slot2[Hero:getWChairID() + 1] = TableUtil.copyDataDep(slot1.cbCardData)
		slot2[Hero:getWChairID() + 1][5] = 79
	end

	for slot6, slot7 in ipairs(slot2) do
		if slot1.cbPlayStatus[slot6] == 0 then
			slot2[slot6] = {
				0,
				0,
				0,
				0,
				0
			}
		end
	end

	slot0.model:setAllRobTimes({})
	print("checkGameStartCallBanker")
	slot0.model:setSendCardData(slot2)
	slot0.model:setCbMaxCallMultiple(slot1.cbMaxCallMultiple)
	slot0.model:setIsShowingBattle(true)
	slot0.model:setGameState(QZNNB_GAME_SCENE_BANK)
	slot0.model:setIsShowingReady(false)
	slot0.model:setExitUser({})
end

QznnbController.onSubGameStartCallBanker = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "OxQZB_CMD_S_GameStartCallBanker") then
		slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "OxQZB_CMD_S_GameStartCallBanker")

		trace("onSubGameStartCallBanker")

		if slot0 then
			trace_r(slot2)
		end

		slot0:checkGameStartCallBanker(slot2)
	end
end

QznnbController.requestOpenCard = function (slot0)
	if slot0.model:getMyTableUserData()[1] then
		slot0.model:setCanShowTanPai(false)
		reqQznnbOpenCard(0, slot2.dwGameID + slot2.wTableID * 333 + slot2.wChairID * 135 + 222 + slot2.dwUserID * 100, true)
	end
end

QznnbController.reqquestBet = function (slot0, slot1)
	if slot0.model:getGameState() == QZNNB_GAME_SCENE_BET and slot0.model:getIsShowingBet() then
		reqQznnbBet(slot3, slot6, true)
		slot0.model:setIsShowingBet(false)
		slot0.model:setTipType(3)
	end
end

QznnbController.requestStartGameInResultView = function (slot0)
	if slot0.model:getGameState() == QZNNB_GAME_SCENE_END then
		slot0:hideAllBattleChildrenViews(true)
		slot0.model:setCanShowStart(false)
		slot0:requestReady()
	end
end

QznnbController.requestReady = function (slot0)
	slot0.model:setCanShowReadyStart(false)

	if slot0.model:getMyTableUserData()[1] and slot2.cbUserStatus and slot2.cbUserStatus == US_SIT then
		audioMgr:resetVolume()
		slot0:setCd(Hero:getWChairID(), nil)
		reqReady(true)
	end
end

QznnbController.requestCallBankState = function (slot0, slot1)
	if slot0.model:getIsShowingCallBanker() then
		slot0.model:setIsShowingCallBanker(false)
		reqQznnbSetBank(slot1, true)
		slot0.model:setTipType(2)
		slot0:setCd(Hero:getWChairID(), nil)
	end
end

return
