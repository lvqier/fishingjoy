slot0 = class_C("PathTrackerCubicBezier", ClassLoader:aquireClass("PathTracker"))

slot0.onCreate = function (slot0, ...)
	slot0.super.onCreate(slot0, ...)

	slot0._currentIndex = 2
	slot0._distance = 0
	slot0._speedCoef = 1
	slot0._timeElapsed = 0
	slot0._lastInterpPosition = 0
	slot0._speedCoef, overflow, slot0._currentPosition, slot0._currentDirection = PathMath.retrieveBezierRouteState(slot0._pathConfig.bezierRoute, 0, slot0._positionOffset)

	if device.platform == "android" then
		slot0._timeStep = 0.03
	else
		slot0._timeStep = 0.016
	end
end

slot0.update = function (slot0, slot1, slot2)
	slot3 = 0
	slot4 = slot0._timeStep
	slot5 = slot1 + slot0._lastInterpPosition
	slot6 = slot0._distance
	slot7 = slot0._currentPosition
	slot8 = slot0._speedCoef
	slot9 = slot0._currentDirection
	slot10 = slot0._pathConfig.bezierRoute
	slot11 = slot0._positionOffset

	while slot4 < slot5 do
		slot8, slot3, slot7, slot9 = PathMath.retrieveBezierRouteState(slot10, slot6, slot11)
		slot5 = slot5 - slot4
	end

	slot0._lastInterpPosition = slot5
	slot0._distance = slot6
	slot0._speedCoef = slot8
	slot0._currentPosition = slot7
	slot0._currentDirection = slot9

	return slot3
end

return slot0
