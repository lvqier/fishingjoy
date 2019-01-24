slot2 = "BaseChatType1CcsView"
BaseChatType1CcsView = class(slot1)

BaseChatType1CcsView.onCreationComplete = function (slot0)
	slot3 = " [ 聊天模式1 ] "

	print(slot2)

	slot4 = BaseChatCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseChatCcsView.onCreationComplete(slot2)

	slot4 = "csb/common/ChatItem.csb"

	slot0.chatPanel.chatMsg_lv.setItemResCcsFileName(slot2, slot0.chatPanel.chatMsg_lv)

	slot4 = CcsListView.SCROLL_TYPE_VARY

	slot0.chatPanel.chatMsg_lv.setScrollType(slot2, slot0.chatPanel.chatMsg_lv)

	slot4 = false

	slot0.chatPanel.chatMsg_lv.setIsItemClickable(slot2, slot0.chatPanel.chatMsg_lv)

	slot3 = slot0

	slot0.initValue(slot2)

	slot4 = 10

	slot0.chatPanel.chatMsg_lv.setGap(slot2, slot0.chatPanel.chatMsg_lv)

	slot5 = slot0

	slot0.model.chatInfosChangedSignal.add(slot2, slot0.model.chatInfosChangedSignal, slot0.onTrumpMsgChanged)

	slot3 = slot0

	slot0.onTrumpMsgChanged(slot2)
end

BaseChatType1CcsView.initValue = function (slot0)
	slot3 = "初始化聊天模式1 value"

	print(slot2)

	slot3 = slot0

	BaseChatCcsView.initBaseValue(slot2)

	if slot0.chatPanel then
		slot4 = slot0.chatPanel
		slot0.tPanelSize[1] = slot0.chatPanel.getContentSize(slot3).width
		slot4 = slot0.chatPanel
		slot0.tPanelSize[2] = slot0.chatPanel.getContentSize(slot3).height
	end

	slot1 = 0
	slot2 = 0
	slot5 = slot0.model

	if slot0.model.getIsAdjustSlimWidth(slot4) then
		slot1 = (display.width - CUR_SELECTED_WIDTH) * 0.5

		if device.isIphoneX() then
			slot2 = 80
		end
	end

	slot0.tShowPos.x = slot0.tShowPos.x - slot1 + slot2
	slot8 = slot0.chatPanel.btnShow
	slot6 = 0
	slot0.tHidePos = cc.p(slot0.tShowPos.x - slot1 + slot2, -1 * (slot0.tPanelSize[1] + slot0.chatPanel.btnShow.getContentSize(slot7).width) - slot1)
	slot6 = slot0.tHidePos.x

	slot0.chatPanel.setPositionX(slot0.tShowPos.x - slot1 + slot2, slot0.chatPanel)
end

BaseChatType1CcsView.onTrumpMsgChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getIsShowingChat(slot2) and slot0.chatPanel and slot0.chatPanel.chatMsg_lv then
		slot3 = slot0.chatPanel.chatMsg_lv
		slot6 = slot0.model

		slot0.chatPanel.chatMsg_lv.setDatas(slot2, slot0.model.getChatInfos(slot5))

		slot5 = 1

		slot0.chatPanel.chatMsg_lv.jumpToPercent(slot2, slot0.chatPanel.chatMsg_lv, 0)
	end
end

BaseChatType1CcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.chatPanel.btnShow then
		slot5 = slot0.model

		if slot0.model.getIsChatMoveFinish(slot4) then
			slot8 = slot0.model
			slot6 = not slot0.model.getIsShowingChat(slot7)

			slot0.model.setIsShowingChat(slot4, slot0.model)
		end
	end
end

BaseChatType1CcsView.destroy = function (slot0)
	slot3 = slot0.chatPanel.chatMsg_lv

	slot0.chatPanel.chatMsg_lv.destroy(slot2)

	slot3 = slot0.chatPanel.btnShow

	destroySomeObj(slot2)

	slot3 = slot0

	BaseChatCcsView.destroy(slot2)
end

return
