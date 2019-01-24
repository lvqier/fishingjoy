slot2 = "RechargeCcsView"
RechargeCcsView = class(slot1)

RechargeCcsView.onCreationComplete = function (slot0)
	slot4 = "csb/common/RechargeItem.csb"

	slot0.node.list_lv.setItemResCcsFileName(slot2, slot0.node.list_lv)

	slot4 = 0

	slot0.node.list_lv.setGap(slot2, slot0.node.list_lv)

	slot7 = CHARGE_PAY_APPLE
	slot5 = true

	slot0.node.list_lv.setDatas(slot2, slot0.node.list_lv, slot0.model.getPayConfig(slot5, slot0.model))
end

RechargeCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnClose then
		slot5 = ProxyCharge

		ProxyCharge.hide(slot4)
	elseif slot1 == slot0.btnBank then
		slot5 = slot0.controller

		slot0.controller.gotoBankFromCharge(slot4)
	end
end

RechargeCcsView.destroy = function (slot0)
	slot3 = slot0.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.btnBank

	destroySomeObj(slot2)

	slot3 = slot0.node.list_lv

	destroySomeObj(slot2)
end

return
