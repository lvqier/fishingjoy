function slot3(slot0)
	slot4 = slot0.rect

	return cc.ClippingRectangleNode.create(slot2, cc.ClippingRectangleNode)
end

slot0 = class(slot1, "SlwhRollingText")

slot0.ctor = function (slot0, slot1)
	slot0._step = 1
	slot0._lastNumber = 0
	slot0._inRolling = false
	slot0._numberSequence = {}
	slot0._lastBitSequence = {}
	slot0._commaSprites = {}
	slot0._texturePath = slot1.texturePath
	slot0._commaTexturePath = slot1.commaTexturePath
	slot0._rollTime = slot1.interval
	slot0._slotNumber = slot1.slotNumber
	slot0._alignType = slot1.alignType
	slot0._rectWidth = slot1.rect.width
	slot0._rectHeight = slot1.rect.height
	slot0._cacheNumber = 7
	slot0._beforeCallFunc = nil
	slot0._afterCallFunc = nil
	slot0._timeScale = 1
end

slot0.setTimeScale = function (slot0, slot1)
	slot0._timeScale = slot1
end

slot0.getTimeScale = function (slot0)
	return slot0._timeScale
end

slot0.init = function (slot0)
	slot0._slotSprites = {}
	slot3 = cc.Node
	slot0._rootNode = cc.Node.create(slot2)
	slot4 = true

	slot0._rootNode.setCascadeOpacityEnabled(slot2, slot0._rootNode)

	slot5 = 0

	slot0._rootNode.setPosition(slot2, slot0._rootNode, 0)

	slot4 = slot0._rootNode

	slot0.addChild(slot2, slot0)

	for slot4 = 1, slot0._slotNumber, 1 do
		slot10 = slot0._texturePath
		slot10 = slot0._texturePath
		slot0._slotSprites[slot4] = {
			cc.Sprite.create(slot8, cc.Sprite),
			cc.Sprite.create(slot8, cc.Sprite)
		}
		slot9 = 0

		slot0._slotSprites[slot4][1].setAnchorPoint(, slot0._slotSprites[slot4][1], 0.5)

		slot9 = 0

		slot0._slotSprites[slot4][2].setAnchorPoint(, slot0._slotSprites[slot4][2], 0.5)

		slot8 = slot0._slotSprites[slot4][1]

		slot0._rootNode.addChild(, slot0._rootNode)

		slot8 = slot0._slotSprites[slot4][2]

		slot0._rootNode.addChild(, slot0._rootNode)

		if slot4 % 3 == 0 then
			slot8 = slot0._commaTexturePath
			slot5 = cc.Sprite.create(slot6, cc.Sprite)
			slot10 = 0

			slot5.setAnchorPoint(cc.Sprite, slot5, 0.5)

			slot9 = slot5

			slot0._rootNode.addChild(cc.Sprite, slot0._rootNode)

			slot9 = slot5

			table.insert(cc.Sprite, slot0._commaSprites)
		end
	end

	slot1 = slot0._slotSprites[1][1].getContentSize(slot2)
	slot0._everyWidth = slot1.width
	slot0._everyHeight = slot1.height / 10
	slot4 = slot0._commaSprites[1]
	slot0._everyCommaWidth = slot0._commaSprites[1].getContentSize(slot0._slotSprites[1][1]).width
	slot0._width = slot1.width * slot0._slotNumber + #slot0._commaSprites * slot0._everyCommaWidth
	slot0._height = slot1.height
	slot3 = slot0._slotNumber * slot0._everyWidth + #slot0._commaSprites * slot0._everyCommaWidth
	slot4 = 1

	for slot8 = 1, slot0._slotNumber, 1 do
		slot13 = -slot0._height

		slot0._slotSprites[slot8][1].setPosition(slot10, slot0._slotSprites[slot8][1], slot3 - slot0._everyWidth * 0.5)

		slot13 = -slot0._height

		slot0._slotSprites[slot8][2].setPosition(slot10, slot0._slotSprites[slot8][2], slot3 - slot0._everyWidth * 0.5)

		slot12 = false

		slot0._slotSprites[slot8][1].setVisible(slot10, slot0._slotSprites[slot8][1])

		slot12 = false

		slot0._slotSprites[slot8][2].setVisible(slot10, slot0._slotSprites[slot8][2])

		slot3 = slot3 - slot0._everyWidth

		if slot8 % 3 == 0 then
			slot13 = 0

			slot0._commaSprites[slot4].setPosition(slot10, slot0._commaSprites[slot4], slot3 - slot0._everyCommaWidth * 0.5)

			slot12 = false

			slot0._commaSprites[slot4].setVisible(slot10, slot0._commaSprites[slot4])

			slot3 = slot3 - slot0._everyCommaWidth
			slot4 = slot4 + 1
		end
	end

	slot8 = -slot0._height + slot0._everyHeight

	slot0._slotSprites[1][1].setPositionY(slot6, slot0._slotSprites[1][1])

	slot8 = true

	slot0._slotSprites[1][1].setVisible(slot6, slot0._slotSprites[1][1])

	slot0._lastBitSequence = {
		[1.0] = 0
	}

	if slot0._alignType == Tree.AlignType.AlignType_Left then
		slot8 = -slot0._width + slot0._everyWidth

		slot0._rootNode.setPositionX(slot6, slot0._rootNode)
	elseif slot0._alignType == Tree.AlignType.AlignType_Right then
		slot8 = 0

		slot0._rootNode.setPositionX(slot6, slot0._rootNode)
	elseif slot0._alignType == Tree.AlignType.AlignType_Center then
		slot8 = -(slot0._width - slot0._everyWidth) * 0.5

		slot0._rootNode.setPositionX(slot6, slot0._rootNode)
	end
end

slot0.setBeforeAfterCallFunc = function (slot0, slot1, slot2)
	slot0._beforeCallFunc = slot1
	slot0._afterCallFunc = slot2
end

slot0.changeNormal = function (slot0)
	slot0._inRolling = false
	slot0._lastNumber = 0
	slot0._numberSequence = {}
	slot0._delaySequence = {}
	slot0._lastBitSequence = {
		[1.0] = 0
	}

	for slot4 = 1, slot0._slotNumber, 1 do
		slot8 = -slot0._height

		slot0._slotSprites[slot4][1].setPositionY(slot6, slot0._slotSprites[slot4][1])

		slot8 = -slot0._height

		slot0._slotSprites[slot4][2].setPositionY(slot6, slot0._slotSprites[slot4][2])

		slot7 = slot0._slotSprites[slot4][1]

		slot0._slotSprites[slot4][1].stopAllActions(slot6)

		slot7 = slot0._slotSprites[slot4][2]

		slot0._slotSprites[slot4][2].stopAllActions(slot6)

		slot8 = false

		slot0._slotSprites[slot4][1].setVisible(slot6, slot0._slotSprites[slot4][1])

		slot8 = false

		slot0._slotSprites[slot4][2].setVisible(slot6, slot0._slotSprites[slot4][2])
	end

	slot3 = slot0._rootNode

	slot0._rootNode.stopAllActions(slot2)

	slot4 = -slot0._height + slot0._everyHeight

	slot0._slotSprites[1][1].setPositionY(slot2, slot0._slotSprites[1][1])

	slot4 = true

	slot0._slotSprites[1][1].setVisible(slot2, slot0._slotSprites[1][1])

	if slot0._alignType == Tree.AlignType.AlignType_Left then
		slot5 = 0

		slot0._rootNode.setPosition(slot2, slot0._rootNode, -slot0._width + slot0._everyWidth)
	elseif slot0._alignType == Tree.AlignType.AlignType_Center then
		slot5 = 0

		slot0._rootNode.setPosition(slot2, slot0._rootNode, -(slot0._width - slot0._everyWidth) * 0.5)
	end

	for slot4 = 1, #slot0._commaSprites, 1 do
		slot8 = false

		slot0._commaSprites[slot4].setVisible(slot6, slot0._commaSprites[slot4])
	end

	if slot0._afterCallFunc then
		slot3 = slot0

		slot0._afterCallFunc(slot2)
	end
end

slot0.setSlotNumber = function (slot0, slot1)
	slot0._slotNumber = slot1
end

slot0.getSequenceNumber = function (slot0)
	return #slot0._numberSequence
end

slot0.addNumber = function (slot0, slot1, slot2, slot3)
	slot7 = {
		number = slot1,
		userID = slot2,
		delayTime = (slot3 or 0) * slot0._timeScale
	}

	table.insert(slot5, slot0._numberSequence)

	if not slot0._inRolling then
		slot6 = slot0

		slot0.performSequence(slot5)
	end
end

slot0.performSequence = function (slot0)
	if #slot0._numberSequence > 0 and not slot0._inRolling then
		slot0._inRolling = true

		if slot0._numberSequence[1].delayTime > 0 and #slot0._numberSequence < 6 then
			slot4 = slot0
			slot11 = slot1.delayTime
			slot8 = cc.DelayTime.create(slot9, cc.DelayTime)

			function slot12()
				slot2 = slot0

				slot0.startRolling(slot1)
			end

			slot0.runAction(slot3, cc.Sequence.create(slot6, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
		else
			slot4 = slot0

			slot0.startRolling(slot3)
		end
	end
end

slot0.setNumber = function (slot0, slot1)
	slot0._inRolling = true
	slot2 = TreeFunc.splitNumber2(slot3)
	slot5 = slot0._rootNode

	slot0._rootNode.stopAllActions(slot1)

	for slot6 = 1, slot0._slotNumber, 1 do
		slot9 = slot0._slotSprites[slot6][1]

		slot0._slotSprites[slot6][1].stopAllActions(slot8)

		slot9 = slot0._slotSprites[slot6][2]

		slot0._slotSprites[slot6][2].stopAllActions(slot8)

		slot10 = false

		slot0._slotSprites[slot6][1].setVisible(slot8, slot0._slotSprites[slot6][1])

		slot10 = false

		slot0._slotSprites[slot6][2].setVisible(slot8, slot0._slotSprites[slot6][2])

		if slot6 <= #slot2 then
			slot10 = true

			slot0._slotSprites[slot6][1].setVisible(slot8, slot0._slotSprites[slot6][1])

			slot10 = -(9 - slot2[slot6]) * slot0._everyHeight

			slot0._slotSprites[slot6][1].setPositionY(slot8, slot0._slotSprites[slot6][1])
		end
	end

	slot5 = #slot2 / 3
	slot3 = math.ceil(slot4) - 1

	for slot7 = 1, #slot0._commaSprites, 1 do
		slot11 = slot7 <= slot3

		slot0._commaSprites[slot7].setVisible(slot9, slot0._commaSprites[slot7])
	end

	if slot0._alignType == Tree.AlignType.AlignType_Left then
		slot7 = -slot0._width + #slot2 * slot0._everyWidth + slot3 * slot0._everyCommaWidth

		slot0._rootNode.setPositionX(slot5, slot0._rootNode)
	elseif slot0._alignType == Tree.AlignType.AlignType_Right then
		slot7 = 0

		slot0._rootNode.setPositionX(slot5, slot0._rootNode)
	elseif slot0._alignType == Tree.AlignType.AlignType_Center then
		slot7 = -(slot0._width - #slot2 * slot0._everyWidth - slot3 * slot0._everyCommaWidth) * 0.5

		slot0._rootNode.setPositionX(slot5, slot0._rootNode)
	end

	slot0._lastNumber = slot1
	slot0._lastBitSequence = slot2
	slot0._inRolling = false

	if slot0._afterCallFunc then
		slot6 = slot0

		slot0._afterCallFunc(slot5)
	end
end

slot0.startRolling = function (slot0)
	slot4 = 1

	if table.remove(slot2, slot0._numberSequence).number == slot0._lastNumber then
		slot0._inRolling = false

		return
	end

	if slot0._beforeCallFunc then
		slot6 = slot1.userID

		slot0._beforeCallFunc(slot4, slot0)
	end

	slot3 = 0
	slot4 = TreeFunc.sign(slot5)
	slot7 = slot2
	slot6 = slot0._rollTime * slot0._timeScale

	if #TreeFunc.splitNumber2(slot2 - slot0._lastNumber) < #slot0._lastBitSequence then
		slot7 = 0
		slot8 = 1

		for slot13 = #slot0._lastBitSequence, #slot5 + 1, -1 do

			-- Decompilation error in this vicinity:
			slot14 = slot0._lastBitSequence[slot13] + 1
			slot15 = slot8
			slot16 = slot13 * 0.033
			slot18 = math.floor(slot19) or 0
			slot19 = math.ceil((slot17 - 1) / 3) - 1
			slot22 = slot0._slotSprites[slot13][1]
			slot29 = slot7 + slot16
			slot33 = slot6 * slot14
			slot37 = -slot14 * slot0._everyHeight

			function slot31()
				if slot0 > 0 then
					slot3 = false

					slot1._commaSprites[].setVisible(slot1._commaSprites, slot1._commaSprites[])
				end

				slot3 = false

				slot1._slotSprites[slot2][1].setVisible(slot2, slot1._slotSprites[slot2][1])

				if slot1._alignType == Tree.AlignType.AlignType_Left then
					slot3 = -slot1._width + (slot3 - ) * slot1._everyWidth + slot1._everyWidth * slot1._everyCommaWidth

					slot1._rootNode.setPositionX(slot1, slot1._rootNode)
				elseif slot1._alignType == Tree.AlignType.AlignType_Center then
					slot3 = -(slot1._width - (slot3 - ) * slot1._everyWidth - slot1._everyWidth * slot1._everyCommaWidth) * 0.5

					slot1._rootNode.setPositionX(slot1, slot1._rootNode)
				end
			end

			slot0._slotSprites[slot13][1].runAction((slot17 - 1) / 3, cc.Sequence.create(slot24, cc.Sequence, cc.DelayTime.create(cc.EaseSineInOut.create(cc.DelayTime, cc.MoveBy.create(slot31, cc.MoveBy, cc.p(slot35, 0))), cc.DelayTime), cc.CallFunc.create(cc.EaseSineInOut, cc.CallFunc)))

			slot7 = slot7 + slot16 + slot6 * slot14
			slot8 = slot8 + 1
		end

		slot13 = slot7
		slot3 = math.max(slot11, slot3)
	end

	slot10 = #slot5
	slot8 = 0

	for slot12 = 1, math.min(slot8, #slot0._lastBitSequence), 1 do
		slot15 = slot12
		slot18 = slot8
		slot21 = slot5[slot12] - slot0._lastBitSequence[slot12]
		slot8 = math.max(slot17, math.abs(slot20))

		if slot4 > 0 then
			if slot13 < slot14 then
				slot18 = slot0._slotSprites[slot15][1]
				slot25 = slot15 * 0.033
				slot22 = cc.DelayTime.create(slot23, cc.DelayTime)
				slot25 = cc.EaseSineInOut
				slot29 = slot6 * (slot14 - slot13)
				slot33 = (slot14 - slot13) * slot0._everyHeight

				slot0._slotSprites[slot15][1].runAction(slot17, cc.Sequence.create(slot20, cc.Sequence, cc.EaseSineInOut.create(cc.DelayTime, cc.MoveBy.create(slot27, cc.MoveBy, cc.p(slot31, 0)))))
			elseif slot14 < slot13 then
				slot19 = -(9 - slot13) * slot0._everyHeight - slot0._height

				slot0._slotSprites[slot15][2].setPositionY(slot17, slot0._slotSprites[slot15][2])

				slot19 = true

				slot0._slotSprites[slot15][2].setVisible(slot17, slot0._slotSprites[slot15][2])

				slot20 = slot8
				slot8 = math.max(slot0._slotSprites[slot15][2], slot16)
				slot19 = slot0._slotSprites[slot12][1]
				slot26 = slot15 * 0.033
				slot23 = cc.DelayTime.create(slot24, cc.DelayTime)
				slot26 = cc.EaseSineInOut
				slot30 = slot6 * (9 - slot13 + slot14 + 1)
				slot34 = (9 - slot13 + slot14 + 1) * slot0._everyHeight

				slot0._slotSprites[slot12][1].runAction(slot0._slotSprites[slot15][2], cc.Sequence.create(slot21, cc.Sequence, cc.EaseSineInOut.create(cc.DelayTime, cc.MoveBy.create(slot28, cc.MoveBy, cc.p(slot32, 0)))))

				slot19 = slot0._slotSprites[slot12][2]
				slot26 = slot15 * 0.033
				slot30 = slot6 * (9 - slot13 + slot14 + 1)
				slot34 = (9 - slot13 + slot14 + 1) * slot0._everyHeight
				slot24 = cc.EaseSineInOut.create(cc.DelayTime, cc.MoveBy.create(slot28, cc.MoveBy, cc.p(slot32, 0)))

				function slot28()
					slot0._slotSprites[][2] = slot0._slotSprites[slot0._slotSprites[]][1]
					slot0._slotSprites[][1] = slot0._slotSprites[slot1][2]
					slot4 = false

					slot0._slotSprites[][2].setVisible(slot0._slotSprites, slot0._slotSprites[][2])
				end

				slot0._slotSprites[slot12][2].runAction(slot0._slotSprites[slot15][2], cc.Sequence.create(slot21, cc.Sequence, cc.DelayTime.create(cc.EaseSineInOut.create, cc.DelayTime), cc.CallFunc.create(cc.EaseSineInOut, cc.CallFunc)))
			end
		elseif slot4 < 0 then
			if slot14 < slot13 then
				slot18 = slot0._slotSprites[slot15][1]
				slot25 = slot15 * 0.033
				slot22 = cc.DelayTime.create(slot23, cc.DelayTime)
				slot25 = cc.EaseSineInOut
				slot29 = slot6 * (slot13 - slot14)
				slot33 = (slot14 - slot13) * slot0._everyHeight

				slot0._slotSprites[slot15][1].runAction(slot17, cc.Sequence.create(slot20, cc.Sequence, cc.EaseSineInOut.create(cc.DelayTime, cc.MoveBy.create(slot27, cc.MoveBy, cc.p(slot31, 0)))))
			elseif slot13 < slot14 then
				slot20 = slot8
				slot8 = math.max(slot18, slot16)
				slot20 = true

				slot0._slotSprites[slot15][2].setVisible(slot18, slot0._slotSprites[slot15][2])

				slot20 = (1 + slot13) * slot0._everyHeight

				slot0._slotSprites[slot15][2].setPositionY(slot18, slot0._slotSprites[slot15][2])

				slot19 = slot0._slotSprites[slot15][1]
				slot26 = slot15 * 0.033
				slot23 = cc.DelayTime.create(slot24, cc.DelayTime)
				slot26 = cc.EaseSineInOut
				slot30 = slot6 * (9 - slot14 + 1 + slot13)
				slot34 = -(9 - slot14 + 1 + slot13) * slot0._everyHeight

				slot0._slotSprites[slot15][1].runAction(slot18, cc.Sequence.create(slot0._everyHeight, cc.Sequence, cc.EaseSineInOut.create(cc.DelayTime, cc.MoveBy.create(slot28, cc.MoveBy, cc.p(slot32, 0)))))

				slot19 = slot0._slotSprites[slot15][2]
				slot26 = slot15 * 0.033
				slot30 = slot6 * (9 - slot14 + 1 + slot13)
				slot34 = -(9 - slot14 + 1 + slot13) * slot0._everyHeight
				slot24 = cc.EaseSineInOut.create(cc.DelayTime, cc.MoveBy.create(slot28, cc.MoveBy, cc.p(slot32, 0)))

				function slot28()
					slot0._slotSprites[][2] = slot0._slotSprites[slot0._slotSprites[]][1]
					slot0._slotSprites[][1] = slot0._slotSprites[slot1][2]
					slot4 = false

					slot0._slotSprites[][2].setVisible(slot0._slotSprites, slot0._slotSprites[][2])
				end

				slot0._slotSprites[slot15][2].runAction(slot18, cc.Sequence.create(slot0._everyHeight, cc.Sequence, cc.DelayTime.create(cc.EaseSineInOut.create, cc.DelayTime), cc.CallFunc.create(cc.EaseSineInOut, cc.CallFunc)))
			end
		end
	end

	slot12 = slot7 * 0.033 + slot8 * slot6
	slot3 = math.max(slot10, slot3)

	if #slot0._lastBitSequence < #slot5 then
		slot9 = 0

		for slot13 = #slot0._lastBitSequence + 1, #slot5, 1 do
			slot16 = (slot13 % 3 == 1 and (slot14 - 1) / 3) or 0
			slot17 = math.ceil(slot18) - 1
			slot21 = -slot0._height

			slot0._slotSprites[slot13][1].setPositionY(slot14 / 3, slot0._slotSprites[slot13][1])

			slot21 = true

			slot0._slotSprites[slot13][1].setVisible(slot14 / 3, slot0._slotSprites[slot13][1])

			slot20 = slot0._slotSprites[slot13][1]
			slot27 = slot9 + slot14 * 0.033

			function slot28()
				if slot0 > 0 then
					slot3 = true

					slot1._commaSprites[].setVisible(slot1._commaSprites, slot1._commaSprites[])
				end

				if slot1._alignType == Tree.AlignType.AlignType_Left then
					slot3 = -slot1._width + slot2 * slot1._everyWidth + slot3 * slot1._everyCommaWidth

					slot1._rootNode.setPositionX(slot1, slot1._rootNode)
				elseif slot1._alignType == Tree.AlignType.AlignType_Center then
					slot3 = -(slot1._width - slot2 * slot1._everyWidth - slot3 * slot1._everyCommaWidth) * 0.5

					slot1._rootNode.setPositionX(slot1, slot1._rootNode)
				end
			end

			slot28 = cc.EaseSineInOut
			slot32 = slot6 * (slot5[slot13] + 1)
			slot36 = (slot5[slot13] + 1) * slot0._everyHeight

			slot0._slotSprites[slot13][1].runAction(slot14 / 3, cc.Sequence.create(slot22, cc.Sequence, cc.DelayTime.create(cc.CallFunc.create(cc.DelayTime, cc.CallFunc), cc.DelayTime), cc.EaseSineInOut.create(cc.CallFunc, cc.MoveBy.create(slot30, cc.MoveBy, cc.p(slot34, 0)))))

			slot9 = slot9 + slot14 * 0.033 + slot6 * (slot5[slot13] + 1)
		end

		slot13 = slot9
		slot3 = math.max(slot11, slot3)
	end

	slot0._lastBitSequence = slot5
	slot0._lastNumber = slot2
	slot9 = math.ceil(slot10) - 1
	slot12 = slot0._rootNode
	slot19 = slot3 + 0.1

	function slot20()
		if slot0._alignType == Tree.AlignType.AlignType_Left then
			slot3 = -slot0._width + #slot1 * slot0._everyWidth + slot2 * slot0._everyCommaWidth

			slot0._rootNode.setPositionX(slot1, slot0._rootNode)
		elseif slot0._alignType == Tree.AlignType.AlignType_Center then
			slot3 = -(slot0._width - #slot1 * slot0._everyWidth - slot2 * slot0._everyCommaWidth) * 0.5

			slot0._rootNode.setPositionX(slot1, slot0._rootNode)
		end
	end

	slot21 = 0.12
	slot18 = cc.DelayTime.create(cc.CallFunc, cc.DelayTime)

	function slot22()
		if slot0._afterCallFunc then
			slot3 = slot1.userID

			slot0._afterCallFunc(slot1, slot0._afterCallFunc)
		end

		slot0._inRolling = false
		slot2 = slot0

		slot0.performSequence(false)
	end

	slot0._rootNode.runAction(#slot5 / 3, cc.Sequence.create(slot14, cc.Sequence, cc.DelayTime.create(slot17, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
end

slot0.addNumber2u = function (slot0, slot1, slot2)
	slot6 = {
		number = slot1,
		userID = slot2
	}

	table.insert(slot4, slot0._numberSequence)

	if not slot0._inRolling then
		slot5 = slot0

		slot0.startRolling2u(slot4)
	end
end

slot0.startRolling2u = function (slot0)
	if #slot0._numberSequence > 0 and not slot0._inRolling then
		slot4 = 1

		if table.remove(slot2, slot0._numberSequence).number == slot0._lastNumber then
			return
		end

		slot0._inRolling = true
		slot3 = 0
		slot4 = TreeFunc.sign(slot5)
		slot9 = "number of bit sequence"

		assert(slot2, #slot0._lastBitSequence == #TreeFunc.splitNumber2(slot2 - slot0._lastNumber))

		slot6 = slot0._rollTime * slot0._timeScale
		slot8 = 0

		for slot12 = 1, #slot5, 1 do
			slot15 = slot12
			slot18 = slot8
			slot21 = slot5[slot12] - slot0._lastBitSequence[slot12]
			slot8 = math.max(slot17, math.abs(slot20))
			slot16 = slot6 * (math.random() * 0.5 + (0.5 * slot12) / slot7)

			if slot0._lastBitSequence[slot12] < slot5[slot12] then
				slot19 = slot0._slotSprites[slot15][1]
				slot26 = slot15 * 0.01
				slot23 = cc.DelayTime.create(slot24, cc.DelayTime)
				slot26 = cc.EaseSineInOut
				slot30 = slot16 * (slot14 - slot13)
				slot34 = (slot14 - slot13) * slot0._everyHeight

				slot0._slotSprites[slot15][1].runAction(slot18, cc.Sequence.create(slot21, cc.Sequence, cc.EaseSineInOut.create(cc.DelayTime, cc.MoveBy.create(slot28, cc.MoveBy, cc.p(slot32, 0)))))
			elseif slot14 < slot13 then
				slot20 = -(9 - slot13) * slot0._everyHeight - slot0._height

				slot0._slotSprites[slot15][2].setPositionY(slot18, slot0._slotSprites[slot15][2])

				slot20 = true

				slot0._slotSprites[slot15][2].setVisible(slot18, slot0._slotSprites[slot15][2])

				slot21 = slot8
				slot8 = math.max(slot0._slotSprites[slot15][2], slot17)
				slot20 = slot0._slotSprites[slot12][1]
				slot27 = slot15 * 0.01
				slot24 = cc.DelayTime.create(slot25, cc.DelayTime)
				slot27 = cc.EaseSineInOut
				slot31 = slot16 * (9 - slot13 + slot14 + 1)
				slot35 = (9 - slot13 + slot14 + 1) * slot0._everyHeight

				slot0._slotSprites[slot12][1].runAction(slot0._slotSprites[slot15][2], cc.Sequence.create(slot22, cc.Sequence, cc.EaseSineInOut.create(cc.DelayTime, cc.MoveBy.create(slot29, cc.MoveBy, cc.p(slot33, 0)))))

				slot20 = slot0._slotSprites[slot12][2]
				slot27 = slot15 * 0.01
				slot31 = slot16 * (9 - slot13 + slot14 + 1)
				slot35 = (9 - slot13 + slot14 + 1) * slot0._everyHeight
				slot25 = cc.EaseSineInOut.create(cc.DelayTime, cc.MoveBy.create(slot29, cc.MoveBy, cc.p(slot33, 0)))

				function slot29()
					slot0._slotSprites[][2] = slot0._slotSprites[slot0._slotSprites[]][1]
					slot0._slotSprites[][1] = slot0._slotSprites[slot1][2]
					slot4 = false

					slot0._slotSprites[][2].setVisible(slot0._slotSprites, slot0._slotSprites[][2])
				end

				slot0._slotSprites[slot12][2].runAction(slot0._slotSprites[slot15][2], cc.Sequence.create(slot22, cc.Sequence, cc.DelayTime.create(cc.EaseSineInOut.create, cc.DelayTime), cc.CallFunc.create(cc.EaseSineInOut, cc.CallFunc)))
			end
		end

		slot12 = slot7 * 0.01 + slot8 * slot6
		slot0._lastBitSequence = slot5
		slot0._lastNumber = slot2
		slot9 = math.ceil(slot10) - 1
		slot12 = slot0._rootNode
		slot19 = math.max(slot10, slot3) + 0.2
		slot20 = 0.12
		slot17 = cc.DelayTime.create(cc.DelayTime, cc.DelayTime)

		function slot21()
			slot0._inRolling = false
			slot2 = slot0

			slot0.startRolling2u(false)
		end

		slot0._rootNode.runAction(#slot5 / 3, cc.Sequence.create(slot14, cc.Sequence, cc.DelayTime.create(slot17, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
	end
end

slot0.onDestroy = function (slot0)
	return
end

return slot0
