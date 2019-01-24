slot2 = "BaseGameModel"
BaseGameModel = class(slot1)
VIEW_TYPE_ROOM = 1
VIEW_TYPE_HALL = 2
VIEW_TYPE_BATTLE = 3
VIEW_TYPE_BATTLE_REPORT = 4
GAMEMODEL_FREE = 1
GAMEMODEL_COMPETITION = 2
SMT_CHAT = 1
SMT_EJECT = 2
SMT_GLOBAL = 4
SMT_PROMPT = 8
SMT_TABLE_ROLL = 16
SMT_CLOSE_ROOM = 256
SMT_CLOSE_GAME = 512
SMT_CLOSE_LINK = 1024

BaseGameModel.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot10 = slot5 and IS_ADJUST_SLIM_WIDTH

	createSetterGetter(slot7, slot0, "isAdjustSlimWidth")

	slot10 = false

	createSetterGetter(slot7, slot0, "isNotAdjustMenuSlimWidth")

	slot11 = nil

	createSetterGetter(slot7, slot0, "gameKind", slot1)

	slot11 = true

	createSetterGetter(slot7, slot0, "gameModel", 1)

	slot11 = nil

	createSetterGetter(slot7, slot0, "isUseCommonHall", slot3)

	slot12 = true

	createSetterGetter(slot7, slot0, "isPortrait", slot4 or false, nil)

	slot11 = true

	createSetterGetter(slot7, slot0, "isShowingWin", nil)

	slot11 = true

	createSetterGetter(slot7, slot0, "isShowingFailed", nil)

	slot11 = true

	createSetterGetter(slot7, slot0, "isShowingMenu", false)

	slot18 = slot0.onShowingBankChanged

	createSetterGetter(slot7, slot0, "isShowingBank", false, true, nil, nil, handler(slot16, slot0))

	slot18 = slot0.onShowingRuleChanged

	createSetterGetter(slot7, slot0, "isShowingRule", false, true, nil, nil, handler(slot16, slot0))

	slot11 = true

	createSetterGetter(slot7, slot0, "isShowingSetting", false)

	slot10 = 0

	createSetterGetter(slot7, slot0, "chargePopupYOffset")

	slot11 = true

	createSetterGetter(slot7, slot0, "countdownData", {})

	slot11 = true

	createSetterGetter(slot7, slot0, "curChatTabIndex", 1)

	slot11 = true

	createSetterGetter(slot7, slot0, "bBattle", false)

	slot11 = true

	createSetterGetter(slot7, slot0, "isShowingOnline", false)

	slot11 = true

	createSetterGetter(slot7, slot0, "isShowingLoading", false)

	slot11 = true

	createSetterGetter(slot7, slot0, "isShowingBattleLoading", false)

	slot11 = true

	createSetterGetter(slot7, slot0, "loadingDuration", 1)

	slot11 = true

	createSetterGetter(slot7, slot0, "loadingPercent", 0)

	slot11 = true

	createSetterGetter(slot7, slot0, "loadingTxt", "")

	slot11 = true

	createSetterGetter(slot7, slot0, "roomKind", 0)

	slot11 = true

	createSetterGetter(slot7, slot0, "curShowingViewType", nil)

	slot11 = true

	createSetterGetter(slot7, slot0, "switchStatePos", {})

	slot9 = "showSignal"

	createSetterGetter(slot7, slot0, SignalAs3.new())

	slot9 = "hideSignal"

	createSetterGetter(slot7, slot0, SignalAs3.new())

	slot11 = true

	createSetterGetter(slot7, slot0, "tableDatas", {})

	slot11 = true

	createSetterGetter(slot7, slot0, "tableCol", slot2)

	slot10 = nil

	createSetterGetter(slot7, slot0, "gameProxy")

	slot11 = true

	createSetterGetter(slot7, slot0, "isAuto", false)

	slot11 = false

	createSetterGetter(slot7, slot0, "isFirstRound", true)

	slot11 = true

	createSetterGetter(slot7, slot0, "cbDynamicJoin", false)

	slot11 = false

	createSetterGetter(slot7, slot0, "isQuickStart", false)

	slot11 = true

	createSetterGetter(slot7, slot0, "isShowingChat", false)

	slot11 = false

	createSetterGetter(slot7, slot0, "isChatMoveFinish", true)

	slot10 = false

	createSetterGetter(slot7, slot0, "isStopTouchNext")

	slot11 = true

	createSetterGetter(slot7, slot0, "chatInfos", {})

	slot10 = false

	createSetterGetter(slot7, slot0, "hasShowTiYanTipsAfterEnterBattle")

	slot10 = 100

	createSetterGetter(slot7, slot0, "delay2ScloseSocketMs")

	slot11 = true

	createSetterGetter(slot7, slot0, "selfRedPacketData", nil)

	slot11 = true

	createSetterGetter(slot7, slot0, "otherRedPacketData", nil)

	slot0.onlineDataCount = 3
	slot0.musicBg = nil
	slot0.tableArtNumPrefix = nil
	slot0.spineLogoKeyInLoading = nil
	slot8 = slot0

	slot0.initStaticChatContent(slot7)
end

BaseGameModel.onShowingBankChanged = function (slot0)
	return
end

BaseGameModel.onShowingRuleChanged = function (slot0)
	return
end

BaseGameModel.initStaticChatContent = function (slot0)
	slot6 = {
		{
			id = 1,
			content = "快点吧！我等得花儿也谢了！"
		},
		{
			id = 2,
			content = "别着急，让我再想一会儿！"
		},
		{
			id = 3,
			content = "不好意思，刚才卡了一下"
		},
		{
			id = 4,
			content = "不要走，决战到天亮"
		},
		{
			id = 5,
			content = "又断线了，你用的是蜘蛛网吗？"
		},
		{
			id = 6,
			content = "我的！全是我的！"
		},
		{
			id = 7,
			content = "有运气为什么要用技术！"
		},
		{
			id = 8,
			content = "辛辛苦苦几十年，一把回到解放前"
		},
		{
			id = 9,
			content = "运气来了，挡都档不住，哈哈！"
		},
		{
			id = 10,
			content = "老铁，体会过绝望么？"
		}
	}

	createSetterGetter(slot3, slot0, "staticChatConfig")
end

BaseGameModel.getModuleName = function (slot0)
	slot5 = slot0.getGameKind(slot2)

	if not gameMgr.getGameConfig(slot0, gameMgr) or not slot2.res then
		slot6 = slot1

		print(slot4, "not exist config res path name. gameKind:")
	end

	return slot2 and slot2.res
end

BaseGameModel.getResModulePath = function (slot0, slot1)
	slot7 = slot0
	slot4 = "module/" .. slot0.getModuleName(slot6) .. "/" .. (slot1 or "")

	return ResConfig.getAssetPath(slot3)
end

BaseGameModel.getCsbPath = function (slot0, slot1)
	slot5 = "csb/" .. slot1

	return slot0.getResModulePath(slot3, slot0)
end

BaseGameModel.getUIPath = function (slot0, slot1)
	slot5 = "ui/" .. slot1

	return slot0.getResModulePath(slot3, slot0)
end

BaseGameModel.getSoundPath = function (slot0, slot1)
	slot5 = "sound/" .. slot1

	return slot0.getResModulePath(slot3, slot0)
end

BaseGameModel.getSpriteSheetPath = function (slot0, slot1)
	slot5 = "spritesheet/" .. slot1

	return slot0.getResModulePath(slot3, slot0)
end

BaseGameModel.getSpinePath = function (slot0, slot1)
	slot5 = "animation/spine/" .. slot1

	return slot0.getResModulePath(slot3, slot0)
end

BaseGameModel.getParticlePath = function (slot0, slot1)
	slot5 = "animation/particle/" .. slot1

	return slot0.getResModulePath(slot3, slot0)
end

BaseGameModel.getOnlineIconPath = function (slot0, slot1)
	slot2 = nil

	if slot1 == 0 then
		slot5 = "ui/common/pic/xfh_xzDN.png"
		slot2 = ResConfig.getAssetPath(slot4)
	else
		slot5 = "ui/common/pic/xfh_xzSJ.png"
		slot2 = ResConfig.getAssetPath(slot4)
	end

	return slot2
end

BaseGameModel.getOnlineIconBy = function (slot0, slot1)
	slot5 = slot1
	slot9 = 3
	deviceIconHtml = HtmlUtil.createImg(slot0, slot0.getOnlineIconPath(slot3, slot0), nil, 25, nil)

	return deviceIconHtml
end

BaseGameModel.isMeBanker = function (slot0)
	return false
end

BaseGameModel.destroy = function (slot0)
	slot3 = slot0

	SignalAs3.clearAllSignal(slot2)
end

return
