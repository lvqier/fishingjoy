YSZ_GAME_PLAYER = 5
YSZ_GAME_NAME = "诈金花"
YSZ_MAX_COUNT = 3
YSZ_GER_NO_PLAYER = 16
YSZ_GER_COMPARECARD = 32
YSZ_GER_OPENCARD = 48
YSZ_READY_TIME = 3
YSZ_HANDLE_TIME = 30
YSZ_GS_T_FREE = GAME_STATUS_FREE
YSZ_GS_T_SCORE = GAME_STATUS_PLAY
YSZ_GS_T_PLAYING = GAME_STATUS_PLAY + 1
YSZ_GAME_SCENE_FREE = GAME_STATUS_FREE
YSZ_GAME_SCENE_BANK = GAME_STATUS_PLAY
YSZ_GAME_SCENE_BET = GAME_STATUS_PLAY + 1
YSZ_GAME_SCENE_END = GAME_STATUS_PLAY + 2
YSZ_GAME_USER_MAGER = 536870912
YSZ_SUB_C_ADD_SCORE = 1
YSZ_SUB_C_GIVE_UP = 2
YSZ_SUB_C_COMPARE_CARD = 3
YSZ_SUB_C_LOOK_CARD = 4
YSZ_SUB_C_OPEN_CARD = 5
YSZ_SUB_C_WAIT_COMPARE = 6
YSZ_SUB_C_FINISH_FLASH = 7
YSZ_SUB_A_GETALLCARD = 8
YSZ_SUB_S_GAME_START = 100
YSZ_SUB_S_ADD_SCORE = 101
YSZ_SUB_S_GIVE_UP = 102
YSZ_SUB_S_COMPARE_CARD = 105
YSZ_SUB_S_LOOK_CARD = 106
YSZ_SUB_S_SEND_CARD = 103
YSZ_SUB_S_GAME_END = 104
YSZ_SUB_S_PLAYER_EXIT = 107
YSZ_SUB_S_OPEN_CARD = 108
YSZ_SUB_S_WAIT_COMPARE = 109
YSZ_SUB_S_GETALLCARD = 115
YSZ_SUB_S_COMPARE_CARD_NOMONEY = 110
YSZ_SUB_S_CONFIG = 111
YSZ_SUB_C_SHOW_CARD = 9
YSZ_SUB_C_AUTO_SCORE = 10
YSZ_SUB_C_CLIENT_ERROR = 11
YSZ_SUB_S_SHOW_CARD = 116
YSZ_SUB_S_WRITE_USER_SCORE = 120
YSZ_SUB_S_ANDROID_GET_CARD = 112
YSZ_SUB_S_ANIMATE_END = 118
YSZ_SUB_C_ANIMATE_END = 118
YSZ_EVENT_GAME_FREE = 1
YSZ_EVENT_GAME_START = 2
YSZ_EVENT_ADDSCORE = 3
YSZ_EVENT_GIVEUP = 4
YSZ_EVENT_COMPARE = 5
YSZ_EVENT_LOOKCARD = 6
YSZ_EVENT_PLAYEREXIT = 7
YSZ_EVENT_GAME_END = 8
YSZ_EVENT_WAITCOMPARE = 9
YSZ_EVENT_PLAY = 10
YSZ_EVENT_GAME_RESET = 11
YSZ_EVENT_GAME_TIME = 12
YSZ_EVENT_COMPARE_NOMONEY = 13
YSZ_EVENT_SHOW_CARD = 14
YSZ_SUB_S_DS = 15
COMPARE_WIN_SOUNDRES = "BIPAI_WIN.mp3"
COMPARE_LOSE_SOUNDRES = "BIPAI_LOSE.mp3"
COMPARE_CARD_SOUNDRES = "bipaiyin.mp3"
TIME_WARIMG_SOUNDRES = "TISHICHUPAI.mp3"
JETTON_MOVE_SOUNDRES = "jetton_move.wav"
DISPATCH_CARD_SOUNDRES = "FAIPAI.mp3"
RESULT_SOUNDRES = "result_sound.mp3"
YSZ_BACK_MUSIC_SOUNDRES = "BACK_GROUND.mp3"
YSZ_GET_GOLD_SOUNDRES = "GET_GOLD.mp3"
YSZ_ADD_GOLD_SOUNDRES = "ADD_GOLD.mp3"
YSZ_ALLIN_BG_SOUNDRES = "xuepinbg.mp3"
YSZ_GAME_WIN_SOUNDRES = "GAME_WIN.mp3"
YSZ_GAME_KAIPAI_SOUNDRES = "FAPAI.mp3"
YSZ_GAME_PIAOZI_SOUNDRES = "SETTLEMENT.mp3"
YSZ_GAME_AC_SOUNDRES = "BT_GET.mp3"
YSZ_GAME_ST_SOUNDRES = "santiao.mp3"
YSZ_GAME_OPENCARD_SOUNDRES = "roulette_open_sound.mp3"
slot2 = "YszModel"
YszModel = class(slot1)

YszModel.ctor = function (slot0)
	slot10 = true

	ClassUtil.extends(slot2, slot0, BaseGameModel, true, GameKind_YSZ, nil, nil, false)

	slot6 = true

	createSetterGetter(slot2, slot0, "gameState", GAME_STATUS_FREE)

	slot6 = true

	createSetterGetter(slot2, slot0, "gameType", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "myTableUserData", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "myTablePlayingUserData", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "myTablePlayingUserNum", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "mePlaying", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "meCardType", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "meWChairID", -1)

	slot6 = true

	createSetterGetter(slot2, slot0, "tableChair", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "compareStart", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "leaveList", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "tableUserID", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "nLastSeconds", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "isTwoMan", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isEndShowPuke", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isSendPukeFinish", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "bCompareCard", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "wWaitUserChoice", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "bCompareUser", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "userGender", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "startTime", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "timer", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "wCurrentUser", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "wBankerUser", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "wCurrentViewUser", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "lCurrentScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "myHandCardData", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "nCurRounds", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "nLastRounds", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "nMaxRounds", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "playing", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "bMeCompare", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "enterForeground", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "bAllFollow", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "currentChairTime", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "cbPlayStatus", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "lTableScore", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "lTablePlayerScore", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "cbHandCardData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "cbGameResultScore", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "lMaxScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "lMaxCellScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "lCellScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "lCurrentTimes", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "lUserMaxScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "bMingZhu", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "compare", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "wLostUser", -1)

	slot6 = true

	createSetterGetter(slot2, slot0, "wWinnerUser", -1)

	slot6 = true

	createSetterGetter(slot2, slot0, "wLostUserID", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "wViewChairID", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "xzTotalScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "lUserJetton", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "lUserJettonTimes", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowBetMenu", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowEffectWin", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowEffectPK", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowEffectGZYZ", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowEffectXP", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowEffectST", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowMenu", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowJettonEndResult", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "giveUpData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "addScoreData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "compareCardData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "openCardData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "playerExitData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "lookCardData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "gameEndData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "waitCompareData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "compareCardNoMoneyData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "compareCardNoMoneyIndex", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "compareCardNoMoneyLost", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "cancelWaitCompare", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isPlayingAction", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isPlayingGiveUpAction", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "playerCd", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "allInScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "isAllIn", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "allInModel", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "bankContentTxt", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "bankNeedReqStandUp", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "showGameEndPuke", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "canShowPuke", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "showCardData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "handleList", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "doAction", false)

	slot3 = "brnnGameEvent"
	slot0.gameEventChangedSignal = SignalAs3.new(slot2)
	slot0.musicBg = YSZ_BACK_MUSIC_SOUNDRES

	if NEED_CHANGE_SUB_GAME_NAME then
		slot0._loadingDuration = 0
		slot0.spineLogoKeyInLoading = nil
	end
end

YszModel.dispathEvent = function (slot0, slot1, ...)
	if slot0.gameEventChangedSignal then
		slot5 = slot1

		slot0.gameEventChangedSignal.emit(slot3, slot0.gameEventChangedSignal, ...)
	end
end

YszModel.destroy = function (slot0)
	return
end

return
