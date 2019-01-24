SerialReplayDiscussItemCcsView = class("SerialReplayDiscussItemCcsView")

SerialReplayDiscussItemCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
	slot0:init()
end

SerialReplayDiscussItemCcsView.init = function (slot0)
	slot0.nWidth = 220
	slot0.nHeight = 60

	slot0.txtDiscuss_tf:setVAlign(TextField.V_BOTTOM)
	slot0.txtDiscuss_tf:setIsWrapPrecise(true)
end

SerialReplayDiscussItemCcsView.updateView = function (slot0)
	if slot0._data then
		slot0.txtName:setText(slot0._data.szNickName)
		slot0.txtDiscuss_tf:setText(slot0._data.szContent)
		slot0:setContentSize(cc.size(slot0:getContentSize().width, (slot0.nHeight + slot0.txtDiscuss_tf:getTextHeight()) - 24))

		if slot0._data.dwUserID == Hero:getDwUserID() then
			slot0.txtName:setColor(cc.c4b(192, 220, 123, 255))
			slot0.imgDiscussBg:loadTexture(Serial.Serial_Root .. "ingame/replay/lvse_duihuakuang.png")
		else
			slot0.txtName:setColor(cc.c4b(188, 133, 89, 255))
			slot0.imgDiscussBg:loadTexture(Serial.Serial_Root .. "ingame/replay/hongse_duihuakuang.png")
		end

		slot0.imgDiscussBg:setCapInsets(cc.rect(28, 22, 2, 2))
		slot0.imgDiscussBg:setContentSize(slot0.imgDiscussBg:getContentSize().width, slot1)
		slot0.imgDiscussBg:setPositionY(slot1)
		slot0.txtName:setPositionY(slot1 - 17)
	end

	slot0:setContentSize(cc.size(slot0:getContentSize().width, (slot0.nHeight + slot0.txtDiscuss_tf:getTextHeight()) - 24))
end

SerialReplayDiscussItemCcsView.destroy = function (slot0)
	CcsListViewItem.destroy(slot0)
end

SerialReplayDiscussItemCcsView.getItemSize = function (slot0)
	return cc.size(slot0:getContentSize().width, (slot0.nHeight + slot0.txtDiscuss_tf:getTextHeight()) - 24)
end

return
