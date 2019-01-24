Serial = {
	Serial_Root = "res/gameres/module/serial/",
	Sound = {
		RoomBg = "bonusgame.mp3",
		Level_3_boom = "boom3.mp3",
		BfReward = "baofu.mp3",
		DragonFallDown = "lhdb_bsdl_01.mp3",
		LjReward = "leiji.mp3",
		Brick = "brick.mp3",
		Drill = "drill.mp3",
		Level_2_boom = "boom2.mp3",
		Level_2_bg = "level2.mp3",
		DiamondDispare = "lhdb_bssk.mp3",
		Level_3_bg = "level3.mp3",
		AfterBoom = "coin.mp3",
		Level_1_boom = "boom1.mp3",
		DiamondDroping = "lhdb_bsdl.mp3",
		Level_1_bg = "level1.mp3"
	}
}
Serial.Room = {
	TextureScore = {
		[0] = Serial.Serial_Root .. "room/huanledou_shuzi/huanledou_shuzi_01.png",
		Serial.Serial_Root .. "room/huanledou_shuzi/huanledou_shuzi_03.png",
		Serial.Serial_Root .. "room/huanledou_shuzi/huanledou_shuzi_05.png",
		Serial.Serial_Root .. "room/huanledou_shuzi/huanledou_shuzi_07.png",
		Serial.Serial_Root .. "room/huanledou_shuzi/huanledou_shuzi_09.png",
		Serial.Serial_Root .. "room/huanledou_shuzi/huanledou_shuzi_11.png",
		Serial.Serial_Root .. "room/huanledou_shuzi/huanledou_shuzi_13.png",
		Serial.Serial_Root .. "room/huanledou_shuzi/huanledou_shuzi_15.png",
		Serial.Serial_Root .. "room/huanledou_shuzi/huanledou_shuzi_17.png",
		Serial.Serial_Root .. "room/huanledou_shuzi/huanledou_shuzi_19.png"
	},
	SpineEntry = {
		{
			json = Serial.Serial_Root .. "animation/room/lhdb_tiyanchang.json",
			atlas = Serial.Serial_Root .. "animation/room/lhdb_tiyanchang.atlas"
		},
		{
			json = Serial.Serial_Root .. "animation/room/lhdb_chujichang.json",
			atlas = Serial.Serial_Root .. "animation/room/lhdb_chujichang.atlas"
		},
		{
			json = Serial.Serial_Root .. "animation/room/lhdb_putongchang.json",
			atlas = Serial.Serial_Root .. "animation/room/lhdb_putongchang.atlas"
		},
		{
			json = Serial.Serial_Root .. "animation/room/lhdb_zhongjichang.json",
			atlas = Serial.Serial_Root .. "animation/room/lhdb_zhongjichang.atlas"
		},
		{
			json = Serial.Serial_Root .. "animation/room/lhdb_gaojichang.json",
			atlas = Serial.Serial_Root .. "animation/room/lhdb_gaojichang.atlas"
		}
	},
	SpineFastEntry = {
		json = Serial.Serial_Root .. "animation/room/lhdb_quickstart.json",
		atlas = Serial.Serial_Root .. "animation/room/lhdb_quickstart.atlas"
	},
	FreeState = {
		Serial.Serial_Root .. "room/kongxian.png",
		Serial.Serial_Root .. "room/yongji.png",
		Serial.Serial_Root .. "room/room_full.png"
	}
}
Serial.Battle = {
	Brick = {
		brick_h = Serial.Serial_Root .. "ingame/dang_h.png",
		brick_v = Serial.Serial_Root .. "ingame/dang_v.png"
	},
	Texture = {
		ScoreTamplate = {
			Serial.Serial_Root .. "ingame/shuzi_normal/shuzi_huang_%s.png",
			Serial.Serial_Root .. "ingame/shuzi_lv/shuzi_lv_%s.png",
			Serial.Serial_Root .. "ingame/shuzi_lan/shuzi_lan_%s.png",
			Serial.Serial_Root .. "ingame/shuzi_huang/shuzi_cheng_%s.png",
			Serial.Serial_Root .. "ingame/shuzi_fen/shuzi_fen_%s.png"
		},
		NumErase = {
			[0] = Serial.Serial_Root .. "ingame/xshuliang/xshuliang_0.png",
			Serial.Serial_Root .. "ingame/xshuliang/xshuliang_1.png",
			Serial.Serial_Root .. "ingame/xshuliang/xshuliang_2.png",
			Serial.Serial_Root .. "ingame/xshuliang/xshuliang_3.png",
			Serial.Serial_Root .. "ingame/xshuliang/xshuliang_4.png",
			Serial.Serial_Root .. "ingame/xshuliang/xshuliang_5.png",
			Serial.Serial_Root .. "ingame/xshuliang/xshuliang_6.png",
			Serial.Serial_Root .. "ingame/xshuliang/xshuliang_7.png",
			Serial.Serial_Root .. "ingame/xshuliang/xshuliang_8.png",
			Serial.Serial_Root .. "ingame/xshuliang/xshuliang_9.png"
		}
	}
}
Serial.Event = {
	userScoreChanged = "serial_event_user_score_changed",
	battleReset = "serial_event_battle_reset",
	diamondOpenned = "serial_event_diamond_openned",
	userStatusChanged = "serial_event_user_status_changed",
	dragonExploreEvent = "serial_event_dragon_explore",
	dragonRewardUIClose = "serial_event_dragon_reward_ui_close",
	diamondChanged = "serial_event_diamond_number_changed",
	brickChanged = "serial_event_brick_number_changed",
	diamondOpennedReplay = "serial_event_diamond_openned_replay",
	jackpotChanged = "serial_event_jackpot_changed",
	broadcastAward = "serial_event_broad_cast_awrad"
}
Serial.TreasureErase = {
	4,
	5,
	6
}
Serial.ChapterMap = {
	{
		row = 4,
		column = 4
	},
	{
		row = 5,
		column = 5
	},
	{
		row = 6,
		column = 6
	}
}
Serial.EntryType = {
	EntryType_Accumulate = 1,
	EntryType_Dragon = 2,
	EntryType_Explode = 3
}
Serial.TreasureType = {
	TreasureType_WhiteJade = 1,
	TreasureType_GreenJade = 2,
	TreasureType_Emerald = 12,
	TreasureType_Drill = 16,
	TreasureType_Amber = 5,
	TreasureType_BlackJade = 3,
	TreasureType_Diamond = 15,
	TreasureType_Sapphire = 14,
	TreasureType_Amethyst = 8,
	TreasureType_None = 0,
	TreasureType_Ruby = 11,
	TreasureType_Agate = 4,
	TreasureType_Emeral = 6,
	TreasureType_Cymophane = 7,
	TreasureType_Topaz = 13,
	TreasureType_Pearl = 10,
	TreasureType_Jadeite = 9
}
Serial.Music = {
	bgMusic = {},
	bgEffect = {}
}
Serial.DiamondBet = {
	{
		serialCritical = 14,
		[Serial.TreasureType.TreasureType_WhiteJade] = {
			nil,
			nil,
			nil,
			2,
			4,
			5,
			8,
			10,
			20,
			30,
			50,
			100,
			200,
			400,
			400
		},
		[Serial.TreasureType.TreasureType_GreenJade] = {
			nil,
			nil,
			nil,
			4,
			5,
			10,
			20,
			30,
			50,
			100,
			250,
			500,
			750,
			800,
			800
		},
		[Serial.TreasureType.TreasureType_BlackJade] = {
			nil,
			nil,
			nil,
			5,
			10,
			20,
			40,
			80,
			160,
			500,
			1000,
			2000,
			5000,
			6000,
			6000
		},
		[Serial.TreasureType.TreasureType_Agate] = {
			nil,
			nil,
			nil,
			10,
			30,
			50,
			60,
			100,
			750,
			1000,
			10000,
			20000,
			50000,
			60000,
			60000
		},
		[Serial.TreasureType.TreasureType_Amber] = {
			nil,
			nil,
			nil,
			20,
			50,
			100,
			500,
			1000,
			2000,
			5000,
			20000,
			50000,
			60000,
			80000,
			80000
		}
	},
	{
		serialCritical = 17,
		[Serial.TreasureType.TreasureType_Emeral] = {
			nil,
			nil,
			nil,
			nil,
			2,
			4,
			5,
			8,
			10,
			20,
			30,
			50,
			100,
			200,
			450,
			450,
			450,
			450,
			450,
			450
		},
		[Serial.TreasureType.TreasureType_Cymophane] = {
			nil,
			nil,
			nil,
			nil,
			4,
			5,
			10,
			20,
			30,
			50,
			100,
			250,
			500,
			750,
			1000,
			1000,
			1000,
			1000,
			1000,
			1000
		},
		[Serial.TreasureType.TreasureType_Amethyst] = {
			nil,
			nil,
			nil,
			nil,
			5,
			10,
			20,
			40,
			80,
			160,
			500,
			1000,
			2000,
			5000,
			7000,
			7000,
			7000,
			7000,
			7000,
			7000
		},
		[Serial.TreasureType.TreasureType_Jadeite] = {
			nil,
			nil,
			nil,
			nil,
			10,
			30,
			50,
			60,
			100,
			750,
			1000,
			10000,
			20000,
			50000,
			70000,
			70000,
			70000,
			70000,
			70000,
			70000
		},
		[Serial.TreasureType.TreasureType_Pearl] = {
			nil,
			nil,
			nil,
			nil,
			20,
			50,
			100,
			500,
			1000,
			2000,
			5000,
			20000,
			50000,
			80000,
			100000,
			100000,
			100000,
			100000,
			100000,
			100000
		}
	},
	{
		serialCritical = 21,
		[Serial.TreasureType.TreasureType_Ruby] = {
			nil,
			nil,
			nil,
			nil,
			nil,
			2,
			4,
			5,
			8,
			10,
			20,
			30,
			50,
			100,
			200,
			500,
			500,
			500,
			500,
			500,
			500,
			500,
			500,
			500
		},
		[Serial.TreasureType.TreasureType_Emerald] = {
			nil,
			nil,
			nil,
			nil,
			nil,
			4,
			5,
			10,
			20,
			30,
			50,
			100,
			250,
			500,
			750,
			1200,
			1200,
			1200,
			1200,
			1200,
			1200,
			1200,
			1200,
			1200
		},
		[Serial.TreasureType.TreasureType_Topaz] = {
			nil,
			nil,
			nil,
			nil,
			nil,
			5,
			10,
			20,
			40,
			80,
			160,
			500,
			1000,
			2000,
			5000,
			8000,
			8000,
			8000,
			8000,
			8000,
			8000,
			8000,
			8000,
			8000
		},
		[Serial.TreasureType.TreasureType_Sapphire] = {
			nil,
			nil,
			nil,
			nil,
			nil,
			10,
			30,
			50,
			60,
			100,
			750,
			1000,
			10000,
			20000,
			50000,
			80000,
			80000,
			80000,
			80000,
			80000,
			80000,
			80000,
			80000,
			80000
		},
		[Serial.TreasureType.TreasureType_Diamond] = {
			nil,
			nil,
			nil,
			nil,
			nil,
			20,
			50,
			100,
			500,
			1000,
			2000,
			5000,
			20000,
			50000,
			70000,
			100000,
			100000,
			100000,
			100000,
			100000,
			100000,
			100000,
			100000,
			100000
		}
	}
}
Serial.AlignType = {
	AlignType_Left = 1,
	AlignType_Right = 2,
	AlignType_Center = 3,
	AlignType_None = 0
}
Serial.ObjectType = {
	ObjectType_Cocos2dx = 1,
	ObjectType_Lua = 2
}
Serial.CacheType = {
	CacheType_Spine = 1,
	CacheType_RollingText = 4,
	CacheType_Particle = 2,
	CacheType_Sprite = 3
}
Serial.CacheTemplate = {
	reward_explode = {
		max_count = 2,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "reward/lhdb_gamebaofula.json",
		atlas = Serial.Serial_Root .. "reward/lhdb_gamebaofula.atlas",
		cache = Serial.Serial_Root .. "reward/lhdb_gamebaofula"
	},
	rock_01 = {
		max_count = 16,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_01.json",
		atlas = Serial.Serial_Root .. "effect/rock_01.atlas",
		cache = Serial.Serial_Root .. "effect/rock_01"
	},
	rock_02 = {
		max_count = 16,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_02.json",
		atlas = Serial.Serial_Root .. "effect/rock_02.atlas",
		cache = Serial.Serial_Root .. "effect/rock_02"
	},
	rock_03 = {
		max_count = 16,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_03.json",
		atlas = Serial.Serial_Root .. "effect/rock_03.atlas",
		cache = Serial.Serial_Root .. "effect/rock_03"
	},
	rock_04 = {
		max_count = 16,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_04.json",
		atlas = Serial.Serial_Root .. "effect/rock_04.atlas",
		cache = Serial.Serial_Root .. "effect/rock_04"
	},
	rock_05 = {
		max_count = 16,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_05.json",
		atlas = Serial.Serial_Root .. "effect/rock_05.atlas",
		cache = Serial.Serial_Root .. "effect/rock_05"
	},
	rock_06 = {
		max_count = 24,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_06.json",
		atlas = Serial.Serial_Root .. "effect/rock_06.atlas",
		cache = Serial.Serial_Root .. "effect/rock_06"
	},
	rock_07 = {
		max_count = 24,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_07.json",
		atlas = Serial.Serial_Root .. "effect/rock_07.atlas",
		cache = Serial.Serial_Root .. "effect/rock_07"
	},
	rock_08 = {
		max_count = 24,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_08.json",
		atlas = Serial.Serial_Root .. "effect/rock_08.atlas",
		cache = Serial.Serial_Root .. "effect/rock_08"
	},
	rock_09 = {
		max_count = 24,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_09.json",
		atlas = Serial.Serial_Root .. "effect/rock_09.atlas",
		cache = Serial.Serial_Root .. "effect/rock_09"
	},
	rock_10 = {
		max_count = 24,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_10.json",
		atlas = Serial.Serial_Root .. "effect/rock_10.atlas",
		cache = Serial.Serial_Root .. "effect/rock_10"
	},
	rock_11 = {
		max_count = 32,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_11.json",
		atlas = Serial.Serial_Root .. "effect/rock_11.atlas",
		cache = Serial.Serial_Root .. "effect/rock_11"
	},
	rock_12 = {
		max_count = 32,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_12.json",
		atlas = Serial.Serial_Root .. "effect/rock_12.atlas",
		cache = Serial.Serial_Root .. "effect/rock_12"
	},
	rock_13 = {
		max_count = 32,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_13.json",
		atlas = Serial.Serial_Root .. "effect/rock_13.atlas",
		cache = Serial.Serial_Root .. "effect/rock_13"
	},
	rock_14 = {
		max_count = 32,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_14.json",
		atlas = Serial.Serial_Root .. "effect/rock_14.atlas",
		cache = Serial.Serial_Root .. "effect/rock_14"
	},
	rock_15 = {
		max_count = 32,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_15.json",
		atlas = Serial.Serial_Root .. "effect/rock_15.atlas",
		cache = Serial.Serial_Root .. "effect/rock_15"
	},
	rock_16 = {
		max_count = 3,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/rock_16.json",
		atlas = Serial.Serial_Root .. "effect/rock_16.atlas",
		cache = Serial.Serial_Root .. "effect/rock_16"
	},
	diamond_spine_explode = {
		max_count = 32,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/lhdb_bbcleareffect.json",
		atlas = Serial.Serial_Root .. "effect/lhdb_bbcleareffect.atlas",
		cache = Serial.Serial_Root .. "effect/lhdb_bbcleareffect"
	},
	brick_spine_explode = {
		max_count = 4,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/lhdb_jzcleareffect.json",
		atlas = Serial.Serial_Root .. "effect/lhdb_jzcleareffect.atlas",
		cache = Serial.Serial_Root .. "effect/lhdb_jzcleareffect"
	},
	chapter_level_1 = {
		max_count = 1,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "levelEffect/lhdb_guanqia1.json",
		atlas = Serial.Serial_Root .. "levelEffect/lhdb_guanqia1.atlas",
		cache = Serial.Serial_Root .. "levelEffect/lhdb_guanqia1"
	},
	chapter_level_2 = {
		max_count = 1,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "levelEffect/lhdb_guanqia2.json",
		atlas = Serial.Serial_Root .. "levelEffect/lhdb_guanqia2.atlas",
		cache = Serial.Serial_Root .. "levelEffect/lhdb_guanqia2"
	},
	chapter_level_3 = {
		max_count = 1,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "levelEffect/lhdb_guanqia3.json",
		atlas = Serial.Serial_Root .. "levelEffect/lhdb_guanqia3.atlas",
		cache = Serial.Serial_Root .. "levelEffect/lhdb_guanqia3"
	},
	chapter_level_change = {
		max_count = 1,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "levelEffect/lhdb_guanqiaeffect.json",
		atlas = Serial.Serial_Root .. "levelEffect/lhdb_guanqiaeffect.atlas",
		cache = Serial.Serial_Root .. "levelEffect/lhdb_guanqiaeffect"
	},
	chapter_level_dragon = {
		max_count = 1,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "levelEffect/lhdb_longzhutanbao.json",
		atlas = Serial.Serial_Root .. "levelEffect/lhdb_longzhutanbao.atlas",
		cache = Serial.Serial_Root .. "levelEffect/lhdb_longzhutanbao"
	},
	accumulate_reward = {
		max_count = 1,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "reward/lhdb_gameljdj.json",
		atlas = Serial.Serial_Root .. "reward/lhdb_gameljdj.atlas",
		cache = Serial.Serial_Root .. "reward/lhdb_gameljdj"
	},
	explode_effect = {
		max_count = 2,
		type = Serial.CacheType.CacheType_Spine,
		json = Serial.Serial_Root .. "effect/lhdb_baojieffect.json",
		atlas = Serial.Serial_Root .. "effect/lhdb_baojieffect.atlas",
		cache = Serial.Serial_Root .. "effect/lhdb_baojieffect"
	},
	rolling_text_zonghuode = {
		max_count = 2,
		class = "app.module.serial.view.ccs.SerialRollingText",
		type = Serial.CacheType.CacheType_RollingText
	},
	rolling_text_tanbao = {
		max_count = 2,
		class = "app.module.serial.view.ccs.SerialRollingText",
		type = Serial.CacheType.CacheType_RollingText
	},
	rolling_text_baofuleiji = {
		max_count = 2,
		class = "app.module.serial.view.ccs.SerialRollingText",
		type = Serial.CacheType.CacheType_RollingText
	}
}
Serial.BezierCoef = {
	[Serial.TreasureType.TreasureType_Topaz] = {
		x = 1.416666,
		y = 0.022727
	},
	[Serial.TreasureType.TreasureType_Emerald] = {
		x = 1.35416,
		y = 0.22988
	},
	[Serial.TreasureType.TreasureType_Sapphire] = {
		x = 1.29166,
		y = 0.2159
	},
	[Serial.TreasureType.TreasureType_Diamond] = {
		x = 1.479166,
		y = 0.0491803
	}
}

return
