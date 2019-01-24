slot0 = class_C("CollisionManager", ClassLoader:aquireClass("Entity"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)

	if C_CollisionManager then
		C_CollisionManager.luaEventHandler = function (slot0, slot1)
			slot0:handleCollisionEvent(slot0, slot1)
		end
	end

	slot0._objectBindings = {}
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("id", "CollisionManager")
	slot0:setValue("category", "collisionManager")
end

slot0.claimCollisionArea = function (slot0, slot1)
	if C_CollisionManager and C_CollisionManager.claimCollisionArea(slot1) then
		slot3 = ClassLoader:aquireInstance("CollisionArea")

		slot0:bindWithLuaObject(slot2, slot3)
		slot3:setValue("isDead", false)
		slot3:setValue("collisionEnabled", true)

		return slot3
	end
end

slot0.reclaimCollisionArea = function (slot0, slot1)
	if C_CollisionManager then
		C_CollisionManager.reclaimCollisionArea(slot0:getCObject(slot1))
		slot0:unbindWithLuaObject(slot1)
	end
end

slot0.registerCollisionArea = function (slot0, slot1)
	if C_CollisionManager then
		C_CollisionManager.registerCollisionArea(slot0:getCObject(slot1))
	end
end

slot0.unregisterCollisionArea = function (slot0, slot1)
	if C_CollisionManager then
		C_CollisionManager.unregisterCollisionArea(slot0:getCObject(slot1))
	end
end

slot0.loadConfig = function (slot0, slot1, slot2, slot3)
	if C_CollisionManager then
		C_CollisionManager.loadConfig(slot1, slot2, slot3)
	end
end

slot0.onUpdate = function (slot0, slot1)
	slot0.super:onUpdate(slot0, slot1)

	if C_CollisionManager then
		C_CollisionManager.update(slot1)

		if slot0._debugMode then
			C_CollisionManager.updateDebug(slot1)
		end
	end
end

slot0.updateCollisionArea = function (slot0, slot1, slot2, slot3)
	if C_CollisionManager then
		C_CollisionManager.updateCollisionArea(slot0:getCObject(slot1), slot2, slot3)
	end
end

slot0.updateCollisionAreaEx = function (slot0, slot1, slot2)
	C_CollisionManager.updateCollisionAreaEx(slot0._objectBindings[slot1], slot2)
end

slot0.setCollisionMask = function (slot0, slot1, slot2)
	if C_CollisionManager then
		C_CollisionManager.setCollisionMask(slot0:getCObject(slot1), slot2)
	end
end

slot0.bindWithLuaObject = function (slot0, slot1, slot2)
	slot0._objectBindings[slot1] = slot2
	slot0._objectBindings[slot2] = slot1
end

slot0.unbindWithLuaObject = function (slot0, slot1)
	slot0._objectBindings[slot1] = nil
	slot0._objectBindings[slot0._objectBindings[slot1]] = nil
end

slot0.getLuaObject = function (slot0, slot1)
	return slot0._objectBindings[slot1]
end

slot0.getCObject = function (slot0, slot1)
	return slot0._objectBindings[slot1]
end

slot0.handleCollisionEvent = function (slot0, slot1, slot2)
	slot3 = slot0:getLuaObject(slot1)
	slot4 = slot0:getLuaObject(slot2)

	slot3:onCollisionEvent(slot4)
	slot4:onCollisionEvent(slot3)
end

slot0.setDebugEnabled = function (slot0, slot1)
	if slot1 and not slot0._alreadyEnabled then
		slot0._alreadyEnabled = true

		C_CollisionManager.initDebug(cc.Director:getInstance():getRunningScene())
	end

	slot0._debugMode = slot1
end

slot0.disableCollisionArea = function (slot0, slot1, slot2)
	if C_CollisionManager then
		C_CollisionManager.disableCollisionArea(slot0:getCObject(slot1), slot2)
	end
end

slot0.onDestroy = function (slot0)
	return
end

return slot0
