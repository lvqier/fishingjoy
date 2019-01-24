slot0 = ClassLoader:aquireClass("Tools")
slot1 = ClassLoader:aquireClass("CannonBottom")
slot2 = ClassLoader:aquireClass("ButtonWrapper")
slot3 = class_C("CannonBottomSelf", function (...)
	return slot0:create(...)
end)

slot3.ctor = function (slot0)
	slot1 = slot0:seekChildByName(slot0._cannonNode, "Button_Plus")
	slot6, slot3 = slot1:getPosition()

	slot1:setLocalZOrder(1)
	slot1:setPosition(slot2, slot3 + 15)

	slot0._addButton = slot1:wrapWithType(slot1, "CHECK_BOUND_WITH_CANCEL")
	slot4 = slot0:seekChildByName(slot0._cannonNode, "Button_Minus")
	slot9, slot6 = slot4:getPosition()

	slot4:setLocalZOrder(1)
	slot4:setPosition(slot5, slot6 + 15)

	slot0._minusButton = slot1:wrapWithType(slot4, "CHECK_BOUND_WITH_CANCEL")

	slot0:registerClickHandler()
end

slot3.registerClickHandler = function (slot0)
	slot0._addButton:setClickEventHandler(slot1)
	slot0._minusButton:setClickEventHandler(function ()
		slot0._world:triggerEvent("DECREASE_CANNON_BASE")
	end)
end

slot3.enableButtons = function (slot0)
	slot0._addButton:enable()
	slot0._minusButton:enable()
	slot0:seekChildByName(slot0._cannonNode, "Button_Plus").loadTexture(slot1, "gameres/module/fishtd/ui/common/cannon/jiahao.png")
	slot0:seekChildByName(slot0._cannonNode, "Button_Minus"):loadTexture("gameres/module/fishtd/ui/common/cannon/jianhao.png")
end

slot3.disableButtons = function (slot0)
	slot0._addButton:disable()
	slot0._minusButton:disable()
	slot0:seekChildByName(slot0._cannonNode, "Button_Plus").loadTexture(slot1, "gameres/module/fishtd/ui/common/cannon/jiahao_disable.png")
	slot0:seekChildByName(slot0._cannonNode, "Button_Minus"):loadTexture("gameres/module/fishtd/ui/common/cannon/jianhao_disable.png")
end

return slot3
