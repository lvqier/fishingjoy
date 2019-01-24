FishTdSoundController = class("FishTdSoundController")
slot1 = {
	["Net0.mp3"] = {
		occupationTime = 0,
		time = 0.1,
		priority = ({
			BUTTON = 8,
			Fish = 6,
			ACCOUNT = 5,
			WAVE = 7,
			ATHER = 2,
			ATHER_II = 3,
			HIT = 0,
			GOLD = 4,
			DEAD = 9
		})["HIT"]
	},
	["Net1.mp3"] = {
		occupationTime = 0,
		time = 0.1,
		priority = ()["HIT"]
	},
	["Fire.mp3"] = {
		occupationTime = 0.2,
		time = 0.05,
		priority = ()["HIT"]
	},
	["GunFire0.mp3"] = {
		occupationTime = 0,
		time = 0.1,
		priority = ()["HIT"]
	},
	["GunFire1.mp3"] = {
		occupationTime = 0,
		time = 0.1,
		priority = ()["HIT"]
	},
	["ChangeScore.mp3"] = {
		occupationTime = 0,
		time = 0.2,
		priority = ()["ATHER"]
	},
	["MakeUP.mp3"] = {
		occupationTime = 0,
		time = 0.5,
		priority = ()["ATHER"]
	},
	["ChangeType.mp3"] = {
		occupationTime = 0,
		time = 0.1,
		priority = ()["ATHER"]
	},
	["award.mp3"] = {
		occupationTime = 0.5,
		time = 0.8,
		priority = ()["ATHER"]
	},
	["bigAward.mp3"] = {
		occupationTime = 4,
		time = 4,
		priority = ()["ATHER_II"]
	},
	["rotaryturn.mp3"] = {
		occupationTime = 0,
		time = 0.1,
		priority = ()["ATHER"]
	},
	["CJ.mp3"] = {
		occupationTime = 5,
		time = 5,
		priority = ()["ATHER_II"]
	},
	["TNNFDCLNV.mp3"] = {
		occupationTime = 1,
		time = 2,
		priority = ()["ATHER"]
	},
	["surf.mp3"] = {
		occupationTime = 7,
		time = 7,
		priority = ()["WAVE"]
	},
	["HaiLang.mp3"] = {
		occupationTime = 7,
		time = 7,
		priority = ()["WAVE"]
	},
	["fisha0.mp3"] = {
		occupationTime = 1.8,
		time = 2,
		priority = ()["Fish"]
	},
	["fisha1.mp3"] = {
		occupationTime = 1.8,
		time = 2,
		priority = ()["Fish"]
	},
	["fisha2.mp3"] = {
		occupationTime = 1.8,
		time = 2,
		priority = ()["Fish"]
	},
	["fisha3.mp3"] = {
		occupationTime = 1,
		time = 1,
		priority = ()["Fish"]
	},
	["fisha4.mp3"] = {
		occupationTime = 3.8,
		time = 4,
		priority = ()["Fish"]
	},
	["fisha5.mp3"] = {
		occupationTime = 2.8,
		time = 3,
		priority = ()["Fish"]
	},
	["fisha6.mp3"] = {
		occupationTime = 2.8,
		time = 3,
		priority = ()["Fish"]
	},
	["fisha7.mp3"] = {
		occupationTime = 1.8,
		time = 2,
		priority = ()["Fish"]
	},
	["fisha8.mp3"] = {
		occupationTime = 1.8,
		time = 2,
		priority = ()["Fish"]
	},
	["fisha9.mp3"] = {
		occupationTime = 1,
		time = 1,
		priority = ()["Fish"]
	},
	["fisha10.mp3"] = {
		occupationTime = 1.8,
		time = 2,
		priority = ()["Fish"]
	},
	["fisha11.mp3"] = {
		occupationTime = 1,
		time = 1,
		priority = ()["Fish"]
	},
	["fisha12.mp3"] = {
		occupationTime = 1,
		time = 1,
		priority = ()["Fish"]
	},
	["fisha13.mp3"] = {
		occupationTime = 1.8,
		time = 2,
		priority = ()["Fish"]
	},
	["fisha14.mp3"] = {
		occupationTime = 1.8,
		time = 2,
		priority = ()["Fish"]
	},
	["fisha15.mp3"] = {
		occupationTime = 1.8,
		time = 2,
		priority = ()["Fish"]
	},
	["fisha16.mp3"] = {
		occupationTime = 1.8,
		time = 2,
		priority = ()["Fish"]
	},
	["fisha17.mp3"] = {
		occupationTime = 1,
		time = 1,
		priority = ()["Fish"]
	},
	["Hit0.mp3"] = {
		occupationTime = 0,
		time = 0.1,
		priority = ()["HIT"]
	},
	["Hit1.mp3"] = {
		occupationTime = 0,
		time = 0.1,
		priority = ()["HIT"]
	},
	["Hit2.mp3"] = {
		occupationTime = 1,
		time = 1.5,
		priority = ()["HIT"]
	},
	["laser.mp3"] = {
		occupationTime = 0,
		time = 0.4,
		priority = ()["ATHER_II"]
	},
	["electric.mp3"] = {
		occupationTime = 0,
		time = 0.4,
		priority = ()["ATHER_II"]
	},
	["BigBang.mp3"] = {
		occupationTime = 1,
		time = 1,
		priority = ()["DEAD"]
	},
	["Bigfireworks.mp3"] = {
		occupationTime = 1,
		time = 0.2,
		priority = ()["ATHER_II"]
	},
	["fireworks.mp3"] = {
		occupationTime = 0.5,
		time = 0.2,
		priority = ()["ATHER_II"]
	},
	["click.mp3"] = {
		occupationTime = 0,
		time = 0,
		priority = ()["BUTTON"]
	},
	["sfx_bursts_fever.mp3"] = {
		occupationTime = 0,
		time = 0,
		priority = ()["DEAD"]
	},
	["sfx_blackhole.mp3"] = {
		occupationTime = 0,
		time = 0,
		priority = ()["DEAD"]
	},
	["bgm_boss.mp3"] = {
		occupationTime = 0,
		time = 0,
		priority = ()["ATHER"]
	},
	["sfx_levelup.mp3"] = {
		occupationTime = 0,
		time = 0,
		priority = ()["ACCOUNT"]
	},
	["sfx_window_open.mp3"] = {
		occupationTime = 0,
		time = 0,
		priority = ()["BUTTON"]
	},
	["sfx_window_close.mp3"] = {
		occupationTime = 0,
		time = 0,
		priority = ()["BUTTON"]
	},
	["sfx_coin.mp3"] = {
		occupationTime = 0,
		time = 0,
		priority = ()["GOLD"]
	},
	["sfx_thunder_fever.mp3"] = {
		occupationTime = 0,
		time = 0,
		priority = ()["ATHER"]
	}
}

FishTdSoundController.ctor = function (slot0)
	slot0:resetFishtdSoundManager()

	for slot4, slot5 in pairs(slot0) do
		audioMgr:preloadEffect(FilePath.SOUND .. "effect/" .. slot4)
	end
end

FishTdSoundController.resetFishtdSoundManager = function (slot0)
	slot0.m_lastEffectType = nil
	slot0.m_lastFishEffectType = nil
	slot0.m_fishEffectTime = 0
	slot0.m_effectTime = 0
	slot0.m_soundCategoryGameEffect = {}
	slot0.m_soundCategoryFishEffect = {}
	slot0.m_nVolume = 0
	slot0.m_nCurnId = 0
	slot0.m_bSound = true
	slot0.m_bMusic = true
	slot0.m_bgms = {
		"bgm1.mp3",
		"bgm2.mp3",
		"bgm3.mp3",
		"bgm4.mp3"
	}
	slot0.m_effects = {
		[Fish3DSound.GameEffect.CANNON_SWITCH] = "MakeUP.mp3",
		[Fish3DSound.GameEffect.CASTING_NORMAL] = "Net0.mp3",
		[Fish3DSound.GameEffect.CASTING_ION] = "Net1.mp3",
		[Fish3DSound.GameEffect.CATCH] = "Hit0.mp3",
		[Fish3DSound.GameEffect.CATCH1] = "Hit1.mp3",
		[Fish3DSound.GameEffect.CATCH2] = "Hit2.mp3",
		[Fish3DSound.GameEffect.FIRE] = "Fire.mp3",
		[Fish3DSound.GameEffect.IONFIRE] = "Fire.mp3",
		[Fish3DSound.GameEffect.INSERT] = "ChangeScore.mp3",
		[Fish3DSound.GameEffect.AWARD] = "award.mp3",
		[Fish3DSound.GameEffect.BIGAWARD] = "bigAward.mp3",
		[Fish3DSound.GameEffect.ROTARYTURN] = "rotaryturn.mp3",
		[Fish3DSound.GameEffect.BINGO] = "CJ.mp3",
		[Fish3DSound.GameEffect.BINGO2] = "TNNFDCLNV.mp3",
		[Fish3DSound.GameEffect.WAVE] = "surf.mp3",
		[Fish3DSound.GameEffect.EFFECT_BULLET_BOMB] = "Fire.mp3",
		[Fish3DSound.GameEffect.BOMB_LASER] = "laser.mp3",
		[Fish3DSound.GameEffect.BOMB_ELECTRIC] = "electric.mp3",
		[Fish3DSound.GameEffect.EFFECT_PARTICAL_BIG_BOMB] = "BigBang.mp3",
		[Fish3DSound.GameEffect.EFFECT_PARTICAL_BIG_FIREWORKS] = "Bigfireworks.mp3",
		[Fish3DSound.GameEffect.EFFECT_PARTICAL_FIREWORKS] = "fireworks.mp3",
		[Fish3DSound.GameEffect.BUTTON_CLICK] = "click.mp3",
		[Fish3DSound.GameEffect.FROZEN_EFFECT] = "sfx_bursts_fever.mp3",
		[Fish3DSound.GameEffect.BLACK_VORTEX] = "sfx_blackhole.mp3",
		[Fish3DSound.GameEffect.BOSS_COME] = "bgm_boss.mp3",
		[Fish3DSound.GameEffect.BOSS_ACCOUNT] = "sfx_levelup.mp3",
		[Fish3DSound.GameEffect.ION_CANNON_ACTIVE] = "ChangeType.mp3",
		[Fish3DSound.GameEffect.ION_CANNON_FIRE] = "Fire.mp3",
		[Fish3DSound.GameEffect.DIALOG_POPUP] = "sfx_window_open.mp3",
		[Fish3DSound.GameEffect.DIALOG_CLOSE] = "sfx_window_close.mp3",
		[Fish3DSound.GameEffect.GOLD_POPUP] = "sfx_coin.mp3",
		[Fish3DSound.GameEffect.EXPLODE] = "sfx_thunder_fever.mp3"
	}
	slot0.m_fishSound = {
		"fisha1.mp3",
		"fisha1.mp3",
		"fisha2.mp3",
		"fisha3.mp3",
		"fisha4.mp3",
		"fisha5.mp3",
		"fisha10.mp3",
		"fisha7.mp3",
		"fisha9.mp3",
		"fisha6.mp3",
		"fisha14.mp3",
		"fisha15.mp3",
		"fisha5.mp3",
		"fisha11.mp3",
		"fisha16.mp3",
		"fisha13.mp3",
		"fisha0.mp3",
		"fisha4.mp3",
		"fisha12.mp3",
		"fisha17.mp3",
		"fisha11.mp3",
		"fisha8.mp3"
	}
	slot0._killBossEffect = {
		chuitousha = Fish3DSound.GameEffect.BIGAWARD
	}
	slot0._bossCome = {
		chuitousha = Fish3DSound.GameEffect.BOSS_COME,
		zhangyu = Fish3DSound.GameEffect.BOSS_COME,
		haiyao = Fish3DSound.GameEffect.BOSS_COME
	}
	slot0._specialEffect = {
		[20.0] = 19,
		[21.0] = 21,
		[22.0] = 20
	}
	slot0.effectRepeatState = {
		[Fish3DSound.GameEffect.GOLD_POPUP] = {
			maxCount = 3,
			clearInterval = 0.2,
			counter = 0,
			timer = 0
		},
		[Fish3DSound.GameEffect.BOMB_ELECTRIC] = {
			maxCount = 2,
			clearInterval = 0.1,
			counter = 0,
			timer = 0
		},
		[Fish3DSound.GameEffect.EXPLODE] = {
			maxCount = 1,
			clearInterval = 0.1,
			counter = 0,
			timer = 0
		}
	}
	slot0.total = 0
	slot0.totalTimer = 0
	slot0.bossBgmTimer = 0
end

FishTdSoundController.playRandomFishEffect = function (slot0, slot1)
	if slot0._specialEffect[slot1] then
		slot0:playFishTdFishEffect(slot0._specialEffect[slot1])
	else
		slot0:playFishTdFishEffect((3 * (math.floor(math.random() * 79) + 1) * slot1 * slot1 + 7 * (math.floor(math.random() * 79) + 1) * slot1 + 29 * slot1 + 173) % 18 + 1)
	end
end

FishTdSoundController.playFishTdGameEffect = function (slot0, slot1)
	if slot0.total > 5 then
		return
	end

	if not slot0.m_effects[slot1] then
		return
	end

	if slot0.effectRepeatState[slot1] then
		if slot3.counter == slot3.maxCount then
			return
		else
			slot3.counter = slot3.counter + 1

			slot0:playGameEffect(slot2)
		end
	else
		slot0:playGameEffect(slot2)
	end
end

FishTdSoundController.playFishTdFishEffect = function (slot0, slot1)
	if slot0.total > 5 then
		return
	end

	if not slot0.m_fishSound[slot1] then
		return
	end

	if not slot0[slot2] then
		return
	end

	slot0.m_soundCategoryFishEffect[slot3.priority] = slot0.m_soundCategoryFishEffect[slot3.priority] or {
		time = 0
	}
	slot4 = socket.gettime()

	if slot0.m_soundCategoryFishEffect[slot3.priority].last_sound and slot4 - slot5.time < slot0[slot5.last_sound].time then
		return
	end

	slot5.time = slot4
	slot5.last_sound = slot2

	slot0:playGameEffect(slot2)
end

FishTdSoundController.playFishTdMusicByID = function (slot0, slot1)
	slot0:playMusic(ClassLoader:aquireSingleton("GameConfig").SceneSets[slot1].bgMap)

	slot0.currentBgMusicName = ClassLoader.aquireSingleton("GameConfig").SceneSets[slot1].bgMap
	slot0.bossBgmTimer = 0
end

FishTdSoundController.playMusic = function (slot0, slot1, slot2)
	audioMgr:playMusic(FilePath.SOUND .. "bgm/" .. slot1, slot2 or 1)
end

FishTdSoundController.playGameEffect = function (slot0, slot1, slot2)
	audioMgr:playEffect(FilePath.SOUND .. "effect/" .. slot1, slot2 or false)

	slot0.total = slot0.total + 1
end

FishTdSoundController.playEffectOnBossCome = function (slot0, slot1)
	audioMgr:playMusic(FilePath.SOUND .. "effect/bgm_boss.mp3")

	slot0.bossBgmTimer = 14
end

FishTdSoundController.playEffectOnBossKill = function (slot0, slot1)
	if slot0._killBossEffect[slot1] then
		slot0:playFishTdGameEffect(slot0._killBossEffect[slot1])
	end
end

FishTdSoundController.update = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.effectRepeatState) do
		slot6.timer = slot6.timer + slot1

		if slot6.clearInterval < slot6.timer then
			slot6.timer = slot6.timer - slot6.clearInterval
			slot6.counter = 0
		end
	end

	slot0.totalTimer = slot0.totalTimer + slot1

	if slot0.totalTimer > 0.5 then
		slot0.total = 0
		slot0.totalTimer = 0
	end

	if slot0.bossBgmTimer > 0 then
		slot0.bossBgmTimer = slot0.bossBgmTimer - slot1

		if slot0.bossBgmTimer <= 0 then
			slot0.bossBgmTimer = 0

			slot0:playMusic(slot0.currentBgMusicName)
		end
	end
end

fishtdSound = FishTdSoundController.new()

return
