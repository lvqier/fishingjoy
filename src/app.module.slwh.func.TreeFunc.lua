TreeFunc = {
	_randomSeed = 0,
	createSpriteNumber = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot7 = slot3 or {
			x = 0,
			y = 0.5
		}
		slot4 = slot4 or 0

		if not slot5 then
			slot10 = cc.Node
			slot8 = cc.Node.create(slot9)
		end

		slot9 = 0
		slot10 = 0
		slot11 = {}

		while true do
			slot15 = slot1
			slot18 = slot0 % 10
			slot13 = string.format(slot14, tostring(slot17))

			if slot6 then
				slot17 = slot13

				if not TreeCacheManager.getCacheObject(slot15, TreeCacheManager) then
					slot17 = slot13
					slot14 = cc.Sprite.create(slot15, cc.Sprite)
				end
			end

			slot9 = slot9 + slot14.getContentSize(slot16).width
			slot10 = slot14.getContentSize(slot16).height
			slot20 = slot14

			table.insert(slot14, slot11, 1)

			slot18 = slot0 / 10

			if math.floor(slot14) <= 0 then
				break
			end
		end

		if slot4 > 0 then
			for slot16 = 1, slot4 - #slot11, 1 do
				slot20 = "0"
				slot17 = string.format(slot18, slot1)

				if slot6 then
					slot21 = slot17

					if not TreeCacheManager.getCacheObject(slot19, TreeCacheManager) then
						slot21 = slot17
						slot18 = cc.Sprite.create(slot19, cc.Sprite)
					end
				end

				slot9 = slot9 + slot18.getContentSize(slot20).width
				slot24 = slot18

				table.insert(slot18, slot11, 1)
			end
		end

		slot12 = -slot9 * slot7.x
		slot13 = -slot10 * (slot7.y - 0.5)

		for slot17 = 1, #slot11, 1 do
			slot23 = slot13

			slot11[slot17].setPosition(slot11[slot17], slot11[slot17], slot12 + slot11[slot17].getContentSize(slot19).width * 0.5)

			slot22 = slot11[slot17]

			slot8.addChild(slot11[slot17], slot8)

			slot12 = slot12 + slot11[slot17].getContentSize(slot19).width
		end

		if slot2 then
			slot2.width = slot9
			slot2.height = slot10
		end

		return slot8
	end,
	createSpriteNumberWithDot = function (slot0, slot1, slot2, slot3, slot4, slot5)
		slot6 = slot3 or {
			x = 0,
			y = 0.5
		}

		if not slot4 then
			slot9 = cc.Node
			slot7 = cc.Node.create(slot8)
		end

		slot8 = {}
		slot9 = 0
		slot10 = 0
		slot11 = 0

		while true do
			slot15 = slot1
			slot18 = slot0 % 10
			slot13 = string.format(slot14, tostring(slot17))

			if slot5 then
				slot17 = slot13

				if not TreeCacheManager.getCacheObject(slot15, TreeCacheManager) then
					slot17 = slot13
					slot14 = cc.Sprite.create(slot15, cc.Sprite)
				end
			end

			slot9 = slot9 + slot14.getContentSize(slot16).width
			slot10 = slot14.getContentSize(slot16).height
			slot11 = slot11 + 1
			slot20 = slot14

			table.insert(slot14, slot8, 1)

			slot18 = slot0 / 10

			if math.floor(slot14) <= 0 then
				break
			end

			if slot11 % 3 == 0 then
				slot19 = "d"
				slot13 = string.format(slot17, slot1)

				if slot5 then
					slot19 = slot13

					if not TreeCacheManager.getCacheObject(slot17, TreeCacheManager) then
						slot19 = slot13
						slot14 = cc.Sprite.create(slot17, cc.Sprite)
					end
				end

				slot18 = slot14
				slot9 = slot9 + slot14.getContentSize(slot17).width
				slot20 = slot14

				table.insert(slot17, slot8, 1)
			end
		end

		slot12 = -slot9 * slot6.x
		slot13 = -slot10 * (slot6.y - 0.5)
		slot14 = 0

		for slot18 = 1, #slot8, 1 do
			slot20 = slot8[slot18].getContentSize(slot21)
			slot14 = slot14 + slot20.width
			slot25 = slot13

			slot8[slot18]:setPosition(slot19, slot12 + slot20.width * 0.5)

			slot24 = slot8[slot18]

			slot7.addChild(slot8[slot18], slot7)

			slot12 = slot12 + slot20.width
		end

		if slot2 then
			slot2.width = slot9
			slot2.height = slot10
		end

		return slot7, slot14
	end
}

TreeFunc.createSpriteNumberWithShort = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot3 or {
		x = 0,
		y = 0.5
	}

	if not slot4 then
		slot9 = cc.Node
		slot7 = cc.Node.create(slot8)
	end

	slot8 = {}

	if slot0 >= 100000000 then
		slot13 = slot8

		TreeFunc.splitNumber(slot0 / 100000000, slot9)

		slot13 = 100

		table.insert(slot0 / 100000000, slot8)

		slot0 = slot0 % 100000000
	end

	if slot0 >= 10000 then
		slot13 = slot8

		TreeFunc.splitNumber(slot0 / 10000, slot9)

		slot13 = 10

		table.insert(slot0 / 10000, slot8)

		slot0 = slot0 % 10000
	end

	if #slot8 < 1 or slot0 > 0 then
		slot12 = slot8

		TreeFunc.splitNumber(slot10, slot0)
	end

	slot9 = {}
	slot10 = 0
	slot11 = 0

	for slot15 = 1, #slot8, 1 do
		slot17 = nil

		if slot8[slot15] == 100 then
			slot21 = "y"
			slot17 = string.format(slot19, slot1)
		elseif slot16 == 10 then
			slot21 = "w"
			slot17 = string.format(slot19, slot1)
		else
			slot20 = slot1
			slot23 = slot16
			slot17 = string.format(slot19, tostring(slot22))
		end

		if slot5 then
			slot21 = slot17

			if not TreeCacheManager.getCacheObject(slot19, TreeCacheManager) then
				slot21 = slot17
				slot18 = cc.Sprite.create(slot19, cc.Sprite)
			end
		end

		slot23 = slot18

		table.insert(slot18, slot9)

		slot23 = slot18

		slot7.addChild(slot18, slot7)

		slot10 = slot10 + slot18.getContentSize(slot20).width
		slot11 = slot18.getContentSize(slot20).height
	end

	slot12 = -slot6.x * slot10
	slot13 = -(slot6.y - 0.5) * slot11

	for slot17 = 1, #slot9, 1 do
		slot24 = slot13

		slot9[slot17]:setPosition(slot9[slot17], slot12 + slot9[slot17].getContentSize(slot20).width * 0.5)

		slot12 = slot12 + slot9[slot17].getContentSize(slot20).width
	end

	if slot2 then
		slot2.width = slot10
		slot2.height = slot11
	end

	return slot7
end

TreeFunc.createSpriteNumberWithShortW = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot3 or {
		x = 0,
		y = 0.5
	}

	if not slot4 then
		slot9 = cc.Node
		slot7 = cc.Node.create(slot8)
	end

	slot8 = {}

	if slot0 >= 100000000 then
		slot13 = slot8

		TreeFunc.splitNumber(slot0 / 100000000, slot9)

		slot13 = 100

		table.insert(slot0 / 100000000, slot8)

		slot0 = slot0 % 100000000
	end

	if slot0 >= 1000000 then
		slot13 = slot8

		TreeFunc.splitNumber(slot0 / 10000, slot9)

		slot13 = 10

		table.insert(slot0 / 10000, slot8)

		slot0 = 0
	end

	if #slot8 < 1 or slot0 > 0 then
		slot12 = slot8

		TreeFunc.splitNumber(slot10, slot0)
	end

	slot9 = {}
	slot10 = 0
	slot11 = 0
	slot12 = 0
	slot13 = true

	for slot17 = #slot8, 1, -1 do
		slot19 = nil

		if slot8[slot17] == 100 then
			slot23 = "y"
			slot19 = string.format(slot21, slot1)
			slot13 = false
		elseif slot18 == 10 then
			slot23 = "w"
			slot19 = string.format(slot21, slot1)
			slot13 = false
		else
			slot22 = slot1
			slot25 = slot18
			slot19 = string.format(slot21, tostring(slot24))
		end

		if slot5 then
			slot23 = slot19

			if not TreeCacheManager.getCacheObject(slot21, TreeCacheManager) then
				slot23 = slot19
				slot20 = cc.Sprite.create(slot21, cc.Sprite)
			end
		end

		slot26 = slot20

		table.insert(slot20, slot9, 1)

		slot25 = slot20

		slot7.addChild(slot20, slot7)

		slot10 = slot10 + slot20.getContentSize(slot22).width
		slot11 = slot20.getContentSize(slot22).height
		slot12 = slot12 + 1

		if slot13 and slot17 ~= 1 and slot12 % 3 == 0 then
			slot25 = "d"
			slot19 = string.format(slot23, slot1)

			if slot5 then
				slot25 = slot19

				if not TreeCacheManager.getCacheObject(slot23, TreeCacheManager) then
					slot25 = slot19
					slot20 = cc.Sprite.create(slot23, cc.Sprite)
				end
			end

			slot25 = slot20

			slot7.addChild(slot23, slot7)

			slot24 = slot20
			slot10 = slot10 + slot20.getContentSize(slot23).width
			slot26 = slot20

			table.insert(slot23, slot9, 1)
		end
	end

	slot14 = -slot6.x * slot10
	slot15 = -(slot6.y - 0.5) * slot11

	for slot19 = 1, #slot9, 1 do
		slot26 = slot15

		slot9[slot19]:setPosition(slot9[slot19], slot14 + slot9[slot19].getContentSize(slot22).width * 0.5)

		slot14 = slot14 + slot9[slot19].getContentSize(slot22).width
	end

	if slot2 then
		slot2.width = slot10
		slot2.height = slot11
	end

	return slot7
end

TreeFunc.createSpriteNumberWithShort2 = function (slot0, slot1, slot2, slot3)
	slot4 = slot3 or {
		x = 0,
		y = 0.5
	}
	slot7 = cc.Node
	slot5 = cc.Node.create(slot6)
	slot6 = {}

	if slot0 >= 100000000 then
		slot9 = slot0 / 100000000
		slot10 = slot6

		TreeFunc.splitNumber(slot8, slot0)

		slot10 = 100

		table.insert(slot8, slot6)
	elseif slot0 >= 100000 then
		slot9 = slot0 / 10000
		slot10 = slot6

		TreeFunc.splitNumber(slot8, slot0)

		slot10 = 10

		table.insert(slot8, slot6)
	else
		slot10 = slot6

		TreeFunc.splitNumber(slot8, slot0)
	end

	slot7 = {}
	slot8 = 0
	slot9 = 0

	for slot13 = 1, #slot6, 1 do
		slot15 = nil

		if slot6[slot13] == 100 then
			slot19 = "y"
			slot15 = string.format(slot17, slot1)
		elseif slot14 == 10 then
			slot19 = "w"
			slot15 = string.format(slot17, slot1)
		else
			slot18 = slot1
			slot21 = slot14
			slot15 = string.format(slot17, tostring(slot20))
		end

		slot19 = slot15
		slot16 = cc.Sprite.create(slot17, cc.Sprite)
		slot21 = slot16

		table.insert(slot16, slot7)

		slot21 = slot16

		slot5.addChild(slot16, slot5)

		slot8 = slot8 + slot16.getContentSize(cc.Sprite).width
		slot9 = slot16.getContentSize(cc.Sprite).height
	end

	slot10 = -slot4.x * slot8
	slot11 = -(slot4.y - 0.5) * slot9

	for slot15 = 1, #slot7, 1 do
		slot22 = slot11

		slot7[slot15]:setPosition(slot7[slot15], slot10 + slot7[slot15].getContentSize(slot18).width * 0.5)

		slot10 = slot10 + slot7[slot15].getContentSize(slot18).width
	end

	if slot2 then
		slot2.width = slot8
		slot2.height = slot9
	end

	return slot5
end

TreeFunc.splitNumber = function (slot0, slot1)
	slot2 = {}

	while true do
		slot8 = slot0 % 10

		table.insert(slot5, slot2, 1)

		slot6 = slot0 / 10

		if math.floor(slot5) <= 0 then
			break
		end
	end

	for slot6 = 1, #slot2, 1 do
		slot10 = slot2[slot6]

		table.insert(slot8, slot1)
	end
end

TreeFunc.splitNumber2 = function (slot0)
	slot1 = {}

	while true do
		slot6 = slot0 % 10

		table.insert(slot4, slot1)

		slot5 = slot0 / 10

		if math.floor(slot4) <= 0 then
			break
		end
	end

	return slot1
end

TreeFunc.addRandomMoveX = function (slot0, slot1, slot2, slot3)
	slot4 = 0
	slot5 = 1

	for slot9 = 1, slot2 - 1, 1 do
		slot13 = slot3
		slot17 = slot0 * 1 * math.random()
		slot21 = 0

		table.insert(slot12, cc.MoveBy.create(slot15, cc.MoveBy, cc.p(slot19, slot4 + math.random() * slot1 * slot5)))

		slot4 = -slot4 - math.random() * slot1 * slot5
		slot5 = slot5 * 0.5
	end

	slot8 = slot3
	slot12 = slot0 * 1 * math.random()
	slot16 = 0

	table.insert(slot7, cc.MoveBy.create(slot10, cc.MoveBy, cc.p(slot14, slot4)))
end

TreeFunc.sign = function (slot0)
	return (slot0 > 0 and 1) or (slot0 < 0 and -1) or 0
end

TreeFunc.createWrapFunc = function (slot0, slot1, slot2)
	slot0["__" .. slot1] = slot0[slot1]

	slot0[slot1] = function (slot0, ...)
		slot3 = slot0

		slot0(slot2, ...)

		slot3 = slot0

		slot0(slot2, ...)
	end
end

TreeFunc.restoreWrapFunc = function (slot0, slot1)
	if slot0["__" .. slot1] then
		slot2[slot1] = slot3
	end
end

TreeFunc.computeIntegerReminder = function (slot0)
	slot1 = slot0
	slot2 = 0
	slot3 = 1
	slot4 = 1

	while slot0 >= 10 do
		slot7 = slot0 / 10
		slot0 = math.floor(slot6)
		slot3 = slot3 * 10
		slot4 = slot4 + 1
	end

	return slot3, slot1 % slot3, slot4
end

TreeFunc.getLowerBound = function (slot0)
	slot3 = slot0
	slot2 = 0

	for slot6 = #TreeFunc.splitNumber2(slot2), 1, -1 do
		slot11 = 9

		if (slot1[slot6] + math.random(slot9, 1)) % 10 == 0 and slot6 == #slot1 then
			slot11 = 9
			slot7 = math.random(slot9, 1)
		end

		slot2 = slot2 * 10 + slot7
	end

	return slot2
end

TreeFunc.loadChildCascade = function (slot0, slot1)
	slot6 = slot0.getChildren(slot4)

	for slot7, slot8 in pairs(slot2) do
		slot11 = slot8
		slot2[slot8.getName(slot10)] = slot8

		if slot1 then
			slot12 = slot8

			if slot8.getChildrenCount(slot11) > 0 then
				slot12 = slot8

				TreeFunc.loadChildCascade(slot11)
			end
		end
	end
end

TreeFunc.indexOf = function (slot0, slot1)
	slot2 = -1

	for slot6 = 1, #slot0, 1 do
		if slot0[slot6] == slot1 then
			slot2 = slot6

			break
		end
	end

	return slot2
end

TreeFunc.indexOfNot = function (slot0, slot1)
	slot2 = 0

	for slot6 = 1, #slot0, 1 do
		if slot0[slot6] ~= slot1 then
			slot2 = slot6

			break
		end
	end

	return slot2
end

TreeFunc.checkAllIndex = function (slot0, slot1, slot2)
	slot3 = {}
	slot2 = slot2 or #slot0
	slot7 = #slot0

	for slot7 = 1, math.min(slot5, slot2), 1 do
		if slot0[slot7] == slot1 then
			slot11 = slot7

			table.insert(slot9, slot3)
		end
	end

	return slot3
end

TreeFunc.checkAllIndexNot = function (slot0, slot1)
	slot2 = {}

	for slot6 = 1, #slot0, 1 do
		if slot0[slot6] ~= slot1 then
			slot10 = slot6

			table.insert(slot8, slot2)
		end
	end

	return slot2
end

TreeFunc.trunk = function (slot0, slot1)
	slot5 = #slot0
	slot2 = {}

	for slot6 = 1, math.min(slot3, slot1), 1 do
		slot10 = slot0[slot6]

		table.insert(slot8, slot2)
	end

	return slot2
end

TreeFunc.assignIndex = function (slot0, slot1)
	slot2 = math.min
	slot4 = #slot0
	slot5 = slot1 or #slot0

	for slot5 = 1, slot2(slot3, slot4), 1 do
		slot0[slot5]._index = slot5
	end
end

TreeFunc.setRandomSeed = function (slot0)
	TreeFunc._randomSeed = slot0
end

TreeFunc.random = function ()
	TreeFunc._randomSeed = (TreeFunc._randomSeed * 1103515245 + 12345) % 65535

	return (TreeFunc._randomSeed * 1103515245 + 12345) % 65535 / 65535
end

TreeFunc.extractCacheWithNode = function (slot0)
	slot3 = slot0

	if slot0.getChildrenCount(slot2) > 0 then
		slot4 = slot0.getChildren(slot2)

		for slot5, slot6 in pairs(slot0) do
			slot10 = slot6

			TreeCacheManager.recycleCocos2dxObject(slot8, TreeCacheManager)
		end
	end
end

TreeFunc.checkSumary = function (slot0)
	slot1 = 0
	slot2 = pairs
	slot4 = slot0 or {}

	for slot5, slot6 in slot2(slot3) do
		slot1 = slot1 + slot6
	end

	return slot1
end

TreeFunc.shuffle = function (slot0, slot1)
	slot2 = #slot0

	while slot2 > 0 do
		slot5 = TreeFunc.random() * slot2
		slot8 = math.floor(slot4) + 1

		table.remove(slot6, slot0)

		slot8 = slot0[math.floor(slot4) + 1]

		table.insert(slot6, slot0)

		slot2 = slot2 - 1
	end
end

TreeFunc.shuffle2 = function (slot0, slot1, slot2, slot3)
	slot4 = #slot0

	while slot4 > 0 do
		slot7 = TreeFunc.random() * slot4
		slot10 = math.floor(slot6) + 1

		table.remove(slot8, slot0)

		slot10 = slot0[math.floor(slot6) + 1]

		table.insert(slot8, slot0)

		slot4 = slot4 - 1
	end

	slot5 = {
		{
			{},
			{},
			{},
			{}
		},
		{
			{},
			{},
			{},
			{}
		},
		{
			{},
			{},
			{},
			{}
		}
	}
	slot6 = #slot0

	while slot6 > 0 do
		slot10 = (slot6 - slot2) / slot3
		slot13 = slot6 - slot2 - math.floor(slot9) * slot3 + 1

		table.insert(slot11, slot5[slot0[slot6]][((slot6 - slot2 - math.floor(slot9) * slot3 + 1) - 1) % 4 + 1])

		slot6 = slot6 - 1
	end

	slot7 = {
		{
			0,
			0,
			0,
			0
		},
		{
			0,
			0,
			0,
			0
		},
		{
			0,
			0,
			0,
			0
		}
	}
	slot8 = #slot1

	while slot8 > 0 do
		slot13 = slot1[slot8] / 4
		slot7[math.ceil(slot12)][(slot1[slot8] - 1) % 4 + 1] = slot7[math.ceil(slot12)][(slot1[slot8] - 1) % 4 + 1] + 1
		slot8 = slot8 - 1
	end

	slot9 = {}
	slot10 = #slot1

	while slot10 > 0 do
		slot15 = slot1[slot10] / 4

		if #slot5[math.ceil(slot14)][(slot1[slot10] - 1) % 4 + 1] < 1 then
			slot20 = slot12
			slot15, slot16 = TreeFunc.removeEleFrom2Map(slot16, slot7, slot5, slot9)
			slot0[((slot16 + slot2) - 2) % slot3 + 1] = slot13
			slot21 = slot16

			table.insert(slot9, slot14)
		end

		slot10 = slot10 - 1
	end

	return slot5
end

TreeFunc.removeEleFrom2Map = function (slot0, slot1, slot2, slot3)
	slot6 = slot1

	for slot7, slot8 in pairs(slot5) do
		if slot0[slot7][slot3] < #slot8[slot3] then
			for slot13 = 1, #slot9, 1 do
				if not slot2[slot7 * 1000 + slot3 * 100 + slot9[slot13]] then
					slot2[slot14] = true
					slot19 = slot13

					return slot7, table.remove(slot17, slot9)
				end
			end
		end
	end
end

TreeFunc.computeFrustumScale = function (slot0, slot1, slot2, slot3)
	slot6 = slot1.x
	slot9 = math.rad(slot5)
	slot13 = (slot2.x - slot0.x) * () + (slot2.y - slot0.y) * () + (slot2.z - slot0.z) * ()
	slot11 = math.sqrt(slot12)

	return slot11 / (slot3 / ((slot2.x - slot0.x) / slot11 * 0 + (slot2.y - slot0.y) / slot11 * math.sin(slot7) + (slot2.z - slot0.z) / slot11 * -math.cos(slot4)))
end

return
