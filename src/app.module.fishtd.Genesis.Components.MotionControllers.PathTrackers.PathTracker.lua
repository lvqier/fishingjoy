slot0 = class_C("PathTracker")

slot0.onCreate = function (slot0, slot1, slot2, slot3)
	slot0._pathConfig = slot1
	slot0._timeElapsed = 0
	slot0._currentPosition = {
		z = 0,
		x = 0,
		y = 0
	}
	slot0._currentDirection = {
		w = 1,
		z = 0,
		x = 0,
		y = 0
	}
	slot0._currentRotation = {
		z = 0,
		x = 0,
		y = 0
	}
	slot0._duration = slot3 or 0
	slot0._positionOffset = slot2 or {
		z = 0,
		x = 0,
		y = 0
	}
	slot0._roll = 0
end

slot0.onCreateFinish = function (slot0)
	return
end

slot0.update = function (slot0, slot1, slot2)
	slot0._timeElapsed = slot0._timeElapsed + slot1 * slot2
	slot5 = 0

	if slot0._timeElapsed / slot0._duration - 1 > 0 then
		slot5 = ((slot4 - 1) * slot0._duration) / slot2
		slot4 = 1
	end

	slot0:onUpdate(slot4)

	return slot5
end

slot0.onUpdate = function (slot0, slot1)
	return
end

slot0.updateProperty = function (slot0, slot1, slot2)
	slot1:set(slot0._currentPosition)
	slot2:set(slot0._currentDirection)
end

return slot0
