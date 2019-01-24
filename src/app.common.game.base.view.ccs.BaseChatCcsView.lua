slot2 = "BaseChatCcsView"
BaseChatCcsView = class(slot1)

BaseChatCcsView.onCreationComplete = function (slot0)
	slot3 = slot0

	slot0.initTouchEvent(slot2)

	slot4 = slot0.chatPanel

	print(slot2, "[ BaseChatCcsView onCreationComplete ]")

	slot5 = slot0

	slot0.model.isShowingChatChangedSignal.add(slot2, slot0.model.isShowingChatChangedSignal, slot0.onEventChatPanel)
end

BaseChatCcsView.initTouchEvent = function (slot0)
	slot1 = cc.EventListenerTouchOneByOne.create(slot2)
	slot5 = false

	slot1.setSwallowTouches(cc.EventListenerTouchOneByOne, slot1)

	slot8 = slot0.onClick2CloseMenu
	slot6 = cc.Handler.EVENT_TOUCH_BEGAN

	slot1.registerScriptHandler(cc.EventListenerTouchOneByOne, slot1, handler(slot6, slot0))

	slot4 = slot0
	slot6 = slot0

	slot0.getEventDispatcher(cc.EventListenerTouchOneByOne).addEventListenerWithSceneGraphPriority(cc.EventListenerTouchOneByOne, slot0.getEventDispatcher(cc.EventListenerTouchOneByOne), slot1)
end

BaseChatCcsView.onClick2CloseMenu = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if slot0.model.getIsShowingChat(slot4) and slot0.chatPanel then
		slot5 = slot0.model

		if slot0.model.getIsChatMoveFinish(slot4) then
			slot6 = false

			slot0.model.setIsShowingChat(slot4, slot0.model)
		end
	end
end

BaseChatCcsView.initBaseValue = function (slot0)
	slot3 = "初始化聊天base value"

	print(slot2)

	slot0.tPanelSize = {
		true,
		true
	}
	slot4 = 0
	slot0.tShowPos = cc.p(slot2, 0)
	slot4 = 0
	slot0.tHidePos = cc.p(slot2, 0)
	slot0.bMoveFinish = true
	slot0.iMoveTime = 0.2
end

BaseChatCcsView.onEventChatPanel = function (slot0, slot1)
	if slot1 == nil then
		slot4 = slot0.chatPanel

		slot0.chatPanel.stopAllActions(slot3)

		slot0.model._isShowingChat = false
		slot5 = true

		slot0.model.setIsChatMoveFinish(false, slot0.model)

		slot5 = false

		slot0.model.setIsStopTouchNext(false, slot0.model)

		slot5 = slot0.tHidePos.x

		slot0.chatPanel.setPositionX(false, slot0.chatPanel)

		return
	end

	function slot2()
		slot3 = true

		slot0.model.setIsChatMoveFinish(slot1, slot0.model)
	end

	function slot3()
		slot3 = false

		slot0.model.setIsStopTouchNext(slot1, slot0.model)
	end

	function slot4()
		slot3 = true

		slot0.model.setIsStopTouchNext(slot1, slot0.model)
	end

	slot7 = slot0.model

	if slot0.model.getIsShowingChat(slot6) == false then
		slot8 = slot0.model

		if slot0.model.getIsChatMoveFinish(slot7) then
			slot9 = false

			slot0.model.setIsChatMoveFinish(slot7, slot0.model)

			slot11 = {
				x = slot0.tHidePos.x,
				y = slot0.tHidePos.y,
				onComplete = function ()
					slot0()
					slot1()
				end
			}

			TweenLite.to(slot0.model, slot0.chatPanel, slot0.iMoveTime)
		end
	elseif slot5 == true then
		slot8 = slot0.model

		if slot0.model.getIsChatMoveFinish(slot7) then
			if slot0.onTrumpMsgChanged then
				slot8 = slot0

				slot0.onTrumpMsgChanged(slot7)
			end

			slot9 = false

			slot0.model.setIsChatMoveFinish(slot7, slot0.model)

			slot11 = {
				x = slot0.tShowPos.x,
				y = slot0.tShowPos.y,
				onComplete = function ()
					slot0()
					slot1()
				end
			}

			TweenLite.to(slot0.model, slot0.chatPanel, slot0.iMoveTime)
		end
	end
end

BaseChatCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.isShowingChatChangedSignal.remove(slot2, slot0.model.isShowingChatChangedSignal, slot0.onEventChatPanel)
end

return
