slot0 = class_C("PathTrackerCircle", ClassLoader:aquireClass("PathTracker"))

slot0.onCreate = function (slot0, ...)
	slot0.super.onCreate(slot0, ...)

	slot0._duration = slot0:calculateDuration(slot0._pathConfig.controlPoints[1], slot0._pathConfig.controlPoints[3])
end

slot0.onUpdate = function (slot0, slot1)
	slot0._currentPosition, slot0._currentDirection, slot0._roll = PathMath.calculateCircle(slot0._pathConfig.controlPoints, slot1)
end

slot0.calculateDuration = function (slot0, slot1, slot2)
	return slot1.x * slot2.y
end

return slot0
