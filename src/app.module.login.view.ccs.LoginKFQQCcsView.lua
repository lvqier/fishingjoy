LoginKFQQCcsView = class("LoginKFQQCcsView")

LoginKFQQCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._qq = KF_QQ

	slot0.view.txtQQ:setString(slot0._qq)
end

LoginKFQQCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnConfirm then
		slot0.controller:gotoOnlineQQKf()
	elseif slot1 == slot0.view.btnCopy then
		mainMgr:gotoQQ(slot0._qq)
	elseif slot1 == slot0.view.btnClose then
		slot0.model:setIsKfQQShowing(false)
	end
end

LoginKFQQCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.btnConfirm)
	destroySomeObj(slot0.view.btnCopy)
	destroySomeObj(slot0.view.btnClose)
	ZoomPopUpChildView.destroy(slot0)
end

return
