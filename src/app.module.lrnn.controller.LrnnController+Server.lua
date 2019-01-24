SUB_S_Ox6_GAME_START = 100
SUB_S_Ox6_ADD_SCORE = 101
SUB_S_Ox6_PLAYER_EXIT = 102
SUB_S_Ox6_SEND_CARD = 103
SUB_S_Ox6_GAME_END = 104
SUB_S_Ox6_OPEN_CARD = 105
SUB_S_Ox6_CALL_BANKER = 106
SUB_S_Ox6_ALLCAIJIN = 117
LRNN_GAME_SCENE_FREE = GAME_STATUS_FREE
LRNN_GAME_SCENE_BANK = GAME_STATUS_PLAY
LRNN_GAME_SCENE_BET = GAME_STATUS_PLAY + 1
LRNN_GAME_STATE_SENDCARD = 3
LRNN_GAME_STATE_OPENCARD = 4
LRNN_GAME_SCENE_END = GAME_STATUS_PLAY + 2

LrnnController.updataUserData = function (slot0, slot1)
	slot5 = Hero

	if slot1.wTableID ~= Hero.getWTableID(slot4) or slot1.cbUserStatus == US_FREE then
		return
	end

	slot6 = slot1.wChairID
	slot0.model.getMyTableUserData(slot3)[gameMgr.switchViewChairID(slot0.model, gameMgr)] = slot1
	slot8 = true

	slot0.model.setMyTableUserData(gameMgr, slot0.model, slot0.model.getMyTableUserData(slot3))
end

LrnnController.onUserScore = function (slot0, slot1)
	slot5 = slot1

	slot0.updataUserData(slot3, slot0)
end

LrnnController.onUserEnter = function (slot0, slot1)
	slot5 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot4) then
		slot6 = true

		slot0.model.setMyTableUserData(slot3, slot0.model, {})
	end

	slot5 = slot1

	slot0.updataUserData(slot3, slot0)
end

LrnnController.onEnterBattle = function (slot0)
	slot4 = true

	slot0.model.setCanShowReadyStart(slot2, slot0.model)

	slot4 = false

	slot0.model.setCanShowStart(slot2, slot0.model)

	slot3 = slot0

	BaseGameController.onEnterBattle(slot2)
end

LrnnController.onUserStatus = function (slot0, slot1)
	slot4 = slot0.model
	slot2 = slot0.model.getMyTableUserData(slot3)
	slot6 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot5) then
		slot2[1] = slot1

		if slot1.cbUserStatus == US_SIT then
			slot5 = slot0.model.roomKindChangedSignal

			slot0.model.roomKindChangedSignal.emit(slot4)

			slot7 = 15

			slot0.setCd(slot4, slot0, slot1.wChairID)
		elseif slot1.cbUserStatus == US_READY then
			slot7 = 0

			slot0.setCd(slot4, slot0, slot1.wChairID)
		elseif slot1.cbUserStatus == US_FREE then
			if slot0.isChangingTable then
				slot5 = slot0

				slot0.resetBattle(slot4)

				slot6 = false

				gameMgr.setIsStartGame(slot4, gameMgr)

				slot0.isChangingTable = nil
				slot6 = true

				slot0.model.setCanShowReadyStart(slot4, slot0.model)

				slot6 = LRNN_GAME_SCENE_FREE

				slot0.model.setGameState(slot4, slot0.model)
			end

			slot6 = {
				slot1
			}

			slot0.model.setMyTableUserData(slot4, slot0.model)
		end

		slot0.isChangingTable = nil

		if slot1.cbUserStatus == US_SIT then
			slot6 = Hero.getWTableID(slot7)
			slot9 = Hero
			slot6 = gameMgr.getUserDatasByTableId(slot4, gameMgr, Hero.getDwUserID(Hero))

			for slot7, slot8 in ipairs(gameMgr) do
				slot12 = slot8.wChairID
				slot2[gameMgr.switchViewChairID(slot10, gameMgr)] = slot8

				if slot8.cbUserStatus == US_SIT then
					slot14 = 15

					slot0.setCd(slot11, slot0, slot8.wChairID)
				end
			end
		end

		slot5 = slot0.model.myTableUserDataChangedSignal

		slot0.model.myTableUserDataChangedSignal.emit(slot4)
	else
		slot6 = Hero

		if slot1.wTableID == Hero.getWTableID(slot5) then
			if US_FREE < slot1.cbUserStatus then
				slot6 = slot1.wChairID
				slot2[gameMgr.switchViewChairID(slot4, gameMgr)] = slot1

				if slot1.cbUserStatus == US_SIT then
					slot7 = slot1.wChairID

					if slot0.checkPlayStatusByChairID(slot5, slot0) then
						slot8 = 15

						slot0.setCd(slot5, slot0, slot1.wChairID)
					else
						slot8 = nil

						slot0.setCd(slot5, slot0, slot1.wChairID)
					end
				elseif slot1.cbUserStatus == US_READY then
					slot8 = 0

					slot0.setCd(slot5, slot0, slot1.wChairID)
				end

				slot6 = slot0.model.myTableUserDataChangedSignal

				slot0.model.myTableUserDataChangedSignal.emit(slot5)
			end
		else
			slot3 = false
			slot6 = slot2

			for slot7, slot8 in pairs(slot5) do
				if slot8 and slot8.dwUserID == slot1.dwUserID then
					slot13 = 0

					slot0.setCd(slot10, slot0, slot8.wChairID)

					slot2[slot7] = nil
					slot3 = true
				end
			end

			if slot3 then
				slot6 = slot0.model.myTableUserDataChangedSignal

				slot0.model.myTableUserDataChangedSignal.emit(slot5)
			end
		end
	end

	slot4 = slot2[1] ~= nil and (slot3.cbUserStatus == US_SIT or slot3.cbUserStatus == US_READY)
	slot7 = slot0.model

	if not slot0.model.getIsShowingWin(slot6) then
		slot7 = slot0.model

		if not slot0.model.getIsShowingFailed(slot6) then
			slot7 = slot0.model
			slot5 = slot0.model.getIsShowingResult(slot6)
		end
	end

	slot9 = slot4 and not slot5

	slot0.model.setIsShowingReady(slot7, slot0.model)
end

LrnnController.checkPlayStatus = function (slot0, slot1)
	slot5 = slot1

	slot0.model.setCbPlayStatus(slot3, slot0.model)

	slot4 = Hero

	if slot1[Hero.getWChairID(slot3) + 1] == 1 then
		slot5 = false

		slot0.model.setCbDynamicJoin(slot3, slot0.model)

		slot5 = nil

		slot0.model.setTipType(slot3, slot0.model)

		return true
	end

	slot5 = false

	slot0.model.setCanShowReadyStart(slot3, slot0.model)

	slot5 = true

	slot0.model.setCbDynamicJoin(slot3, slot0.model)

	slot5 = 1

	slot0.model.setTipType(slot3, slot0.model)

	return false
end

LrnnController.checkPlayStatusByChairID = function (slot0, slot1)
	slot4 = slot0.model

	if slot0.model.getGameState(slot3) == LRNN_GAME_SCENE_FREE or slot2 == LRNN_GAME_SCENE_END then
		return true
	else
		slot5 = slot0.model

		return slot0.model.getCbPlayStatus(slot4)[slot1 + 1] == 1
	end
end

LrnnController.onGameSceneByServer = function (slot0, slot1)
	slot4 = audioMgr

	audioMgr.resetVolume(slot3)

	slot6 = gameMgr.getCurRoomVo(slot0.model.setIsPoolRoom).wSortID % 2 == 0

	slot0.model.setIsPoolRoom(gameMgr, slot0.model)

	slot5 = gameMgr

	if gameMgr.getGameStatus(slot4) == LRNN_GAME_SCENE_FREE then
		slot8 = "CMD_S_Ox6_StatusFree"

		if ffiMgr.isSizeEqual(slot5, ffiMgr, slot1) then
			slot8 = "CMD_S_Ox6_StatusFree"
			slot4 = ffiMgr.castStruct2TableByLuaStr(slot5, ffiMgr, slot1)
			slot8 = slot4

			slot0.checkCaijinInfo(ffiMgr, slot0)

			slot8 = slot4.lCellScore

			slot0.model.setLCellScore(ffiMgr, slot0.model)

			slot8 = slot4.bCaiJin

			slot0.model.setIsPoolRoom(ffiMgr, slot0.model)

			slot8 = true

			slot0.model.setCanShowReadyStart(ffiMgr, slot0.model)
			slot0.model.setGameState(ffiMgr, slot0.model)

			slot7 = slot0.model.isAutoChangedSignal

			slot0.model.isAutoChangedSignal.emit(ffiMgr)

			slot7 = slot0.model
			slot5 = slot0.model.getMyTableUserData(ffiMgr)
			slot9 = slot0.model

			for slot9 = 1, slot0.model.getChairCount(LRNN_GAME_SCENE_FREE), 1 do
				if slot5[slot9] and slot10.cbUserStatus then
					if slot10.cbUserStatus == US_SIT then
						slot15 = 15

						slot0.setCd(slot12, slot0, slot10.wChairID)
					elseif slot10.cbUserStatus == US_READY then
						slot15 = 0

						slot0.setCd(slot12, slot0, slot10.wChairID)
					end
				end
			end
		end
	elseif slot3 == LRNN_GAME_SCENE_BANK then
		slot8 = "CMD_S_Ox6_StatusCall"

		if ffiMgr.isSizeEqual(slot5, ffiMgr, slot1) then
			slot8 = "CMD_S_Ox6_StatusCall"
			slot8 = ffiMgr.castStruct2TableByLuaStr(slot5, ffiMgr, slot1)

			slot0.checkBankerState(ffiMgr, slot0)
		end
	elseif slot3 == LRNN_GAME_SCENE_BET then
		slot8 = "CMD_S_Ox6_StatusScore"

		if ffiMgr.isSizeEqual(slot5, ffiMgr, slot1) then
			slot8 = "CMD_S_Ox6_StatusScore"
			slot8 = ffiMgr.castStruct2TableByLuaStr(slot5, ffiMgr, slot1).cbPlayStatus

			if not slot0.checkPlayStatus(ffiMgr, slot0) then
				slot8 = false

				slot0.model.setCanShowReadyStart(slot6, slot0.model)

				return
			end

			slot9 = slot4.lTurnMaxScore

			slot0.checkBetState(slot6, slot0, slot4.wBankerUser)

			slot8 = slot4.lTableScore

			slot0.checkAddScoreState(slot6, slot0)
		end
	elseif slot3 == LRNN_GAME_SCENE_END then
		slot8 = "CMD_S_Ox6_StatusPlay"

		if ffiMgr.isSizeEqual(slot5, ffiMgr, slot1) then
			slot8 = "CMD_S_Ox6_StatusPlay"
			slot4 = ffiMgr.castStruct2TableByLuaStr(slot5, ffiMgr, slot1)
			slot8 = slot4

			slot0.checkCaijinInfo(ffiMgr, slot0)

			slot8 = slot4.lCellScore

			slot0.model.setLCellScore(ffiMgr, slot0.model)

			slot8 = slot4.bCaiJin

			slot0.model.setIsPoolRoom(ffiMgr, slot0.model)

			slot8 = slot4.cbPlayStatus

			if not slot0.checkPlayStatus(ffiMgr, slot0) then
				slot8 = false

				slot0.model.setCanShowReadyStart(slot6, slot0.model)

				return
			end

			slot9 = slot4.lTurnMaxScore

			slot0.checkBetState(slot6, slot0, slot4.wBankerUser)

			slot8 = slot4.lTableScore

			slot0.checkAddScoreState(slot6, slot0)

			slot8 = slot4.cbHandCardData

			slot0.checkSendCardState(slot6, slot0)
		end
	else
		slot7 = slot3

		print(slot5, "GameScene游戏状态是")
	end
end

LrnnController.checkAddScoreState = function (slot0, slot1)
	slot2 = {}
	slot5 = slot1

	for slot6, slot7 in pairs(slot4) do
		if slot7 ~= 0 then
			slot13 = true

			slot0.model.setGameBet(slot10, slot0.model, {
				wAddScoreUser = slot6 - 1,
				lAddScoreCount = slot7
			})

			slot2[slot6 - 1] = lAddScoreCount
		end
	end

	slot6 = slot2

	slot0.model.setAllGameBet(slot4, slot0.model)
end

LrnnController.onGameMessage = function (slot0, slot1, slot2)
	if slot2 == SUB_S_Ox6_CALL_BANKER then
		slot6 = slot1

		slot0.onSubCallBanker(slot4, slot0)
	elseif slot2 == SUB_S_Ox6_GAME_START then
		slot6 = slot1

		slot0.onSubGameStart(slot4, slot0)
	elseif slot2 == SUB_S_Ox6_ADD_SCORE then
		slot6 = slot1

		slot0.onSubAddScore(slot4, slot0)
	elseif slot2 == SUB_S_Ox6_SEND_CARD then
		slot6 = slot1

		slot0.onSubSendCard(slot4, slot0)
	elseif slot2 == SUB_S_Ox6_OPEN_CARD then
		slot6 = slot1

		slot0.onSubOpenCard(slot4, slot0)
	elseif slot2 == SUB_S_Ox6_PLAYER_EXIT then
		slot6 = slot1

		slot0.onSubUserQuit(slot4, slot0)
	elseif slot2 == SUB_S_Ox6_GAME_END then
		slot6 = slot1

		slot0.onSubGameEnd(slot4, slot0)
	end
end

LrnnController.checkCaijinInfo = function (slot0, slot1)
	if slot1 then
		if slot1.lCaijin then
			slot5 = slot1.lCaijin

			slot0.model.setCaijin(slot3, slot0.model)
		end

		if slot1.caijinInfo then
			slot5 = slot1.caijinInfo

			slot0.model.setCaijinInfo(slot3, slot0.model)
		end

		if slot1.lAllCaijin then
			slot5 = slot1.lAllCaijin

			slot0.model.setLAllCaijin(slot3, slot0.model)
		end

		if slot1.lGetCaijin and slot1.wWinUser then
			slot8 = {
				lGetCaijin = slot1.lGetCaijin,
				wWinUser = slot1.wWinUser,
				szNickName = slot0.model.getMyTableUserData(slot3)[gameMgr.switchViewChairID(slot0.model, gameMgr)] or {}.szNickName or ""
			}

			slot0.model.setLGetCaijin(slot1.wWinUser, slot0.model)
		end
	end
end

LrnnController.onSubGameEnd = function (slot0, slot1)
	slot6 = "CMD_S_Ox6_GameEnd"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "CMD_S_Ox6_GameEnd"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot5 = slot0.model

		if slot0.model.getCbDynamicJoin(ffiMgr) then
			slot6 = true

			slot0.model.setCanShowReadyStart(slot4, slot0.model)

			slot6 = nil

			slot0.model.setTipType(slot4, slot0.model)

			return
		end

		slot6 = slot2.lGameScore

		slot0.model.setGameScore(slot4, slot0.model)

		slot6 = slot2.lGameTax

		slot0.model.setGameTax(slot4, slot0.model)

		slot6 = slot2

		slot0.checkCaijinInfo(slot4, slot0)

		slot3 = nil
		slot6 = slot2.lGameScore

		for slot7, slot8 in ipairs(slot0) do
			slot11 = Hero

			if slot7 == Hero.getWChairID(slot10) + 1 then
				slot3 = slot8
			end
		end

		slot8 = true

		slot0.model.setCloseScore(slot5, slot0.model, slot3)
		slot0.model.setGameState(slot5, slot0.model)

		slot6 = slot0.model
		slot5 = false
		slot8 = slot0.model.getMyTableUserData(slot5)

		for slot9, slot10 in pairs(LRNN_GAME_SCENE_END) do
			if slot10.cbUserStatus == US_OFFLINE then
				slot15 = nil

				slot0.setCd(slot12, slot0, slot10.wChairID)

				slot4[slot9] = nil
				slot5 = true
			end
		end

		if slot5 then
			slot8 = slot0.model.myTableUserDataChangedSignal

			slot0.model.myTableUserDataChangedSignal.emit(slot7)
		end

		slot8 = slot0

		slot0.showPraticeTips(slot7)
	end
end

LrnnController.onSubUserQuit = function (slot0, slot1)
	slot4 = "对方用户强退"

	print(slot3)

	slot6 = "CMD_S_Ox6_PlayerExit"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "CMD_S_Ox6_PlayerExit"
		slot7 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wPlayerID

		table.insert(slot0.model, slot0.model.getExitUser(ffiMgr))
	end
end

LrnnController.onSubOpenCard = function (slot0, slot1)
	slot4 = "摊牌状态"

	print(slot3)

	slot6 = "CMD_S_Ox6_Open_Card"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "CMD_S_Ox6_Open_Card"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot5 = slot0.model

		if slot0.model.getCbDynamicJoin(ffiMgr) then
			return
		end

		slot7 = true

		slot0.model.setTanPaiCurrentUser(slot4, slot0.model, slot2.wPlayerID)

		slot7 = nil

		slot0.setCd(slot4, slot0, slot2.wPlayerID)
	end

	slot5 = LRNN_GAME_STATE_OPENCARD

	slot0.model.setGameState(slot3, slot0.model)
end

LrnnController.onSubAddScore = function (slot0, slot1)
	slot6 = "CMD_S_Ox6_AddScore"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "CMD_S_Ox6_AddScore"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot5 = slot0.model

		if slot0.model.getCbDynamicJoin(ffiMgr) then
			return
		end

		slot5 = slot0.model
		slot0.model.getAllGameBet(slot4)[slot2.wAddScoreUser] = slot2.lAddScoreCount
		slot8 = true

		slot0.model.setAllGameBet(slot2.lAddScoreCount, slot0.model, slot3)

		slot8 = true

		slot0.model.setGameBet(slot2.lAddScoreCount, slot0.model, slot2)
	end
end

LrnnController.checkSendCardState = function (slot0, slot1)
	slot5 = nil

	slot0.model.setTipType(slot3, slot0.model)

	slot4 = slot0.model

	if slot0.model.getCbDynamicJoin(slot3) then
		return
	end

	slot5 = true

	slot0.model.setIsShowingBattle(slot3, slot0.model)

	slot5 = slot1

	slot0.model.setSendCardData(slot3, slot0.model)

	slot5 = LRNN_GAME_STATE_SENDCARD

	slot0.model.setGameState(slot3, slot0.model)

	slot5 = slot0.model.getMyTableUserData(slot3)

	for slot6, slot7 in pairs(slot0.model) do
		slot11 = slot7.wChairID

		if slot0.checkPlayStatusByChairID(slot9, slot0) then
			slot12 = 10

			slot0.setCd(slot9, slot0, slot7.wChairID)
		else
			slot12 = nil

			slot0.setCd(slot9, slot0, slot7.wChairID)
		end
	end
end

LrnnController.onSubSendCard = function (slot0, slot1)
	slot6 = "CMD_S_Ox6_SendCard"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot4 = popupMgr

		popupMgr.hideAwardPopupView(slot3)

		slot5 = {}

		slot0.model.setExitUser(slot3, slot0.model)

		slot6 = "CMD_S_Ox6_SendCard"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).cbPlayStatus

		if not slot0.checkPlayStatus(ffiMgr, slot0) then
			return
		end

		slot6 = slot2.cbCardData

		slot0.checkSendCardState(slot4, slot0)
	end
end

LrnnController.checkBetState = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if slot0.model.getCbDynamicJoin(slot4) then
		return
	end

	slot3 = slot1 == Hero.getWChairID(slot4)
	slot9 = true

	slot0.model.setBankUserChairId(slot0.model, slot0.model, slot1)

	slot8 = {}

	slot0.model.setAllGameBet(slot0.model, slot0.model)

	slot7 = slot0.model.getMyTableUserData(Hero)

	for slot8, slot9 in pairs(slot0.model) do
		if slot9.wChairID ~= slot1 then
			slot13 = slot9.wChairID

			if slot0.checkPlayStatusByChairID(slot11, slot0) then
				slot15 = true

				slot0.setCd(slot11, slot0, slot9.wChairID, 5)
			else
				slot14 = nil

				slot0.setCd(slot11, slot0, slot9.wChairID)
			end
		end
	end

	slot8 = nil

	slot0.model.setTipType(slot6, slot0.model)

	if not slot3 then
		slot8 = slot2

		slot0.model.setTurnMaxScore(slot6, slot0.model)

		slot10 = Hero
		slot10 = true

		slot0.setCd(slot6, slot0, Hero.getWChairID(slot9), 5)
	else
		slot8 = 3

		slot0.model.setTipType(slot6, slot0.model)
	end

	slot8 = LRNN_GAME_SCENE_BET

	slot0.model.setGameState(slot6, slot0.model)
end

LrnnController.onSubGameStart = function (slot0, slot1)
	slot6 = "CMD_S_Ox6_GameStart"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "CMD_S_Ox6_GameStart"
		slot7 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).lTurnMaxScore

		slot0.checkBetState(ffiMgr, slot0, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wBankerUser)
	end
end

LrnnController.checkBankerState = function (slot0, slot1)
	slot5 = slot1.cbPlayStatus

	if not slot0.checkPlayStatus(slot3, slot0) then
		return
	end

	slot5 = false

	slot0.model.setIsShowingReady(slot3, slot0.model)

	slot5 = Hero
	slot6 = slot1.wCallBanker == Hero.getWChairID(slot0.model)

	slot0.model.setIsShowingCallBanker(slot4, slot0.model)

	slot6 = LRNN_GAME_SCENE_BANK

	slot0.model.setGameState(slot4, slot0.model)

	slot8 = true

	slot0.setCd(slot4, slot0, slot1.wCallBanker, 5)

	if not slot2 then
		slot6 = 2

		slot0.model.setTipType(slot4, slot0.model)
	else
		slot6 = nil

		slot0.model.setTipType(slot4, slot0.model)
	end
end

LrnnController.onSubCallBanker = function (slot0, slot1)
	slot6 = "CMD_S_Ox6_CallBanker"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "CMD_S_Ox6_CallBanker"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0.checkBankerState(ffiMgr, slot0)
	end
end

LrnnController.requestOpenCard = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMyTableUserData(slot2)[1] then
		slot6 = false

		slot0.model.setCanShowTanPai(slot4, slot0.model)

		slot3 = false
		slot6 = slot0.model
		slot4 = slot0.model.getSendCardData(slot0.model) or {}
		slot7 = Hero

		if slot4[Hero.getWChairID(slot6) + 1] and slot5[1] ~= 0 then
			slot12 = {}

			if slot0.getCardType(slot8, slot0, slot5, #slot5) > 0 then
				slot12 = 5
				slot3 = slot0.getOxCard(slot9, slot0, slot5)
			end
		end

		slot12 = true

		reqLrnnOpenCard(slot9, (slot3 and 1) or 0, 0)
	end
end

LrnnController.requestStartGameInResultView = function (slot0)
	slot4 = true

	slot0.hideAllBattleChildrenViews(slot2, slot0)

	slot4 = false

	slot0.model.setCanShowStart(slot2, slot0.model)

	slot3 = slot0

	slot0.requestReady(slot2)
end

LrnnController.requestReady = function (slot0)
	slot4 = false

	slot0.model.setCanShowReadyStart(slot2, slot0.model)

	slot3 = slot0.model

	if slot0.model.getMyTableUserData(slot2)[1] and slot2.cbUserStatus and slot2.cbUserStatus == US_SIT then
		slot5 = audioMgr

		audioMgr.resetVolume(slot4)

		slot8 = Hero
		slot7 = nil

		slot0.setCd(slot4, slot0, Hero.getWChairID(slot7))

		slot5 = true

		reqReady(slot4)
	end
end

LrnnController.requestCallBankState = function (slot0, slot1)
	slot5 = false

	slot0.model.setIsShowingCallBanker(slot3, slot0.model)

	slot5 = true

	reqLrnnSetBank(slot3, (slot1 and 1) or 0)
end

LrnnController.onEnterRoomByServer = function (slot0)
	slot3 = slot0

	BaseGameController.onEnterRoomByServer(slot2)

	slot5 = gameMgr.getCurRoomVo(slot0.model.setIsPoolRoom).wSortID % 2 == 0

	slot0.model.setIsPoolRoom(gameMgr, slot0.model)
end

return
