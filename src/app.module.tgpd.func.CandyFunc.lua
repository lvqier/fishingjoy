CandyFunc = CandyFunc or {}

CandyFunc.eraseSequence = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = {}

	for slot9 = 1, slot1, 1 do
		for slot13 = 1, slot2, 1 do
			if not slot5[(slot9 * slot2 + slot13) - slot2] then
				slot5[slot14] = true
				slot17 = {}
				slot21 = {
					idx_i = slot9,
					idx_j = slot13
				}

				table.insert(slot19, {})

				while #slot16 > 0 do
					slot18 = table.remove(slot19)
					slot22 = slot18

					table.insert(slot16, slot17)

					slot19 = slot0[(slot18.idx_i * slot2 + slot18.idx_j) - slot2]

					if slot18.idx_i > 1 and not slot5[((slot18.idx_i - 1) * slot2 + slot18.idx_j) - slot2] and slot19 == slot0[slot20] then
						slot5[slot20] = true
						slot24 = {
							idx_i = slot18.idx_i - 1,
							idx_j = slot18.idx_j
						}

						table.insert(slot22, slot16)
					end

					if slot18.idx_i < slot1 and not slot5[((slot18.idx_i + 1) * slot2 + slot18.idx_j) - slot2] and slot19 == slot0[slot20] then
						slot5[slot20] = true
						slot24 = {
							idx_i = slot18.idx_i + 1,
							idx_j = slot18.idx_j
						}

						table.insert(slot22, slot16)
					end

					if slot18.idx_j > 1 and not slot5[(slot18.idx_i * slot2 + slot18.idx_j) - 1 - slot2] and slot19 == slot0[slot20] then
						slot5[slot20] = true
						slot24 = {
							idx_i = slot18.idx_i,
							idx_j = slot18.idx_j - 1
						}

						table.insert(slot22, slot16)
					end

					if slot18.idx_j < slot2 and not slot5[(slot18.idx_i * slot2 + slot18.idx_j + 1) - slot2] and slot19 == slot0[slot20] then
						slot5[slot20] = true
						slot24 = {
							idx_i = slot18.idx_i,
							idx_j = slot18.idx_j + 1
						}

						table.insert(slot22, slot16)
					end
				end

				if slot3 <= #slot17 then
					for slot21 = 1, #slot17, 1 do
						slot25 = slot17[slot21]

						table.insert(slot23, slot4)
					end

					return slot4
				end
			end
		end
	end

	return nil
end

CandyFunc.checkTargetCandy = function (slot0, slot1, slot2, slot3, slot4)
	for slot8 = 1, slot1, 1 do
		for slot12 = 1, slot2, 1 do
			if slot0[(slot8 - 1) * slot2 + slot12] == slot3 then
				slot16 = {
					idx_i = slot8,
					idx_j = slot12
				}

				table.insert(slot14, slot4)
			end
		end
	end

	return #slot4 > 0
end

CandyFunc.createSpriteNumber = function (slot0, slot1, slot2, slot3)
	slot4 = slot3 or {
		x = 0,
		y = 0.5
	}
	slot7 = cc.Node
	slot5 = cc.Node.create(slot6)
	slot6 = 0
	slot7 = 0
	slot8 = {}

	while true do
		slot15 = slot0 % 10
		slot14 = string.format(slot11, tostring(slot14))
		slot11 = cc.Sprite.create(slot1, cc.Sprite)
		slot6 = slot6 + slot11.getContentSize(cc.Sprite).width
		slot7 = slot11.getContentSize(cc.Sprite).height
		slot17 = slot11

		table.insert(slot11, slot8, 1)

		slot15 = slot0 / 10

		if math.floor(slot11) <= 0 then
			break
		end
	end

	slot9 = -slot6 * slot4.x
	slot10 = -slot7 * (slot4.y - 0.5)

	for slot14 = 1, #slot8, 1 do
		slot20 = slot10

		slot8[slot14].setPosition(slot8[slot14], slot8[slot14], slot9 + slot8[slot14].getContentSize(slot16).width * 0.5)

		slot19 = slot8[slot14]

		slot5.addChild(slot8[slot14], slot5)

		slot9 = slot9 + slot8[slot14].getContentSize(slot16).width
	end

	slot2.width = slot6
	slot2.height = slot7

	return slot5
end

CandyFunc.createSpriteNumberWithDot = function (slot0, slot1, slot2, slot3)
	slot4 = slot3 or {
		x = 0,
		y = 0.5
	}
	slot7 = cc.Node
	slot5 = cc.Node.create(slot6)
	slot6 = {}
	slot7 = 0
	slot8 = 0
	slot9 = 0

	while true do
		slot16 = slot0 % 10
		slot15 = string.format(slot12, tostring(slot15))
		slot12 = cc.Sprite.create(slot1, cc.Sprite)
		slot7 = slot7 + slot12.getContentSize(cc.Sprite).width
		slot8 = slot12.getContentSize(cc.Sprite).height
		slot9 = slot9 + 1
		slot18 = slot12

		table.insert(slot12, slot6, 1)

		slot16 = slot0 / 10

		if math.floor(slot12) <= 0 then
			break
		end

		if slot9 % 3 == 0 then
			slot17 = "d"
			slot17 = string.format(slot15, slot1)
			slot16 = cc.Sprite.create(slot15, cc.Sprite)
			slot7 = slot7 + cc.Sprite.create(slot15, cc.Sprite).getContentSize(slot15).width
			slot18 = cc.Sprite.create(slot15, cc.Sprite)

			table.insert(slot15, slot6, 1)
		end
	end

	slot10 = -slot7 * slot4.x
	slot11 = -slot8 * (slot4.y - 0.5)
	slot12 = 0

	for slot16 = 1, #slot6, 1 do
		slot18 = slot6[slot16].getContentSize(slot19)
		slot12 = slot12 + slot18.width
		slot23 = slot11

		slot6[slot16]:setPosition(slot17, slot10 + slot18.width * 0.5)

		slot22 = slot6[slot16]

		slot5.addChild(slot6[slot16], slot5)

		slot10 = slot10 + slot18.width
	end

	slot2.width = slot7
	slot2.height = slot8

	return slot5, slot12
end

CandyFunc.createSpriteNumberWithShortPoint = function (slot0, slot1, slot2, slot3)
	slot4 = {}

	if slot0 >= 100000000 then
		slot9 = slot4

		CandyFunc.splitNumber(slot0 / 100000000, slot5)

		slot8 = slot0 % 100000000 / 1000000

		if math.floor(slot0 / 100000000) > 0 then
			slot9 = -1

			table.insert(slot7, slot4)

			if slot0 > 9 then
				slot8 = slot4
				slot11 = slot0 / 10

				table.insert(slot7, math.floor(slot10))

				slot0 = slot0 % 10
			else
				slot9 = 0

				table.insert(slot7, slot4)
			end

			if slot0 > 0 then
				slot9 = slot0

				table.insert(slot7, slot4)
			end
		end

		slot9 = 100

		table.insert(slot7, slot4)
	elseif slot0 >= 10000 then
		slot9 = slot4

		CandyFunc.splitNumber(slot0 / 10000, slot5)

		slot8 = slot0 % 10000 / 100

		if math.floor(slot0 / 10000) > 0 then
			slot9 = -1

			table.insert(slot7, slot4)

			if slot0 > 9 then
				slot8 = slot4
				slot11 = slot0 / 10

				table.insert(slot7, math.floor(slot10))

				slot0 = slot0 % 10
			else
				slot9 = 0

				table.insert(slot7, slot4)
			end

			if slot0 > 0 then
				slot9 = slot0

				table.insert(slot7, slot4)
			end
		end

		slot9 = 10

		table.insert(slot7, slot4)
	else
		slot8 = slot4

		CandyFunc.splitNumber(slot6, slot0)
	end

	slot5 = slot3 or {
		x = 0,
		y = 0.5
	}
	slot8 = cc.Node
	slot6 = cc.Node.create(slot7)
	slot7 = {}
	slot8 = 0
	slot9 = 0

	for slot13 = 1, #slot4, 1 do
		slot15 = nil

		if slot4[slot13] == 100 then
			slot19 = "y"
			slot15 = string.format(slot17, slot1)
		elseif slot14 == 10 then
			slot19 = "w"
			slot15 = string.format(slot17, slot1)
		elseif slot14 == -1 then
			slot19 = "f"
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

		slot6.addChild(slot16, slot6)

		slot8 = slot8 + slot16.getContentSize(cc.Sprite).width
		slot9 = slot16.getContentSize(cc.Sprite).height
	end

	slot10 = -slot5.x * slot8
	slot11 = -(slot5.y - 0.5) * slot9

	for slot15 = 1, #slot7, 1 do
		slot22 = slot11

		slot7[slot15]:setPosition(slot7[slot15], slot10 + slot7[slot15].getContentSize(slot18).width * 0.5)

		slot10 = slot10 + slot7[slot15].getContentSize(slot18).width
	end

	slot2.width = slot8
	slot2.height = slot9

	return slot6
end

CandyFunc.createSpriteNumberWithShort = function (slot0, slot1, slot2, slot3)
	slot4 = slot3 or {
		x = 0,
		y = 0.5
	}
	slot7 = cc.Node
	slot5 = cc.Node.create(slot6)
	slot6 = {}

	if slot0 >= 100000000 then
		slot11 = slot6

		CandyFunc.splitNumber(slot0 / 100000000, slot7)

		slot11 = 100

		table.insert(slot0 / 100000000, slot6)

		slot0 = slot0 % 100000000
	end

	if slot0 >= 10000 then
		slot11 = slot6

		CandyFunc.splitNumber(slot0 / 10000, slot7)

		slot11 = 10

		table.insert(slot0 / 10000, slot6)

		slot0 = slot0 % 10000
	end

	if #slot6 < 1 or slot0 > 0 then
		slot10 = slot6

		CandyFunc.splitNumber(slot8, slot0)
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

	slot2.width = slot8
	slot2.height = slot9

	return slot5
end

CandyFunc.createSpriteNumberWithShort2 = function (slot0, slot1, slot2, slot3)
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

		CandyFunc.splitNumber(slot8, slot0)

		slot10 = 100

		table.insert(slot8, slot6)
	elseif slot0 >= 100000 then
		slot9 = slot0 / 10000
		slot10 = slot6

		CandyFunc.splitNumber(slot8, slot0)

		slot10 = 10

		table.insert(slot8, slot6)
	else
		slot10 = slot6

		CandyFunc.splitNumber(slot8, slot0)
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

	slot2.width = slot8
	slot2.height = slot9

	return slot5
end

CandyFunc.splitNumber = function (slot0, slot1)
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

CandyFunc.splitNumber2 = function (slot0)
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

CandyFunc.addRandomMoveX = function (slot0, slot1, slot2, slot3)
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

CandyFunc.format = function (slot0, slot1, slot2)
	slot4 = "diamond array\n"

	for slot8 = 1, slot1 * slot2, 1 do
		slot9 = math.floor(slot10) + 1
		slot14 = slot0[slot8]
		slot4 = slot4 .. string.format((slot8 - 1) % slot2, "%02d") .. ","

		if math.floor((slot8 - 1) / slot2) + 1 == slot2 then
			slot4 = slot4 .. "\n"
		end
	end

	slot7 = slot4

	print(slot6)
end

CandyFunc.createUniformSign = function (slot0, slot1)
	slot2 = {}

	for slot7 = 1, slot0 * slot1, 1 do
		slot11 = slot7

		table.insert(slot9, slot2)
	end

	slot4 = -1
	slot5 = {}

	for slot9 = 1, slot3, 1 do
		slot12 = #slot2
		slot5[slot2[math.random(slot11)]] = slot4
		slot4 = slot4 * -1
		slot15 = math.random(slot11)

		table.remove(slot13, slot2)
	end

	return slot5
end

CandyFunc.sign = function (slot0)
	return (slot0 > 0 and 1) or (slot0 < 0 and -1) or 0
end

CandyFunc.createWrapFunc = function (slot0, slot1, slot2)
	slot0["__" .. slot1] = slot0[slot1]

	slot0[slot1] = function (slot0, ...)
		slot3 = slot0

		slot0(slot2, ...)

		slot3 = slot0

		slot0(slot2, ...)
	end
end

CandyFunc.restoreWrapFunc = function (slot0, slot1)
	if slot0["__" .. slot1] then
		slot2[slot1] = slot3
	end
end

CandyFunc.unpackMap = function (slot0, slot1)
	slot2 = slot1 or {}

	for slot6 = 1, #slot0, 1 do
		slot10 = slot0[slot6]

		for slot11, slot12 in pairs(slot9) do
			slot16 = slot12

			table.insert(slot14, slot2)
		end
	end

	return slot2
end

CandyFunc.checkCandyTypeKey = function (slot0, slot1)
	slot2 = nil

	if slot0 ~= Candy.CandyType.CandyType_16 then
		slot6 = slot0
		slot2 = string.format(slot4, "candy_%d")
	else
		slot6 = slot1
		slot2 = string.format(slot4, "brick_%d")
	end

	return slot2
end

CandyFunc.checkCandyExplodeMap = function (slot0, slot1)
	if slot0 == Candy.CandyType.CandyType_16 then
		slot0 = slot0 + slot1
	end

	return Candy.ColorMap[slot0]
end

CandyFunc.createSpine = function (slot0, slot1, slot2)
	slot3 = nil

	if sp.SkeletonAnimation.isExistSkeletonDataInCache then
		slot7 = slot0

		if not sp.SkeletonAnimation.isExistSkeletonDataInCache(slot5, sp.SkeletonAnimation) then
			slot9 = slot2

			sp.SkeletonAnimation.readSkeletonDataToCacheByJson(slot5, sp.SkeletonAnimation, slot0, slot1)
		end
	end

	if sp.SkeletonAnimation.createFromCache then
		slot7 = slot0
		slot3 = sp.SkeletonAnimation.createFromCache(slot5, sp.SkeletonAnimation)
	else
		slot8 = slot2
		slot3 = sp.SkeletonAnimation.create(slot5, sp.SkeletonAnimation, slot1)
	end

	return slot3
end

return
