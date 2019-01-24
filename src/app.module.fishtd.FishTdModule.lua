slot0 = class("FishTdModule")

require("app.module.fishtd.Genesis.Framework.Facilities.Initializer")
requireLuaFromModule("fishtd.model.FishTdModel")
requireLuaFromModule("fishtd.controller.FishTdController")
requireLuaFromModule("fishtd.controller.FishTdSoundController")
requireLuaFromModule("fishtd.view.FishTdView")

slot0.ctor = function (slot0)
	print("create module")
	ClassUtil.extends(slot0, BaseGameModule, true)

	slot0.model = FishTdModel.new()
	slot0.controller = FishTdController.new(slot0.model)
	slot0.view = FishTdView.new(slot0.model, slot0.controller)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.controller:clearMessageCache()
	BaseGameModule.show(slot0, slot1, slot2, slot3, slot4, slot5)

	if not cc.Camera:getDefaultCamera() or slot6:getNearPlane() < 200 then
		cc.Director:getInstance():getNotificationNode():runAction(cc.Sequence:create(cc.DelayTime:create(6), cc.CallFunc:create(function ()
			cc.Director:getInstance():getRunningScene().getDefaultCamera(slot0):initPerspective(60, cc.Director:getInstance():getWinSize().width / cc.Director.getInstance().getWinSize().height, 300, 5000)
		end)))
	end
end

ProxyFishTd = slot0.new()

return ProxyFishTd
