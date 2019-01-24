slot0 = class(slot1)
slot3 = "tgpd.CandyConstant"

requireLuaFromModule("TgpdModule")

slot3 = "tgpd.model.TgpdModel"

requireLuaFromModule("TgpdModule")

slot3 = "tgpd.controller.TgpdController"

requireLuaFromModule("TgpdModule")

slot3 = "tgpd.view.TgpdView"

requireLuaFromModule("TgpdModule")

slot0.ctor = function (slot0)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot0.model = TgpdModel.new()
	slot3 = slot0.model
	slot0.controller = TgpdController.new(slot2)
	slot4 = slot0.controller
	slot0.view = TgpdView.new(slot2, slot0.model)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot13 = slot5

	BaseGameModule.show(slot7, slot0, slot1, slot2, slot3, slot4)
end

ProxyTgpd = slot0.new()

return ProxyTgpd
