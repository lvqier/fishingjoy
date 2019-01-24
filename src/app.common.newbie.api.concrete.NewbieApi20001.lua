slot2 = "NewbieApi20001"
NewbieApi20001 = class(slot1)

NewbieApi20001.ctor = function (slot0)
	slot4 = BaseNewbieApi

	ClassUtil.extends(slot2, slot0)

	slot0._pupupBtnSize = {
		w = 170,
		h = 60
	}
	slot5 = slot0.onTryTimeOutPopupConfirm

	slot0.registerAndCacheEvent(slot2, slot0, GameEvent.TRY_TIME_OUT_PUPUP_CONFIRM)
end

NewbieApi20001.start = function (slot0)
	slot4 = TIP_EXPERIENCE_ROOM_LIMIT

	if popupMgr.getPopupByContent(slot2, popupMgr) ~= nil and slot1._rootView.view.btnConfirm ~= nil then
		slot5 = "查看排行榜"

		slot1.setConfirmTxt(slot3, slot1)

		slot5 = slot0._stepData.tipsIntroId
		slot3 = nil

		if newbieMgr.getIntroData(slot3, newbieMgr) then
			slot3 = slot2.content
		end

		slot16 = slot3

		slot0._maskView.show(slot5, slot0._maskView, slot1._rootView.view.btnConfirm, nil, slot0._pupupBtnSize.w, slot0._pupupBtnSize.h, nil, 8, 0, 0, -20)
	else
		slot4 = slot0

		slot0.finishNewbie(slot3)

		return true
	end
end

NewbieApi20001.onTryTimeOutPopupConfirm = function (slot0)
	slot3 = slot0

	slot0.finish(slot2)
end

NewbieApi20001.destroy = function (slot0)
	slot3 = slot0

	BaseNewbieApi.destroy(slot2)
end

return
