slot0 = class("DragonExploreView", function ()
	return cc.LayerColor:create(cc.c4b(0, 0, 0, 128))
end)

slot0.ctor = function (slot0, slot1, slot2, slot3)
	slot0._score_reward = slot1
	slot0.controller = slot2

	slot0:initUI(slot3)
end

slot0.initUI = function (slot0, slot1)
	slot0:setPositionX(slot1)

	slot0._skeleton = sp.SkeletonAnimation:create(Serial.Serial_Root .. "reward/lhdb_tbdj.json", Serial.Serial_Root .. "reward/lhdb_tbdj.atlas")

	slot0._skeleton:setAnimation(0, "start", false)
	slot0._skeleton:addAnimation(0, "idle", true)
	slot0._skeleton:setPosition(667 - slot1, slot3)
	slot0:addChild(slot0._skeleton)

	slot0._rollText2 = SerialCacheManager:getCacheObject("rolling_text_tanbao", slot4)
	slot5, slot6, slot7 = SerialFunc.computeIntegerReminder(slot0._score_reward)

	slot0._rollText2:setNumber(slot8)
	slot0._rollText2:setCascadeOpacityEnabled(true)
	slot0._rollText2:setName("rolling_text_tanbao")
	slot0:addChild(slot0._rollText2)

	slot0._button = ccui.Button:create(Serial.Serial_Root .. "ingame/fanhuiyouxi.png", Serial.Serial_Root .. "ingame/fanhuiyouxi.png", Serial.Serial_Root .. "ingame/fanhuiyouxi.png")

	slot0._button:setPosition(689 - slot1, 141)
	slot0._button:addTouchEventListener(c_func(slot0.onButtonClick_Back, slot0))
	slot0:addChild(slot0._button)

	slot0._event_listener_mask = cc.EventListenerTouchOneByOne:create()

	slot0._event_listener_mask:registerScriptHandler(function ()
		return true
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot0._event_listener_mask:registerScriptHandler(function ()
		return
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot0._event_listener_mask:registerScriptHandler(function ()
		return
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0._event_listener_mask:setSwallowTouches(true)
	slot0:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot0._event_listener_mask, slot0)
	slot0._rollText2:setPosition(678 - slot1 - (slot7 * 39 + (math.ceil(slot7 / 3) - 1) * 17) * 0.5, 217.5)
	slot0._button:setVisible(false)
	slot0._rollText2:setVisible(false)
	slot0:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
		slot0._rollText2:setVisible(true)
		slot0._rollText2.setVisible._rollText2:addNumber2u(slot0._score_reward)
	end)))
	slot0._button:runAction(cc.Sequence:create(cc.DelayTime:create(1.5), cc.Show:create()))
end

slot0.onButtonClick_Back = function (slot0, slot1, slot2)
	if slot2 == ccui.TouchEventType.ended then
		slot0._button:setEnabled(false)
		slot0._skeleton:setAnimation(0, "end", false)
		slot0:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(c_func(slot0.onDestroy, slot0))))
	end
end

slot0.onButtonClick_Hall = function (slot0, slot1, slot2)
	if slot2 == ccui.TouchEventType.ended then
		slot0:onDestroy()
		slot0.controller:try2ExitBattle()
	end
end

slot0.onDestroy = function (slot0)
	slot0:getEventDispatcher():removeEventListener(slot0._event_listener_mask)
	EventController:dispatchEvent(Serial.Event.dragonRewardUIClose)
end

return slot0
