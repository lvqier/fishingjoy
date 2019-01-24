slot2 = "BaseChatCcsItem"
BaseChatCcsItem = class(slot1)

BaseChatCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot4 = TextField.V_BOTTOM

	slot0.msg_tf.setVAlign(slot2, slot0.msg_tf)

	slot4 = true

	slot0.msg_tf.setIsWrapPrecise(slot2, slot0.msg_tf)

	slot3 = slot0
	slot0._itemWidth = slot0.getContentSize(slot2).width
	slot0._itemHeightDelta = 12
end

BaseChatCcsItem.updateView = function (slot0)
	if slot0._data then
		slot11 = 255
		slot9 = cc.c4b((slot0._data.TrumpetColor / 256 / 256) % 256, slot3, slot4, math.floor((slot0._data.TrumpetColor / 256) % 256))
		slot7 = DisplayUtil.ccc32RGB(slot3)
		slot9 = "#" .. slot7
		slot9 = HtmlUtil.createColorTxt(slot7, slot0._data.szTrumpetContent)

		slot0.msg_tf.setHtmlText(slot7, slot0.msg_tf)
	end

	slot3 = slot0
	slot9 = slot0.msg_tf
	slot7 = slot0.msg_tf.getTextHeight(slot8) + slot0._itemHeightDelta

	slot0.setContentSize(slot2, cc.size(slot5, slot0._itemWidth))
end

BaseChatCcsItem.getItemSize = function (slot0)
	slot6 = slot0.msg_tf
	slot4 = slot0.msg_tf.getTextHeight(slot5) + slot0._itemHeightDelta

	return cc.size(slot2, slot0._itemWidth)
end

BaseChatCcsItem.destroy = function (slot0)
	slot3 = slot0.msg_tf

	slot0.msg_tf.destroy(slot2)

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
