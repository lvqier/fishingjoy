slot2 = "BaseChatStaticCcsItem"
BaseChatStaticCcsItem = class(slot1)

BaseChatStaticCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot0._deltaHeight = 52
	slot4 = true

	slot0.msg_tf.setIsWrapPrecise(slot2, slot0.msg_tf)

	slot4 = TextField.V_BOTTOM

	slot0.msg_tf.setVAlign(slot2, slot0.msg_tf)

	slot3 = slot0
	slot0._itemWidth = slot0.getContentSize(slot2).width
end

BaseChatStaticCcsItem.updateView = function (slot0)
	if slot0._data then
		slot4 = slot0._data.content

		slot0.msg_tf.setHtmlText(slot2, slot0.msg_tf)
	end

	slot4 = slot0
	slot8 = slot0.msg_tf.getTextHeight(slot2) + slot0._deltaHeight

	slot0.setContentSize(slot0.msg_tf, cc.size(slot6, slot0._itemWidth))

	slot7 = slot0.bgSelected
	slot5 = (slot0.msg_tf.getTextHeight(slot2) + slot0._deltaHeight) / slot0.bgSelected.getContentSize(slot6).height

	slot0.bgSelected.setScaleY(slot0.msg_tf, slot0.bgSelected)
end

BaseChatStaticCcsItem.onClick = function (slot0)
	slot4 = slot0._data

	slot0.controller.requestSendChatStaticMsg(slot2, slot0.controller)
end

BaseChatStaticCcsItem.getItemSize = function (slot0)
	slot6 = slot0.msg_tf
	slot4 = slot0.msg_tf.getTextHeight(slot5) + slot0._deltaHeight

	return cc.size(slot2, slot0._itemWidth)
end

BaseChatStaticCcsItem.destroy = function (slot0)
	slot3 = slot0.msg_tf

	slot0.msg_tf.destroy(slot2)

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
