LoginWechatCcsView = class("LoginWechatCcsView")

LoginWechatCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._inputWxGzh = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputWechat)
end

LoginWechatCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	slot0._inputWxGzh:show()
end

LoginWechatCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
	slot0.model:setValidateSmsCode("")
	slot0._inputWxGzh:setText("")
	slot0._inputWxGzh:hide()
end

LoginWechatCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsLoginWechatShowing(false)
	elseif slot1 == slot0.view.btnConfirm then
		slot0.controller:requestValidateWechat(slot0._inputWxGzh:getText())
	end
end

LoginWechatCcsView.destroy = function (slot0)
	destroySomeObj(slot0._inputWxGzh)
	destroySomeObj(slot0.view.btnClose)
	ZoomPopUpChildView.destroy(slot0)
end

return
