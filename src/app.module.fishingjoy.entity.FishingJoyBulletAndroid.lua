function slot3()
	slot2 = fishgame.Bullet

	return fishgame.Bullet.Create(slot1)
end

FishingJoyBulletAndroid = class(slot1, "FishingJoyBulletAndroid")

FishingJoyBulletAndroid.ctor = function (slot0, slot1)
	slot0.cannonRenderType = 0
	slot0.cannonFireType = 0
	slot0.bulletSeatId = 0
end

FishingJoyBulletAndroid.getSeatId = function (slot0)
	return slot0.bulletSeatId
end

FishingJoyBulletAndroid.setSeatId = function (slot0, slot1)
	slot0.bulletSeatId = slot1
end

FishingJoyBulletAndroid.setBulletScore = function (slot0, slot1)
	slot0.score = slot1
end

FishingJoyBulletAndroid.getBulletScore = function (slot0)
	return slot0.score
end

FishingJoyBulletAndroid.setEntityPosition = function (slot0, slot1, slot2)
	slot7 = slot2

	slot0.SetPosition(slot4, slot0, slot1)
end

FishingJoyBulletAndroid.setEntityStatus = function (slot0, slot1)
	slot5 = slot1

	slot0.SetState(slot3, slot0)
end

FishingJoyBulletAndroid.setCannonFireType = function (slot0, slot1)
	slot5 = slot1

	slot0.SetCannonType(slot3, slot0)
end

FishingJoyBulletAndroid.setEntityId = function (slot0, slot1)
	slot5 = slot1

	slot0.SetId(slot3, slot0)
end

FishingJoyBulletAndroid.getEntityId = function (slot0)
	slot3 = slot0

	return slot0.GetId(slot2)
end

FishingJoyBulletAndroid.setEntityMoveComponent = function (slot0, slot1)
	slot5 = slot1

	slot0.SetMoveCompent(slot3, slot0)
end

FishingJoyBulletAndroid.setEntityTargetId = function (slot0, slot1)
	slot5 = slot1

	slot0.SetTarget(slot3, slot0)
end

return FishingJoyBulletAndroid
