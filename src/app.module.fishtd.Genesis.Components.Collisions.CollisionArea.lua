slot0 = class_C("CollisionArea", ClassLoader:aquireClass("Component"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("collisionTarget", true)
	slot0:addProperty("boneData", true)
	slot0:addProperty("isDead", true)
	slot0:addProperty("collisionEnabled", true)
	slot0:addProperty("collisionMask", true)

	slot0.collisionManager = ClassLoader:aquireSingleton("CollisionManager")
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
end

slot0.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)
	slot0.collisionManager:registerCollisionArea(slot0)
end

slot0.onExit = function (slot0)
	slot0.super.onExit(slot0)
	slot0.collisionManager:unregisterCollisionArea(slot0)
end

slot0.onLoad = function (slot0)
	slot0.super.onLoad(slot0)

	slot1 = slot0:getValue("owner")

	slot0:bindSameName("boneData", slot1, "TWO_WAY")
	slot0:bindSameName("isDead", slot1, "TWO_WAY")
	slot0:bindSameName("collisionTarget", slot1, "TWO_WAY")
	slot0:bindSameName("collisionEnabled", slot1, "TWO_WAY")
	slot0:bindSameName("collisionMask", slot1, "TWO_WAY")
end

slot0.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
	slot0:unBindAll()
end

slot0.onDestroy = function (slot0)
	slot0.collisionManager:reclaimCollisionArea(slot0)
end

slot0.onUpdate = function (slot0)
	if slot0.gameConfig.PLATFORM_ANDROID then
		slot0.collisionManager:updateCollisionAreaEx(slot0, slot0.boneData._value)
	else
		slot0.collisionManager:updateCollisionArea(slot0, slot0.boneData._value.transformation, slot0.boneData._value.skeleton)
	end
end

slot0.onCollisionEvent = function (slot0, slot1)
	slot0.collisionTarget._value[#slot0.collisionTarget._value + 1] = slot1.owner._value
end

slot0.on_isDead_changed = function (slot0)
	slot0.collisionManager:disableCollisionArea(slot0, slot0:getValue("isDead") or not slot0:getValue("collisionEnabled"))
end

slot0.on_collisionEnabled_changed = function (slot0)
	slot0.collisionManager:disableCollisionArea(slot0, slot0.isDead._value or not slot0.collisionEnabled._value)
end

slot0.on_collisionMask_changed = function (slot0)
	slot0.collisionManager:setCollisionMask(slot0, slot0.collisionMask._value)
end

return slot0
