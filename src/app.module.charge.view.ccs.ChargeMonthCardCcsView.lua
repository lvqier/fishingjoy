slot2 = "ChargeMonthCardCcsView"
ChargeMonthCardCcsView = class(slot1)

ChargeMonthCardCcsView.onCreationComplete = function (slot0)
	slot4 = "csb/common/ChargeMonthCardItem.csb"

	slot0.content_lv.setItemResCcsFileName(slot2, slot0.content_lv)

	slot4 = true

	slot0.content_lv.setIsScrollableOnlyInNeed(slot2, slot0.content_lv)

	slot4 = 12

	slot0.content_lv.setGap(slot2, slot0.content_lv)
end

ChargeMonthCardCcsView.onShow = function (slot0)
	slot4 = {
		CHARGE_PAY_TYPE_NAME_APPLE
	}
	slot5 = 3
	slot6 = TableUtil.cookDataAs2Dimension(slot0.controller, slot0.controller.getPayOpenList(slot2, slot0.controller))

	slot0.content_lv.setDatas(slot0.controller.getPayOpenList(slot2, slot0.controller), slot0.content_lv)

	slot8 = nil

	slot0.content_lv.jumpToPercent(slot0.controller.getPayOpenList(slot2, slot0.controller), slot0.content_lv, nil, 0)
end

ChargeMonthCardCcsView.onHide = function (slot0)
	return
end

ChargeMonthCardCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnClose then
		slot5 = ProxyCharge

		ProxyCharge.hide(slot4)
	end
end

ChargeMonthCardCcsView.destroy = function (slot0)
	slot3 = slot0.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.content_lv

	destroySomeObj(slot2)
end

return
