DNTGTEST_UPDATE_FPS = 20
DNTGTEST_CHECKFPS_SEC = 5
DNTGTEST_SAME_ZORDER_FISH = false
DNTGTEST_SAME_ZORDER_BULLET = true
DNTGTEST_SAME_ZORDER_YINYING = true
DNTGTEST_MAX_BULLET_COUNT = 80
slot2 = cc.Application
slot2 = cc.Application.getInstance(slot1)
DNTGTEST_IS_ANDROID_PLATFORM = cc.Application.getInstance(slot1).getTargetPlatform(slot1) == cc.PLATFORM_OS_ANDROID
DNTGTEST_USE_POOL = true
DNTGTEST_CREATE_FROM_CACHE = false
DNTGTEST_IS_CLICK_LOCKFISH = true
M_PI_2 = math.pi * 0.5
M_PI = math.pi
DNTGTEST_interpolationX = 0
DNTGTEST_acceleratef = 1
DNTGTEST_LOW_ANGLE = 20
DNTGTEST_LOW_ANGLE_RADION = (90 - DNTGTEST_LOW_ANGLE) / 180 * 3.14
DNTGTEST_DNTGTEST_INVALID_VALUE = -999
DNTGTEST_C2S_LOCKFISH_DELTA = 1
DNTGTEST_OVER_BY_BULLET = "DNTGTEST_OVER_BY_BULLET"
DNTGTEST_OVER_BY_EFFECT = "DNTGTEST_OVER_BY_EFFECT"
DNTGTEST_OBJ_STATE = {
	EOS_HIT = 2,
	EOS_LIVE = 1,
	EOS_DEAD = 3,
	EOS_DESTORY = 4,
	EOS_LIGHTING = 5,
	EOS_REMOVED = 6,
	EOS_INIT = 0
}
DNTGTEST_OBJ_TYPE = {
	EOT_FISH = "Fish",
	EOT_BULLET = "Bullet"
}
Fish2D = {
	AnimationPath = "res/gameres/module/dntgtest/fishAnimations/",
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
DNTGTEST_FISH_FILE_TYPE = {
	VAT_SKELETON = 1,
	VAT_PARTICLE = 2,
	VAT_FRAME = 0,
	VAT_SKELETON_BINARY = 3
}
DNTGTEST_PATH_MOVE_TYPE = {
	BEZIER = 1,
	STAY = 3,
	CIRCLE = 2,
	LINE = 0
}
DNTGTEST_BUFF_TYPE = {
	ION_CANNON = 3,
	CHANGESPEED = 1,
	DOUBLE_CANNON = 2,
	ADDMUL_BYHIT = 4,
	NONE = 0
}
DNTGTEST_SPECIAL_FISH_TYPE = {
	SIXI = 4,
	MAX = 5,
	KINGANDQUAN = 2,
	SANYUAN = 3,
	NORMAL = 0,
	KING = 1
}
DNTGTEST_EFFECT_TYPE = {
	PRODUCE = 3,
	KILL = 1,
	ADDBUFFER = 2,
	ADDMONEY = 0,
	BLACKWATER = 4,
	AWARD = 5,
	NONE = -1
}
DNTGTEST_FISH_ANI_TYPE = {
	FRAME = 0,
	SKELETON = 1
}
DNTGTEST_CANNON_ANI = {
	MOVE = "move"
}
DNTGTEST_BG_IMG = {
	"res/gameres/module/dntgtest/battleViewBg/Map_0.jpg",
	"res/gameres/module/dntgtest/battleViewBg/Map_1.jpg",
	"res/gameres/module/dntgtest/battleViewBg/Map_2.jpg",
	"res/gameres/module/dntgtest/battleViewBg/Map_3.jpg"
}
DNTGTEST_PARTICAL_CONFIG = {
	bubble = {
		AniName = "animation",
		AniImage = "yuboomdeffect"
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
		AniImage = "baofenEffect"
	}
}
DNTGTEST_LAYER_ZORDER = {
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
