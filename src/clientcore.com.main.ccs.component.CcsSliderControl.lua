CcsSliderControl = class("CcsSliderControl")

CcsSliderControl.onCreationComplete = function (slot0)
	createSetterGetter(slot0, "maxValue", 0, true, nil, nil, nil, handler(slot0, slot0.onMaxValue))
	createSetterGetter(slot0, "sliderValue", 0, true, nil, nil, nil, handler(slot0, slot0.onSliderValueChanged))
	slot0:init()
	slot0:initSignal()
	slot0:formatInputValue()
end

CcsSliderControl.init = function (slot0)
	slot0._txtInput = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.txtInput)

	slot0._txtInput:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
end

CcsSliderControl.initSignal = function (slot0)
	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			slot0._txtInput:show()
		elseif slot0 == "exit" then
			slot0._txtInput:hide()
		end
	end)
	slot0._txtInput:addEditHandler(handler(slot0, slot0.onInputEvent))
	slot0.slider.percentFloatChangedSignal:add(slot0.onPercentFloatChanged, slot0)
end

CcsSliderControl.removeSignal = function (slot0)
	slot0.slider.percentFloatChangedSignal:remove(slot0.onPercentFloatChanged, slot0)
end

CcsSliderControl.onInputEvent = function (slot0, slot1, slot2)
	if slot1 == "changed" then
		slot0:onInputChanged()
	elseif slot1 == "ended" and isAndroid then
		slot0:formatInputValue()
	end
end

CcsSliderControl.formatInputValue = function (slot0)
	slot0._txtInput:setText(StringUtil.numberStr2FormatNumberStr(slot0._sliderValue))
end

CcsSliderControl.onInputChanged = function (slot0)
	if slot0._maxValue < (parseInt(string.gsub(slot0._txtInput:getText(), ",", "")) or 0) then
		slot2 = slot0._maxValue
	end

	slot0._sliderValue = slot2

	if not isAndroid then
		slot0:formatInputValue()
	end

	slot0.slider:setPercentFloat((slot0._maxValue == 0 and 0) or slot2 / slot0._maxValue, nil, true)
	slot0.sliderValueChangedSignal:emit()
end

CcsSliderControl.onPercentFloatChanged = function (slot0)
	if slot0._sliderValue ~= math.round(math.floor(slot0.slider:getPercentFloat() * 100) / 100 * slot0._maxValue) then
		slot0._sliderValue = slot2

		slot0:formatInputValue()
		slot0:onInputChanged()
	end
end

CcsSliderControl.setErrorMsg = function (slot0, slot1)
	slot0.slider:setErrorMsg(slot1)
end

CcsSliderControl.onSliderValueChanged = function (slot0)
	slot0:formatInputValue()
	slot0:onInputChanged()
end

CcsSliderControl.onMaxValue = function (slot0)
	slot0:onInputChanged()
	slot0.slider:setMaxValue(slot0._maxValue)
end

CcsSliderControl.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnMax then
		slot0:setSliderValue(slot0._maxValue)
	elseif slot1 == slot0.btnClear then
		slot0:setSliderValue(0)
	end
end

CcsSliderControl.destroy = function (slot0)
	slot0._txtInput:destroy()
	slot0.slider:destroy()
	slot0:removeSignal()

	slot0._txtInput = nil
end

return
