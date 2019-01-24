slot0 = class_C("LockSelector", ClassLoader:aquireClass("GameObject"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("position")
	slot0:addProperty("collisionEnabled")
	slot0:addProperty("collisionTarget")
	slot0:addProperty("boneData")
	slot0:addProperty("isDead")
	slot0:addProperty("touchLocation")
	slot0:addProperty("timeoutFlag")
	slot0:startListen("TOUCH_BEGAN")
	slot0:startListen("TOUCH_ENDED")

	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0.positionNode = cc.Node:create()
	slot0.effectLayer = ClassLoader:aquireSingleton("CocosLayerManager"):getLayer("EffectLayer")

	slot0.effectLayer:addChild(slot0.positionNode, 0)
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("position", {
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("boneData")
	slot0:setValue("isDead", false)
	slot0:setValue("collisionEnabled", true)
	slot0:setValue("touchLocation", {
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("timeoutFlag", false)
	slot0:setValue("collisionTarget", {})
end

slot0.on_position_changed = function (slot0)
	if slot0.gameConfig.PLATFORM_ANDROID then
		slot0.positionNode:setPosition(slot0.position._value)
		slot0.boneData:trigger(slot0.positionNode)
	else
		slot0:setValue("boneData", {
			transformation = PathMath.getTranslationMatrix(slot1)
		})
	end
end

slot0.handle_TOUCH_BEGAN = function (slot0, slot1)
	slot2 = {}

	if ClassLoader:aquireSingleton("GameConfig").MirrorFlag then
		slot2.x = ClassLoader:aquireSingleton("GameConfig").Width - slot1.location.x
		slot2.y = ClassLoader:aquireSingleton("GameConfig").Height - slot1.location.y
	else
		slot2.x = slot1.location.x
		slot2.y = slot1.location.y
	end

	slot0:setValue("touchLocation", slot2)
	slot0:setValue("timeoutFlag", false)

	slot3 = cc.Sequence:create(cc.DelayTime:create(0.15), cc.CallFunc:create(function ()
		slot0._world:triggerEvent("START_AUTO_FIRE")
		slot0._world.triggerEvent:setValue("timeoutFlag", true)
	end))

	slot3:setTag(95278)
	cc.Director:getInstance():getNotificationNode():runAction(slot3)
end

slot0.handle_TOUCH_ENDED = function (slot0)
	cc.Director:getInstance():getNotificationNode():stopActionByTag(95278)

	if not slot0:getValue("timeoutFlag") then
		slot0:setValue("position", slot0:getValue("touchLocation"))
		slot0:setValue("collisionEnabled", true)
	end
end

return slot0
