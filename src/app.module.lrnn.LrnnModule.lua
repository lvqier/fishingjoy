slot0 = class(slot1)
slot3 = "lrnn.model.LrnnModel"

requireLuaFromModule("LrnnModule")

slot3 = "lrnn.controller.LrnnController"

requireLuaFromModule("LrnnModule")

slot3 = "lrnn.controller.LrnnController+Server"

requireLuaFromModule("LrnnModule")

slot3 = "lrnn.controller.LrnnController+Logic"

requireLuaFromModule("LrnnModule")

slot3 = "lrnn.view.LrnnView"

requireLuaFromModule("LrnnModule")

slot0.ctor = function (slot0, ...)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot0.model = LrnnModel.new()
	slot3 = slot0.model
	slot0.controller = LrnnController.new(slot2)
	slot4 = slot0.controller
	slot0.view = LrnnView.new(slot2, slot0.model)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot13 = slot5

	BaseGameModule.show(slot7, slot0, slot1, slot2, slot3, slot4)
end

ProxyLrnn = slot0.new()

return ProxyLrnn
