slot2 = "TouristLoginTipsPopupView"
TouristLoginTipsPopupView = class(slot1)

TouristLoginTipsPopupView.ctor = function (slot0)
	slot6 = "csb/common/PopUpTouristLoginTips.csb"

	ClassUtil.extends(slot2, slot0, AbstractZoomPopupView, true)
end

TouristLoginTipsPopupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnClose then
		slot5 = slot0

		slot0.hide(slot4)

		slot6 = POPUP_ID_TOURIST_LOGIN_TIP

		popupMgr.pop(slot4, popupMgr)
	elseif slot1 == slot0._rootView.view.btnConfirm then
		slot5 = slot0

		slot0.hide(slot4)

		slot5 = "AccountModule"

		requireModule(slot4)

		slot7 = 2

		ProxyAccount.show(slot4, ProxyAccount, nil)
	end
end

TouristLoginTipsPopupView.destroy = function (slot0)
	slot3 = slot0._rootView.view.btnConfirm

	destroySomeObj(slot2)

	slot3 = slot0

	AbstractZoomPopupView.destroy(slot2)
end

return
