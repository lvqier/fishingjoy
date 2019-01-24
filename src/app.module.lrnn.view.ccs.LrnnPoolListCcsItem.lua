slot2 = "LrnnPoolListCcsItem"
LrnnPoolListCcsItem = class(slot1)

LrnnPoolListCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)
end

LrnnPoolListCcsItem.getPushZoomView = function (slot0)
	return nil
end

LrnnPoolListCcsItem.updateView = function (slot0)
	if slot0._data then
		for slot4 = 1, 3, 1 do
			slot8 = slot0._data.index == slot4

			slot0["place" .. slot4].setVisible(slot6, slot0["place" .. slot4])
		end

		slot4 = slot0._data.index > 3

		slot0.place4.setVisible(slot2, slot0.place4)

		slot4 = slot0._data.index

		slot0.place4.place_tf.setHtmlText(slot2, slot0.place4.place_tf)

		slot4 = slot0._data.cardType

		slot0.txtType_tf.setHtmlText(slot2, slot0.txtType_tf)

		slot4 = slot0._data.lGetCajin

		slot0.txtMoney_tf.setHtmlText(slot2, slot0.txtMoney_tf)

		slot6 = 2
		slot5 = StringUtil.truncate(slot2, slot0._data.nickName, 12, nil)

		slot0.txtName_tf.setHtmlText(slot0._data.nickName, slot0.txtName_tf)

		slot5 = slot0._data.index % 2 == 0

		slot0.bg.setVisible(slot0.place4, slot0.bg)
	end
end

LrnnPoolListCcsItem.destroy = function (slot0)
	slot3 = slot0.place4.place_tf

	slot0.place4.place_tf.destroy(slot2)

	slot3 = slot0.txtType_tf

	slot0.txtType_tf.destroy(slot2)

	slot3 = slot0.txtName_tf

	slot0.txtName_tf.destroy(slot2)

	slot3 = slot0.txtMoney_tf

	slot0.txtMoney_tf.destroy(slot2)

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
