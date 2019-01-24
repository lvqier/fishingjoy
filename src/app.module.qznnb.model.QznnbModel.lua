CONFIG_HEAD_BG = CONFIG_HEAD_BG or {}
CONFIG_HEAD_BG[tostring(GameKind_QZNNB) .. tostring(GAME_STATE.ROOM) .. tostring(SEX_TYPE.BOY)] = "gameres/module/qznnb/ui/common/Qznnb_Room_Head_Bg_Boy.png"
CONFIG_HEAD_BG[tostring(GameKind_QZNNB) .. tostring(GAME_STATE.ROOM) .. tostring(SEX_TYPE.GIRL)] = "gameres/module/qznnb/ui/common/Qznnb_Room_Head_Bg_Girl.png"
CONFIG_HEAD_BG[tostring(GameKind_QZNNB) .. tostring(GAME_STATE.TABLE) .. tostring(SEX_TYPE.BOY)] = "gameres/module/qznnb/ui/common/Qznnb_Table_Head_Bg_Boy.png"
CONFIG_HEAD_BG[tostring(GameKind_QZNNB) .. tostring(GAME_STATE.TABLE) .. tostring(SEX_TYPE.GIRL)] = "gameres/module/qznnb/ui/common/Qznnb_Table_Head_Bg_Girl.png"
CONFIG_HEAD_BG[tostring(GameKind_QZNNB) .. tostring(GAME_STATE.BATTLE) .. tostring(SEX_TYPE.BOY)] = "gameres/module/qznnb/ui/common/Qznnb_Game_Head_Bg_Boy.png"
CONFIG_HEAD_BG[tostring(GameKind_QZNNB) .. tostring(GAME_STATE.BATTLE) .. tostring(SEX_TYPE.GIRL)] = "gameres/module/qznnb/ui/common/Qznnb_Game_Head_Bg_Girl.png"
QznnbModel = class("QznnbModel")

QznnbModel.ctor = function (slot0)
	slot1 = nil

	if IS_HL_VERSION then
		slot1 = nil
	end

	ClassUtil.extends(slot0, BaseGameModel, true, GameKind_QZNNB, slot1, nil, nil, true)
	createSetterGetter(slot0, "chairCount", 5, nil, false)
	createSetterGetter(slot0, "isBlind", true, nil, false)
	createSetterGetter(slot0, "needGameStartSendCard", false, true)
	createSetterGetter(slot0, "gameState", QZNNB_GAME_SCENE_FREE, true)
	createSetterGetter(slot0, "isShowingBtnBack", false, true)
	createSetterGetter(slot0, "isShowingBtnHelp", false, true)
	createSetterGetter(slot0, "isShowingLogo", false, true)
	createSetterGetter(slot0, "isShowingPlayerInfo", false, true)
	createSetterGetter(slot0, "isShowingMainScore", false, true)
	createSetterGetter(slot0, "isShowingQuickStart", false, true)
	createSetterGetter(slot0, "isShowingRoomTxt", false, true)
	createSetterGetter(slot0, "isShowingRuleTip", false, true)
	createSetterGetter(slot0, "tableDatas", {}, true)
	createSetterGetter(slot0, "cbDynamicJoin", false, true)
	createSetterGetter(slot0, "isShowingCd", true, true)
	createSetterGetter(slot0, "isShowingAuto", false, true)
	createSetterGetter(slot0, "isShowingBet", false, true)
	createSetterGetter(slot0, "isShowingRobTimes", false, true)
	createSetterGetter(slot0, "isShowingReady", false, true)
	createSetterGetter(slot0, "isShowingBattle", false, true)
	createSetterGetter(slot0, "isShowingCallBanker", false, true)
	createSetterGetter(slot0, "isShowingBanker", false, true)
	createSetterGetter(slot0, "isShowingBetMoney", false, true)
	createSetterGetter(slot0, "canShowTanPai", false, true)
	createSetterGetter(slot0, "canShowStart", false, true)
	createSetterGetter(slot0, "canShowReadyStart", true, true)
	createSetterGetter(slot0, "tipType", nil, true)
	createSetterGetter(slot0, "isShowingResult", false, true)
	createSetterGetter(slot0, "myTableUserData", {}, true)
	createSetterGetter(slot0, "otherUserData", nil, true)
	createSetterGetter(slot0, "autoBetType", nil, true)
	createSetterGetter(slot0, "isAuto", false, true)
	createSetterGetter(slot0, "tanPaiCurrentUser", 0, true)
	createSetterGetter(slot0, "tanPaiUser", {}, true)
	createSetterGetter(slot0, "cbMaxCallMultiple", 0, true)
	createSetterGetter(slot0, "cbMaxBetMultiple", 0, true)
	createSetterGetter(slot0, "bankUserChairId", 0, true)
	createSetterGetter(slot0, "closeScore", 0, true)
	createSetterGetter(slot0, "gameScore", nil, true)
	createSetterGetter(slot0, "gameTax", nil, true)
	createSetterGetter(slot0, "cbPlayStatus", {}, true)
	createSetterGetter(slot0, "allGameBet", {}, true)
	createSetterGetter(slot0, "gameBet", nil, true)
	createSetterGetter(slot0, "allRobTimes", {}, true)
	createSetterGetter(slot0, "robTimes", nil, true)
	createSetterGetter(slot0, "myCard", nil, true)
	createSetterGetter(slot0, "sendCardData", nil, true)
	createSetterGetter(slot0, "exitUser", {}, true)
	createSetterGetter(slot0, "fleeInfo", {}, true)
	createSetterGetter(slot0, "lCellScore", 0, true)
	createSetterGetter(slot0, "playerCdsDic", {}, true)

	slot0.tableArtNumPrefix = "#qznnb_table_%s.png"
	slot0._loadingDuration = 0.7
	slot0.spineLogoKeyInLoading = "qznnb_logo"

	if NEED_CHANGE_SUB_GAME_NAME then
		slot0._loadingDuration = 0
		slot0.spineLogoKeyInLoading = nil
	end
end

QznnbModel.setMyUserData = function (slot0, slot1)
	slot0._myTableUserData[1] = slot1
end

QznnbModel.getMyUserData = function (slot0)
	return slot0._myTableUserData[1]
end

QznnbModel.getOnlineIconPath = function (slot0, slot1)
	slot2 = nil

	return (slot1 ~= 0 or ResConfig.getAssetPath("module/qznnb/ui/common/Qznnb_Hall_tb2.png")) and ResConfig.getAssetPath("module/qznnb/ui/common/Qznnb_Hall_tb1.png")
end

QznnbModel.calBetMoney = function (slot0, slot1)
	slot2 = nil
	slot3 = {}

	if slot0._cbMaxBetMultiple >= 40 then
		table.insert(slot3, 5)
		table.insert(slot3, 10)
		table.insert(slot3, 20)
		table.insert(slot3, slot0._cbMaxBetMultiple)
	elseif slot0._cbMaxBetMultiple >= 20 then
		table.insert(slot3, 5)
		table.insert(slot3, 10)
		table.insert(slot3, slot0._cbMaxBetMultiple)
	elseif slot0._cbMaxBetMultiple > 5 then
		table.insert(slot3, 5)
		table.insert(slot3, slot0._cbMaxBetMultiple)
	else
		table.insert(slot3, 5)
	end

	return slot3[slot1]
end

QznnbModel.destroy = function (slot0)
	return
end

return
