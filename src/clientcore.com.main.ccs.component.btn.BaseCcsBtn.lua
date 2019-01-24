BaseCcsBtn = class("BaseCcsBtn")
BaseCcsBtn.defaultTxtStyleHandler = nil
BaseCcsBtn.multiTouchEnabled = false
slot0 = false

BaseCcsBtn.ctor = function (slot0, slot1)
	ClassUtil.extends(slot0, TickBase)

	slot0._isTouchingMe4MultiTouch = false

	createSetterGetter(slot0, "canTouch", true, false, false, false, false, handler(slot0, slot0.onCanTouchChanged))
	createSetterGetter(slot0, "clickSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "clickWhenCantTouchSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "touchBeginWhenCantTouchSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "interactiveObj", nil, false, true)
	createSetterGetter(slot0, "isPushingDown", false, false, false, false, false, nil, "onPushingDownChanged")
	createSetterGetter(slot0, "touchSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "canLongClick", false, false, false, false, false, handler(slot0, slot0.onCanLongClickChanged))
	createSetterGetter(slot0, "longClickSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "longClickBeginIntervalMs", 250, false, false, false, false, handler(slot0, slot0.onLongClickBeginIntervalMsChanged))

	slot0._longClickTimer = nil

	createSetterGetter(slot0, "canLongClick2", false, false, false, false, false, handler(slot0, slot0.onCanLongClick2Changed))
	createSetterGetter(slot0, "longClick2Signal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "longClick2BeginIntervalMs", 250, false, false, false, false, handler(slot0, slot0.onLongClick2BeginIntervalMs))
	createSetterGetter(slot0, "longClick2RepeatIntervalMs", 10)

	slot0._longClickTimer2 = nil

	createSetterGetter(slot0, "clickSoundName", nil)
	createSetterGetter(slot0, "isChangeBrightWhileCantTouch", true)
	createSetterGetter(slot0, "isIgnoreSound", false)
	slot0:setInteractiveObj(slot1 or slot0)
	slot0:checkTxtStyle()
end

BaseCcsBtn.onCanTouchChanged = function (slot0)
	if slot0.setBright and slot0._isChangeBrightWhileCantTouch then
		slot0:setBright(slot0._canTouch)
	end
end

BaseCcsBtn.checkTxtStyle = function (slot0)
	if slot0.getTitleRenderer and BaseCcsBtn.defaultTxtStyleHandler then
		BaseCcsBtn.defaultTxtStyleHandler(slot0:getTitleRenderer())
	end
end

BaseCcsBtn.setInteractiveObj = function (slot0, slot1)
	if slot1 ~= slot0._interactiveObj then
		if slot0._interactiveObj then
			slot0._interactiveObj:setTouchEnabled(false)
			slot0._interactiveObj:unregisterScriptHandler()
		end

		slot0._interactiveObj = slot1

		slot1:setTouchEnabled(true)
		slot0:registerScriptHandler(handler(slot0, slot0.onDisplayListStateChanged))

		if slot1.addTouchEventListener then
			slot1:addTouchEventListener(handler(slot0, slot0.onTouchOperation))
		end
	end
end

BaseCcsBtn.onDisplayListStateChanged = function (slot0, slot1)
	if slot1 == "enter" then
	elseif slot1 == "exit" and slot0 and slot0._isTouchingMe4MultiTouch then
		slot0._isTouchingMe4MultiTouch = false
		slot0 = false
	end
end

BaseCcsBtn.onTouchOperation = function (slot0, slot1, slot2)
	if not BaseCcsBtn.multiTouchEnabled and slot0 and not slot0._isTouchingMe4MultiTouch then
		return
	end

	if slot0._canTouch then
		slot0._touchSignal:emit(slot0, slot2)
	end

	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		true._isTouchingMe4MultiTouch = true

		true:setIsPushingDown(true)

		if true._canTouch then
			slot0:restLongClickTimer(true)
		end

		if not slot0._canTouch then
			slot0._touchBeginWhenCantTouchSignal:emit(slot0, slot2)
		end
	elseif slot2 == ccs.TOUCH_EVENT_ENDED then
		false._isTouchingMe4MultiTouch = false

		false.restLongClickTimer(slot0)
		false:stopTick()

		if false._isPushingDown then
			slot0:setIsPushingDown(false)
			slot0:triggerBtnClick()
		end
	elseif slot2 == ccs.TOUCH_EVENT_CANCELED then
		false._isTouchingMe4MultiTouch = false

		false.stopTick(slot0)
		false.setIsPushingDown(slot0, false)
		false:restLongClickTimer()
	end
end

BaseCcsBtn.triggerBtnClick = function (slot0)
	if DisplayUtil.isInDisplayList(slot0._interactiveObj, uiMgr:getCurScene()) then
		if slot0._canTouch then
			slot0:onClick()
			slot0._clickSignal:emit(slot0, event)
		else
			slot0._clickWhenCantTouchSignal:emit(slot0, event)
		end

		slot0:checkClickSound()
	end
end

BaseCcsBtn.restLongClickTimer = function (slot0, slot1)
	if slot0._longClickTimer then
		slot0._longClickTimer:reset()

		if slot1 then
			slot0._longClickTimer:start()
		end
	end

	if slot0._longClickTimer2 then
		slot0._longClickTimer2:reset()

		if slot1 then
			slot0._longClickTimer2:start()
		end
	end
end

BaseCcsBtn.checkClickSound = function (slot0)
	if slot0._isIgnoreSound then
		return
	end

	if BaseCcsBtn._soundHandler and type(BaseCcsBtn._soundHandler) == "function" and BaseCcsBtn._soundHandler(slot0:getName()) then
		return
	end

	audioMgr:playGameEffect(slot0._clickSoundName or SOUND_DEFINE.BTN_DEFAULT)
end

BaseCcsBtn.tick = function (slot0)
	if slot0._canLongClick2 then
		slot0:onLongClick2()
		slot0._longClick2Signal:emit(slot0)
	end
end

BaseCcsBtn.onLongClick = function (slot0)
	return
end

BaseCcsBtn.onLongClick2 = function (slot0)
	return
end

BaseCcsBtn.setInteractiveTouchEnable = function (slot0, slot1)
	slot0:getInteractiveObj():setTouchEnabled(slot1)
end

BaseCcsBtn.onPushingDownChanged = function (slot0)
	return
end

BaseCcsBtn.onClick = function (slot0)
	return
end

BaseCcsBtn.onLongClickTimer = function (slot0)
	slot0:setIsPushingDown(false)
	slot0:onLongClick()
	slot0._longClickSignal:emit(slot0)
end

BaseCcsBtn.onLongClickTimer2 = function (slot0)
	slot0:startTick(nil, slot0._longClick2RepeatIntervalMs)
	slot0:tick()
end

BaseCcsBtn.onLongClickBeginIntervalMsChanged = function (slot0)
	if slot0._longClickTimer and slot0._longClickBeginIntervalMs then
		slot0._longClickTimer.delayInMs = slot0._longClickBeginIntervalMs
	end
end

BaseCcsBtn.onLongClick2BeginIntervalMs = function (slot0)
	if slot0._longClickTimer2 and slot0._longClick2BeginIntervalMs then
		slot0._longClickTimer2.delayInMs = slot0._longClick2BeginIntervalMs
	end
end

BaseCcsBtn.onCanLongClick2Changed = function (slot0)
	if slot0._canLongClick2 then
		if not slot0._longClickTimer2 then
			slot0._longClickTimer2 = TimerBase.new(handler(slot0, slot0.onLongClickTimer2), slot0._longClick2BeginIntervalMs, nil, "BaseCcsBtn:_longClickTimer2")

			slot0._longClickTimer2:setAutoDispose(false)
		end
	else
		if slot0._longClickTimer2 then
			slot0._longClickTimer2:destroy()

			slot0._longClickTimer2 = nil
		end

		slot0:stopTick()
	end
end

BaseCcsBtn.onCanLongClickChanged = function (slot0)
	if slot0._canLongClick then
		if not slot0._longClickTimer then
			slot0._longClickTimer = TimerBase.new(handler(slot0, slot0.onLongClickTimer), slot0._longClickBeginIntervalMs, nil, "BaseCcsBtn:_longClickTimer")

			slot0._longClickTimer:setAutoDispose(false)
		end
	elseif slot0._longClickTimer then
		slot0._longClickTimer:destroy()

		slot0._longClickTimer = nil
	end
end

BaseCcsBtn.destroy = function (slot0)
	TickBase.destroy(slot0)
	slot0._touchSignal:removeAll()
	slot0._clickSignal:removeAll()
	slot0._clickWhenCantTouchSignal:removeAll()
	slot0._touchBeginWhenCantTouchSignal:removeAll()
	slot0._longClickSignal:removeAll()

	if slot0._longClickTimer then
		slot0._longClickTimer:destroy()

		slot0._longClickTimer = nil
	end

	slot0._longClick2Signal:removeAll()

	if slot0._longClickTimer2 then
		slot0._longClickTimer2:destroy()

		slot0._longClickTimer2 = nil
	end
end

return
