slot0 = class_C("GroupFactory")

slot0.ctor = function (slot0)
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
end

slot0.createGroup = function (slot0, slot1)
	slot2, slot3 = nil

	if slot1.nPathID > 0 then
		if slot0.gameConfig.TroopPaths[slot1.nPathID] then
			ClassLoader:aquireInstance("MotionPath", slot4, {
				x = slot1.fOffestX,
				y = slot1.fOffestY,
				z = slot1.fOffestZ
			}, false).position._value.x = slot1.fOffestX
			ClassLoader.aquireInstance("MotionPath", slot4, , false).position._value.y = slot1.fOffestY
			ClassLoader.aquireInstance("MotionPath", slot4, , false).position._value.z = slot1.fOffestZ

			ClassLoader.aquireInstance("MotionPath", slot4, , false).trigger(slot2, "position", slot5)

			ClassLoader.aquireInstance("MotionPath", slot4, , false).direction._value.x = slot1.fDirX
			ClassLoader.aquireInstance("MotionPath", slot4, , false).direction._value.y = slot1.fDirY
			ClassLoader.aquireInstance("MotionPath", slot4, , false).direction._value.z = slot1.fDirZ

			ClassLoader.aquireInstance("MotionPath", slot4, , false).trigger(slot2, "direction", slot6)
			ClassLoader.aquireInstance("MotionPath", slot4, , false):trigger("speed", slot1.Speed)
		end
	else
		ClassLoader:aquireInstance("MotionDirection3D", false)._duration = slot1.lifetime / 1000
		ClassLoader.aquireInstance("MotionDirection3D", false).position._value.x = slot1.fOffestX
		ClassLoader.aquireInstance("MotionDirection3D", false).position._value.y = slot1.fOffestY
		ClassLoader.aquireInstance("MotionDirection3D", false).position._value.z = slot1.fOffestZ

		ClassLoader.aquireInstance("MotionDirection3D", false).trigger(slot2, "position", slot4)

		ClassLoader.aquireInstance("MotionDirection3D", false).direction._value.x = slot1.fDirX
		ClassLoader.aquireInstance("MotionDirection3D", false).direction._value.y = slot1.fDirY
		ClassLoader.aquireInstance("MotionDirection3D", false).direction._value.z = slot1.fDirZ

		ClassLoader.aquireInstance("MotionDirection3D", false).trigger(slot2, "direction", slot5)
		ClassLoader.aquireInstance("MotionDirection3D", false):trigger("speed", slot1.Speed)
	end

	if slot0.gameConfig.GroupConfigs[slot1.nTypeID] then
		ClassLoader:aquireInstance("SimpleTransformation"):setValue("transformAction", slot4)
	end

	slot5 = ClassLoader:aquireInstance("Group")

	slot5:setValue("category", "group")
	slot5:setValue("groupId", slot1.nParentID)
	slot5:setValue("id", slot1.dwGroupID)
	slot5:setValue("refreshId", slot1.nRefershID)
	slot5:setValue("motion", slot2)
	slot5:setValue("transformation", slot3)
	slot5:setValue("belong", slot1.bBelong)

	slot5.position._value.x = slot1.fOffestX
	slot5.position._value.y = slot1.fOffestY
	slot5.position._value.z = slot1.fOffestZ

	slot5:trigger("position", slot6)

	slot5.direction._value.x = slot1.fDirX
	slot5.direction._value.y = slot1.fDirY
	slot5.direction._value.z = slot1.fDirZ

	slot5:trigger("direction", slot7)
	slot5:trigger("speed", slot1.Speed)

	return slot5
end

slot0.resetByConfig = function (slot0)
	return
end

return slot0
