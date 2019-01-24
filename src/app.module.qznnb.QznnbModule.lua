slot0 = class("QznnbModule")

requireLuaFromModule("qznnb.model.QznnbModel")
requireLuaFromModule("qznnb.controller.QznnbController")
requireLuaFromModule("qznnb.controller.QznnbController+Server")
requireLuaFromModule("qznnb.controller.QznnbController+Logic")
requireLuaFromModule("qznnb.view.QznnbView")

slot0.ctor = function (slot0, ...)
	ClassUtil.extends(slot0, BaseGameModule, true)

	slot0.model = QznnbModel.new()
	slot0.controller = QznnbController.new(slot0.model)
	slot0.view = QznnbView.new(slot0.model, slot0.controller)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	BaseGameModule.show(slot0, slot1, slot2, slot3, slot4, slot5)
end

ProxyQznnb = slot0.new()

return ProxyQznnb
