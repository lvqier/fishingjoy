requireLuaFromModule("shz.model.ShzModel")
requireLuaFromModule("shz.controller.ShzController")
requireLuaFromModule("shz.view.ShzView")

class("ShzModule").ctor = function (slot0, ...)
	ClassUtil.extends(slot0, BaseGameModule, true)

	slot0.model = ShzModel.new()
	slot0.controller = ShzController.new(slot0.model)
	slot0.view = ShzView.new(slot0.model, slot0.controller)
end

ProxyShz = class("ShzModule").new()

return ProxyShz
