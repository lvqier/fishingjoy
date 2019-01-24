slot0 = class(slot1)
slot3 = "ddz.model.DdzModel"

requireLuaFromModule("DdzModule")

slot3 = "ddz.model.DdzModel+Report"

requireLuaFromModule("DdzModule")

slot3 = "ddz.controller.DdzController"

requireLuaFromModule("DdzModule")

slot3 = "ddz.controller.DdzController+Server"

requireLuaFromModule("DdzModule")

slot3 = "ddz.controller.DdzController+PromptCard"

requireLuaFromModule("DdzModule")

slot3 = "ddz.controller.DdzController+EstimateCard"

requireLuaFromModule("DdzModule")

slot3 = "ddz.controller.DdzController+FindCard"

requireLuaFromModule("DdzModule")

slot3 = "ddz.controller.DdzController+Report"

requireLuaFromModule("DdzModule")

slot3 = "ddz.controller.DdzController+Util"

requireLuaFromModule("DdzModule")

slot3 = "ddz.controller.DdzController+View"

requireLuaFromModule("DdzModule")

slot3 = "ddz.controller.DdzController+SmartLine"

requireLuaFromModule("DdzModule")

slot3 = "ddz.view.DdzView"

requireLuaFromModule("DdzModule")

slot0.ctor = function (slot0)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot0.model = DdzModel.new()
	slot3 = slot0.model
	slot0.controller = DdzController.new(slot2)
	slot4 = slot0.controller
	slot0.view = DdzView.new(slot2, slot0.model)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot13 = slot5

	BaseGameModule.show(slot7, slot0, slot1, slot2, slot3, slot4)
end

ProxyDdz = slot0.new()

return ProxyDdz
