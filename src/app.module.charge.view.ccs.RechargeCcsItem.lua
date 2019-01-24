slot2 = "RechargeCcsItem"
RechargeCcsItem = class(slot1)

RechargeCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)
end

RechargeCcsItem.updateView = function (slot0)
	if slot0._data then
		slot3 = slot0.txtNum
		slot7 = true

		slot0.txtNum.setString(slot2, HtmlUtil.formatNumDotSign(slot5, slot0._data[1]))

		slot4 = slot0._data[2] .. "元"

		slot0.btnBuy.txtPrice.setString(slot2, slot0.btnBuy.txtPrice)
	end
end

RechargeCcsItem.onPushDownChanged = function (slot0, slot1, slot2, slot3)
	return
end

RechargeCcsItem.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnBuy then
		slot6 = slot0._data

		slot0.controller.requestApplePay(slot4, slot0.controller)
	end
end

RechargeCcsItem.destroy = function (slot0)
	slot3 = slot0.btnBuy

	destroySomeObj(slot2)

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
