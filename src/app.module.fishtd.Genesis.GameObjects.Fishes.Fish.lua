slot0 = class_C("Fish", ClassLoader:aquireClass("GameObject"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("direction")
	slot0:addProperty("speed")
	slot0:addProperty("position")
	slot0:addProperty("boneData")
	slot0:addProperty("collisionTarget")
	slot0:addProperty("isDead")
	slot0:addProperty("isRemoved")
	slot0:addProperty("visualId")
	slot0:addProperty("typeId")
	slot0:addProperty("collisionEnabled")
	slot0:addProperty("collisionMask")
	slot0:addProperty("roll")
	slot0:addProperty("lockLevel")
	slot0:addProperty("hit")
	slot0:addProperty("deadCause")
	slot0:addProperty("maxKill")
	slot0:addProperty("grouped")
	slot0:addProperty("bonePosition")
	slot0:addProperty("selected")
	slot0:addProperty("specialAction")
	slot0:addProperty("killScore")

	slot0._originSpeed = 0
	slot0._mirrorPosition = {
		z = 0,
		x = 0,
		y = 0
	}
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0.alive = true
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)

	if not slot0.gameConfig.PLATFORM_ANDROID then
		slot0:setValue("boneData", {})
	end

	slot0:setValue("isDead", false)
	slot0:setValue("collisionEnabled", true)
	slot0:setValue("isRemoved", false)
	slot0:setValue("roll", 0)
	slot0:setValue("position", {
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("direction", {
		z = 0,
		x = 1,
		y = 0
	})
	slot0:setValue("hit", false)
	slot0:setValue("maxKill", -1)
	slot0:setValue("grouped", false)
	slot0:setValue("bonePosition", {
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("selected", false)
	slot0:setValue("specialAction", 0)
	slot0:setValue("collisionTarget", {})
	slot0:setValue("speed", 0)
	slot0:setValue("collisionMask", 4294967295.0)
	slot0:setValue("lockLevel", 0)
	slot0:setValue("deadCause", nil)
	slot0:setValue("killScore", 0)
end

slot0.onReset = function (slot0)
	slot0:setValue("isDead", false)
	slot0:trigger("collisionEnabled", false)
	slot0:setValue("isRemoved", false)
	slot0:setValue("roll", 0)
	slot0:setValue("hit", false)
	slot0:setValue("deadCause", nil)
	slot0:setValue("deadTrigger", nil)
	slot0:setValue("maxKill", -1)
	slot0:setValue("grouped", false)
	slot0:setValue("selected", false)
	slot0:setValue("specialAction", 0)
	slot0:setValue("killScore", 0)
end

slot0.setOriginSpeed = function (slot0, slot1)
	slot0._originSpeed = slot1
end

slot0.getOriginSpeed = function (slot0)
	return slot0._originSpeed
end

slot0.onUpdate = function (slot0, slot1)
	slot0.c_motion:onUpdate(slot1)
	slot0.c_visual:onUpdate(slot1)
	slot0.c_collisionArea:onUpdate()
end

slot0.onDestroy = function (slot0)
	slot0.super.onDestroy(slot0)

	slot0._mirrorPosition = nil
	slot0.alive = false
end

return slot0
