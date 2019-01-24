JxlwModel = class(slot1)

JxlwModel.ctor = function (slot0)
	slot10 = true

	ClassUtil.extends(slot2, slot0, BaseGameModel, true, GameKind_JXLW, nil, nil, nil)

	slot0._loadingDuration = 1
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

	createSetterGetter(slot2, slot0, "hideLines", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "resultMultiples", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "baseBet", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "betMultiple", 1)

	slot6 = true

	createSetterGetter(slot2, slot0, "lineNumber", 1)

	slot6 = true

	createSetterGetter(slot2, slot0, "jackpot", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "totalWin", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "winThisTime", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "slots", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "result", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "forceUpdateState", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "freeTimes", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "freeTimesOffset", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "currentWin", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "resetSlotState", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "jackpotMessage", true)

	slot0.spineLogoKeyInLoading = "jxlw_logoqdlg"
	slot0.useCustomizedLogoAnimation = true
	slot0.logoAnimationConfig = {
		"start",
		"idle"
	}
	slot0._loadingDuration = 2
	slot0.musicBg = "music-tiger-bg.mp3"
end

JxlwModel.destroy = function (slot0)
	return
end

CONFIG_HEAD_BG = CONFIG_HEAD_BG or {}
slot5 = SEX_TYPE.BOY
CONFIG_HEAD_BG[tostring("JxlwModel") .. tostring(GameKind_JXLW) .. tostring(GAME_STATE.ROOM)] = "gameres/module/jxlw/ui/room/jxlw_Game_Head_Bg_Boy.png"
slot5 = SEX_TYPE.GIRL
CONFIG_HEAD_BG[tostring("gameres/module/jxlw/ui/room/jxlw_Game_Head_Bg_Boy.png") .. tostring(GameKind_JXLW) .. tostring(GAME_STATE.ROOM)] = "gameres/module/jxlw/ui/room/jxlw_Game_Head_Bg_Girl.png"

return
