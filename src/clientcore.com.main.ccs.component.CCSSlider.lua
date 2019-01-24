CCSSlider = class("CCSSlider")

CCSSlider.onCreationComplete = function (slot0)
	createSetterGetter(slot0, "percentFloat", 0, true, true, nil, nil, handler(slot0, slot0.onPercentFloatChanged))
	createSetterGetter(slot0, "isTipPercentShowing", false, nil, nil, nil, nil, handler(slot0, slot0.onIsTipPercentShowing))

	slot0._defaultErrorMsg = "可取款金额为0"
	slot0._minValue = 0
	slot0._barSize = slot0.bar:getContentSize()
	slot0._barPos = DisplayUtil.ccpCopy(slot0.bar:getPosition())

	slot0.btn:getTouchSignal():add(slot0.onBtntouchSignal, slot0)
	createSetterGetter(slot0, "slideUnit", 0)
	slot0:onIsTipPercentShowing()
	slot0:onPercentFloatChanged()
end

CCSSlider.setMaxValue = function (slot0, slot1)
	slot0._maxValue = slot1

	slot0:setPercentFloat(slot0._percentFloat, true)
end

CCSSlider.setMinValuePercent = function (slot0, slot1)
	slot0._minValue = slot1 * slot0._barSize.width
end

CCSSlider.setErrorMsg = function (slot0, slot1)
	slot0._errorMsg = slot1
end

CCSSlider.setPercentFloat = function (slot0, slot1, slot2, slot3)
	if slot0._slideUnit and slot0._slideUnit > 0 and slot0._maxValue and slot0._maxValue > 0 and slot1 ~= 1 then
		slot1 = (math.round((slot1 * slot0._maxValue) / slot0._slideUnit) * slot0._slideUnit) / slot0._maxValue
	end

	if slot0._percentFloat ~= slot1 or slot2 then
		slot0._percentFloat = slot1

		slot0:onPercentFloatChanged()

		if not slot3 then
			slot0.percentFloatChangedSignal:emit(slot1)
		end
	end
end

CCSSlider.onBtntouchSignal = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		slot0:setIsTipPercentShowing(true)
		slot0:updatePercentByBtnPos(slot1:getTouchBeganPosition())
	elseif slot2 == ccs.TOUCH_EVENT_MOVED then
		slot0:updatePercentByBtnPos(slot1:getTouchMovePosition())
	elseif slot2 == ccs.TOUCH_EVENT_ENDED then
		if not slot0._maxValue or slot0._maxValue <= 0 then
			tweenMsgMgr:showRedMsg((slot0._errorMsg and slot0._errorMsg) or slot0._defaultErrorMsg)
		end

		slot0:updatePercentByBtnPos(slot1:getTouchEndPosition())
		slot0:setIsTipPercentShowing(false)
	elseif slot2 == ccs.TOUCH_EVENT_CANCELED then
		if not slot0._maxValue or slot0._maxValue <= 0 then
			tweenMsgMgr:showRedMsg((slot0._errorMsg and slot0._errorMsg) or slot0._defaultErrorMsg)
		end

		slot0:updatePercentByBtnPos(slot1:getTouchEndPosition())
		slot0:setIsTipPercentShowing(false)
	end
end

CCSSlider.updatePercentByBtnPos = function (slot0, slot1)
	slot0:setPercentFloat(MathUtil.getValueBetween(slot0:convertToNodeSpace(slot1).x - slot0._barPos.x, slot0._minValue, slot0._barSize.width) / slot0._barSize.width)
end

CCSSlider.updateTipPercent = function (slot0)
	if slot0.btn.tipPercent and slot0.btn.tipPercent.txt then
		slot0.btn.tipPercent.txt:setString(math.floor(slot0._percentFloat * 100) .. "%")
	end
end

CCSSlider.onIsTipPercentShowing = function (slot0)
	if slot0.btn.tipPercent then
		if slot0._isTipPercentShowing then
			TweenLite.to(slot0.btn.tipPercent, 0.1, {
				autoAlpha = 1
			})
		else
			TweenLite.to(slot0.btn.tipPercent, 0.1, {
				autoAlpha = 0
			})
		end
	end
end

CCSSlider.onPercentFloatChanged = function (slot0)
	slot0.bar:setContentSize(cc.size(slot0._barSize.width * slot0._percentFloat, slot0._barSize.height))
	slot0.btn:setPositionX(slot0._barPos.x + slot0._barSize.width * slot0._percentFloat)
	slot0:updateTipPercent()
end

CCSSlider.destroy = function (slot0)
	TweenLite.killTweensOf(slot0.btn)
	slot0.btn:destroy()
end

return
