slot0 = class_C("HomingController", ClassLoader:aquireClass("Component"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("position", true)
	slot0:addProperty("direction", true)
	slot0:addProperty("rotation", true)
	slot0:addProperty("speed", true)
	slot0:addProperty("isDead", true)
	slot0:addProperty("isRemoved", true)
	slot0:addProperty("lockingTarget", true)

	slot0._lockingFish = nil
	slot0.PathMath = PathMath
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0._mirrorPosition = {
		z = 0,
		x = 0,
		y = 0
	}
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
end

slot0.onLoad = function (slot0)
	slot1 = slot0:getValue("owner")

	slot0:bindSameName("position", slot1, "TWO_WAY")
	slot0:bindSameName("direction", slot1, "TWO_WAY")
	slot0:bindSameName("speed", slot1, "TWO_WAY")
	slot0:bindSameName("rotation", slot1, "TWO_WAY")
	slot0:bindSameName("isDead", slot1, "TWO_WAY")
	slot0:bindSameName("isRemoved", slot1, "TWO_WAY")
	slot0:bindSameName("lockingTarget", slot1, "TWO_WAY")
end

slot0.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
	slot0:unBindAll()
end

slot0.onUpdate = function (slot0, slot1)
	if not slot0._lockingFish then
		return
	end

	if slot0.gameConfig.PLATFORM_ANDROID then
		if not slot2.alive or slot2.isDead._value or slot2.isRemoved._value then
			slot0:setValue("lockingTarget", 4294967295.0)
		else
			slot3 = cc.Director:getInstance():getVisibleSize()
			slot4 = slot2:getValue("bonePosition")

			if slot0.gameConfig.MirrorFlag then
				slot0._mirrorPosition.x = slot0.gameConfig.Width - slot4.x
				slot0._mirrorPosition.y = slot0.gameConfig.Height - slot4.y
				slot0._mirrorPosition.z = slot4.z
			else
				slot0._mirrorPosition.x = slot4.x
				slot0._mirrorPosition.y = slot4.y
				slot0._mirrorPosition.z = slot4.z
			end

			slot0.rotation:set(slot0.PathMath.calculateBulletAngle(slot0.position._value, slot0._mirrorPosition))
		end
	else
		slot3, slot4 = slot0:fishAvailable(slot2)

		if slot3 then
			slot0.rotation:set(math.atan2(slot4.y - slot0.position._value.y, slot4.x - slot0.position._value.x))
		else
			slot0:setValue("lockingTarget", 4294967295.0)
		end
	end
end

slot0.fishAvailable = function (slot0, slot1)
	slot2 = 0
	slot4 = (cc.Director:getInstance():getVisibleSize().width - 1336) / 2

	if slot0.gameConfig.PLATFORM_ANDROID then
		slot2 = 100
	end

	if slot1.isDead._value or slot1.isRemoved._value then
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
		return true, slot5
	end
end

slot0.on_lockingTarget_changed = function (slot0)
	if slot0:getValue("lockingTarget") == 4294967295.0 then
		slot0:setValue("enable", false)

		slot0._lockingFish = nil
	elseif slot0._world:retrieveEntity("fish", slot0:getValue("lockingTarget")) and not slot1.isDead._value and not slot1.isRemoved._value then
		slot0._lockingFish = slot1
	else
		slot0:setValue("lockingTarget", 4294967295.0)
	end
end

slot0.onDestroy = function (slot0)
	slot0._mirrorPosition = nil
	slot0._lockingFish = nil

	slot0.super.onDestroy(slot0)
end

return slot0
