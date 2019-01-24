SerialFunc = {
	judgeTreasureErase = function (slot0, slot1, slot2, slot3, slot4)
		slot5 = {}

		for slot9 = 1, slot1, 1 do
			for slot13 = 1, slot2, 1 do
				if not slot5[(slot9 * slot2 + slot13) - slot2] then
					slot5[slot14] = true
					slot17 = {}

					table.insert({}, {
						idx_i = slot9,
						idx_j = slot13
					})

					while #slot16 > 0 do
						slot18 = table.remove(slot16)

						table.insert(slot17, slot18)

						slot19 = slot0[(slot18.idx_i * slot2 + slot18.idx_j) - slot2]

						if slot18.idx_i > 1 and not slot5[((slot18.idx_i - 1) * slot2 + slot18.idx_j) - slot2] and slot19 == slot0[slot20] then
							slot5[slot20] = true

							table.insert(slot16, {
								idx_i = slot18.idx_i - 1,
								idx_j = slot18.idx_j
							})
						end

						if slot18.idx_i < slot1 and not slot5[((slot18.idx_i + 1) * slot2 + slot18.idx_j) - slot2] and slot19 == slot0[slot20] then
							slot5[slot20] = true

							table.insert(slot16, {
								idx_i = slot18.idx_i + 1,
								idx_j = slot18.idx_j
							})
						end

						if slot18.idx_j > 1 and not slot5[(slot18.idx_i * slot2 + slot18.idx_j) - 1 - slot2] and slot19 == slot0[slot20] then
							slot5[slot20] = true

							table.insert(slot16, {
								idx_i = slot18.idx_i,
								idx_j = slot18.idx_j - 1
							})
						end

						if slot18.idx_j < slot2 and not slot5[(slot18.idx_i * slot2 + slot18.idx_j + 1) - slot2] and slot19 == slot0[slot20] then
							slot5[slot20] = true

							table.insert(slot16, {
								idx_i = slot18.idx_i,
								idx_j = slot18.idx_j + 1
							})
						end
					end

					if slot3 <= #slot17 then
						table.insert(slot4, slot17)
					end
				end
			end
		end

		return #slot4 > 0
	end,
	checkDiamondNumber = function (slot0, slot1, slot2, slot3, slot4)
		slot6 = 0

		for slot10 = 1, slot2 * slot3, 1 do
			if slot0[slot10] == slot1 then
				table.insert(slot4, {
					idx_i = math.floor((slot10 - 1) / slot3) + 1,
					idx_j = (slot10 - 1) % slot3 + 1
				})

				slot6 = slot6 + 1
			end
		end

		return slot6 > 0
	end,
	createSpriteNumber = function (slot0, slot1, slot2, slot3)
		slot4 = slot3 or {
			x = 0,
			y = 0.5
		}
		slot5 = cc.Node:create()
		slot6 = 0
		slot7 = 0
		slot8 = {}

		while true do
			slot11 = cc.Sprite:create(slot10)
			slot6 = slot6 + slot11:getContentSize().width
			slot7 = slot11.getContentSize().height

			table.insert(slot8, 1, slot11)

			if math.floor(slot0 / 10) <= 0 then
				break
			end
		end

		slot9 = -slot6 * slot4.x
		slot10 = -slot7 * (slot4.y - 0.5)

		for slot14 = 1, #slot8, 1 do
			slot8[slot14]:setPosition(slot9 + slot8[slot14]:getContentSize().width * 0.5, slot10)
			slot5:addChild(slot8[slot14])

			slot9 = slot9 + slot8[slot14].getContentSize().width
		end

		slot2.width = slot6
		slot2.height = slot7

		return slot5
	end,
	createSpriteNumberWithDot = function (slot0, slot1, slot2, slot3)
		slot4 = slot3 or {
			x = 0,
			y = 0.5
		}
		slot5 = cc.Node:create()
		slot6 = {}
		slot7 = 0
		slot8 = 0
		slot9 = 0

		while true do
			slot12 = cc.Sprite:create(slot11)
			slot7 = slot7 + slot12:getContentSize().width
			slot8 = slot12.getContentSize().height
			slot9 = slot9 + 1

			table.insert(slot6, 1, slot12)

			if math.floor(slot0 / 10) <= 0 then
				break
			end

			if slot9 % 3 == 0 then
				slot7 = slot7 + cc.Sprite:create(slot11).getContentSize(slot12).width

				table.insert(slot6, 1, cc.Sprite.create(slot11))
			end
		end

		slot10 = -slot7 * slot4.x
		slot11 = -slot8 * (slot4.y - 0.5)
		slot12 = 0

		for slot16 = 1, #slot6, 1 do
			slot18 = slot6[slot16].getContentSize(slot17)
			slot12 = slot12 + slot18.width

			slot6[slot16].setPosition(slot17, slot10 + slot18.width * 0.5, slot11)
			slot5:addChild(slot6[slot16])

			slot10 = slot10 + slot18.width
		end

		slot2.width = slot7
		slot2.height = slot8

		return slot5, slot12
	end
}

SerialFunc.createSpriteNumberWithShort = function (slot0, slot1, slot2, slot3)
	slot4 = slot3 or {
		x = 0,
		y = 0.5
	}
	slot5 = cc.Node:create()
	slot6 = {}

	if slot0 >= 100000000 then
		SerialFunc.splitNumber(slot7, slot6)
		table.insert(slot6, 100)

		slot0 = slot0 % 100000000
	end

	if slot0 >= 10000 then
		SerialFunc.splitNumber(slot7, slot6)
		table.insert(slot6, 10)

		slot0 = slot0 % 10000
	end

	if #slot6 < 1 or slot0 > 0 then
		SerialFunc.splitNumber(slot0, slot6)
	end

	slot7 = {}
	slot8 = 0
	slot9 = 0

	for slot13 = 1, #slot6, 1 do
		slot15 = nil
		slot16 = cc.Sprite:create((slot6[slot13] ~= 100 or string.format(slot1, "y")) and (slot14 ~= 10 or string.format(slot1, "w")) and string.format(slot1, tostring(slot14)))

		table.insert(slot7, slot16)
		slot5:addChild(slot16)

		slot8 = slot8 + slot16:getContentSize().width
		slot9 = slot16.getContentSize().height
	end

	slot10 = -slot4.x * slot8
	slot11 = -(slot4.y - 0.5) * slot9

	for slot15 = 1, #slot7, 1 do
		slot7[slot15]:setPosition(slot10 + slot7[slot15].getContentSize(slot16).width * 0.5, slot11)

		slot10 = slot10 + slot7[slot15].getContentSize(slot16).width
	end

	slot2.width = slot8
	slot2.height = slot9

	return slot5
end

SerialFunc.createSpriteNumberWithShort2 = function (slot0, slot1, slot2, slot3)
	slot4 = slot3 or {
		x = 0,
		y = 0.5
	}
	slot5 = cc.Node:create()
	slot6 = {}

	if slot0 >= 100000000 then
		SerialFunc.splitNumber(slot0, slot6)
		table.insert(slot6, 100)
	elseif slot0 >= 100000 then
		SerialFunc.splitNumber(slot0, slot6)
		table.insert(slot6, 10)
	else
		SerialFunc.splitNumber(slot0, slot6)
	end

	slot7 = {}
	slot8 = 0
	slot9 = 0

	for slot13 = 1, #slot6, 1 do
		slot15 = nil
		slot16 = cc.Sprite:create((slot6[slot13] ~= 100 or string.format(slot1, "y")) and (slot14 ~= 10 or string.format(slot1, "w")) and string.format(slot1, tostring(slot14)))

		table.insert(slot7, slot16)
		slot5:addChild(slot16)

		slot8 = slot8 + slot16:getContentSize().width
		slot9 = slot16.getContentSize().height
	end

	slot10 = -slot4.x * slot8
	slot11 = -(slot4.y - 0.5) * slot9

	for slot15 = 1, #slot7, 1 do
		slot7[slot15]:setPosition(slot10 + slot7[slot15].getContentSize(slot16).width * 0.5, slot11)

		slot10 = slot10 + slot7[slot15].getContentSize(slot16).width
	end

	slot2.width = slot8
	slot2.height = slot9

	return slot5
end

SerialFunc.splitNumber = function (slot0, slot1)
	slot2 = {}

	while true do
		table.insert(slot2, 1, slot0 % 10)

		if math.floor(slot0 / 10) <= 0 then
			break
		end
	end

	for slot6 = 1, #slot2, 1 do
		table.insert(slot1, slot2[slot6])
	end
end

SerialFunc.splitNumber2 = function (slot0)
	slot1 = {}

	while true do
		table.insert(slot1, slot0 % 10)

		if math.floor(slot0 / 10) <= 0 then
			break
		end
	end

	return slot1
end

SerialFunc.addRandomMoveX = function (slot0, slot1, slot2, slot3)
	slot4 = 0
	slot5 = 1

	for slot9 = 1, slot2 - 1, 1 do
		table.insert(slot3, cc.MoveBy:create(slot0 * 1 * math.random(), cc.p(slot4 + math.random() * slot1 * slot5, 0)))

		slot4 = -slot4 - math.random() * slot1 * slot5
		slot5 = slot5 * 0.5
	end

	table.insert(slot3, cc.MoveBy:create(slot0 * 1 * math.random(), cc.p(slot4, 0)))
end

SerialFunc.format = function (slot0, slot1, slot2)
	slot4 = "diamond array\n"

	for slot8 = 1, slot1 * slot2, 1 do
		slot9 = math.floor((slot8 - 1) / slot2) + 1
		slot4 = slot4 .. string.format("%02d", slot0[slot8]) .. ","

		if math.floor((slot8 - 1) % slot2) + 1 == slot2 then
			slot4 = slot4 .. "\n"
		end
	end

	print(slot4)
end

SerialFunc.createUniformSign = function (slot0, slot1)
	slot2 = {}

	for slot7 = 1, slot0 * slot1, 1 do
		table.insert(slot2, slot7)
	end

	slot4 = -1
	slot5 = {}

	for slot9 = 1, slot3, 1 do
		slot5[slot2[math.random(#slot2)]] = slot4
		slot4 = slot4 * -1

		table.remove(slot2, math.random(#slot2))
	end

	return slot5
end

SerialFunc.sign = function (slot0)
	return (slot0 > 0 and 1) or (slot0 < 0 and -1) or 0
end

SerialFunc.createWrapFunc = function (slot0, slot1, slot2)
	slot0["__" .. slot1] = slot0[slot1]

	slot0[slot1] = function (slot0, ...)
		slot0(slot0, ...)
		slot0(slot0, ...)
	end
end

SerialFunc.restoreWrapFunc = function (slot0, slot1)
	if slot0["__" .. slot1] then
		slot2[slot1] = slot3
	end
end

SerialFunc.computeIntegerReminder = function (slot0)
	slot1 = slot0
	slot2 = 0
	slot3 = 1
	slot4 = 1

	while slot0 >= 10 do
		slot0 = math.floor(slot0 / 10)
		slot3 = slot3 * 10
		slot4 = slot4 + 1
	end

	return slot3, slot1 % slot3, slot4
end

SerialFunc.getLowerBound = function (slot0)
	slot2 = 0

	for slot6 = #SerialFunc.splitNumber2(slot0), 1, -1 do
		if (slot1[slot6] + math.random(1, 9)) % 10 == 0 and slot6 == #slot1 then
			slot7 = math.random(1, 9)
		end

		slot2 = slot2 * 10 + slot7
	end

	return slot2
end

return
