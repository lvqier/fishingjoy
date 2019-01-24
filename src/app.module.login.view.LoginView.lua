LoginView = class("LoginView")

requireLuaFromModule("login.view.ccs.LoginCcsView")
requireLuaFromModule("login.view.ccs.LoginAccountCcsView")
requireLuaFromModule("login.view.ccs.LoginAccountForgetCcsView")
requireLuaFromModule("login.view.ccs.LoginAccountRegCcsView")
requireLuaFromModule("login.view.ccs.LoginAccountRegInfoCcsView")
requireLuaFromModule("login.view.ccs.LoginAccountRegByAccCcsView")
requireLuaFromModule("login.view.ccs.LoginAccountResetCcsView")
requireLuaFromModule("login.view.ccs.LoginGuestCcsView")
requireLuaFromModule("login.view.ccs.LoginValidateCcsView")
requireLuaFromModule("login.view.ccs.LoginWechatCcsView")
requireLuaFromModule("login.view.ccs.LoginValidateIDCcsView")
requireLuaFromModule("login.view.ccs.LoginKFCcsView")
requireLuaFromModule("login.view.ccs.LoginKFQQCcsView")
requireLuaFromModule("login.view.ccs.LoginKFQnACcsView")
requireLuaFromModule("login.view.ccs.LoginKFQnAListCcsItem")
requireLuaFromModule("login.view.ccs.LoginGuestVerifyCharCcsPane")

ccs.LoginCcsView = LoginCcsView
ccs.LoginAccountCcsView = LoginAccountCcsView
ccs.LoginAccountForgetCcsView = LoginAccountForgetCcsView
ccs.LoginAccountRegCcsView = LoginAccountRegCcsView
ccs.LoginAccountRegInfoCcsView = LoginAccountRegInfoCcsView
ccs.LoginAccountRegByAccCcsView = LoginAccountRegByAccCcsView
ccs.LoginAccountResetCcsView = LoginAccountResetCcsView
ccs.LoginGuestCcsView = LoginGuestCcsView
ccs.LoginValidateCcsView = LoginValidateCcsView
ccs.LoginWechatCcsView = LoginWechatCcsView
ccs.LoginValidateIDCcsView = LoginValidateIDCcsView
ccs.LoginKFCcsView = LoginKFCcsView
ccs.LoginKFQQCcsView = LoginKFQQCcsView
ccs.LoginKFQnACcsView = LoginKFQnACcsView
ccs.LoginKFQnAListCcsItem = LoginKFQnAListCcsItem
ccs.LoginGuestVerifyCharCcsPane = LoginGuestVerifyCharCcsPane

LoginView.ctor = function (slot0, ...)
	slot0.model = ({
		...
	})[1]
	slot0.controller = ()[2]

	ClassUtil.extends(slot0, BaseModuleUIView, true, "csb/layer/Login.csb", UIConfig.ALIGN_CENTER, false)
end

LoginView.bindChildrenViews = function (slot0)
	slot0:bindTabView(slot1, "csb/layer/LoginKF.csb", "isKfShowing", true, false, nil, nil, 3)
	slot0:bindPopUpChildView("kfQna", "csb/layer/LoginKFQA.csb", "isShowingKfQnA")
	slot0:bindPopUpChildView("accountView", "csb/layer/LoginAccount.csb", "isAccountShowing")
	slot0:bindPopUpChildView("forgetView", "csb/layer/LoginAccountForget.csb", "isAccountForgetShowing", true)
	slot0:bindPopUpChildView("regView", "csb/layer/LoginAccountReg.csb", "isAccountRegShowing", true)
	slot0:bindPopUpChildView("regInfoView", "csb/layer/LoginAccountRegInfo.csb", "isAccountRegInfoShowing", true)
	slot0:bindPopUpChildView("regInfoView2", "csb/layer/LoginAccountRegByAcc.csb", "isAccountRegByAccShowing", true)
	slot0:bindPopUpChildView("resetView", "csb/layer/LoginAccountReset.csb", "isAccountResetShowing", true)
	slot0:bindPopUpChildView("guestView", "csb/layer/LoginGuest.csb", "isAccountGuestShowing", true)
	slot0:bindPopUpChildView("validateView", "csb/layer/LoginValidate.csb", "isValidateShowing", true)
	slot0:bindPopUpChildView("validateIDView", "csb/layer/LoginValidateID.csb", "isValidateIDShowing", true)
	slot0:bindPopUpChildView("wechatView", "csb/layer/LoginWechat.csb", "isLoginWechatShowing", true)
	slot0:bindPopUpChildView("kfQQView", "csb/layer/LoginKFQQ.csb", "isKfQQShowing", true)
end

LoginView.destroy = function (slot0)
	BaseModuleUIView.destroy(slot0)

	slot0.model = nil
	slot0.controller = nil
end

return
