slot3 = "dzpk.model.DzpkModel"

requireLuaFromModule("DzpkModule")

slot3 = "dzpk.controller.DzpkController"

requireLuaFromModule("DzpkModule")

slot3 = "dzpk.view.DzpkView"

requireLuaFromModule("DzpkModule")

class(slot1).ctor = function (slot0)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot0.model = DzpkModel.new()
	slot3 = slot0.model
	slot0.controller = DzpkController.new(slot2)
	slot4 = slot0.controller
	slot0.view = DzpkView.new(slot2, slot0.model)
end

ProxyDzpk = class(slot1).new()

return ProxyDzpk
