CONFIG_HEAD_BG = CONFIG_HEAD_BG or {}
slot5 = SEX_TYPE.BOY
CONFIG_HEAD_BG[tostring(slot2) .. tostring(GameKind_LRNN) .. tostring(GAME_STATE.ROOM)] = "gameres/module/lrnn/ui/common/Lrnn_Room_Head_Bg_Boy.png"
slot5 = SEX_TYPE.GIRL
CONFIG_HEAD_BG[tostring("gameres/module/lrnn/ui/common/Lrnn_Room_Head_Bg_Boy.png") .. tostring(GameKind_LRNN) .. tostring(GAME_STATE.ROOM)] = "gameres/module/lrnn/ui/common/Lrnn_Room_Head_Bg_Girl.png"
slot5 = SEX_TYPE.BOY
CONFIG_HEAD_BG[tostring("gameres/module/lrnn/ui/common/Lrnn_Room_Head_Bg_Girl.png") .. tostring(GameKind_LRNN) .. tostring(GAME_STATE.TABLE)] = "gameres/module/lrnn/ui/common/Lrnn_Table_Head_Bg_Boy.png"
slot5 = SEX_TYPE.GIRL
CONFIG_HEAD_BG[tostring("gameres/module/lrnn/ui/common/Lrnn_Table_Head_Bg_Boy.png") .. tostring(GameKind_LRNN) .. tostring(GAME_STATE.TABLE)] = "gameres/module/lrnn/ui/common/Lrnn_Table_Head_Bg_Girl.png"
slot5 = SEX_TYPE.BOY
CONFIG_HEAD_BG[tostring("gameres/module/lrnn/ui/common/Lrnn_Table_Head_Bg_Girl.png") .. tostring(GameKind_LRNN) .. tostring(GAME_STATE.BATTLE)] = "gameres/module/lrnn/ui/common/Lrnn_Game_Head_Bg_Boy.png"
slot5 = SEX_TYPE.GIRL
CONFIG_HEAD_BG[tostring("gameres/module/lrnn/ui/common/Lrnn_Game_Head_Bg_Boy.png") .. tostring(GameKind_LRNN) .. tostring(GAME_STATE.BATTLE)] = "gameres/module/lrnn/ui/common/Lrnn_Game_Head_Bg_Girl.png"
slot2 = "LrnnModel"
LrnnModel = class(tostring("gameres/module/lrnn/ui/common/Lrnn_Game_Head_Bg_Boy.png") .. tostring(GameKind_LRNN) .. tostring(GAME_STATE.BATTLE))

LrnnModel.ctor = function (slot0)
	slot10 = true

	ClassUtil.extends(slot2, slot0, BaseGameModel, true, GameKind_LRNN, 2, nil, nil)

	slot7 = true

	createSetterGetter(slot2, slot0, "chairCount", 6, nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "gameState", LRNN_GAME_SCENE_FREE)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingBtnBack", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingBtnHelp", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingLogo", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingPlayerInfo", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingMainScore", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingQuickStart", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingRoomTxt", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "tableDatas", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "cbDynamicJoin", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingCd", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingPoolRule", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingPoolList", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingSelectRoomType", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingReady", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingBattle", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "canShowTanPai", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "canShowStart", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "canShowReadyStart", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "tipType", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingResult", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isPoolRoom", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "myTableUserData", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "otherUserData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "autoBetType", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "isAuto", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "tanPaiCurrentUser", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "tanPaiUser", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "turnMaxScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "bankUserChairId", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "closeScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "gameScore", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "gameTax", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "cbPlayStatus", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "allGameBet", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "gameBet", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "sendCardData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "exitUser", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "lCellScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "caijin", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "caijinInfo", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "lAllCaijin", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "lGetCaijin", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "playerCdsDic", {})

	slot0._loadingDuration = 0.7
	slot0.spineLogoKeyInLoading = "tbnnlogo"

	if NEED_CHANGE_SUB_GAME_NAME then
		slot0._loadingDuration = 0
		slot0.spineLogoKeyInLoading = nil
	end
end

LrnnModel.setMyUserData = function (slot0, slot1)
	slot0._myTableUserData[1] = slot1
end

LrnnModel.getMyUserData = function (slot0)
	return slot0._myTableUserData[1]
end

LrnnModel.getOnlineIconPath = function (slot0, slot1)
	slot2 = nil

	if slot1 == 0 then
		slot5 = "module/lrnn/ui/common/Lrnn_Hall_tb2.png"
		slot2 = ResConfig.getAssetPath(slot4)
	else
		slot5 = "module/lrnn/ui/common/Lrnn_Hall_tb1.png"
		slot2 = ResConfig.getAssetPath(slot4)
	end

	return slot2
end

LrnnModel.calBetMoney = function (slot0, slot1)
	slot2 = 0

	if slot0._turnMaxScore and slot0._turnMaxScore > 0 then
		slot7 = slot1 - 1
		slot2 = slot0._turnMaxScore / math.pow(slot5, 2)
	end

	slot7 = slot2

	return math.max(slot4, math.floor(1))
end

LrnnModel.destroy = function (slot0)
	return
end

return
