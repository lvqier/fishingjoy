PdkController.onUserEnter = function (slot0, slot1)
	slot5 = slot1

	slot0.updateUserData(slot3, slot0)

	slot5 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot0) then
		slot4 = slot0.model

		if slot0.model.getCurShowingViewType(slot3) == VIEW_TYPE_BATTLE then
			slot4 = Hero

			if Hero.getCbStatus(slot3) == US_SIT or slot2 == US_READY or slot2 == US_FREE then
				slot7 = true

				slot0.model.setGameState(slot4, slot0.model, PDK_GAMESTATE_END)
			end

			slot5 = slot0

			slot0.resetAllInfo(slot4)
		end
	end
end

PdkController.onUserScore = function (slot0, slot1)
	slot5 = slot1

	slot0.updateUserData(slot3, slot0)
end

PdkController.onEnterRoomByServer = function (slot0, slot1)
	slot5 = slot1

	BaseGameController.onEnterRoomByServer(slot3, slot0)

	slot4 = slot0.model

	if slot0.model.getCurShowingViewType(slot3) == VIEW_TYPE_HALL then
		slot6 = true

		slot0.model.setGameState(slot3, slot0.model, PDK_GAMESTATE_READY)

		slot2 = slot0.isFromQuikStart ~= nil or slot0.isFromEnterRoom ~= nil

		if slot0.isFromQuikStart then
			slot7 = INVALID_WORD

			slot0.requestSitDown(slot4, slot0, INVALID_WORD)

			slot0.isFromQuikStart = nil
		elseif slot0.isFromEnterRoom then
			slot7 = INVALID_WORD

			slot0.requestSitDown(slot4, slot0, INVALID_WORD)

			slot0.isFromEnterRoom = nil
		end
	else
		slot4 = slot0.model

		if slot0.model.getCurShowingViewType(slot3) == VIEW_TYPE_BATTLE then
		end
	end
end

PdkController.onUserStatusByServer = function (slot0, slot1, slot2)
	slot6 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot5) and slot1.cbUserStatus == US_FREE then
		slot7 = true

		Hero.setUserFakeScore(slot4, Hero, 0)

		if slot0._enterForeground then
			slot5 = Hero

			if Hero.getWChairID(slot4) == INVALID_WORD then
				slot5 = Hero

				if Hero.getWTableID(slot4) == INVALID_WORD and not slot0.isChangingTable then
					slot0._enterForeground = false

					return
				end
			end
		end

		slot0._enterForeground = false
	end

	slot7 = slot2

	slot0.onUserStatus(slot4, slot0, slot1)
end

PdkController.onUserStatus = function (slot0, slot1)
	slot4 = slot0.model
	slot2 = slot0.model.getMyTableUserDatasDic(slot3) or {}
	slot6 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot5) then
		if slot1.cbUserStatus == US_SIT then
		elseif slot1.cbUserStatus == US_READY then
		elseif slot1.cbUserStatus == US_FREE then
			slot7 = true

			slot0.model.setIsHoldBtnStartAtBegin(slot4, slot0.model, false)

			if not slot0.isFromCloseGame then
				for slot6 = PDK_VIEW_CHAIRID_RIGHT, PDK_VIEW_CHAIRID_LEFT, 1 do
					slot2[slot6] = nil
				end

				slot7 = true

				slot0.model.setGameState(slot4, slot0.model, PDK_GAMESTATE_READY)

				slot6 = false

				gameMgr.setIsStartGame(slot4, gameMgr)
			end

			if slot0.isChangingTable then
				slot0.isChangingTable = nil
			end

			if slot0.isFromCloseGame then
				slot0.isFromCloseGame = nil
			end
		elseif slot1.cbUserStatus == US_PLAYING then
			slot6 = true

			slot0.startOrStopMatchLoading(slot4, slot0)

			slot7 = true

			slot0.model.setIsHoldBtnStartAtBegin(slot4, slot0.model, false)
		end

		slot2[PDK_VIEW_CHAIRID_ME] = slot1

		if slot1.cbUserStatus ~= US_FREE then
			slot6 = Hero.getWTableID(slot7)
			slot9 = Hero
			slot6 = gameMgr.getUserDatasByTableId(slot4, gameMgr, Hero.getDwUserID(Hero))

			for slot7, slot8 in ipairs(gameMgr) do
				slot12 = slot8.wChairID
				slot2[gameMgr.switchViewChairID(slot10, gameMgr)] = slot8
			end
		end

		slot7 = true

		slot0.model.setMyTableUserDatasDic(slot4, slot0.model, slot2)
	else
		slot6 = Hero

		if slot1.wTableID == Hero.getWTableID(slot5) then
			if slot1.cbUserStatus ~= US_FREE then
				slot6 = slot1.wChairID
				slot2[gameMgr.switchViewChairID(slot4, gameMgr)] = slot1

				if slot1.cbUserStatus == US_SIT then
				elseif slot1.cbUserStatus == US_READY then
				elseif slot1.cbUserStatus == US_OFFLINE then
					slot6 = slot0.model

					if slot0.model.getGameState(slot5) == GAME_STATUS_FREE then
						slot2[slot3] = nil
					end
				end

				slot8 = true

				slot0.model.setMyTableUserDatasDic(slot5, slot0.model, slot2)
			end
		else
			slot3 = false
			slot6 = slot2

			for slot7, slot8 in pairs(slot5) do
				if slot8 and slot8.dwUserID == slot1.dwUserID then
					slot2[slot7] = nil
					slot3 = true
				end
			end

			if slot3 then
				slot8 = true

				slot0.model.setMyTableUserDatasDic(slot5, slot0.model, slot2)
			end
		end
	end
end

PdkController.updateUserData = function (slot0, slot1)
	slot5 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot4) then
		slot5 = slot1

		slot0.model.setMyUserData(slot3, slot0.model)
	end

	slot5 = Hero

	if slot1.wTableID == Hero.getWTableID(slot4) and US_FREE < slot1.cbUserStatus then
		slot6 = slot1.wChairID
		slot0.model.getMyTableUserDatasDic(slot3) or {}[gameMgr.switchViewChairID(slot0.model, gameMgr)] = slot1
		slot8 = true

		slot0.model.setMyTableUserDatasDic(gameMgr, slot0.model, slot0.model.getMyTableUserDatasDic(slot3) or )
	end
end

PdkController.onGameMessage = function (slot0, slot1, slot2)
	if PDK_UNRECONNECT_PROTOCOL[slot2] then
		slot0.model._isFromReconnect = false
	end

	if slot2 == PDK_SUB_S_GAME_START then
		slot6 = slot1

		slot0.onSubGameStart(slot4, slot0)
	elseif slot2 == PDK_SUB_S_PASS_CARD then
		slot6 = slot1

		slot0.onSubPassCard(slot4, slot0)
	elseif slot2 == PDK_SUB_S_GAME_CONCLUDE then
		slot6 = slot1

		slot0.onSubGameEnd(slot4, slot0)
	elseif slot2 == PDK_SUB_S_OUT_CARD then
		slot6 = slot1

		slot0.onSubOutCard(slot4, slot0)
	elseif slot2 == PDK_SUB_S_TRUSTEE then
		slot6 = slot1

		slot0.onSubTrusTee(slot4, slot0)
	elseif slot2 == PDK_SUB_S_ANDROID_CARD then
		slot6 = slot1

		slot0.onSubAndroidCard(slot4, slot0)
	end
end

PdkController.onGameSceneByServer = function (slot0, slot1)
	slot4 = gameMgr

	if gameMgr.getGameStatus(slot3) == PDK_GAME_SCENE_FREE then
		slot0.model._isFromReconnect = false
		slot6 = slot1

		slot0.onGameSceneFree(false, slot0)
	elseif slot2 == PDK_GAME_SCENE_PLAY then
		slot0.model._isFromReconnect = true
		slot6 = slot1

		slot0.onGameScenePlay(true, slot0)
	end
end

PdkController.onGameSceneFree = function (slot0, slot1)
	slot6 = "PDK_CMD_S_StatusFree"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "PDK_CMD_S_StatusFree"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot6 = slot2.szGuid

		slot0.model.setCurReportCode(ffiMgr, slot0.model)

		slot5 = "场景还原:准备阶段"

		trace(ffiMgr)

		slot5 = slot2

		trace_r(ffiMgr)

		slot6 = nil

		slot0.model.setLockViewDic(ffiMgr, slot0.model)

		slot7 = {
			[PDK_GAMESTATE_PLAY] = {
				timeOut = slot2.cbTimeOutCard,
				timeStart = slot2.cbTimeHeadOutCard
			},
			[PDK_GAMESTATE_END] = slot2.cbTimeStartGame,
			[PDK_GAMESTATE_READY] = slot2.cbTimeStartGame
		}

		slot0.model.setTimeDic(slot2.cbTimeStartGame, slot0.model)

		slot7 = PDK_GAMESTATE_READY

		slot0.model.setGameState(slot2.cbTimeStartGame, slot0.model)

		slot7 = slot2.lCellScore

		slot0.model.setLCellScore(slot2.cbTimeStartGame, slot0.model)
	end
end

PdkController.onGameScenePlay = function (slot0, slot1)
	slot6 = "PDK_CMD_S_StatusPlay"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "PDK_CMD_S_StatusPlay"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot6 = slot2.szGuid

		slot0.model.setCurReportCode(ffiMgr, slot0.model)

		slot5 = "场景还原:游戏中阶段"

		trace(ffiMgr)

		slot5 = slot2

		trace_r(ffiMgr)

		slot5 = slot0

		slot0.resetAllInfo(ffiMgr)

		slot5 = slot0

		slot0.lockUpViewDic(ffiMgr)

		slot7 = {
			[PDK_GAMESTATE_PLAY] = {
				timeOut = slot2.cbTimeOutCard,
				timeStart = slot2.cbTimeHeadOutCard
			},
			[PDK_GAMESTATE_READY] = slot2.cbTimeStartGame,
			[PDK_GAMESTATE_END] = slot2.cbTimeStartGame
		}

		slot0.model.setTimeDic(slot2.cbTimeStartGame, slot0.model)

		slot7 = slot2.wCurrentUser
		slot4 = gameMgr.switchViewChairID(slot2.cbTimeStartGame, gameMgr)
		slot8 = slot2.wTurnWiner

		if slot0.switchViewId(gameMgr, slot0) ~= INVALID_WORD then
			slot8 = slot2.cbHandCardCount

			for slot9, slot10 in pairs(slot7) do
				if slot10 < PDK_CARDS_COUNT then
					slot0.model._recentOutCardUser = slot5

					break
				end
			end
		end

		slot0.model._serverCanOut = slot2.cbPass
		slot10 = true

		slot0.model.setGameState(slot2.cbPass, slot0.model, PDK_GAMESTATE_PLAY)

		slot9 = slot4

		slot0.model.setCurrentUser(slot2.cbPass, slot0.model)

		slot9 = CARD_CHANGE_RECONNECT

		slot0.model.setCardChangeType(slot2.cbPass, slot0.model)

		slot9 = slot2.cbHandCardData

		slot0.model.setMyCards(slot2.cbPass, slot0.model)

		slot6 = {
			[slot4] = 0
		}

		if slot5 == slot4 or PDK_INVALID_WORD == slot5 then
			slot10 = slot4
			slot6[slot0.calFrontViewChairId(slot8, slot0)] = 0
			slot11 = slot0.calFrontViewChairId(slot8, slot0)
			slot6[slot0:calFrontViewChairId(slot0)] = 0
			slot11 = slot0
			slot0.model._canOutDataDicValue = slot0:findCanOutCard()
		else
			slot7 = {}

			for slot11 = 1, slot2.cbTurnCardCount, 1 do
				slot15 = slot2.cbTurnCardData[slot11]

				table.insert(slot13, slot7)
			end

			slot8 = {
				[slot5] = slot7
			}
			slot12 = slot4
			slot6[slot5] = 1

			if slot0.calFrontViewChairId(slot10, slot0) ~= slot5 then
				slot6[slot9] = -1
				slot0.model._recentTurnUser = slot9
			else
				slot13 = slot9
				slot6[slot0.calFrontViewChairId(slot11, slot0)] = 0
				slot0.model._recentTurnUser = slot5
			end

			slot12 = slot0.model
			slot16 = slot7

			slot0.model.setOutCardInfo(slot11, slot0.analyzeCardInfo(slot14, slot0))

			slot13 = slot8

			slot0.model.setOutCardsDic(slot11, slot0.model)

			slot13 = slot0
			slot0.model._canOutDataDicValue = slot0.findCanFollowCard(slot0.model)
		end

		slot11 = true

		slot0.model.setUsersIsOutCardDic(slot8, slot0.model, slot6)

		slot11 = true

		slot0.model.setCanOutDataDicValue(slot8, slot0.model, slot0.model._canOutDataDicValue)

		slot7 = {}
		slot10 = slot2.cbHandCardCount

		for slot11, slot12 in ipairs(slot0.model) do
			slot16 = slot11 - 1
			slot7[gameMgr.switchViewChairID(slot14, gameMgr)] = slot12
		end

		slot0.model.setLeaveCardsCountDic(slot9, slot0.model)

		slot9 = {}
		slot12 = slot2.cbUserTrustee

		for slot13, slot14 in pairs(slot7) do
			slot18 = slot13 - 1
			slot9[gameMgr.switchViewChairID(slot16, gameMgr)] = slot14 == 1
		end

		slot13 = slot9

		slot0.model.setAutoDic(slot11, slot0.model)

		slot13 = nil

		slot0.model.setLockViewDic(slot11, slot0.model)

		slot12 = slot0.model.stateViewDicChangedSignal

		slot0.model.stateViewDicChangedSignal.emit(slot11)

		slot12 = slot0.model

		if slot0.model.getCanOutCard(slot11) then
			slot16 = slot0.tryOnceOutAllCards
			slot15 = 200

			slot0.startEventTick(slot11, slot0, handler(slot14, slot0), "PdkController:onSubPassCard1")
		elseif slot4 == PDK_VIEW_CHAIRID_ME then
			slot16 = slot0.requestPassCard
			slot15 = 500

			slot0.startEventTick(slot11, slot0, handler(slot14, slot0), "PdkController:onSubPassCard2")
		end

		slot13 = slot2.lCellScore

		slot0.model.setLCellScore(slot11, slot0.model)

		slot12 = slot0

		slot0.resetLineInfo(slot11)
	end
end

PdkController.onSubGameStart = function (slot0, slot1)
	slot6 = "PDK_CMD_S_GameStart"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "PDK_CMD_S_GameStart"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot6 = slot2.szGuid

		slot0.model.setCurReportCode(ffiMgr, slot0.model)

		slot5 = "消息下发:游戏开始"

		trace(ffiMgr)

		slot5 = slot2

		trace_r(ffiMgr)

		slot6 = true

		slot0.startOrStopMatchLoading(ffiMgr, slot0)

		slot5 = slot0

		slot0.resetAllInfo(ffiMgr)

		slot5 = slot0

		slot0.lockUpViewDic(ffiMgr)

		slot7 = {
			[PDK_GAMESTATE_PLAY] = {
				timeOut = slot2.cbTimeOutCard,
				timeStart = slot2.cbTimeHeadOutCard
			},
			[PDK_GAMESTATE_READY] = slot2.cbTimeStartGame,
			[PDK_GAMESTATE_END] = slot2.cbTimeStartGame
		}

		slot0.model.setTimeDic(slot2.cbTimeStartGame, slot0.model)

		slot7 = slot2.lCellScore

		slot0.model.setLCellScore(slot2.cbTimeStartGame, slot0.model)

		slot7 = PDK_GAMESTATE_PLAY

		slot0.model.setGameState(slot2.cbTimeStartGame, slot0.model)

		slot7 = slot2.wCurrentUser
		slot8 = gameMgr.switchViewChairID(slot2.cbTimeStartGame, gameMgr)

		slot0.model.setCurrentUser(gameMgr, slot0.model)

		slot9 = {
			[PDK_VIEW_CHAIRID_ME] = PDK_CARDS_COUNT,
			[PDK_VIEW_CHAIRID_LEFT] = 0,
			[PDK_VIEW_CHAIRID_RIGHT] = 0
		}

		slot0.model.setLeaveCardsCountDic(0, slot0.model)

		slot9 = slot2.cbCardData
		slot7 = TableUtil.copyData(slot0.model)
		slot0.model._tmpCardInitData = slot7
		slot9 = CARD_CHANGE_INIT

		slot0.model.setCardChangeType(slot7, slot0.model)

		slot9 = slot2.cbCardData

		slot0.model.setMyCards(slot7, slot0.model)

		slot8 = audioMgr

		audioMgr.resetVolume(slot7)

		slot9 = "bgm/bgm_1.mp3"

		slot0.playMusic(slot7, slot0)

		slot8 = slot0

		slot0.resetLineInfo(slot7)

		slot11 = 3000

		slot0.startEventTick(slot7, slot0, function ()
			slot3 = nil

			slot0.model.setLockViewDic(slot1, slot0.model)

			slot2 = slot0.model.setLockViewDic.model.stateViewDicChangedSignal

			slot0.model.setLockViewDic.model.stateViewDicChangedSignal.emit(slot1)
		end, "PdkController:onSubGameStart1")
	end
end

PdkController.onSubOutCard = function (slot0, slot1)
	slot6 = "PDK_CMD_S_OutCard"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "PDK_CMD_S_OutCard"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot5 = "消息下发:有人出牌"

		trace(ffiMgr)

		slot5 = slot2

		trace_r(ffiMgr)

		slot5 = slot0

		slot0.lockUpViewDic(ffiMgr)

		slot6 = slot2.wOutCardUser
		slot3 = gameMgr.switchViewChairID(ffiMgr, gameMgr)

		if slot2.wCurrentUser ~= INVALID_WORD then
			slot8 = slot2.wCurrentUser
			slot4 = gameMgr.switchViewChairID(slot6, gameMgr)
		end

		if slot0.model._recentOutCardUser then
			slot0.model._isFollowCard = slot0.model._recentOutCardUser ~= slot3
		else
			slot0.model._isFollowCard = false
		end

		slot0.model._serverCanOut = slot2.cbPass
		slot0.model._recentOutCardUser = slot3
		slot0.model._recentTurnUser = slot3
		slot9 = true

		slot0.model.setCurrentUser(slot2.cbPass, slot0.model, slot4)

		slot0.model.getUsersIsOutCardDic(slot2.cbPass) or {}[slot3] = 1
		slot0.model.getUsersIsOutCardDic(slot2.cbPass) or [slot4] = 0
		slot10 = true

		slot0.model.setUsersIsOutCardDic(slot0.model, slot0.model, slot0.model.getUsersIsOutCardDic(slot2.cbPass) or )

		slot9 = CARD_CHANGE_OUT

		slot0.model.setCardChangeType(slot0.model, slot0.model)

		slot6 = {}
		slot9 = slot0.model
		slot7 = slot0.model.getOutCardsDic(slot0.model) or {}

		for slot11 = 1, slot2.cbCardCount, 1 do
			slot15 = slot2.cbCardData[slot11]

			table.insert(slot13, slot6)
		end

		slot11 = slot6
		slot13 = true

		slot0.model.setOutCardInfo(slot0, slot0.model, slot8)

		slot11 = slot6
		slot7[slot3] = TableUtil.copyData(slot0)
		slot13 = true

		slot0.model.setOutCardsDic(slot0, slot0.model, slot7)

		slot11 = slot0.model

		if slot0.model.getAndroidCards(slot0) and slot9[slot3] then
			slot13 = slot6
			slot9[slot3] = TableUtil.removeElements(slot11, slot9[slot3])
			slot14 = true

			slot0.model.setAndroidCards(slot11, slot0.model, slot9)
		end

		if slot3 == PDK_VIEW_CHAIRID_ME then
			slot13 = slot6

			slot0.model.deleteMyCardDatas(slot11, slot0.model)
		end

		slot12 = slot0.model
		slot0.model.getLeaveCardsCountDic(slot11) or {}[slot3] = (slot0.model.getLeaveCardsCountDic(slot11) or [slot3] or PDK_CARDS_COUNT) - slot2.cbCardCount
		slot11 = {}

		if slot10[slot3] == 1 then
			slot11[slot3] = true
		end

		slot16 = true

		slot0.model.setWarningEffectDic(slot13, slot0.model, slot11)

		slot16 = true

		slot0.model.setLeaveCardsCountDic(slot13, slot0.model, slot10)

		if slot3 == PDK_VIEW_CHAIRID_ME then
			slot15 = nil

			slot0.model.setSelectedOutCardsDic(slot13, slot0.model)

			slot15 = nil

			slot0.model.setSelectedCardsDic(slot13, slot0.model)
		end

		slot15 = nil

		slot0.model.setTipsInfo(slot13, slot0.model)

		if slot4 ~= INVALID_WORD then
			if slot3 ~= PDK_VIEW_CHAIRID_ME then
				slot14 = slot0.model
				slot17 = slot0

				slot0.model.setCanOutDataDicValue(slot13, slot0.findCanFollowCard(slot16))
			else
				slot14 = slot0.model
				slot17 = slot0

				slot0.model.setCanOutDataDicValue(slot13, slot0.findCanOutCard(slot16))
			end
		end

		slot12 = {}

		for slot16 = 0, 2, 1 do
			slot20 = slot16
			slot12[gameMgr.switchViewChairID(slot18, gameMgr)] = slot2.lScore[slot16 + 1]
		end

		slot16 = slot12
		slot16 = slot0.model.nilZeroMetalTable(slot14, slot0.model)
		slot16 = slot0.model.nilEmptyTable(slot14, slot0.model)

		slot0.model.setCurCtScoreDic(slot14, slot0.model)

		({
			stateViewDic = {}
		})["stateViewDic"][slot4] = true

		slot0.model.setLockViewDic(true, slot0.model)

		slot16 = slot0.model.stateViewDicChangedSignal

		slot0.model.stateViewDicChangedSignal.emit(true)

		function slot14()
			slot3 = nil

			slot0.model.setLockViewDic(slot1, slot0.model)

			slot2 = slot0.model.setLockViewDic.model.stateViewDicChangedSignal

			slot0.model.setLockViewDic.model.stateViewDicChangedSignal.emit(slot1)
		end

		function slot15(slot0, slot1)
			slot4 = slot0.model

			if slot0.model.getCanOutCard(slot3) then
				slot8 = slot0.tryOnceOutAllCards
				slot7 = slot0

				slot0.startEventTick(slot3, slot0, handler(slot6, slot0), "PdkController:onSubOutCard2")
			elseif slot1 == PDK_VIEW_CHAIRID_ME then
				slot8 = slot0.requestPassCard
				slot7 = slot1

				slot0.startEventTick(slot3, slot0, handler(slot6, slot0), "PdkController:onSubOutCard2")
			end
		end

		slot19 = slot8.ct

		if slot0.isLongAnimateCt(, slot0) then
			slot22 = slot0.model._ctSpineDelay[slot8.ct] * 1000

			slot0.startEventTick(slot18, slot0, slot14, "PdkController:onSubOutCard1")

			slot20 = slot0.model._ctSpineDelay[slot8.ct] * 1000 + 1200

			slot15(slot18, slot0.model._ctSpineDelay[slot8.ct] * 1000 + 500)
		else
			slot14()

			slot19 = 1200

			slot15(slot17, 500)
		end

		slot18 = slot0

		slot0.resetLineInfo(slot17)
	end
end

PdkController.onSubPassCard = function (slot0, slot1)
	slot6 = "PDK_CMD_S_PassCard"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "PDK_CMD_S_PassCard"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot5 = "消息下发:有人过牌"

		trace(ffiMgr)

		slot5 = slot2

		trace_r(ffiMgr)

		slot5 = slot0

		slot0.lockUpViewDic(ffiMgr)

		slot6 = slot2.wPassCardUser
		slot7 = slot2.wCurrentUser
		slot8 = nil

		slot0.model.setTipsInfo(gameMgr, slot0.model)

		slot0.model._serverCanOut = slot2.cbPass
		slot0.model._recentTurnUser = gameMgr.switchViewChairID(ffiMgr, gameMgr)
		slot8 = gameMgr.switchViewChairID(gameMgr, gameMgr)

		slot0.model.setCurrentUser(slot2.cbPass, slot0.model)

		slot0.model.getUsersIsOutCardDic(slot2.cbPass) or {}[slot3] = -1
		slot10 = true

		slot0.model.setUsersIsOutCardDic(slot0.model, slot0.model, slot0.model.getUsersIsOutCardDic(slot2.cbPass) or )

		if slot3 == PDK_VIEW_CHAIRID_ME then
			slot9 = nil

			slot0.model.setSelectedOutCardsDic(slot7, slot0.model)

			slot9 = nil

			slot0.model.setSelectedCardsDic(slot7, slot0.model)
		end

		slot14 = {
			"effect/%d/effect_buyao.mp3",
			"effect/%d/effect_yaobuqi.mp3"
		}
		slot13 = string.format(1, ()[math.random(slot2.wPassCardUser, table.nums(slot8))])

		slot0.playGameEffect(1, slot0)

		slot12 = slot0

		slot0.resetLineInfo(1)

		slot10 = {}

		for slot14 = 0, 2, 1 do
			slot18 = slot14
			slot10[gameMgr.switchViewChairID(slot16, gameMgr)] = slot2.lScore[slot14 + 1]
		end

		slot14 = slot10
		slot14 = slot0.model.nilZeroMetalTable(slot12, slot0.model)
		slot14 = slot0.model.nilEmptyTable(slot12, slot0.model)

		slot0.model.setCurCtScoreDic(slot12, slot0.model)

		slot14 = nil

		slot0.model.setLockViewDic(slot12, slot0.model)

		slot13 = slot0.model.stateViewDicChangedSignal

		slot0.model.stateViewDicChangedSignal.emit(slot12)

		slot13 = slot0.model

		if slot0.model.getCanOutCard(slot12) then
			slot17 = slot0.tryOnceOutAllCards
			slot16 = 500

			slot0.startEventTick(slot12, slot0, handler(slot15, slot0), "PdkController:onSubPassCard1")
		elseif slot4 == PDK_VIEW_CHAIRID_ME then
			slot17 = slot0.requestPassCard
			slot16 = 1200

			slot0.startEventTick(slot12, slot0, handler(slot15, slot0), "PdkController:onSubPassCard2")
		end
	end
end

PdkController.onSubGameEnd = function (slot0, slot1)
	slot6 = "PDK_CMD_S_GameConclude"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "PDK_CMD_S_GameConclude"
		slot5 = "消息下发:游戏结束"

		trace(ffiMgr)

		slot5 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		trace_r(ffiMgr)

		slot5 = slot0

		slot0.lockUpViewDic(ffiMgr)

		slot7 = true

		slot0.model.setIsHoldBtnStartAtResult(ffiMgr, slot0.model, true)
		slot0.model.setGameState(ffiMgr, slot0.model)

		slot3 = {}
		slot4 = 1
		slot7 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).cbCardCount

		for slot8, slot9 in ipairs(PDK_GAMESTATE_END) do
			slot13 = slot8 - 1

			if gameMgr.switchViewChairID(slot11, gameMgr) ~= PDK_VIEW_CHAIRID_ME then
				slot11 = nil

				for slot15 = slot4, (slot4 + slot9) - 1, 1 do
					slot19 = slot2.cbHandCardData[slot15]

					table.insert(slot17, slot11 or {})
				end

				if slot11 then
					slot3[slot10] = slot11
				end
			end

			slot4 = slot4 + slot9
		end

		slot9 = true

		slot0.model.setEndCardsDic(slot6, slot0.model, slot3)

		slot5 = {}
		slot6 = {}
		slot7 = 0
		slot8 = true
		slot11 = slot2.cbCardCount

		for slot12, slot13 in pairs(slot10) do
			if slot13 == 0 then
				slot8 = false
			end
		end

		for slot12 = 0, 2, 1 do
			slot16 = slot12
			slot16 = slot0.model
			slot15 = {
				viewChairId = gameMgr.switchViewChairID(slot14, gameMgr),
				name = slot0.model.getMyTableUserDatasDic(gameMgr)[gameMgr.switchViewChairID(slot14, gameMgr)].szNickName,
				score = slot2.lGameScore[slot12 + 1],
				cellScore = slot2.lCellScore,
				lScore = slot0.model.getMyTableUserDatasDic(gameMgr)[gameMgr.switchViewChairID(slot14, gameMgr)].lScore + slot2.lGameScore[slot12 + 1],
				guan = slot2.cbChuntian[slot12 + 1]
			}

			if slot8 then
				slot15.liuJu = true
			elseif slot2.cbChuntian[slot12 + 1] == 1 then
				slot15.beiGuan = true
			elseif slot2.cbChuntian[slot12 + 1] == 2 then
				slot15.fanGuan = true
			elseif slot2.cbChuntian[slot12 + 1] == 3 then
				slot15.danGuan = true
			elseif slot2.cbChuntian[slot12 + 1] == 4 then
				slot15.shuangGuan = true
			end

			if slot2.wBaoPei == slot12 then
				slot15.baoPei = true
			end

			if slot8 then
				slot15.count = slot2.cbCardCount[slot12 + 1]

				if slot2.lGameScore[slot12 + 1] <= 0 then
					slot15.count = slot2.cbCardCount[slot12 + 1] * -1
				else
					slot19 = slot13

					table.insert(slot17, slot6)
				end
			elseif slot2.cbCardCount[slot12 + 1] > 0 then
				slot15.count = slot2.cbCardCount[slot12 + 1] * -1
				slot7 = slot2.cbCardCount[slot12 + 1] + slot7
			elseif slot2.cbCardCount[slot12 + 1] == 0 then
				slot19 = slot13

				table.insert(slot17, slot6)
			end

			slot5[slot13] = slot15
		end

		if not slot8 then
			slot5[slot6[1]].count = slot7
		end

		slot12 = slot6

		slot0.model.setWinnerViewId(slot10, slot0.model)

		slot12 = slot5

		slot0.model.setCurResultInfoDic(slot10, slot0.model)
		slot0.model.setLockViewDic(slot10, slot0.model)

		slot11 = slot0.model.stateViewDicChangedSignal

		slot0.model.stateViewDicChangedSignal.emit(slot10)

		slot9 = 0
		slot13 = Hero

		if slot2.cbChuntian[Hero.getWChairID(nil)] == 1 then
			slot9 = 1500
		end

		slot12 = slot0.model

		if slot0.model.getOutCardInfo(slot11) and slot10.ct and slot0.model._ctSpineDelay[slot10.ct] then
			slot9 = slot9 + slot0.model._ctSpineDelay[slot10.ct] * 1000
		end

		slot17 = slot9 + 500

		slot0.startEventTick(slot13, slot0, slot11, "PdkController:onSubGameEnd1")

		slot15 = 0

		audioMgr.holdVolume(slot13, audioMgr)

		slot15 = PDK_VIEW_CHAIRID_ME

		if slot0.isRoundWinner(slot13, slot0) then
			slot15 = "bgm/bgm_win.mp3"

			slot0.playGameEffect(slot13, slot0)
		else
			slot15 = "bgm/bgm_lose.mp3"

			slot0.playGameEffect(slot13, slot0)
		end

		slot18 = 4000

		slot0.startEventTick(slot14, slot0, slot12, "PdkController:onSubGameEnd2")

		slot16 = slot2.lCellScore

		slot0.model.setLCellScore(slot14, slot0.model)
	end
end

PdkController.onSubTrusTee = function (slot0, slot1)
	slot6 = "PDK_CMD_S_TRUSTEE"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "PDK_CMD_S_TRUSTEE"
		slot5 = "消息下发:有人进行托管操作"

		trace(ffiMgr)

		slot5 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		trace_r(ffiMgr)

		slot5 = slot0

		slot0.lockUpViewDic(ffiMgr)

		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wTrusteeUser
		slot0.model.getAutoDic(gameMgr) or {}[gameMgr.switchViewChairID(ffiMgr, gameMgr)] = slot2.bTrustee == 1
		slot9 = true

		slot0.model.setAutoDic(slot0.model, slot0.model, slot0.model.getAutoDic(gameMgr) or )

		slot8 = nil

		slot0.model.setLockViewDic(slot0.model, slot0.model)

		slot7 = slot0.model.stateViewDicChangedSignal

		slot0.model.stateViewDicChangedSignal.emit(slot0.model)
	end
end

PdkController.onSubAndroidCard = function (slot0, slot1)
	slot6 = "PDK_CMD_S_AndroidCard"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "PDK_CMD_S_AndroidCard"
		slot5 = "明牌数据下发"

		print(ffiMgr)
		print_r(ffiMgr)

		slot3 = {}
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).cbHandCardCount

		for slot7, slot8 in pairs(slot2) do
			slot12 = slot7 - 1
			slot3[slot0.switchViewId(slot10, slot0)] = {}

			for slot13 = 1, slot8, 1 do
				slot17 = slot2.cbHandCard[slot7][slot13]

				table.insert(slot15, slot3[slot9])
			end
		end

		slot7 = slot3

		slot0.model.setAndroidCards(slot5, slot0.model)
	end
end

return
