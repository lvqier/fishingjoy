slot2 = "LrnnSelectRoomTypeCcsView"
LrnnSelectRoomTypeCcsView = class(slot1)

LrnnSelectRoomTypeCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)
end

LrnnSelectRoomTypeCcsView.onZoomShowTweenComplete = function (slot0)
	slot5 = slot0.model
	slot4 = 0
	slot5 = 0
	slot8 = gameMgr.getServerVosDicEx(slot0.model)[slot0.model.getGameKind(gameMgr)] or {}[slot0.model.getRoomKind(slot2)]

	for slot9, slot10 in ipairs(slot7) do
		if slot10.wSortID % 2 == 0 then
			slot4 = slot4 + slot10.dwOnLineCount
		else
			slot5 = slot5 + slot10.dwOnLineCount
		end
	end

	slot6 = 1

	if slot4 >= 80 then
		slot6 = 3
	elseif slot4 >= 40 then
		slot6 = 2
	end

	slot10 = "txt/lrnn_room_count_state_" .. slot6 .. ".png"
	slot7 = slot0.controller.getUIPath(slot8, slot0.controller)
	slot6 = 1

	if slot5 >= 80 then
		slot6 = 3
	elseif slot5 >= 40 then
		slot6 = 2
	end

	slot11 = "txt/lrnn_room_count_state_" .. slot6 .. ".png"
	slot11 = slot0.view.btnCCF.txt_tf
	slot18 = 0

	slot0.view.btnCCF.txt_tf.setHtmlText(slot0.controller, HtmlUtil.createImg(".png", slot7, nil, nil, nil))

	slot11 = slot0.view.btnPTF.txt_tf
	slot18 = 0

	slot0.view.btnPTF.txt_tf.setHtmlText(slot0.controller, HtmlUtil.createImg(".png", slot0.controller.getUIPath(slot9, slot0.controller), nil, nil, nil))
end

LrnnSelectRoomTypeCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot6 = false

		slot0.model.setIsShowingSelectRoomType(slot4, slot0.model)
	elseif slot1 == slot0.view.btnCCF then
		slot6 = true

		slot0.controller.requestEnterRoomByType(slot4, slot0.controller)
	elseif slot1 == slot0.view.btnPTF then
		slot6 = false

		slot0.controller.requestEnterRoomByType(slot4, slot0.controller)
	end
end

LrnnSelectRoomTypeCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingSelectRoomType(slot2, slot0.model)
end

LrnnSelectRoomTypeCcsView.destroy = function (slot0)
	slot3 = slot0.view.btnCCF.txt_tf

	slot0.view.btnCCF.txt_tf.destroy(slot2)

	slot3 = slot0.view.btnPTF.txt_tf

	slot0.view.btnPTF.txt_tf.destroy(slot2)

	slot3 = slot0.view.btnCCF

	slot0.view.btnCCF.destroy(slot2)

	slot3 = slot0.view.btnPTF

	slot0.view.btnPTF.destroy(slot2)

	slot3 = slot0.view.btnClose

	slot0.view.btnClose.destroy(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
