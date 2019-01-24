PlazaBankLoginCcsView = class("PlazaBankLoginCcsView")

PlazaBankLoginCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0:init()
end

PlazaBankLoginCcsView.onRootClick = function (slot0)
	return
end

PlazaBankLoginCcsView.init = function (slot0)
	slot0._input = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputPw)

	slot0._input:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
	slot0.view.btnForget:setVisible(not IS_IOS_VERIFY)
end

PlazaBankLoginCcsView.onBankStateInfoChanged = function (slot0)
	if not mainMgr:getBankStateInfo() or slot1.forceBind or slot1.tips == "" then
		slot0.view.txtWxTips:setString("")
	else
		slot0.view.txtWxTips:setString("温馨提示:" .. slot1.tips)
	end
end

PlazaBankLoginCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	networkMgr:registeruserfunction(SUB_GP_USER_INSURE_LOGON_SUCCESS, slot0.controller.onBankLoginSuccess, slot0.controller)
	networkMgr:registeruserfunction(SUB_GP_USER_INSURE_LOGON_FAILURE, slot0.controller.onBankLoginFailure, slot0.controller)
	mainMgr.bankStateInfoChangedSignal:add(slot0.onBankStateInfoChanged, slot0)
	slot0._input:show()
	slot0:onBankStateInfoChanged()
end

PlazaBankLoginCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
	networkMgr:unregisteruserfunction(SUB_GP_USER_INSURE_LOGON_SUCCESS, slot0.controller.onBankLoginSuccess, slot0.controller)
	networkMgr:unregisteruserfunction(SUB_GP_USER_INSURE_LOGON_FAILURE, slot0.controller.onBankLoginFailure, slot0.controller)
	mainMgr.bankStateInfoChangedSignal:remove(slot0.onBankStateInfoChanged, slot0)
	slot0._input:hide()
	slot0._input:setText("")
end

PlazaBankLoginCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingBankLogin(false)
	elseif slot1 == slot0.view.btnConfirm then
		if not gmMgr:checkGmCommand(slot0._input:getText()) then
			slot0.controller:requestLoginBank(slot0._input:getText(), true)
		end
	elseif slot1 == slot0.view.btnForget then
		if Hero:getIsBindMobile() then
			slot0.controller:forgetBankPw()
		else
			tweenMsgMgr:showRedMsg("请先绑定手机再修改银行密码!")
		end
	end
end

PlazaBankLoginCcsView.destroy = function (slot0)
	slot0._input:destroy()
	destroySomeObj(slot0.view.btnForget)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.btnConfirm)
	ZoomPopUpChildView.destroy(slot0)
end

return
