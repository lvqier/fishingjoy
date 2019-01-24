slot0 = class_C("MotionController", ClassLoader:aquireClass("Component"))

slot0.onCreate = function (slot0, slot1)
	slot0.super.onCreate(slot0)
	slot0:addProperty("position", slot1)
	slot0:addProperty("direction", slot1)
	slot0:addProperty("roll", slot1)
	slot0:addProperty("speed", slot1)
	slot0:addProperty("rotation", slot1)

	slot0._timeElapsed = 0
	slot0._timeOverflow = 0
	slot0._updateDelta = 0
	slot0._chasingCounter = 0

	slot0:addProperty("isDead", slot1)
	slot0:addProperty("deadCause", slot1)
	slot0:addProperty("isRemoved", slot1)
	slot0:addProperty("specialAction", slot1)
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("position", {
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("direction", {
		w = 1,
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("roll", 0)
	slot0:setValue("speed", 0)
	slot0:setValue("rotation", 0)
	slot0:setValue("isDead", false)
	slot0:setValue("deadCause", nil)
	slot0:setValue("isRemoved", false)
	slot0:setValue("specialAction", 0)
end

slot0.onLoad = function (slot0)
	slot1 = slot0:getValue("owner")

	slot0:bindSameName("position", slot1, "TWO_WAY")
	slot0:bindSameName("direction", slot1, "TWO_WAY")
	slot0:bindSameName("speed", slot1, "TWO_WAY")
	slot0:bindSameName("timeOverflow", slot1, "TWO_WAY")
	slot0:bindSameName("isDead", slot1, "TWO_WAY")
	slot0:bindSameName("isRemoved", slot1, "TWO_WAY")
	slot0:bindSameName("roll", slot1, "TWO_WAY")
	slot0:bindSameName("rotation", slot1, "TWO_WAY")
	slot0:bindSameName("deadCause", slot1, "TWO_WAY")
	slot0:bindSameName("specialAction", slot1, "TWO_WAY")
end

slot0.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
	slot0:unBindAll()
end

slot0.onUpdate = function (slot0, slot1)
	if slot0.isDead._value or slot0.isRemoved._value then
		slot0._updateDelta = 0

		return false
	else
		slot0._updateDelta = slot1
	end

	return true
end

slot0.onReset = function (slot0)
	slot0._chasingCounter = 0
	slot0._updateDelta = 0
	slot0._timeElapsed = 0
	slot0._timeOverflow = 0

	slot0:setValue("speed", 0)
end

return slot0
