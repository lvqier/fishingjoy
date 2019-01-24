slot0 = class_C("BulletFactory")

slot0.ctor = function (slot0)
	slot0._emptyTarget = 0
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
end

slot0.parseMul = function (slot0, slot1)
	if slot1 < 4 then
		return 1
	elseif slot1 < 7 then
		return 2
	else
		return 3
	end
end

slot0.createByConfig = function (slot0, slot1)
	slot2 = slot1.dwID
	slot3 = slot1.cannonConfig

	if not slot0.gameConfig.BulletVector[slot1.nMultiply] then
		trackToServer(10009526, "cannon multiply: " .. slot1.nMultiply)
		trackToServer(10009527, "bullet prop config length: " .. #slot0.gameConfig.BulletVector)
		slot0:showErrorMsg("网络错误，请重新开始游戏！")
	end

	slot6 = ClassLoader:aquireInstance("MotionDirection", true)

	slot6:setValue("rebound", true)

	slot8 = ClassLoader:aquireInstance("Bullet")

	slot8:addComponent(slot7, "collisionArea")
	slot8:addComponent(slot5, "visual")
	slot8:addComponent(slot6, "motion")
	slot8:addComponent(slot9, "homingController")
	slot8:setValue("category", "bullet")
	slot8:setValue("id", slot2)
	slot8:setValue("isRemoved", false)
	slot8:setValue("speed", slot4.nSpeed)
	slot8:setValue("rotation", slot1.fDirection)
	slot8:setValue("ownerChairId", slot1.wChairID)
	slot8:setValue("cannonSet", slot1.nCannonSet)
	slot8:setValue("cannonType", slot1.nCannonType)
	slot8:trigger("collisionMask", 4294967295.0)
	slot8:trigger("collisionEnabled", true)

	slot10 = nil
	slot8.position._value.x = slot1.fXpos + ((slot1.wChairID < 2 and 80) or 80) * math.cos(slot1.fDirection)
	slot8.position._value.y = slot1.fYPos + ((slot1.wChairID < 2 and 80) or 80) * math.sin(slot1.fDirection)

	slot8.position:trigger(slot8.position._value)

	return slot8
end

slot0.resetByConfig = function (slot0, slot1, slot2)
	slot1.isDead:trigger(false)
	slot1.isRemoved:trigger(false)
	slot1.lockingTarget:trigger(4294967295.0)
	slot1.outOfBound:set(false)
	slot1.id:set(slot2.dwID)
	slot1.speed:set(slot0.gameConfig.BulletVector[slot2.nMultiply].nSpeed)

	if slot2.wChairID < 2 then
		offset = 80
	else
		offset = 80
	end

	slot1.position._value.x = slot2.fXpos + offset * math.cos(slot2.fDirection)
	slot1.position._value.y = slot2.fYPos + offset * math.sin(slot2.fDirection)

	slot1.position:trigger(slot4)
	slot1.rotation:trigger(slot2.fDirection)
	slot1.ownerChairId:set(slot2.wChairID)
	slot1.cannonSet:set(slot2.nCannonSet)
	slot1.cannonType:set(slot2.nCannonType)
	slot1.collisionMask:trigger(4294967295.0)
	slot1:trigger("collisionEnabled", true)
	slot1:getComponentByName("visual"):onReset(slot2.cannonConfig.BulletSet[slot0:parseMul(slot2.nMultiply)])
end

return slot0
