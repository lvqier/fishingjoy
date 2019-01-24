slot0 = class_C("PathTrackerSpiral", ClassLoader:aquireClass("PathTracker"))

slot0.onCreate = function (slot0, ...)
	slot0.super.onCreate(slot0, ...)

	slot0._lastInterpPosition = 0
	slot0._distance = 0
	slot0._speedCoef = 1
	slot0._timeElapsed = 0
	slot0._lastInterpPosition = 0
	slot0._speedCoef, slot0._overflow, slot0._currentPosition, slot0._currentDirection = PathMath.retrieveSpiralRouteState(slot0._pathConfig.bezierRoute, 0)
	slot0._interpBasePosition = {
		x = slot0._currentPosition.x,
		y = slot0._currentPosition.y,
		z = slot0._currentPosition.z
	}
end

slot0.update = function (slot0, slot1, slot2)
	slot3 = 0
	slot5 = slot1 + 0.025 * slot0._lastInterpPosition

	while slot4 < slot5 do
		slot0._distance = slot0._distance + slot2 * slot4
		slot0._speedCoef, slot3, slot0._interpBasePosition, slot0._currentDirection = PathMath.retrieveSpiralRouteState(slot0._pathConfig.bezierRoute, slot0._distance)

		if slot7 > 0 then
			slot5 = slot5 - slot4 + slot3 / slot2

			break
		else
			slot5 = slot5 - slot4
		end
	end

	if slot3 > 0 then
		return slot5
	else
		slot7 = {}
		_, _, slot7, _, _ = PathMath.retrieveSpiralRouteState(slot0._pathConfig.bezierRoute, slot0._distance + slot4 * slot2 * slot0._speedCoef)
		slot0._currentPosition.x = slot0._interpBasePosition.x * (1 - slot5 / slot4) + slot10.x * slot5 / slot4
		slot0._currentPosition.y = slot0._interpBasePosition.y * (1 - slot5 / slot4) + slot10.y * slot5 / slot4
		slot0._currentPosition.z = slot0._interpBasePosition.z * (1 - slot5 / slot4) + slot10.z * slot5 / slot4
		slot0._lastInterpPosition = slot5 / slot4

		return 0
	end
end

return slot0
