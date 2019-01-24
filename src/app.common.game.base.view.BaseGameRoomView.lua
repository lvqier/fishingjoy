slot2 = "BaseGameRoomView"
BaseGameRoomView = class(slot1)

BaseGameRoomView.ctor = function (slot0, slot1)
	if slot0.layerTop and slot0.layerTop.btnBack then
		slot7 = 80

		slot0.controller.adjustSlimWidth(slot3, slot0.controller, slot0.layerTop.btnBack, UIConfig.ALIGN_LEFT)
	end

	if slot0.layerTop and slot0.layerTop.btnHelp then
		slot7 = 80

		slot0.controller.adjustSlimWidth(slot3, slot0.controller, slot0.layerTop.btnHelp, UIConfig.ALIGN_LEFT)
	end

	if slot0.layerTop and slot0.layerTop.logo then
		slot7 = -80

		slot0.controller.adjustSlimWidth(slot3, slot0.controller, slot0.layerTop.logo, UIConfig.ALIGN_RIGHT)
	end

	slot0._roomBtns = slot1
	slot7 = slot0

	eventMgr.add(slot3, eventMgr, GameEvent.ON_ROOM_SERVER_LIST_CHANGED, slot0.onRoomServerListChanged)
end

BaseGameRoomView.onRoomServerListChanged = function (slot0)
	slot4 = uiMgr

	if slot0.getScene(slot2) == uiMgr.getCurScene(slot0) then
		slot3 = slot0

		slot0.updateRoomList(slot2)
	end
end

BaseGameRoomView.updateRoomBtn = function (slot0, slot1, slot2)
	return
end

BaseGameRoomView.updateRoomList = function (slot0)
	slot4 = slot0.model
	slot1 = gameMgr.getServerVosDicEx(slot2)[slot0.model.getGameKind(gameMgr)] or {}
	slot2 = #slot0._roomBtns
	slot3 = 1
	slot4 = {}

	while slot3 <= slot2 do
		slot11 = slot1[slot3] ~= nil

		DisplayUtil.setVisible(slot9, slot0._roomBtns[slot3])

		slot11 = slot5 == nil

		DisplayUtil.setVisible(slot9, slot0._lockSps[slot3])

		if slot5 == nil and IS_IOS_VERIFY then
			slot11 = false

			DisplayUtil.setVisible(slot9, slot7)
		end

		if slot5 then
			slot12 = slot5

			slot0.updateRoomBtn(slot9, slot0, slot6)
		end

		slot3 = slot3 + 1
	end
end

BaseGameRoomView.destroy = function (slot0)
	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.ON_ROOM_SERVER_LIST_CHANGED, slot0.onRoomServerListChanged)
end

return
