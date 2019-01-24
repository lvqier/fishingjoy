slot0 = class("SerialModule")

requireLuaFromModule("serial.SerialConstants")
requireLuaFromModule("serial.model.SerialModel")
requireLuaFromModule("serial.controller.SerialController")
requireLuaFromModule("serial.view.SerialView")

slot0.ctor = function (slot0)
	ClassUtil.extends(slot0, BaseGameModule, true)

	slot0.model = SerialModel.new()
	slot0.controller = SerialController.new(slot0.model)
	slot0.view = SerialView.new(slot0.model, slot0.controller)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	BaseGameModule.show(slot0, slot1, slot2, slot3, slot4, slot5)
end

ProxySerial = slot0.new()

return ProxySerial
