slot0 = class_C("MotionPath", ClassLoader:aquireClass("MotionController"))

slot0.onCreate = function (slot0, slot1, slot2, slot3)
	slot0.super.onCreate(slot0, slot3)

	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")

	if slot0.gameConfig.PLATFORM_ANDROID then
		slot0._pathFunc, slot0._pathData = slot0:getPathTrackerByConfig(slot1)
		slot0._offset = slot2

		if device.platform == "android" then
			slot0._timeStep = 0.03
		else
			slot0._timeStep = 0.016
		end

		slot0._deltaTime = 0

		if slot1.specialAction.size > 0 then
			slot0.hasSpecialAction = true
			slot0.specialActionConfig = slot1.specialAction
			slot0.currentActionIndex = 1
		end
	else
		slot0:addProperty("pathSegments")
		slot0:addProperty("pathEnded")
		slot0:addProperty("offset")
		slot0:setValue("pathSegments", slot1)
		slot0:setValue("offset", slot2)

		slot0.pathTracker = nil
	end

	slot0._enabled = true
end

slot0.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)

	if not slot0.gameConfig.PLATFORM_ANDROID then
		slot0.pathTracker = slot0:getPathTrackerByConfig(slot0.pathSegments._value, slot0.offset._value)

		slot0.pathTracker:update(0, 0)
		slot0.pathTracker:updateProperty(slot0.position, slot0.direction)
	end

	slot0:onUpdate(0)
end

slot0.onUpdate = function (slot0, slot1)
	if slot0.gameConfig.PLATFORM_ANDROID then
		if not slot0._enabled then
			slot0._updateDelta = 0

			return false
		else
			slot0._updateDelta = slot1
		end

		slot6 = 0
		slot4, slot5, slot6 = slot0._pathFunc(slot0._pathData, slot4, slot0._timeStep, slot0._deltaTime + slot1, slot0.speed._value, slot0.position._value, slot0.direction._value)

		if slot9 > 0 then
			slot0.isRemoved:set(not slot0.isDead._value)
		else
			slot0._distance = slot4
			slot0._deltaTime = slot5
			slot2.x = slot2.x + slot0._offset.x
			slot2.y = slot2.y + slot0._offset.y
			slot2.z = slot2.z + slot0._offset.z
		end

		if slot0.hasSpecialAction and slot0.currentActionIndex <= slot0.specialActionConfig.size and math.abs(slot0.specialActionConfig[slot0.currentActionIndex].distance - slot4) < 10 then
			slot0.specialAction:trigger(slot7.actionIndex)

			slot0.currentActionIndex = slot0.currentActionIndex + 1
		end
	else
		if not slot0.super.onUpdate(slot0, slot1) then
			return
		end

		if not slot0.pathEnded._value then
			if slot0.pathTracker.update(slot2, slot0._updateDelta, slot0.speed._value) > 0 then
				slot0.pathEnded:set(true)
			end

			slot0.position:trigger(slot2._currentPosition)
			slot0.direction:trigger(slot2._currentDirection)
		else
			slot0.isRemoved:set(true)
		end
	end
end

slot0.getPathTrackerByConfig = function (slot0, slot1, slot2)
	if slot0.gameConfig.PLATFORM_ANDROID then
		if slot1.type == slot0.gameConfig.PathType.BEZIER then
			return PathMath.getBezierRoutePosition, slot1.bezierRoute
		elseif slot1.type == slot0.gameConfig.PathType.SPIRAL then
			return PathMath.getSpiralRoutePosition, slot1.bezierRoute
		end
	else
		return ClassLoader:aquireSingleton("PathTrackerFactory"):getPathTrackerByConfig(slot1, slot2)
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
