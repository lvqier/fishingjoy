slot0 = ClassLoader:aquireClass("Tools")
slot1 = ClassLoader:aquireClass("BaseNode")
slot2 = class_C("ButtonWrapper", function ()
	return slot0:create()
end)
slot2.SCALE_ACTION_TAG = 9807

slot2.ctor = function (slot0)
	slot0._moveDetectionThreshold = 30
	slot0._expandScale = 1
	slot0._enabled = true
	slot0._detectMove = false
	slot0._detectOutOfBound = false
	slot0._cancelled = false
	slot0._autoCancel = false

	slot0._onClicked = function ()
		return
	end

	slot0._touchBeginPosition = cc.p(0, 0)
	slot0._shinkThreshold = 0.9

	slot0:createEventHandler()
end

slot2.onEnter = function (slot0)
	print("Button Wrapper Enter")

	slot0._touchEventHandler = cc.EventListenerTouchOneByOne:create()

	slot0._touchEventHandler:registerScriptHandler(function (slot0)
		return slot0:defaultBeganHandler(slot0)
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot0._touchEventHandler:registerScriptHandler(function (slot0)
		slot0:defaultEndedHandler(slot0)
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0._touchEventHandler:registerScriptHandler(function (slot0)
		slot0:defaultCancelledHandler(slot0)
	end, cc.Handler.EVENT_TOUCH_CANCELLED)
	slot0._touchEventHandler:registerScriptHandler(function (slot0)
		slot0:defaultMovedHandler(slot0)
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot0._touchEventHandler:setSwallowTouches(true)
	slot0:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot0._touchEventHandler, slot0)
end

slot2.onExit = function (slot0)
	slot0:getEventDispatcher():removeEventListener(slot0._touchEventHandler)
end

slot2.createEventHandler = function (slot0)
	return
end

slot2.defaultBeganHandler = function (slot0, slot1)
	if slot0._enabled and slot0:touchHitTest(slot0:getParent(), slot1, slot0._expandScale) then
		slot0:getParent():stopActionByTag(slot1.SCALE_ACTION_TAG)
		slot0:getParent():setScale(slot0._shinkThreshold)

		slot0._touchBeginPosition = slot1:getLocation()
		slot0._moved = false
		slot0._cancelled = false

		return true
	else
		return false
	end
end

slot2.defaultEndedHandler = function (slot0, slot1)
	slot0:getParent():retain()

	if not slot0._cancelled then
		slot0._onClicked()
	end

	if not slot0._autoCancel or (slot0._autoCancel and not slot0._cancelled) then
		slot0:playUpAnimation()
	end

	slot2:release()
end

slot2.defaultCancelledHandler = function (slot0, slot1)
	if not slot0._autoCancel or (slot0._autoCancel and not slot0._cancelled) then
		slot0:playUpAnimation()
	end
end

slot2.defaultMovedHandler = function (slot0, slot1)
	if not slot0._cancelled and slot0._detectMove and slot0._moveDetectionThreshold < cc.pGetDistance(slot0._touchBeginPosition, slot1:getLocation()) then
		slot0._cancelled = true

		if slot0._autoCancel then
			slot0:playUpAnimation()
		end
	end

	if not slot0._cancelled and slot0._detectOutOfBound and not slot0:touchHitTest(slot0:getParent(), slot1, slot0._expandScale) then
		slot0._cancelled = true

		if slot0._autoCancel then
			slot0:playUpAnimation()
		end
	end
end

slot2.wrap = function (slot0, slot1, slot2, slot3)
	if slot1 then
		if slot2 == nil then
			slot2 = 0
		end

		if slot3 == nil then
			slot3 = "ButtonWrapper"
		end

		slot0:setName(slot3)
		slot1:addChild(slot0, slot2)
	end
end

slot2.setClickEventHandler = function (slot0, slot1)
	slot0._onClicked = slot1
end

slot2.expandTouchRegion = function (slot0, slot1)
	slot0._expandScale = 1 + slot1
end

slot2.enable = function (slot0)
	slot0._enabled = true
end

slot2.disable = function (slot0)
	slot0._enabled = false
end

slot2.enableMoveDetection = function (slot0)
	slot0._detectMove = true
end

slot2.disableMoveDetection = function (slot0)
	slot0._detectMove = false
end

slot2.enableOutOfBoundDetection = function (slot0)
	slot0._detectOutOfBound = true
end

slot2.disableOutOfBoundDetection = function (slot0)
	slot0._detectOutOfBound = false
end

slot2.enableSwallowTouch = function (slot0)
	slot0._touchEventHandler:setSwallowTouches(true)
end

slot2.disableSwallowTouch = function (slot0)
	slot0._touchEventHandler:setSwallowTouches(false)
end

slot2.enableAutoCancel = function (slot0)
	slot0._autoCancel = true
end

slot2.disableAutoCancel = function (slot0)
	slot0._autoCancel = false
end

slot2.playDownAnimation = function (slot0)
	slot0:stopUpAnimation()
	slot0:getParent():setScale(0.9)
end

slot2.playUpAnimation = function (slot0)
	slot1 = cc.ScaleTo:create(0.15, 1)

	slot1:setTag(slot0.SCALE_ACTION_TAG)
	slot0:getParent():runAction(slot1)
end

slot2.stopUpAnimation = function (slot0)
	slot0:getParent():stopActionByTag(slot0.SCALE_ACTION_TAG)
end

slot2.setShrinkThreshold = function (slot0, slot1)
	slot0._shinkThreshold = slot1
end

slot2.factory = function (slot0, slot1)
	slot2 = slot0:create()

	if slot0.PREDEFINED_TYPE[slot1] then
		for slot7, slot8 in ipairs(slot3) do
			slot2[slot8] = true
		end
	end

	return slot2
end

slot2.wrapWithType = function (slot0, slot1, slot2, slot3, slot4)
	slot0:factory(slot2):expandTouchRegion((slot3 and slot3) or 0)
	slot5:setClickEventHandler((slot4 and slot4) or function ()
		return
	end)
	slot5:wrap(slot1, 0, string.format("%s_wrapper", slot1:getName()))

	return slot5
end

slot2.PREDEFINED_TYPE = {
	STANDARD = {},
	CHECK_BOUND = {
		"_detectOutOfBound"
	},
	CHECK_MOVE = {
		"_detectMove"
	},
	ALL_CHECK = {
		"_detectMove",
		"_detectOutOfBound"
	},
	CHECK_BOUND_WITH_CANCEL = {
		"_autoCancel",
		"_detectOutOfBound"
	},
	CHECK_MOVE_WITH_CANCEL = {
		"_autoCancel",
		"_detectMove"
	},
	ALL_CHECK_WITH_CANCEL = {
		"_autoCancel",
		"_detectMove",
		"_detectOutOfBound"
	}
}

return slot2
