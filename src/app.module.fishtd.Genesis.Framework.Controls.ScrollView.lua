slot0 = ClassLoader:aquireClass("BaseNode")
slot1 = ClassLoader:aquireClass("Tools")
slot2 = class_C("ScrollView", function ()
	return slot0:create()
end)

slot2.ctor = function (slot0)
	slot0:testInit()

	slot0._touchOffset = {
		x = 0,
		y = 0
	}
end

slot2.testInit = function (slot0)
	slot0._backgroundLayer = cc.LayerColor:create(cc.c4b(0, 0, 0, 200))

	slot0._backgroundLayer:setTouchEnabled(false)
	slot0:addChild(slot0._backgroundLayer, 0)

	slot0._container = cc.Node:create()

	slot0:addChild(slot0._container)

	for slot4 = 0, 9, 1 do
		slot5 = cc.Sprite:create("fishgame2d/PreviewUI/FishGameEntrance/xuanchang_1.png")

		slot5:setPosition(slot5:getContentSize().width * slot4, 320)
		slot0._container:addChild(slot5)
	end
end

slot2.onEnter = function (slot0)
	slot0:registerTouchEventListener()
	slot0:scheduleUpdateWithPriorityLua(slot0:thisCall(slot1.updateContainerPosition, slot0), 1)
end

slot2.onExit = function (slot0)
	slot0:unregisterTouchEventListener()
end

slot2.registerTouchEventListener = function (slot0)
	slot0._touchEventListener = cc.EventListenerTouchOneByOne:create()

	slot0._touchEventListener:registerScriptHandler(slot0:thisCall(slot1.onTouchBegan, slot0), cc.Handler.EVENT_TOUCH_BEGAN)
	slot0._touchEventListener:registerScriptHandler(slot0:thisCall(slot1.onTouchMoved, slot0), cc.Handler.EVENT_TOUCH_MOVED)
	slot0._touchEventListener:registerScriptHandler(slot0:thisCall(slot1.onTouchEnded, slot0), cc.Handler.EVENT_TOUCH_ENDED)
	slot0._touchEventListener:setSwallowTouches(true)
	slot0:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot0._touchEventListener, slot0)
end

slot2.unregisterTouchEventListener = function (slot0)
	slot0:getEventDispatcher():removeEventListener(slot0._touchEventListener)
end

slot2.onTouchBegan = function (slot0, slot1)
	slot0._lastPosition = slot1:getLocation()
	slot0._moved = false

	return true
end

slot2.onTouchMoved = function (slot0, slot1)
	slot0._currentPosition = slot1:getLocation()

	if math.abs(slot0._currentPosition.x - slot0._lastPosition.x) < 1 then
		slot0._moved = false
	else
		slot0._touchOffset.x = slot0._currentPosition.x - slot0._lastPosition.x
		slot0._touchOffset.y = slot0._currentPosition.y - slot0._lastPosition.y
		slot0._lastPosition = slot0._currentPosition
		slot0._moved = true
	end
end

slot2.onTouchEnded = function (slot0, slot1)
	return
end

slot2.updateContainerPosition = function (slot0)
	if slot0._moved then
		slot0._moved = false
	else
		slot0._touchOffset.x = slot0._touchOffset.x * 0.9
		slot0._touchOffset.y = slot0._touchOffset.y * 0.9
	end

	slot1, slot2 = slot0._container:getPosition()

	slot0._container:setPosition(slot1 + slot0._touchOffset.x, slot2 + slot0._touchOffset.y)
end

return slot2
