slot2 = "ChargeMonthCardCcsItem"
ChargeMonthCardCcsItem = class(slot1)

ChargeMonthCardCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot0.items = {
		slot0.btnItem1,
		slot0.btnItem2,
		slot0.btnItem3
	}
end

ChargeMonthCardCcsItem.updateView = function (slot0)
	if slot0._data then
		for slot4 = 1, 3, 1 do
			if slot0._data[slot4] then
				slot8 = true

				slot0.items[slot4].setVisible(slot6, slot0.items[slot4])

				slot8 = slot0._data[slot4].Title

				slot0.items[slot4].txt.setString(slot6, slot0.items[slot4].txt)
			else
				slot8 = false

				slot0.items[slot4].setVisible(slot6, slot0.items[slot4])
			end
		end
	end
end

ChargeMonthCardCcsItem.onClick = function (slot0)
	return
end

ChargeMonthCardCcsItem.onBtnClick = function (slot0, slot1, slot2)
	for slot6 = 1, 3, 1 do
		if slot1 == slot0.items[slot6] then
			slot10 = slot0._data[slot6]

			slot0.model.setCurChannelConfig(slot8, slot0.model)

			slot9 = slot0.controller

			slot0.controller.requirePay(slot8)
		end
	end
end

ChargeMonthCardCcsItem.onPushDownChanged = function (slot0, slot1, slot2, slot3)
	return
end

ChargeMonthCardCcsItem.handleScrollBtns = function (slot0, slot1)
	slot5 = slot0.btnItem1

	slot1.addBtn2HandleTouchOperate(slot3, slot1)

	slot5 = slot0.btnItem2

	slot1.addBtn2HandleTouchOperate(slot3, slot1)

	slot5 = slot0.btnItem3

	slot1.addBtn2HandleTouchOperate(slot3, slot1)
end

ChargeMonthCardCcsItem.destroy = function (slot0)
	slot3 = slot0.btnItem1

	destroySomeObj(slot2)

	slot3 = slot0.btnItem2

	destroySomeObj(slot2)

	slot3 = slot0.btnItem3

	destroySomeObj(slot2)

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
