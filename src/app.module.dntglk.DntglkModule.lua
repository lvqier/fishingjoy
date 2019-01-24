slot0 = class(slot1)
slot3 = "dntglk.fishConfig.init"

requireLuaFromModule("DntglkModule")

slot3 = "dntglk.model.DntglkModel"

requireLuaFromModule("DntglkModule")

slot3 = "dntglk.model.DntglkModel+Cannon"

requireLuaFromModule("DntglkModule")

slot3 = "dntglk.model.DntglkModel+Player"

requireLuaFromModule("DntglkModule")

slot3 = "dntglk.controller.DntglkController"

requireLuaFromModule("DntglkModule")

slot3 = "dntglk.controller.DntglkController+TimeService"

requireLuaFromModule("DntglkModule")

slot3 = "dntglk.controller.DntglkController+MathAide"

requireLuaFromModule("DntglkModule")

slot3 = "dntglk.controller.DntglkController+SoundManager"

requireLuaFromModule("DntglkModule")

slot3 = "dntglk.view.DntglkView"

requireLuaFromModule("DntglkModule")

slot1 = requireLuaFromModule("DntglkModule")
slot4 = "dntglk.dntgLogic.MoveCompent"
slot2 = requireLuaFromModule("dntglk.dntgLogic.MyFishObjectManager")

slot0.ctor = function (slot0)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot0.model = DntglkModel.new()
	slot3 = slot0.model
	slot0.controller = DntglkController.new(slot2)
	slot4 = slot0.controller
	slot0.view = DntglkView.new(slot2, slot0.model)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot13 = slot5

	BaseGameModule.show(slot7, slot0, slot1, slot2, slot3, slot4)
end

ProxyDntglk = slot0.new()

return ProxyDntglk
