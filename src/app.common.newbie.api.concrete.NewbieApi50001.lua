slot2 = "NewbieApi50001"
NewbieApi50001 = class(slot1)

NewbieApi50001.ctor = function (slot0)
	slot4 = BaseNewbieApi

	ClassUtil.extends(slot2, slot0)

	slot0._pupupBtnSize = {
		w = 170,
		h = 60
	}
end

NewbieApi50001.start = function (slot0)
	slot4 = TIP_BANK_GIVE_NEED_BIND_PHONE

	if popupMgr.getPopupByContent(slot2, popupMgr) ~= nil and slot1._rootView.view.btnConfirm ~= nil then
		slot13 = -20

		slot0._maskView.show(slot3, slot0._maskView, slot1._rootView.view.btnConfirm, nil, slot0._pupupBtnSize.w, slot0._pupupBtnSize.h, nil, 0, 0, 0)

		slot4 = slot1._rootView.view.btnConfirm
		slot6 = slot0

		slot1._rootView.view.btnConfirm.getClickSignal(slot3).addOnce(slot3, slot1._rootView.view.btnConfirm.getClickSignal(slot3), slot0.onBtnClick)
	else
		slot4 = slot0

		slot0.finishNewbie(slot3)

		return true
	end
end

NewbieApi50001.onBtnClick = function (slot0)
	slot3 = slot0

	slot0.finish(slot2)
end

NewbieApi50001.destroy = function (slot0)
	slot4 = TIP_BANK_GIVE_NEED_BIND_PHONE

	if popupMgr.getPopupByContent(slot2, popupMgr) ~= nil and slot1._rootView.view.btnConfirm ~= nil then
		slot4 = slot1._rootView.view.btnConfirm
		slot6 = slot0

		slot1._rootView.view.btnConfirm.getClickSignal(slot3).remove(slot3, slot1._rootView.view.btnConfirm.getClickSignal(slot3), slot0.onBtnClick)
	end

	slot4 = slot0

	BaseNewbieApi.destroy(slot3)
end

return
