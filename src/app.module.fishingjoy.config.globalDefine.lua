FISHINGJOY_UPDATE_FPS = 20
FISHINGJOY_ENTITY_SAME_ZORDER = false
FISHINGJOY_SHADOW_SAME_ZORDER = true
FISHINGJOY_BULLET_LIMIT = 80
slot2 = cc.Application
slot2 = cc.Application.getInstance(slot1)
FISHINGJOY_ANDROID_PLATFORM = cc.Application.getInstance(slot1).getTargetPlatform(slot1) == cc.PLATFORM_OS_ANDROID
FISHINGJOY_ACTIVE_POOL = true
FISHINGJOY_ENTITY_FROM_CACHE = false
FISHINGJOY_CLICK_LOCK_FISH = true
FISHINGJOY_HALF_PI = math.pi * 0.5
FISHINGJOY_PI = math.pi
FISHINGJOY_PI_720 = (math.pi * 2) / 720
FISHINGJOY_WATER_OPACITY = 100
FISHINGJOY_LIMIT_BELOW_HORIZONTAL = 20
FISHINGJOY_LIMIT_BELOW_HORIZONTAL_RADION = (90 - FISHINGJOY_LIMIT_BELOW_HORIZONTAL) / 180 * 3.14
FISHINGJOY_C2S_LOCKFISH_DELTA = 1
FISHINGJOY_KILL_BY_BULLET = "FISHINGJOY_KILL_BY_BULLET"
FISHINGJOY_KILL_BY_EFFECT = "FISHINGJOY_KILL_BY_EFFECT"
FISHINGJOY_ENTITY_STATUS = {
	LIVE = 1,
	DESTORY = 4,
	DEAD = 3,
	HIT = 2
}
FISHINGJOY_ENTITY_TYPE_OBJ = {
	FISH = "FISHINGJOY_ENTITY_TYPE_OBJ_FISH",
	BULLET = "FISHINGJOY_ENTITY_TYPE_OBJ_BULLET"
}
FISHINGJOY_ENTITY_TYPE = {
	FRAME = 0,
	PLIST = 4,
	SKELETON = 1,
	PARTICLE = 2,
	SKELETON_BINARY = 3
}
FISHINGJOY_PATH_TYPE = {
	BEZIER = 1,
	STAY = 3,
	CIRCLE = 2,
	LINE = 0
}
FISHINGJOY_BUFF_TYPE = {
	DOUBLE_CANNON = 2,
	CHANGESPEED = 1,
	ION_CANNON = 3,
	NONE = 0
}
FISHINGJOY_SPECIAL_FISH_TYPE = {
	SIXI = 4,
	MAX = 5,
	KINGANDQUAN = 2,
	SANYUAN = 3,
	NORMAL = 0,
	KING = 1
}
FISHINGJOY_EFFECT_TYPE = {
	APPENDBUFF = 2,
	KILL = 1,
	CREATE = 3,
	APPENDMONEY = 0,
	NONE = -1
}
FISHINGJOY_CANNON_ANI = {
	MOVE = "move"
}
FISHINGJOY_BG = {
	"res/gameres/module/fishingjoy/ui/background/fishingJoy_battle_1.jpg",
	"res/gameres/module/fishingjoy/ui/background/fishingJoy_battle_2.jpg",
	"res/gameres/module/fishingjoy/ui/background/fishingJoy_battle_3.jpg",
	"res/gameres/module/fishingjoy/ui/background/fishingJoy_battle_4.jpg"
}
FISHINGJOY_PARTICAL = {
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
FISHINGJOY_LAYERS = {
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
FISHINGJOY_SOUND_EFFECT = {
	EFFECT_COLLECT_COIN = 23,
	CATCH2 = 5,
	BIGAWARD = 10,
	AWARD = 9,
	CASTING_NORMAL = 1,
	CASTING_ION = 2,
	BOMB_ELECTRIC = 17,
	CATCH1 = 4,
	BOMB_LASER = 16,
	EFFECT_PARTICAL_BIG_BOMB = 20,
	FIRE = 6,
	IONFIRE = 7,
	GAME_EFFECT_COUNT = 15,
	CANNON_SWITCH = 0,
	BUTTON_CLICK = 18,
	EFFECT_DROP_COIN = 24,
	EFFECT_PARTICAL_BIG_FIREWORKS = 21,
	WAVE = 14,
	BINGO = 12,
	EFFECT_PARTICAL_FIREWORKS = 22,
	BINGO2 = 13,
	CATCH = 3,
	ROTARYTURN = 11,
	INSERT = 8
}
FISHINGJOY_EFFECT_LAYER_ZORDER = {
	bingImage = 200,
	coinNode = 100,
	fish_jinbi_1 = 90,
	fish_jinbi_yinse = 80,
	xianjieStart = 161,
	["gold_hit_numbers.png"] = 70,
	OtherPlayerfntScore = 60,
	xianjieEnd = 160,
	boomEffect = 150,
	foshouzidan = 180,
	gaofenzhuanpan = 190,
	yuboomgx = 155,
	particle = 210
}

function FIshingJoyCleanGlobal()
	return
end

return
