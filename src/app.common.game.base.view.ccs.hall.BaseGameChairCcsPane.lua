slot2 = "BaseGameChairCcsPane"
BaseGameChairCcsPane = class(slot1)

BaseGameChairCcsPane.onCreationComplete = function (slot0)
	slot7 = slot0.spChair

	ClassUtil.extends(slot2, slot0, ZoomCcsBtn, true, slot0.touchArea)

	slot5 = nil

	createSetterGetter(slot2, slot0, "index")

	slot13 = slot0.onData

	createSetterGetter(slot2, slot0, "data", nil, nil, nil, nil, handler(slot11, slot0))

	slot5 = nil

	createSetterGetter(slot2, slot0, "tableData")

	slot0._cachedUserKey = nil
	slot3 = slot0

	slot0.onData(slot2)
end

BaseGameChairCcsPane.handleScrollBtns = function (slot0, slot1)
	slot5 = slot0

	slot1.addBtn2HandleTouchOperate(slot3, slot1)
end

BaseGameChairCcsPane.onClick = function (slot0)
	if slot0._tableData and not slot0._data then
		slot1 = slot0._tableData.vo.wTableId
		slot2 = slot0._index - 1

		if slot0._tableData.vo.tagStatus.cbTableLock == 1 then
			function slot7(slot0)
				slot3 = "桌子密码：" .. slot0

				print(slot2)

				slot6 = slot0

				slot0.controller.requestSitDown(slot2, slot0.controller, slot0.controller.requestSitDown, slot2)
			end

			popupMgr.showRoomPasswordPopup(slot5, popupMgr)
		else
			slot7 = slot2

			slot0.controller.requestSitDown(slot4, slot0.controller, slot1)
		end
	end
end

BaseGameChairCcsPane.onData = function (slot0)
	slot1 = nil

	if slot0._data then
		slot5 = slot0._data.wUserId

		if not gameMgr.getUserData(slot3, gameMgr) then
			slot0._data = nil
		end
	end

	slot5 = slot0._data ~= nil

	slot0.layerPlayer.setVisible(slot3, slot0.layerPlayer)

	slot5 = slot0._data == nil

	slot0.spChair.setVisible(slot3, slot0.spChair)

	if slot0._data then
		if slot1.__oldStatus == US_FREE and slot0._data.tagStatus.cbUserStatus == US_SIT then
		end

		if slot0._data.szNickName ~= slot0._cachedUserKey then
			slot0._cachedUserKey = slot2
			slot8 = 2
			slot3 = StringUtil.truncate(slot4, slot0._data.szNickName, 8, nil)
			slot4 = ""

			if IS_GUAN_VERIFY then
				slot5 = nil

				if slot0._data.lExperience == 0 then
					slot8 = "ui/common/pic/xfh_xzDN.png"
					slot5 = ResConfig.getAssetPath(slot7)
				else
					slot8 = "ui/common/pic/xfh_xzSJ.png"
					slot5 = ResConfig.getAssetPath(slot7)
				end

				if not slot0.layerPlayer.spOnline then
					slot12 = 3
					slot4 = HtmlUtil.createImg(slot7, slot5, nil, 25, nil)
				else
					slot9 = slot5

					slot0.layerPlayer.spOnline.setTexture(slot7, slot0.layerPlayer.spOnline)
				end
			elseif not slot0.layerPlayer.spOnline then
				slot8 = slot0._data.lExperience
				slot4 = slot0.model.getOnlineIconBy(slot6, slot0.model)
			else
				slot8 = slot0._data.lExperience
				slot9 = slot0.model.getOnlineIconPath(slot6, slot0.model)

				slot0.layerPlayer.spOnline.setTexture(slot0.model, slot0.layerPlayer.spOnline)
			end

			slot8 = (slot0._index == 1 and slot3 .. " " .. slot4) or slot4 .. " " .. slot3

			slot0.layerPlayer.txtName_tf.setHtmlText(slot6, slot0.layerPlayer.txtName_tf)
		end

		slot6 = slot0._data.tagStatus.cbUserStatus == US_READY

		slot0.layerPlayer.spReady.setVisible(slot4, slot0.layerPlayer.spReady)

		if slot0.model._gameKind == nil then
			if B_HEADCLIPPING == false then
				if IS_GUAN_VERIFY then
					slot8 = slot0._data.wGender
					slot7 = mainMgr.getHeadBgByGameKind(slot4, mainMgr, GameKind_HALLGuan, GAME_STATE.TABLE)

					slot0.layerPlayer.head.changeHeadBG(mainMgr, slot0.layerPlayer.head)
				else
					slot8 = slot0._data.wGender
					slot7 = mainMgr.getHeadBgByGameKind(slot4, mainMgr, GameKind_QBSK, GAME_STATE.TABLE)

					slot0.layerPlayer.head.changeHeadBG(mainMgr, slot0.layerPlayer.head)
				end
			end
		elseif IS_GUAN_VERIFY then
			slot9 = GameKind_HALLGuan

			slot0.controller.setHeadBg(slot4, slot0.controller, slot0.layerPlayer.head, GAME_STATE.TABLE, slot0._data.wGender)
		else
			slot8 = slot0._data.wGender

			slot0.controller.setHeadBg(slot4, slot0.controller, slot0.layerPlayer.head, GAME_STATE.TABLE)
		end

		slot3 = slot0.layerPlayer.head.getUserData(slot4)
		slot7 = slot0._data

		slot0.layerPlayer.head.setUserData(slot0.layerPlayer.head, slot0.layerPlayer.head)

		if slot0.layerPlayer.headWK then
			if B_HEADCLIPPING == false then
				slot7 = true

				slot0.layerPlayer.headWK.setVisible(slot5, slot0.layerPlayer.headWK)

				slot6 = slot0.layerPlayer.headWK
				slot9 = slot0.layerPlayer.head

				slot0.layerPlayer.headWK.setPosition(slot5, slot0.layerPlayer.head.getPosition(slot8))
			elseif B_HEADCLIPPING == true then
				slot7 = false

				slot0.layerPlayer.headWK.setVisible(slot5, slot0.layerPlayer.headWK)
			end
		end
	else
		slot0._cachedUserKey = nil
	end
end

BaseGameChairCcsPane.destroy = function (slot0)
	slot3 = slot0.layerPlayer.head

	slot0.layerPlayer.head.destroy(slot2)

	slot3 = slot0.layerPlayer.txtName_tf

	slot0.layerPlayer.txtName_tf.destroy(slot2)

	slot3 = slot0

	ZoomCcsBtn.destroy(slot2)
end

return
