slot0 = class_C("CannonFactory")

slot0.ctor = function (slot0)
	return
end

slot0.createCannonByChairId = function (slot0, slot1)
	slot2 = ClassLoader:aquireSingleton("GameConfig")
	slot7 = ClassLoader:aquireInstance("Cannon")

	slot7:addComponent(slot4, "visual")
	slot7:addComponent(slot5, "firingController")
	slot7:addComponent(slot6, "lockingController")
	slot7:setValue("id", slot1)
	slot7:setValue("position", slot3)
	slot7:setValue("category", "cannon")
	slot7:setValue("controllerState", ENUM.CONTROLLER_STATE.LEFT)
	slot7:setValue("locking", false)
	slot7:setValue("lockingTarget", 4294967295.0)
	slot7:setValue("controlledByPlayer", false)

	if slot1 < 2 then
		slot7:setValue("fireAngle", 90)
	else
		slot7:setValue("fireAngle", 270)
	end

	return slot7
end

return slot0
