slot0 = class_C("FishFactory")

slot0.ctor = function (slot0)
	return
end

slot0.createByConfig = function (slot0, slot1)
	slot3 = false
	slot4, slot5, slot6, slot7, slot8, slot9 = nil

	if not ClassLoader:aquireSingleton("GameConfig").FishMap[slot1.nTypeID] then
		print("@@@Error: Fish Config Not Found !!!!! " .. tostring(slot1.nTypeID))

		slot3 = true
	end

	if slot1.nPathID > 0 then
		slot10 = nil

		if (not slot1.bTroop or slot2.TroopPaths[slot1.nPathID]) and slot2.NormalPaths[slot1.nPathID + 1] then
			slot8 = ClassLoader:aquireInstance("MotionPath", slot10, {
				x = slot1.fOffestX,
				y = slot1.fOffestY,
				z = slot1.fOffestZ
			}, true)
		else
			print("@@@Error: Fish Path Not Found !!!!!" .. tostring(slot1.nTypeID))

			slot3 = true
		end
	else
		ClassLoader:aquireInstance("MotionDirection3D", true)._duration = slot1.lifetime / 1000
	end

	if slot4 then
		slot5 = slot2.FishVisuals[slot4.nVisualID]
	end

	if not slot3 and slot5 then
		slot7 = ClassLoader:aquireInstance("FishVisual", slot5, true)
	else
		print("@@@Error: Fish Visual Not Found !!!!!  " .. tostring(slot1.nTypeID))

		slot3 = true
	end

	if not slot3 and slot5 and slot5.collisionModel then
		if slot2.FishModels[slot5.modelRefs[slot5.collisionModel].id] then
			slot9 = ClassLoader:aquireSingleton("CollisionManager"):claimCollisionArea(slot11.resName)
		end

		if not slot9 then
			print("@@@Error: Fish Collision Not Found !!!!!" .. tostring(slot1.nTypeID))
			print("@@@Error: Fish Collision Not Found !!!!!" .. tostring(collisionName))

			slot3 = true
		end
	else
		print("@@@Error: No Collision Selected !!!!!  " .. tostring(slot1.nTypeID))

		slot3 = true
	end

	if slot3 then
		if slot8 then
			slot8:onDestroy()
		end

		if slot7 then
			slot7:onDestroy()
		end

		if slot9 then
			slot9:onDestroy()
		end

		return
	end

	slot10 = nil
	slot10 = (not slot1.bTroop or ClassLoader:aquireInstance("FishGrouped")) and ClassLoader:aquireInstance("Fish")

	if not slot7 then
		print("---create fish visual failed--,type:", slot5.nTypeID, "----fishvisual id:", slot4.nVisualID)
	end

	slot10:addComponent(slot9, "collisionArea")
	slot10:addComponent(slot7, "visual")
	slot10:addComponent(slot8, "motion")
	slot10:setValue("category", "fish")
	slot10:setValue("id", slot1.dwFishID)
	slot10:setValue("speed", slot1.FishSpeed)
	slot10:setValue("typeId", slot1.nTypeID)
	slot10:setValue("visualId", slot4.nVisualID)
	slot10:setValue("refreshId", slot1.nRefershID)
	slot10:setValue("collisionMask", slot1.dwFishID)
	slot10:setValue("lockLevel", slot1.lockLevel)
	slot10:setValue("groupId", slot1.nParentID)
	slot10:setValue("belong", slot1.bBelong)
	slot10:trigger("collisionEnabled", true)

	slot10.position._value.x = slot1.fOffestX
	slot10.position._value.y = slot1.fOffestY
	slot10.position._value.z = slot1.fOffestZ

	slot10:trigger("position", slot11)

	slot10.direction._value.x = slot1.fDirX
	slot10.direction._value.y = slot1.fDirY
	slot10.direction._value.z = slot1.fDirZ

	slot10:trigger("direction", slot10.direction._value)

	return slot10
end

slot0.resetByConfig = function (slot0, slot1, slot2)
	fishConfig = ClassLoader:aquireSingleton("GameConfig").FishMap[slot2.nTypeID]

	if not fishConfig then
		assert(false)
	end

	slot1:reset()
	slot1:removeComponentByName("motion")

	if slot2.nPathID > 0 then
		slot4 = nil

		if (not slot2.bTroop or slot3.TroopPaths[slot2.nPathID]) and slot3.NormalPaths[slot2.nPathID + 1] then
			motion = ClassLoader:aquireInstance("MotionPath", slot4, {
				x = slot2.fOffestX,
				y = slot2.fOffestY,
				z = slot2.fOffestZ
			}, true)
		else
			assert(false)
		end
	else
		motion = ClassLoader:aquireInstance("MotionDirection3D", true)
		motion._duration = slot2.lifetime / 1000
	end

	slot1:addComponent(motion, "motion")
	slot1:setValue("category", "fish")
	slot1:setValue("id", slot2.dwFishID)
	slot1:setValue("typeId", slot2.nTypeID)
	slot1:setValue("visualId", fishConfig.nVisualID)
	slot1:setValue("refreshId", slot2.nRefershID)
	slot1:setValue("collisionMask", slot2.dwFishID)
	slot1:setValue("lockLevel", slot2.lockLevel)
	slot1:setValue("groupId", slot2.nParentID)
	slot1:setValue("belong", slot2.bBelong)
	slot1:trigger("collisionEnabled", true)

	slot1.position._value.x = slot2.fOffestX
	slot1.position._value.y = slot2.fOffestY
	slot1.position._value.z = slot2.fOffestZ

	slot1:trigger("position", slot4)

	slot1.direction._value.x = slot2.fDirX
	slot1.direction._value.y = slot2.fDirY
	slot1.direction._value.z = slot2.fDirZ

	slot1:trigger("direction", slot5)
	slot1:setValue("speed", slot2.FishSpeed)
end

return slot0
