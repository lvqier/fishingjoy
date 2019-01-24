slot0 = ClassLoader:aquireClass("Tools")
slot1 = class_C("FishGrouped", ClassLoader:aquireClass("Fish"))

slot1.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("groupId")
	slot0:addProperty("parentTransform")
	slot0:addProperty("belong")

	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0.PathMath = PathMath
	slot0._positionCalculated = false
	slot0._directionCalculated = false
	slot0._cachedPosition = {
		z = 0,
		x = 0,
		y = 0
	}
	slot0._cachedDirection = {
		z = 0,
		x = 0,
		y = 0
	}
	slot0.parentNode = cc.Node:create()

	slot0.parentNode:retain()
end

slot1.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("belong", true)
	slot0:setValue("grouped", true)
	slot0:setValue("parentTransform", cc.mat4:createIdentity())
	slot0:assignGetterSetter("position", slot1:thisCall(slot0.position_getter, slot0), nil)
	slot0:assignGetterSetter("direction", slot1:thisCall(slot0.direction_getter, slot0), nil)
end

slot1.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)
	slot0:joinGroup(slot0:getValue("groupId"), slot0:getValue("belong"))
end

slot1.onExit = function (slot0)
	slot0.super.onExit(slot0)
	slot0:leaveGroup()
end

slot1.on_groupId_changed = function (slot0)
	if slot0._world then
		slot0:joinGroup(slot0:getValue("groupId"), slot0:getValue("belong"))
	end
end

slot1.joinGroup = function (slot0, slot1, slot2)
	slot0:leaveGroup()

	slot3 = slot0._world:retrieveEntity("group", slot1)

	if slot1 and slot3 and not slot3:getValue("isRemoved") then
		if slot2 then
			slot3:getValue("members")[slot0:getValue("id")] = slot0
			slot0._groupEntity = slot3
		elseif slot0.gameConfig.PLATFORM_ANDROID then
			slot0.PathMath.copyTransform(slot3:getValue("transform"), slot0.parentNode)
		else
			slot4 = slot3:getValue("transform")
			slot5 = cc.mat4:createIdentity()

			for slot9 = 1, 16, 1 do
				slot5[slot9] = slot4[slot9]
			end

			slot0:setValue("parentTransform", slot5)
		end
	elseif slot1 and not slot3 then
		print("Group not available !!!!!!!!!")
	end
end

slot1.leaveGroup = function (slot0)
	if slot0._groupEntity then
		if slot0.gameConfig.PLATFORM_ANDROID then
			slot0.PathMath.copyTransform(slot0._groupEntity:getValue("transform"), slot0.parentNode)
		else
			slot0:setValue("parentTransform", slot0._groupEntity:getValue("transform"))
		end

		slot0._groupEntity:getValue("members")[slot0:getValue("id")] = nil
		slot0._groupEntity = nil
	end
end

slot1.position_getter = function (slot0, slot1)
	if slot0.gameConfig.PLATFORM_ANDROID then
		if slot0._positionCalculated then
			return slot0._cachedPosition
		else
			slot0._cachedPosition.x = slot1.x
			slot0._cachedPosition.y = slot1.y
			slot0._cachedPosition.z = slot1.z

			if slot0._groupEntity then
				slot0.PathMath.transformPositionEx(slot0._groupEntity:getValue("transform"), slot0._cachedPosition)
			else
				slot0.PathMath.transformPositionEx(slot0.parentNode, slot0._cachedPosition)
			end

			slot0._positionCalculated = true

			return slot0._cachedPosition
		end
	else
		if slot0._positionCalculated then
			return slot0._cachedPosition
		end

		if slot0._groupEntity then
			slot0:setValue("parentTransform", slot0._groupEntity:getValue("transform"))
		end

		if slot0:getValue("parentTransform") then
			cc_matrix_transform_point(slot2, slot1, slot0._cachedPosition)
		else
			slot0._cachedPosition.x = slot1.x
			slot0._cachedPosition.y = slot1.y
			slot0._cachedPosition.z = slot1.z
		end

		slot0._positionCalculated = true

		return slot0._cachedPosition
	end
end

slot1.direction_getter = function (slot0, slot1)
	if slot0.gameConfig.PLATFORM_ANDROID then
		if slot0._directionCalculated then
			return slot0._cachedDirection
		else
			slot0._cachedDirection.x = slot1.x
			slot0._cachedDirection.y = slot1.y
			slot0._cachedDirection.z = slot1.z

			if slot0._groupEntity then
				slot0.PathMath.transformDirectionEx(slot0._groupEntity:getValue("transform"), slot0._cachedDirection)
			else
				slot0.PathMath.transformDirectionEx(slot0.parentNode, slot0._cachedDirection)
			end

			slot0._directionCalculated = true

			return slot0._cachedDirection
		end
	else
		if slot0._directionCalculated then
			return slot0._cachedDirection
		end

		if slot0._groupEntity then
			slot0:setValue("parentTransform", slot0._groupEntity:getValue("transform"))
		end

		cc_matrix_transform_rotation(slot0:getValue("parentTransform"), slot1, slot0._cachedDirection)

		slot0._directionCalculated = true

		return slot0._cachedDirection
	end
end

slot1.onUpdate = function (slot0, slot1)
	slot0._positionCalculated = false
	slot0._directionCalculated = false

	slot0.c_motion:onUpdate(slot1)
	slot0.c_visual:onUpdate(slot1)
	slot0.c_collisionArea:onUpdate()
end

slot1.on_isDead_changed = function (slot0, slot1)
	if slot0:getValue("isDead") and slot0:getValue("deadCause") ~= "EFFECT_KILL" then
		slot0:leaveGroup()
	end
end

slot1.onDestroy = function (slot0)
	slot0.super.onDestroy(slot0)
	slot0.parentNode:release()

	slot0.parentNode = nil
	slot0._cachedPosition = nil
	slot0._cachedDirection = nil
end

slot1.onReset = function (slot0)
	slot0.super.onReset(slot0)
	slot0.grouped:set(true)
end

return slot1
