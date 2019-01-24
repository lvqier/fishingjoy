function slot3()
	slot2 = cc.ClippingNode

	return cc.ClippingNode.create(slot1)
end

slot0 = class(slot1, "SlwhClippingRolling")

slot0.ctor = function (slot0, slot1)
	slot0._timeInterval = slot1.timeInterval
	slot0._tagAction = slot1.tagAction
	slot5 = slot1.maskTexturePath
	slot0._maskSprite = cc.Sprite.create(slot3, cc.Sprite)
	slot5 = slot1.cameraMask

	slot0._maskSprite.setCameraMask(slot3, slot0._maskSprite)

	slot6 = 0

	slot0._maskSprite.setAnchorPoint(slot3, slot0._maskSprite, 0.5)

	slot5 = slot0._maskSprite

	slot0.setStencil(slot3, slot0)

	slot5 = slot1.alphaThreshold

	slot0.setAlphaThreshold(slot3, slot0)

	slot5 = slot1.rollingTexturePath
	slot0._rollingSprite1 = cc.Sprite.create(slot3, cc.Sprite)
	slot6 = 0

	slot0._rollingSprite1.setAnchorPoint(slot3, slot0._rollingSprite1, 0.5)

	slot5 = slot1.rollingScale

	slot0._rollingSprite1.setScale(slot3, slot0._rollingSprite1)

	slot5 = slot1.cameraMask

	slot0._rollingSprite1.setCameraMask(slot3, slot0._rollingSprite1)

	slot5 = slot0._rollingSprite1

	slot0.addChild(slot3, slot0)

	slot5 = slot1.rollingTexturePath
	slot0._rollingSprite2 = cc.Sprite.create(slot3, cc.Sprite)
	slot5 = slot1.rollingScale

	slot0._rollingSprite2.setScale(slot3, slot0._rollingSprite2)

	slot6 = 0

	slot0._rollingSprite2.setAnchorPoint(slot3, slot0._rollingSprite2, 0.5)

	slot5 = slot1.cameraMask

	slot0._rollingSprite2.setCameraMask(slot3, slot0._rollingSprite2)

	slot5 = slot0._rollingSprite2

	slot0.addChild(slot3, slot0)

	slot4 = slot0._rollingSprite1
	slot0._unitNumber = slot1.unitNumber
	slot0._everyHeight = (slot0._rollingSprite1.getContentSize(slot3).height * slot1.rollingScale) / slot0._unitNumber
	slot0._maxHeight = slot0._rollingSprite1.getContentSize(slot3).height * slot1.rollingScale
	slot0._resultSequence = {}
	slot0._currentNumber = 0
	slot0._inAction = false
	slot6 = 0

	slot0._rollingSprite1.setPositionY(slot1.rollingScale, slot0._rollingSprite1)

	slot6 = slot0._maxHeight

	slot0._rollingSprite2.setPositionY(slot1.rollingScale, slot0._rollingSprite2)

	slot6 = slot1.cameraMask

	slot0.setCameraMask(slot1.rollingScale, slot0)

	if slot0._rollingSprite1.setDepthTest then
		slot6 = slot1.depthTest

		slot0._maskSprite.setDepthTest(slot4, slot0._maskSprite)

		slot6 = slot1.depthTest

		slot0._rollingSprite1.setDepthTest(slot4, slot0._rollingSprite1)

		slot6 = slot1.depthTest

		slot0._rollingSprite2.setDepthTest(slot4, slot0._rollingSprite2)
	end

	slot0._afterCallback = nil
end

slot0.setAfterCallback = function (slot0, slot1)
	slot0._afterCallback = slot1
end

slot0.setTimeInterval = function (slot0, slot1)
	slot0._timeInterval = slot1
end

slot0.setRollingSpeed = function (slot0, slot1)
	slot5 = slot0._tagAction

	if slot0._rollingSprite1.getActionByTag(slot3, slot0._rollingSprite1) then
		slot6 = slot1

		slot2.setSpeed(slot4, slot2)
	end

	slot6 = slot0._tagAction + 1

	if slot0._rollingSprite2.getActionByTag(slot4, slot0._rollingSprite2) then
		slot7 = slot1

		slot3.setSpeed(slot5, slot3)
	end

	slot7 = slot0._tagAction + 2

	if slot0.getActionByTag(slot5, slot0) then
		slot8 = slot1

		slot4.setSpeed(slot6, slot4)
	end
end

slot0.setNumber = function (slot0, slot1)
	slot4 = slot0._rollingSprite1

	slot0._rollingSprite1.stopAllActions(slot3)

	slot4 = slot0._rollingSprite2

	slot0._rollingSprite2.stopAllActions(slot3)

	slot5 = -slot1 * slot0._everyHeight

	slot0._rollingSprite1.setPositionY(slot3, slot0._rollingSprite1)

	slot5 = -slot1 * slot0._everyHeight + slot0._maxHeight

	slot0._rollingSprite2.setPositionY(slot3, slot0._rollingSprite2)

	slot0._currentNumber = slot1
	slot0._inAction = false
	slot0._resultSequence = {}
end

slot0.addNumber = function (slot0, slot1, slot2)
	slot6 = "SlwhClippingRolling:addNum invalid param."

	assert(slot4, slot1 >= 0 and slot1 < slot0._unitNumber and slot2 >= 0)

	slot6 = {
		grid_y = slot1,
		cycle = slot2
	}

	table.insert(slot4, slot0._resultSequence)

	if not slot0._inAction then
		slot5 = slot0

		slot0.perform(slot4)
	end
end

slot0.perform = function (slot0)
	slot4 = 1
	slot1 = table.remove(slot2, slot0._resultSequence)
	slot0._inAction = true
	slot3 = slot0._unitNumber - slot0._currentNumber + slot0._unitNumber + slot1.grid_y + slot0._unitNumber * 2 * slot1.cycle
	slot5 = slot0._rollingSprite1
	slot6 = slot0._rollingSprite2
	slot11 = {}
	slot14 = cc.EaseSineOut
	slot18 = (slot0._unitNumber - slot0._currentNumber) * slot0._timeInterval
	slot22 = -(slot0._unitNumber - slot0._currentNumber) * slot0._everyHeight

	table.insert(slot10, cc.EaseSineOut.create(slot13, cc.MoveBy.create(slot16, cc.MoveBy, cc.p(slot20, 0))))

	slot11 = 

	function slot15()
		slot3 = slot1._maxHeight

		slot0.setPositionY(slot1, slot0)
	end

	table.insert(slot10, cc.CallFunc.create(slot13, cc.CallFunc))

	if slot1.cycle > 0 then
		slot11 = slot8
		slot24 = slot2 * slot0._timeInterval
		slot28 = -slot2 * slot0._everyHeight
		slot18 = cc.EaseSineOut.create(slot19, cc.MoveBy.create(slot22, cc.MoveBy, cc.p(slot26, 0)))

		function slot22()
			slot3 = slot1._maxHeight

			slot0.setPositionY(slot1, slot0)
		end

		slot16 = slot4

		table.insert(slot10, cc.Repeat.create(slot13, cc.Repeat, cc.Sequence.create(slot16, cc.Sequence, cc.CallFunc.create(cc.EaseSineOut, cc.CallFunc))))
	end

	slot12 = slot8
	slot15 = cc.EaseSineOut
	slot19 = (slot0._unitNumber + slot1.grid_y) * slot0._timeInterval
	slot23 = -(slot0._unitNumber + slot1.grid_y) * slot0._everyHeight

	table.insert(slot11, cc.EaseSineOut.create(slot14, cc.MoveBy.create(slot17, cc.MoveBy, cc.p(slot21, 0))))

	slot16 = slot8
	slot14 = 1
	slot10 = cc.Speed.create(slot11, cc.Speed, cc.Sequence.create(slot14, cc.Sequence))
	slot14 = slot0._tagAction

	slot10.setTag(cc.Speed, slot10)
	slot5.runAction(cc.Speed, slot5)

	slot15 = {}
	slot18 = cc.EaseSineOut
	slot22 = ((slot0._unitNumber + slot0._unitNumber) - slot0._currentNumber) * slot0._timeInterval
	slot26 = -((slot0._unitNumber + slot0._unitNumber) - slot0._currentNumber) * slot0._everyHeight

	table.insert(slot10, cc.EaseSineOut.create(slot17, cc.MoveBy.create(cc.p, cc.MoveBy, cc.p(slot0._everyHeight, 0))))

	slot15 = 

	function slot19()
		slot3 = slot1._maxHeight

		slot0.setPositionY(slot1, slot0)
	end

	table.insert(slot10, cc.CallFunc.create(slot17, cc.CallFunc))

	if slot4 > 0 then
		slot15 = slot12
		slot28 = slot2 * slot0._timeInterval
		slot32 = -slot2 * slot0._everyHeight
		slot22 = cc.EaseSineOut.create(slot23, cc.MoveBy.create(slot26, cc.MoveBy, cc.p(slot30, 0)))

		function slot26()
			slot3 = slot1._maxHeight

			slot0.setPositionY(slot1, slot0)
		end

		slot20 = slot4

		table.insert(slot14, cc.Repeat.create(slot17, cc.Repeat, cc.Sequence.create(slot20, cc.Sequence, cc.CallFunc.create(cc.EaseSineOut, cc.CallFunc))))
	end

	if slot1.grid_y > 0 then
		slot16 = slot12
		slot19 = cc.EaseSineOut
		slot23 = slot13 * slot0._timeInterval
		slot27 = -slot13 * slot0._everyHeight

		table.insert(slot15, cc.EaseSineOut.create(slot18, cc.MoveBy.create(slot21, cc.MoveBy, cc.p(slot25, 0))))
	end

	slot18 = 1
	slot14 = cc.Speed.create(slot15, cc.Speed, cc.Sequence.create(slot18, cc.Sequence))
	slot18 = slot0._tagAction + 1

	slot14.setTag(cc.Speed, slot14)

	slot18 = slot14

	slot6.runAction(cc.Speed, slot6)

	slot0._currentNumber = slot1.grid_y
	slot25 = slot3 * slot0._timeInterval + 0.1
	slot22 = cc.DelayTime.create(slot23, cc.DelayTime)

	function slot26()
		slot0._inAction = false

		if slot0._afterCallback then
			slot3 = slot1.grid_y

			slot0._afterCallback(slot1, slot0._afterCallback)
		end
	end

	slot20 = 1
	slot16 = cc.Speed.create(slot6, cc.Speed, cc.Sequence.create(slot12, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
	slot20 = slot0._tagAction + 2

	slot16.setTag(cc.Speed, slot16)

	slot20 = slot16

	slot0.runAction(cc.Speed, slot0)
end

slot0.startWithSequence = function (slot0, slot1, slot2)
	slot6 = 0

	slot0._rollingSprite1.setPositionY(slot4, slot0._rollingSprite1)

	slot5 = slot0._rollingSprite1

	slot0._rollingSprite1.stopAllActions(slot4)

	slot6 = slot0._maxHeight

	slot0._rollingSprite2.setPositionY(slot4, slot0._rollingSprite2)

	slot6 = false

	slot0._rollingSprite2.setVisible(slot4, slot0._rollingSprite2)

	slot6 = slot0._rollingSprite1
	slot9 = cc.EaseSineOut
	slot13 = slot1 * slot0._timeInterval
	slot17 = -slot0._everyHeight * slot1

	slot0._rollingSprite1.runAction(slot0._rollingSprite2, cc.EaseSineOut.create(slot8, cc.MoveBy.create(slot11, cc.MoveBy, cc.p(slot15, 0))))

	slot0._currentNumber = slot1
end

slot0.decreaseTo = function (slot0, slot1)
	slot5 = slot0._rollingSprite1
	slot8 = cc.EaseSineInOut
	slot15 = -slot1 + slot0._currentNumber
	slot12 = slot0._timeInterval * math.abs(slot14)
	slot16 = (-slot1 + slot0._currentNumber) * slot0._everyHeight

	slot0._rollingSprite1.runAction(slot4, cc.EaseSineInOut.create(slot7, cc.MoveBy.create(slot10, cc.MoveBy, cc.p(slot14, 0))))

	slot0._currentNumber = slot1
end

return slot0
