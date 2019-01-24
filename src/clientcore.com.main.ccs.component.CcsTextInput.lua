CcsTextInput = class("CcsTextInput")

CcsTextInput.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	if slot4 then
		slot4 = cc.c4b(slot4.r, slot4.g, slot4.b, slot4.a or 255)
	end

	createSetterGetter(slot0, "position", cc.p(slot2 or 0, slot3 or 0), false, true)
	createSetterGetter(slot0, "text", "", false, true)
	createSetterGetter(slot0, "inputFlag", 3, false, true)
	createSetterGetter(slot0, "returnType", 1, false, true)
	createSetterGetter(slot0, "fontSize", nil, false, true)
	createSetterGetter(slot0, "touchEnabled", true, false, true)
	createSetterGetter(slot0, "fontColor", slot4 or display.COLOR_BLACK, false, true)
	createSetterGetter(slot0, "inputMode", cc.EDITBOX_INPUT_MODE_SINGLELINE, false, true)
	createSetterGetter(slot0, "placeHolderColor", slot8, false, true)
	createSetterGetter(slot0, "size", slot1 or cc.size(0, 0), false, true)
	createSetterGetter(slot0, "placeHolder", slot5 or I18n.get("c649"), false, true)
	createSetterGetter(slot0, "inputSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "returnSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "endSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "anchorPoint", nil, false, true)

	slot0._normalBg = slot6 or ResConfig.getAssetPath("ui/common/modal/2.png")
	slot0._editBox = nil
	slot0._parent = slot7
	slot0._editHandler = nil
end

CcsTextInput.setShowing = function (slot0, slot1)
	if slot1 then
		slot0:show()
	else
		slot0:hide()
	end
end

CcsTextInput.setTouchEnabled = function (slot0, slot1)
	if slot0._touchEnabled ~= slot1 then
		slot0._touchEnabled = slot1

		if slot0._editBox then
			slot0._editBox:setTouchEnabled(slot1)
		end
	end
end

CcsTextInput.setText = function (slot0, slot1, slot2)
	if slot0._text ~= slot1 then
		slot0._text = slot1

		if not slot2 and slot0._editBox then
			slot0._editBox:setText(slot1)
		end
	end
end

CcsTextInput.setPlaceHolder = function (slot0, slot1)
	if slot0._placeHolder ~= slot1 then
		slot0._placeHolder = slot1

		if slot0._editBox then
			slot0._editBox:setPlaceHolder(slot0._placeHolder)
		end
	end
end

CcsTextInput.setPosition = function (slot0, slot1)
	if not slot0._position:equals(slot1) then
		slot0._position = slot1

		if slot0._editBox then
			slot0._editBox:setPosition(slot1)
		end
	end
end

CcsTextInput.setPlaceHolderColor = function (slot0, slot1)
	if not slot1.a then
		slot1.a = 255
	end

	slot0._placeHolderColor = slot1

	if slot0._editBox then
		slot0._editBox:setPlaceholderFontColor(slot1)
	end
end

CcsTextInput.setInputMode = function (slot0, slot1)
	slot0._inputMode = slot1

	if slot0._editBox then
		slot0._editBox:setInputMode(slot1)
	end
end

CcsTextInput.setFontSize = function (slot0, slot1)
	slot0._fontSize = slot1

	if slot0._editBox and slot0._fontSize then
		slot0._editBox:setPlaceholderFont("", slot1)
		slot0._editBox:setFont("", slot1)
	end
end

CcsTextInput.setFontColor = function (slot0, slot1)
	if not slot1.a then
		slot1.a = 255
	end

	slot0._fontColor = slot1

	if slot0._editBox then
		slot0._editBox:setFontColor(slot1)
	end
end

CcsTextInput.setAnchorPoint = function (slot0, slot1)
	slot0._anchorPoint = slot1

	if slot0._editBox and slot0._anchorPoint then
		slot0._editBox:setAnchorPoint(slot0._anchorPoint)
	end
end

CcsTextInput.setInputFlag = function (slot0, slot1)
	if slot0._inputFlag ~= slot1 then
		slot0._inputFlag = slot1

		if slot0._editBox then
			slot0._editBox:setInputFlag(slot1)
		end
	end
end

CcsTextInput.onInputEvent = function (slot0, slot1, slot2)
	if slot1 == "return" then
	elseif slot1 == "returnSend" then
	elseif slot1 == "changed" then
		slot0._text = slot2:getText()

		slot0._inputSignal:emit(slot0)
	elseif slot1 == "ended" then
		slot0._endSignal:emit(slot0)
	else
		printf("EditBox event %s", tostring(slot1))
	end

	if slot0._editHandler then
		slot0._editHandler(slot1, slot2)
	end
end

CcsTextInput.setReturnType = function (slot0, slot1)
	slot0._returnType = slot1

	if slot0._editBox then
		slot0._editBox:setReturnType(slot0._returnType)
	end
end

CcsTextInput.show = function (slot0)
	if not slot0._editBox then
		slot0._editBox = ccui.EditBox:create(slot0._size, slot0._normalBg)

		slot0._editBox:registerScriptEditBoxHandler(handler(slot0, slot0.onInputEvent))
		slot0._editBox:setPosition(slot0._position.x, slot0._position.y)
		slot0._editBox:setLocalZOrder(100)
		slot0._editBox:setFontColor(slot0._fontColor)
		slot0._editBox:setPlaceholderFontColor(slot0._placeHolderColor or slot0._fontColor or display.COLOR_BLACK)
		slot0._editBox:setReturnType(slot0._returnType)
		slot0._editBox:setText(slot0._text)
		slot0._editBox:setPlaceHolder(slot0._placeHolder)
		slot0._editBox:setInputFlag(slot0._inputFlag)
		slot0._editBox:setInputMode(slot0._inputMode)

		if slot0._fontSize then
			slot0._editBox:setPlaceholderFont("", slot0._fontSize)
			slot0._editBox:setFont("", slot0._fontSize)
		end

		if slot0._anchorPoint then
			slot0._editBox:setAnchorPoint(slot0._anchorPoint)
		end

		slot0._touchEnabled = true
	end

	slot0._editBox:setOpacity(255)
	DisplayUtil.addChild2(slot0._editBox, slot0._parent)
end

CcsTextInput.addEditHandler = function (slot0, slot1)
	if slot0._editHandler ~= slot1 then
		slot0._editHandler = slot1
	end
end

CcsTextInput.enterEditState = function (slot0)
	if slot0._editBox then
		slot0._editBox:enterEditState()
	end
end

CcsTextInput.isEditing = function (slot0)
	if slot0._editBox then
		return slot0._editBox:getIsEditing()
	end

	return false
end

CcsTextInput.hide = function (slot0)
	if slot0._editBox then
		slot0._editBox:unregisterScriptEditBoxHandler()
		slot0._editBox:removeFromParent()

		slot0._editBox = nil
	end
end

CcsTextInput.destroy = function (slot0)
	slot0:hide()
	slot0._inputSignal:removeAll()

	slot0._inputSignal = nil
	slot0._parent = nil
	slot0._position = nil
	slot0._text = nil
	slot0._fontColor = nil
	slot0._size = nil
	slot0._normalBg = nil
end

return
