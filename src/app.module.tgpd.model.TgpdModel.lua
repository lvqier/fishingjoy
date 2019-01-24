slot2 = "TgpdModel"
TgpdModel = class(slot1)

TgpdModel.ctor = function (slot0)
	slot10 = true

	ClassUtil.extends(slot2, slot0, BaseGameModel, true, GameKind_TGPD, nil, nil, false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingConfirm", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingExit", false)

	slot6 = false

	createSetterGetter(slot2, slot0, "brickNumber", 15)

	slot6 = false

	createSetterGetter(slot2, slot0, "needEraseBrick", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "diamondArray", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "betMultipleArray", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "betMultipleArrayCount", 1)

	slot6 = true

	createSetterGetter(slot2, slot0, "winChapterScore", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "winSessionScore", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "betMultipleIndex", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "betLine", 1)

	slot6 = false

	createSetterGetter(slot2, slot0, "chapter", 1)

	slot6 = false

	createSetterGetter(slot2, slot0, "cellScore", 1)

	slot4 = "gameBaseJet"

	createSetterGetter(slot2, slot0)

	slot6 = false

	createSetterGetter(slot2, slot0, "jackpotScore", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "totalScoreCarry", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "chapterScoreCarry", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "userScoreCarry", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "brickNumberCarry", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "freeCandyTimes", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "freeCandyTimesSession", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "broadcastData", {})

	slot0.useCustomizedLogoAnimation = true
	slot0.spineLogoKeyInLoading = "tgpd_loading"
	slot0.logoAnimationConfig = {
		"start",
		"idle"
	}
	slot0._loadingDuration = 3.5
end

TgpdModel.setTime = function (slot0, slot1)
	slot0._curTime = slot1
end

TgpdModel.destroy = function (slot0)
	slot3 = slot0

	BaseGameModel.destroy(slot2)
end

return
