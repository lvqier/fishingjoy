slot0 = class_C("FiringController", ClassLoader:aquireClass("Component"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("id", true)
	slot0:addProperty("autoFireEnabled", true)
	slot0:addProperty("fireAngle", true)
	slot0:addProperty("fireInterval", true)
	slot0:addProperty("forceAutoFire", true)
	slot0:addProperty("allowFire")
	slot0:addProperty("forceAllowFire", true)
	slot0:addProperty("controlledByPlayer", true)
	slot0:addProperty("bulletIDKey", true)
	slot0:addProperty("cannonBase", true)
	slot0:addProperty("networkAvailable")
	slot0:addProperty("changingBase")
	slot0:addProperty("latentFireFlag")
	slot0:addProperty("controllerScore", true)
	slot0:addProperty("cannonSet", true)
	slot0:addProperty("cannonType", true)
	slot0:addProperty("position", true)
	slot0:addProperty("controllerId", true)
	slot0:addProperty("enableChangingBase", true)
	slot0:addProperty("bulletIDCounter", true)
	slot0:startListen("FIRE")
	slot0:startListen("LATENT_FIRE")
	slot0:startListen("START_AUTO_FIRE")
	slot0:startListen("STOP_AUTO_FIRE")
	slot0:startListen("TOGGLE_AUTO_FIRE")
	slot0:startListen("FISH3D_CMD_S_ALLOW_FIRE")
	slot0:startListen("NETWORK_UNAVAILABLE")
	slot0:startListen("NETWORK_AVAILABLE")
	slot0:startListen("INCREASE_CANNON_BASE")
	slot0:startListen("DECREASE_CANNON_BASE")
	slot0:startListen("FISH3D_CMD_S_CANNON_SET")

	slot0._fireTimer = 0
	slot0._bulletIDCounter = 0
	slot0.bulletMessage = {}
	slot0.hero = Hero
	slot0.gameConfig = ClassLoader:aquireInstance("GameConfig")
	slot0._kickCounter = 15
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("allowFire", false)
	slot0:setValue("networkAvailable", true)
	slot0:setValue("changingBase", false)
	slot0:setValue("latentFireFlag", false)
end

slot0.onLoad = function (slot0)
	slot1 = slot0:getValue("owner")

	slot0:bindSameName("id", slot1, "TWO_WAY")
	slot0:bindSameName("autoFireEnabled", slot1, "TWO_WAY")
	slot0:bindSameName("fireAngle", slot1, "TWO_WAY")
	slot0:bindSameName("fireInterval", slot1, "TWO_WAY")
	slot0:bindSameName("forceAutoFire", slot1, "TWO_WAY")
	slot0:bindSameName("forceAllowFire", slot1, "TWO_WAY")
	slot0:bindSameName("controlledByPlayer", slot1, "TWO_WAY")
	slot0:bindSameName("bulletIDKey", slot1, "TWO_WAY")
	slot0:bindSameName("cannonBase", slot1, "TWO_WAY")
	slot0:bindSameName("controllerScore", slot1, "TWO_WAY")
	slot0:bindSameName("enableChangingBase", slot1, "TWO_WAY")
	slot0:bindSameName("cannonSet", slot1, "TWO_WAY")
	slot0:bindSameName("cannonType", slot1, "TWO_WAY")
	slot0:bindSameName("position", slot1, "TWO_WAY")
	slot0:bindSameName("controllerId", slot1, "TWO_WAY")
	slot0:bindSameName("controllerScore", slot1, "TWO_WAY")
	slot0:bindSameName("bulletIDCounter", slot1, "TWO_WAY")
end

slot0.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
	slot0:unBindAll()
end

slot0.onUpdate = function (slot0, slot1)
	slot0._fireTimer = slot0._fireTimer + slot1

	if slot0.fireInterval._value <= slot0._fireTimer then
		slot0.allowFire:set(slot0.forceAllowFire._value)
	end

	if slot0.autoFireEnabled._value or slot0.latentFireFlag._value then
		slot0:triggerEvent("FIRE")
	end

	slot0.latentFireFlag:set(false)
end

slot0.handle_NETWORK_AVAILABLE = function (slot0, slot1)
	slot0:setValue("networkAvailable", true)
end

slot0.handle_NETWORK_UNAVAILABLE = function (slot0, slot1)
	slot0:setValue("networkAvailable", false)
end

slot0.handle_INCREASE_CANNON_BASE = function (slot0, slot1)
	slot0:setValue("enableChangingBase", false)
	slot0:setValue("changingBase", true)
end

slot0.handle_DECREASE_CANNON_BASE = function (slot0, slot1)
	slot0:setValue("enableChangingBase", false)
	slot0:setValue("changingBase", true)
end

slot0.handle_FISH3D_CMD_S_CANNON_SET = function (slot0, slot1)
	slot0:setValue("changingBase", false)

	if slot0.id._value == slot1.wChairID then
		if slot1.cannonSet == 1 then
			slot0:setValue("enableChangingBase", false)
		else
			slot0:setValue("enableChangingBase", true)
		end
	end
end

slot0.handle_LATENT_FIRE = function (slot0)
	slot0:setValue("latentFireFlag", true)
end

slot0.hasEnoughMoney = function (slot0)
	if slot0:getValue("controllerScore") < slot0:getValue("cannonBase") then
		return false
	else
		return true
	end
end

slot0.handle_FIRE = function (slot0, slot1)
	if slot0.controllerScore._value < slot0.cannonBase._value then
		slot2, slot3 = slot0._world:retrieveEntity("bullet")

		if slot3 == 0 then
			slot0._kickCounter = slot0._kickCounter - 1

			if slot0._kickCounter == 0 then
				slot0._world:triggerFrameworkEvent("PLAYER_OUT_OF_MONEY")
				slot0:setValue("forceAutoFire", false)
				slot0._world:triggerEvent("STOP_AUTO_FIRE")

				return
			else
				return
			end
		else
			return
		end
	else
		slot0._kickCounter = 15
	end

	if slot0.allowFire._value and slot0.networkAvailable._value and not slot0.changingBase._value then
		slot0.allowFire:set(false)

		slot0._fireTimer = 0

		if slot0.hero:getWChairID() == 65535 then
			return
		end

		slot0.bulletMessage.wChairID = slot0.id._value
		slot0.bulletMessage.fDirection = slot0.fireAngle._value * 0.0174533
		slot0.bulletMessage.dwFireTime = slot0._world:getCurrentTime()
		slot0.bulletMessage.cost = slot0.cannonBase._value
		slot0.bulletMessage.bClientSide = true
		slot0.bulletMessage.nMultiply = slot0.gameConfig.CannonMultiple
		slot0.bulletMessage.nCannonSet = slot0.cannonSet._value
		slot0.bulletMessage.nCannonType = slot0.cannonType._value
		slot0.bulletMessage.playerId = slot0.controllerId._value
		slot0.bulletMessage.playerScore = slot0.controllerScore._value
		slot0.bulletMessage.fXpos = (slot0.position._value.x * cc.Director:getInstance():getVisibleSize().width) / 1336 - (cc.Director.getInstance().getVisibleSize().width - 1336) / 2
		slot0.bulletMessage.fYPos = slot0.position._value.y
		slot0._bulletIDCounter = slot0._bulletIDCounter + 1

		if slot0._bulletIDCounter == 20000 then
			slot0._bulletIDCounter = 1
		end

		slot2.dwClientID = slot0._idKey + slot0._bulletIDCounter
		slot2.dwID = slot2.dwClientID

		slot0._world:triggerEvent("FISH3D_CMD_S_SEND_BULLET", slot2)
	end
end

slot0.genBulletId = function (slot0)
	slot0._bulletIDCounter = slot0._bulletIDCounter + 1

	if slot0._bulletIDCounter == 20000 then
		slot0._bulletIDCounter = 1
	end

	return slot0:getValue("bulletIDKey") + slot0._bulletIDCounter
end

slot0.handle_FISH3D_CMD_S_ALLOW_FIRE = function (slot0, slot1)
	slot0:trigger("forceAllowFire", slot1.m_bAllowFire)
end

slot0.handle_TOGGLE_AUTO_FIRE = function (slot0)
	slot0:setValue("forceAutoFire", not slot0:getValue("forceAutoFire"))
end

slot0.handle_START_AUTO_FIRE = function (slot0, slot1)
	slot0:setValue("autoFireEnabled", true)
end

slot0.handle_STOP_AUTO_FIRE = function (slot0, slot1)
	slot0:setValue("autoFireEnabled", slot0:getValue("forceAutoFire"))
end

slot0.on_forceAutoFire_changed = function (slot0)
	slot0:setValue("autoFireEnabled", slot0:getValue("forceAutoFire"))
end

slot0.on_forceAllowFire_changed = function (slot0)
	slot0:setValue("allowFire", slot0:getValue("forceAllowFire"))
end

slot0.on_controlledByPlayer_changed = function (slot0)
	slot0:setValue("enabled", slot0:getValue("controlledByPlayer"))
end

slot0.on_autoFireEnabled_changed = function (slot0)
	slot0._kickCounter = 5
end

slot0.on_bulletIDKey_changed = function (slot0)
	slot0._idKey = slot0.bulletIDKey._value
end

slot0.on_bulletIDCounter_changed = function (slot0)
	slot0._bulletIDCounter = slot0.bulletIDCounter._value
end

slot0.onDestroy = function (slot0)
	slot0.super.onDestroy(slot0)

	slot0.bulletMessage = nil
end

return slot0
