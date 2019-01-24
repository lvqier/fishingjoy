slot2 = "CommonRoomCcsItem"
CommonRoomCcsItem = class(slot1)

CommonRoomCcsItem.onCreationComplete = function (slot0)
	slot7 = slot0

	ClassUtil.extends(slot2, slot0, ZoomCcsBtn, true, slot0)

	slot5 = nil

	createSetterGetter(slot2, slot0, "parentItem")

	slot13 = slot0.onData

	createSetterGetter(slot2, slot0, "data", nil, nil, nil, nil, handler(slot11, slot0))

	slot3 = slot0

	slot0.onData(slot2)
end

CommonRoomCcsItem.onData = function (slot0)
	slot4 = slot0._data ~= nil

	slot0.setVisible(slot2, slot0)

	slot4 = slot0._data ~= nil

	slot0.setHandleTouchBy(slot2, slot0)

	slot3 = "======================"

	print(slot2)

	slot3 = slot0._data

	dump(slot2)

	if slot0._data then
		slot5 = slot0._data.wKindID == GameKind_LRNN and slot0._data.wSortID % 2 == 0

		slot0.txtCaiChi.setVisible(slot3, slot0.txtCaiChi)

		slot6 = slot0._data.wKindID == GameKind_DZPK and slot0._data.wSortID < 1000 and slot0._data.wSortID % 2 == 1

		slot0.txtBiXia.setVisible(slot4, slot0.txtBiXia)

		slot6 = slot0._data.wSortID
		slot3 = gameMgr.getRoomTypeBySortID(slot4, gameMgr)
		slot4 = ""

		if slot0._data.wKindID == GameKind_LRNN or slot0._data.wKindID == GameKind_YSZ or slot0._data.wKindID == GameKind_QZNN or slot0._data.wKindID == GameKind_JDNN or slot0._data.wKindID == GameKind_ERMJex or slot0._data.wKindID == GameKind_DDZ_JD or slot0._data.wKindID == GameKind_DDZ_BXP then
			slot5 = 0
			slot6 = nil

			if slot0._data.wKindID == GameKind_DDZ_JD or slot0._data.wKindID == GameKind_DDZ_BXP then
				slot9 = gameMgr
				slot6 = gameMgr.getServerVosDicEx(slot8)[GameKind_DDZ_VIRTUAL] or {}[slot0._data.wKindID] or {}
			else
				slot9 = gameMgr
				slot6 = gameMgr.getServerVosDicEx(slot8)[slot0._data.wKindID] or {}
			end

			if slot6[slot3] then
				slot5 = slot0._data.dwFullCount or slot6[slot3]._dwCellScore or 0
			end

			if slot5 > 0 then
				slot14 = 0
				slot12 = 4
				slot4 = HtmlUtil.createImg("txt_dizhu.png", slot7, nil, 22, nil) .. HtmlUtil.createArtNumWithHansUnits("txt_dizhu.png", slot5, "#plist_xfdz_num_%s.png") .. "  "
			end
		else
			slot4 = ""
		end

		slot6 = "txt_kongxian_cr.png"

		if slot0._data.dwOnLineCount > 80 then
			slot6 = "txt_baoman_cr.png"
		elseif slot5 > 40 then
			slot6 = "txt_yongji_cr.png"
		end

		slot14 = -3
		slot12 = slot4 .. HtmlUtil.createImg(slot6, slot7, nil, 25, nil)

		slot0.dizhu_tf.setHtmlText(HtmlUtil.createImg(slot6, slot7, nil, 25, nil), slot0.dizhu_tf)

		slot9 = slot0._data.roomNumIndex or 1

		if slot0.roomName_tf then
			slot10 = nil

			if (slot0._data.wKindID == GameKind_DNTG or slot0._data.wKindID == GameKind_DNTGLK or slot0._data.wKindID == GameKind_FISHTD or slot0._data.wKindID == GameKind_DNTGTEST) and slot3 ~= 1 then
				if slot0._data.wKindID == GameKind_FISHTD then
					slot3 = slot3 + 1
				end

				slot16 = slot3
				slot13 = "room_type_pao_" .. tostring(slot15) .. ".png"
				slot10 = ResConfig.getUITxtPath(slot12)
			else
				slot16 = slot3
				slot13 = "room_type_" .. tostring(slot15) .. ".png"
				slot10 = ResConfig.getUITxtPath(slot12)
			end

			slot17 = 0
			slot10 = HtmlUtil.createImg(slot12, slot10, nil, 33, nil)
			slot18 = 0
			slot12 = HtmlUtil.createImg("txt_roomSel_leftKH.png", slot11, nil, 33, nil)
			slot20 = 0
			slot14 = HtmlUtil.createImg("txt_roomSel_yishang.png", slot13, nil, 33, nil)
			slot22 = 0
			slot16 = HtmlUtil.createImg("txt_roomSel_rightKH.png", slot15, nil, 33, nil)

			if slot0._data.dwMinEnterScore >= 10000 then
				slot27 = 0
				slot28 = 0
				slot17 = slot12 .. HtmlUtil.createArtNum(slot17 / 10000, math.floor("txt_room_wan.png"), "#plist_font_gray_%d.png", nil, 33, nil) .. HtmlUtil.createImg("#plist_font_gray_%d.png", slot18, nil, 33, nil) .. slot14 .. slot16
			elseif slot17 == 0 then
				slot17 = ""
			else
				slot26 = 0
				slot17 = slot12 .. HtmlUtil.createArtNum(slot20, slot17, "#plist_font_gray_%d.png", nil, 33, nil) .. slot14 .. slot16
			end

			slot25 = 0
			slot26 = 0
			slot24 = slot10 .. slot18 .. HtmlUtil.createArtNum("txt_changfang.png", slot9, "#plist_font_gray_%d.png", nil, 33, nil) .. " " .. slot17

			slot0.roomName_tf.setHtmlText(HtmlUtil.createArtNum("txt_changfang.png", slot9, "#plist_font_gray_%d.png", nil, 33, nil), slot0.roomName_tf)
		end
	end
end

CommonRoomCcsItem.setHandleTouchBy = function (slot0, slot1)
	if slot0.__isHandleBtnTouchByListView == nil then
		slot0.__isHandleBtnTouchByListView = false
	end

	if slot0.__isHandleBtnTouchByListView ~= slot1 then
		slot0.__isHandleBtnTouchByListView = slot1
		slot4 = slot0._parentItem
		slot2 = slot0._parentItem.getScrollViewParent(slot3)

		if slot1 then
			slot6 = slot0

			slot2.addBtn2HandleTouchOperate(slot4, slot2)
		else
			slot6 = slot0

			slot2.removeBtnInHandleTouchOperate(slot4, slot2)
		end
	end
end

CommonRoomCcsItem.onClick = function (slot0)
	if slot0._data and slot0._data._onClick then
		slot3 = slot0._data

		slot0._data._onClick(slot2)
	end

	slot3 = popupMgr

	popupMgr.hideCommonRoomList(slot2)
end

return
