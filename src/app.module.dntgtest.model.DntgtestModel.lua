slot2 = "DntgtestModel"
DntgtestModel = class(slot1)
slot2 = "dntgtest.fishConfig.Dntgtest_System"

requireLuaFromModule(slot1)

slot2 = "dntgtest.fishConfig.Dntgtest_FishMulti"

requireLuaFromModule(slot1)

DntgtestModel.ctor = function (slot0)
	slot10 = true

	ClassUtil.extends(slot2, slot0, BaseGameModel, true, GameKind_DNTGTEST, nil, nil, false)

	slot0._loadingDuration = 5
	slot0.musicBg = "bgm/buyuBgMusic1.mp3"
	slot6 = true

	createSetterGetter(slot2, slot0, "fishPlayer", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "gameconfig", {
		nMaxInterval = 90,
		nFireInterval = 0.2,
		nMaxBulletCount = DNTGTEST_MAX_BULLET_COUNT
	})

	slot6 = true

	createSetterGetter(slot2, slot0, "switchingScene", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "allowFire", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isEnergyCannon", "no")

	slot6 = true

	createSetterGetter(slot2, slot0, "mirror", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "bulletCount", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "playerCannonAnimation", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "bAutoAttack", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "bLockFish", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "mCurSpeedRate", 1)

	slot6 = true

	createSetterGetter(slot2, slot0, "bulletDeltaTime", 0.3)

	slot6 = true

	createSetterGetter(slot2, slot0, "addEffectPartical", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "addFishGold", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "addBingo", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "iBossComing", -1)

	slot6 = true

	createSetterGetter(slot2, slot0, "fishGroupComing", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingExit", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShownTip", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingQualityTip", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "updateTickStatus", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "stopFireByMaxBullet", false)

	slot5 = -1

	createSetterGetter(slot2, slot0, "currSceneId")

	slot6 = true

	createSetterGetter(slot2, slot0, "luckPacketEvt", {})

	slot0.iCostBulletCount = 0
	slot0.iGetGoldCount = 0
	slot0.tKillFish = {}
	slot0._delay2ScloseSocketMs = 1000
end

DntgtestModel.updateCostBulletCount = function (slot0, slot1)
	slot0.iCostBulletCount = slot0.iCostBulletCount + slot1

	return slot0.iCostBulletCount
end

DntgtestModel.updateGetGoldCount = function (slot0, slot1)
	slot0.iGetGoldCount = slot0.iGetGoldCount + slot1

	return slot0.iGetGoldCount
end

DntgtestModel.updateKillFish = function (slot0, slot1)
	if slot1 >= 210 and slot1 <= 219 then
		slot1 = slot1 - 10
	end

	if slot0.tKillFish[slot1] == nil then
		slot0.tKillFish[slot1] = {
			iCount = 0,
			iLevel = Dntgtest_FishMulti[slot1].iLevel,
			iFishID = slot1,
			iScale = Dntgtest_FishMulti[slot1].iScale
		}
	end

	slot0.tKillFish[slot1].iCount = slot0.tKillFish[slot1].iCount + 1
end

DntgtestModel.getKillFish = function (slot0)
	return slot0.tKillFish
end

DntgtestModel.getPlayerByChairID = function (slot0, slot1)
	slot4 = slot0

	return slot0.getFishPlayer(slot3)[slot1 + 1]
end

DntgtestModel.setPlayerByChairID = function (slot0, slot1, slot2)
	slot0.getFishPlayer(slot4)[slot1 + 1] = slot2
	slot8 = true

	slot0:setFishPlayer(slot0, slot0.getFishPlayer(slot4))
end

DntgtestModel.resetLocalData = function (slot0)
	slot0.musicBg = "bgm/buyuBgMusic1.mp3"
	slot6 = true

	slot0.setFishPlayer(slot2, slot0, {}, nil)

	slot6 = true

	slot0.setGameconfig(slot2, slot0, {
		nMaxInterval = 90,
		nFireInterval = 0.2,
		nMaxBulletCount = DNTGTEST_MAX_BULLET_COUNT
	}, nil)

	slot6 = true

	slot0.setSwitchingScene(slot2, slot0, {}, nil)

	slot6 = true

	slot0.setAllowFire(slot2, slot0, false, nil)

	slot6 = true

	slot0.setIsEnergyCannon(slot2, slot0, "no", nil)

	slot6 = true

	slot0.setMirror(slot2, slot0, false, nil)

	slot6 = true

	slot0.setBulletCount(slot2, slot0, 0, nil)

	slot6 = true

	slot0.setPlayerCannonAnimation(slot2, slot0, 0, nil)

	slot6 = true

	slot0.setBAutoAttack(slot2, slot0, false, nil)

	slot6 = true

	slot0.setBLockFish(slot2, slot0, false, nil)

	slot6 = true

	slot0.setMCurSpeedRate(slot2, slot0, 1, nil)

	slot6 = true

	slot0.setAddEffectPartical(slot2, slot0, {}, nil)

	slot6 = true

	slot0.setAddFishGold(slot2, slot0, {}, nil)

	slot6 = true

	slot0.setAddBingo(slot2, slot0, {}, nil)

	slot6 = true

	slot0.setIBossComing(slot2, slot0, -1, nil)

	slot6 = true

	slot0.setFishGroupComing(slot2, slot0, false, nil)

	slot6 = true

	slot0.setIsShowingExit(slot2, slot0, false, nil)

	slot0.iCostBulletCount = 0
	slot0.iGetGoldCount = 0
	slot0.tKillFish = {}
end

DntgtestModel.destroy = function (slot0)
	return
end

return
