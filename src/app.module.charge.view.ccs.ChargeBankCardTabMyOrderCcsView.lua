slot2 = "ChargeBankCardTabMyOrderCcsView"
ChargeBankCardTabMyOrderCcsView = class(slot1)
slot0 = 10

ChargeBankCardTabMyOrderCcsView.onCreationComplete = function (slot0)
	slot4 = "csb/common/ChargeBankCardMyOrderListItem.csb"

	slot0.nodeListParent.list_lv.setItemResCcsFileName(slot2, slot0.nodeListParent.list_lv)

	slot5 = slot0

	slot0.model.myOrderListDataChangedSignal.add(slot2, slot0.model.myOrderListDataChangedSignal, slot0.onOrderData)
end

ChargeBankCardTabMyOrderCcsView.onOrderData = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getMyOrderListData(slot2) and slot1.data

	if slot1 then
		slot5 = slot1.PageData

		slot0.nodeListParent.list_lv.setDatas(slot3, slot0.nodeListParent.list_lv)
	end

	slot4 = slot0.nodeListParent.list_lv
	slot2 = slot0.nodeListParent.list_lv.getDatas(slot3) or {}

	if #slot2 > 0 then
		slot5 = slot0.txtPage_tf
		slot12 = "#86d7ff"
		slot10 = slot1.PageCount

		slot0.txtPage_tf.setHtmlText(slot4, string.format(slot7, "%s" .. HtmlUtil.createColorTxt(slot10, "/%s"), slot1.PageIndex))
	else
		slot10 = "#86d7ff"
		slot6 = "1" .. HtmlUtil.createColorTxt(slot8, "/1")

		slot0.txtPage_tf.setHtmlText(slot4, slot0.txtPage_tf)
	end

	slot6 = #slot2 == 0

	slot0.txtNoRecords.setVisible(slot4, slot0.txtNoRecords)
end

ChargeBankCardTabMyOrderCcsView.onShow = function (slot0)
	slot5 = slot0

	slot0.controller.requestBankCardOrderList(slot2, slot0.controller, 1)
end

ChargeBankCardTabMyOrderCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.btnGuide then
		slot5 = true

		slot0.model.setIsShowingTransferGuide(slot3, slot0.model)
	elseif slot1 == slot0.btnKf then
		slot4 = slot0.controller

		slot0.controller.gotoCustomService(slot3)
	elseif slot1 == slot0.btnPre then
		slot6 = slot0

		slot0.controller.requestPageMyOrderList(slot3, slot0.controller, -1)
	elseif slot1 == slot0.btnNext then
		slot6 = slot0

		slot0.controller.requestPageMyOrderList(slot3, slot0.controller, 1)
	end
end

return
