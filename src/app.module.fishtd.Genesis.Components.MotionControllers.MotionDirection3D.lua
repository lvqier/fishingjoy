slot0 = class_C("MotionDirection3D", ClassLoader:aquireClass("MotionController"))

slot0.onCreate = function (slot0, slot1, slot2)
	slot0.super.onCreate(slot0, slot2)

	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0.PathMath = PathMath
	slot0._timeElapsed = 0
	slot0._duration = 0
	slot0.stepX = 0
	slot0.stepY = 0
	slot0.stepZ = 0
	slot0._enabled = true
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
end

slot0.onUpdate = function (slot0, slot1)
	if not slot0._enabled then
		slot0._updateDelta = 0

		return false
	else
		slot0._updateDelta = slot1
	end

	slot2 = slot0._timeElapsed + slot0._updateDelta
	slot3 = slot0.position._value

	if slot0.updatePosition then
		slot3.x = slot3.x + slot0.stepX * slot0._updateDelta
		slot3.y = slot3.y + slot0.stepY * slot0._updateDelta
		slot3.z = slot3.z + slot0.stepZ * slot0._updateDelta
	end

	if slot0._duration <= slot2 or slot3.z > 500 or slot3.z < -5000 then
		slot0.isRemoved:set(not slot0.isDead._value)
	else
		slot0._timeElapsed = slot2
	end
end

slot0.on_direction_changed = function (slot0)
	slot2 = slot0.speed._value

	if slot0.direction._value and slot2 then
		slot0.stepX = slot1.x * slot2
		slot0.stepY = slot1.y * slot2
		slot0.stepZ = slot1.z * slot2
	end
end

slot0.on_speed_changed = function (slot0)
	slot2 = slot0.speed._value

	if slot0.direction._value and slot2 then
		slot0.stepX = slot1.x * slot2
		slot0.stepY = slot1.y * slot2
		slot0.stepZ = slot1.z * slot2
	end

	if slot2 > 0 then
		slot0.updatePosition = true
	end
end

slot0.on_isDead_changed = function (slot0)
	if slot0.isDead._value then
		if slot0.deadCause._value ~= "EFFECT_KILL" then
			slot0._enabled = false
		else
			slot0._enabled = true
		end
	else
		slot0._enabled = true
	end
end

slot0.on_isRemoved_changed = function (slot0)
	slot0._enabled = not slot0.isRemoved._value
end

return slot0
