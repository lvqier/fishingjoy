slot0 = class_C("Bullet", ClassLoader:aquireClass("GameObject"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("rotation")
	slot0:addProperty("speed")
	slot0:addProperty("position")
	slot0:addProperty("boneData")
	slot0:addProperty("ownerChairId")
	slot0:addProperty("ownerUserId")
	slot0:addProperty("isDead")
	slot0:addProperty("isRemoved")
	slot0:addProperty("collisionTarget")
	slot0:addProperty("cannonSet")
	slot0:addProperty("cannonType")
	slot0:addProperty("collisionMask")
	slot0:addProperty("lockingTarget")
	slot0:addProperty("outOfBound")
	slot0:addProperty("collisionEnabled")

	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)

	if not slot0.gameConfig.PLATFORM_ANDROID then
		slot0:setValue("boneData", {})
	end

	slot0:setValue("rotation", 0)
	slot0:setValue("speed", 0)
	slot0:setValue("position", {
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("ownerChairId", 0)
	slot0:setValue("ownerUserId", 0)
	slot0:setValue("isDead", false)
	slot0:setValue("isRemoved", false)
	slot0:setValue("collisionTarget", {})
	slot0:setValue("cannonSet", 0)
	slot0:setValue("cannonType", 0)
	slot0:setValue("collisionMask", 4294967295.0)
	slot0:setValue("lockingTarget", 4294967295.0)
	slot0:setValue("outOfBound", false)
	slot0:setValue("collisionEnabled", false)
end

slot0.on_lockingTarget_changed = function (slot0)
	slot0:setValue("collisionMask", slot0:getValue("lockingTarget"))
end

slot0.on_outOfBound_changed = function (slot0)
	if slot0.outOfBound._value then
		reqFishGameNetCast({
			dwFishID = 0,
			dwData = 0,
			dwBulletID = slot0.id._value
		})
	end

	if slot0:getValue("outOfBound") then
		slot0:setValue("isRemoved", true)
	end
end

slot0.onUpdate = function (slot0, slot1)
	slot0.c_homingController:onUpdate(slot1)
	slot0.c_motion:onUpdate(slot1)
	slot0.c_visual:onUpdate(slot1)
	slot0.c_collisionArea:onUpdate()
end

slot0.on_isRemoved_changed = function (slot0)
	if slot0.isRemoved._value then
		slot1 = slot0.ownerUserId._value

		if slot0._world then
			slot0._world._playerBulletNumberMap[slot1] = slot0._world._playerBulletNumberMap[slot1] - 1
		end
	end
end

return slot0
