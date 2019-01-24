slot0 = class_C("PathTrackerBezier", ClassLoader:aquireClass("PathTracker"))

slot0.onCreate = function (slot0, ...)
	slot0.super.onCreate(slot0, ...)
end

slot0.onUpdate = function (slot0, slot1)
	slot0._currentPosition, slot0._currentRotation, slot0._currentDirection = PathMath.calculateBezier(slot0._pathConfig.controlPoints, slot1)
end

return slot0
