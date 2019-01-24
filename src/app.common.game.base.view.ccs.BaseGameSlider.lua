slot2 = "BaseGameSlider"
BaseGameSlider = class(slot1)

BaseGameSlider.onCreationComplete = function (slot0)
	slot13 = slot0.onPercentFloatChanged

	createSetterGetter(slot2, slot0, "percentFloat", 0, true, nil, nil, handler(slot11, slot0))

	slot0.direction = 1
	slot3 = slot0.slider_f
	slot0._barSize = slot0.slider_f.getContentSize(slot2)
	slot0.min = 0
	slot3 = slot0.btn
	slot5 = slot0

	slot0.btn.getTouchSignal(slot2).add(slot2, slot0.btn.getTouchSignal(slot2), slot0.onBtntouchSignal)

	slot3 = slot0

	slot0.onChangeDirection(slot2)

	slot3 = slot0

	slot0.onPercentFloatChanged(slot2)
end

BaseGameSlider.onChangeDirection = function (slot0)
	if slot0.direction == 1 then
		slot5 = slot0.slider_f
		slot0.startPos = cc.p(slot0.slider_f.getPosition(slot4))
		slot3 = slot0.slider_f.getPositionX(slot4) + slot0._barSize.width
		slot6 = slot0.slider_f
		slot0.endPos = cc.p(slot2, slot0.slider_f.getPositionY(slot0.slider_f))
	elseif slot0.direction == 2 then
		slot5 = slot0.slider_f
		slot0.startPos = cc.p(slot0.slider_f.getPosition(slot4))
		slot6 = slot0.slider_f
		slot4 = slot0.slider_f.getPositionY(slot0.slider_f) + slot0._barSize.height
		slot0.endPos = cc.p(slot2, slot0.slider_f.getPositionX(slot4))
	end
end

BaseGameSlider.setDirection = function (slot0, slot1)
	if slot0.direction == slot1 then
		return
	end

	if slot1 ~= 1 and slot1 ~= 2 then
		slot0.direction = 1
	else
		slot0.direction = slot1
	end

	slot4 = slot0

	slot0.onChangeDirection(slot3)

	slot4 = slot0

	slot0.onPercentFloatChanged(slot3)
end

BaseGameSlider.onBtntouchSignal = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		slot5 = slot0
		slot8 = slot1

		slot0.updatePercentByBtnPos(slot4, slot1.getTouchBeganPosition(slot7))
	elseif slot2 == ccs.TOUCH_EVENT_MOVED then
		slot5 = slot0
		slot8 = slot1

		slot0.updatePercentByBtnPos(slot4, slot1.getTouchMovePosition(slot7))
	elseif slot2 == ccs.TOUCH_EVENT_ENDED then
		slot5 = slot0
		slot8 = slot1

		slot0.updatePercentByBtnPos(slot4, slot1.getTouchEndPosition(slot7))
	elseif slot2 == ccs.TOUCH_EVENT_CANCELED then
		slot5 = slot0
		slot8 = slot1

		slot0.updatePercentByBtnPos(slot4, slot1.getTouchEndPosition(slot7))
	end
end

BaseGameSlider.updatePercentByBtnPos = function (slot0, slot1)
	slot5 = slot1
	slot2 = slot0.convertToNodeSpace(slot3, slot0)
	slot3 = 0

	if slot0.direction == 1 then
		slot8 = slot0._barSize.width
		slot3 = MathUtil.getValueBetween(slot5, slot2.x - slot0.startPos.x, slot0.min) / slot0._barSize.width
	elseif slot0.direction == 2 then
		slot8 = slot0._barSize.height
		slot3 = MathUtil.getValueBetween(slot5, slot2.y - slot0.startPos.y, slot0.min) / slot0._barSize.height
	end

	slot7 = slot3

	slot0.setPercentFloat(slot5, slot0)
end

BaseGameSlider.onPercentFloatChanged = function (slot0)
	if slot0.direction == 1 then
		slot3 = slot0.slider_f
		slot7 = slot0._barSize.height

		slot0.slider_f.setContentSize(slot2, cc.size(slot5, slot0._barSize.width * slot0._percentFloat))

		slot4 = slot0.startPos.x + slot0._barSize.width * slot0._percentFloat

		slot0.btn.setPositionX(slot2, slot0.btn)
	elseif slot0.direction == 2 then
		slot3 = slot0.slider_f
		slot7 = slot0._barSize.height * slot0._percentFloat

		slot0.slider_f.setContentSize(slot2, cc.size(slot5, slot0._barSize.width))

		slot4 = slot0.startPos.y + slot0._barSize.height * slot0._percentFloat

		slot0.btn.setPositionY(slot2, slot0.btn)
	end

	if slot0.callBack ~= nil then
		slot0.callBack()
	end
end

BaseGameSlider.resetMin = function (slot0)
	if slot0.direction == 1 then
		slot0.min = slot0._barSize.width * slot0._percentFloat
	elseif slot0.direction == 2 then
		slot0.min = slot0._barSize.height * slot0._percentFloat
	end
end

BaseGameSlider.setCallBack = function (slot0, slot1)
	slot0.callBack = slot1
end

BaseGameSlider.reset = function (slot0)
	slot0._percentFloat = 0
	slot3 = slot0

	slot0.onPercentFloatChanged(slot2)
end

BaseGameSlider.destroy = function (slot0)
	slot3 = slot0.btn

	TweenLite.killTweensOf(slot2)

	slot3 = slot0.btn

	slot0.btn.destroy(slot2)
end

return
