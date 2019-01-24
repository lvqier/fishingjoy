slot0 = class_C("LockingController", ClassLoader:aquireClass("Component"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("id", true)
	slot0:addProperty("lockingTarget", true)
	slot0:addProperty("autoLocking", true)
	slot0:addProperty("position", true)
	slot0:addProperty("controlledByPlayer", true)
	slot0:addProperty("locking", true)
	slot0:addProperty("fireAngle", true)
	slot0:addProperty("controllerId", true)
	slot0:startListen("FISH3D_CMD_S_LOCK_ONE_FISH")
	slot0:startListen("MANNUAL_SELECT_FISH")
	slot0:startListen("TOGGLE_LOCK_FISH")
	slot0:startListen("CANCEL_LOCKING")
	slot0:startListen("FISH3D_CMD_S_SWITCH_SCENE")
	slot0:startListen("FISH3D_CMD_S_SEND_DES")
	slot0:startListen("SCENE_SWITCH_FINISH")

	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0.PathMath = PathMath
	slot0._mirrorPosition = {
		z = 0,
		x = 0,
		y = 0
	}
	slot0._tempMsg = {}
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
end

slot0.onLoad = function (slot0)
	slot1 = slot0:getValue("owner")

	slot0:bindSameName("id", slot1, "TWO_WAY")
	slot0:bindSameName("isRemoved", slot1, "TWO_WAY")
	slot0:bindSameName("lockingTarget", slot1, "TWO_WAY")
	slot0:bindSameName("autoLocking", slot1, "TWO_WAY")
	slot0:bindSameName("position", slot1, "TWO_WAY")
	slot0:bindSameName("controlledByPlayer", slot1, "TWO_WAY")
	slot0:bindSameName("locking", slot1, "TWO_WAY")
	slot0:bindSameName("fireAngle", slot1, "TWO_WAY")
	slot0:bindSameName("controllerId", slot1, "TWO_WAY")
end

slot0.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
	slot0:unBindAll()
end

slot0.onUpdate = function (slot0, slot1)
	slot4, slot5 = slot0:fishAvailable(slot0._world:retrieveEntity("fish", slot2))

	if slot4 then
		slot0.locking._value = true

		if slot0.gameConfig.PLATFORM_ANDROID then
			slot0.fireAngle._value = slot0.PathMath.calculateBulletAngle({
				x = (slot0.position._value.x * cc.Director:getInstance():getVisibleSize().width) / 1336 - (cc.Director.getInstance().getVisibleSize().width - 1336) / 2,
				y = slot0.position._value.y,
				z = 0
			}, slot5) * 57.29578
		else
			slot0.fireAngle._value = math.atan2(slot5.y - slot0.position._value.y, slot5.x - ((slot0.position._value.x * cc.Director:getInstance():getVisibleSize().width) / 1336 - (cc.Director.getInstance().getVisibleSize().width - 1336) / 2)) * 57.29578
		end
	else
		slot0.locking._value = false

		if slot0:getValue("autoLocking") and slot0:getValue("controlledByPlayer") and not slot0.sceneSwitching then
			slot0:selectNewFish()
		else
			slot0:setValue("lockingTarget", 4294967295.0)
		end
	end
end

slot0.handle_FISH3D_CMD_S_SWITCH_SCENE = function (slot0, slot1)
	if slot1.bSwitching and slot1.nst ~= slot0.gameConfig.currentSceneIndex then
		slot0:setValue("lockingTarget", 4294967295.0)

		slot0.sceneSwitching = true
	end
end

slot0.handle_SCENE_SWITCH_FINISH = function (slot0, slot1)
	slot0.sceneSwitching = false
end

slot0.handle_FISH3D_CMD_S_SEND_DES = function (slot0, slot1)
	slot0:setValue("lockingTarget", 4294967295.0)
end

slot0.handle_TOGGLE_LOCK_FISH = function (slot0, slot1)
	if slot0:getValue("controlledByPlayer") then
		if slot0:getValue("autoLocking") then
			slot0:setValue("autoLocking", false)
			slot0:setValue("locking", false)
			slot0:selectNewFish(4294967295.0)
		else
			slot0:setValue("autoLocking", true)

			if slot0:getValue("lockingTarget") == 4294967295.0 then
				slot0:selectNewFish()
			end
		end
	end
end

slot0.handle_FISH3D_CMD_S_LOCK_ONE_FISH = function (slot0, slot1)
	if slot1.wChairID == slot0.id._value then
		slot0:setValue("lockingTarget", slot1.dwFishID)
	end
end

slot0.handle_MANNUAL_SELECT_FISH = function (slot0, slot1)
	if slot1.wChairID == slot0.id._value and slot0:fishAvailable(slot0._world:retrieveEntity("fish", slot1.dwFishID)) then
		slot0:selectNewFish(slot1.dwFishID)
	end
end

slot0.handle_CANCEL_LOCKING = function (slot0, slot1)
	if slot0.id._value == Hero:getWChairID() then
		slot0:selectNewFish(4294967295.0)
	end
end

slot0.selectNewFish = function (slot0, slot1)
	if slot0:getValue("lockingTarget") ~= ((slot1 and slot1) or slot0:findLockingTarget()) then
		slot0:setValue("lockingTarget", slot2)

		slot0._tempMsg.wChairID = slot0.id._value
		slot0._tempMsg.dwFishID = slot2

		reqFishGameLockOneFish(slot0._tempMsg)
	end
end

slot0.findLockingTarget = function (slot0)
	slot2 = -1
	slot3 = -1

	for slot7, slot8 in pairs(slot1) do
		if slot0:fishAvailable(slot8) and slot2 < slot8:getValue("lockLevel") then
			slot2 = slot8:getValue("lockLevel")
			slot3 = slot7
		end
	end

	if slot3 > -1 then
		return slot3
	else
		return 4294967295.0
	end
end

slot0.on_lockingTarget_changed = function (slot0)
	if slot0.id._value == Hero:getWChairID() and slot0._world then
		slot0._world:triggerEvent("LOCKING_TARGET_CHANGED", slot0:getValue("lockingTarget"))
	end

	if slot0.gameConfig.REDIRECT_BULLET then
		slot1 = slot0:getValue("controllerId")
		slot3 = slot0:getValue("lockingTarget")

		for slot7, slot8 in pairs(slot2) do
			if slot1 == slot8:getValue("ownerUserId") then
				slot8:setValue("lockingTarget", slot3)
			end
		end
	end
end

slot0.fishAvailable = function (slot0, slot1)
	slot2 = 0
	slot4 = (cc.Director:getInstance():getVisibleSize().width - 1336) / 2

	if slot0.gameConfig.PLATFORM_ANDROID then
		slot2 = 100
	end

	if not slot1 then
		return false
	end

	if slot1.isDead._value then
		return false
	end

	slot5 = slot1:getValue("bonePosition")

	if slot0.gameConfig.MirrorFlag then
		slot0._mirrorPosition.x = slot0.gameConfig.Width - slot5.x
		slot0._mirrorPosition.y = slot0.gameConfig.Height - slot5.y
		slot5 = slot0._mirrorPosition
	end

	if slot5.x < -slot2 - slot4 or slot5.x > (slot3.width + slot2) - slot4 or slot5.y < -slot2 or slot5.y > slot0.gameConfig.Height + slot2 then
		return false
	else
		slot6 = slot0.position._value

		if slot0.id._value < 2 then
			if slot5.y < slot6.y then
				return false
			else
				return true, slot5
			end
		elseif slot6.y < slot5.y then
			return false
		else
			return true, slot5
		end
	end
end

slot0.clampAngle = function (slot0, slot1)
	if slot0.id._value < 2 then
		if slot1 < 0 and slot1 < -math.pi / 2 then
			return math.pi
		elseif slot1 < 0 and slot1 >= -math.pi / 2 then
			return 0
		end

		return slot1
	else
		if slot1 > 0 and slot1 > math.pi / 2 then
			return math.pi
		elseif slot1 > 0 and slot1 <= math.pi / 2 then
			return math.pi * 2
		end

		return slot1
	end
end

slot0.onDestroy = function (slot0)
	slot0.super.onDestroy(slot0)

	slot0._mirrorPosition = nil
	slot0._tempMsg = nil
end

return slot0
