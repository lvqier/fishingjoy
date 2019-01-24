slot2 = "BaseGameTableCcsPane"
BaseGameTableCcsPane = class(slot1)

BaseGameTableCcsPane.onCreationComplete = function (slot0)
	slot13 = slot0.onData

	createSetterGetter(slot2, slot0, "data", nil, nil, nil, nil, handler(slot11, slot0))

	slot0._chairs = {}
	slot1 = 1

	while true do
		if slot0["layerChair" .. slot1] then
			slot6 = slot1

			slot2.setIndex(slot4, slot2)

			slot6 = slot2

			table.insert(slot4, slot0._chairs)
		else
			break
		end

		slot1 = slot1 + 1
	end

	slot4 = slot0

	slot0.onData(slot3)
end

BaseGameTableCcsPane.onBtnClick = function (slot0, slot1, slot2)
	if slot0._data and slot1 == slot0.btnTable then
		slot3 = {}
		slot6 = slot0._chairs

		for slot7, slot8 in ipairs(slot5) do
			if not slot0._data.vo.tableUsers[slot7 - 1] then
				slot12 = slot7 - 1

				table.insert(slot10, slot3)
			end
		end

		if #slot3 > 0 then
			slot4 = slot3[math.random(slot5, 1)]
			slot5 = slot0._data.vo.wTableId
			slot8 = slot0.model

			if slot0.model.getRoomKind(#slot3) == 1 then
				slot8 = Hero

				if Hero.tyTimeIsValid(slot7) then
					if slot0._data.vo.tagStatus.cbTableLock == 1 then
						function slot10(slot0)
							slot3 = "桌子密码：" .. slot0

							print(slot2)

							slot6 = slot0

							slot0.controller.requestSitDown(slot2, slot0.controller, slot0.controller.requestSitDown, slot2)
						end

						popupMgr.showRoomPasswordPopup(slot8, popupMgr)
					else
						slot10 = slot4

						slot0.controller.requestSitDown(slot7, slot0.controller, slot5)
					end
				else
					slot11 = true

					mainMgr.tryTimeOutShowPopup2Charge(slot8, mainMgr, function ()
						slot2 = slot0

						slot0.exitHall(slot1)
					end)
				end
			end
		end
	end
end

BaseGameTableCcsPane.handleScrollBtns = function (slot0, slot1)
	slot5 = slot0.btnTable

	slot1.addBtn2HandleTouchOperate(slot3, slot1)

	slot4 = slot0._chairs

	for slot5, slot6 in ipairs(slot3) do
		slot10 = slot1

		slot6.handleScrollBtns(slot8, slot6)
	end
end

BaseGameTableCcsPane.onData = function (slot0)
	if slot0._data then
		if slot0._tableIndexCached ~= slot0._data.index then
			slot0._tableIndexCached = slot0._data.index
			slot1 = nil

			if IS_GUAN_VERIFY then
				slot6 = 2
				slot1 = HtmlUtil.createArtNumEx(slot3, slot0._data.index + 1, "#guan_hall_tableIndexNum_%s.png")
			elseif slot0.model.tableArtNumPrefix ~= nil then
				slot6 = 2
				slot1 = HtmlUtil.createArtNumEx(slot3, slot0._data.index + 1, slot0.model.tableArtNumPrefix)
			else
				slot6 = true
				slot1 = StringUtil.int2StringKeepBits(slot3, slot0._data.index + 1, 2)
			end

			slot5 = slot1

			slot0.txtTableNum_tf.setHtmlText(slot3, slot0.txtTableNum_tf)
		end

		if slot0.lock ~= nil then
			slot5 = slot0._data ~= nil and slot0._data.vo ~= nil and slot0._data.vo.tableUsers ~= nil and slot0._data.vo.tagStatus.cbTableLock == 1

			slot0.lock.setVisible(slot3, slot0.lock)
		end
	end

	slot1 = false
	slot2 = slot0._data ~= nil and slot0._data.vo ~= nil and slot0._data.vo.tableUsers ~= nil
	slot5 = slot0._chairs

	for slot6, slot7 in ipairs(slot4) do
		if slot2 then
			slot1 = slot1 or (slot0._data.vo.tableUsers[slot6 - 1] ~= nil and slot0._data.vo.tableUsers[slot6 - 1].tagStatus.cbUserStatus == US_PLAYING)
			slot12 = slot0._data

			slot7.setTableData(slot10, slot7)

			slot13 = true

			slot7.setData(slot10, slot7, slot0._data.vo.tableUsers[slot6 - 1])
		end
	end

	slot6 = slot1

	slot0.layerInGame.setVisible(slot4, slot0.layerInGame)
end

BaseGameTableCcsPane.destroy = function (slot0)
	slot3 = slot0._chairs

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.destroy(slot7)
	end

	slot3 = slot0.btnTable

	destroySomeObj(slot2)

	slot3 = slot0.txtTableNum_tf

	destroySomeObj(slot2)
end

return
