slot0 = class_C("CannonVisual", ClassLoader:aquireClass("Visual"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("id", true)
	slot0:addProperty("cannonSet", true)
	slot0:addProperty("cannonType", true)
	slot0:addProperty("cannonBase", true)
	slot0:addProperty("cannonMul", true)
	slot0:addProperty("controllerName", true)
	slot0:addProperty("controllerScore", true)
	slot0:addProperty("controllerState", true)
	slot0:addProperty("openFire", true)
	slot0:addProperty("fireAngle", true)
	slot0:addProperty("controlledByPlayer", true)
	slot0:addProperty("coinPosition", true)
	slot0:addProperty("enableChangingBase", true)
	slot0:startListen("INCREASE_CANNON_BASE")
	slot0:startListen("DECREASE_CANNON_BASE")
	slot0:startListen("FISH3D_CMD_S_CANNON_SET")

	slot0._uiNode = nil
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0._mirrorPosition = {
		z = 0,
		x = 0,
		y = 0
	}
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
end

slot0.onLoad = function (slot0)
	slot0.super.onLoad(slot0)

	slot1 = slot0:getValue("owner")

	slot0:bindSameName("id", slot1, "TWO_WAY")
	slot0:bindSameName("cannonSet", slot1, "TWO_WAY")
	slot0:bindSameName("cannonType", slot1, "TWO_WAY")
	slot0:bindSameName("cannonBase", slot1, "TWO_WAY")
	slot0:bindSameName("cannonMul", slot1, "TWO_WAY")
	slot0:bindSameName("controllerName", slot1, "TWO_WAY")
	slot0:bindSameName("controllerScore", slot1, "TWO_WAY")
	slot0:bindSameName("controllerState", slot1, "TWO_WAY")
	slot0:bindSameName("openFire", slot1, "TWO_WAY")
	slot0:bindSameName("fireAngle", slot1, "TWO_WAY")
	slot0:bindSameName("controlledByPlayer", slot1, "TWO_WAY")
	slot0:bindSameName("coinPosition", slot1, "TWO_WAY")
	slot0:bindSameName("enableChangingBase", slot1, "TWO_WAY")
end

slot0.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
	slot0:unBindAll()
end

slot0.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)
	ClassLoader:aquireSingleton("CocosLayerManager"):getLayer("CannonLayer"):addChild(slot0._visualNode)

	if slot0._uiNode then
		slot0._uiNode:setGameWorld(slot1)
	end
end

slot0.onExit = function (slot0)
	slot0.super.onExit(slot0)
end

slot0.onUpdate = function (slot0)
	if slot0._uiNode then
		if slot0.gameConfig.MirrorFlag then
			slot0._uiNode._cannon:setRotation(270 - slot0.fireAngle._value)
		else
			slot0._uiNode._cannon:setRotation(90 - slot0.fireAngle._value)
		end
	end
end

slot0.on_position_changed = function (slot0)
	if slot0._uiNode then
		slot0._uiNode:setPosition(slot0:getValue("position"))
	end
end

slot0.on_cannonType_changed = function (slot0)
	if slot0._uiNode then
		slot0._uiNode:changeCannon(slot0:getValue("cannonSet"), slot0:getValue("cannonType"), slot0:getValue("cannonBase"), slot0:getValue("cannonMul"))
	end
end

slot0.on_cannonSet_changed = function (slot0)
	if slot0:getValue("cannonSet") == 1 then
		slot0._uiNode:disableButtons()
	else
		slot0._uiNode:enableButtons()
	end

	if slot0._uiNode then
		slot0._uiNode:changeCannon(slot0:getValue("cannonSet"), slot0:getValue("cannonType"), slot0:getValue("cannonBase"), slot0:getValue("cannonMul"))
	end
end

slot0.on_cannonBase_changed = function (slot0)
	if slot0._uiNode then
		slot0._uiNode:changeCannon(slot0:getValue("cannonSet"), slot0:getValue("cannonType"), slot0:getValue("cannonBase"), slot0:getValue("cannonMul"))
	end
end

slot0.on_controllerName_changed = function (slot0)
	if slot0._uiNode then
		slot0._uiNode:setPlayerName(slot0:getValue("controllerName"))
	end
end

slot0.on_controllerScore_changed = function (slot0)
	if slot0._uiNode then
		slot0._uiNode:setPlayerCoin(slot0:getValue("controllerScore"))
	end
end

slot0.on_controllerState_changed = function (slot0)
	if slot0._uiNode then
		slot0._uiNode:changeControllerState(slot0:getValue("controllerState"))
	end
end

slot0.on_openFire_changed = function (slot0)
	if slot0._uiNode then
		slot0._uiNode:fire()
	end
end

slot0.on_controlledByPlayer_changed = function (slot0)
	slot0:recreateUINode(slot0:getValue("id"), slot0:getValue("controlledByPlayer"))
end

slot0.on_id_changed = function (slot0)
	slot0:recreateUINode(slot0:getValue("id"), slot0:getValue("controlledByPlayer"))
end

slot0.recreateUINode = function (slot0, slot1, slot2)
	slot3 = (slot2 and "Self") or "Opponent"

	if slot0._uiNode then
		slot0._uiNode:onDestroy()

		slot0._uiNode = nil
	end

	if slot1 < 2 then
		if slot2 then
			slot0._visualNode:addChild(ClassLoader:aquireInstance("CannonBottomSelf", slot5))

			slot0._uiNode = ClassLoader.aquireInstance("CannonBottomSelf", slot5)

			slot0:refreshUINode()
		else
			slot0._visualNode:addChild(ClassLoader:aquireInstance("CannonBottom", slot5))

			slot0._uiNode = ClassLoader.aquireInstance("CannonBottom", slot5)

			slot0:refreshUINode()
		end
	elseif slot2 then
		slot0._visualNode:addChild(ClassLoader:aquireInstance("CannonTopSelf", slot5))

		slot0._uiNode = ClassLoader.aquireInstance("CannonTopSelf", slot5)

		slot0:refreshUINode()
	else
		slot0._visualNode:addChild(ClassLoader:aquireInstance("CannonTop", slot5))

		slot0._uiNode = ClassLoader.aquireInstance("CannonTop", slot5)

		slot0:refreshUINode()
	end

	slot0._uiNode:setGameWorld(slot0._world)
	slot0:setValue("coinPosition", slot0._uiNode:getCoinPosition())
end

slot0.refreshUINode = function (slot0)
	if slot0._uiNode then
		slot1 = cc.Director:getInstance():getVisibleSize()

		slot0._uiNode:setPosition(slot2)
		slot0._uiNode:setPlayerName(slot0:getValue("controllerName"))
		slot0._uiNode:setPlayerCoin(slot0:getValue("controllerScore"))
		slot0._uiNode:changeCannon(slot0:getValue("cannonSet"), slot0:getValue("cannonType"), slot0:getValue("cannonBase"), slot0:getValue("cannonMul"))
		slot0._uiNode:changeOrientation(slot0:getValue("fireAngle"))
		slot0._uiNode:changeControllerState(slot0:getValue("controllerState"))
		slot0:updateButton()
	end
end

slot0.on_enableChangingBase_changed = function (slot0)
	slot0:updateButton()
end

slot0.updateButton = function (slot0)
	if slot0._uiNode then
		if slot0:getValue("enableChangingBase") then
			slot0._uiNode:enableButtons()
		else
			slot0._uiNode:disableButtons()
		end
	end
end

slot0.onDestroy = function (slot0)
	slot0._mirrorPosition = nil

	slot0._uiNode:onDestroy()

	slot0._uiNode = nil

	slot0._visualNode:removeFromParent()
	slot0.super.onDestroy(slot0)
end

return slot0
