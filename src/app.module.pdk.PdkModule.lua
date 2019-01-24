slot0 = class(slot1)
slot3 = "pdk.model.PdkModel"

requireLuaFromModule("PdkModule")

slot3 = "pdk.model.PdkModel+Report"

requireLuaFromModule("PdkModule")

slot3 = "pdk.controller.PdkController"

requireLuaFromModule("PdkModule")

slot3 = "pdk.controller.PdkController+Server"

requireLuaFromModule("PdkModule")

slot3 = "pdk.controller.PdkController+PromptCard"

requireLuaFromModule("PdkModule")

slot3 = "pdk.controller.PdkController+EstimateCard"

requireLuaFromModule("PdkModule")

slot3 = "pdk.controller.PdkController+FindCard"

requireLuaFromModule("PdkModule")

slot3 = "pdk.controller.PdkController+Report"

requireLuaFromModule("PdkModule")

slot3 = "pdk.controller.PdkController+SmartLine"

requireLuaFromModule("PdkModule")

slot3 = "pdk.controller.PdkController+View"

requireLuaFromModule("PdkModule")

slot3 = "pdk.controller.PdkController+Util"

requireLuaFromModule("PdkModule")

slot3 = "pdk.view.PdkView"

requireLuaFromModule("PdkModule")

slot0.ctor = function (slot0)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot0.model = PdkModel.new()
	slot3 = slot0.model
	slot0.controller = PdkController.new(slot2)
	slot4 = slot0.controller
	slot0.view = PdkView.new(slot2, slot0.model)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot13 = slot5

	BaseGameModule.show(slot7, slot0, slot1, slot2, slot3, slot4)
end

ProxyPdk = slot0.new()

return ProxyPdk
