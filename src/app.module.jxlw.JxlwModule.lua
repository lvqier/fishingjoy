slot0 = class(slot1)
slot3 = "jxlw.model.JxlwModel"

requireLuaFromModule("JxlwModule")

slot3 = "jxlw.controller.JxlwController"

requireLuaFromModule("JxlwModule")

slot3 = "jxlw.view.JxlwView"

requireLuaFromModule("JxlwModule")

slot0.ctor = function (slot0, ...)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot0.model = JxlwModel.new()
	slot3 = slot0.model
	slot0.controller = JxlwController.new(slot2)
	slot4 = slot0.controller
	slot0.view = JxlwView.new(slot2, slot0.model)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot13 = slot5

	BaseGameModule.show(slot7, slot0, slot1, slot2, slot3, slot4)
end

ProxyJxlw = slot0.new()

return ProxyJxlw
