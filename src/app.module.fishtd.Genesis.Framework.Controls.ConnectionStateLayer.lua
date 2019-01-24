slot0 = ClassLoader:aquireClass("BaseNode")
slot1 = class_C("ConnectionStateLayer", function ()
	return slot0:create()
end)

slot1.ctor = function (slot0)
	slot0._stateText = cc.Label:createWithSystemFont("", "", 32)

	slot0:addChild(slot0._stateText, 1)

	slot0._backgroundLayer = cc.LayerColor:create(cc.c4b(0, 0, 0, 200))

	slot0._backgroundLayer:setTouchEnabled(false)
	slot0:addChild(slot0._backgroundLayer, 0)
end

slot1.onEnter = function (slot0)
	slot1 = cc.Director:getInstance():getVisibleSize()

	slot0._backgroundLayer:setContentSize(slot1)
	slot0._stateText:setPosition(slot1.width / 2, slot1.height / 2)

	slot0._touchEventListener = cc.EventListenerTouchOneByOne:create()

	slot0._touchEventListener:registerScriptHandler(function (slot0)
		return slot0:isVisible()
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot0._touchEventListener:setSwallowTouches(true)
	slot0:getEventDispatcher():addEventListenerWithFixedPriority(slot0._touchEventListener, -1)
end

slot1.onExit = function (slot0)
	slot0:getEventDispatcher():removeEventListener(slot0._touchEventListener)
end

slot1.changeState = function (slot0, slot1)
	slot0._stateText:setString(slot1)
end

return slot1
