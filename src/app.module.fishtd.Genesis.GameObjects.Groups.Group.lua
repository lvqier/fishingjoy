slot0 = ClassLoader:aquireClass("Tools")
slot1 = class_C("Group", ClassLoader:aquireClass("GameObject"))

slot1.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("direction")
	slot0:addProperty("roll")
	slot0:addProperty("speed")
	slot0:addProperty("position")
	slot0:addProperty("timeOverflow")
	slot0:addProperty("isDead")
	slot0:addProperty("isRemoved")
	slot0:addProperty("refreshId")
	slot0:addProperty("groupId")
	slot0:addProperty("members")
	slot0:addProperty("transform")
	slot0:addProperty("parentTransform")
	slot0:addProperty("belong")
	slot0:addProperty("transformDirty")
	slot0:addProperty("motion")
	slot0:addProperty("transformation")

	slot0._backupCacheTransform = cc.mat4:createIdentity()
	slot0.motionNode = cc.Node:create()

	slot0.motionNode:retain()

	slot0.transformNode = cc.Node:create()

	slot0.transformNode:retain()

	slot0.cacheNode = cc.Node:create()

	slot0.cacheNode:retain()

	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0.PathMath = PathMath
end

slot1.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("direction", {
		w = 1,
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("position", {
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("roll", 0)
	slot0:setValue("isDead", false)
	slot0:setValue("isRemoved", false)
	slot0:setValue("members", {})
	slot0:setValue("motion", nil)
	slot0:setValue("transformation", nil)
	slot0:setValue("parentTransform", cc.mat4.createIdentity())
	slot0:setValue("timeOverflow", 0)
	slot0:setValue("belong", true)
	slot0:setValue("transformDirty", false)
	slot0:setValue("speed", 0)
	slot0:assignGetterSetter("transform", slot1:thisCall(slot0.transform_getter, slot0), nil)

	slot0._transformationTransform = {}
	slot0._motionTransform = {}
end

slot1.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)
	slot0:joinGroup(slot0:getValue("groupId"), slot0:getValue("belong"))

	if slot0:getValue("motion") then
		slot2:onEnter(slot1)
	end

	if slot0:getValue("transformation") then
		slot3:onEnter(slot1)
	end
end

slot1.onExit = function (slot0)
	slot0.super.onExit(slot0)

	for slot5, slot6 in pairs(slot1) do
		slot6:setValue("groupId", nil)
		slot6:setValue("isRemoved", not slot6.isDead._value)

		slot1[slot5] = nil
	end

	slot0:leaveGroup()

	if slot0:getValue("motion") then
		slot2:onExit()
	end

	if slot0:getValue("transformation") then
		slot3:onExit()
	end
end

slot1.on_groupId_changed = function (slot0)
	if slot0._world then
		slot0:joinGroup(slot0:getValue("groupId"), slot0:getValue("belong"))
	end
end

slot1.onUpdate = function (slot0, slot1)
	if slot0.motion._value then
		slot2:onUpdate(slot1)

		if slot2:getValue("isRemoved") then
			slot0:setValue("isRemoved", true)
		end
	end

	if slot0.transformation._value then
		slot3:onUpdate(slot1)
	end

	slot0.transformDirty:set(true)
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

slot1.transform_getter = function (slot0, slot1)
	if not slot0.gameConfig.PLATFORM_ANDROID then
		if slot0.transformDirty._value then
			slot2, slot3 = nil
			slot4 = false
			slot5 = false
			slot0._cachedTransform = slot0._backupCacheTransform

			if slot0:getValue("motion") then
				slot0._motionTransform = PathMath.generateTransform(slot6:getValue("position"), slot6:getValue("direction"), 0, 1)
				slot4 = true
			end

			if slot0:getValue("transformation") then
				slot8 = slot7:getValue("transformTarget")
				slot0._transformationTransform = PathMath.generateTransform(slot8.position, slot8.direction, slot8.roll, slot8.scale)
				slot5 = true
			end

			if slot4 then
				if slot5 then
					cc_matrix_multiply(slot0._transformationTransform, slot0._motionTransform, slot0._cachedTransform)
				else
					slot0._cachedTransform = slot0._motionTransform
				end
			elseif slot5 then
				slot0._cachedTransform = slot0._transformationTransform
			end

			if slot0._groupEntity then
				slot0:setValue("parentTransform", slot0._groupEntity:getValue("transform"))
			end

			if slot0:getValue("parentTransform") then
				cc_matrix_multiply_copy(slot0._cachedTransform, slot8, slot0._cachedTransform)
			end

			slot0:setValue("transformDirty", false)
		end

		return slot0._cachedTransform
	else
		if slot0.transformDirty._value then
			if slot0.motion._value then
				slot0.PathMath.setNodeTransform(slot0.motionNode, slot2.position._value, slot2.direction._value, 0, 1)
			end

			if slot0.transformation._value then
				slot4 = slot3:getValue("transformTarget")

				slot0.PathMath.setNodeTransform(slot0.transformNode, slot4.position, slot4.direction, slot4.roll, slot4.scale)
			end

			slot4 = nil

			if slot0._groupEntity then
				slot4 = slot0._groupEntity:getValue("transform")
			end

			slot0.PathMath.combineTransform(slot0.cacheNode, slot4, slot0.transformNode, slot0.motionNode)
			slot0.transformDirty:set(false)
		end

		return slot0.cacheNode
	end
end

slot1.on_timeOverflow_changed = function (slot0, slot1)
	if slot0:getValue("motion") then
		slot2:setValue("timeOverflow", slot0:getValue("timeOverflow"))
	end

	if slot0:getValue("transformation") then
		slot3:setValue("timeOverflow", slot0:getValue("timeOverflow"))
	end
end

slot1.onDestroy = function (slot0)
	slot0.super.onDestroy(slot0)
	slot0.motionNode:release()
	slot0.transformNode:release()
	slot0.cacheNode:release()
end

return slot1
