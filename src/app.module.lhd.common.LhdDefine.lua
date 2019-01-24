LHD_SUB_S_GAME_FREE = 120
LHD_SUB_S_GAME_START = 121
LHD_SUB_S_GAME_END = 122
LHD_SUB_S_JETTON = 123
LHD_SUB_S_JETTON_FAIL = 124
LHD_SUB_S_UPDATE_USER_SCORE = 125
LHD_SUB_S_JETTON_DETAIL = 126
LHD_SUB_S_JETTON_EX = 127
LHD_SUB_C_JETTON = 10
LHD_SUB_C_JETTON_EX = 11
LHD_GAMING_FREE = 0
LHD_GAMING_BET = 100
LHD_GAMING_END = 101
LHD_EVT_GAMING_FREE = 1
LHD_EVT_GAMING_BET = 2
LHD_EVT_GAMING_END = 3
LHD_EVT_JETTON = 4
LHD_EVT_REMAND_JETTON = 5
LHD_EVT_RECOVER_FREE = 6
LHD_EVT_RECOVER_PLAY = 7
LHD_EVT_UER_ENTER = 8
LHD_EVT_UER_SCORE = 9
LHD_EVT_USER_STATE = 10
LHD_EVT_RESET_GAME = 11
LHD_GAMING_TIMER_FREE = 0
LHD_GAMING_TIMER_BET = 1
LHD_GAMING_TIMER_END = 2
LHD_GAMING_TIMER_WAIT = 3
LHD_GAMING_FREE_LAST_TIME = 2
LHD_GAMING_BET_LAST_TIME = 12
LHD_GAMING_END_LAST_TIME = 8
LHD_BALANCE_ERROR = 0
LHD_BALANCE_DRAGON = 1
LHD_BALANCE_TIGER = 2
LHD_BALANCE_DRAW = 3
LHD_BET_MOVE_LIMIT_AREA_TO_FLAG = 50
LHD_BET_MOVE_LIMIT_FLAG_TO_AREA = 20
LHD_BET_MOVE_LIMIT_AREA_TO_SELF = 20
LHD_BET_MOVE_LIMIT_AREA_TO_ONLINE = 50
LHD_BET_MOVE_LIMIT_SELF_TO_AREA = 20
LHD_DEBUG_MODEL = false
LHD_BET_BTN_NUM = 6
LHD_RANKER_NUM = 6
LHD_BET_SCORE_RATE_DATA = 100
LHD_BET_SCORE_RATE_VIEW = 1
LHD_BET_SPRITE_CACHE_MAX = 500
LHD_AFTER_WITHDRAWAL_CAN_BET = false
LHD_BET_SCORE_BASE_CONFIG = {
	10,
	100,
	1000,
	10000,
	50000,
	100000
}
LHD_BET_SCORE_STR_CONFIG = {
	{
		"1",
		"q"
	},
	{
		"1",
		"w"
	},
	{
		"1",
		"0",
		"w"
	},
	{
		"1",
		"b",
		"w"
	},
	{
		"5",
		"b",
		"w"
	},
	{
		"1",
		"q",
		"w"
	}
}
LHD_RESOURCE_ROOT_UI = "gameres/module/lhd/ui/"
LHD_RESOURCE_ROOT_PARTICLE = "gameres/module/lhd/particle/"
LHD_RESOURCE_ROOT_SOUND = ""
LHD_SOUND = {
	MUSIC_BG = LHD_RESOURCE_ROOT_SOUND .. "BGM.mp3",
	VOICE_START_BETTING = LHD_RESOURCE_ROOT_SOUND .. "VOICE_START_BETTING.mp3",
	VOICE_STOP_BETTING = LHD_RESOURCE_ROOT_SOUND .. "VOICE_STOP_BETTING.mp3",
	VOICE_POINT_1 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_1.mp3",
	VOICE_POINT_2 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_2.mp3",
	VOICE_POINT_3 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_3.mp3",
	VOICE_POINT_4 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_4.mp3",
	VOICE_POINT_5 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_5.mp3",
	VOICE_POINT_6 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_6.mp3",
	VOICE_POINT_7 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_7.mp3",
	VOICE_POINT_8 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_8.mp3",
	VOICE_POINT_9 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_9.mp3",
	VOICE_POINT_10 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_10.mp3",
	VOICE_POINT_11 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_11.mp3",
	VOICE_POINT_12 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_12.mp3",
	VOICE_POINT_13 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_POINT_13.mp3",
	VOICE_WINNER_1 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_DRAGON_WIN.mp3",
	VOICE_WINNER_2 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_TIGER_WIN.mp3",
	VOICE_WINNER_3 = LHD_RESOURCE_ROOT_SOUND .. "VOICE_DRAW_WIN.mp3",
	EFFECT_BEGIN = LHD_RESOURCE_ROOT_SOUND .. "EFFECT_BEGIN.mp3",
	EFFECT_DEAL_CARD = LHD_RESOURCE_ROOT_SOUND .. "EFFECT_DEAL_CARD.mp3",
	EFFECT_START_BETTING = LHD_RESOURCE_ROOT_SOUND .. "EFFECT_START_BETTING.mp3",
	EFFECT_BET_FLYING = LHD_RESOURCE_ROOT_SOUND .. "EFFECT_BET_FLYING.mp3",
	EFFECT_SELECT_BET = LHD_RESOURCE_ROOT_SOUND .. "EFFECT_SELECT_BET.mp3",
	EFFECT_TIMER_WARING = LHD_RESOURCE_ROOT_SOUND .. "EFFECT_TIMER_WARING.mp3",
	EFFECT_SHOW_SCORE = LHD_RESOURCE_ROOT_SOUND .. "EFFECT_SHOW_SCORE.mp3",
	EFFECT_STAR = LHD_RESOURCE_ROOT_SOUND .. "EFFECT_LIUXIN.mp3"
}
LHD_BET_SCORE_CONFIG = {
	{
		LHD_BET_SCORE_BASE_CONFIG[1] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[2] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[3] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[4] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[5] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[6] * LHD_BET_SCORE_RATE_DATA
	},
	{
		LHD_BET_SCORE_BASE_CONFIG[1] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[2] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[3] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[4] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[5] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[6] * LHD_BET_SCORE_RATE_DATA
	},
	{
		LHD_BET_SCORE_BASE_CONFIG[1] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[2] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[3] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[4] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[5] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[6] * LHD_BET_SCORE_RATE_DATA
	},
	{
		LHD_BET_SCORE_BASE_CONFIG[1] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[2] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[3] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[4] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[5] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[6] * LHD_BET_SCORE_RATE_DATA
	},
	{
		LHD_BET_SCORE_BASE_CONFIG[1] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[2] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[3] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[4] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[5] * LHD_BET_SCORE_RATE_DATA,
		LHD_BET_SCORE_BASE_CONFIG[6] * LHD_BET_SCORE_RATE_DATA
	}
}
LHD_FLY_BET_SP_CONFIG = {
	[LHD_BET_SCORE_BASE_CONFIG[1] * LHD_BET_SCORE_RATE_DATA] = LHD_RESOURCE_ROOT_UI .. "battle/lhd_small_bet_1.png",
	[LHD_BET_SCORE_BASE_CONFIG[2] * LHD_BET_SCORE_RATE_DATA] = LHD_RESOURCE_ROOT_UI .. "battle/lhd_small_bet_2.png",
	[LHD_BET_SCORE_BASE_CONFIG[3] * LHD_BET_SCORE_RATE_DATA] = LHD_RESOURCE_ROOT_UI .. "battle/lhd_small_bet_3.png",
	[LHD_BET_SCORE_BASE_CONFIG[4] * LHD_BET_SCORE_RATE_DATA] = LHD_RESOURCE_ROOT_UI .. "battle/lhd_small_bet_4.png",
	[LHD_BET_SCORE_BASE_CONFIG[5] * LHD_BET_SCORE_RATE_DATA] = LHD_RESOURCE_ROOT_UI .. "battle/lhd_small_bet_5.png",
	[LHD_BET_SCORE_BASE_CONFIG[6] * LHD_BET_SCORE_RATE_DATA] = LHD_RESOURCE_ROOT_UI .. "battle/lhd_small_bet_6.png"
}
LHD_FLY_BET_STR_CONFIG = {
	[LHD_BET_SCORE_BASE_CONFIG[1] * LHD_BET_SCORE_RATE_DATA] = {
		pngConfig = "#lhd_bet_btn_score_1_%s.png",
		strConfig = {
			"1",
			"q"
		}
	},
	[LHD_BET_SCORE_BASE_CONFIG[2] * LHD_BET_SCORE_RATE_DATA] = {
		pngConfig = "#lhd_bet_btn_score_2_%s.png",
		strConfig = {
			"1",
			"w"
		}
	},
	[LHD_BET_SCORE_BASE_CONFIG[3] * LHD_BET_SCORE_RATE_DATA] = {
		pngConfig = "#lhd_bet_btn_score_3_%s.png",
		strConfig = {
			"1",
			"0",
			"w"
		}
	},
	[LHD_BET_SCORE_BASE_CONFIG[4] * LHD_BET_SCORE_RATE_DATA] = {
		pngConfig = "#lhd_bet_btn_score_4_%s.png",
		strConfig = {
			"1",
			"b",
			"w"
		}
	},
	[LHD_BET_SCORE_BASE_CONFIG[5] * LHD_BET_SCORE_RATE_DATA] = {
		pngConfig = "#lhd_bet_btn_score_5_%s.png",
		strConfig = {
			"5",
			"b",
			"w"
		}
	},
	[LHD_BET_SCORE_BASE_CONFIG[6] * LHD_BET_SCORE_RATE_DATA] = {
		pngConfig = "#lhd_bet_btn_score_6_%s.png",
		strConfig = {
			"1",
			"q",
			"w"
		}
	}
}
LHD_BET_BTN_IDX = {
	[LHD_BET_SCORE_BASE_CONFIG[1] * LHD_BET_SCORE_RATE_DATA] = 1,
	[LHD_BET_SCORE_BASE_CONFIG[2] * LHD_BET_SCORE_RATE_DATA] = 2,
	[LHD_BET_SCORE_BASE_CONFIG[3] * LHD_BET_SCORE_RATE_DATA] = 3,
	[LHD_BET_SCORE_BASE_CONFIG[4] * LHD_BET_SCORE_RATE_DATA] = 4,
	[LHD_BET_SCORE_BASE_CONFIG[5] * LHD_BET_SCORE_RATE_DATA] = 5,
	[LHD_BET_SCORE_BASE_CONFIG[6] * LHD_BET_SCORE_RATE_DATA] = 6
}
LHD_BET_BTN_SP_CONFIG = {
	[LHD_BET_SCORE_BASE_CONFIG[1] * LHD_BET_SCORE_RATE_DATA] = {},
	[LHD_BET_SCORE_BASE_CONFIG[2] * LHD_BET_SCORE_RATE_DATA] = {},
	[LHD_BET_SCORE_BASE_CONFIG[3] * LHD_BET_SCORE_RATE_DATA] = {},
	[LHD_BET_SCORE_BASE_CONFIG[4] * LHD_BET_SCORE_RATE_DATA] = {},
	[LHD_BET_SCORE_BASE_CONFIG[5] * LHD_BET_SCORE_RATE_DATA] = {},
	[LHD_BET_SCORE_BASE_CONFIG[6] * LHD_BET_SCORE_RATE_DATA] = {}
}
LHD_NUM_FONT_PLIST = LHD_RESOURCE_ROOT_UI .. "spritesheet/lhd_num_font.plist"
LHD_BET_SCORE_PLIST = LHD_RESOURCE_ROOT_UI .. "spritesheet/lhd_bet_score.plist"
LHD_REWARD_SCORE_PLIST = LHD_RESOURCE_ROOT_UI .. "spritesheet/lhd_reward_score.plist"
LHD_BALANCE_PLIST = LHD_RESOURCE_ROOT_UI .. "spritesheet/lhd_balanace.plist"
LHD_OPEN_CARD_PLIST = LHD_RESOURCE_ROOT_UI .. "spritesheet/lhd_openCard_plist.plist"
LHD_POKER_BG_DRAGON = LHD_RESOURCE_ROOT_UI .. "battle/lhd_yxz_pai1.png"
LHD_POKER_BG_TIGER = LHD_RESOURCE_ROOT_UI .. "battle/lhd_yxz_pai2.png"
LHD_ROOM_STATUS_0_40 = LHD_RESOURCE_ROOT_UI .. "room/lhd_fwq_kongxian.png"
LHD_ROOM_STATUS_40_80 = LHD_RESOURCE_ROOT_UI .. "room/lhd_fwq_yongji.png"
LHD_ROOM_STATUS_80 = LHD_RESOURCE_ROOT_UI .. "room/lhd_fwq_baoman.png"
LHD_BALANCE_DRAGON_WIN = LHD_RESOURCE_ROOT_UI .. "battle/lhd_yxz_qs_loong.png"
LHD_BALANCE_TIGER_WIN = LHD_RESOURCE_ROOT_UI .. "battle/lhd_yxz_qs_tigger.png"
LHD_BALANCE_DRAW_WIN = LHD_RESOURCE_ROOT_UI .. "battle/lhd_yxz_qs_peace.png"
LHD_BALANCE_PER = LHD_RESOURCE_ROOT_UI .. "balance/lhd_balance_per.png"
LHD_PARTICLE_BET_MOVING_END = LHD_RESOURCE_ROOT_PARTICLE .. "lhd_winshounalizi.plist"
LHD_PARTICLE_BET_MOVING_TRAILING = LHD_RESOURCE_ROOT_PARTICLE .. "lhd_tuoweilizi.plist"
LHD_PARTICLE_ADD_HISTORY_LINE = LHD_RESOURCE_ROOT_PARTICLE .. "lhd_twgd.plist"
LHD_BALANCE_POINTS = {
	LHD_RESOURCE_ROOT_UI .. "balance/lhd_dragon.png",
	LHD_RESOURCE_ROOT_UI .. "balance/lhd_tiger.png",
	LHD_RESOURCE_ROOT_UI .. "balance/lhd_draw.png"
}
LHD_BALANCE_FORECAST = {
	DRAGON3 = "lhd_balance2_green_ring.png",
	DRAGON4 = "lhd_balance2_green_cockroach_big.png",
	DRAGON2 = "lhd_balance2_ring_loong.png",
	TIGER3 = "lhd_balance2_red_ring.png",
	TIGER4 = "lhd_balance2_red_cockroach.png",
	TIGER2 = "lhd_balance2_ring_tiger.png"
}
LHD_BATTLE_TIMER = {
	FREE = LHD_RESOURCE_ROOT_UI .. "battle/lhd_yxz_kx.png",
	BET = LHD_RESOURCE_ROOT_UI .. "battle/lhd_yxz_xz.png",
	END = LHD_RESOURCE_ROOT_UI .. "battle/lhd_yxz_js.png"
}
LHD_SPINE_FILE_PATH = LHD_RESOURCE_ROOT_UI .. "spine/%s/%s"
LHD_SPINE = {
	FightEffect = {
		FileName = "lhd_vs",
		EndName = "",
		Loop = false,
		PlayName = "start",
		IdleName = "",
		CompleteHide = true
	},
	GamingTips = {
		FileName = "lhd_tips",
		EndName = "",
		Loop = false,
		PlayName = "animation",
		IdleName = "",
		CompleteHide = true
	},
	LoadingSpine1 = {
		FileName = "lhd_logoqd1",
		EndName = "",
		Loop = false,
		PlayName = "start",
		IdleName = "idle",
		CompleteHide = false
	},
	LoadingSpine2 = {
		FileName = "lhd_logoqd2",
		EndName = "",
		Loop = false,
		PlayName = "start",
		IdleName = "idle",
		CompleteHide = false
	},
	RoomQuickStart = {
		FileName = "lhd_xc_ksks",
		EndName = "",
		Loop = true,
		PlayName = "animation",
		IdleName = "",
		CompleteHide = false
	},
	RoomEntranceSpine1 = {
		FileName = "lhd_xc_pkp",
		EndName = "",
		Loop = true,
		PlayName = "animation",
		IdleName = "",
		CompleteHide = false
	},
	RoomEntranceSpine2 = {
		FileName = "lhd_xc_gu",
		EndName = "",
		Loop = true,
		PlayName = "animation",
		IdleName = "",
		CompleteHide = false
	},
	RoomEntranceSpine3 = {
		FileName = "lhd_xc_yu",
		EndName = "",
		Loop = true,
		PlayName = "animation",
		IdleName = "",
		CompleteHide = false
	},
	RoomEntranceSpine4 = {
		FileName = "lhd_xc_hu",
		EndName = "",
		Loop = true,
		PlayName = "animation",
		IdleName = "",
		CompleteHide = false
	},
	RoomEntranceSpine5 = {
		FileName = "lhd_xc_long",
		EndName = "",
		Loop = true,
		PlayName = "animation",
		IdleName = "",
		CompleteHide = false
	},
	AreaWinEffect1 = {
		FileName = "lhd_xiazhulong",
		EndName = "",
		Loop = false,
		PlayName = "animation",
		IdleName = "idle",
		CompleteHide = true
	},
	AreaWinEffect2 = {
		FileName = "lhd_xiazhuhu",
		EndName = "",
		Loop = false,
		PlayName = "animation",
		IdleName = "idle",
		CompleteHide = true
	},
	AreaWinEffect3 = {
		FileName = "lhd_xiazhuhe",
		EndName = "",
		Loop = false,
		PlayName = "animation",
		IdleName = "idle",
		CompleteHide = true
	},
	AddHistoryPoint = {
		FileName = "lhd_xdbz",
		EndName = "",
		Loop = false,
		PlayName = "animation",
		IdleName = "idle",
		CompleteHide = true
	},
	CountDownNum = {
		FileName = "lhd_number",
		EndName = "",
		Loop = false,
		PlayName = "animation",
		IdleName = "idle",
		CompleteHide = true
	}
}
LHD_MSG_CONFIG = {
	NO_BETTING_TIME = "请稍候，还没到下注时间哟！",
	NO_SELECT_GOLD = "请选择下注筹码！",
	SELF_LIMIT_FULL = "您的下注数已超过限制，请下把再下注",
	AREA_LIMIT_FULL = "已超过区域下注总数，请下把再下注",
	BETTING_FULL = "本局下注已满!",
	INSUFFICIENT_BALANCE = "您的余额不足，无法进行下注!"
}
LHD_ROOM_TYPE_IMG = {
	LHD_RESOURCE_ROOT_UI .. "battle/lhd_tyc.png",
	LHD_RESOURCE_ROOT_UI .. "battle/lhd_cjc.png",
	LHD_RESOURCE_ROOT_UI .. "battle/lhd_ptc.png",
	LHD_RESOURCE_ROOT_UI .. "battle/lhd_zjc.png",
	LHD_RESOURCE_ROOT_UI .. "battle/lhd_gjc.png"
}
LHD_BALANCE_LABEL_COUNT_RGBA = {
	[LHD_BALANCE_ERROR] = "#FFFFFF",
	[LHD_BALANCE_DRAGON] = "#276667",
	[LHD_BALANCE_TIGER] = "#a3321a",
	[LHD_BALANCE_DRAW] = "#91521f"
}
LHD_ONLINE_ITEM_CSB = "module/lhd/csb/common/LhdOnlineThreeItem.csb"

return
