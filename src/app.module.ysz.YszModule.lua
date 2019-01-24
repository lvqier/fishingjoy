slot3 = "ysz.model.YszModel"

requireLuaFromModule("YszModule")

slot3 = "ysz.controller.YszController"

requireLuaFromModule("YszModule")

slot3 = "ysz.view.YszView"

requireLuaFromModule("YszModule")

class(slot1).ctor = function (slot0)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot0.model = YszModel.new()
	slot3 = slot0.model
	slot0.controller = YszController.new(slot2)
	slot4 = slot0.controller
	slot0.view = YszView.new(slot2, slot0.model)
end

ProxyYsz = class(slot1).new()

return ProxyYsz
