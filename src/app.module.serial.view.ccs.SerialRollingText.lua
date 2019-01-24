slot0 = class("SerialRollingText", function (slot0)
	return cc.ClippingRectangleNode:create(slot0.rect)
end)

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
	slot0._rootNode = cc.Node:create()

	slot0._rootNode:setCascadeOpacityEnabled(true)
	slot0._rootNode:setPosition(0, 0)
	slot0:addChild(slot0._rootNode)

	for slot4 = 1, slot0._slotNumber, 1 do
		slot0._slotSprites[slot4] = {
			cc.Sprite:create(slot0._texturePath),
			cc.Sprite:create(slot0._texturePath)
		}

		slot0._slotSprites[slot4][1]:setAnchorPoint(0.5, 0)
		slot0._slotSprites[slot4][2]:setAnchorPoint(0.5, 0)
		slot0._rootNode:addChild(slot0._slotSprites[slot4][1])
		slot0._rootNode:addChild(slot0._slotSprites[slot4][2])

		if slot4 % 3 == 0 then
			slot5 = cc.Sprite:create(slot0._commaTexturePath)

			slot5:setAnchorPoint(0.5, 0)
			slot0._rootNode:addChild(slot5)
			table.insert(slot0._commaSprites, slot5)
		end
	end

	slot1 = slot0._slotSprites[1][1]:getContentSize()
	slot0._everyWidth = slot1.width
	slot0._everyHeight = slot1.height / 10
	slot0._everyCommaWidth = slot0._commaSprites[1]:getContentSize().width
	slot0._width = slot1.width * slot0._slotNumber + #slot0._commaSprites * slot0._everyCommaWidth
	slot0._height = slot1.height
	slot3 = slot0._slotNumber * slot0._everyWidth + #slot0._commaSprites * slot0._everyCommaWidth
	slot4 = 1

	for slot8 = 1, slot0._slotNumber, 1 do
		slot0._slotSprites[slot8][1]:setPosition(slot3 - slot0._everyWidth * 0.5, -slot0._height)
		slot0._slotSprites[slot8][2]:setPosition(slot3 - slot0._everyWidth * 0.5, -slot0._height)
		slot0._slotSprites[slot8][1]:setVisible(false)
		slot0._slotSprites[slot8][2]:setVisible(false)

		slot3 = slot3 - slot0._everyWidth

		if slot8 % 3 == 0 then
			slot0._commaSprites[slot4]:setPosition(slot3 - slot0._everyCommaWidth * 0.5, 0)
			slot0._commaSprites[slot4]:setVisible(false)

			slot3 = slot3 - slot0._everyCommaWidth
			slot4 = slot4 + 1
		end
	end

	slot0._slotSprites[1][1]:setPositionY(-slot0._height + slot0._everyHeight)
	slot0._slotSprites[1][1]:setVisible(true)

	slot0._lastBitSequence = {
		[1.0] = 0
	}

	if slot0._alignType == Serial.AlignType.AlignType_Left then
		slot0._rootNode:setPositionX(-slot0._width + slot0._everyWidth)
	elseif slot0._alignType == Serial.AlignType.AlignType_Right then
		slot0._rootNode:setPositionX(0)
	elseif slot0._alignType == Serial.AlignType.AlignType_Center then
		slot0._rootNode:setPositionX(-(slot0._width - slot0._everyWidth) * 0.5)
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
		slot0._slotSprites[slot4][1]:setPositionY(-slot0._height)
		slot0._slotSprites[slot4][2]:setPositionY(-slot0._height)
		slot0._slotSprites[slot4][1]:stopAllActions()
		slot0._slotSprites[slot4][2]:stopAllActions()
		slot0._slotSprites[slot4][1]:setVisible(false)
		slot0._slotSprites[slot4][2]:setVisible(false)
	end

	slot0._rootNode:stopAllActions()
	slot0._slotSprites[1][1]:setPositionY(-slot0._height + slot0._everyHeight)
	slot0._slotSprites[1][1]:setVisible(true)

	if slot0._alignType == Serial.AlignType.AlignType_Left then
		slot0._rootNode:setPosition(-slot0._width + slot0._everyWidth, 0)
	elseif slot0._alignType == Serial.AlignType.AlignType_Center then
		slot0._rootNode:setPosition(-(slot0._width - slot0._everyWidth) * 0.5, 0)
	end

	for slot4 = 1, #slot0._commaSprites, 1 do
		slot0._commaSprites[slot4]:setVisible(false)
	end

	if slot0._afterCallFunc then
		slot0:_afterCallFunc()
	end
end

slot0.setSlotNumber = function (slot0, slot1)
	slot0._slotNumber = slot1
end

slot0.getSequenceNumber = function (slot0)
	return #slot0._numberSequence
end

slot0.addNumber = function (slot0, slot1, slot2, slot3)
	table.insert(slot0._numberSequence, {
		number = slot1,
		userID = slot2,
		delayTime = (slot3 or 0) * slot0._timeScale
	})

	if not slot0._inRolling then
		slot0:performSequence()
	end
end

slot0.performSequence = function (slot0)
	if #slot0._numberSequence > 0 and not slot0._inRolling then
		slot0._inRolling = true

		if slot0._numberSequence[1].delayTime > 0 and #slot0._numberSequence < 6 then
			slot0:runAction(cc.Sequence:create(cc.DelayTime:create(slot1.delayTime), cc.CallFunc:create(function ()
				slot0:startRolling()
			end)))
		else
			slot0:startRolling()
		end
	end
end

slot0.setNumber = function (slot0, slot1)
	slot0._inRolling = true
	slot2 = SerialFunc.splitNumber2(slot1)

	slot0._rootNode:stopAllActions()

	for slot6 = 1, slot0._slotNumber, 1 do
		slot0._slotSprites[slot6][1]:stopAllActions()
		slot0._slotSprites[slot6][2]:stopAllActions()
		slot0._slotSprites[slot6][1]:setVisible(false)
		slot0._slotSprites[slot6][2]:setVisible(false)

		if slot6 <= #slot2 then
			slot0._slotSprites[slot6][1]:setVisible(true)
			slot0._slotSprites[slot6][1]:setPositionY(-(9 - slot2[slot6]) * slot0._everyHeight)
		end
	end

	slot3 = math.ceil(#slot2 / 3) - 1

	for slot7 = 1, #slot0._commaSprites, 1 do
		slot0._commaSprites[slot7]:setVisible(slot7 <= slot3)
	end

	if slot0._alignType == Serial.AlignType.AlignType_Left then
		slot0._rootNode:setPositionX(-slot0._width + #slot2 * slot0._everyWidth + slot3 * slot0._everyCommaWidth)
	elseif slot0._alignType == Serial.AlignType.AlignType_Right then
		slot0._rootNode:setPositionX(0)
	elseif slot0._alignType == Serial.AlignType.AlignType_Center then
		slot0._rootNode:setPositionX(-(slot0._width - #slot2 * slot0._everyWidth - slot3 * slot0._everyCommaWidth) * 0.5)
	end

	slot0._lastNumber = slot1
	slot0._lastBitSequence = slot2
	slot0._inRolling = false

	if slot0._afterCallFunc then
		slot0:_afterCallFunc()
	end
end

slot0.startRolling = function (slot0)
	if table.remove(slot0._numberSequence, 1).number == slot0._lastNumber then
		slot0._inRolling = false

		return
	end

	if slot0._beforeCallFunc then
		slot0:_beforeCallFunc(slot1.userID)
	end

	slot3 = 0
	slot4 = SerialFunc.sign(slot2 - slot0._lastNumber)
	slot6 = slot0._rollTime * slot0._timeScale

	if #SerialFunc.splitNumber2(slot2) < #slot0._lastBitSequence then
		slot7 = 0
		slot8 = 1

		for slot13 = #slot0._lastBitSequence, #slot5 + 1, -1 do
			slot15 = slot8
			slot18 = (slot13 % 3 == 1 and math.floor((slot17 - 1) / 3)) or 0
			slot19 = math.ceil((slot17 - 1) / 3) - 1

			slot0._slotSprites[slot13][1]:runAction(cc.Sequence:create(cc.DelayTime:create(slot7 + slot13 * 0.033), cc.EaseSineInOut:create(cc.MoveBy:create(slot6 * (slot0._lastBitSequence[slot13] + 1), cc.p(0, -(slot0._lastBitSequence[slot13] + 1) * slot0._everyHeight))), cc.CallFunc:create(function ()
				if slot0 > 0 then
					slot1._commaSprites[]:setVisible(false)
				end

				slot1._slotSprites[slot2][1]:setVisible(false)

				if slot1._alignType == Serial.AlignType.AlignType_Left then
					slot1._rootNode:setPositionX(-slot1._width + (slot3 - slot4) * slot1._everyWidth + slot5 * slot1._everyCommaWidth)
				elseif slot1._alignType == Serial.AlignType.AlignType_Center then
					slot1._rootNode:setPositionX(-(slot1._width - (slot3 - slot4) * slot1._everyWidth - slot5 * slot1._everyCommaWidth) * 0.5)
				end
			end)))

			slot7 = slot7 + slot13 * 0.033 + slot6 * (slot0._lastBitSequence[slot13] + 1)
			slot8 = slot8 + 1
		end

		slot3 = math.max(slot3, slot7)
	end

	slot8 = 0

	for slot12 = 1, math.min(#slot0._lastBitSequence, #slot5), 1 do
		slot15 = slot12
		slot8 = math.max(slot8, math.abs(slot5[slot12] - slot0._lastBitSequence[slot12]))

		if slot4 > 0 then
			if slot13 < slot14 then
				slot0._slotSprites[slot15][1]:runAction(cc.Sequence:create(cc.DelayTime:create(slot15 * 0.033), cc.EaseSineInOut:create(cc.MoveBy:create(slot6 * (slot14 - slot13), cc.p(0, (slot14 - slot13) * slot0._everyHeight)))))
			elseif slot14 < slot13 then
				slot0._slotSprites[slot15][2]:setPositionY(-(9 - slot13) * slot0._everyHeight - slot0._height)
				slot0._slotSprites[slot15][2]:setVisible(true)

				slot8 = math.max(slot16, slot8)

				slot0._slotSprites[slot12][1]:runAction(cc.Sequence:create(cc.DelayTime:create(slot15 * 0.033), cc.EaseSineInOut:create(cc.MoveBy:create(slot6 * (9 - slot13 + slot14 + 1), cc.p(0, (9 - slot13 + slot14 + 1) * slot0._everyHeight)))))
				slot0._slotSprites[slot12][2]:runAction(cc.Sequence:create(cc.DelayTime:create(slot15 * 0.033), cc.EaseSineInOut:create(cc.MoveBy:create(slot6 * (9 - slot13 + slot14 + 1), cc.p(0, (9 - slot13 + slot14 + 1) * slot0._everyHeight))), cc.CallFunc:create(function ()
					slot0._slotSprites[][2] = slot0._slotSprites[slot0._slotSprites[]][1]
					slot0._slotSprites[][1] = slot0._slotSprites[slot1][2]

					slot0._slotSprites[][2]:setVisible(false)
				end)))
			end
		elseif slot4 < 0 then
			if slot14 < slot13 then
				slot0._slotSprites[slot15][1]:runAction(cc.Sequence:create(cc.DelayTime:create(slot15 * 0.033), cc.EaseSineInOut:create(cc.MoveBy:create(slot6 * (slot13 - slot14), cc.p(0, (slot14 - slot13) * slot0._everyHeight)))))
			elseif slot13 < slot14 then
				slot8 = math.max(slot16, slot8)

				slot0._slotSprites[slot15][2]:setVisible(true)
				slot0._slotSprites[slot15][2]:setPositionY((1 + slot13) * slot0._everyHeight)
				slot0._slotSprites[slot15][1]:runAction(cc.Sequence:create(cc.DelayTime:create(slot15 * 0.033), cc.EaseSineInOut:create(cc.MoveBy:create(slot6 * (9 - slot14 + 1 + slot13), cc.p(0, -(9 - slot14 + 1 + slot13) * slot0._everyHeight)))))
				slot0._slotSprites[slot15][2]:runAction(cc.Sequence:create(cc.DelayTime:create(slot15 * 0.033), cc.EaseSineInOut:create(cc.MoveBy:create(slot6 * (9 - slot14 + 1 + slot13), cc.p(0, -(9 - slot14 + 1 + slot13) * slot0._everyHeight))), cc.CallFunc:create(function ()
					slot0._slotSprites[][2] = slot0._slotSprites[slot0._slotSprites[]][1]
					slot0._slotSprites[][1] = slot0._slotSprites[slot1][2]

					slot0._slotSprites[][2]:setVisible(false)
				end)))
			end
		end
	end

	slot3 = math.max(slot3, slot7 * 0.033 + slot8 * slot6)

	if #slot0._lastBitSequence < #slot5 then
		slot9 = 0

		for slot13 = #slot0._lastBitSequence + 1, #slot5, 1 do
			slot16 = (slot13 % 3 == 1 and (slot14 - 1) / 3) or 0
			slot17 = math.ceil(slot14 / 3) - 1

			slot0._slotSprites[slot13][1]:setPositionY(-slot0._height)
			slot0._slotSprites[slot13][1]:setVisible(true)
			slot0._slotSprites[slot13][1]:runAction(cc.Sequence:create(cc.DelayTime:create(slot9 + slot14 * 0.033), cc.CallFunc:create(function ()
				if slot0 > 0 then
					slot1._commaSprites[]:setVisible(true)
				end

				if slot1._alignType == Serial.AlignType.AlignType_Left then
					slot1._rootNode:setPositionX(-slot1._width + slot2 * slot1._everyWidth + slot2 * slot1._everyWidth * slot1._everyCommaWidth)
				elseif slot1._alignType == Serial.AlignType.AlignType_Center then
					slot1._rootNode:setPositionX(-(slot1._width - slot2 * slot1._everyWidth - slot2 * slot1._everyWidth * slot1._everyCommaWidth) * 0.5)
				end
			end), cc.EaseSineInOut:create(cc.MoveBy:create(slot6 * (slot5[slot13] + 1), cc.p(0, (slot5[slot13] + 1) * slot0._everyHeight)))))

			slot9 = slot9 + slot14 * 0.033 + slot6 * (slot5[slot13] + 1)
		end

		slot3 = math.max(slot3, slot9)
	end

	slot0._lastBitSequence = slot5
	slot0._lastNumber = slot2
	slot9 = math.ceil(#slot5 / 3) - 1

	slot0._rootNode:runAction(cc.Sequence:create(cc.DelayTime:create(slot3 + 0.1), cc.CallFunc:create(function ()
		if slot0._alignType == Serial.AlignType.AlignType_Left then
			slot0._rootNode:setPositionX(-slot0._width + #slot1 * slot0._everyWidth + slot2 * slot0._everyCommaWidth)
		elseif slot0._alignType == Serial.AlignType.AlignType_Center then
			slot0._rootNode:setPositionX(-(slot0._width - #slot1 * slot0._everyWidth - slot2 * slot0._everyCommaWidth) * 0.5)
		end
	end), cc.DelayTime:create(0.12), cc.CallFunc:create(function ()
		if slot0._afterCallFunc then
			slot0._afterCallFunc(slot0._afterCallFunc, slot1.userID)
		end

		slot0._inRolling = false

		slot0:performSequence()
	end)))
end

slot0.addNumber2u = function (slot0, slot1, slot2)
	table.insert(slot0._numberSequence, {
		number = slot1,
		userID = slot2
	})

	if not slot0._inRolling then
		slot0:startRolling2u()
	end
end

slot0.startRolling2u = function (slot0)
	if #slot0._numberSequence > 0 and not slot0._inRolling then
		if table.remove(slot0._numberSequence, 1).number == slot0._lastNumber then
			return
		end

		slot0._inRolling = true
		slot3 = 0
		slot4 = SerialFunc.sign(slot2 - slot0._lastNumber)

		assert(#slot0._lastBitSequence == #SerialFunc.splitNumber2(slot2), "number of bit sequence")

		slot6 = slot0._rollTime * slot0._timeScale
		slot8 = 0

		for slot12 = 1, #slot5, 1 do
			slot15 = slot12
			slot8 = math.max(slot8, math.abs(slot5[slot12] - slot0._lastBitSequence[slot12]))
			slot16 = slot6 * (math.random() * 0.5 + (0.5 * slot12) / slot7)

			if slot0._lastBitSequence[slot12] < slot5[slot12] then
				slot0._slotSprites[slot15][1]:runAction(cc.Sequence:create(cc.DelayTime:create(slot15 * 0.01), cc.EaseSineInOut:create(cc.MoveBy:create(slot16 * (slot14 - slot13), cc.p(0, (slot14 - slot13) * slot0._everyHeight)))))
			elseif slot14 < slot13 then
				slot0._slotSprites[slot15][2]:setPositionY(-(9 - slot13) * slot0._everyHeight - slot0._height)
				slot0._slotSprites[slot15][2]:setVisible(true)

				slot8 = math.max(slot17, slot8)

				slot0._slotSprites[slot12][1]:runAction(cc.Sequence:create(cc.DelayTime:create(slot15 * 0.01), cc.EaseSineInOut:create(cc.MoveBy:create(slot16 * (9 - slot13 + slot14 + 1), cc.p(0, (9 - slot13 + slot14 + 1) * slot0._everyHeight)))))
				slot0._slotSprites[slot12][2]:runAction(cc.Sequence:create(cc.DelayTime:create(slot15 * 0.01), cc.EaseSineInOut:create(cc.MoveBy:create(slot16 * (9 - slot13 + slot14 + 1), cc.p(0, (9 - slot13 + slot14 + 1) * slot0._everyHeight))), cc.CallFunc:create(function ()
					slot0._slotSprites[][2] = slot0._slotSprites[slot0._slotSprites[]][1]
					slot0._slotSprites[][1] = slot0._slotSprites[slot1][2]

					slot0._slotSprites[][2]:setVisible(false)
				end)))
			end
		end

		slot0._lastBitSequence = slot5
		slot0._lastNumber = slot2
		slot9 = math.ceil(#slot5 / 3) - 1

		slot0._rootNode:runAction(cc.Sequence:create(cc.DelayTime:create(math.max(slot3, slot7 * 0.01 + slot8 * slot6) + 0.2), cc.DelayTime:create(0.12), cc.CallFunc:create(function ()
			slot0._inRolling = false

			slot0:startRolling2u()
		end)))
	end
end

slot0.onDestroy = function (slot0)
	return
end

return slot0
