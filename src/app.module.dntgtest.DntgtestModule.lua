slot0 = class(slot1)
slot3 = "dntgtest.fishConfig.init"

requireLuaFromModule("DntgtestModule")

slot3 = "dntgtest.model.DntgtestModel"

requireLuaFromModule("DntgtestModule")

slot3 = "dntgtest.model.DntgtestModel+Cannon"

requireLuaFromModule("DntgtestModule")

slot3 = "dntgtest.model.DntgtestModel+Player"

requireLuaFromModule("DntgtestModule")

slot3 = "dntgtest.controller.DntgtestController"

requireLuaFromModule("DntgtestModule")

slot3 = "dntgtest.controller.DntgtestController+TimeService"

requireLuaFromModule("DntgtestModule")

slot3 = "dntgtest.controller.DntgtestController+MathAide"

requireLuaFromModule("DntgtestModule")

slot3 = "dntgtest.controller.DntgtestController+SoundManager"

requireLuaFromModule("DntgtestModule")

slot3 = "dntgtest.view.DntgtestView"

requireLuaFromModule("DntgtestModule")

if DNTGTEST_IS_ANDROID_PLATFORM then
else
	slot3 = "dntgtest.dntgLogic.MyFishObjectManager"

	requireLuaFromModule(slot2)

	slot3 = "dntgtest.dntgLogic.MoveCompent"

	requireLuaFromModule(slot2)
end

slot0.ctor = function (slot0)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot0.model = DntgtestModel.new()
	slot3 = slot0.model
	slot0.controller = DntgtestController.new(slot2)
	slot4 = slot0.controller
	slot0.view = DntgtestView.new(slot2, slot0.model)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot13 = slot5

	BaseGameModule.show(slot7, slot0, slot1, slot2, slot3, slot4)
end

ProxyDntgtest = slot0.new()

return ProxyDntgtest
