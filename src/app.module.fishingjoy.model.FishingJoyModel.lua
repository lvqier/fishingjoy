slot2 = "FishingJoyModel"
FishingJoyModel = class(slot1)

FishingJoyModel.ctor = function (slot0)
	slot10 = true

	ClassUtil.extends(slot2, slot0, BaseGameModel, true, GameKind_FISHINGJOY, nil, nil, false)

	slot4 = "fishingSeats"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "gameConfig"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "changeLevel"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "allowFire"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "energyCannon"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "mirrorSeat"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "selfBulletCount"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "playCASeatId"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "autoAttack"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "lockFish"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "currentFireRate"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "fireDelta"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "effectPartical"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "effectFishGold"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "effectBingo"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "whichBossComing"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "fishGroupComing"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "isShowingExit"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "activeUpdateTick"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "stopFireByMaxBulletCount"

	slot0.initializedLocalMem(slot2, slot0)

	slot4 = "currentLevelId"

	slot0.initializedLocalMem(slot2, slot0)

	slot3 = slot0

	slot0.initializedLocalData(slot2)

	slot6 = true

	slot0.setActiveUpdateTick(slot2, slot0, false, nil)

	slot6 = true

	slot0.setStopFireByMaxBulletCount(slot2, slot0, false, nil)

	slot4 = -1

	slot0.setCurrentLevelId(slot2, slot0)

	slot0._loadingDuration = 5
	slot0.musicBg = "bgm/buyuBgMusic1.mp3"
	slot0._delay2ScloseSocketMs = 1000
end

FishingJoyModel.initializedLocalMem = function (slot0, slot1)
	slot7 = true

	createSetterGetter(slot3, slot0, slot1, nil)
end

FishingJoyModel.initializedLocalData = function (slot0)
	slot0.musicBg = "bgm/buyuBgMusic1.mp3"
	slot6 = true

	slot0.setFishingSeats(slot2, slot0, {}, nil)

	slot6 = true

	slot0.setGameConfig(slot2, slot0, {
		fireDelta = 0.2,
		deltaMaxLimit = 90,
		maxBulletLimit = FISHINGJOY_BULLET_LIMIT
	}, nil)

	slot6 = true

	slot0.setChangeLevel(slot2, slot0, {}, nil)

	slot6 = true

	slot0.setAllowFire(slot2, slot0, false, nil)

	slot6 = true

	slot0.setEnergyCannon(slot2, slot0, false, nil)

	slot6 = true

	slot0.setMirrorSeat(slot2, slot0, false, nil)

	slot6 = true

	slot0.setSelfBulletCount(slot2, slot0, 0, nil)

	slot6 = true

	slot0.setPlayCASeatId(slot2, slot0, 0, nil)

	slot6 = true

	slot0.setAutoAttack(slot2, slot0, false, nil)

	slot6 = true

	slot0.setLockFish(slot2, slot0, false, nil)

	slot6 = true

	slot0.setCurrentFireRate(slot2, slot0, 1, nil)

	slot6 = true

	slot0.setFireDelta(slot2, slot0, 0.3, nil)

	slot6 = true

	slot0.setEffectPartical(slot2, slot0, {}, nil)

	slot6 = true

	slot0.setEffectFishGold(slot2, slot0, {}, nil)

	slot6 = true

	slot0.setEffectBingo(slot2, slot0, {}, nil)

	slot6 = true

	slot0.setWhichBossComing(slot2, slot0, -1, nil)

	slot6 = true

	slot0.setFishGroupComing(slot2, slot0, false, nil)

	slot6 = true

	slot0.setIsShowingExit(slot2, slot0, false, nil)
end

FishingJoyModel.getFishingSeatBySeatId = function (slot0, slot1)
	slot4 = slot0

	return slot0.getFishingSeats(slot3)[slot1 + 1]
end

FishingJoyModel.setFishingSeatBySeatId = function (slot0, slot1, slot2)
	slot0.getFishingSeats(slot4)[slot1 + 1] = slot2
	slot8 = true

	slot0:setFishingSeats(slot0, slot0.getFishingSeats(slot4))
end

FishingJoyModel.destroy = function (slot0)
	return
end

return FishingJoyModel
