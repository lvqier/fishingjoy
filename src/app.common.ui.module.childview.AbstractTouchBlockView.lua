slot2 = "AbstractTouchBlockView"
AbstractTouchBlockView = class(slot1)

AbstractTouchBlockView.ctor = function (slot0)
	slot0._modalTouchBlockLayer = nil
	slot0._blockCanTouch = true
end

AbstractTouchBlockView.getBlockCanTouch = function (slot0)
	return slot0._blockCanTouch
end

AbstractTouchBlockView.setBlockCanTouch = function (slot0, slot1)
	if slot0._blockCanTouch ~= slot1 then
		slot0._blockCanTouch = slot1
		slot4 = slot0

		slot0.onBlockCanTouchChanged(slot3)
	end
end

AbstractTouchBlockView.onBlockCanTouchChanged = function (slot0)
	if slot0._modalTouchBlockLayer then
		slot4 = slot0._blockCanTouch

		slot0._modalTouchBlockLayer.setTouchEnabled(slot2, slot0._modalTouchBlockLayer)

		if slot0._blockCanTouch then
			slot3 = slot0._modalTouchBlockLayer
			slot7 = slot0.onRootTouchOperation

			slot0._modalTouchBlockLayer.addTouchEventListener(slot2, handler(slot5, slot0))
		end
	end
end

AbstractTouchBlockView.hide = function (slot0)
	if slot0._modalTouchBlockLayer then
		slot3 = slot0._modalTouchBlockLayer

		slot0._modalTouchBlockLayer.removeFromParent(slot2)
	end
end

AbstractTouchBlockView.onRootTouchOperation = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_ENDED then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

AbstractTouchBlockView.show = function (slot0, slot1, slot2)
	if not slot0._modalTouchBlockLayer then
		slot5 = ccui.Layout
		slot0._modalTouchBlockLayer = ccui.Layout.create(slot4)
		slot5 = slot0._modalTouchBlockLayer

		slot0._modalTouchBlockLayer.retain(slot4)

		slot5 = slot0._modalTouchBlockLayer
		slot9 = display.height * 100

		slot0._modalTouchBlockLayer.setContentSize(slot4, cc.size(slot7, display.width * 100))

		slot6 = 0

		slot0._modalTouchBlockLayer.setBackGroundColorType(slot4, slot0._modalTouchBlockLayer)

		slot5 = slot0._modalTouchBlockLayer
		slot11 = 255

		slot0._modalTouchBlockLayer.setBackGroundColor(slot4, cc.c4b(slot7, 0, 255, 0))

		slot6 = 100

		slot0._modalTouchBlockLayer.setBackGroundColorOpacity(slot4, slot0._modalTouchBlockLayer)

		slot5 = slot0

		slot0.onBlockCanTouchChanged(slot4)
	end

	if slot2 then
		if slot1 then
			slot6 = slot1

			slot0._modalTouchBlockLayer.setLocalZOrder(slot4, slot0._modalTouchBlockLayer)
		end

		slot8 = -0.5 * slot0._modalTouchBlockLayer.getContentSize(slot4).height

		slot0._modalTouchBlockLayer.setPosition(slot0._modalTouchBlockLayer, slot0._modalTouchBlockLayer, -0.5 * slot0._modalTouchBlockLayer.getContentSize(slot4).width)

		slot8 = true

		DisplayUtil.setAddOrRemoveChild(slot0._modalTouchBlockLayer, slot0._modalTouchBlockLayer, slot2)
	else
		slot7 = slot1

		uiMgr.showView(slot4, uiMgr, slot0._modalTouchBlockLayer)
	end
end

AbstractTouchBlockView.destroy = function (slot0)
	if slot0._modalTouchBlockLayer then
		slot3 = slot0._modalTouchBlockLayer

		slot0._modalTouchBlockLayer.removeFromParent(slot2)

		slot3 = slot0._modalTouchBlockLayer

		slot0._modalTouchBlockLayer.release(slot2)

		slot0._modalTouchBlockLayer = nil
	end
end

return
