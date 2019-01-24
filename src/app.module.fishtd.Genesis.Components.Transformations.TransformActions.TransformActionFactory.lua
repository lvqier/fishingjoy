slot0 = ClassLoader:aquireClass("Tools")
slot1 = class_C("TransformActionFactory")

slot1.ctor = function (slot0)
	slot0._factoryFunctionMap = {
		Swing = slot0.buildSwing,
		Spawn = slot0.buildSpawn,
		Sequence = slot0.buildSequence,
		Scale = slot0.buildScale,
		Roll = slot0.buildRoll,
		Position = slot0.buildPosition,
		Direction = slot0.buildDirection
	}
end

slot1.createWithConfig = function (slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0:buildAction(slot5, slot6) then
			return slot7
		end
	end
end

slot1.buildAction = function (slot0, slot1, slot2)
	if slot0._factoryFunctionMap[slot1] then
		return slot0._factoryFunctionMap[slot1](slot0, slot2)
	else
		return nil
	end
end

slot1.buildPosition = function (slot0, slot1)
	slot2 = ClassLoader:aquireInstance("TransformPosition")

	slot2:setValue("start", slot0:stringToVec3(slot1.from))
	slot2:setValue("finish", slot0:stringToVec3(slot1.to))
	slot2:setValue("duration", tonumber(slot1.duration))

	return slot2
end

slot1.buildDirection = function (slot0, slot1)
	slot2 = ClassLoader:aquireInstance("TransformDirection")

	slot2:setValue("start", slot0:stringToVec3(slot1.from))
	slot2:setValue("finish", slot0:stringToVec3(slot1.to))
	slot2:setValue("duration", tonumber(slot1.duration))

	return slot2
end

slot1.buildScale = function (slot0, slot1)
	slot2 = ClassLoader:aquireInstance("TransformScale")

	slot2:setValue("start", tonumber(slot1.from))
	slot2:setValue("finish", tonumber(slot1.to))
	slot2:setValue("duration", tonumber(slot1.duration))

	return slot2
end

slot1.buildRoll = function (slot0, slot1)
	slot2 = ClassLoader:aquireInstance("TransformRoll")

	slot2:setValue("start", tonumber(slot1.from))
	slot2:setValue("finish", tonumber(slot1.to))
	slot2:setValue("duration", tonumber(slot1.duration))

	return slot2
end

slot1.buildSpawn = function (slot0, slot1)
	slot2 = ClassLoader:aquireInstance("TransformSpawn")
	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		if #slot8 > 0 then
			for slot12, slot13 in ipairs(slot8) do
				slot3[#slot3 + 1] = slot0:buildAction(slot7, slot13)
			end
		else
			slot3[#slot3 + 1] = slot0:buildAction(slot7, slot8)
		end
	end

	slot2:setValue("targetAction", slot3)

	return slot2
end

slot1.buildSwing = function (slot0, slot1)
	ClassLoader:aquireInstance("TransformSwing").setValue(slot2, "count", tonumber(slot1.count))

	for slot6, slot7 in pairs(slot1) do
		if slot0:buildAction(slot6, slot7) then
			slot2:setValue("targetAction", slot8)

			break
		end
	end

	return slot2
end

slot1.buildSequence = function (slot0, slot1)
	slot2 = ClassLoader:aquireInstance("TransformSequence")
	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		if #slot8 > 0 then
			for slot12, slot13 in ipairs(slot8) do
				slot3[#slot3 + 1] = slot0:buildAction(slot7, slot13)
			end
		else
			slot3[#slot3 + 1] = slot0:buildAction(slot7, slot8)
		end
	end

	slot2:setValue("targetAction", slot3)

	return slot2
end

slot1.stringToVec3 = function (slot0, slot1)
	slot2 = slot0:splitString(slot1, ",")

	return {
		x = tonumber(slot2[1]),
		y = tonumber(slot2[2]),
		z = tonumber(slot2[3])
	}
end

return slot1
