slot0 = class_C("Cannon", ClassLoader:aquireClass("GameObject"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("position")
	slot0:addProperty("cannonSet")
	slot0:addProperty("cannonType")
	slot0:addProperty("cannonBase")
	slot0:addProperty("cannonMul")
	slot0:addProperty("controllerName")
	slot0:addProperty("controllerScore")
	slot0:addProperty("controllerState")
	slot0:addProperty("controllerId")
	slot0:addProperty("openFire")
	slot0:addProperty("fireAngle")
	slot0:addProperty("autoFireEnabled")
	slot0:addProperty("fireInterval")
	slot0:addProperty("locking")
	slot0:addProperty("autoLocking")
	slot0:addProperty("lockingTarget")
	slot0:addProperty("controlledByPlayer")
	slot0:addProperty("forceAutoFire")
	slot0:addProperty("forceAllowFire")
	slot0:addProperty("bulletIDKey")
	slot0:addProperty("coinPosition")
	slot0:addProperty("enableChangingBase")
	slot0:addProperty("bulletIDCounter")

	slot0._counter = 0
	slot0._bulletQueue = {}
	slot0._queueSize = 0
	slot0.objectManager = ClassLoader:aquireSingleton("ObjectManager")
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0._mirrorPosition = {
		z = 0,
		x = 0,
		y = 0
	}
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("fireAngle", 0)
	slot0:setValue("lockingTarget", 4294967295.0)
	slot0:setValue("position", {
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("cannonSet", 0)
	slot0:setValue("cannonType", 0)
	slot0:setValue("cannonBase", 10)
	slot0:setValue("controllerName", "")
	slot0:setValue("controllerScore", 0)
	slot0:setValue("controllerState", ENUM.CONTROLLER_STATE.LEFT)
	slot0:setValue("controllerId", 0)
	slot0:setValue("openFire", false)
	slot0:setValue("autoFireEnabled", false)
	slot0:setValue("fireInterval", 0.1)
	slot0:setValue("locking", false)
	slot0:setValue("autoLocking", false)
	slot0:setValue("lockingTarget", 4294967295.0)
	slot0:setValue("controlledByPlayer", true)
	slot0:setValue("forceAutoFire", false)
	slot0:setValue("forceAllowFire", false)
	slot0:setValue("bulletIDKey", 0)
	slot0:setValue("coinPosition", {
		x = 0,
		y = 0
	})
	slot0:setValue("enableChangingBase", true)
	slot0:setValue("bulletIDCounter", 0)
	slot0:setValue("cannonMul", -1)
end

slot0.onUpdate = function (slot0, slot1)
	if slot0.controllerId._value > 0 then
		slot0._counter = slot0._counter + slot1

		if slot0.fireInterval._value < slot0._counter then
			slot0._counter = 0

			if slot0._queueSize > 0 then
				if slot0._world._playerBulletNumberMap[slot0.controllerId._value] < slot0.gameConfig.nMaxBullet then
					if slot0._world:retrieveEntity("bullet", slot0._bulletQueue[slot0._queueSize].id._value) then
						slot0.objectManager:recycleObject(slot4)
					else
						slot0._world:addEntity(slot4)
						slot4.lockingTarget:set(slot0.lockingTarget._value)
						slot4:onUpdate(0)
						slot0.controllerScore:set(slot4.lScore)
						slot0.fireAngle:trigger(slot4.fAngle)
						slot0.openFire:trigger(true)

						slot0._queueSize = slot0._queueSize - 1
						slot0._world._playerBulletNumberMap[slot2] = slot3 + 1
					end
				else
					print("create playerID:" .. tostring(slot2))
					print(slot0.id._value)
					print(slot0._world._playerBulletNumberMap[slot2])
				end
			end
		end
	end

	slot0.c_lockingController:onUpdate(slot1)
	slot0.c_firingController:onUpdate(slot1)
	slot0.c_visual:onUpdate(slot1)
end

slot0.onDestroy = function (slot0)
	slot0.super.onDestroy(slot0)

	slot0._mirrorPosition = nil

	for slot4, slot5 in pairs(slot0._bulletQueue) do
		slot0._bulletQueue[slot4] = nil
	end

	slot0._bulletQueue = nil
end

return slot0
