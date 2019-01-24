slot0 = ClassLoader:aquireClass("Tools")
slot1 = ClassLoader:aquireClass("CannonTop")
slot2 = ClassLoader:aquireClass("ButtonWrapper")
slot3 = class_C("CannonTopSelf", function (...)
	return slot0:create(...)
end)

slot3.ctor = function (slot0)
	slot1 = slot0:seekChildByName(slot0._cannonNode, "Button_Plus")
	slot0._addButton = slot1:wrapWithType(slot1, "CHECK_BOUND_WITH_CANCEL")
	slot0._minusButton = slot1:wrapWithType(slot0:seekChildByName(slot0._cannonNode, "Button_Minus"), "CHECK_BOUND_WITH_CANCEL")

	slot0:registerClickHandler()
end

slot3.registerClickHandler = function (slot0)
	slot0._addButton:setClickEventHandler(slot1)
	slot0._minusButton:setClickEventHandler(function ()
		slot0._world:triggerEvent("DECREASE_CANNON_BASE")
	end)
end

return slot3
