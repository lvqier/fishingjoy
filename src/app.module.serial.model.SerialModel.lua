SerialModel = class("SerialModel")

SerialModel.ctor = function (slot0)
	ClassUtil.extends(slot0, BaseGameModel, true, GameKind_SERIAL, nil, nil, false, true)
	createSetterGetter(slot0, "isShowingConfirm", false, true)
	createSetterGetter(slot0, "isShowingExit", false, true)
	createSetterGetter(slot0, "isShowingLjRule", false, true)
	createSetterGetter(slot0, "brickNumber", 15, false)
	createSetterGetter(slot0, "needEraseBrick", 0, false)
	createSetterGetter(slot0, "betScore", 0, false)
	createSetterGetter(slot0, "diamondArray", {}, false)
	createSetterGetter(slot0, "betMultipleArray", {}, false)
	createSetterGetter(slot0, "betMultipleArrayCount", 1, false)
	createSetterGetter(slot0, "winTotalScore", 0, false)
	createSetterGetter(slot0, "winChapterScore", 0, false)
	createSetterGetter(slot0, "betMultipleIndex", 0, false)
	createSetterGetter(slot0, "betLine", 1, false)
	createSetterGetter(slot0, "chapter", 1, false)
	createSetterGetter(slot0, "cellScore", 1, false)
	createSetterGetter(slot0, "gameBaseJet")
	createSetterGetter(slot0, "jackpotScore", 0, false)
	createSetterGetter(slot0, "totalScoreCarry", 0, false)
	createSetterGetter(slot0, "chapterScoreCarry", 0, true)
	createSetterGetter(slot0, "userScoreCarry", 0, true)
	createSetterGetter(slot0, "dragonExplore", nil, false)
	createSetterGetter(slot0, "accumulateScore", 0, false)
	createSetterGetter(slot0, "treasureInfo", {}, false)
	createSetterGetter(slot0, "replayPlayerData", nil, true)
	createSetterGetter(slot0, "replayChatData", nil, true)
	createSetterGetter(slot0, "replayingId", -1, nil)
	createSetterGetter(slot0, "bReplaying", false, nil)
	createSetterGetter(slot0, "bReplayingAndShowing", false, nil)
	createSetterGetter(slot0, "broadcastAwardData", {}, nil)
	createSetterGetter(slot0, "brickEraseReplay", 0, nil)
	createSetterGetter(slot0, "isGameInit", false, nil)
	createSetterGetter(slot0, "videoSelectedItem", nil, nil)

	slot0.musicBg = Serial.Sound.RoomBg
	slot0.useCustomizedLogoAnimation = true
	slot0.spineLogoKeyInLoading = "lhdb_logo"
	slot0.logoAnimationConfig = {
		"start",
		"idle"
	}
	slot0._loadingDuration = 3.5
end

SerialModel.setTime = function (slot0, slot1)
	slot0._curTime = slot1
end

SerialModel.destroy = function (slot0)
	BaseGameModel.destroy(slot0)
end

return
