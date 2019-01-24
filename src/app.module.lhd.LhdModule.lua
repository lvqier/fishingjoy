slot0 = class("LhdModule")

requireLuaFromModule("lhd.common.LhdDefine")
requireLuaFromModule("lhd.common.LhdConfigDataFunc")
requireLuaFromModule("lhd.common.LhdPublicFunc")
requireLuaFromModule("lhd.model.LhdModel")
requireLuaFromModule("lhd.controller.LhdController")
requireLuaFromModule("lhd.view.LhdView")

slot0.ctor = function (slot0)
	ClassUtil.extends(slot0, BaseGameModule, true)

	slot0.model = LhdModel.new()
	slot0.controller = LhdController.new(slot0.model)
	slot0.view = LhdView.new(slot0.model, slot0.controller)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	BaseGameModule.show(slot0, slot1, slot2, slot3, slot4, slot5)
end

ProxyLhd = slot0.new()

return ProxyLhd
