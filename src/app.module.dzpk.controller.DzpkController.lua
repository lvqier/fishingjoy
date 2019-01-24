slot2 = "DzpkController"
DzpkController = class(slot1)
slot2 = "dzpk.controller.DzpkController_Logic"

requireLuaFromModule(slot1)

slot2 = "dzpk.controller.DzpkController_sound"

requireLuaFromModule(slot1)

slot2 = "dzpk.controller.DzpkController_state"

requireLuaFromModule(slot1)

slot2 = "dzpk.controller.DzpkController_request"

requireLuaFromModule(slot1)

slot2 = "dzpk.controller.DzpkController_match"

requireLuaFromModule(slot1)

DzpkController.ctor = function (slot0, slot1)
	slot0.model = slot1
	slot5 = BaseGameController

	ClassUtil.extends(slot3, slot0)

	slot5 = TickBase

	ClassUtil.extends(slot3, slot0)

	slot4 = slot0

	slot0.initSound(slot3)

	slot8 = "plist_dzpk_font.plist"
	slot6 = true

	resMgr.loadTextureAtlas(slot3, resMgr, slot0.getSpriteSheetPath(slot6, slot0))

	slot5 = {
		onX = 124,
		offX = 44
	}

	slot0.model.setSwitchStatePos(slot3, slot0.model)

	slot6 = slot0

	slot0.model.playerCdChangedSignal.add(slot3, slot0.model.playerCdChangedSignal, slot0.onPlayerCd)

	slot6 = slot0

	slot0.model.gameStateChangedSignal.add(slot3, slot0.model.gameStateChangedSignal, slot0.onChangeGameState)
end

DzpkController.registerListeners = function (slot0)
	slot3 = "============DzpkController:registerListeners================"

	print(slot2)

	slot3 = slot0

	BaseGameController.registerListeners(slot2)
end

DzpkController.canceledListeners = function (slot0)
	slot3 = "============DzpkController:canceledListeners================"

	print(slot2)

	slot3 = slot0

	BaseGameController.canceledListeners(slot2)

	slot3 = slot0

	slot0.clearCd(slot2)

	slot3 = slot0

	slot0.stopTick(slot2)

	slot4 = false

	slot0.model.setMePlaying(slot2, slot0.model)
end

DzpkController.isChair = function (slot0, slot1)
	if slot1 == nil then
		return false
	end

	return slot1 > 0 and slot1 < 7
end

DzpkController.tick = function (slot0)
	slot3 = slot0.model

	if slot0.model.getDoAction(slot2) == false then
		slot3 = slot0

		slot0.handleCommand(slot2)
	end
end

DzpkController.onPlayerCd = function (slot0)
	slot3 = slot0

	slot0.clearCd(slot2)

	slot3 = slot0.model

	function slot3()
		slot2 = slot0.model

		if slot0.model.getMePlaying(slot1) and slot1 <= 8 then
			slot3 = TIME_WARIMG_SOUNDRES

			slot0.playGameEffect(slot1, slot0)
		end

		if slot1 <= -2 then
			slot2 = slot0.model

			if slot0.model.getMePlaying(slot1) then
				slot2 = slot0.model

				if slot0.model.getGameState(slot1) == GAME_STATUS_PLAY then
					slot2 = slot0

					slot0.clearCd(slot1)
				end
			end
		elseif slot1 <= 0 then
			slot2 = slot0.model

			if slot0.model.getGameState(slot1) == GAME_STATUS_FREE then
				slot3 = slot0.model

				if slot0.model.getGameModel(slot0.model) == GAMEMODEL_COMPETITION then
					slot3 = slot0.model

					if slot0.model.getEndUpdateMatchInfo(slot2) ~= nil and slot0[1] ~= nil then
						slot5 = slot0.model

						if slot0[1].lScore < slot0.model.getEndUpdateMatchInfo(slot3).lBigBlind + slot0.model.getEndUpdateMatchInfo(slot0.model).lAnte then
							slot3 = slot0.model

							if slot0.model.getScoreByBuy(slot2) <= 0 then
								slot4 = true

								slot0.model.setNeedToBuy(slot2, slot0.model)

								slot3 = slot0

								slot0.gotoChooseBuyOrNot(slot2)
							end
						end
					end
				end

				slot3 = slot0

				slot0.clearCd(slot2)

				slot3 = slot0

				slot0.reqReady(slot2)
			end
		else
			slot1 = slot1 - 1
		end
	end

	if slot0.model.getPlayerCd(slot2) > 0 then
		slot6 = slot0.model.getTimer(slot7)
		slot12 = slot1

		table.insert(slot5, tickMgr.delayedCall(slot0.model, tickMgr, slot3, 1000))
	end
end

DzpkController.clearCd = function (slot0)
	slot5 = slot0.model

	for slot4, slot5 in ipairs(slot0.model.getTimer(slot4)) do
		slot8 = slot5

		slot5.stop(slot7)

		slot8 = slot5

		slot5.destroy(slot7)

		slot5 = nil
	end

	slot4 = {}

	slot0.model.setTimer(slot2, slot0.model)
end

DzpkController.onChangeGameState = function (slot0)
	slot4 = "-=========================游戏状态" .. slot0.model.getGameState(slot2)

	print(slot0.model)

	if slot0.model.getGameState(slot2) == GAME_STATUS_FREE then
		slot4 = slot0.model
		slot2 = slot0.model.getMyTableUserData(slot3)
		slot3 = false
		slot8 = slot0.model

		for slot7, slot8 in pairs(slot0.model.getMyTableUserData(slot7)) do
			if slot8.cbUserStatus == US_OFFLINE then
				slot2[slot7] = nil
				slot3 = true
			end
		end

		if slot3 then
			slot6 = slot0.model.myTableUserDataChangedSignal

			slot0.model.myTableUserDataChangedSignal.emit(slot5)
		end

		slot6 = slot0

		slot0.reset(slot5)

		slot6 = slot0.model

		if slot0.model.getGameModel(slot5) == GAMEMODEL_COMPETITION then
			slot6 = slot0.model

			if slot0.model.getEndUpdateMatchInfo(slot5) ~= nil and slot2[1] ~= nil then
				slot8 = slot0.model

				if slot2[1].lScore < slot0.model.getEndUpdateMatchInfo(slot6).lBigBlind + slot0.model.getEndUpdateMatchInfo(slot0.model).lAnte then
					slot6 = slot0.model

					if slot0.model.getScoreByBuy(slot5) <= 0 then
						slot9 = true

						slot0.model.setPlayerCd(slot5, slot0.model, 1, true)
					end
				end
			else
				slot9 = true

				slot0.model.setPlayerCd(slot5, slot0.model, Dzpk_READY_TIME, true)
			end
		else
			slot9 = true

			slot0.model.setPlayerCd(slot5, slot0.model, Dzpk_READY_TIME, true)
		end

		slot6 = slot0.model.playerCdChangedSignal

		slot0.model.playerCdChangedSignal.emit(slot5)

		slot9 = true

		slot0.model.setIsSendDeskPukeFinish(slot5, slot0.model, false, true)
	end
end

DzpkController.onGameMessage = function (slot0, slot1, slot2)
	if slot2 == Dzpk_SUB_S_GAME_START_PREFLOP then
		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)

		slot6 = 5

		slot0.startTick(slot4, slot0)

		slot6 = false

		slot0.model.setNeedToBuy(slot4, slot0.model)

		slot6 = slot1

		slot0.onSubGameStart(slot4, slot0)
	elseif slot2 == Dzpk_SUB_S_GAME_GAME_ROUND then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == Dzpk_SUB_S_GAME_END then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == Dzpk_SUB_S_PLAYER_ROUND then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == Dzpk_SUB_S_RAISE then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == Dzpk_SUB_S_CALL then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == Dzpk_SUB_S_FOLD then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == Dzpk_SUB_S_CHECK then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == Dzpk_SUB_S_ALLIN then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == Dzpk_SUB_S_SEND_ALL_CARD then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == Dzpk_SUB_S_UPDATE_USER_SCORE then
		slot6 = slot1

		slot0.onReceiveUpdateUserScore(slot4, slot0)
	end
end

DzpkController.onGameSceneByServer = function (slot0, slot1)
	slot4 = "========DzpkController:onGameSceneByServer=========="

	print(slot3)

	slot8 = GAME_STATUS_FREE

	print(gameMgr, "GameScene游戏状态是", gameMgr.getGameStatus(slot3), GAME_STATUS_PLAY)

	if gameMgr.getGameStatus(slot3) == GAME_STATUS_FREE then
		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)

		slot5 = slot0

		slot0.stopTick(slot4)

		slot6 = slot1

		slot0.onSubGameFree(slot4, slot0)

		slot5 = slot0

		slot0.onChangeGameState(slot4)
	elseif slot2 == Dzpk_GS_TK_FLOP or slot2 == Dzpk_GS_TK_PREFLOP or slot2 == Dzpk_GS_TK_TURN or slot2 == Dzpk_GS_TK_RIVER then
		slot6 = true

		slot0.model.setDoAction(slot4, slot0.model)

		slot5 = slot0

		slot0.stopTick(slot4)

		slot6 = false

		slot0.model.setNeedToBuy(slot4, slot0.model)

		slot6 = slot1

		slot0.onSubGamePlay(slot4, slot0)

		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)

		slot6 = 5

		slot0.startTick(slot4, slot0)
	elseif slot2 == Dzpk_GS_TK_RIVER then
		slot6 = slot1

		slot0.OnSubGameEnd(slot4, slot0)
	else
		slot6 = slot2

		print(slot4, "GameScene游戏状态是")
	end
end

DzpkController.putIntoList = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if slot0.model.getHandleList(slot4) == nil then
		slot3 = {}
	end

	slot7 = {
		type = slot1,
		data = slot2
	}

	table.insert(slot5, slot3)

	slot7 = slot3

	slot0.model.setHandleList(slot5, slot0.model)
end

DzpkController.handleCommand = function (slot0)
	slot3 = slot0.model

	if slot0.model.getHandleList(slot2) then
		if #slot1 > 0 and slot1[1] ~= nil then
			slot6 = true

			slot0.model.setDoAction(slot4, slot0.model)

			slot7 = slot2.data

			slot0.run(slot4, slot0, slot2.type)

			slot6 = 1

			table.remove(slot4, slot1)

			slot5 = "命令个数S:" .. #slot1

			print(slot4)
		end

		slot5 = slot1

		slot0.model.setHandleList(slot3, slot0.model)
	end
end

DzpkController.run = function (slot0, slot1, slot2)
	if slot1 == Dzpk_SUB_S_GAME_GAME_ROUND then
		slot6 = slot2

		slot0.onSubGameFlop(slot4, slot0)
	elseif slot1 == Dzpk_SUB_S_GAME_END then
		slot6 = slot2

		slot0.onSubGameEnd(slot4, slot0)
	elseif slot1 == Dzpk_SUB_S_PLAYER_ROUND then
		slot6 = slot2

		slot0.onReceivePlayer(slot4, slot0)

		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)
	elseif slot1 == Dzpk_SUB_S_RAISE then
		slot6 = slot2

		slot0.onReceiveAddScore(slot4, slot0)

		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)
	elseif slot1 == Dzpk_SUB_S_CALL then
		slot6 = slot2

		slot0.onReceiveFollow(slot4, slot0)

		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)
	elseif slot1 == Dzpk_SUB_S_FOLD then
		slot6 = slot2

		slot0.onReceiveGiveUp(slot4, slot0)
	elseif slot1 == Dzpk_SUB_S_CHECK then
		slot6 = slot2

		slot0.onReceivePass(slot4, slot0)

		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)
	elseif slot1 == Dzpk_SUB_S_ALLIN then
		slot6 = slot2

		slot0.onReceiveAllin(slot4, slot0)

		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)
	elseif slot1 == Dzpk_SUB_S_SEND_ALL_CARD then
		slot6 = slot2

		slot0.onReceiveAllinCard(slot4, slot0)
	end
end

DzpkController.onSubGameStart = function (slot0, slot1)
	slot6 = "DZPK_CMD_S_GameStartPreflop"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_GameStartPreflop"
		slot5 = slot0

		slot0.reset(ffiMgr)

		slot6 = 0

		slot0.model.setScoreByBuy(ffiMgr, slot0.model)

		slot5 = slot0.model
		slot8 = Hero

		slot0.model.setMeWChairID(ffiMgr, Hero.getWChairID(slot7))

		slot6 = 65535

		if numberEqual(ffiMgr, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wCurrentUser) then
			slot6 = -1

			slot0.model.setWCurrentUser(slot4, slot0.model)
		else
			slot5 = slot0.model
			slot10 = Dzpk_GAME_PLAYER
			slot13 = slot0.model

			slot0.model.setWCurrentUser(slot4, gameMgr.switchViewChairID(slot7, gameMgr, slot2.wCurrentUser, slot0.model.getMeWChairID(slot12)))
		end

		slot5 = slot0.model
		slot10 = Dzpk_GAME_PLAYER
		slot13 = slot0.model

		slot0.model.setWBankerUser(slot4, gameMgr.switchViewChairID(slot7, gameMgr, slot2.wButton, slot0.model.getMeWChairID(slot12)))

		slot6 = slot2

		slot0.model.setWGameStartData(slot4, slot0.model)

		slot7 = true

		slot0.model.setGameState(slot4, slot0.model, GAME_STATUS_PLAY)

		slot3 = {}
		slot4 = 0
		slot5 = nil
		slot6 = 0
		slot9 = slot0.model

		if slot0.model.getLTablePlayerScore(gameMgr) == nil then
			slot7 = {}
		end

		for slot11 = 1, #slot2.cbUserAction, 1 do
			slot16 = Dzpk_GAME_PLAYER
			slot19 = slot0.model

			if slot7[gameMgr.switchViewChairID(slot13, gameMgr, slot11 - 1, slot0.model.getMeWChairID(slot18))] == nil then
				slot7[slot4] = 0
			end

			slot6 = slot6 + slot2.lUserBetScore[slot11]
			slot7[slot4] = slot7[slot4] + slot2.lUserBetScore[slot11]

			if slot2.cbUserAction[slot11] > 0 then
				slot14 = slot0.model

				if slot0.model.getMyTableUserData(slot13)[slot4] ~= nil and slot5.cbUserStatus == US_PLAYING then
					slot12 = {}
					slot15 = slot5

					for slot16, slot17 in pairs(slot14) do
						slot12[slot16] = slot17
						slot12.hasScoreUpdate = nil

						if slot16 == "lScore" then
							slot12.startScore = slot17
						end
					end

					slot15 = slot0.model
					slot0.model.getMyTablePlayingUserData(slot14)[slot4] = slot12
					slot15 = slot0.model
					slot0.model.getTableChair(slot14)[slot4] = 1
					slot15 = slot0.model
					slot0.model.getTableUserID(1)[slot4] = slot5.dwUserID
					slot16 = slot0.model
					slot0.model.getMyTablePlayingUserData(slot5.dwUserID)[slot4].lScore = slot0.model.getMyTablePlayingUserData(slot0.model)[slot4].lScore - slot2.lUserBetScore[slot11]
					slot16 = slot0.model
					slot0.model.getMyTablePlayingUserData(slot0.model.getMyTablePlayingUserData(slot0.model)[slot4].lScore - slot2.lUserBetScore[slot11])[slot4].startScore = slot0.model.getMyTablePlayingUserData(slot0.model)[slot4].lScore
					slot16 = slot0.model

					if slot5.wChairID == slot0.model.getMeWChairID(slot0.model) then
						slot16 = true

						slot0.model.setMePlaying(slot14, slot0.model)
					end

					slot3[slot4] = 1
				else
					slot3[slot4] = 0
				end
			end
		end

		slot11 = slot3

		slot0.model.setCbPlayStatus(slot9, slot0.model)

		slot13 = true

		slot0.model.setLTablePlayerScore(slot9, slot0.model, slot7, true)

		slot8 = {}

		for slot12 = 1, 2, 1 do
			slot16 = slot2.cbCardData[slot12]

			table.insert(slot14, slot8)
		end

		slot12 = slot8

		slot0.model.setCbHandCardData(slot10, slot0.model)

		slot14 = true

		slot0.model.setBigRaise(slot10, slot0.model, slot2.lBigBlind, true)

		slot12 = slot2.lSmallBlind

		slot0.model.setSmallRaise(slot10, slot0.model)

		slot11 = slot0.model.bigRaiseChangedSignal

		slot0.model.bigRaiseChangedSignal.emit(slot10)

		slot11 = slot0

		slot0.getCurrentRaise(slot10)

		slot14 = true

		slot0.model.setGamePool(slot10, slot0.model, slot6, true)

		slot12 = 1

		slot0.model.setGameRound(slot10, slot0.model)

		slot12 = slot2.wRaiseCount

		slot0.model.setRaiseRound(slot10, slot0.model)

		slot13 = true

		slot0.model.dispathEvent(slot10, slot0.model, Dzpk_EVENT_GAME_START)
	end
end

DzpkController.onSubGameFlop = function (slot0, slot1)
	slot6 = "DZPK_CMD_S_GameRound"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_GameRound"
		slot3 = slot0.model.getDeskCardData(ffiMgr)
		slot7 = false

		slot0.model.setIsMePlaying(slot0.model, slot0.model)

		slot7 = 0

		slot0.model.setCurrentRaiseScore(slot0.model, slot0.model)

		if ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).cbStatus == Dzpk_GS_TK_FLOP then
			slot3[1] = slot2.cbCardData[1][3]
			slot3[2] = slot2.cbCardData[1][4]
			slot3[3] = slot2.cbCardData[1][5]
		elseif slot2.cbStatus == Dzpk_GS_TK_TURN then
			slot3[4] = slot2.cbCardData[1][6]
		elseif slot2.cbStatus == Dzpk_GS_TK_RIVER then
			slot3[5] = slot2.cbCardData[1][7]
		end

		slot7 = slot3

		slot0.model.setDeskCardData(slot5, slot0.model)

		slot7 = 65535

		if numberEqual(slot5, slot2.wNextUser) then
			slot7 = -1

			slot0.model.setWCurrentUser(slot5, slot0.model)
		else
			slot6 = slot0.model
			slot11 = Dzpk_GAME_PLAYER
			slot14 = slot0.model

			slot0.model.setWCurrentUser(slot5, gameMgr.switchViewChairID(slot8, gameMgr, slot2.wNextUser, slot0.model.getMeWChairID(slot13)))
		end

		slot4 = {}

		for slot8 = 1, Dzpk_GAME_PLAYER, 1 do
			if slot2.lMainSidePot[slot8] > 0 then
				slot12 = slot2.lMainSidePot[slot8]

				table.insert(slot10, slot4)
			end
		end

		slot10 = slot0.model
		slot8 = slot0.model.getGameRound(slot9) + 1

		slot0.model.setGameRound(slot6, slot0.model)

		slot8 = slot4

		slot0.model.setDeskSidePotData(slot6, slot0.model)

		slot8 = slot2

		slot0.model.setWGameFlopData(slot6, slot0.model)

		slot7 = slot0

		slot0.getCurrentRaise(slot6)

		slot7 = "==================DzpkController:onSubGameFlop========================"

		print(slot6)

		slot9 = true

		slot0.model.dispathEvent(slot6, slot0.model, Dzpk_EVENT_GAME_ROUND)
	end
end

DzpkController.onSubGameEnd = function (slot0, slot1)
	slot6 = "DZPK_CMD_S_GameEnd"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_GameEnd"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot5 = slot0

		slot0.clearCd(ffiMgr)

		slot6 = false

		slot0.model.setIsMePlaying(ffiMgr, slot0.model)

		slot6 = {}

		slot0.model.setEndWinnerTable(ffiMgr, slot0.model)

		slot3 = {
			0,
			0,
			0,
			0,
			0,
			0
		}
		slot4 = {}
		slot5 = {}
		slot6 = 0
		slot7 = {}
		slot8 = {}

		for slot12 = 1, 6, 1 do
			if slot2.lMainSidePot[slot12] > 0 then
				slot6 = slot6 + 1
				slot16 = slot2.lMainSidePot[slot12]

				table.insert(slot14, slot8)
			end
		end

		for slot12 = 1, slot6, 1 do
			slot17 = {}

			table.insert(slot15, slot4)

			for slot17 = 1, #slot2.wWinner[slot12], 1 do
				if slot2.wWinner[slot12][slot17] == 1 then
					if slot3[slot17] == 0 then
						slot3[slot17] = 1
						slot20 = slot13
						slot25 = Dzpk_GAME_PLAYER
						slot28 = slot0.model

						table.insert(slot19, gameMgr.switchViewChairID(slot22, gameMgr, slot17 - 1, slot0.model.getMeWChairID(slot27)))

						slot22 = Dzpk_GAME_PLAYER
						slot25 = slot0.model
						slot5[gameMgr.switchViewChairID(slot19, gameMgr, slot17 - 1, slot0.model.getMeWChairID(slot17 - 1))] = 1
					end

					slot22 = Dzpk_GAME_PLAYER
					slot25 = slot0.model

					if slot7[gameMgr.switchViewChairID(slot19, gameMgr, slot17 - 1, slot0.model.getMeWChairID(slot24))] == nil then
						slot22 = Dzpk_GAME_PLAYER
						slot25 = slot0.model
						slot7[gameMgr.switchViewChairID(slot19, gameMgr, slot17 - 1, slot0.model.getMeWChairID(slot24))] = {}
					end

					slot24 = Dzpk_GAME_PLAYER
					slot27 = slot0.model
					slot21 = slot12

					table.insert(slot19, slot7[gameMgr.switchViewChairID(slot21, gameMgr, slot17 - 1, slot0.model.getMeWChairID(slot26))])
				end
			end
		end

		slot9 = {}
		slot10 = {}
		slot11 = {}
		slot12 = {}

		for slot16 = 1, #slot2.cbUserAction, 1 do
			if slot2.cbUserAction[slot16] ~= 0 then
				slot21 = Dzpk_GAME_PLAYER
				slot24 = slot0.model
				slot9[gameMgr.switchViewChairID(slot18, gameMgr, slot16 - 1, slot0.model.getMeWChairID(slot23))] = slot2.cbCardData[slot16]
				slot21 = Dzpk_GAME_PLAYER
				slot24 = slot0.model
				slot10[gameMgr.switchViewChairID(slot2.cbCardData[slot16], gameMgr, slot16 - 1, slot0.model.getMeWChairID(slot23))] = slot2.cbBiggestCardData[slot16]

				if slot2.lUserWinScore[slot16] < 0 then
					slot21 = Dzpk_GAME_PLAYER
					slot24 = slot0.model
					slot12[gameMgr.switchViewChairID(slot18, gameMgr, slot16 - 1, slot0.model.getMeWChairID(slot23))] = 1
				end
			end

			if slot2.lUserWinScore[slot16] > 0 then
				slot21 = Dzpk_GAME_PLAYER
				slot24 = slot0.model
				slot11[gameMgr.switchViewChairID(slot18, gameMgr, slot16 - 1, slot0.model.getMeWChairID(slot23))] = slot2.lUserWinScore[slot16]
			end
		end

		slot2.lUserWinScore = slot11
		slot2.cbCardData = slot9
		slot16 = slot8

		slot0.model.setDeskSidePotData(slot14, slot0.model)

		slot18 = true

		slot0.model.setUpdatePlayer2Side(slot14, slot0.model, slot7, true)

		slot15 = slot0.model.updatePlayer2SideChangedSignal

		slot0.model.updatePlayer2SideChangedSignal.emit(slot14)

		slot16 = slot12

		slot0.model.setLosePlayer(slot14, slot0.model)

		slot16 = slot10

		slot0.model.setGameEndShowCard(slot14, slot0.model)

		slot16 = slot5

		slot0.model.setWinerList(slot14, slot0.model)

		slot16 = slot4

		slot0.model.setEndWinnerTable(slot14, slot0.model)

		slot16 = slot2

		slot0.model.setWGameEndData(slot14, slot0.model)

		slot15 = "==================DzpkController:onSubGameEnd========================"

		print(slot14)

		slot17 = true

		slot0.model.dispathEvent(slot14, slot0.model, Dzpk_EVENT_GAME_END)
	end
end

DzpkController.onSubGameFree = function (slot0, slot1)
	slot6 = "DZPK_CMD_S_Status"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_Status"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot6 = slot2.lPot

		slot0.model.setGamePool(ffiMgr, slot0.model)

		slot7 = true

		slot0.model.setBigRaise(ffiMgr, slot0.model, slot2.lBigBlind)

		slot6 = slot2.lSmallBlind

		slot0.model.setSmallRaise(ffiMgr, slot0.model)

		slot6 = slot2.wRaiseCount

		slot0.model.setRaiseRound(ffiMgr, slot0.model)

		slot6 = slot2.lAnte

		slot0.model.setLAnteBXC(ffiMgr, slot0.model)
	end

	slot6 = true

	slot0.model.setGameState(slot3, slot0.model, GAME_STATUS_FREE)

	slot6 = true

	slot0.model.dispathEvent(slot3, slot0.model, Dzpk_EVENT_GAME_FREE)
end

DzpkController.onSubGamePlay = function (slot0, slot1)
	slot6 = "DZPK_CMD_S_Status"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot4 = slot0

		slot0.reset(slot3)

		slot5 = nil

		slot0.model.setZengGouInfo(slot3, slot0.model)

		slot4 = slot0.model
		slot7 = Hero

		slot0.model.setMeWChairID(slot3, Hero.getWChairID(slot6))

		slot6 = true

		slot0.model.setGameState(slot3, slot0.model, GAME_STATUS_PLAY)

		slot6 = "DZPK_CMD_S_Status"
		slot6 = 65535

		if numberEqual(ffiMgr, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wCurrentUser) then
			slot6 = -1

			slot0.model.setWCurrentUser(slot4, slot0.model)
		else
			slot5 = slot0.model
			slot10 = Dzpk_GAME_PLAYER
			slot13 = slot0.model

			slot0.model.setWCurrentUser(slot4, gameMgr.switchViewChairID(slot7, gameMgr, slot2.wCurrentUser, slot0.model.getMeWChairID(slot12)))
		end

		slot5 = slot0.model
		slot10 = Dzpk_GAME_PLAYER
		slot13 = slot0.model

		slot0.model.setWBankerUser(slot4, gameMgr.switchViewChairID(slot7, gameMgr, slot2.wButton, slot0.model.getMeWChairID(slot12)))

		slot6 = slot2.lPot

		slot0.model.setGamePool(slot4, slot0.model)

		slot7 = true

		slot0.model.setBigRaise(slot4, slot0.model, slot2.lBigBlind)

		slot6 = slot2.lSmallBlind

		slot0.model.setSmallRaise(slot4, slot0.model)

		slot6 = slot2.wRaiseCount

		slot0.model.setRaiseRound(slot4, slot0.model)

		slot6 = slot2.lAnte

		slot0.model.setLAnteBXC(slot4, slot0.model)

		slot3 = {}
		slot4 = 0
		slot5 = {}
		slot6 = {}
		slot7 = {}
		slot10 = slot0.model

		if slot0.model.getLTablePlayerScore(slot2.wButton) == nil then
			slot8 = {}
		end

		slot9 = false

		for slot13 = 1, Dzpk_GAME_PLAYER, 1 do
			slot18 = Dzpk_GAME_PLAYER
			slot21 = slot0.model
			slot3[gameMgr.switchViewChairID(slot15, gameMgr, slot13 - 1, slot0.model.getMeWChairID(slot20))] = slot2.cbUserAction[slot13]

			if slot3[gameMgr.switchViewChairID(slot15, gameMgr, slot13 - 1, slot0.model.getMeWChairID(slot20))] ~= 0 then
				slot16 = slot0.model

				if slot0.model.getMyTableUserData(slot15)[slot4] ~= nil then
					slot15 = {}
					slot18 = slot14

					for slot19, slot20 in pairs(slot17) do
						slot15[slot19] = slot20
						slot15.hasScoreUpdate = nil

						if slot19 == "lScore" then
							slot15.startScore = slot20
						end
					end

					slot18 = slot0.model
					slot0.model.getMyTablePlayingUserData(slot17)[slot4] = slot15
					slot19 = slot0.model
					slot0.model.getMyTablePlayingUserData(slot17)[slot4].lScore = slot0.model.getMyTablePlayingUserData(slot0.model)[slot4].lScore - slot2.lUserTotalBetScore[slot13]
					slot19 = slot0.model
					slot0.model.getMyTablePlayingUserData(slot0.model.getMyTablePlayingUserData(slot0.model)[slot4].lScore - slot2.lUserTotalBetScore[slot13])[slot4].startScore = slot0.model.getMyTablePlayingUserData(slot0.model)[slot4].lScore
					slot19 = slot0.model
					slot0.model.getTableUserID(slot0.model.getMyTablePlayingUserData(slot0.model)[slot4].lScore)[slot4] = slot0.model.getMyTablePlayingUserData(slot0.model)[slot4].dwUserID
					slot18 = slot0.model
					slot0.model.getTableChair(slot0.model.getMyTablePlayingUserData(slot0.model)[slot4].dwUserID)[slot4] = 1
					slot18 = slot0.model
					slot0.model.getLTablePlayerTotalScore(1)[slot4] = slot2.lUserTotalBetScore[slot13]
				end

				slot8[slot4] = slot2.lUserBetScore[slot13]

				if slot2.lMainSidePot[slot13] > 0 then
					slot18 = slot2.lMainSidePot[slot13]

					table.insert(slot16, slot5)
				end

				if slot4 == 1 and slot2.cbUserAction[slot13] ~= Dzpk_ACTION_FOLD then
					slot18 = true

					slot0.model.setMePlaying(slot16, slot0.model)

					slot18 = -slot2.lUserTotalBetScore[slot13]

					Hero.addUserFakeScore(slot16, Hero)

					for slot18 = 1, 2, 1 do
						slot22 = slot2.cbHandCardData[slot13][slot18]

						table.insert(slot20, slot6)
					end
				end

				if not slot9 then
					slot9 = true

					for slot18 = 3, 7, 1 do
						if slot2.cbHandCardData[slot13][slot18] > 0 then
							slot22 = slot2.cbHandCardData[slot13][slot18]

							table.insert(slot20, slot7)
						end
					end
				end
			end
		end

		slot13 = slot3

		slot0.model.setCbPlayStatus(slot11, slot0.model)

		slot15 = true

		slot0.model.setLTablePlayerScore(slot11, slot0.model, slot8, true)

		slot13 = slot5

		slot0.model.setDeskSidePotData(slot11, slot0.model)

		slot13 = slot6

		slot0.model.setCbHandCardData(slot11, slot0.model)

		slot13 = slot7

		slot0.model.setDeskCardData(slot11, slot0.model)

		slot13 = #slot7

		slot0.model.setCurrentShowIndex(slot11, slot0.model)

		slot12 = slot0

		slot0.getCurrentRaise(slot11)

		slot13 = slot2

		slot0.model.setWGameSceneData(slot11, slot0.model)

		slot12 = "=============DzpkController:onSubGamePlay==================="

		print(slot11)

		slot14 = true

		slot0.model.dispathEvent(slot11, slot0.model, Dzpk_EVENT_PLAY)
	end
end

DzpkController.onReceiveScore = function (slot0, slot1)
	slot4 = "=============DzpkController:onReceiveScore 收到下注============="

	print(slot3)

	slot6 = "DZPK_CMD_S_Bet"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_Bet"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot5 = slot0.model

		if slot0.model.getLTablePlayerScore(ffiMgr) == nil then
			slot3 = {}
		end

		slot8 = Dzpk_GAME_PLAYER
		slot11 = slot0.model

		if slot3[gameMgr.switchViewChairID(slot5, gameMgr, slot2.wChairID, slot0.model.getMeWChairID(slot10))] == nil then
			slot3[slot4] = 0
		end

		slot3[slot4] = slot3[slot4] + slot2.lScore
		slot8 = slot2.lScore

		slot0.model.setCurrentRaiseScore(slot2.lScore, slot0.model)

		slot10 = true

		slot0.model.setLTablePlayerScore(slot2.lScore, slot0.model, slot3, true)

		slot8 = slot4

		slot0.model.setWLastUser(slot2.lScore, slot0.model)

		slot8 = 65535

		if numberEqual(slot2.lScore, slot2.wNextUser) then
			slot8 = -1

			slot0.model.setWCurrentUser(slot6, slot0.model)
		else
			slot7 = slot0.model
			slot12 = Dzpk_GAME_PLAYER
			slot15 = slot0.model

			slot0.model.setWCurrentUser(slot6, gameMgr.switchViewChairID(slot9, gameMgr, slot2.wNextUser, slot0.model.getMeWChairID(slot14)))
		end

		slot10 = slot0.model
		slot8 = slot0.model.getGamePool(slot9) + slot2.lScore

		slot0.model.setGamePool(slot6, slot0.model)

		slot7 = slot0

		slot0.getCurrentRaise(slot6)

		slot8 = "下注:"

		dump(slot6, slot2)

		slot9 = true

		slot0.model.dispathEvent(slot6, slot0.model, Dzpk_EVENT_BET)
	end
end

DzpkController.onReceiveAddScore = function (slot0, slot1)
	slot4 = "=============DzpkController:onReceiveAddScore============="

	print(slot3)

	slot6 = "DZPK_CMD_S_Raise"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_Raise"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot5 = slot0.model

		if slot0.model.getLTablePlayerScore(ffiMgr) == nil then
			slot3 = {}
		end

		slot8 = Dzpk_GAME_PLAYER
		slot11 = slot0.model

		if slot3[gameMgr.switchViewChairID(slot5, gameMgr, slot2.wChairID, slot0.model.getMeWChairID(slot10))] == nil then
			slot3[slot4] = 0
		end

		slot3[slot4] = slot3[slot4] + slot2.lScore
		slot8 = slot2.lScore

		slot0.model.setCurrentRaiseScore(slot2.lScore, slot0.model)

		slot10 = true

		slot0.model.setLTablePlayerScore(slot2.lScore, slot0.model, slot3, true)

		slot8 = slot4

		slot0.model.setWLastUser(slot2.lScore, slot0.model)

		slot8 = 65535

		if numberEqual(slot2.lScore, slot2.wNextUser) then
			slot8 = -1

			slot0.model.setWCurrentUser(slot6, slot0.model)
		else
			slot7 = slot0.model
			slot12 = Dzpk_GAME_PLAYER
			slot15 = slot0.model

			slot0.model.setWCurrentUser(slot6, gameMgr.switchViewChairID(slot9, gameMgr, slot2.wNextUser, slot0.model.getMeWChairID(slot14)))
		end

		slot7 = slot0

		slot0.getCurrentRaise(slot6)

		slot10 = slot0.model
		slot8 = slot0.model.getGamePool(slot9) + slot2.lScore

		slot0.model.setGamePool(slot6, slot0.model)

		slot8 = slot2.wRaiseCount

		slot0.model.setRaiseRound(slot6, slot0.model)
		slot0.model.setWAddBetData(slot6, slot0.model, slot2)

		slot8 = "加注:"

		dump(slot6, slot2)

		slot12 = Dzpk_GAME_PLAYER
		slot15 = slot0.model
		slot10 = 1

		slot0.PlaySound(slot6, slot0, gameMgr.switchViewChairID(true, gameMgr, slot2.wChairID, slot0.model.getMeWChairID(slot14)), 1)

		slot9 = true

		slot0.model.dispathEvent(slot6, slot0.model, Dzpk_EVENT_RAISE)
	end
end

DzpkController.onReceiveFollow = function (slot0, slot1)
	slot4 = "=============DzpkController:onReceiveFollow 收到跟注============="

	print(slot3)

	slot6 = "DZPK_CMD_S_Call"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_Call"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot5 = slot0.model

		if slot0.model.getLTablePlayerScore(ffiMgr) == nil then
			slot3 = {}
		end

		slot8 = Dzpk_GAME_PLAYER
		slot11 = slot0.model

		if slot3[gameMgr.switchViewChairID(slot5, gameMgr, slot2.wChairID, slot0.model.getMeWChairID(slot10))] == nil then
			slot3[slot4] = 0
		end

		slot3[slot4] = slot3[slot4] + slot2.lScore
		slot8 = slot2.lScore

		slot0.model.setCurrentRaiseScore(slot2.lScore, slot0.model)

		slot10 = true

		slot0.model.setLTablePlayerScore(slot2.lScore, slot0.model, slot3, true)

		slot8 = slot4

		slot0.model.setWLastUser(slot2.lScore, slot0.model)

		slot8 = 65535

		if numberEqual(slot2.lScore, slot2.wNextUser) then
			slot8 = -1

			slot0.model.setWCurrentUser(slot6, slot0.model)
		else
			slot7 = slot0.model
			slot12 = Dzpk_GAME_PLAYER
			slot15 = slot0.model

			slot0.model.setWCurrentUser(slot6, gameMgr.switchViewChairID(slot9, gameMgr, slot2.wNextUser, slot0.model.getMeWChairID(slot14)))
		end

		slot8 = slot2

		slot0.model.setWFollowBetData(slot6, slot0.model)

		slot7 = slot0

		slot0.getCurrentRaise(slot6)

		slot10 = slot0.model
		slot8 = slot0.model.getGamePool(slot9) + slot2.lScore

		slot0.model.setGamePool(slot6, slot0.model)

		slot8 = "跟注:"

		dump(slot6, slot2)

		slot12 = Dzpk_GAME_PLAYER
		slot15 = slot0.model
		slot10 = 1

		slot0.PlaySound(slot6, slot0, gameMgr.switchViewChairID(slot2.lScore, gameMgr, slot2.wChairID, slot0.model.getMeWChairID(slot14)), 3)

		slot9 = true

		slot0.model.dispathEvent(slot6, slot0.model, Dzpk_EVENT_CALL)
	end
end

DzpkController.onReceiveAllin = function (slot0, slot1)
	slot4 = "=============DzpkController:onReceiveAllin============="

	print(slot3)

	slot6 = "DZPK_CMD_S_Allin"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_Allin"
		slot6 = 65535

		if numberEqual(ffiMgr, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wNextUser) then
			slot6 = -1

			slot0.model.setWCurrentUser(slot4, slot0.model)
		else
			slot5 = slot0.model
			slot10 = Dzpk_GAME_PLAYER
			slot13 = slot0.model

			slot0.model.setWCurrentUser(slot4, gameMgr.switchViewChairID(slot7, gameMgr, slot2.wNextUser, slot0.model.getMeWChairID(slot12)))
		end

		slot5 = slot0.model

		if slot0.model.getLTablePlayerScore(slot4) == nil then
			slot3 = {}
		end

		slot8 = Dzpk_GAME_PLAYER
		slot11 = slot0.model

		if slot3[gameMgr.switchViewChairID(slot5, gameMgr, slot2.wChairID, slot0.model.getMeWChairID(slot10))] == nil then
			slot3[slot4] = 0
		end

		slot3[slot4] = slot3[slot4] + slot2.lScore
		slot8 = slot2.lScore

		slot0.model.setCurrentRaiseScore(slot2.lScore, slot0.model)

		slot10 = true

		slot0.model.setLTablePlayerScore(slot2.lScore, slot0.model, slot3, true)

		slot8 = slot4

		slot0.model.setWLastUser(slot2.lScore, slot0.model)

		slot7 = slot0.model
		slot0.model.getCbPlayStatus(slot2.lScore)[slot4] = 6
		slot7 = slot0.model

		if slot0.model.getWLastUser(6) == 1 then
			slot8 = true

			slot0.model.setIsAllIn(slot6, slot0.model)
		end

		slot7 = slot0

		slot0.getCurrentRaise(slot6)

		slot10 = slot0.model
		slot8 = slot0.model.getGamePool(slot9) + slot2.lScore

		slot0.model.setGamePool(slot6, slot0.model)

		slot12 = Dzpk_GAME_PLAYER
		slot15 = slot0.model
		slot10 = 1

		slot0.PlaySound(slot6, slot0, gameMgr.switchViewChairID(slot2.lScore, gameMgr, slot2.wChairID, slot0.model.getMeWChairID(slot14)), 2)

		slot8 = "allin:"

		dump(slot6, slot2)

		slot9 = true

		slot0.model.dispathEvent(slot6, slot0.model, Dzpk_EVENT_ALLIN)
	end
end

DzpkController.onReceiveGiveUp = function (slot0, slot1)
	slot6 = "DZPK_CMD_S_Fold"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_Fold"
		slot7 = Dzpk_GAME_PLAYER
		slot10 = slot0.model
		slot7 = gameMgr.switchViewChairID(ffiMgr, gameMgr, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wChairID, slot0.model.getMeWChairID(slot9))

		slot0.model.setWLastUser(gameMgr, slot0.model)

		slot6 = slot0.model

		if slot0.model.getTableUserID(gameMgr)[gameMgr.switchViewChairID(ffiMgr, gameMgr, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wChairID, slot0.model.getMeWChairID(slot9))] ~= nil then
			slot6 = slot0.model
			slot0.model.getTableUserID(slot5)[slot3] = nil
		end

		slot7 = 65535

		if numberEqual(slot5, slot2.wNextUser) then
			slot7 = -1

			slot0.model.setWCurrentUser(slot5, slot0.model)
		else
			slot6 = slot0.model
			slot11 = Dzpk_GAME_PLAYER
			slot14 = slot0.model

			slot0.model.setWCurrentUser(slot5, gameMgr.switchViewChairID(slot8, gameMgr, slot2.wNextUser, slot0.model.getMeWChairID(slot13)))
		end

		slot7 = 0

		slot0.model.setCurrentRaiseScore(slot5, slot0.model)

		slot7 = slot0.model

		if slot2.wChairID == slot0.model.getMeWChairID(slot0.model) then
			slot7 = false

			slot0.model.setMePlaying(slot5, slot0.model)

			slot7 = false

			slot0.model.setIsMePlaying(slot5, slot0.model)
		end

		slot6 = slot0.model
		slot0.model.getCbPlayStatus(slot5)[slot3] = 0
		slot6 = slot0

		slot0.getCurrentRaise(0)

		slot7 = "弃牌:"

		dump(0, slot2)

		slot8 = true

		slot0.model.dispathEvent(0, slot0.model, Dzpk_EVENT_FOLD)
	end
end

DzpkController.onReceivePass = function (slot0, slot1)
	slot6 = "DZPK_CMD_S_Check"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_Check"
		slot7 = Dzpk_GAME_PLAYER
		slot10 = slot0.model
		slot7 = gameMgr.switchViewChairID(ffiMgr, gameMgr, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wChairID, slot0.model.getMeWChairID(slot9))

		slot0.model.setWLastUser(gameMgr, slot0.model)

		slot7 = 65535

		if numberEqual(gameMgr, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wNextUser) then
			slot7 = -1

			slot0.model.setWCurrentUser(slot5, slot0.model)
		else
			slot6 = slot0.model
			slot11 = Dzpk_GAME_PLAYER
			slot14 = slot0.model

			slot0.model.setWCurrentUser(slot5, gameMgr.switchViewChairID(slot8, gameMgr, slot2.wNextUser, slot0.model.getMeWChairID(slot13)))
		end

		slot7 = 0

		slot0.model.setCurrentRaiseScore(slot5, slot0.model)

		slot6 = slot0

		slot0.getCurrentRaise(slot5)

		slot7 = "过牌:"

		dump(slot5, slot2)

		slot8 = true

		slot0.model.dispathEvent(slot5, slot0.model, Dzpk_EVENT_CHECK)
	end
end

DzpkController.onReceivePlayer = function (slot0, slot1)
	slot6 = "DZPK_CMD_S_PlayerRound"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_PlayerRound"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
	end
end

DzpkController.onReceiveAllinCard = function (slot0, slot1)
	slot6 = "DZPK_CMD_S_SendAllCard"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "DZPK_CMD_S_SendAllCard"
		slot6 = true

		slot0.model.setIsAlreadyAllInCard(ffiMgr, slot0.model)

		slot3 = {}

		for slot7 = 3, #ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).cbCardData, 1 do
			if slot2.cbCardData[slot7] > 0 then
				slot11 = slot2.cbCardData[slot7]

				table.insert(slot9, slot3)
			end
		end

		slot9 = slot0.model
		slot7 = slot0.model.getGameRound(slot8) + 1

		slot0.model.setGameRound(slot5, slot0.model)

		slot7 = slot3

		slot0.model.setDeskCardData(slot5, slot0.model)

		slot4 = {}

		for slot8 = 1, Dzpk_GAME_PLAYER, 1 do
			if slot2.lMainSidePot[slot8] > 0 then
				slot12 = slot2.lMainSidePot[slot8]

				table.insert(slot10, slot4)
			end
		end

		slot7 = slot0.model

		if slot0.model.getCurrentShowIndex(slot6) < 3 then
			slot8 = 3

			slot0.model.setAllInCardNum(slot6, slot0.model)
		else
			slot7 = slot0.model
			slot10 = slot0.model

			slot0.model.setAllInCardNum(slot6, slot0.model.getCurrentShowIndex(slot9))
		end

		slot8 = slot4

		slot0.model.setDeskSidePotData(slot6, slot0.model)

		slot9 = true

		slot0.model.dispathEvent(slot6, slot0.model, Dzpk_EVENT_ALLINCAED)
	end
end

DzpkController.onReceiveUpdateUserScore = function (slot0, slot1)
	slot4 = "=================DzpkController:onReceiveUpdateUserScore====================="

	print(slot3)

	slot6 = "DZPK_CMD_S_UpdateUserScore"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot7 = slot0.model

		for slot6, slot7 in pairs(slot0.model.getMyTableUserData("DZPK_CMD_S_UpdateUserScore")) do
			if slot7 ~= nil and slot7.dwUserID == slot2.dwUserID and slot7.wChairID == slot2.wChairID then
				slot10 = slot0.model
				slot0.model.getMyTableUserData(slot9)[slot6].lScore = slot2.lUserScore
				slot10 = slot0.model

				if slot0.model.getMyTablePlayingUserData(slot2.lUserScore)[slot6] ~= nil then
					slot10 = slot0.model

					if slot0.model.getLTablePlayerTotalScore(slot9)[slot6] == nil then
						slot10 = slot0.model
						slot0.model.getMyTablePlayingUserData(slot9)[slot6].lScore = slot2.lUserScore
					else
						slot10 = slot0.model
						slot12 = slot0.model
						slot0.model.getMyTablePlayingUserData(slot9)[slot6].lScore = slot2.lUserScore - slot0.model.getLTablePlayerTotalScore(slot11)[slot6]
					end

					if slot6 == 1 and slot2.lAddedScore > 0 then
						slot14 = slot2.lAddedScore
						slot16 = slot2.lRemainScore
						slot11 = "自动补充" .. tostring(slot13) .. "筹码，当前剩余" .. tostring(slot15) .. "筹码"

						slot0.model.setBuChongTips(slot9, slot0.model)
					end

					if slot2.bGameEnd then
						slot10 = slot0.model
						slot0.model.getMyTablePlayingUserData(slot9)[slot6].hasScoreUpdate = true
					else
						slot11 = slot0.model
						slot0.model.getMyTablePlayingUserData(slot9)[slot6].startScore = slot0.model.getMyTablePlayingUserData(slot0.model)[slot6].lScore
						slot12 = true

						slot0.model.setUpdateSubGamePlay(slot0.model.getMyTablePlayingUserData(slot0.model)[slot6].lScore, slot0.model, true)

						slot10 = slot0.model.updateSubGamePlayChangedSignal

						slot0.model.updateSubGamePlayChangedSignal.emit(slot0.model.getMyTablePlayingUserData(slot0.model)[slot6].lScore)
					end
				end
			end
		end

		slot5 = slot0.model.myTableUserDataChangedSignal

		slot0.model.myTableUserDataChangedSignal.emit(slot4)
	end
end

DzpkController.getCurrentRaise = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot2)[1] ~= nil then
		slot3 = slot0.model

		if not slot0.model.getMePlaying(slot2) then
			return
		end
	end

	slot3 = slot0.model
	slot2 = 0
	slot5 = slot0.model.getLTablePlayerScore(slot2)

	for slot6, slot7 in pairs(slot4) do
		if slot2 < slot7 then
			slot2 = slot7
		end
	end

	if slot1[1] then
		slot5 = slot0.model

		if slot0.model.getMePlaying(slot4) then
			slot6 = slot2 - slot1[1]

			slot0.model.setCurrentRaise(slot4, slot0.model)
		end
	end

	slot5 = slot0.model.currentRaiseChangedSignal

	slot0.model.currentRaiseChangedSignal.emit(slot4)
end

DzpkController.gotoBankOrCharge = function (slot0, slot1, slot2)
	slot6 = slot1

	slot0.model.setBankContentTxt(slot4, slot0.model)

	slot6 = slot2

	slot0.model.setBankNeedReqStandUp(slot4, slot0.model)
end

DzpkController.gotoBankOrChargeA = function (slot0, slot1, slot2)
	slot7 = slot2

	BaseGameController.gotoBankOrCharge(slot4, slot0, slot1)
end

DzpkController.reset = function (slot0)
	slot3 = slot0.model

	if slot0.model.getBuChongTips(slot2) ~= nil then
		slot3 = tweenMsgMgr
		slot6 = slot0.model

		tweenMsgMgr.showGreenMsg(slot2, slot0.model.getBuChongTips(slot5))

		slot4 = nil

		slot0.model.setBuChongTips(slot2, slot0.model)
	end

	slot3 = "===========DzpkController:reset==============="

	print(slot2)

	slot4 = false

	slot0.model.setIsExecute(slot2, slot0.model)

	slot4 = {}

	slot0.model.setHandleList(slot2, slot0.model)

	slot4 = {}

	slot0.model.setCbPlayStatus(slot2, slot0.model)

	slot4 = {}

	slot0.model.setDeskCardData(slot2, slot0.model)

	slot4 = nil

	slot0.model.setCbHandCardData(slot2, slot0.model)

	slot4 = -1

	slot0.model.setWLastUser(slot2, slot0.model)

	slot4 = 0

	slot0.model.setRaiseRound(slot2, slot0.model)

	slot4 = 0

	slot0.model.setCurrentRaise(slot2, slot0.model)

	slot4 = {}

	slot0.model.setEndWinnerTable(slot2, slot0.model)

	slot4 = {}

	slot0.model.setWinerList(slot2, slot0.model)

	slot4 = -1

	slot0.model.setWCurrentUser(slot2, slot0.model)

	slot4 = {}

	slot0.model.setDeskSidePotData(slot2, slot0.model)

	slot4 = -1

	slot0.model.setCurrentShowIndex(slot2, slot0.model)

	slot4 = 0

	slot0.model.setCurrentRaiseScore(slot2, slot0.model)

	slot4 = 0

	slot0.model.setGamePool(slot2, slot0.model)

	slot4 = nil

	slot0.model.setWGameFlopData(slot2, slot0.model)

	slot4 = nil

	slot0.model.setWGameEndData(slot2, slot0.model)

	slot4 = nil

	slot0.model.setWGameStartData(slot2, slot0.model)

	slot4 = nil

	slot0.model.setBankContentTxt(slot2, slot0.model)

	slot4 = nil

	slot0.model.setBankNeedReqStandUp(slot2, slot0.model)

	slot4 = {}

	slot0.model.setMyTablePlayingUserData(slot2, slot0.model)

	slot5 = true

	slot0.model.setTableChair(slot2, slot0.model, {})

	slot5 = true

	slot0.model.setTableUserID(slot2, slot0.model, {})

	slot4 = {}

	slot0.model.setLTablePlayerScore(slot2, slot0.model)

	slot4 = {}

	slot0.model.setLTablePlayerTotalScore(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsSendPukeFinish(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsEndShowPuke(slot2, slot0.model)

	slot6 = true

	slot0.model.setIsSendDeskPukeFinish(slot2, slot0.model, false, true)

	slot4 = false

	slot0.model.setIsHandleEndPuke(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsDeletePot(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowMenu(slot2, slot0.model)

	slot6 = true

	slot0.model.setIsPlayingGiveUpAction(slot2, slot0.model, false, true)

	slot4 = false

	slot0.model.setAutoGiveUp(slot2, slot0.model)

	slot4 = false

	slot0.model.setAutoFollow(slot2, slot0.model)

	slot4 = false

	slot0.model.setAutoPass(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsAllIn(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsAlreadyAllInCard(slot2, slot0.model)

	slot4 = 0

	slot0.model.setAllInCardNum(slot2, slot0.model)

	slot4 = false

	slot0.model.setMePlaying(slot2, slot0.model)

	slot4 = 0

	slot0.model.setGameEndCardType(slot2, slot0.model)

	slot4 = {}

	slot0.model.setGameEndShowCard(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowEffectWin(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowEffectXP(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsMePlaying(slot2, slot0.model)

	slot4 = {}

	slot0.model.setUpdatePlayer2Side(slot2, slot0.model)

	slot4 = {}

	slot0.model.setLosePlayer(slot2, slot0.model)

	slot4 = 0

	slot0.model.setLastShowCardPlayer(slot2, slot0.model)

	slot4 = nil

	slot0.model.setBuChongTips(slot2, slot0.model)

	slot4 = false

	slot0.model.setHasShowPlayerPukeFinish(slot2, slot0.model)

	slot4 = {}

	slot0.model.setPlayerStateList(slot2, slot0.model)
end

DzpkController.hideAllBattleChildrenViews = function (slot0)
	return
end

DzpkController.onBtnChangedClick = function (slot0)
	slot3 = gameMgr
	slot6 = Hero

	if gameMgr.getUserData(slot2, Hero.getDwUserID(slot5)) == nil then
		return
	end

	if slot1.cbUserStatus == US_READY or slot1.cbUserStatus == US_SIT then
		slot0.isChangingTable = true
		slot5 = false

		slot0.model.setIsAuto(slot3, slot0.model)

		slot5 = true

		slot0.model.setIsFirstRound(slot3, slot0.model)

		slot4 = slot0

		slot0.stopCdTimer(slot3)

		slot5 = INVALID_WORD

		reqSitDown(slot3, INVALID_WORD)
	elseif slot1.cbUserStatus == US_FREE then
		slot0.isChangingTable = true
		slot5 = false

		slot0.model.setIsAuto(slot3, slot0.model)

		slot5 = true

		slot0.model.setIsFirstRound(slot3, slot0.model)

		slot4 = slot0

		slot0.stopCdTimer(slot3)

		slot4 = slot0
		slot7 = slot0.model

		slot0.requestEnterRoom(slot3, slot0.model.getGameType(slot6))
	else
		slot5 = slot1.cbUserStatus

		trace(slot3, "德州换桌失败,玩家的状态是:")

		slot5 = "游戏中无法换桌!"

		tweenMsgMgr.showRedMsg(slot3, tweenMsgMgr)
	end
end

DzpkController.resetBattle = function (slot0)
	slot3 = "===================DzpkController:resetBattle==================="

	print(slot2)

	slot6 = true

	slot0.model.setMyTableUserData(slot2, slot0.model, {}, true)

	slot3 = slot0.model.myTableUserDataChangedSignal

	slot0.model.myTableUserDataChangedSignal.emit(slot2)

	slot4 = false

	slot0.model.setNeedToBuy(slot2, slot0.model)

	slot3 = slot0

	slot0.reset(slot2)

	slot3 = slot0

	slot0.hideAllBattleChildrenViews(slot2)

	slot3 = slot0

	slot0.clearCd(slot2)

	slot4 = nil

	slot0.model.setEndUpdateMatchInfo(slot2, slot0.model)

	slot4 = nil

	slot0.model.setOldSmallRaise(slot2, slot0.model)

	slot4 = nil

	slot0.model.setOldBigRaise(slot2, slot0.model)

	slot4 = 0

	slot0.model.setBigRaise(slot2, slot0.model)

	slot4 = 0

	slot0.model.setSmallRaise(slot2, slot0.model)

	slot4 = nil

	slot0.model.setMatchKuangInfo(slot2, slot0.model)

	slot4 = nil

	slot0.model.setMatchInfo(slot2, slot0.model)

	slot4 = nil

	slot0.model.setUpdateMatchInfo(slot2, slot0.model)

	slot4 = nil

	slot0.model.setMatchRewardInfo(slot2, slot0.model)
end

return
