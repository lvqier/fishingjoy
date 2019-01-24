slot0 = class("LoginModule")

require("app.module.login.model.LoginModel")
require("app.module.login.controller.LoginController")
require("app.module.login.view.LoginView")

CLIENT_VERSION = CLIENT_VERSION or "1.0.0"

slot0.ctor = function (slot0, ...)
	slot0._isShowing = false
end

slot0.initMvc = function (slot0)
	if not slot0.model then
		slot0.model = LoginModel.new()
		slot0.controller = LoginController.new(slot0.model)
		slot0.view = LoginView.new(slot0.model, slot0.controller)
	end
end

slot0.show = function (slot0, slot1)
	audioMgr:playMainMusic()
	slot0:initMvc()

	slot0._isShowing = true

	slot0.controller:resetState4LoginShow()
	slot0.model:setLoginSuccessCallback(slot1)

	function slot2()
		uiMgr:setIsScreenOrientationRotated(false)
		uiMgr.setIsScreenOrientationRotated.view:show()
		uiMgr.setIsScreenOrientationRotated.view.show.controller:checkServerState()
	end

	if uiMgr:getCurSceneType() == SceneType.scene_login then
		slot2()
	else
		slot0.view:hide()
		uiMgr:showScene(SceneType.scene_login, nil, slot2, not mainMgr:getIsRelogining())
	end
end

slot0.isShowingLoading = function (slot0)
	return slot0:isShowing() and slot0.model ~= nil and slot0.model:getIsShowingLoadingPane()
end

slot0.isShowing = function (slot0)
	return slot0._isShowing
end

slot0.hide = function (slot0, ...)
	slot0.view:hide(...)

	slot0._isShowing = false
end

slot0.updateLoadingInfo = function (slot0, slot1, slot2, slot3, slot4)
	if slot0.model then
		slot0.controller:updateLoadingInfo(slot1, slot2, slot3, slot4)
	end
end

slot0.destroy = function (slot0)
	if slot0.view then
		slot0.view:destroy()
		slot0.controller:destroy()
		slot0.model:destroy()

		slot0.model = nil
		slot0.controller = nil
		slot0.view = nil
		slot0._isShowing = false

		return true
	end

	return false
end

ProxyLogin = slot0.new()

return ProxyLogin
