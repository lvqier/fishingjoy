slot2 = "TgpdRoomCcsView"
TgpdRoomCcsView = class(slot1)

TgpdRoomCcsView.onCreationComplete = function (slot0)
	slot6 = slot0.layerRoomList.content_sv.getContentSize(slot7).height
	slot7 = cc.size(slot4, display.width)

	slot0.layerRoomList.content_sv.setContentSize(display.width, slot2)

	slot6 = slot0.layerRoomList.content_sv
	slot9 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.setInnerContainerSize(display.width, slot0.layerRoomList.layerContent.getContentSize(slot2))

	slot7 = false

	slot0.layerRoomList.content_sv.setClippingEnabled(display.width, slot2)

	slot7 = true

	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(display.width, slot2)

	slot7 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.addContentChild(display.width, slot2)

	slot6 = slot0.layerRoomList.content_sv

	DisplayUtil.setAllCascadeOpacityEnabled(display.width)

	slot0._roomBtnInitPoses = {}
	slot0._roomBtns = {}

	for slot8 = 1, 4, 1 do
		if slot1["btn" .. slot8] ~= nil then
			slot13 = slot9

			table.insert(slot11, slot0._roomBtns)

			slot9._index = slot8
			slot9._kind = slot8
			slot15 = slot9
			slot0._roomBtnInitPoses[slot8] = DisplayUtil.ccpCopy(slot9.getPosition(slot14))

			if device.platform ~= "windows" then
				slot13 = slot9

				slot2.addBtn2HandleTouchOperate(slot11, slot2)
			end
		end
	end

	slot7 = slot0

	slot0.initRoomSpine(slot6)

	slot9 = Hero
	slot10 = {
		x = 0.5,
		y = 0.5
	}
	slot10 = CandyFunc.createSpriteNumber(Hero.getUserScore, slot5, Candy.root .. "room/score/%s.png")

	slot0.layerBottom.node_score.addChild(slot5, slot0.layerBottom.node_score)

	slot9 = slot0

	slot0.alignComponent(slot5)

	slot9 = slot1
	slot0._originX, slot0._originY = slot1.getPosition(slot5)
end

TgpdRoomCcsView.alignComponent = function (slot0)
	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerTop.btnBack, UIConfig.ALIGN_LEFT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerTop.btnQuestion, UIConfig.ALIGN_LEFT)

	slot6 = -80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.btn_fast_start, UIConfig.ALIGN_RIGHT)

	slot6 = -80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.imageLogo, UIConfig.ALIGN_RIGHT)
end

TgpdRoomCcsView.initRoomSpine = function (slot0)
	return
end

TgpdRoomCcsView.updateButtonState = function (slot0)
	slot4 = gameMgr
	slot3 = gameMgr.getServerVosDicEx(slot0.model)[slot0.model.getGameKind(slot2)] or {}
	slot0._cellScore = {}
	slot5 = 0
	slot6 = {}

	for slot10 = 1, 4, 1 do
		if slot3[slot0._roomBtns[slot10]._kind] then
			slot16 = true

			DisplayUtil.setVisible(slot14, slot11)

			slot6[slot5 + 1] = slot11
			slot16 = true

			slot11.setEnabled(slot14, slot11)

			slot16 = slot0._roomBtnInitPoses[slot5 + 1]

			slot11.setPosition(slot14, slot11)

			slot0._cellScore[slot10] = slot12._dwCellScore

			if slot12._miniNeed > 0 and slot11.costImage then
				slot17 = false

				slot11.costImage.setVisible(slot15, slot11.costImage)
			end
		else
			slot16 = false

			DisplayUtil.setVisible(slot14, slot11)

			if slot11.txtEntry_tf then
				slot16 = false

				slot11.txtEntry_tf.setVisible(slot14, slot11.txtEntry_tf)
			end

			if slot11.costImage then
				slot16 = false

				slot11.costImage.setVisible(slot14, slot11.costImage)
			end

			slot16 = false

			slot11.setCanTouch(slot14, slot11)
		end
	end

	slot7 = slot0.layerRoomList.layerContent
	slot8 = slot0.layerRoomList.content_sv
	slot9 = 0
	slot0._roomCount = slot5

	if slot5 > 0 then
		slot19 = slot6[slot5]
		slot19 = slot6[slot5]
		slot15 = 50 + slot6[slot5].getPositionX(slot16) + slot6[slot5].getScaleX(slot10) * slot6[slot5]:getContentSize().width * slot6[slot5]:getAnchorPoint().x
		slot9 = math.max(slot13, slot9)
	end

	slot12 = slot8
	slot18 = slot7
	slot16 = slot7.getContentSize(slot17).height

	slot8.setInnerContainerSize(slot11, cc.size(slot14, slot9 + 50))

	if display.width <= slot9 then
		slot11 = 80
		slot14 = (display.width - CUR_SELECTED_WIDTH) * 0.5

		if math.abs(slot13) < 10 then
			slot11 = 0
		end

		if display.width <= CONFIG_CUR_WIDTH then
			slot11 = slot11 + 20
		end

		slot15 = -slot10 + slot11

		slot8.setPositionX(slot13, slot8)
	else
		slot13 = (display.width - slot9) * 0.5
		slot14 = (CONFIG_DESIGN_WIDTH - display.width) * 0.5 + math.max(slot11, 40)

		slot8.setPositionX(40, slot8)
	end

	slot0._roomsWidth = slot9
	slot0._curShowingBtns = slot6
end

TgpdRoomCcsView.onHide = function (slot0)
	slot5 = slot0

	Hero.pNickNameChangedSignal.remove(slot2, Hero.pNickNameChangedSignal, slot0.onUserNameChanged)

	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)
end

TgpdRoomCcsView.onShow = function (slot0)
	slot5 = slot0
	slot5 = slot0.getParent(slot4)
	slot5 = {
		x = 407,
		y = 673
	}

	TweenLite.to(slot2, slot0.getParent(slot4).getParent(slot4).layerNotice, 0.4)

	slot5 = slot0

	Hero.pNickNameChangedSignal.add(slot2, Hero.pNickNameChangedSignal, slot0.onUserNameChanged)

	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot4 = 0

	slot0.layerRoomList.content_sv.jumpTo(slot2, slot0.layerRoomList.content_sv)

	slot3 = slot0

	slot0.updateButtonState(slot2)

	slot3 = slot0

	slot0.onUserNameChanged(slot2)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)
end

TgpdRoomCcsView.playEntryAnimation = function (slot0)
	slot4 = true

	slot0.layerRoomList.setCascadeOpacityEnabled(slot2, slot0.layerRoomList)

	slot4 = true

	slot0.layerTop.setCascadeOpacityEnabled(slot2, slot0.layerTop)

	slot4 = true

	slot0.layerBottom.setCascadeOpacityEnabled(slot2, slot0.layerBottom)

	if slot0._roomCount >= 5 then
		slot5 = slot0.layerRoomList.content_sv
		slot3, slot4 = slot0.layerRoomList.content_sv.getPosition(slot4)
		slot10 = slot0._originY

		slot0.layerRoomList.layerContent.setPosition(CONFIG_DESIGN_WIDTH, slot0.layerRoomList.layerContent, slot5)

		slot10 = 0

		slot0.layerRoomList.layerContent.setOpacity(slot0.layerRoomList.layerContent, slot6)

		slot9 = slot0.layerRoomList.layerContent
		slot16 = 0.2
		slot13 = cc.DelayTime.create(slot14, cc.DelayTime)

		slot0.layerRoomList.layerContent.runAction(slot0.layerRoomList.layerContent, cc.Sequence.create(slot11, cc.Sequence, cc.FadeTo.create(cc.DelayTime, cc.FadeTo, 0.1)))

		slot9 = slot0.layerRoomList.layerContent
		slot16 = 0.3
		slot13 = cc.DelayTime.create(cc.FadeTo.create, cc.DelayTime)
		slot16 = cc.EaseBackOut
		slot20 = 1
		slot24 = slot0._originY

		slot0.layerRoomList.layerContent.runAction(slot0.layerRoomList.layerContent, cc.Sequence.create(slot11, cc.Sequence, cc.EaseBackOut.create(cc.DelayTime, cc.MoveTo.create(255, cc.MoveTo, cc.p(slot22, slot0._originX)))))
	else
		slot5 = slot0._originY
		slot2 = cc.p(slot3, slot0._originX)
		slot6 = 0

		slot0.layerRoomList.layerContent.setOpacity(slot0._originX, slot1)
		slot0.layerRoomList.layerContent.setPosition(slot0._originX, slot1, slot2.x + 100)

		slot5 = slot0.layerRoomList.layerContent

		slot0.layerRoomList.layerContent.runAction(slot0._originX, cc.FadeTo.create(slot2.y, cc.FadeTo, 0.3))

		slot5 = slot0.layerRoomList.layerContent
		slot8 = cc.EaseBackOut
		slot13 = slot2

		slot0.layerRoomList.layerContent.runAction(slot0._originX, cc.EaseBackOut.create(slot2.y, cc.MoveTo.create(255, cc.MoveTo, 0.4)))
	end

	slot6 = slot0.layerTop
	slot2 = cc.p(slot0.layerTop.getPosition(slot5))
	slot6 = 0

	slot0.layerTop.setOpacity(slot0.layerTop.getPosition, slot1)
	slot0.layerTop.setPosition(slot0.layerTop.getPosition, slot1, slot2.x)

	slot5 = slot0.layerTop

	slot0.layerTop.runAction(slot0.layerTop.getPosition, cc.FadeTo.create(slot2.y + 60, cc.FadeTo, 0.3))

	slot5 = slot0.layerTop
	slot8 = cc.EaseBackOut
	slot13 = slot2

	slot0.layerTop.runAction(slot0.layerTop.getPosition, cc.EaseBackOut.create(slot2.y + 60, cc.MoveTo.create(255, cc.MoveTo, 0.4)))

	slot8 = slot0.layerBottom
	slot4 = cc.p(slot0.layerBottom.getPosition(slot2.y + 60))
	slot8 = 0

	slot0.layerBottom.setOpacity(slot0.layerBottom.getPosition, slot3)
	slot0.layerBottom.setPosition(slot0.layerBottom.getPosition, slot3, slot4.x)

	slot7 = slot0.layerBottom

	slot0.layerBottom.runAction(slot0.layerBottom.getPosition, cc.FadeTo.create(slot4.y - 60, cc.FadeTo, 0.3))

	slot7 = slot0.layerBottom
	slot10 = cc.EaseBackOut
	slot15 = slot4

	slot0.layerBottom.runAction(slot0.layerBottom.getPosition, cc.EaseBackOut.create(slot4.y - 60, cc.MoveTo.create(255, cc.MoveTo, 0.4)))
end

TgpdRoomCcsView.onUserNameChanged = function (slot0)
	slot7 = 2
	slot5 = StringUtil.truncate(Hero, Hero.getPNickName(slot2), 9, nil)

	slot0.layerBottom.text_name.setString(Hero, slot0.layerBottom.text_name)
end

TgpdRoomCcsView.onUserScoreChanged = function (slot0)
	slot5 = Hero
	slot4 = slot0.layerBottom.node_score

	slot0.layerBottom.node_score.removeAllChildren(Hero.getUserScore)

	slot7 = {
		x = 0.5,
		y = 0.5
	}
	slot6 = CandyFunc.createSpriteNumber(Hero.getUserScore, parseInt(Hero.getUserScore(slot4)), Candy.root .. "room/score/%s.png", {})

	slot0.layerBottom.node_score.addChild(parseInt(Hero.getUserScore(slot4)), slot0.layerBottom.node_score)

	slot7 = GAME_STATE.ROOM

	slot0.controller.setHeadBg(parseInt(Hero.getUserScore(slot4)), slot0.controller, slot0.layerBottom.head)
end

TgpdRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	slot5 = "--------onButtonEvent----"

	print(slot4)

	if slot1 == slot0.layerTop.btnBack then
		slot5 = slot0.controller

		slot0.controller.exitGame(slot4)
	elseif slot1 == slot0.layerTop.btnQuestion then
		slot6 = true

		slot0.model.setIsShowingRule(slot4, slot0.model)
	elseif slot1 == slot0.layerBottom.btnAdd then
		slot5 = slot0.controller

		slot0.controller.try2OpenBank(slot4)
	elseif slot1 == slot0.layerBottom.btn_fast_start then
		slot5 = slot0.controller

		slot0.controller.quickStartGame(slot4)
	else
		slot6 = slot1._kind

		slot0.controller.requestEnterRoom(slot4, slot0.controller)

		slot6 = slot0._cellScore[slot1._kind]

		slot0.model.setCellScore(slot4, slot0.model)

		slot5 = slot0.controller

		slot0.controller.onNetMessageCabcelCache(slot4)
	end
end

TgpdRoomCcsView.destroy = function (slot0)
	print(slot2)

	slot4 = slot0.layerRoomList.layerContent.btn1

	slot0.layerRoomList.layerContent.btn1.destroy("--destroy serial_room_view--")

	slot4 = slot0.layerRoomList.layerContent.btn2

	slot0.layerRoomList.layerContent.btn2.destroy("--destroy serial_room_view--")

	slot4 = slot0.layerRoomList.layerContent.btn3

	slot0.layerRoomList.layerContent.btn3.destroy("--destroy serial_room_view--")

	slot4 = slot0.layerRoomList.layerContent.btn4

	slot0.layerRoomList.layerContent.btn4.destroy("--destroy serial_room_view--")

	slot4 = slot0.layerRoomList.layerContent.btn5

	slot0.layerRoomList.layerContent.btn5.destroy("--destroy serial_room_view--")

	slot4 = slot0.layerTop.btnBack

	slot0.layerTop.btnBack.destroy("--destroy serial_room_view--")

	slot4 = slot0.layerTop.btnQuestion

	slot0.layerTop.btnQuestion.destroy("--destroy serial_room_view--")

	slot4 = slot0.layerRoomList.content_sv

	slot0.layerRoomList.content_sv.destroy("--destroy serial_room_view--")

	slot4 = slot0.layerBottom.btn_fast_start

	slot0.layerBottom.btn_fast_start.destroy("--destroy serial_room_view--")
end

return
