slot3 = {}
FishingJoyPlayer = class(slot1, "FishingJoyPlayer")

FishingJoyPlayer.ctor = function (slot0, slot1)
	slot0.cannonFireType = 0
	slot0.cannonRenderType = 0
	slot0.cannonFireMul = 0
	slot0.lockfishId = 0
	slot0.lockingFish = false
	slot0.lockedFish = {}
	slot0.firedBulletCount = 0
	slot0.allowFire = false
	slot0.seatId = slot1
	slot0.userId = -1
	slot0.score = 0
	slot0.nickName = "???"
	slot0.preFireRate = 1
	slot0.curFireRate = 1
	slot0._dirtyScore = false
	slot0.cannonAngle = FISHINGJOY_PI
	slot4 = slot0

	slot0.dirtyNickName(slot3)

	slot4 = slot0

	slot0.dirtyCannonDirection(slot3)

	slot4 = slot0

	slot0.dirtyScore(slot3)

	slot4 = slot0

	slot0.dirtyCannon(slot3)

	slot4 = slot0

	slot0.showPositionTip(slot3)
end

FishingJoyPlayer.setCannonAngle = function (slot0, slot1)
	slot0.cannonAngle = slot1 or 0
end

FishingJoyPlayer.getCannonAngle = function (slot0)
	return slot0.cannonAngle
end

FishingJoyPlayer.setFireRate = function (slot0, slot1, slot2)
	slot0.curFireRate = slot1
end

FishingJoyPlayer.getSeatId = function (slot0)
	return slot0.seatId
end

FishingJoyPlayer.showPositionTip = function (slot0)
	slot0._showPositionTip = true
end

FishingJoyPlayer.checkShowPositionTip = function (slot0)
	slot0._showPositionTip = false

	return slot0._showPositionTip
end

FishingJoyPlayer.dirtyNickName = function (slot0)
	slot0._dirtyNickName = true
end

FishingJoyPlayer.checkDirtyNickName = function (slot0)
	slot0._dirtyNickName = false

	return slot0._dirtyNickName
end

FishingJoyPlayer.dirtyCannonDirection = function (slot0)
	slot0._dirtyCannonDirection = true
end

FishingJoyPlayer.checkDirtyCannonDirection = function (slot0)
	slot0._dirtyCannonDirection = false

	return slot0._dirtyCannonDirection
end

FishingJoyPlayer.dirtyScore = function (slot0)
	slot0._dirtyScore = true
end

FishingJoyPlayer.checkDirtyScore = function (slot0)
	slot0._dirtyScore = false

	return slot0._dirtyScore
end

FishingJoyPlayer.dirtyCannon = function (slot0)
	slot0._dirtyCannon = true
end

FishingJoyPlayer.checkDirtyCannon = function (slot0)
	slot0._dirtyCannon = false

	return slot0._dirtyCannon
end

FishingJoyPlayer.setCannonRenderType = function (slot0, slot1)
	slot0.cannonRenderType = slot1
	slot4 = slot0

	slot0.dirtyCannon(slot3)
end

FishingJoyPlayer.getCannonRenderType = function (slot0)
	return slot0.cannonRenderType or 0
end

FishingJoyPlayer.setFireMul = function (slot0, slot1)
	slot0.cannonFireMul = slot1
	slot4 = slot0

	slot0.dirtyCannon(slot3)
end

FishingJoyPlayer.getFireMul = function (slot0)
	return slot0.cannonFireMul or 0
end

FishingJoyPlayer.setLockFishId = function (slot0, slot1)
	slot0.lockfishId = slot1

	if slot0.lockfishId ~= 0 then
		slot0.lockedFish[#slot0.lockedFish + 1] = slot1
	else
		slot0.lockedFish = {}
	end
end

FishingJoyPlayer.getLockFishId = function (slot0)
	return slot0.lockfishId or 0
end

FishingJoyPlayer.checkLockingFish = function (slot0)
	return slot0.lockingFish
end

FishingJoyPlayer.setLockingFish = function (slot0, slot1)
	slot0.lockingFish = slot1
end

FishingJoyPlayer.getCannonFireType = function (slot0)
	return slot0.cannonFireType
end

FishingJoyPlayer.setCannonFireType = function (slot0, slot1)
	slot0.cannonFireType = slot1
end

FishingJoyPlayer.getCannonConfig = function (slot0)
	slot3 = slot0.getCannonFireType(slot4)
	slot6 = slot0

	return FishingJoy_Cannon_GetCannonConfig(slot2, slot0:getFireMul())
end

FishingJoyPlayer.setPlayerScore = function (slot0, slot1)
	slot0.score = slot1
	slot4 = slot0

	slot0.dirtyScore(slot3)
end

FishingJoyPlayer.getPlayerScore = function (slot0)
	return slot0.score
end

FishingJoyPlayer.setNickName = function (slot0, slot1)
	slot0.nickName = slot1
	slot4 = slot0

	slot0.dirtyNickName(slot3)
end

FishingJoyPlayer.getNickName = function (slot0)
	return slot0.nickName
end

FishingJoyPlayer.setUserId = function (slot0, slot1)
	slot0.userId = slot1
end

FishingJoyPlayer.getUserId = function (slot0)
	return slot0.userId
end

return FishingJoyPlayer
