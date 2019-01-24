requireLuaFromModule("hlssm.model.HlssmModel")
requireLuaFromModule("hlssm.controller.HlssmController")
requireLuaFromModule("hlssm.view.HlssmView")

class("HlssmModule").ctor = function (slot0)
	ClassUtil.extends(slot0, BaseGameModule, true)

	slot0.model = HlssmModel.new()
	slot0.controller = HlssmController.new(slot0.model)
	slot0.view = HlssmView.new(slot0.model, slot0.controller)
end

ProxyHlssm = class("HlssmModule").new()

return ProxyHlssm
