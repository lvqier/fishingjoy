ShzModel = class("ShzModel")
SHZ_MAX_ITEM_COUNT = 15
SHZ_MAX_SHU_COUNT = 5
SHZ_MAX_LINE_COUNT = 9
SHZ_MAX_SHU_ITEM_COUNT = 3
SHZ_MAX_MARY_MID_ITEM_COUNT = 4
SHZ_MAX_MARY_WAI_ITEM_COUNT = 24
SHZ_GUESS_SMALL = 0
SHZ_GUESS_MID = 1
SHZ_GUESS_BIG = 2
SHZ_SUB_S_BET = 101
SHZ_SUB_S_GET_SCORE = 102
SHZ_SUB_S_BIG_SMALL = 104
SHZ_SUB_S_MARY = 105
SHZ_SUB_C_BET = 1
SHZ_SUB_C_GET_SCORE = 2
SHZ_SUB_C_BIG_SMALL = 4
SHZ_SUB_C_MARY = 5
SHZ_GAME_EVENT = "SHZ_GAME_EVENT"
SHZ_GAME_SCENE_EVENT = "SHZ_GAME_SCENE_EVENT"
SHZ_SOUND_DICE_BG = "bgm/sound_water_dice_bg.mp3"
SHZ_SOUND_ALL_SHUIHU = "sound_water_all_shuihu.mp3"
SHZ_SOUND_MAIN_BG = "bgm/sound_water_main_bg.mp3"
SHZ_SOUND_BTN_CLICK = "sound_water_bt_click.mp3"
SHZ_SOUND_BTN_START = "effect/sound_water_bt_start.mp3"
SHZ_SOUND_COMPARE_BTN = "effect/sound_water_compare_bt.mp3"
SHZ_SOUND_COMPARE_LOSE = "effect/sound_water_compare_lose.mp3"
SHZ_SOUND_COMPARE_WIN = "effect/sound_water_compare_win.mp3"
SHZ_SOUND_COMPARE_POINT_S = "effect/sound_water_compare_point%s.mp3"
SHZ_SOUND_COMPARE_WAIT_S = "effect/sound_water_compare_wait%s.mp3"
SHZ_SOUND_COMPARE_ROCK = "effect/sound_water_compare_rock.mp3"
SHZ_SOUND_MARY_BG = "bgm/sound_water_mary_bg.mp3"
SHZ_SOUND_MARY_ICON_EXIT = "sound_water_mary_icon_exit.mp3"
SHZ_SOUND_MARY_ROLL_INNER = "sound_water_mary_roll_inner.mp3"
SHZ_SOUND_MARY_ROLL_OUT = "sound_water_mary_roll_out.mp3"
SHZ_SOUND_MARY_WIN = "sound_water_mary_win.mp3"
SHZ_SOUND_SHUIHUZHUAN = "sound_water_shuihuzhuan.mp3"
SHZ_SOUND_SONG = "sound_water_song.mp3"
SHZ_SOUND_TITIANXINGDAO = "sound_water_titianxingdao.mp3"
SHZ_SOUND_YINGQIANG = "sound_water_yingqiang.mp3"
SHZ_SOUND_ZHONGYITIANG = "sound_water_zhongyitiang.mp3"
SHZ_SOUND_SELECTED = "sound_water_selected.mp3"
SHZ_SOUND_DADAO = "sound_water_dadao.mp3"
SHZ_SOUND_FUTOU = "sound_water_futou.mp3"
SHZ_SOUND_LIN = "sound_water_lin.mp3"
SHZ_SOUND_ONE_LINE = "effect/sound_water_one_line.mp3"
SHZ_SOUND_ALL_LINE = "effect/sound_water_all_line.mp3"
SHZ_SOUND_LU = "sound_water_lu.mp3"
SHZ_YASCORETABLE = {
	10,
	20,
	30,
	40,
	50
}

ShzModel.ctor = function (slot0)
	ClassUtil.extends(slot0, BaseGameModel, true, GameKind_SHZ, nil, nil, false, true)
	createSetterGetter(slot0, "isShowingLoading", false, true)
	createSetterGetter(slot0, "loadingPercent", 0, true)
	createSetterGetter(slot0, "loadingTxt", "", true)

	slot0.lWinScore = 0
	slot0.lMaryOneWinScore = 0
	slot0.lDiceOneWinScore = 0
	slot0.lJettonScore = 0
	slot0.cbCardArray = {}
	slot0.cbFullID = 0
	slot0.cbMaryGames = 0
	slot0.cbLines = {}
	slot0.cbExternalData = 0
	slot0.cbInternalArray = {}
	slot0.cbBigSmall = {}
	slot0.bAuto = false
	slot0.cbBigSmallRecord = {}
	slot0.bPlayingGame = false
	slot0.musicBg = "bgm/sound_water_main_bg.mp3"
	slot0._loadingDuration = 2
	slot0.spineLogoKeyInLoading = "shz_logoqd"
	slot0.gameEventChangedSignal = SignalAs3.new("shzGameEvet")
end

ShzModel.dispathEvent = function (slot0, slot1, ...)
	if slot0.gameEventChangedSignal then
		slot0.gameEventChangedSignal:emit(slot1, ...)
	end
end

ShzModel.destroy = function (slot0)
	return
end

return
