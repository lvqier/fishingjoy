slot0 = class_C("MotionDirection", ClassLoader:aquireClass("MotionController"))

slot0.onCreate = function (slot0, slot1, slot2)
	slot0.super.onCreate(slot0, slot2)
	slot0:addProperty("outOfBound", slot2)
	slot0:addProperty("lockingTarget", slot2)

	slot0._rebound = true
	slot0.PathMath = PathMath
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("outOfBound", false)
	slot0:setValue("lockingTarget", 4294967295.0)
end

slot0.onLoad = function (slot0)
	slot0.super.onLoad(slot0)
	slot0:bindSameName("lockingTarget", slot1, "TWO_WAY")
	slot0:bindSameName("outOfBound", slot0:getValue("owner"), "TWO_WAY")
end

slot0.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
	slot0:unBindAll()
end

slot0.onUpdate = function (slot0, slot1)
	slot3 = (cc.Director:getInstance():getVisibleSize().width - 1336) / 2

	if slot0.isDead._value or slot0.isRemoved._value then
		slot0._updateDelta = 0

		return false
	else
		slot0._updateDelta = slot1
	end

	if slot0.gameConfig.PLATFORM_ANDROID then
		slot4 = slot0._timeElapsed
		slot5 = slot0.position._value

		if slot0._rebound and (slot5.x < -slot3 or slot5.x > slot2.width - slot3 or slot5.y < 0 or slot0.gameConfig.Height < slot5.y) then
			slot0.outOfBound:set(true)
			slot0.isRemoved:set(true)

			return
		end

		slot0.PathMath.calculateDirectionNoTbl(-slot3, 0, slot2.width - slot3, slot0.gameConfig.Height, slot0.rotation._value, slot0.speed._value * slot0._updateDelta, slot5, slot0._rebound)
		slot0.position:trigger(slot0.position._value)
		slot0.rotation:trigger(slot0.position._value.r)

		slot0._timeElapsed = slot0._timeElapsed + slot0._updateDelta
	else
		slot8, slot8 = slot0.PathMath.calculateDirection(-slot3, 0, slot2.width - slot3, slot0.gameConfig.Height, slot0.rotation._value, slot0.speed._value * slot0._updateDelta, slot0.position._value, true)

		slot0.position:set(slot4)
		slot0.rotation:set(slot5)

		slot0._timeElapsed = slot0._timeElapsed + slot0._updateDelta
	end
end

slot0.on_lockingTarget_changed = function (slot0)
	if slot0.lockingTarget._value == 4294967295.0 then
		slot0._rebound = true
	else
		slot0._rebound = false
	end
end

return slot0
