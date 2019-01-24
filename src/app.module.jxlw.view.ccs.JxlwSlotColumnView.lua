slot2 = "app.module.jxlw.ClassImp"

require(slot1)

slot0 = require(slot1)

function slot4()
	slot2 = cc.Node

	return cc.Node.create(slot1)
end

slot1 = class_C("app.module.jxlw.ListQueue", "JxlwSlotColumnView")

slot1.ctor = function (slot0)
	slot4 = "gameres/module/jxlw/ui/battle/slotMask.png"
	slot1 = cc.Sprite.create(slot2, cc.Sprite)
	slot6 = 0

	slot1.setAnchorPoint(cc.Sprite, slot1, 0)

	slot2 = cc.ClippingNode.create(cc.Sprite)
	slot6 = slot1

	slot2.setStencil(cc.ClippingNode, slot2)

	slot6 = 0.1

	slot2.setAlphaThreshold(cc.ClippingNode, slot2)

	slot6 = slot2

	slot0.addChild(cc.ClippingNode, slot0)

	slot3 = cc.Node.create(cc.ClippingNode)
	slot7 = slot3

	slot2.addChild(cc.Node, slot2)

	slot8 = cc.Node.create(cc.Node)

	slot3.addChild(cc.Node, slot3)

	slot0._clippingNode = slot2
	slot0._clippingMask = slot1
	slot0._placer = slot3
	slot0._itemContainer = cc.Node.create(cc.Node)
	slot0._verticalMargin = 10
	slot0._horizonalMargin = 5
	slot8 = 50
	slot0._itemSize = cc.size(cc.Node, 50)
	slot0._volume = 3
	slot7 = slot0
	slot0._items = slot0.create(cc.Node)

	slot0._randomFiller = function ()
		slot2 = slot0

		return slot0.defaultRandomFiller(slot1)
	end

	slot0._determinateFiller = function ()
		slot2 = slot0

		return slot0.defaultDeterminateFiller(slot1)
	end

	slot0._stoppedCallback = function ()
		return
	end

	slot0._beforeStop = function ()
		return
	end

	slot0._propertyDirty = true
	slot0._currentSpeed = 1200
	slot0._top = 0
	slot0._stopCounter = 0
	slot0._duration = 0
	slot0._accTime = 0.5
	slot0._state = "stopped"
end

slot1.setRandomFiller = function (slot0, slot1)
	slot0._randomFiller = slot1
end

slot1.setDeterminateFiller = function (slot0, slot1)
	slot0._determinateFiller = slot1
end

slot1.defaultRandomFiller = function (slot0)
	slot1 = cc.DrawNode.create(slot2)
	slot8 = 0
	slot9 = 1
	slot12 = 1

	slot1.drawSolidRect(cc.DrawNode, slot1, cc.p(slot6, 0), cc.c4f(1, 0.5, 0, 0))

	slot8 = 0.1
	slot9 = 0.9
	slot12 = 1

	slot1.drawSolidRect(cc.DrawNode, slot1, cc.p(cc.p(0, 1), 0.1), cc.c4f(0.9, math.random(), math.random(), math.random()))

	slot4 = slot1
	slot8 = 1

	slot1.setContentSize(cc.DrawNode, cc.size(cc.p(0.1, 0.9), 1))

	return slot1
end

slot1.defaultDeterminateFiller = function (slot0)
	slot1 = {}

	for slot5 = 1, slot0._volume, 1 do
		slot6 = cc.DrawNode.create(slot7)
		slot13 = 0
		slot14 = 1
		slot17 = 1

		slot6.drawSolidRect(cc.DrawNode, slot6, cc.p(slot11, 0), cc.c4f(1, 0.5, 0, 0))

		slot13 = 0.1
		slot14 = 0.9
		slot17 = 1

		slot6.drawSolidRect(cc.DrawNode, slot6, cc.p(cc.p(0, 1), 0.1), cc.c4f(0.9, 1, 1, 1))

		slot9 = slot6
		slot13 = 1

		slot6.setContentSize(cc.DrawNode, cc.size(cc.p(0.1, 0.9), 1))

		slot1[#slot1 + 1] = slot6
	end

	return slot1
end

slot1.checkProperty = function (slot0)
	if slot0._verticalMargin < 0 then
		return false
	end

	if slot0._horizonalMargin < 0 then
		return false
	end

	if slot0._itemSize.width <= 0 then
		return false
	end

	if slot0._itemSize.height <= 0 then
		return false
	end

	if slot0._volume <= 0 then
		return false
	end

	if slot0._verticalMargin > slot0._itemSize.height / 2 then
		return false
	end

	return true
end

slot1.reset = function (slot0)
	assert(slot0.checkProperty(slot4))

	slot3 = slot0._items

	slot0._items.reset(slot2)

	slot3 = slot0
	slot7 = slot0._itemSize.height * slot0._volume * slot0._verticalMargin * 2

	slot0.setContentSize(slot2, cc.size(slot0, slot0._itemSize.width))

	slot3 = slot0._clippingNode
	slot7 = 0

	slot0._clippingNode.setPosition(slot2, cc.p(slot0, -slot0._horizonalMargin))

	slot4 = (slot0._itemSize.width + slot0._horizonalMargin * 2) / 32

	slot0._clippingMask.setScaleX(slot2, slot0._clippingMask)

	slot4 = (slot0._itemSize.height * slot0._volume + slot0._verticalMargin * 2) / 32

	slot0._clippingMask.setScaleY(slot2, slot0._clippingMask)

	slot3 = slot0._itemContainer

	slot0._itemContainer.removeAllChildren(slot2)

	slot3 = slot0._placer
	slot7 = -slot0._itemSize.height + slot0._verticalMargin

	slot0._placer.setPosition(slot2, cc.p(slot0._verticalMargin * 2, slot0._horizonalMargin))
	slot0.pushItem(slot2, slot0._randomFiller())

	slot4 = slot0._determinateFiller()

	for slot5, slot6 in ipairs(slot0) do
		slot9 = slot6

		print(slot8)

		slot10 = slot6

		slot0.pushItem(slot8, slot0)
	end

	slot4 = slot0

	slot0.pushItem(slot3, slot0._randomFiller())

	slot4 = slot0

	slot0.replaceItems(slot3)

	slot0._propertyDirty = false
	slot0._duration = 0
	slot0._stopCounter = 0
	slot0._state = "stopped"
	slot4 = slot0

	slot0.unscheduleUpdate(slot3)

	slot4 = slot0

	slot0.stopAllActions(slot3)
end

slot1.setItemSize = function (slot0, slot1)
	slot0._itemSize = slot1
	slot0._propertyDirty = true
end

slot1.setVolume = function (slot0, slot1)
	slot0._volume = slot1
	slot0._propertyDirty = true
end

slot1.setVerticalMargin = function (slot0, slot1)
	slot0._verticalMargin = slot1
	slot0._propertyDirty = true
end

slot1.setHorizonalMargin = function (slot0, slot1)
	slot0._horizonalMargin = slot1
	slot0._propertyDirty = true
end

slot1.roll = function (slot0)
	slot3 = not slot0._propertyDirty

	assert(slot2)

	if slot0._state == "stopped" then
		slot0._state = "running"
		slot0._duration = 0
		slot3 = slot0

		slot0.replaceItems(slot2)

		slot5 = 0.016

		slot0.scheduleUpdateWithPriorityLua(slot2, slot0, function (slot0)
			slot4 = slot0

			slot0.acc(slot2, slot0)
		end)
	end
end

slot1.stop = function (slot0)
	slot3 = not slot0._propertyDirty

	assert(slot2)

	if slot0._state == "running" then
		slot0._state = "stopping"
		slot0._stopCounter = 0
		slot0._currentSpeed = 2400
		slot4 = slot0._determinateFiller()

		for slot5, slot6 in ipairs(slot3) do
			slot10 = slot6

			slot0.pushItem(slot8, slot0)
		end

		slot4 = slot0

		slot0.pushItem(slot3, slot0._randomFiller())

		slot6 = 0.016

		slot0.scheduleUpdateWithPriorityLua(slot3, slot0, function (slot0)
			slot4 = slot0

			slot0.dcc(slot2, slot0)
		end)
	end
end

slot1.setStoppedCallBack = function (slot0, slot1)
	slot0._stoppedCallback = slot1
end

slot1.acc = function (slot0, slot1)
	slot0._duration = slot0._duration + slot1

	if slot0._accTime < slot0._duration then
		slot0._currentSpeed = 2400
	else
		slot4 = (slot0._duration / slot0._accTime * math.pi) / 2
		slot0._currentSpeed = (-1 * math.cos(slot3) + 1) * 2400
	end

	slot5 = slot0._placer
	slot3, slot4 = slot0._placer.getPosition(slot4)
	slot7 = slot0._placer
	slot11 = slot4 - slot0._currentSpeed * slot1

	slot0._placer.setPosition(slot6, cc.p(slot9, slot0._horizonalMargin))

	slot0._overflow = slot0._overflow + slot0._currentSpeed * slot1

	while slot0._itemSize.height < slot0._overflow do
		slot7 = slot0

		slot0.pushItem(slot6, slot0._randomFiller())

		slot7 = slot0

		slot0.popItem(slot6)

		slot0._overflow = slot0._overflow - slot0._itemSize.height
	end
end

slot1.dcc = function (slot0, slot1)
	slot5 = slot0._placer
	slot3, slot4 = slot0._placer.getPosition(slot4)
	slot7 = slot0._placer
	slot11 = slot4 - slot0._currentSpeed * slot1

	slot0._placer.setPosition(slot6, cc.p(slot9, slot0._horizonalMargin))

	slot0._overflow = slot0._overflow + slot0._currentSpeed * slot1

	while slot0._itemSize.height < slot0._overflow and slot0._stopCounter <= slot0._volume do
		slot7 = slot0

		slot0.popItem(slot6)

		slot0._overflow = slot0._overflow - slot0._itemSize.height
		slot0._stopCounter = slot0._stopCounter + 1
	end

	if slot0._volume < slot0._stopCounter and slot0._overflow > slot0._itemSize.height - slot0._verticalMargin then
		slot7 = slot0

		slot0.replaceItems(slot6)

		slot7 = slot0

		slot0.unscheduleUpdate(slot6)
		slot0._beforeStop()

		slot7 = slot0._placer
		slot17 = 0.1
		slot21 = -40
		slot18 = 0.18
		slot22 = 40
		slot12 = cc.EaseSineInOut.create(cc.EaseSineOut, cc.MoveBy.create(cc.MoveBy, cc.MoveBy, cc.p(0, 0)))

		function slot16()
			slot0._state = "stopped"

			slot0._stoppedCallback()
		end

		slot0._placer.runAction(slot6, cc.Sequence.create(slot9, cc.Sequence, cc.EaseSineOut.create(slot12, cc.MoveBy.create(slot15, cc.MoveBy, cc.p(slot19, 0))), cc.CallFunc.create(cc.EaseSineInOut, cc.CallFunc)))
	end
end

slot1.pushItem = function (slot0, slot1)
	slot5 = slot1

	slot0._items.pushBack(slot3, slot0._items)

	slot5 = slot1.getContentSize(assert).width > 0 and slot2.height > 0

	assert(slot1)

	slot6 = slot0._itemSize.width / slot2.width

	slot1:setScaleX(slot1)

	slot6 = slot0._itemSize.height / slot2.height

	slot1:setScaleY(slot1)

	slot5 = slot1
	slot9 = slot0._itemSize.height * slot0._top

	slot1:setPosition(cc.p(slot2.height, 0))

	slot6 = slot1

	slot0._itemContainer.addChild(slot1, slot0._itemContainer)

	slot0._top = slot0._top + 1
end

slot1.popItem = function (slot0)
	slot4 = slot0._items.popFront(slot2)

	slot0._items.popFront(slot2).removeFromParent(slot0._items)
end

slot1.replaceItems = function (slot0)
	slot1 = slot0._items._front
	slot2 = 0

	while slot1 do
		slot5 = slot1._val
		slot9 = slot0._itemSize.height * slot2

		slot1._val.setPosition(slot4, cc.p(slot7, 0))

		slot1 = slot1._next
		slot2 = slot2 + 1
	end

	slot5 = slot0._placer
	slot9 = -slot0._itemSize.height + slot0._verticalMargin

	slot0._placer.setPosition(slot4, cc.p(slot7, slot0._horizonalMargin))

	slot0._overflow = slot0._itemSize.height - slot0._verticalMargin
	slot5 = slot0._items
	slot0._top = slot0._items.size(slot0._verticalMargin)
end

slot1.setAccelerateTime = function (slot0, slot1)
	slot0._accTime = slot1
end

slot1.setBeforeStopCallback = function (slot0, slot1)
	slot0._beforeStop = slot1
end

slot1.getNode = function (slot0, slot1)
	slot2 = 1
	slot3 = slot0._items._front
	slot4 = nil

	while slot2 <= slot1 + 1 and slot3 do
		if slot2 == slot1 + 1 then
			return slot3._val
		else
			slot2 = slot2 + 1
			slot3 = slot3._next
		end
	end

	return slot4
end

return slot1
