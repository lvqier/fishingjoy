slot2 = "YszController"
YszController = class(slot1)
slot2 = "ysz.controller.YszController_Logic"

requireLuaFromModule(slot1)

YszController.m_gameSoundres = {
	"_ADD.mp3",
	"_ALLIN.mp3",
	"_BIPAI.mp3",
	"_GENPAI.mp3",
	"_KANPAI.mp3",
	"_QIPAI.mp3",
	"_GZYZ.mp3"
}

YszController.ctor = function (slot0, slot1)
	slot0.model = slot1
	slot5 = BaseGameController

	ClassUtil.extends(slot3, slot0)

	slot5 = TickBase

	ClassUtil.extends(slot3, slot0)

	slot8 = "plish_ysz_font.plist"
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

	slot6 = slot0

	slot0.model.compareStartChangedSignal.add(slot3, slot0.model.compareStartChangedSignal, slot0.onChangeCompareStart)
end

YszController.registerListeners = function (slot0)
	slot3 = slot0

	BaseGameController.registerListeners(slot2)
end

YszController.canceledListeners = function (slot0)
	slot3 = slot0

	BaseGameController.canceledListeners(slot2)

	slot4 = false

	slot0.model.setMePlaying(slot2, slot0.model)

	slot3 = slot0

	slot0.stopTick(slot2)
end

YszController.tick = function (slot0)
	slot3 = slot0.model

	if slot0.model.getDoAction(slot2) == false then
		slot3 = slot0

		slot0.handleCommand(slot2)
	end
end

YszController.onPlayerCd = function (slot0)
	slot3 = slot0

	slot0.clearCd(slot2)

	slot3 = slot0.model

	function setf()
		slot2 = slot0.model

		if slot0.model.getMePlaying(slot1) and slot1 <= 8 then
			slot3 = TIME_WARIMG_SOUNDRES

			slot0.playGameEffect(slot1, slot0)

			slot4 = true

			slot0.playGameEffect.model.dispathEvent(slot1, slot0.playGameEffect.model, YSZ_EVENT_GAME_TIME)
		end

		if slot1 <= -2 then
			slot2 = slot0.model

			if slot0.model.getMePlaying(slot1) then
				slot2 = slot0.model

				if slot0.model.getGameState(slot1) == GAME_STATUS_PLAY then
					slot2 = slot0

					slot0.clearCd(slot1)

					slot3 = 12

					slot0.clearCd.reqClientError(slot1, slot0.clearCd)
				end
			end
		elseif slot1 <= 0 then
			slot2 = slot0.model

			if slot0.model.getGameState(slot1) == GAME_STATUS_FREE then
				slot2 = slot0

				slot0.clearCd(slot1)

				slot2 = slot0.clearCd

				slot0.clearCd.reqReady(slot1)
			end
		else
			slot1 = slot1 - 1
		end
	end

	if slot0.model.getPlayerCd(slot2) > 0 then
		slot5 = slot0.model.getTimer(slot6)
		slot11 = slot1

		table.insert(slot4, tickMgr.delayedCall(slot0.model, tickMgr, setf, 1000))
	end
end

YszController.clearCd = function (slot0)
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

YszController.onChangeGameState = function (slot0)
	slot3 = "=========YszController:onChangeGameState============="

	print(slot2)

	slot3 = slot0.model

	if slot0.model.getGameState(slot2) == GAME_STATUS_FREE then
		slot4 = "=========YszController:GAME_STATUS_FREE============="

		print(slot3)

		slot5 = {}

		slot0.model.setHandleList(slot3, slot0.model)

		slot6 = true

		slot0.model.setLTablePlayerScore(slot3, slot0.model, {})

		slot5 = false

		slot0.model.setIsEndShowPuke(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsTwoMan(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsSendPukeFinish(slot3, slot0.model)

		slot4 = slot0

		slot0.clearCd(slot3)

		slot5 = YSZ_READY_TIME

		slot0.model.setPlayerCd(slot3, slot0.model)

		slot4 = slot0.model.playerCdChangedSignal

		slot0.model.playerCdChangedSignal.emit(slot3)

		slot6 = true

		slot0.model.setXzTotalScore(slot3, slot0.model, 0)

		slot5 = 0

		slot0.model.setNLastRounds(slot3, slot0.model)

		slot6 = true

		slot0.model.setNCurRounds(slot3, slot0.model, 0)

		slot6 = true

		slot0.model.setNMaxRounds(slot3, slot0.model, 0)

		slot6 = true

		slot0.model.setLCellScore(slot3, slot0.model, 0)

		slot6 = true

		slot0.model.setAllInScore(slot3, slot0.model, 0)

		slot6 = true

		slot0.model.setCancelWaitCompare(slot3, slot0.model, true)

		slot5 = false

		slot0.model.setIsPlayingAction(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowJettonEndResult(slot3, slot0.model)

		slot5 = false

		slot0.model.setMePlaying(slot3, slot0.model)

		slot5 = nil

		slot0.model.setCbHandCardData(slot3, slot0.model)

		slot5 = false

		slot0.model.setBAllFollow(slot3, slot0.model)

		slot5 = false

		slot0.model.setBMeCompare(slot3, slot0.model)

		slot5 = nil

		slot0.model.setGameEndData(slot3, slot0.model)

		slot5 = nil

		slot0.model.setGiveUpData(slot3, slot0.model)

		slot5 = nil

		slot0.model.setCompareCardData(slot3, slot0.model)

		slot5 = nil

		slot0.model.setWaitCompareData(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsEndShowPuke(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowJettonEndResult(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsPlayingGiveUpAction(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowEffectXP(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowEffectGZYZ(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowEffectWin(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowEffectST(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsAllIn(slot3, slot0.model)

		slot5 = nil

		slot0.model.setBankContentTxt(slot3, slot0.model)

		slot5 = nil

		slot0.model.setBankNeedReqStandUp(slot3, slot0.model)

		slot5 = nil

		slot0.model.setCompareCardNoMoneyData(slot3, slot0.model)

		slot5 = 0

		slot0.model.setCompareCardNoMoneyIndex(slot3, slot0.model)

		slot6 = true

		slot0.model.setTableChair(slot3, slot0.model, {})

		slot6 = true

		slot0.model.setTableUserID(slot3, slot0.model, {})

		slot5 = false

		slot0.model.setShowGameEndPuke(slot3, slot0.model)

		slot5 = false

		slot0.model.setCanShowPuke(slot3, slot0.model)

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
	end
end

YszController.resetBattle = function (slot0)
	slot3 = "=========YszController:resetBattle============="

	trace(slot2)

	slot6 = true

	slot0.model.setCompareStart(slot2, slot0.model, false, true)

	slot3 = slot0.model.compareStartChangedSignal

	slot0.model.compareStartChangedSignal.emit(slot2)

	slot3 = slot0

	slot0.hideAllBattleChildrenViews(slot2)

	slot5 = true

	slot0.model.setMyTablePlayingUserData(slot2, slot0.model, {})

	slot5 = true

	slot0.model.setMyTableUserData(slot2, slot0.model, {})

	slot5 = true

	slot0.model.setLTablePlayerScore(slot2, slot0.model, {})

	slot4 = false

	slot0.model.setMePlaying(slot2, slot0.model)

	slot4 = 0

	slot0.model.setPlayerCd(slot2, slot0.model)

	slot3 = slot0

	slot0.clearCd(slot2)

	slot5 = true

	slot0.model.setBMingZhu(slot2, slot0.model, {})

	slot4 = {}

	slot0.model.setCbPlayStatus(slot2, slot0.model)

	slot4 = 0

	slot0.model.setXzTotalScore(slot2, slot0.model)

	slot4 = 0

	slot0.model.setNLastRounds(slot2, slot0.model)

	slot4 = 0

	slot0.model.setNCurRounds(slot2, slot0.model)

	slot4 = 0

	slot0.model.setNMaxRounds(slot2, slot0.model)

	slot5 = true

	slot0.model.setAllInScore(slot2, slot0.model, 0)

	slot5 = true

	slot0.model.setCancelWaitCompare(slot2, slot0.model, true)

	slot4 = false

	slot0.model.setIsPlayingAction(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowJettonEndResult(slot2, slot0.model)

	slot4 = nil

	slot0.model.setCbHandCardData(slot2, slot0.model)

	slot4 = false

	slot0.model.setBAllFollow(slot2, slot0.model)

	slot4 = false

	slot0.model.setBMeCompare(slot2, slot0.model)

	slot4 = nil

	slot0.model.setGameEndData(slot2, slot0.model)

	slot4 = nil

	slot0.model.setGiveUpData(slot2, slot0.model)

	slot4 = nil

	slot0.model.setCompareCardData(slot2, slot0.model)

	slot4 = nil

	slot0.model.setWaitCompareData(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsEndShowPuke(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowJettonEndResult(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsPlayingGiveUpAction(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowEffectXP(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowEffectGZYZ(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowEffectWin(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowEffectST(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsAllIn(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsTwoMan(slot2, slot0.model)

	slot4 = nil

	slot0.model.setBankContentTxt(slot2, slot0.model)

	slot4 = nil

	slot0.model.setBankNeedReqStandUp(slot2, slot0.model)

	slot4 = nil

	slot0.model.setCompareCardNoMoneyData(slot2, slot0.model)

	slot4 = 0

	slot0.model.setCompareCardNoMoneyIndex(slot2, slot0.model)

	slot4 = false

	slot0.model.setCanShowPuke(slot2, slot0.model)

	slot5 = true

	slot0.model.setTableChair(slot2, slot0.model, {})

	slot5 = true

	slot0.model.setTableUserID(slot2, slot0.model, {})

	slot4 = false

	slot0.model.setShowGameEndPuke(slot2, slot0.model)
end

YszController.onBtnChangedClick = function (slot0)
	slot3 = gameMgr
	slot6 = Hero

	if gameMgr.getUserData(slot2, Hero.getDwUserID(slot5)) == nil then
		return
	end

	slot5 = slot1.cbUserStatus

	trace(slot3, "赢三张换桌,玩家的状态是:")

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

		trace(slot3, "赢三张换桌失败,玩家的状态是:")

		slot5 = "游戏中无法换桌!"

		tweenMsgMgr.showRedMsg(slot3, tweenMsgMgr)
	end
end

YszController.onGameMessage = function (slot0, slot1, slot2)
	if slot2 == YSZ_SUB_S_GAME_START then
		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)

		slot6 = 5

		slot0.startTick(slot4, slot0)

		slot6 = slot1

		slot0.onSubGameStart(slot4, slot0)
	elseif slot2 == YSZ_SUB_S_ADD_SCORE then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == YSZ_SUB_S_LOOK_CARD then
		slot6 = slot1

		slot0.onSubLookCard(slot4, slot0)
	elseif slot2 == YSZ_SUB_S_COMPARE_CARD then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == YSZ_SUB_S_OPEN_CARD then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == YSZ_SUB_S_GIVE_UP then
		slot3 = 0

		for slot7 = 1, YSZ_GAME_PLAYER, 1 do
			slot10 = slot0.model

			if slot0.model.getCbPlayStatus(slot9)[slot7] == 1 then
				slot3 = slot3 + 1
			end
		end

		if slot3 <= 2 then
			slot8 = slot1

			slot0.putIntoList(slot5, slot0, slot2)
		else
			slot7 = slot1

			slot0.onSubGiveUp(slot5, slot0)
		end
	elseif slot2 == YSZ_SUB_S_PLAYER_EXIT then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == YSZ_SUB_S_GAME_END then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == YSZ_SUB_S_WAIT_COMPARE then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == YSZ_SUB_S_COMPARE_CARD_NOMONEY then
		slot7 = slot1

		slot0.putIntoList(slot4, slot0, slot2)
	elseif slot2 == YSZ_SUB_S_CONFIG then
		slot5 = "======服务器配置======"

		print(slot4)

		slot6 = slot1

		slot0.onSubConfig(slot4, slot0)
	elseif slot2 == YSZ_SUB_S_SHOW_CARD then
		slot6 = slot1

		slot0.onSubShowCard(slot4, slot0)
	elseif slot2 == YSZ_SUB_S_DS then
		slot6 = slot1

		slot0.onSubDaS(slot4, slot0)
	end
end

YszController.putIntoList = function (slot0, slot1, slot2)
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

YszController.handleCommand = function (slot0)
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

YszController.run = function (slot0, slot1, slot2)
	if slot1 == YSZ_SUB_S_ADD_SCORE then
		slot6 = slot2

		slot0.onSubAddScore(slot4, slot0)
	elseif slot1 == YSZ_SUB_S_COMPARE_CARD then
		slot6 = slot2

		slot0.onSubCompareCard(slot4, slot0)
	elseif slot1 == YSZ_SUB_S_OPEN_CARD then
		slot6 = slot2

		slot0.onSubOpenCard(slot4, slot0)
	elseif slot1 == YSZ_SUB_S_GIVE_UP then
		slot6 = slot2

		slot0.onSubGiveUp(slot4, slot0)
	elseif slot1 == YSZ_SUB_S_PLAYER_EXIT then
		slot6 = slot2

		slot0.onSubPlayerExit(slot4, slot0)
	elseif slot1 == YSZ_SUB_S_GAME_END then
		slot6 = slot2

		slot0.onSubGameEnd(slot4, slot0)
	elseif slot1 == YSZ_SUB_S_WAIT_COMPARE then
		slot6 = slot2

		slot0.onWaitCompare(slot4, slot0)
	elseif slot1 == YSZ_SUB_S_COMPARE_CARD_NOMONEY then
		slot6 = slot2

		slot0.onSubCompareCardNoMoney(slot4, slot0)
	end
end

YszController.onGameSceneByServer = function (slot0, slot1)
	slot6 = gameMgr.getGameStatus(slot3)

	print(gameMgr, "GameScene游戏状态是")

	if gameMgr.getGameStatus(slot3) == GAME_STATUS_FREE then
		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)

		slot5 = slot0

		slot0.stopTick(slot4)

		slot6 = slot1

		slot0.onSubGameFree(slot4, slot0)
	elseif slot2 == GAME_STATUS_PLAY then
		slot6 = true

		slot0.model.setDoAction(slot4, slot0.model)

		slot5 = slot0

		slot0.stopTick(slot4)

		slot6 = slot1

		slot0.onSubGamePlay(slot4, slot0)
	elseif slot2 == YSZ_GAME_SCENE_END then
		slot6 = slot1

		slot0.OnSubGameEnd(slot4, slot0)
	else
		slot6 = slot2

		print(slot4, "GameScene游戏状态是")
	end
end

YszController.onSubGameStart = function (slot0, slot1)
	slot6 = "ZJH_CMD_S_GameStart"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot4 = "赢三张---开始游戏"

		trace(slot3)

		slot6 = "ZJH_CMD_S_GameStart"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot7 = true

		slot0.model.setCbHandCardData(ffiMgr, slot0.model, nil)

		slot8 = true

		Hero.setUserFakeScore(ffiMgr, Hero, 0, true)

		slot8 = true

		slot0.model.setCompareStart(ffiMgr, slot0.model, false, true)
		slot0.model.compareStartChangedSignal.emit(ffiMgr)

		slot8 = true

		slot0.model.setBMingZhu(slot0.model.compareStartChangedSignal, slot0.model, slot3)

		slot8 = {}

		slot0.model.setCbPlayStatus(slot0.model, slot0.model)

		slot7 = slot0.model
		slot10 = Hero

		slot0.model.setMeWChairID(slot0.model, Hero.getWChairID(slot9))

		slot8 = 0

		slot0.model.setXzTotalScore(slot0.model, slot0.model)

		slot9 = true

		slot0.model.setGameState(slot0.model, slot0.model, GAME_STATUS_PLAY)

		slot8 = 1

		slot0.model.setNCurRounds(slot0.model, slot0.model)

		slot8 = slot2.nMaxRounds

		slot0.model.setNMaxRounds(slot0.model, slot0.model)

		slot8 = slot2.lCellScore

		slot0.model.setLCellScore(slot0.model, slot0.model)

		slot8 = slot2.lCurrentTimes

		slot0.model.setLCurrentTimes(slot0.model, slot0.model)

		slot8 = slot2.wCurrentUser

		slot0.model.setWCurrentUser(slot0.model, slot0.model)

		slot8 = slot2.wBankerUser

		slot0.model.setWBankerUser(slot0.model, slot0.model)

		slot8 = slot2.lUserMaxScore

		slot0.model.setLUserMaxScore(slot0.model, slot0.model)

		slot9 = slot2

		slot0.sendlog(slot0.model, slot0, "游戏开始:")

		slot9 = true

		slot0.model.dispathEvent(slot0.model, slot0.model, YSZ_EVENT_GAME_START)
	end
end

YszController.onSubGamePlay = function (slot0, slot1)
	slot6 = "ZJH_CMD_S_StatusPlay"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot4 = "赢三张---onSubGamePlay"

		trace(slot3)

		slot6 = "ZJH_CMD_S_StatusPlay"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot5 = slot0.model
		slot8 = Hero

		slot0.model.setMeWChairID(ffiMgr, Hero.getWChairID(slot7))

		slot8 = true

		slot0.model.setCompareStart(ffiMgr, slot0.model, false, true)

		slot5 = slot0.model.compareStartChangedSignal

		slot0.model.compareStartChangedSignal.emit(ffiMgr)

		slot6 = {}

		slot0.model.setHandleList(ffiMgr, slot0.model)

		slot7 = true

		slot0.model.setLTablePlayerScore(ffiMgr, slot0.model, {})

		slot5 = slot0

		slot0.clearCd(ffiMgr)

		slot6 = false

		slot0.model.setCanShowPuke(ffiMgr, slot0.model)

		slot8 = true

		Hero.setUserFakeScore(ffiMgr, Hero, 0, true)

		slot7 = true

		slot0.model.setAllInScore(ffiMgr, slot0.model, 0)

		slot6 = 0

		slot0.model.setPlayerCd(ffiMgr, slot0.model)

		slot5 = slot0

		slot0.hideAllBattleChildrenViews(ffiMgr)

		slot6 = nil

		slot0.model.setCompareCardData(ffiMgr, slot0.model)

		slot6 = false

		slot0.model.setBMeCompare(ffiMgr, slot0.model)

		slot7 = true

		slot0.model.setCancelWaitCompare(ffiMgr, slot0.model, true)

		slot6 = false

		slot0.model.setIsPlayingAction(ffiMgr, slot0.model)

		slot8 = true

		slot0.model.setMyTablePlayingUserData(slot0.model, slot0.model, slot3)

		slot7 = 0

		slot0.model.setXzTotalScore(slot0.model, slot0.model)
		slot0.model.setGameState(slot0.model, slot0.model, GAME_STATUS_PLAY)

		slot6 = slot0.model
		slot9 = slot0.model

		slot0.model.setNLastRounds(slot0.model, slot0.model.getNCurRounds(true))

		slot7 = slot2.nCurRounds

		slot0.model.setNCurRounds(slot0.model, slot0.model)

		slot7 = slot2.nMaxRounds

		slot0.model.setNMaxRounds(slot0.model, slot0.model)

		slot7 = slot2.lCellScore

		slot0.model.setLCellScore(slot0.model, slot0.model)

		slot7 = slot2.lCurrentTimes

		slot0.model.setLCurrentTimes(slot0.model, slot0.model)

		slot7 = slot2.lUserMaxScore

		slot0.model.setLUserMaxScore(slot0.model, slot0.model)

		slot7 = slot2.wCurrentUser

		slot0.model.setWCurrentUser(slot0.model, slot0.model)

		slot7 = slot2.wBankerUser

		slot0.model.setWBankerUser(slot0.model, slot0.model)

		slot4 = {}

		for slot8 = 1, #slot2.bMingZhu, 1 do
			slot13 = YSZ_GAME_PLAYER
			slot16 = slot0.model
			slot4[gameMgr.switchViewChairID(slot10, gameMgr, slot8 - 1, slot0.model.getMeWChairID(slot15))] = slot2.bMingZhu[slot8]
		end

		slot9 = true

		slot0.model.setBMingZhu(slot6, slot0.model, slot4)

		slot5 = {}

		for slot9 = 1, YSZ_GAME_PLAYER, 1 do
			slot14 = YSZ_GAME_PLAYER
			slot17 = slot0.model
			slot5[gameMgr.switchViewChairID(slot11, gameMgr, slot9 - 1, slot0.model.getMeWChairID(slot16))] = slot2.cbPlayStatus[slot9]
		end

		slot9 = slot2.bCompareState

		slot0.model.setBMeCompare(slot7, slot0.model)

		slot9 = slot5

		slot0.model.setCbPlayStatus(slot7, slot0.model)

		slot10 = true

		slot0.model.setLTableScore(slot7, slot0.model, {})

		slot9 = slot2.lTableScore

		slot0.model.setLTableScore(slot7, slot0.model)

		if slot4[1] == true then
			slot10 = true

			slot0.model.setCbHandCardData(slot7, slot0.model, nil)

			slot10 = true

			slot0.model.setCbHandCardData(slot7, slot0.model, slot2.cbHandCardData)
		end

		slot10 = true

		slot0.model.setLUserJetton(slot7, slot0.model, {})

		slot10 = true

		slot0.model.setLUserJetton(slot7, slot0.model, slot2.lUserJetton)

		slot10 = true

		slot0.model.setLUserJettonTimes(slot7, slot0.model, {})

		slot10 = true

		slot0.model.setLUserJettonTimes(slot7, slot0.model, slot2.wUserJettonTimes)

		if slot2.bIsAllIn then
			slot10 = true

			slot0.model.setAllInScore(slot7, slot0.model, slot2.lAllInScore)

			slot10 = true

			slot0.model.setIsShowEffectXP(slot7, slot0.model, true)

			slot10 = true

			slot0.model.setIsAllIn(slot7, slot0.model, true)
		end

		slot10 = slot2

		slot0.sendlog(slot7, slot0, "场景还原:")

		slot10 = true

		slot0.model.setNLastSeconds(slot7, slot0.model, slot2.nLastSeconds - 2)

		slot10 = true

		slot0.model.dispathEvent(slot7, slot0.model, YSZ_EVENT_PLAY)

		slot8 = "================ZJH_CMD_S_StatusPlay======================"

		trace(slot7)
	end
end

YszController.onSubAddScore = function (slot0, slot1)
	slot6 = "ZJH_CMD_S_AddScore"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_AddScore"
		slot5 = slot0.model
		slot8 = slot0.model

		slot0.model.setNLastRounds(ffiMgr, slot0.model.getNCurRounds(slot7))

		slot7 = true

		slot0.model.setNCurRounds(ffiMgr, slot0.model, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).nCurRounds)

		slot6 = slot0.model

		if ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wAddScoreUser == slot0.model.getMeWChairID(slot0.model) then
			slot6 = -slot2.lAddScoreCount

			Hero.addUserFakeScore(slot4, Hero)
		end

		slot5 = "赢三张---onSubAddScore:"
		slot9 = slot2.wAddScoreUser

		trace(slot4, gameMgr.switchViewChairID(slot7, gameMgr))

		slot8 = slot0.model
		slot6 = slot0.model.getXzTotalScore(slot7) + slot2.lAddScoreCount

		slot0.model.setXzTotalScore(slot4, slot0.model)

		slot6 = slot2

		slot0.model.setAddScoreData(slot4, slot0.model)

		slot8 = slot0.model
		slot5 = "==========总下注额是:" .. slot0.model.getXzTotalScore(slot2.lAddScoreCount)

		print(slot4)

		if slot2.bIsAllIn == 1 then
			slot9 = slot2.wAddScoreUser
			slot7 = 6

			slot0.PlaySound(slot4, slot0, gameMgr.switchViewChairID(slot7, gameMgr))
		elseif slot2.bIsAllIn == 2 then
			slot9 = slot2.wAddScoreUser
			slot7 = 1

			slot0.PlaySound(slot4, slot0, gameMgr.switchViewChairID(slot7, gameMgr))
		elseif slot2.wCompareState == 1 then
			slot9 = slot2.wAddScoreUser
			slot7 = 2

			slot0.PlaySound(slot4, slot0, gameMgr.switchViewChairID(slot7, gameMgr))
		else
			slot5 = slot0.model

			if slot0.model.getLCurrentTimes(slot4) < slot2.lCurrentTimes then
				slot9 = slot2.wAddScoreUser
				slot7 = 0

				slot0.PlaySound(slot4, slot0, gameMgr.switchViewChairID(slot7, gameMgr))
			elseif slot2.lAddScoreCount > 0 then
				slot9 = slot2.wAddScoreUser
				slot7 = 3

				slot0.PlaySound(slot4, slot0, gameMgr.switchViewChairID(slot7, gameMgr))
			end
		end

		slot7 = slot2

		slot0.sendlog(slot4, slot0, "加注或跟注或比牌跟注:")

		if slot2.wCompareState ~= 1 then
			slot6 = slot2.wCurrentUser

			slot0.model.setWCurrentUser(slot4, slot0.model)
		end

		slot6 = slot2.lCurrentTimes

		slot0.model.setLCurrentTimes(slot4, slot0.model)

		slot7 = true

		slot0.model.dispathEvent(slot4, slot0.model, YSZ_EVENT_ADDSCORE)

		slot6 = "最新的跟注额倍数:"

		dump(slot4, slot2.lCurrentTimes)
	end
end

YszController.onSubCompareCardNoMoney = function (slot0, slot1)
	slot4 = "赢三张---onSubCompareCardNoMoney"

	trace(slot3)

	slot6 = "ZJH_CMD_S_CompareCardNoMoney"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_CompareCardNoMoney"
		slot6 = false

		slot0.model.setBMeCompare(ffiMgr, slot0.model)

		slot6 = nil

		slot0.model.setWaitCompareData(ffiMgr, slot0.model)

		slot6 = nil

		slot0.model.setCompareCardData(ffiMgr, slot0.model)

		slot6 = 0

		slot0.model.setCompareCardNoMoneyIndex(ffiMgr, slot0.model)

		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0.model.setCompareCardNoMoneyData(ffiMgr, slot0.model)

		slot7 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0.sendlog(ffiMgr, slot0, "孤注一掷:")

		slot7 = true

		slot0.model.dispathEvent(ffiMgr, slot0.model, YSZ_EVENT_COMPARE_NOMONEY)
	end
end

YszController.onSubCompareCard = function (slot0, slot1)
	slot4 = "赢三张---onSubCompareCard"

	trace(slot3)

	slot6 = "ZJH_CMD_S_CompareCard"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_CompareCard"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot6 = false

		slot0.model.setBMeCompare(ffiMgr, slot0.model)

		slot6 = nil

		slot0.model.setWaitCompareData(ffiMgr, slot0.model)

		slot6 = nil

		slot0.model.setCompareCardData(ffiMgr, slot0.model)

		slot3 = 0

		for slot7 = 1, YSZ_GAME_PLAYER, 1 do
			slot10 = slot0.model

			if slot0.model.getCbPlayStatus(slot9)[slot7] == 1 then
				slot3 = slot3 + 1
			end
		end

		if slot3 <= 2 then
			slot8 = true

			slot0.model.setIsTwoMan(slot5, slot0.model, true)

			slot7 = slot0.model

			if slot2.wLostUser ~= slot0.model.getMeWChairID(slot0.model) then
				slot9 = true

				Hero.setUserFakeScore(slot5, Hero, 0, true)
			end
		end

		slot7 = slot0.model

		if slot2.wLostUser == slot0.model.getMeWChairID(slot6) and slot2.cbCardData ~= nil then
			slot9 = true

			Hero.setUserFakeScore(slot5, Hero, 0, true)

			slot8 = true

			slot0.model.setCbHandCardData(slot5, slot0.model, nil)

			slot8 = true

			slot0.model.setCbHandCardData(slot5, slot0.model, slot2.cbCardData)
		end

		slot8 = slot2

		slot0.sendlog(slot5, slot0, "比牌:")

		slot9 = YSZ_GAME_PLAYER
		slot12 = slot0.model
		slot5 = gameMgr.switchViewChairID(slot0.model, gameMgr, slot2.wLostUser, slot0.model.getMeWChairID(slot11))
		slot0.model.getCbPlayStatus(slot5)[slot5] = 0
		slot7 = slot2

		slot0.model.setCompareCardData(slot5, slot0.model)

		slot8 = true

		slot0.model.dispathEvent(slot5, slot0.model, YSZ_EVENT_COMPARE)

		slot7 = "onSubCompareCard"

		dump(slot5, slot2)
	end
end

YszController.onSubOpenCard = function (slot0, slot1)
	slot6 = "ZJH_CMD_S_OpenCard"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_OpenCard"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0.model.setOpenCardData(ffiMgr, slot0.model)

		slot6 = "ZJH_CMD_S_OpenCard"

		dump(ffiMgr, slot2)

		slot6 = false

		slot0.model.setDoAction(ffiMgr, slot0.model)
	end
end

YszController.onSubGiveUp = function (slot0, slot1)
	slot4 = "赢三张---onSubGiveUp"

	trace(slot3)

	slot6 = "ZJH_CMD_S_GiveUp"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_GiveUp"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0.model.setGiveUpData(ffiMgr, slot0.model)

		slot8 = YSZ_GAME_PLAYER
		slot11 = slot0.model
		slot4 = gameMgr.switchViewChairID(slot0.model, gameMgr, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wGiveUpUser, slot0.model.getMeWChairID(slot10))
		slot0.model.getCbPlayStatus(ffiMgr)[slot4] = 0
		slot6 = false

		slot0.model.setBMeCompare(slot4, slot0.model)

		slot5 = slot0.model

		if slot0.model.getWaitCompareData(slot4) ~= nil then
			if slot3.wCompareUser == slot2.wGiveUpUser then
				slot8 = true

				slot0.model.setCancelWaitCompare(slot5, slot0.model, true)

				slot7 = nil

				slot0.model.setWaitCompareData(slot5, slot0.model)
			else
				slot8 = true

				slot0.model.dispathEvent(slot5, slot0.model, YSZ_EVENT_WAITCOMPARE)
			end
		end

		slot7 = slot0.model

		if slot2.wGiveUpUser == slot0.model.getMeWChairID(slot6) then
			slot8 = true

			slot0.model.setCbHandCardData(slot5, slot0.model, nil)

			slot8 = true

			slot0.model.setCbHandCardData(slot5, slot0.model, slot2.cbCardData)

			slot7 = false

			slot0.model.setBAllFollow(slot5, slot0.model)

			slot9 = true

			Hero.setUserFakeScore(slot5, Hero, 0, true)
		end

		slot0.sendlog(slot5, slot0, "弃牌:")

		slot10 = slot2.wGiveUpUser
		slot8 = 5

		slot0.PlaySound(slot5, slot0, gameMgr.switchViewChairID(slot2, gameMgr))

		slot8 = true

		slot0.model.dispathEvent(slot5, slot0.model, YSZ_EVENT_GIVEUP)

		slot7 = "ZJH_CMD_S_GiveUp"

		dump(slot5, slot2)
	end
end

YszController.onSubLookCard = function (slot0, slot1)
	slot4 = "赢三张---onSubLookCard"

	trace(slot3)

	slot6 = "ZJH_CMD_S_LookCard"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_LookCard"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot3 = {
			[slot4] = slot2.cbCardData
		}
		slot8 = YSZ_GAME_PLAYER
		slot11 = slot0.model
		slot4 = gameMgr.switchViewChairID(slot1, gameMgr, slot2.wLookCardUser, slot0.model.getMeWChairID(slot10))
		slot0.model.getBMingZhu(gameMgr)[slot4] = true
		slot12 = slot2.wLookCardUser
		slot10 = 4

		slot0.PlaySound(slot0.model, slot0, gameMgr.switchViewChairID(slot10, gameMgr))

		slot10 = true

		slot0.model.setBMingZhu(slot0.model, slot0.model, slot5)

		slot10 = slot0.model
		slot9 = "看牌"

		dump(slot0.model, slot0.model.getBMingZhu(slot5))

		if slot4 == 1 then
			slot6 = {}
			slot9 = slot2.cbCardData

			for slot10, slot11 in pairs(slot8) do
				slot6[slot10] = slot11
			end

			slot10 = slot6

			slot0.model.setCbHandCardData(slot8, slot0.model)
		end

		slot10 = slot2

		slot0.sendlog(slot7, slot0, "看牌:")

		slot10 = true

		slot0.model.setLookCardData(slot7, slot0.model, slot3)

		slot10 = true

		slot0.model.dispathEvent(slot7, slot0.model, YSZ_EVENT_LOOKCARD)
	end
end

YszController.onSubPlayerExit = function (slot0, slot1)
	slot6 = "ZJH_CMD_S_PlayerExit"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_PlayerExit"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0.model.setPlayerExitData(ffiMgr, slot0.model)

		slot7 = true

		slot0.model.dispathEvent(ffiMgr, slot0.model, YSZ_EVENT_PLAYEREXIT)

		slot6 = "ZJH_CMD_S_PlayerExit"

		dump(ffiMgr, slot2)

		slot6 = false

		slot0.model.setDoAction(ffiMgr, slot0.model)
	end
end

YszController.onSubConfig = function (slot0, slot1)
	slot6 = "ZJH_CMD_S_Config"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_Config"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot7 = true

		slot0.model.setAllInModel(ffiMgr, slot0.model, slot2.bNoAllIn)

		slot7 = true

		slot0.model.setLMaxScore(ffiMgr, slot0.model, slot2.lMaxCellScore)

		slot6 = "ZJH_CMD_S_Config"

		dump(ffiMgr, slot2)
	end
end

YszController.onSubShowCard = function (slot0, slot1)
	slot6 = "ZJH_CMD_S_ShowCard"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_ShowCard"
		slot6 = "onSubShowCard:"

		dump(ffiMgr, slot2)

		slot5 = slot0.model

		if slot0.model.getTableChair(ffiMgr)[ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wShowUser] == nil then
			return
		end

		slot5 = "======亮牌========="

		print(slot4)

		slot6 = slot2

		slot0.model.setShowCardData(slot4, slot0.model)

		slot7 = true

		slot0.model.dispathEvent(slot4, slot0.model, YSZ_EVENT_SHOW_CARD)
	end
end

YszController.onSubDaS = function (slot0, slot1)
	slot6 = "ZJH_CMD_S_ShowCard"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = true

		slot0.model.dispathEvent(slot3, slot0.model, YSZ_EVENT_DS)
	end
end

YszController.onSubGameEnd = function (slot0, slot1)
	slot4 = "赢三张---onSubGameEnd"

	trace(slot3)

	slot6 = "ZJH_CMD_S_GameEnd"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_GameEnd"
		slot3 = {
			cbCardData = {},
			wCompareUser = {},
			winerCardData = {},
			meIsOpen = false
		}
		slot7 = "未处理分数："

		dump(slot1, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).lGameScore)

		for slot7 = 1, #ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).lGameScore, 1 do
			if slot2.lGameScore[slot7] > 0 then
				slot12 = YSZ_GAME_PLAYER
				slot15 = slot0.model
				slot3.winerChairID = gameMgr.switchViewChairID(slot9, gameMgr, slot7 - 1, slot0.model.getMeWChairID(slot14))
				slot3.winerScore = slot2.lGameScore[slot7]

				for slot11 = 1, 3, 1 do
					slot3.winerCardData[slot11] = slot2.cbCardData[slot7][slot11]
				end

				break
			end
		end

		slot4 = 0

		for slot8 = 1, YSZ_GAME_PLAYER, 1 do
			slot11 = slot0.model

			if slot0.model.getCbPlayStatus(slot10)[slot8] == 1 then
				slot4 = slot4 + 1
			end
		end

		if slot4 <= 2 then
			slot9 = true

			slot0.model.setIsTwoMan(slot6, slot0.model, true)
		end

		slot9 = true

		slot0.model.setCbHandCardData(slot6, slot0.model, nil)

		slot11 = slot0.model
		slot9 = true

		slot0.model.setCbHandCardData(slot6, slot0.model, slot2.cbCardData[slot0.model.getMeWChairID(slot10) + 1])

		slot5 = slot0.model.getMeWChairID(slot6) + 1
		slot9 = "未处理："

		dump(slot0.model, slot2.wCompareUser)

		for slot9 = 1, 4, 1 do
			slot13 = 65535

			if not numberEqual(slot11, slot2.wCompareUser[slot5][slot9]) then
				slot15 = YSZ_GAME_PLAYER
				slot18 = slot0.model
				slot3.wCompareUser[gameMgr.switchViewChairID(slot12, gameMgr, slot2.wCompareUser[slot5][slot9], slot0.model.getMeWChairID(slot17))] = slot2.cbCardData[slot2.wCompareUser[slot5][slot9] + 1]
			end
		end

		slot8 = slot3.wCompareUser
		slot11 = slot0.model

		dump(slot7, slot0.model.getMeWChairID(slot10))

		for slot9 = 1, YSZ_GAME_PLAYER, 1 do
			slot13 = 65535

			if not numberEqual(slot11, slot2.wOpenUser[slot9]) then
				slot15 = YSZ_GAME_PLAYER
				slot18 = slot0.model

				if slot3.winerChairID ~= gameMgr.switchViewChairID(slot12, gameMgr, slot2.wOpenUser[slot9], slot0.model.getMeWChairID(slot17)) then
					slot14 = YSZ_GAME_PLAYER
					slot17 = slot0.model

					if gameMgr.switchViewChairID(slot11, gameMgr, slot2.wOpenUser[slot9], slot0.model.getMeWChairID(slot16)) ~= 1 then
						slot15 = YSZ_GAME_PLAYER
						slot18 = slot0.model
						slot3.wCompareUser[gameMgr.switchViewChairID(slot12, gameMgr, slot2.wOpenUser[slot9], slot0.model.getMeWChairID(slot17))] = slot2.cbCardData[slot2.wOpenUser[slot9] + 1]
					end
				end
			end

			slot13 = slot0.model

			if slot2.wOpenUser[slot9] == slot0.model.getMeWChairID(slot12) then
				slot3.meIsOpen = true
			end
		end

		slot3.wCompareUser[slot3.winerChairID] = slot3.winerCardData
		slot3.wEndState = slot2.wEndState
		slot3.lGameTax = slot2.lGameTax
		slot10 = slot2

		slot0.sendlog(slot3.winerChairID, slot0, "游戏结算:")

		slot9 = slot3

		slot0.model.setGameEndData(slot3.winerChairID, slot0.model)

		slot10 = true

		slot0.model.dispathEvent(slot3.winerChairID, slot0.model, YSZ_EVENT_GAME_END)
	end
end

YszController.onSubGameFree = function (slot0, slot1)
	slot6 = "ZJH_CMD_S_StatusFree"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_StatusFree"
		slot7 = true

		slot0.model.setGameState(ffiMgr, slot0.model, GAME_STATUS_FREE)

		slot8 = true

		Hero.setUserFakeScore(ffiMgr, Hero, 0, true)

		slot7 = true

		slot0.model.dispathEvent(ffiMgr, slot0.model, YSZ_EVENT_GAME_FREE)

		slot6 = "ZJH_CMD_S_StatusFree"

		dump(ffiMgr, ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1))
	end
end

YszController.onWaitCompare = function (slot0, slot1)
	slot6 = "ZJH_CMD_S_WaitCompare"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "ZJH_CMD_S_WaitCompare"
		slot6 = slot0.model

		if ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wCompareUser ~= slot0.model.getMeWChairID(slot1) then
			slot6 = false

			slot0.model.setDoAction(slot4, slot0.model)

			return
		end

		slot7 = slot2

		slot0.sendlog(slot4, slot0, "等待选择比牌玩家:")

		slot6 = slot2

		slot0.model.setWaitCompareData(slot4, slot0.model)

		slot7 = true

		slot0.model.dispathEvent(slot4, slot0.model, YSZ_EVENT_WAITCOMPARE)

		slot6 = "ZJH_CMD_S_WaitCompare"

		dump(slot4, slot2)
	end
end

YszController.onChangeCompareStart = function (slot0)
	return
end

YszController.onUserStatus = function (slot0, slot1)
	slot6 = Hero
	slot5 = 65535

	if numberEqual(slot3, Hero.getWTableID(slot5)) and not slot0.isChangingTable then
		return
	end

	slot6 = Hero
	slot5 = 65535

	if numberEqual(slot3, Hero.getWChairID(slot5)) and not slot0.isChangingTable then
		return
	end

	slot4 = slot0.model

	if slot0.model.getBankContentTxt(slot3) ~= nil then
		return
	end

	slot4 = slot0.model
	slot2 = slot0.model.getMyTableUserData(slot3)
	slot6 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot5) then
		slot2[1] = slot1

		if slot1.cbUserStatus == US_SIT then
		elseif slot1.cbUserStatus == US_READY then
		elseif slot1.cbUserStatus == US_FREE and slot0.isChangingTable then
			slot5 = slot0

			slot0.resetBattle(slot4)

			slot6 = false

			gameMgr.setIsStartGame(slot4, gameMgr)

			slot0.isChangingTable = nil
		end

		if slot1.cbUserStatus ~= US_FREE then
			slot6 = Hero.getWTableID(slot7)
			slot9 = Hero
			slot6 = gameMgr.getUserDatasByTableId(slot4, gameMgr, Hero.getDwUserID(Hero))

			for slot7, slot8 in ipairs(gameMgr) do
				slot12 = slot8.wChairID
				slot2[gameMgr.switchViewChairID(slot10, gameMgr)] = slot8
			end
		end

		slot5 = slot0.model.myTableUserDataChangedSignal

		slot0.model.myTableUserDataChangedSignal.emit(slot4)
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

				slot6 = slot0.model.myTableUserDataChangedSignal

				slot0.model.myTableUserDataChangedSignal.emit(slot5)
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
				slot6 = slot0.model.myTableUserDataChangedSignal

				slot0.model.myTableUserDataChangedSignal.emit(slot5)
			end
		end
	end

	slot4 = slot2[1] ~= nil and (slot3.cbUserStatus == US_SIT or slot3.cbUserStatus == US_READY)
end

YszController.updataUserData = function (slot0, slot1)
	slot4 = slot0.model

	if slot0.model.getBankContentTxt(slot3) ~= nil then
		return
	end

	slot5 = Hero

	if slot1.wTableID == Hero.getWTableID(slot4) then
		slot3 = slot0.model.getMyTablePlayingUserData(slot0.model)
		slot6 = slot0.model
		slot4 = slot0.model.getLTablePlayerScore(slot0.model)

		if not slot0.model.getIsTwoMan(slot3) then
			slot7 = slot0.model
			slot5 = slot0.model.getCbPlayStatus(slot6)
		else
			slot7 = slot3

			for slot8, slot9 in pairs(slot6) do
				if slot1.wChairID == slot9.wChairID then
					slot3[slot8].lScore = slot1.lScore

					break
				end
			end
		end

		slot9 = true

		slot0.model.setMyTablePlayingUserData(slot6, slot0.model, slot3)

		slot9 = slot1.wChairID
		slot0.model.getMyTableUserData(slot6)[gameMgr.switchViewChairID(slot0.model, gameMgr)] = slot1
		slot10 = true

		slot0.model.setMyTableUserData(slot0.model, slot0.model, slot0.model.getMyTableUserData(slot6))
	end
end

YszController.onUserScore = function (slot0, slot1)
	slot6 = Hero
	slot5 = 65535

	if numberEqual(slot3, Hero.getWTableID(slot5)) then
		return
	end

	slot5 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot4) then
		slot4 = "=========YszController:onUserScore==========="

		print(slot3)

		slot4 = slot0.model

		if slot0.model.getCbPlayStatus(slot3)[1] ~= 1 then
			slot8 = true

			Hero.setUserFakeScore(slot4, Hero, 0, true)
		end

		slot6 = slot1.lScore

		Hero.setUserScore(slot4, Hero)
	end

	slot5 = slot1

	slot0.updataUserData(slot3, slot0)
end

YszController.onUserEnter = function (slot0, slot1)
	slot6 = Hero
	slot5 = 65535

	if numberEqual(slot3, Hero.getWTableID(slot5)) then
		return
	end

	slot5 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot4) then
		slot5 = 1

		slot0.reqClientError(slot3, slot0)

		slot6 = true

		slot0.model.setMyTableUserData(slot3, slot0.model, {})

		slot6 = true

		slot0.model.setMyTablePlayingUserData(slot3, slot0.model, {})
	end

	slot5 = slot1

	slot0.updataUserData(slot3, slot0)
end

YszController.gotoBankOrCharge = function (slot0, slot1, slot2)
	slot5 = "=============YszController:gotoBankOrCharge=================="

	print(slot4)

	slot6 = slot1

	slot0.model.setBankContentTxt(slot4, slot0.model)

	slot6 = slot2

	slot0.model.setBankNeedReqStandUp(slot4, slot0.model)
end

YszController.gotoBankOrChargeA = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if slot0.model.getCurShowingViewType(slot4) == 1 then
		slot8 = true

		BaseGameController.gotoBankOrCharge(slot4, slot0, slot1, slot2)
	else
		slot7 = slot2

		BaseGameController.gotoBankOrCharge(slot4, slot0, slot1)
	end
end

YszController.hideAllBattleChildrenViews = function (slot0)
	slot4 = false

	slot0.model.setIsShowEffectWin(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowEffectST(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowEffectPK(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowEffectGZYZ(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowEffectXP(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsEndShowPuke(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsTwoMan(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsSendPukeFinish(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowBetMenu(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowJettonEndResult(slot2, slot0.model)

	slot5 = true

	slot0.model.dispathEvent(slot2, slot0.model, YSZ_EVENT_GAME_RESET)
end

YszController.reqReady = function (slot0)
	slot3 = "===========请求准备=========="

	print(slot2)

	slot3 = true

	reqReady(slot2)
end

YszController.reqDas = function (slot0)
	slot3 = "===========YszController:reqDas=========="

	print(slot2)
end

YszController.reqGiveUp = function (slot0)
	slot3 = slot0.model

	if slot0.model.getWaitCompareData(slot2) ~= nil then
		slot5 = slot0.model

		if slot1.wCompareUser == slot0.model.getMeWChairID(slot4) then
			slot6 = true

			slot0.model.setCancelWaitCompare(slot3, slot0.model, true)

			slot5 = nil

			slot0.model.setWaitCompareData(slot3, slot0.model)
		end
	end

	slot4 = slot0

	slot0.clearCd(slot3)

	slot4 = "赢三张---弃牌"

	trace(slot3)

	slot9 = true

	doReqServerViaStruct(slot3, "弃牌", nil, nil, MDM_GF_GAME, YSZ_SUB_C_GIVE_UP)
end

YszController.reqAutoAdd = function (slot0, slot1)
	slot5 = "赢三张---自动跟注标记请求"

	trace(slot4)

	slot10 = true

	doReqServerViaStruct(slot4, "自动跟注", {
		wState = slot1
	}, "ZJH_CMD_C_AutoScore", MDM_GF_GAME, YSZ_SUB_C_AUTO_SCORE)
end

YszController.reqClientError = function (slot0, slot1)
	slot10 = true

	doReqServerViaStruct(slot4, "向服务器发可能出错的编号:", {
		wIndex = slot1
	}, "ZJH_CMD_C_ClientError", MDM_GF_GAME, YSZ_SUB_C_CLIENT_ERROR)
end

YszController.sendlog = function (slot0, slot1, slot2)
	if slot2 == nil then
		slot12 = slot0.model
		slot6 = slot1 .. ",当前操作者:" .. tostring(slot0.model.getWCurrentUser(slot11))

		trackToServer(slot4, 1000111)
	else
		slot9 = slot2
		slot6 = slot1 .. cjson.encode(slot8)

		trackToServer(slot4, 1000111)
	end
end

YszController.reqShowCard = function (slot0)
	slot3 = "赢三张---亮牌"

	trace(slot2)

	slot8 = true

	doReqServerViaStruct(slot2, "亮牌", nil, nil, MDM_GF_GAME, YSZ_SUB_C_SHOW_CARD)
end

YszController.reqAddScore = function (slot0, slot1, slot2, slot3)
	slot6 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot5)[1] == nil then
		slot7 = "跟注提示：没参加本局，不能下注！"

		slot0.sendlog(slot5, slot0)

		slot7 = 6

		slot0.reqClientError(slot5, slot0)

		return
	end

	slot7 = slot0.model

	if slot0.model.getWCurrentUser(slot5) ~= slot0.model.getMeWChairID(slot0.model) then
		slot11 = slot0.model
		slot13 = slot0.model
		slot7 = "跟注提示：没到自己操作，不能下注！" .. "当前应该操作的是:" .. slot0.model.getWCurrentUser(slot10) .. ",玩家自己的椅子id是：" .. slot0.model.getMeWChairID(slot12)

		slot0.sendlog(slot5, slot0)

		slot7 = 7

		slot0.reqClientError(slot5, slot0)
	else
		slot6 = slot0

		slot0.clearCd(slot5)
	end

	slot4 = slot1

	if slot2 == 1 then
		slot9 = slot0.model

		if not (slot0.model.getLCellScore(slot7) * slot0.model.getLCurrentTimes(slot0.model)) then
			slot8 = slot0.model
			slot6 = slot0.model.getLCellScore(slot7) * slot4
		end
	end

	slot12 = slot0.model
	slot10 = slot0.model

	if slot0.model.getBMingZhu(gameMgr)[gameMgr.switchViewChairID(slot8, slot0.model.getMeWChairID(slot11))] then
		slot6 = slot6 * 2
	end

	slot13 = slot0.model
	slot15 = slot0.model
	slot10 = "=========单元跟注额是:" .. slot0.model.getLCellScore(slot12) .. ",当前跟注的倍数是:" .. slot0.model.getLCurrentTimes(slot14)

	print(slot9)

	slot8 = {
		lScore = slot6,
		wState = 0
	}

	if slot3 == nil then
		slot8.bIsAllIn = 0
	else
		slot8.bIsAllIn = 2
	end

	if slot3 then
		slot12 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot10)[1].lScore < slot0.model.getAllInScore(slot0.model) then
			slot11 = slot0.model
			slot8.lScore = slot0.model.getMyTablePlayingUserData(slot10)[1].lScore
		else
			slot11 = slot0.model
			slot8.lScore = slot0.model.getAllInScore(slot10)
		end

		slot15 = slot8.lScore
		slot12 = "准备发送allin请求" .. tostring(slot14)

		slot0.sendlog(slot10, slot0)
	end

	slot11 = slot0.model

	if slot0.model.getLTablePlayerScore(slot10)[1] ~= nil then
		slot12 = slot0.model

		if slot0.model.getLUserMaxScore(slot0.model) < slot0.model.getLTablePlayerScore(slot10)[1] + slot8.lScore then
			slot14 = slot0.model
			slot13 = slot8.lScore

			trace(slot10, "赢三张--跟注---下注超出上限:", slot0.model.getLTablePlayerScore(slot13)[1], slot0.model.getLUserMaxScore(slot15))

			slot15 = slot8.lScore
			slot17 = slot0.model
			slot19 = slot0.model
			slot12 = "数据有误，跟注额超出上限！金额是:" .. tostring(slot0.model.getLUserMaxScore) .. "已经下注的金额是:" .. slot0.model.getLTablePlayerScore(slot0.model)[1] .. "用户的金额是:" .. slot0.model.getLUserMaxScore(slot18)

			slot0.sendlog(slot10, slot0)

			slot12 = 8

			slot0.reqClientError(slot10, slot0)
		end
	end

	slot12 = slot7

	trace(slot10, "赢三张---跟注:")

	slot13 = slot8

	slot0.sendlog(slot10, slot0, "正常跟注")

	slot12 = "正常跟注:"

	dump(slot10, slot8)

	slot16 = true

	doReqServerViaStruct(slot10, "跟注", slot8, "ZJH_CMD_C_AddScore", MDM_GF_GAME, YSZ_SUB_C_ADD_SCORE)
end

YszController.reqCompareCard = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot4)[1] == nil then
		slot6 = "比牌提示：没参加本局，不能比牌！"

		slot0.sendlog(slot4, slot0)

		slot6 = 9

		slot0.reqClientError(slot4, slot0)

		return
	end

	slot6 = slot0.model

	if slot0.model.getWCurrentUser(slot4) ~= slot0.model.getMeWChairID(slot0.model) then
		slot10 = slot0.model
		slot12 = slot0.model
		slot6 = "比牌提示：没到自己操作，不能比牌！" .. "当前应该操作的是:" .. slot0.model.getWCurrentUser(slot9) .. ",玩家自己的椅子id是：" .. slot0.model.getMeWChairID(slot11)

		slot0.sendlog(slot4, slot0)

		slot6 = 10

		slot0.reqClientError(slot4, slot0)

		slot6 = slot0.model.getWCurrentUser("当前应该操作的是:")
		slot9 = slot0.model

		trace(slot4, "=====比牌无效当前操作者不是自己:", slot0.model.getMeWChairID(slot0.model))
	end

	slot3 = slot1
	slot4 = slot2
	slot5 = 0
	slot11 = slot0.model
	slot9 = slot0.model

	if slot0.model.getBMingZhu(gameMgr)[gameMgr.switchViewChairID(slot7, slot0.model.getMeWChairID(slot10))] then
		slot10 = slot0.model

		if not (slot0.model.getLCellScore(slot8) * slot0.model.getLCurrentTimes(slot0.model) * 4) then
			slot10 = slot0.model
			slot5 = slot0.model.getLCellScore(slot8) * slot0.model.getLCurrentTimes(slot0.model) * 2
		end
	end

	slot7 = {}
	slot10 = slot0.model

	if slot0.model.getIsAllIn(slot9) then
		slot10 = slot0.model
		slot7.lScore = slot0.model.getAllInScore(slot9)
		slot7.wState = 1
		slot7.bIsAllIn = 2
	else
		slot10 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot9)[1].lScore < slot5 then
			slot10 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot9)[1].lScore > 0 then
				slot10 = slot0.model
				slot7.lScore = slot0.model.getMyTablePlayingUserData(slot9)[1].lScore or 0
				slot7.wState = 1
				slot7.bIsAllIn = 1
			end
		else
			slot7.lScore = slot5
			slot7.wState = 1
			slot7.bIsAllIn = 0
		end
	end

	slot10 = slot0.model

	if slot0.model.getLTablePlayerScore(slot9)[1] ~= nil then
		slot11 = slot0.model

		if slot0.model.getLUserMaxScore(slot0.model) < slot0.model.getLTablePlayerScore(slot9)[1] + slot7.lScore then
			slot13 = slot0.model
			slot12 = slot7.lScore

			trace(slot9, "赢三张--比牌下注---下注超出上限:", slot0.model.getLTablePlayerScore(slot12)[1], slot0.model.getLUserMaxScore(slot14))

			slot14 = slot7.lScore
			slot16 = slot0.model
			slot18 = slot0.model
			slot11 = "数据有误，比牌跟注额超出上限！金额是:" .. tostring(slot0.model.getLUserMaxScore) .. "已经下注的金额是:" .. slot0.model.getLTablePlayerScore(slot0.model)[1] .. "用户的金额是:" .. slot0.model.getLUserMaxScore(slot17)

			slot0.sendlog(slot9, slot0)

			slot11 = 11

			slot0.reqClientError(slot9, slot0)
		end
	end

	slot10 = "赢三张---比牌跟注"

	trace(slot9)

	slot15 = true

	doReqServerViaStruct(slot9, "比牌跟注", slot7, "ZJH_CMD_C_AddScore", MDM_GF_GAME, YSZ_SUB_C_ADD_SCORE)

	slot12 = slot7

	slot0.sendlog(slot9, slot0, "发送比牌跟注协议")

	slot8 = 0

	for slot12 = 1, 5, 1 do
		slot17 = slot12 - 1

		if slot0.model.getCbPlayStatus(slot14)[gameMgr.switchViewChairID(slot0.model, gameMgr)] == 1 then
			slot8 = slot8 + 1
		end
	end

	slot11 = slot0.model
	slot9 = slot0.model.getMeWChairID(slot10)

	if slot8 == 2 then
		slot10 = {}

		for slot14 = 1, 5, 1 do
			slot19 = slot14 - 1

			if slot0.model.getCbPlayStatus(slot16)[gameMgr.switchViewChairID(slot0.model, gameMgr)] == 1 and slot14 - 1 ~= slot9 then
				slot10.wCompareUser = slot14 - 1

				break
			end
		end

		slot18 = true

		doReqServerViaStruct(slot12, "比牌", slot10, "ZJH_CMD_C_CompareCard", MDM_GF_GAME, YSZ_SUB_C_COMPARE_CARD)

		slot15 = slot10

		slot0.sendlog(slot12, slot0, "发送比牌协议")
	else
		slot17 = true

		doReqServerViaStruct(slot11, "等待比牌", nil, nil, MDM_GF_GAME, YSZ_SUB_C_WAIT_COMPARE)

		slot13 = "发送等待比牌协议"

		slot0.sendlog(slot11, slot0)
	end
end

YszController.reqChooseCUser = function (slot0, slot1)
	slot4 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot3)[1] == nil then
		slot5 = "选择比牌提示：没参加本局，不能选择！"

		slot0.sendlog(slot3, slot0)

		return
	else
		slot4 = slot0

		slot0.clearCd(slot3)
	end

	slot6 = "赢三张---选择比牌对象"

	trace(slot5)

	slot11 = true

	doReqServerViaStruct(slot5, "选择比牌", {
		wCompareUser = slot1
	}, "ZJH_CMD_C_CompareCard", MDM_GF_GAME, YSZ_SUB_C_COMPARE_CARD)
end

YszController.reqFinishFlash = function (slot0, slot1)
	slot9 = true

	doReqServerViaStruct(slot3, "完成动画", nil, nil, MDM_GF_GAME, YSZ_SUB_C_FINISH_FLASH)
end

YszController.reqLookCard = function (slot0, slot1)
	slot4 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot3)[1] == nil then
		return
	end

	slot4 = "赢三张---看牌"

	trace(slot3)

	slot9 = true

	doReqServerViaStruct(slot3, "看牌", nil, nil, MDM_GF_GAME, YSZ_SUB_C_LOOK_CARD)
end

YszController.destroy = function (slot0)
	slot0.model = nil
end

YszController.PlaySound = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if #slot0.model.getMyTablePlayingUserData(slot4) ~= nil then
		slot5 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot4)[slot1] == nil then
			return
		end
	end

	slot3 = ""
	slot6 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot5)[slot1].wGender == 1 then
		slot7 = YszController.m_gameSoundres[slot2 + 1]
		slot3 = string.format(slot5, "man/M%s")
	else
		slot7 = YszController.m_gameSoundres[slot2 + 1]
		slot3 = string.format(slot5, "woman/F%s")
	end

	slot7 = slot3

	slot0.playGameEffect(slot5, slot0)
end

return
