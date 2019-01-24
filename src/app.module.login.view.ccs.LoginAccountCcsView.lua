LoginAccountCcsView = class("LoginAccountCcsView")

LoginAccountCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._inputAccount = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputAccount)
	slot0._inputPw = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputPw)

	slot0._inputAccount:setText(Hero:getAccountLoginName())
	slot0._inputPw:setText(Hero:getAccountLoginPassword())

	slot1 = DisplayUtil.rgb2ccc3("#7A93AC")
	slot1.a = 255

	slot0._inputAccount:setPlaceHolderColor(slot1)
	slot0._inputPw:setPlaceHolderColor(slot1)
	slot0._inputPw:setInputFlag(0)
	slot0.view.cbAgreement:bindModelBoolProperty("isAgree")
	slot0.view.cbAgreement.txt_tf:setHtmlText("我已阅读并同意" .. HtmlUtil.createColorTxt("《" .. YOUXIMINGZI .. "服务协议》", "#86D7FF"))

	if IS_IOS_VERIFY and IS_REGISTER_BY_PHONE_NUM == false then
		slot0.view.btnForget:setVisible(false)
	end
end

LoginAccountCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	slot0._inputAccount:show()
	slot0._inputPw:show()
end

LoginAccountCcsView.hide = function (slot0, slot1, slot2)
	slot0._inputAccount:hide()
	slot0._inputPw:hide()
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
end

LoginAccountCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsAccountShowing(false)
	elseif slot1 == slot0.view.btnForget then
		slot0.model:setAccount(slot0._inputAccount:getText())
		slot0.model:setIsAccountForgetShowing(true)
	elseif slot1 == slot0.view.btnConfirm then
		slot0.controller:requestLoginAccount(slot0._inputAccount:getText(), slot0._inputPw:getText())
	elseif slot1 == slot0.view.btnZhuce then
		if IS_IOS_VERIFY and IS_REGISTER_BY_PHONE_NUM == false then
			slot0.model:setIsAccountRegByAccShowing(true)
		else
			slot0.model:setIsAccountRegShowing(true)
		end
	end
end

LoginAccountCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.btnForget)
	destroySomeObj(slot0.view.btnConfirm)
	destroySomeObj(slot0.view.btnZhuce)
	slot0.view.cbAgreement.txt_tf:destroy()
	slot0.view.cbAgreement:destroy()
	slot0._inputPw:destroy()
	slot0._inputAccount:destroy()
	ZoomPopUpChildView.destroy(slot0)
end

return
