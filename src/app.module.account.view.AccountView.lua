AccountView = class("AccountView")

requireLuaFromModule("account.view.ccs.AccountCcsView")
requireLuaFromModule("account.view.ccs.AccountInfoCcsView")
requireLuaFromModule("account.view.ccs.AccountSafeCcsView")
requireLuaFromModule("account.view.ccs.AccountPwModifyCcsView")
requireLuaFromModule("account.view.ccs.AccountBindPhoneCcsView")
requireLuaFromModule("account.view.ccs.AccountTourisPhoneBindCcsView")
requireLuaFromModule("account.view.ccs.AccountTourisPhoneBindInfoCcsView")
requireLuaFromModule("account.view.ccs.AccountHeadCcsView")
requireLuaFromModule("account.view.ccs.AccountHeadLineCcsItem")
requireLuaFromModule("account.view.ccs.AccountHeadCcsItem")
requireLuaFromModule("account.view.ccs.AccountSettingCcsView")

ccs.AccountCcsView = AccountCcsView
ccs.AccountInfoCcsView = AccountInfoCcsView
ccs.AccountSafeCcsView = AccountSafeCcsView
ccs.AccountPwModifyCcsView = AccountPwModifyCcsView
ccs.AccountBindPhoneCcsView = AccountBindPhoneCcsView
ccs.AccountTourisPhoneBindCcsView = AccountTourisPhoneBindCcsView
ccs.AccountTourisPhoneBindInfoCcsView = AccountTourisPhoneBindInfoCcsView
ccs.AccountHeadCcsView = AccountHeadCcsView
ccs.AccountHeadLineCcsItem = AccountHeadLineCcsItem
ccs.AccountHeadCcsItem = AccountHeadCcsItem
ccs.AccountSettingCcsView = AccountSettingCcsView

AccountView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2

	ClassUtil.extends(slot0, TweenToTargetModuleView, true, "csb/layer/Account.csb", nil, UIConfig.ALIGN_CENTER, false)
end

AccountView.bindChildrenViews = function (slot0)
	slot0:bindTabView(slot1, "csb/layer/AccountInfo.csb", slot2, 1, false)
	slot0:bindTabView(slot1, "csb/layer/AccountInfo.csb", slot2, 2, false)
	slot0:bindPopUpChildView("pwModify", "csb/layer/AccountPwModify.csb", "isShowingPwModify")
	slot0:bindPopUpChildView("phoneBind", "csb/layer/AccountPhoneBind.csb", "isShowingPhoneBind", true)
	slot0:bindPopUpChildView("phoneBindTourist", "csb/layer/AccountTourisPhoneBind.csb", "isShowingTouristPhoneBind", true)
	slot0:bindPopUpChildView("phoneBindTouristInfo", "csb/layer/AccountTourisPhoneBindInfo.csb", "isShowingTouristPhoneBindInfo", true)
	slot0:bindPopUpChildView("headView", "csb/layer/AccountHead.csb", "isShowingHeadView")
	slot0:bindPopUpChildView("setting", "csb/layer/AccountSetting.csb", "isShowingSetting")
end

AccountView.onRootClick = function (slot0)
	ProxyAccount:hide()
end

AccountView.destroy = function (slot0)
	TweenToTargetModuleView.destroy(slot0)

	slot0.model = nil
	slot0.controller = nil
end

return
