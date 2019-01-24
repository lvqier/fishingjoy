ENUM = {
	CONTROLLER_STATE = {
		OFFLINE = 2,
		LEFT = 0,
		ONLINE = 1
	},
	COLLISION_AREA_TYPE = {
		BULLET = 0,
		SELECT = 2,
		FISH = 1
	},
	WORLD_STATE = {
		STOPPED = 0,
		PAUSING = 2,
		RUNNING = 1
	},
	NUMBER_TEXTURE_TYPE = {
		SPRITE = 1,
		SPINE = 2
	},
	FISH_VISUAL_TYPE = {
		Explode = 7,
		Cap = 4,
		GROUP = 1,
		Frozen = 6,
		EffectTarget = 2,
		EffectCap = 5,
		NORMAL = 0,
		Light = 9,
		Vortex = 8,
		EffectCycle = 3
	},
	FishFrozenEffect = {
		Cold = {
			json = FilePath.ANIMATION .. "frozen/cold/cold.json",
			atlas = FilePath.ANIMATION .. "frozen/cold/cold.atlas"
		},
		Light = {
			json = FilePath.ANIMATION .. "frozen/light/light.json",
			atlas = FilePath.ANIMATION .. "frozen/light/light.atlas"
		},
		Effect = {
			json = FilePath.ANIMATION .. "frozen/effect/effect.json",
			atlas = FilePath.ANIMATION .. "frozen/effect/effect.atlas"
		},
		Timer = {
			json = FilePath.ANIMATION .. "frozen/timer/timer.json",
			atlas = FilePath.ANIMATION .. "frozen/timer/timer.atlas"
		},
		Texture = {
			height = 84,
			width = 66,
			path = FilePath.INGAME_UI .. "boss_defen.png"
		}
	},
	FishExplodeEffect = {
		Fire = {
			json = FilePath.ANIMATION .. "explode/Fire/Fire.json",
			atlas = FilePath.ANIMATION .. "explode/Fire/Fire.atlas"
		},
		Explode = {
			json = FilePath.ANIMATION .. "explode/Explode/Explode.json",
			atlas = FilePath.ANIMATION .. "explode/Explode/Explode.atlas"
		},
		Mask = {
			json = FilePath.ANIMATION .. "explode/Mask/Mask.json",
			atlas = FilePath.ANIMATION .. "explode/Mask/Mask.atlas"
		},
		Account = {
			json = FilePath.ANIMATION .. "explode/Account/Account.json",
			atlas = FilePath.ANIMATION .. "explode/Account/Account.atlas"
		},
		Texture = {
			scale = 0.5,
			height = 84,
			width = 58,
			path = FilePath.INGAME_UI .. "light_account.png"
		}
	},
	FishVortexEffect = {
		Effect = {
			json = FilePath.ANIMATION .. "vortex/Effect/Effect.json",
			atlas = FilePath.ANIMATION .. "vortex/Effect/Effect.atlas"
		},
		Vortex = {
			json = FilePath.ANIMATION .. "vortex/Vortex/Vortex.json",
			atlas = FilePath.ANIMATION .. "vortex/Vortex/Vortex.atlas"
		}
	},
	FishLightEffect = {
		Effect = {
			json = FilePath.ANIMATION .. "light/Effect/Effect.json",
			atals = FilePath.ANIMATION .. "light/Effect/Effect.atlas"
		},
		Chain = {
			json = FilePath.ANIMATION .. "light/Chain/Chain.json",
			atlas = FilePath.ANIMATION .. "light/Chain/Chain.atlas"
		},
		Target = {
			json = FilePath.ANIMATION .. "light/Target/Target.json",
			atlas = FilePath.ANIMATION .. "light/Target/Target.atlas"
		},
		Account = {
			json = FilePath.ANIMATION .. "light/Account/Account.json",
			atlas = FilePath.ANIMATION .. "light/Account/Account.atlas"
		},
		Texture = {
			Scale = 0.5,
			height = 84,
			width = 58,
			path = FilePath.INGAME_UI .. "light_account.png"
		}
	},
	FishKingEffect = {
		Chain = {
			json = FilePath.ANIMATION .. "king/Chain/Chain.json",
			atlas = FilePath.ANIMATION .. "king/Chain/Chain.atlas"
		},
		Target = {
			json = FilePath.ANIMATION .. "king/Target/Target.json",
			atlas = FilePath.ANIMATION .. "king/Target/Target.atlas"
		},
		Account_King = {
			json = FilePath.ANIMATION .. "king/Account/Account_King.json",
			atlas = FilePath.ANIMATION .. "king/Account/Account_King.atlas"
		},
		Account_Emperor = {
			json = FilePath.ANIMATION .. "king/Account/Account_Emperor.json",
			atlas = FilePath.ANIMATION .. "king/Account/Account_Emperor.atlas"
		}
	},
	FishEffectType = {
		Frozen = 6,
		Explode = 7
	},
	LOCKING_MODE = {
		MANUAL_LOCKING = 1,
		AUTO_LOCKING = 2,
		NO_LOCKING = 0
	},
	EffectType = {
		EffectType_Kill = 1,
		EffectType_Award = 5,
		EffectType_Money = 0,
		EffectType_Produce = 3,
		EffectType_BlackWater = 4,
		EffectType_AddBuffer = 2
	},
	SpecialEffectType = {
		SpecialEffectType_Light = 4,
		SpecialEffectType_None = 0,
		SpecialEffectType_Emperor = 5,
		SpecialEffectType_Normal = 1,
		SpecialEffectType_Explode = 3,
		SpecialEffectType_King = 6,
		SpecialEffectType_Frozen = 7,
		SpecialEffectType_Vortex = 2
	},
	BufferType = {
		BufferType_ChangeSpeed = 1
	},
	EffectLevel = {
		EffectLevel_Middle = 2,
		EffectLevel_Primary = 1,
		EffectLevel_Senior = 3,
		EffectLevel_Explode = 4
	}
}
LightingType = {
	LightingType_Blue = 2,
	LightingType_Red = 1,
	LightingType_Light = 3,
	LightingType_Bomb = 0
}
ChainConfig = {
	[LightingType.LightingType_Bomb] = {
		animation = "move",
		image = "fish_42"
	},
	[LightingType.LightingType_Red] = {
		animation = "move",
		image = "fish_42"
	},
	[LightingType.LightingType_Blue] = {
		animation = "move",
		image = "fish_41"
	},
	[LightingType.LightingType_Light] = {
		animation = "move",
		image = "fish_40"
	}
}
EventFish3D = {
	EventFish3D_Dispatch_Show_Seat = "EventFish3D_Dispatch_Show_Seat",
	EventFish3D_Dispatch_Show_Bingo = "EventFish3D_Dispatch_Show_Bingo",
	EventFish3D_Dispatch_Shake_Screen = "EventFish3D_Dispatch_Shake_Screen",
	EventFish3D_Dispatch_Lighting_Chain = "EventFish3D_Dispatch_Lighting_Chain"
}
Fish3DType = {
	Fish3DType_Special = 1,
	Fish3DType_Normal = 0
}
FishWiki = {
	SpeedType = {
		SpeedType_Normal = 1,
		SpeedType_Slow = 0,
		SpeedType_Fast = 2
	},
	CatchType = {
		CatchType_Normal = 1,
		CatchType_Easy = 0,
		CatchType_Difficult = 2
	},
	ClassType = {
		ClassType_Special = 1,
		ClassType_Normal = 0
	},
	LiveType = {
		LiveType_Valley = 1,
		LiveType_Country = 0,
		LiveType_Palace = 2
	}
}
FishWiki_String = {
	SpeedString = {
		[FishWiki.SpeedType.SpeedType_Slow] = "慢",
		[FishWiki.SpeedType.SpeedType_Normal] = "一般",
		[FishWiki.SpeedType.SpeedType_Fast] = "快"
	},
	ClassString = {
		[FishWiki.ClassType.ClassType_Normal] = "普通",
		[FishWiki.ClassType.ClassType_Special] = "特殊"
	},
	CatchString = {
		[FishWiki.CatchType.CatchType_Easy] = "容易",
		[FishWiki.CatchType.CatchType_Normal] = "普通",
		[FishWiki.CatchType.CatchType_Difficult] = "难"
	},
	LiveString = {
		[FishWiki.LiveType.LiveType_Country] = "渔村港口",
		[FishWiki.LiveType.LiveType_Valley] = "海妖之谷",
		[FishWiki.LiveType.LiveType_Palace] = "东海龙宫"
	}
}
Fish3DSound = {
	GameEffect = {
		WAVE = 14,
		EFFECT_PARTICAL_BIG_BOMB = 20,
		EFFECT_BULLET_BOMB = 17,
		GOLD_POPUP = 33,
		CASTING_NORMAL = 1,
		BIGAWARD = 10,
		BOMB_ELECTRIC = 19,
		BOMB_LASER = 18,
		AWARD = 9,
		EXPLODE = 34,
		IONFIRE = 7,
		CANNON_SWITCH = 0,
		ION_CANNON_FIRE = 30,
		CASTING_ION = 2,
		EFFECT_PARTICAL_FIREWORKS = 22,
		DIALOG_POPUP = 31,
		CATCH = 3,
		ROTARYTURN = 11,
		BLACK_VORTEX = 25,
		FROZEN_EFFECT = 24,
		CATCH2 = 5,
		CATCH1 = 4,
		ION_CANNON_ACTIVE = 29,
		FIRE = 6,
		GAME_EFFECT_COUNT = 16,
		EFFECT_PARTICAL_BIG_FIREWORKS = 21,
		BLACK_VORTEX_OVER = 26,
		BINGO = 12,
		BINGO2 = 13,
		DIALOG_CLOSE = 32,
		BUTTON_CLICK = 23,
		INSERT = 8,
		BOSS_ACCOUNT = 28,
		BOSS_COME = 27
	},
	BGMType = {
		Scene_1 = 1,
		Scene_3 = 3,
		Scene_2 = 2,
		Scene_4 = 4
	}
}
Fish3D_Constant = {
	Location3D_Zero = {
		z = 0,
		x = 0,
		y = 0
	},
	Hit_Color_Begin3b = {
		g = 130,
		b = 130,
		r = 255
	},
	Hit_Color_End3b = {
		g = 255,
		b = 255,
		r = 255
	},
	Color_White3b = {
		g = 255,
		b = 255,
		r = 255
	},
	Color_Black4b = {
		g = 0,
		a = 0,
		b = 0,
		r = 0
	}
}

return
