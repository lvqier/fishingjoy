slot2 = "BaseChat2CcsItem"
BaseChat2CcsItem = class(slot1)

BaseChat2CcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot4 = TextField.V_BOTTOM

	slot0.msg_tf.setVAlign(slot2, slot0.msg_tf)

	slot4 = true

	slot0.msg_tf.setIsWrapPrecise(slot2, slot0.msg_tf)

	slot3 = slot0
	slot0._itemWidth = slot0.getContentSize(slot2).width
end

BaseChat2CcsItem.updateView = function (slot0)
	if slot0._data then
		slot2 = nil
		slot11 = 255
		slot9 = cc.c4b(slot7, slot3, slot4, 203)
		slot7 = DisplayUtil.ccc32RGB(slot3)
		slot9 = "#" .. slot7
		slot9 = HtmlUtil.createColorTxt(slot7, slot0._data.szTrumpetContent)

		slot0.msg_tf.setHtmlText(slot7, slot0.msg_tf)
	end

	slot3 = slot0
	slot9 = slot0.msg_tf
	slot7 = slot0.msg_tf.getTextHeight(slot8) + 6

	slot0.setContentSize(slot2, cc.size(slot5, slot0._itemWidth))

	if slot0.img_line then
		slot4 = 3

		slot0.img_line.setPositionY(slot2, slot0.img_line)
	end
end

BaseChat2CcsItem.getItemSize = function (slot0)
	slot6 = slot0.msg_tf
	slot4 = slot0.msg_tf.getTextHeight(slot5) + 6

	return cc.size(slot2, slot0._itemWidth)
end

BaseChat2CcsItem.destroy = function (slot0)
	slot3 = slot0.msg_tf

	slot0.msg_tf.destroy(slot2)

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
