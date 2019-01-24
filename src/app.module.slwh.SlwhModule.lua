slot0 = class(slot1)
slot3 = "slwh.TreeConstant"

requireLuaFromModule("SlwhModule")

slot3 = "slwh.model.SlwhModel"

requireLuaFromModule("SlwhModule")

slot3 = "slwh.controller.SlwhController"

requireLuaFromModule("SlwhModule")

slot3 = "slwh.view.SlwhView"

requireLuaFromModule("SlwhModule")

slot0.ctor = function (slot0)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot0.model = SlwhModel.new()
	slot3 = slot0.model
	slot0.controller = SlwhController.new(slot2)
	slot4 = slot0.controller
	slot0.view = SlwhView.new(slot2, slot0.model)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot13 = slot5

	BaseGameModule.show(slot7, slot0, slot1, slot2, slot3, slot4)
end

ProxySlwh = slot0.new()

return ProxySlwh
