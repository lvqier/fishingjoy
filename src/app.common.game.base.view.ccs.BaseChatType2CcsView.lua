slot2 = "BaseChatType2CcsView"
BaseChatType2CcsView = class(slot1)
slot0 = {
	msg = {
		select = "gameres/ui/common/pane/btnMsgSelect.png",
		normal = "gameres/ui/common/pane/btnMsgNormal.png"
	},
	person = {
		select = "gameres/ui/common/pane/btnPersonSelect.png",
		normal = "gameres/ui/common/pane/btnPersonNormal.png"
	}
}
slot1 = {
	msg = 1,
	person = 2
}

BaseChatType2CcsView.onCreationComplete = function (slot0)
	slot3 = " [ 聊天模式2 ] "

	print(slot2)

	slot4 = BaseChatCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseChatCcsView.onCreationComplete(slot2)

	slot4 = "csb/common/ChatItem2.csb"

	slot0.chatPanel.msg_lv.setItemResCcsFileName(slot2, slot0.chatPanel.msg_lv)

	slot4 = CcsListView.SCROLL_TYPE_VARY

	slot0.chatPanel.msg_lv.setScrollType(slot2, slot0.chatPanel.msg_lv)

	slot4 = false

	slot0.chatPanel.msg_lv.setIsItemClickable(slot2, slot0.chatPanel.msg_lv)

	slot4 = "csb/common/ChatItem2.csb"

	slot0.chatPanel.person_lv.setItemResCcsFileName(slot2, slot0.chatPanel.person_lv)

	slot4 = CcsListView.SCROLL_TYPE_VARY

	slot0.chatPanel.person_lv.setScrollType(slot2, slot0.chatPanel.person_lv)

	slot4 = false

	slot0.chatPanel.person_lv.setIsItemClickable(slot2, slot0.chatPanel.person_lv)

	slot3 = slot0

	slot0.initValue(slot2)

	slot4 = 10

	slot0.chatPanel.msg_lv.setGap(slot2, slot0.chatPanel.msg_lv)

	slot5 = slot0

	slot0.model.chatInfosChangedSignal.add(slot2, slot0.model.chatInfosChangedSignal, slot0.onTrumpMsgChanged)

	slot3 = slot0

	slot0.onTrumpMsgChanged(slot2)

	slot3 = slot0

	slot0.onTrumpMsg2Changed(slot2)
end

BaseChatType2CcsView.initValue = function (slot0)
	slot3 = "初始化聊天模式2 value"

	print(slot2)

	slot3 = slot0

	BaseChatCcsView.initBaseValue(slot2)

	if slot0.chatPanel then
		slot4 = slot0.chatPanel
		slot0.tPanelSize[1] = slot0.chatPanel.getContentSize(slot3).width
		slot4 = slot0.chatPanel
		slot0.tPanelSize[2] = slot0.chatPanel.getContentSize(slot3).height
	end

	slot4 = 0
	slot0.tShowPos = cc.p(slot2, 5)
	slot4 = 0
	slot0.tHidePos = cc.p(slot2, -1 * slot0.tPanelSize[1])
	slot4 = slot0.tHidePos.x

	slot0.chatPanel.setPositionX(slot2, slot0.chatPanel)

	slot0.currChatStatus = -1
	slot4 = slot0.msg

	slot0.changeChatChannel(slot2, slot0)
end

BaseChatType2CcsView.changeChatChannel = function (slot0, slot1)
	if slot1 == slot0.currChatStatus then
		return
	end

	if slot0.msg == slot1 then
		slot7 = ""

		slot0.chatPanel.btnMsg.loadTextures(slot3, slot0.chatPanel.btnMsg, slot1.msg.select, slot1.msg.select)

		slot7 = ""

		slot0.chatPanel.btnPerson.loadTextures(slot3, slot0.chatPanel.btnPerson, slot1.person.normal, slot1.person.normal)

		slot5 = true

		slot0.chatPanel.msg_lv.setVisible(slot3, slot0.chatPanel.msg_lv)

		slot5 = false

		slot0.chatPanel.person_lv.setVisible(slot3, slot0.chatPanel.person_lv)
	elseif slot0.person == slot1 then
		slot7 = ""

		slot0.chatPanel.btnMsg.loadTextures(slot3, slot0.chatPanel.btnMsg, slot1.msg.normal, slot1.msg.normal)

		slot7 = ""

		slot0.chatPanel.btnPerson.loadTextures(slot3, slot0.chatPanel.btnPerson, slot1.person.select, slot1.person.select)

		slot5 = false

		slot0.chatPanel.msg_lv.setVisible(slot3, slot0.chatPanel.msg_lv)

		slot5 = true

		slot0.chatPanel.person_lv.setVisible(slot3, slot0.chatPanel.person_lv)
	end

	slot0.currChatStatus = slot1
end

BaseChatType2CcsView.onTrumpMsgChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getIsShowingChat(slot2) and slot0.chatPanel and slot0.chatPanel.msg_lv then
		slot3 = slot0.chatPanel.msg_lv
		slot6 = slot0.model

		slot0.chatPanel.msg_lv.setDatas(slot2, slot0.model.getChatInfos(slot5))

		slot5 = 1

		slot0.chatPanel.msg_lv.jumpToPercent(slot2, slot0.chatPanel.msg_lv, 0)
	end
end

BaseChatType2CcsView.onTrumpMsg2Changed = function (slot0, slot1)
	return
end

BaseChatType2CcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.chatPanel.btnClose then
		slot5 = slot0.model

		if slot0.model.getIsChatMoveFinish(slot4) then
			slot8 = slot0.model
			slot6 = not slot0.model.getIsShowingChat(slot7)

			slot0.model.setIsShowingChat(slot4, slot0.model)
		end
	elseif slot1 == slot0.chatPanel.btnSendMsg then
		slot5 = "发送消息"

		print(slot4)
	elseif slot1 == slot0.chatPanel.btnMsg then
		slot6 = slot0.msg

		slot0.changeChatChannel(slot4, slot0)
	elseif slot1 == slot0.chatPanel.btnPerson then
		slot6 = slot0.person

		slot0.changeChatChannel(slot4, slot0)
	end
end

BaseChatType2CcsView.destroy = function (slot0)
	slot3 = slot0.chatPanel.msg_lv

	slot0.chatPanel.msg_lv.destroy(slot2)

	slot3 = slot0.chatPanel.person_lv

	slot0.chatPanel.person_lv.destroy(slot2)

	slot3 = slot0.chatPanel.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.chatPanel.btnSend

	destroySomeObj(slot2)

	slot3 = slot0.chatPanel.btnMsg

	destroySomeObj(slot2)

	slot3 = slot0.chatPanel.btnPerson

	destroySomeObj(slot2)

	slot3 = slot0

	BaseChatCcsView.destroy(slot2)
end

return
