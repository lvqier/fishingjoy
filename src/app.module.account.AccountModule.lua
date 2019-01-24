slot0 = class("AccountModule")

requireLuaFromModule("account.model.AccountModel")
requireLuaFromModule("account.controller.AccountController")
requireLuaFromModule("account.view.AccountView")

slot0.ctor = function (slot0, ...)
	ClassUtil.extends(slot0, BaseUIModule, true, AccountModel, AccountView, AccountController)
end

slot0.show = function (slot0, slot1, slot2, slot3)
	slot0:initMvc()
	slot0.view:setTriggerTarget(slot1)
	slot0.view:show()
	slot0.controller:requestMobileState()

	if slot2 then
		slot0.model:setTabIndex(slot2)
	elseif not slot0.model:getTabIndex() then
		slot0.model:setTabIndex(1)
	end

	if slot3 then
		slot0.controller:gotoBindMobile()
		trackMgr:recordTracks(TRACK_MEMBER_BDSJ)
	end
end

slot0.hide = function (slot0, slot1, slot2)
	BaseUIModule.hide(slot0, slot1, slot2)

	if not slot2 then
		popupMgr:pop(POPUP_ID_TOURIST_LOGIN_TIP)
	end
end

ProxyAccount = slot0.new()

return ProxyAccount
