require("app.module.fishtd.Genesis.Framework.Facilities.ClassImp")

slot0 = class_C("WaterEffect", function ()
	return cc.Node:create()
end)

slot0.ctor = function (slot0)
	slot0:initSimulator()
	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			slot0:onEnter()
		elseif slot0 == "exit" then
			slot0:onExit()
		end
	end)
end

slot0.onEnter = function (slot0)
	slot0._touchEventListener = cc.EventListenerTouchOneByOne:create()

	slot0._touchEventListener:registerScriptHandler(function (slot0)
		return slot0:onTouchBegan(slot0)
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot0._touchEventListener:registerScriptHandler(function (slot0)
		slot0:onTouchMoved(slot0)
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot0._touchEventListener:setSwallowTouches(false)
	slot0:getEventDispatcher():addEventListenerWithFixedPriority(slot0._touchEventListener, -2)
	slot0:setContentSize(cc.Director:getInstance():getVisibleSize())
end

slot0.onExit = function (slot0)
	slot0:getEventDispatcher():removeEventListener(slot0._touchEventListener)
end

slot0.onTouchBegan = function (slot0, slot1)
	if slot0._simulator then
		slot0._simulator:setTouchPoint(slot1:getLocation().x, slot1:getLocation().y)
	end

	return true
end

slot0.onTouchMoved = function (slot0, slot1)
	if slot0._simulator then
		slot0._simulator:setTouchPoint(slot1:getLocation().x, slot1:getLocation().y)
	end
end

slot0.initSimulator = function (slot0)
	slot0._simulator = custom.WaterSimulate:create()

	if slot0._simulator then
		slot0:addChild(slot0._simulator)
	end
end

return slot0
