AccountCcsView = class("AccountCcsView")

AccountCcsView.onCreationComplete = function (slot0)
	return
end

AccountCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnClose then
		ProxyAccount:hide()
	end
end

AccountCcsView.destroy = function (slot0)
	slot0.model.tabIndexChangedSignal:remove(slot0.onTabIndex, slot0)
	slot0.btnClose:destroy()
end

return
