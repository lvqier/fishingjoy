slot0 = class_C("TroopSetConfig")

slot0.ctor = function (slot0)
	slot0.TroopSet = slot0:loadTroopSet(custom.XMLParser:create().parseXML(slot1, "gameres/module/fishtd/config/TroopSet.xml", "").TroopSet)
	slot0.GroupDefinitions = slot0:loadGroupDefinition(custom.XMLParser.create().parseXML(slot1, "gameres/module/fishtd/config/TroopSet.xml", "").GroupDefinition.Group)
end

slot0.loadTroopSet = function (slot0, slot1)
	slot3 = {}

	for slot7 = 1, #slot0:getOrCreateArray(slot1), 1 do
		slot0.TroopSet[tonumber(slot2[slot7].id)] = slot0:loadStartGroup(slot2[slot7].StartGroup.Group)
	end

	return slot3
end

slot0.loadStartGroup = function (slot0, slot1)
	slot3 = {}

	for slot7 = 1, #slot0:getOrCreateArray(slot1), 1 do
		slot3[slot7] = slot0:loadGroupElement(slot2[slot7])
	end

	return slot3
end

slot0.loadGroupDefinition = function (slot0, slot1)
	slot3 = {}

	for slot7 = 1, #slot0:getOrCreateArray(slot1), 1 do
		slot3[tonumber(slot2[slot7].id)] = slot0:loadGroup(slot2[slot7])
	end

	return slot3
end

slot0.loadGroup = function (slot0, slot1)
	slot2 = {
		Transform = slot0:loadTransform(slot1.Transform),
		Generators = {}
	}

	for slot7 = 1, #slot0:getOrCreateArray(slot1.Generator), 1 do
		slot8 = slot3[slot7]
		slot2.Generators[slot7] = slot0:loadGenerator(slot3[slot7])
	end

	return slot2
end

slot0.loadTransform = function (slot0, slot1)
	return ClassLoader:aquireSingleton("TransformActionFactory"):createWithConfig(slot1)
end

slot0.loadGenerator = function (slot0, slot1)
	slot2 = {
		delay = tonumber(slot1.delay),
		spawnCount = tonumber(slot1.spawnCount),
		spawnInterval = tonumber(slot1.spawnInterval),
		spawnCircle = tonumber(slot1.spawnCircle),
		SpawnClusters = {}
	}
	slot3 = slot0:loadGenerateParam(slot1)

	for slot8 = 1, #slot0:getOrCreateArray(slot1.Circle), 1 do
		table.insert(slot2.SpawnClusters, slot0:loadCircle(slot4[slot8], slot3))
	end

	for slot9 = 1, #slot0:getOrCreateArray(slot1.Line), 1 do
		table.insert(slot2.SpawnClusters, slot0:loadLine(slot5[slot9], slot3))
	end

	for slot10 = 1, #slot0:getOrCreateArray(slot1.Point), 1 do
		table.insert(slot2.SpawnClusters, slot0:loadPoint(slot6[slot10], slot3))
	end

	return slot2
end

slot0.loadCircle = function (slot0, slot1, slot2)
	slot0:setGenerateParam(slot3, derivingParam)
	slot0:setGenerateParam(slot3, slot4)

	slot5 = (tonumber(slot1.interval) * math.pi) / 180
	slot6 = tonumber(slot1.count)
	slot7 = tonumber(slot1.startRadius)
	slot8 = (tonumber(slot1.startAngle) * math.pi) / 180
	slot9 = slot0:stringToVec3(slot1.axis) or {
		z = 0,
		x = 1,
		y = 0
	}
	slot10 = slot0:stringToVec3(slot1.center) or {
		z = 0,
		x = 0,
		y = 0
	}
	slot11 = {}

	for slot16 = 1, #slot0:getOrCreateArray(slot1.Group), 1 do
		slot23, slot23 = slot0:calculateCircle(slot7, slot8, axis, slot10, slot5, tonumber(slot12[slot16].index))

		slot0:setGenerateParamPosition(slot3, slot18)
		slot0:setGenerateParamDirection(slot3, slot19)

		slot11[tonumber(slot12[slot16].index)] = slot0:loadGroupElement(slot12[slot16], slot3)
	end

	for slot17 = 1, #slot0:getOrCreateArray(slot1.Fish), 1 do
		slot24, slot24 = slot0:calculateCircle(slot7, slot8, axis, slot10, slot5, tonumber(slot13[slot17].index))

		slot0:setGenerateParamPosition(slot3, slot19)
		slot0:setGenerateParamDirection(slot3, slot20)

		slot11[tonumber(slot13[slot17].index)] = slot0:loadFishElement(slot13[slot17], slot3)
	end

	return slot11
end

slot0.loadLine = function (slot0, slot1, slot2)
	slot0:setGenerateParam(slot3, slot2)
	slot0:setGenerateParam(slot3, slot4)

	slot5 = tonumber(slot1.interval)
	slot6 = tonumber(slot1.count)
	slot7 = slot0:stringToVec3(slot1.axis) or {
		z = 0,
		x = 1,
		y = 0
	}
	slot8 = slot0:stringToVec3(slot1.start) or {
		z = 0,
		x = 0,
		y = 0
	}
	slot9 = {}

	for slot14 = 1, #slot0:getOrCreateArray(slot1.Group), 1 do
		slot0:setGenerateParamPosition(slot3, slot16)
		slot0:setGenerateParamDirection(slot3, slot7)

		slot9[tonumber(slot10[slot14].index)] = slot0:loadGroupElement(slot10[slot14], slot3)
	end

	for slot15 = 1, #slot0:getOrCreateArray(slot1.Fish), 1 do
		slot0:setGenerateParamPosition(slot3, slot17)
		slot0:setGenerateParamDirection(slot3, slot7)

		slot9[tonumber(slot11[slot15].index)] = slot0:loadFishElement(slot11[slot15], slot3)
	end

	return slot9
end

slot0.loadPoint = function (slot0, slot1, slot2)
	slot0:setGenerateParam(slot3, derivingParam)
	slot0:setGenerateParam(slot3, slot4)

	slot5 = {}

	for slot10 = 1, #slot0:getOrCreateArray(slot1.Group), 1 do
		slot5[tonumber(slot6[slot10].index)] = slot0:loadGroupElement(slot6[slot10], slot3)
	end

	for slot11 = 1, #slot0:getOrCreateArray(slot1.Fish), 1 do
		slot5[tonumber(slot7[slot11].index)] = slot0:loadFishElement(slot7[slot11], slot3)
	end

	return slot5
end

slot0.loadGroupElement = function (slot0, slot1)
	slot0:loadElement(slot1).category = "Group"

	return slot0.loadElement(slot1)
end

slot0.loadFishElement = function (slot0, slot1)
	slot0:loadElement(slot1).category = "Fish"

	return slot0.loadElement(slot1)
end

slot0.loadElement = function (slot0, slot1, slot2)
	slot3 = slot0:getNewGenerateParam()

	slot0:setGenerateParam(slot3, derivingParam)
	slot0:setGenerateParam(slot3, slot4)

	slot3.SpecialPattern = {}

	for slot9 = 1, #slot0:getOrCreateArray(slot1.SpecialPattern), 1 do
		slot3.SpecialPattern[slot0:loadSpecialPattern(slot5[slot9], slot3).replaceIndex] = slot0.loadSpecialPattern(slot5[slot9], slot3)
	end

	return slot3
end

slot0.loadSpecialPattern = function (slot0, slot1, slot2)
	slot3 = slot0:getNewGenerateParam()

	slot0:setGenerateParam(slot3, derivingParam)
	slot0:setGenerateParam(slot3, slot0:loadGenerateParam(slot1))

	slot3.replaceIndex = tostring(slot1.replaceIndex)

	return slot3
end

slot0.getNewGenerateParam = function (slot0, slot1)
	return {
		belong = {
			_m = false,
			_v = true
		},
		pathId = {
			_m = false,
			_v = 0
		},
		type = {
			_m = false,
			_v = 0
		},
		duration = {
			_m = false,
			_v = 0
		},
		speed = {
			_m = false,
			_v = 0
		},
		position = {
			_m = false,
			_v = {
				z = 0,
				x = 0,
				y = 0
			}
		},
		direction = {
			_m = false,
			_v = {
				z = 0,
				x = 1,
				y = 0
			}
		},
		motion = {
			_m = false,
			_v = "direction"
		}
	}
end

slot0.loadGenerateParam = function (slot0, slot1)
	slot2 = slot0:getNewGenerateParam()

	if slot1.belong then
		slot2.belong._v = slot0:str2Boolean(slot1.belong)
		slot2.belong._m = true
	end

	if slot1.pathId then
		slot2.pathId._v = tonumber(slot1.pathId)
		slot2.pathId._m = true
	end

	if slot1.selector then
		slot2.type._v = tonumber(slot1.selector)
		slot2.type._m = true
	end

	if slot1.duration then
		slot2.duration._v = tonumber(slot1.duration)
		slot2.duration._m = true
	end

	if slot1.speed then
		slot2.speed._v = tonumber(slot1.speed)
		slot2.speed._m = true
	end

	if slot1.motion then
		slot2.motion._v = slot1.motion
		slot2.motion._m = true
	end

	if slot1.position then
		slot2.position._v = slot0:str2Vec3(slot1.position)
		slot2.position._m = true
	end

	if slot1.direction then
		slot2.direction._v = slot0:str2Vec3(slot1.direction)
		slot2.direction._m = true
	end

	return slot2
end

slot0.setGenerateParam = function (slot0, slot1, slot2)
	if slot2.belong._m then
		slot1.belong._v = slot2.belong
		slot1.belong._m = true
	end

	if slot2.pathId._m then
		slot1.pathId._v = slot2.pathId
		slot1.pathId._m = true
	end

	if slot2.type._m then
		slot1.type._v = slot2.type
		slot1.type._m = true
	end

	if slot2.duration._m then
		slot1.duration._v = slot2.duration
		slot1.duration._m = true
	end

	if slot2.speed._m then
		slot1.speed._v = slot2.speed
		slot1.speed._m = true
	end

	if slot2.motion._m then
		slot1.motion._v = slot2.motion
		slot1.motion._m = true
	end

	if slot2.position._m then
		slot1.position._v = slot2.position
		slot1.position._m = true
	end

	if slot2.direction._m then
		slot1.direction._v = slot2.direction
		slot1.direction._m = true
	end
end

slot0.setGenerateParamPosition = function (slot0, slot1, slot2)
	slot1.position._v = slot2
	slot1.position._m = true
end

slot0.setGenerateParamDirection = function (slot0, slot1, slot2)
	slot1.direction._v = slot2
	slot1.direction._m = true
end

slot0.calculateLinePosition = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:normalize(slot1)

	return {
		x = slot4.x + slot5.x * slot2 * slot3,
		y = slot4.y + slot5.y * slot2 * slot3,
		z = slot4.z + slot5.z * slot2 * slot3
	}
end

slot0.calculateCircle = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = slot0:normalize(slot3)
	slot9 = {
		z = 1,
		x = 0,
		y = 0
	}

	if sqrtf(slot7.x * slot7.x + slot7.y * slot7.y) ~= 0 then
		slot9 = {
			y = 0,
			x = -slot7.z / slot8,
			z = slot7.x / slot8
		}
	end

	slot12 = math.sin(slot11)
	slot13 = math.cos(slot11)

	return {
		x = slot4.x + slot1 * (slot9.x * slot13 + slot0:normalize({
			x = slot7.y * slot9.z - slot7.z * slot9.y,
			y = slot7.z * slot9.x - slot7.x * slot9.z,
			z = slot7.x * slot9.y - slot7.y * slot9.x
		}).x * slot12),
		y = slot4.y + slot1 * (slot9.y * slot13 + slot0.normalize().y * slot12),
		z = slot4.z + slot1 * (slot9.z * slot13 + slot0.normalize().z * slot12)
	}, {
		x = ()["x"] - slot4.x,
		y = ()["y"] - slot4.y,
		z = ()["z"] - slot4.z
	}
end

slot0.normalize = function (slot0, slot1)
	slot2 = math.sqrt(slot1.x * slot1.x + slot1.y + slot1.y + slot1.z * slot1.z)

	return {
		x = slot1.x / slot2,
		y = slot1.y / slot2,
		z = slot1.z / slot2
	}
end

slot0.getOrCreateArray = function (slot0, slot1)
	if #slot1 > 0 then
		return slot1
	else
		return {
			slot1
		}
	end
end

slot0.str2Boolean = function (slot0, slot1)
	if slot1 == "true" then
		return true
	else
		return false
	end
end

slot0.str2Vec3 = function (slot0, slot1)
	if slot1 then
		slot2 = Tools:splitString(slot1, ",")

		return {
			x = tonumber(slot2[1]),
			y = tonumber(slot2[2]),
			z = tonumber(slot2[3])
		}
	end
end

return slot0
