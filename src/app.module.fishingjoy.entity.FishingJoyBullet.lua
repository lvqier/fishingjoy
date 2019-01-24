slot2 = "FishingJoyBullet"
FishingJoyBullet = class(slot1)

FishingJoyBullet.ctor = function (slot0)
	slot3 = slot0
	slot6 = "entity.FishingJoyEntityBase"

	ClassUtil.extends(slot2, FishingJoyRequireLua(slot5))

	slot0.cannonRenderType = 0
	slot0.cannonFireType = 0
	slot0.bulletSeatId = 0
end

FishingJoyBullet.getEntityType = function (slot0)
	return FISHINGJOY_ENTITY_TYPE_OBJ.BULLET
end

FishingJoyBullet.getSeatId = function (slot0)
	return slot0.bulletSeatId
end

FishingJoyBullet.setSeatId = function (slot0, slot1)
	slot0.bulletSeatId = slot1
end

FishingJoyBullet.setBulletScore = function (slot0, slot1)
	slot0.score = slot1
end

FishingJoyBullet.getBulletScore = function (slot0)
	return slot0.score
end

FishingJoyBullet.setCannonFireType = function (slot0, slot1)
	slot0.cannonFireType = slot1
end

FishingJoyBullet.getCannonFireType = function (slot0)
	return slot0.cannonFireType
end

FishingJoyBullet.setCannonRenderType = function (slot0, slot1)
	slot0.cannonRenderType = slot1
end

FishingJoyBullet.getCannonRenderType = function (slot0)
	return slot0.cannonRenderType
end

FishingJoyBullet.setEntityRenderId = function (slot0, slot1)
	slot0.entityRenderId = slot1
end

FishingJoyBullet.getEntityRenderId = function (slot0)
	return slot0.entityRenderId or 0
end

FishingJoyBullet.getCannonConfig = function (slot0)
	return slot0.bulletCannonConfig or {}
end

FishingJoyBullet.setBulletLiveRenderData = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot0.bulletCannonConfig = slot0.bulletCannonConfig or {}
	slot0.bulletCannonConfig.bullet = slot0.bulletCannonConfig.bullet or {}
	slot0.bulletCannonConfig.bullet[#slot0.bulletCannonConfig.bullet + 1] = {
		entityName = slot1,
		entityResPath = slot2,
		entityAniName = slot3,
		entityScale = slot4,
		entityOffsetX = slot5,
		entityOffsetY = slot6,
		entityDirection = slot7,
		entityAniType = slot8,
		entityZOrder = slot9
	}
end

FishingJoyBullet.setBulletDeadRenderData = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot0.bulletCannonConfig = slot0.bulletCannonConfig or {}
	slot0.bulletCannonConfig.fishingNet = slot0.bulletCannonConfig.fishingNet or {}
	slot0.bulletCannonConfig.fishingNet[#slot0.bulletCannonConfig.fishingNet + 1] = {
		entityName = slot1,
		entityResPath = slot2,
		entityAniName = slot3,
		entityScale = slot4,
		entityOffsetX = slot5,
		entityOffsetY = slot6,
		entityDirection = slot7,
		entityAniType = slot8,
		entityZOrder = slot9
	}
end

return FishingJoyBullet
