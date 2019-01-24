DNTGLK_UPDATE_FPS = 20
DNTGLK_CHECKFPS_SEC = 5
DNTGLK_SAME_ZORDER_FISH = false
DNTGLK_SAME_ZORDER_BULLET = true
DNTGLK_SAME_ZORDER_YINYING = true
DNTGLK_MAX_BULLET_COUNT = 80
DNTGLK_IS_ANDROID_PLATFORM = false
DNTGLK_USE_POOL = true
DNTGLK_CREATE_FROM_CACHE = false
DNTGLK_IS_CLICK_LOCKFISH = true
M_PI_2 = math.pi * 0.5
M_PI = math.pi
fishcc = nil
DNTGLK_LOW_ANGLE = 20
DNTGLK_LOW_ANGLE_RADION = (90 - DNTGLK_LOW_ANGLE) / 180 * 3.14
DNTGLK_DNTGLK_INVALID_VALUE = -999
DNTGLK_C2S_LOCKFISH_DELTA = 1
DNTGLK_OVER_BY_BULLET = "DNTGLK_OVER_BY_BULLET"
DNTGLK_OVER_BY_EFFECT = "DNTGLK_OVER_BY_EFFECT"
DNTGLK_OBJ_STATE = {
	EOS_DESTORY = 6,
	EOS_HIT = 2,
	EOS_REMOVED = 8,
	EOS_DEAD = 4,
	EOS_LIGHTING = 7,
	EOS_LIVE = 1,
	EOS_DYING = 3,
	EOS_TIMEOUT = 5,
	EOS_INIT = 0
}
DNTGLK_OBJ_TYPE = {
	EOT_FISH = "Fish",
	EOT_BULLET = "Bullet"
}
Fish2D = {
	AnimationPath = "res/gameres/module/dntglk/fishAnimations/",
	VisualType = {
		Fish = 1,
		Bullet = 2
	},
	FishComponent = {
		Boundingbox = 2,
		Path = 1
	},
	AnimationType = {
		Spine = 1,
		Armature = 0
	}
}
DNTGLK_FISH_FILE_TYPE = {
	VAT_SKELETON = 1,
	VAT_SKELETON_BINARY = 3,
	VAT_PARTICLE = 2,
	VAT_SPRITE = 5,
	VAT_FRAME = 0,
	VAT_3D = 4
}
DNTGLK_PATH_MOVE_TYPE = {
	BEZIER = 1,
	STAY = 3,
	CIRCLE = 2,
	LINE = 0
}
DNTGLK_BUFF_TYPE = {
	ION_CANNON = 3,
	CHANGESPEED = 1,
	DOUBLE_CANNON = 2,
	ADDMUL_BYHIT = 4,
	NONE = 0
}
DNTGLK_SPECIAL_FISH_TYPE = {
	SIXI = 4,
	MAX = 5,
	KINGANDQUAN = 2,
	SANYUAN = 3,
	NORMAL = 0,
	KING = 1
}
DNTGLK_EFFECT_TYPE = {
	PRODUCE = 3,
	KILL = 1,
	ADDBUFFER = 2,
	ADDMONEY = 0,
	BLACKWATER = 4,
	AWARD = 5,
	NONE = -1
}
DNTGLK_FISH_ANI_TYPE = {
	FRAME = 0,
	SKELETON = 1
}
DNTGLK_CANNON_ANI = {
	MOVE = "move"
}
DNTGLK_BG_IMG = {
	"res/gameres/module/dntglk/battleViewBg/Map_0.jpg",
	"res/gameres/module/dntglk/battleViewBg/Map_1.jpg",
	"res/gameres/module/dntglk/battleViewBg/Map_2.jpg",
	"res/gameres/module/dntglk/battleViewBg/Map_3.jpg"
}
DNTGLK_PARTICAL_CONFIG = {
	bubble = {
		AniName = "animation",
		AniImage = "yuboomceffect"
	},
	switch = {
		AniName = "animation",
		AniImage = "yuboomceffect"
	},
	salute1 = {
		AniName = "animation",
		AniImage = "yuboombeffect"
	},
	bomb = {
		AniName = "animation",
		AniImage = "yuboomeffect"
	}
}
DNTGLK_LAYER_ZORDER = {
	OBJECT_BULLET = 7,
	STATIC_SWITCH_BACKGROUND = 4,
	OBJECT_EFFECT_DOWN = 0,
	OBJECT_FISH = 1,
	OBJECT_BULLET_DIE = 8,
	TOP_UI = 9,
	OBJECT_EFFECT_UP = 10,
	LAYER_LOADING = 12,
	STATIC_SWITCH_WATER = 5,
	BOUNDING_BOX = 11,
	PLAYER_NAME = 2,
	STATIC_SWITCH_WAVE = 6,
	STATIC_BACKGROUND = -1,
	STATIC_WATER = 3
}

return
