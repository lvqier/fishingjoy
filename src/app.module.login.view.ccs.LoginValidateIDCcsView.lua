LoginValidateIDCcsView = class("LoginValidateIDCcsView")

LoginValidateIDCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._inputID = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputID)
end

LoginValidateIDCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	slot0._inputID:show()
end

LoginValidateIDCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
	slot0._inputID:hide()
end

LoginValidateIDCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.btnConfirm then
		if StringUtil.isStringValid(slot0._inputID:getText()) then
			slot0.model:setIsValidateIDShowing(false)
			slot0.controller:requestLoginWithValidate(slot0.model:getAccount(), slot0.model:getPw(), slot0.model:getValidateType(), slot2, function ()
				slot0.model:setIsValidateIDShowing(true)
			end)
		else
			tweenMsgMgr:showRedMsg("请输入身份证号码！")
		end
	elseif slot1 == slot0.view.btnClose then
		slot0.model:setIsValidateIDShowing(false)
	end
end

LoginValidateIDCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.btnConfirm)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0._inputID)
	ZoomPopUpChildView.destroy(slot0)
end

return
