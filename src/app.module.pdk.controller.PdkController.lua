slot2 = "PdkController"
PdkController = class(slot1)

PdkController.ctor = function (slot0, slot1)
	slot0.model = slot1
	slot5 = {
		onX = 34,
		offX = 115
	}

	slot0.model.setSwitchStatePos(slot3, slot0.model)
	gameMgr.roomConfigChangedSignal.add(slot3, gameMgr.roomConfigChangedSignal, slot0.onRoomConfigChanged)

	slot5 = BaseGameController

	ClassUtil.extends(slot3, slot0)

	slot0._resProcessConfigs = {
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/plist_pdk_puke"
		},
		{
			type = "png",
			url = "animation/spine/pdkzhadan/pdkzhadan"
		},
		{
			type = "png",
			url = "animation/spine/pdkfail/pdkfail"
		},
		{
			type = "png",
			url = "animation/spine/pdkfailjiesuan/pdkfailjiesuan"
		},
		{
			type = "png",
			url = "animation/spine/pdkfeiji/pdkfeiji"
		},
		{
			type = "png",
			url = "animation/spine/pdkfeijipaixingtext/pdkfeijipaixingtext"
		},
		{
			type = "png",
			url = "animation/spine/pdkliandui/pdkliandui"
		},
		{
			type = "png",
			url = "animation/spine/pdkshunzi/pdkshunzi"
		},
		{
			type = "png",
			url = "animation/spine/pdkwarning/pdkwarning"
		},
		{
			type = "png",
			url = "animation/spine/pdkwin/pdkwin"
		},
		{
			type = "png",
			url = "animation/spine/pdkwinjiesuan/pdkwinjiesuan"
		},
		{
			type = "png",
			url = "animation/spine/pdklogo/pdklogo"
		},
		{
			type = "png",
			url = "animation/spine/pdkksks/pdkksks"
		},
		{
			type = "png",
			url = "animation/spine/pdkgaoji/pdkgaoji"
		},
		{
			type = "png",
			url = "animation/spine/pdkchuji/pdkchuji"
		},
		{
			type = "png",
			url = "animation/spine/pdkputong/pdkputong"
		},
		{
			type = "png",
			url = "animation/spine/pdktiyan/pdktiyan"
		},
		{
			type = "png",
			url = "animation/spine/pdkshanguang/pdkshanguang"
		},
		{
			type = "png",
			url = "animation/spine/pdkdsguan/pdkdsguan"
		},
		{
			type = "png",
			url = "animation/spine/pdkfbl/pdkfbl"
		},
		{
			type = "png",
			url = "animation/spine/pdkqidong/pdkqidong"
		}
	}
	slot8 = "plist_pdk_font.plist"
	slot6 = true

	resMgr.loadTextureAtlas(, resMgr, slot0:getSpriteSheetPath(slot0))

	slot0._eventTickTime = {}
	slot4 = slot0

	slot0.initViewSiganl()

	slot4 = slot0

	slot0.initSmartLineSignal()
end

PdkController.onRoomConfigChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMyTableUserDatasDic(slot2) then
		slot8 = gameMgr
		slot11 = Hero
		slot5 = true

		slot0.model.setMyTableUserDatasDic(slot2, slot0.model, {
			[PDK_VIEW_CHAIRID_ME] = gameMgr.getUserData(slot7, Hero.getDwUserID(slot10))
		})
	end
end

PdkController.processAssets = function (slot0, slot1)
	slot4 = slot0.model

	function slot3()
		if slot0 or slot1 then
			slot3 = VIEW_TYPE_BATTLE

			slot2.model.setCurShowingViewType(slot1, slot2.model)
			slot2.model.registerListeners(slot1)

			slot2 = slot2.model

			slot2.model.recoverServerMsgs(slot1)
		else
			slot2 = slot2.model

			if slot2.model.getIsQuickStart(slot1) then
				slot2.onEnterHall(slot1)

				slot3 = false

				slot2.model.setIsQuickStart(slot1, slot2.model)
			end
		end
	end

	if slot0.model.getIsUseCommonHall(slot3) then
		slot3()
	else
		slot10 = slot0.model
		slot11 = slot3

		slot0.updateLoading(slot5, slot0, 100, slot0.model.getLoadingDuration(slot9), slot1, nil)
	end

	slot7 = nil

	slot0.processResource(slot5, slot0)
end

PdkController.startEventTick = function (slot0, slot1, slot2, slot3)
	slot0._eventTick = slot0._eventTick or {}

	if slot3 == nil then
		slot8 = slot0._eventTickTime[slot2] or slot3
		slot4 = tickMgr.delayedCall(slot5, tickMgr, slot1)
	end

	if slot0._eventTick[slot2] then
		slot7 = slot0._eventTick[slot2]

		slot0._eventTick[slot2].destroy(slot6)

		slot0._eventTick[slot2] = nil
	end

	slot0._eventTick[slot2] = slot4
end

PdkController.clearAllEventTick = function (slot0)
	slot0._eventTickTime = {}

	if slot0._eventTick then
		slot3 = slot0._eventTick

		for slot4, slot5 in pairs(slot2) do
			slot8 = slot5

			slot5.destroy(slot7)
		end
	end

	slot0._eventTick = nil
end

PdkController.calSheetPukeNodeWidth = function (slot0, slot1, slot2, slot3)
	return slot2 + (slot1 - 1) * slot3
end

PdkController.calSheetPukeNodePosX = function (slot0, slot1, slot2)
	return (slot2 - 1) * slot1
end

PdkController.sortCardByMoreAndBigger = function (slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot4 = {}
	slot7 = slot1

	for slot8, slot9 in pairs(slot6) do
		if slot9 == true then
			slot13 = slot8

			table.insert(slot11, slot2)
		end
	end

	slot8 = slot2
	slot8 = slot0.model.convertArrToDic(slot6, slot0.model)

	for slot9, slot10 in pairs(slot0.model) do
		slot14 = {
			key = slot9,
			value = slot10
		}

		table.insert(slot12, slot4)
	end

	function slot10(slot0, slot1)
		slot5 = slot1.value

		if table.nums(slot3) ~= table.nums(slot0.value) then
			slot5 = slot1.value

			return table.nums(slot0.value) < table.nums(slot3)
		else
			return slot1.key < slot0.key
		end
	end

	table.sort(slot8, slot4)

	slot9 = slot4

	for slot10, slot11 in ipairs(slot8) do
		slot14 = slot11.value

		for slot15, slot16 in ipairs(slot13) do
			slot20 = slot16

			table.insert(slot18, slot3)
		end
	end

	return slot3
end

PdkController.onClickStartGame = function (slot0)
	slot6 = Hero
	slot5 = PDK_GAMESTATE_READY

	slot0.model.setGameState(gameMgr, slot0.model)

	if gameMgr.getUserData(slot2, Hero.getDwUserID(slot5)).cbUserStatus == US_SIT or slot1.cbUserStatus == US_FREE then
		slot6 = INVALID_WORD

		slot0.requestSitDown(slot3, slot0, INVALID_WORD)
	end
end

PdkController.requestOutCard = function (slot0)
	slot3 = slot0.model

	if slot0.model.getSelectedOutCardsDic(slot2) then
		slot4 = slot1

		if table.nums(slot3) == 0 then
			slot5 = "您选择的牌型不符合规则!"

			tweenMsgMgr.showWhiteMsg(slot3, tweenMsgMgr)

			return
		end
	end

	slot2 = false
	slot6 = slot1
	slot7 = slot0.sortCardByMoreAndBigger(slot4, slot0)
	slot7 = slot0.model
	slot5 = slot0.model.getOutCardInfo(slot0)
	slot6 = slot0:analyzeCardInfo(slot0).ct
	slot9 = slot0

	if not slot0.isFirstHand(slot8) then
		slot9 = slot0

		if slot0.isTurnWinner(slot8) then
			if slot6 ~= nil and slot6 ~= PDK_CT_ERROR then
				slot9 = slot0.model

				if not slot0.model.getCanOnceOutAllCards(slot8) then
					slot2 = slot6 ~= PDK_CT_THREE and slot6 ~= PDK_CT_THREE_LINE and slot6 ~= PDK_CT_THREE_TAKE_ONE and slot6 ~= PDK_CT_PLANE_TAKE_SINGLE_WING
				end
			end
		elseif slot4.ct == slot5.ct then
			if slot6 == PDK_CT_SINGLE_LINE or slot6 == PDK_CT_DOUBLE_LINE or slot6 == PDK_CT_PLANE_TAKE_PAIR_WING then
				slot2 = slot5.dot < slot4.dot and slot4.st == slot5.st
			else
				slot2 = slot5.dot < slot4.dot
			end
		elseif slot4.ct == PDK_CT_BOMB_CARD then
			slot2 = true
		end
	end

	if slot2 then
		slot11 = slot3
		slot10 = slot3

		reqPdkOutCard(slot8, table.nums(slot10))
	else
		slot10 = "您选择的牌型不符合规则!"

		tweenMsgMgr.showWhiteMsg(slot8, tweenMsgMgr)
	end
end

PdkController.hideAllBattleChildrenViews = function (slot0)
	slot4 = false

	slot0.model.setIsShowingMenu(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowingRule(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowingSetting(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowingBank(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowingWin(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowingFailed(slot2, slot0.model)
end

PdkController.resetBattle = function (slot0)
	slot3 = slot0

	slot0.hideAllBattleChildrenViews(slot2)

	slot3 = slot0

	slot0.resetAllInfo(slot2)
end

PdkController.resetAllInfo = function (slot0, slot1)
	slot4 = slot0

	slot0.resetGameInfo(slot3)

	slot5 = slot1

	slot0.resetBaseInfo(slot3, slot0)
end

PdkController.resetGameInfo = function (slot0, slot1)
	slot4 = slot0

	slot0.clearAllEventTick(slot3)

	slot5 = nil

	slot0.model.setSelectedOutCardsDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setSelectedCardsArr(slot3, slot0.model)

	slot5 = nil

	slot0.model.setSelectedCardsDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setMyCards(slot3, slot0.model)

	slot5 = nil

	slot0.model.setMyCardsIndexDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setOutCardsDic(slot3, slot0.model)

	slot5 = 0

	slot0.model.setCardChangeType(slot3, slot0.model)

	slot5 = nil

	slot0.model.setUsersIsOutCardDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setOutCardInfo(slot3, slot0.model)

	slot5 = nil

	slot0.model.setCanOutDataDicValue(slot3, slot0.model)

	slot5 = nil

	slot0.model.setCanOutDataArrValue(slot3, slot0.model)

	slot5 = false

	slot0.model.setCanOutCard(slot3, slot0.model)

	slot5 = nil

	slot0.model.setTipsInfo(slot3, slot0.model)

	slot5 = nil

	slot0.model.setLeaveCardsCountDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setAutoDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setTimeDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setCurResultInfoDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setIsShowAutoIconDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setCurCtScoreDic(slot3, slot0.model)

	slot5 = false

	slot0.model.setIsShowCantOutTxt(slot3, slot0.model)

	slot5 = false

	slot0.model.setIsShowBtnStart(slot3, slot0.model)

	slot5 = false

	slot0.model.setIsShowHandCard(slot3, slot0.model)

	slot5 = false

	slot0.model.setCanOnceOutAllCards(slot3, slot0.model)

	slot5 = nil

	slot0.model.setLockViewDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setWarningEffectDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setIsShowWarningSpineDic(slot3, slot0.model)

	slot5 = nil

	slot0.model.setAndroidCards(slot3, slot0.model)

	slot0.closeString = nil
	slot0.model._recentOutCardUser = nil
	slot0.model._lineType = 0
	slot0.model._tmpCardInitData = nil
	slot5 = true

	slot0.startOrStopMatchLoading(nil, slot0)

	slot4 = slot0.model

	if slot0.model.getCurShowingViewType(nil) == VIEW_TYPE_HALL then
		slot5 = PDK_GAMESTATE_READY

		slot0.model.setGameState(slot3, slot0.model)
	end

	slot5 = false

	slot0.model.setIsHoldBtnStartAtResult(slot3, slot0.model)

	if not slot1 then
		slot5 = false

		slot0.model.setIsHoldBtnStartAtBegin(slot3, slot0.model)
	end

	slot5 = nil

	slot0.model.setStateViewDic(slot3, slot0.model)
end

PdkController.resetBaseInfo = function (slot0)
	return
end

PdkController.calFrontViewChairId = function (slot0, slot1)
	slot2 = 0

	if slot1 > 1 then
		slot2 = slot1 - 1
	elseif slot1 == 1 then
		slot2 = 3
	end

	return slot2
end

PdkController.getGenderStr = function (slot0, slot1)
	slot5 = slot1

	if gameMgr.getUserDataByChairId(slot3, gameMgr) then
		return (slot2.wGender == 1 and "m") or "w"
	else
		return "w"
	end
end

PdkController.getCsbPathBB = function (slot0, slot1)
	slot5 = slot0

	return "module/" .. slot0.getModuleName(slot4) .. "/csb/" .. (slot1 or "")
end

PdkController.destroy = function (slot0)
	slot0.model = nil
end

PdkController.try2ExitBattle = function (slot0)
	slot0._exitBattlePopupKey = "确定退出本局游戏？"
	slot3 = gameMgr
	slot6 = Hero

	if gameMgr.getUserData(slot2, Hero.getDwUserID(slot5)) and slot1.cbUserStatus == US_PLAYING then
		slot5 = "游戏中不能退出"

		tweenMsgMgr.showWhiteMsg(slot3, tweenMsgMgr)
	else
		function slot2()
			slot2 = slot0

			slot0.requestExitBattle(slot1)

			slot2 = slot0.requestExitBattle.model
			slot2 = slot0.requestExitBattle.model.getExitGameSignal(slot1)

			slot0.requestExitBattle.model.getExitGameSignal(slot1).emit(slot1)
		end

		slot5 = slot0.model

		if slot0.model.getRoomKind(slot4) == 1 then
			slot0._exitBattlePopupKey = TIP_EXPERIENCE_ROOM_EXIT
			slot7 = slot2

			popupMgr.showConfirm(slot4, popupMgr, slot0._exitBattlePopupKey)
		else
			slot2()
		end
	end
end

PdkController.notifyLeaveGame = function (slot0)
	slot0.isFromSitDownFailed = true
	slot3 = slot0

	BaseGameController.notifyLeaveGame(slot2)
end

PdkController.exitBattle = function (slot0)
	slot3 = slot0

	slot0.hideBattlePopups(slot2)

	slot3 = slot0

	slot0.resetBattle(slot2)

	slot3 = slot0

	slot0.stopPraticeTipsTick(slot2)

	slot4 = false

	gameMgr.setIsStartGame(slot2, gameMgr)

	if slot0.isFromSitDownFailed then
		slot4 = VIEW_TYPE_HALL

		slot0.model.setCurShowingViewType(slot2, slot0.model)

		slot0.isFromSitDownFailed = nil
	else
		slot3 = slot0

		slot0.exitHall(slot2)
	end

	slot3 = slot0.model

	if slot0.model.getIsUseCommonHall(slot2) then
		slot4 = nil

		slot0.model.setCurShowingViewType(slot2, slot0.model)

		slot3 = slot0

		slot0.exitGame(slot2)
	end

	slot0._enterForeground = false
end

PdkController.onBtnChangedClick = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCurShowingViewType(slot2) == VIEW_TYPE_BATTLE_REPORT then
		slot4 = "观看牌局回放时不能进行此操作！"

		tweenMsgMgr.showRedMsg(slot2, tweenMsgMgr)
	else
		slot3 = slot0.model

		if slot0.model.getCurShowingViewType(slot2) == VIEW_TYPE_HALL then
			slot5 = INVALID_WORD

			slot0.requestSitDown(slot2, slot0, INVALID_WORD)
		else
			slot3 = gameMgr
			slot6 = Hero

			if gameMgr.getUserData(slot2, Hero.getDwUserID(slot5)) and (slot1.cbUserStatus == US_PLAYING or slot1.cbUserStatus == US_OFFLINE) then
				slot5 = "游戏中无法换桌!"

				tweenMsgMgr.showRedMsg(slot3, tweenMsgMgr)
			else
				slot0.isChangingTable = true
				slot5 = false

				slot0.model.setIsAuto(slot3, slot0.model)

				slot5 = true

				slot0.model.setIsFirstRound(slot3, slot0.model)

				slot4 = slot0

				slot0.stopCdTimer(slot3)

				slot4 = audioMgr

				audioMgr.resetVolume(slot3)

				slot6 = INVALID_WORD

				slot0.doRequestSitDown(slot3, slot0, INVALID_WORD)
			end
		end
	end
end

PdkController.requestSitDown = function (slot0, slot1, slot2, slot3)
	slot0.isChangingTable = true
	slot6 = slot0

	slot0.startOrStopMatchLoading(slot5)

	slot8 = true

	slot0.model.setIsHoldBtnStartAtBegin(slot5, slot0.model, true)

	slot9 = slot3

	BaseGameController.requestSitDown(slot5, slot0, slot1, slot2)
end

PdkController.doRequestSitDown = function (slot0, slot1, slot2, slot3)
	slot0.isChangingTable = true
	slot6 = slot0

	slot0.startOrStopMatchLoading(slot5)

	slot8 = true

	slot0.model.setIsHoldBtnStartAtBegin(slot5, slot0.model, true)

	slot9 = slot3

	BaseGameController.doRequestSitDown(slot5, slot0, slot1, slot2)
end

PdkController.requestEnterRoomByRoomKind = function (slot0)
	slot5 = slot0.model.getRoomKind(slot2)

	BaseGameController.requestEnterRoom(slot0.model, slot0)
end

PdkController.addEventTickTime = function (slot0, slot1, slot2)
	slot0._eventTickTime = slot0._eventTickTime or {}
	slot0._eventTickTime[slot1] = (slot0._eventTickTime[slot1] or 0) + slot2
end

PdkController.playBgm = function (slot0, slot1, slot2)
	slot7 = slot2

	slot0.playGameEffect(slot4, slot0, "bgm/" .. slot1)
end

PdkController.playEffect = function (slot0, slot1, slot2)
	slot7 = slot2

	slot0.playGameEffect(slot4, slot0, "effect/" .. slot1)
end

PdkController.onSystemMessage = function (slot0, slot1)
	slot5 = SMT_CLOSE_GAME

	if bit.band(slot3, slot1.wType) ~= 0 then
		slot0.isFromCloseGame = true
		slot0.closeString = slot1.szString
	else
		slot5 = SMT_EJECT

		if bit.band(slot3, slot1.wType) ~= 0 then
			slot5 = slot1.szString

			popupMgr.showConfirm(slot3, popupMgr)
		else
			slot5 = SMT_PROMPT

			if bit.band(slot3, slot1.wType) ~= 0 then
				slot5 = slot1.szString

				tweenMsgMgr.showMsg(slot3, tweenMsgMgr)
			else
				slot5 = SMT_CHAT

				if bit.band(slot3, slot1.wType) ~= 0 then
				end
			end
		end
	end
end

PdkController.startOrStopMatchLoading = function (slot0, slot1)
	slot6 = true

	popupMgr.setIsFordbidNormalActivityIndicator(slot3, popupMgr, not slot1)

	slot6 = true

	slot0.model.setIsShowingMatchFloat(slot3, slot0.model, not slot1)
end

PdkController.getCurClockTime = function (slot0)
	slot1 = nil
	slot2 = slot0.model.getGameState(slot3)
	slot3 = slot0.model.getTimeDic(slot0.model) or {}
	slot6 = slot0.model
	slot4 = slot0.model.getCurrentUser(slot0.model)

	if slot2 == PDK_GAMESTATE_PLAY then
		slot5 = slot3[slot2] or {}
		slot8 = slot0

		if slot0.isNonOutCard(slot7) then
			slot1 = slot5.timeStart
		else
			slot8 = slot0.model

			if slot0.model.getOutCardInfo(slot7) ~= nil and slot4 == PDK_VIEW_CHAIRID_ME then
				slot9 = slot0.model

				if not slot0.model.getCanOutCard(slot8) then
					slot1 = 5
				end
			end

			if slot1 == nil then
				slot1 = slot5.timeOut
			end
		end
	else
		slot1 = slot3[slot2]
	end

	return slot1
end

PdkController.onEnterBattle = function (slot0)
	slot3 = slot0

	BaseGameController.onEnterBattle(slot2)

	slot4 = PDK_GAMESTATE_READY

	slot0.model.setGameState(slot2, slot0.model)
end

PdkController.requestPassCard = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getCanOutCard(slot2) then
		reqPdkPassCard()
	end
end

PdkController.requestAuto = function (slot0, slot1)
	slot4 = slot1

	reqPdkAuto(slot3)
end

PdkController.tryOnceOutAllCards = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCanOnceOutAllCards(slot2) then
		slot1 = {}
		slot6 = slot0.model

		for slot5, slot6 in pairs(slot0.model.getMyCards(slot5)) do
			slot1[slot6] = true
		end

		slot6 = true

		slot0.model.setSelectedOutCardsDic(slot3, slot0.model, slot1)

		slot4 = slot0

		slot0.requestOutCard(slot3)
	end
end

PdkController.requestExitBattle = function (slot0, slot1, slot2)
	slot8 = Hero
	slot8 = true

	reqForceStandUp(slot4, Hero.getWTableID(slot6), Hero.getWChairID(Hero), false)

	slot0._exitCallback = slot1
	slot0._needExitHallWhileWithHall = slot2
end

PdkController.onForceLeaveGame = function (slot0, slot1)
	if slot1.cbRet == 1 then
		slot5 = true

		slot0.startOrStopMatchLoading(slot3, slot0)

		slot4 = slot0

		slot0.exitBattle(slot3)

		slot0._exitCallback = nil
		slot0._needExitHallWhileWithHall = nil
	else
		slot5 = "游戏开始了, 不能退出"

		tweenMsgMgr.showRedMsg(slot3, tweenMsgMgr)
	end
end

PdkController.onEnterForeground = function (slot0)
	slot3 = slot0

	BaseGameController.onEnterForeground(slot2)

	slot4 = CARD_CHANGE_RECONNECT

	slot0.model.setCardChangeType(slot2, slot0.model)

	slot3 = slot0.model
	slot3 = slot0.model.getEnterForegroundSignal(slot2)

	slot0.model.getEnterForegroundSignal(slot2).emit(slot2)
end

return
