SerialRoomCcsView = class("SerialRoomCcsView")

SerialRoomCcsView.onCreationComplete = function (slot0)
	slot0.layerRoomList.content_sv.setContentSize(slot2, slot3)
	slot0.layerRoomList.content_sv.setInnerContainerSize(slot2, slot0.layerRoomList.layerContent.getContentSize(slot1))
	slot0.layerRoomList.content_sv.setClippingEnabled(slot2, false)
	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(slot2, true)
	slot0.layerRoomList.content_sv.addContentChild(slot2, slot1)
	DisplayUtil.setAllCascadeOpacityEnabled(slot2)

	slot0._roomBtnInitPoses = {}
	slot0._roomBtns = {}

	for slot8 = 1, 5, 1 do
		if slot1["btn" .. slot8] ~= nil then
			table.insert(slot0._roomBtns, slot9)

			slot9._index = slot8
			slot9._kind = slot8
			slot0._roomBtnInitPoses[slot8] = DisplayUtil.ccpCopy(slot9:getPosition())

			if device.platform ~= "windows" then
				slot2:addBtn2HandleTouchOperate(slot9)
			end
		end
	end

	slot0:initRoomSpine()

	slot0._textScore = require("app.module.serial.component.SpriteNumber").new(slot6, Serial.Room.TextureScore, 13, {
		x = 0.5,
		y = 0.5
	})

	slot0.layerBottom.nodeScore:addChild(slot0._textScore)
	slot0:alignComponent()

	slot0._originX, slot0._originY = slot1:getPosition()
end

SerialRoomCcsView.alignComponent = function (slot0)
	slot0.controller:adjustSlimWidth(slot0.layerTop.btnBack, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerTop.btnQuestion, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.btnFastBegin, UIConfig.ALIGN_RIGHT, -80)
	slot0.controller:adjustSlimWidth(slot0.imageLogo, UIConfig.ALIGN_RIGHT, -80)

	for slot5 = 1, #{
		slot0.layerBottom.head,
		slot0.layerBottom.Sprite_1,
		slot0.layerBottom.text_name,
		slot0.layerBottom.bgFrame,
		slot0.layerBottom.icon,
		slot0.layerBottom.btnInc,
		slot0.layerBottom.nodeScore
	}, 1 do
		slot0.controller:adjustSlimWidth(slot1[slot5], UIConfig.ALIGN_LEFT, 80)
	end
end

SerialRoomCcsView.initRoomSpine = function (slot0)
	for slot5 = 1, 5, 1 do
		slot8 = sp.SkeletonAnimation:create(Serial.Room.SpineEntry[slot5].json, Serial.Room.SpineEntry[slot5].atlas)

		slot8:setAnchorPoint(0.5, 0.5)
		slot8:setAnimation(0, "animation", true)
		slot0._roomBtns[slot5].spineNode:addChild(slot8)
	end

	slot2 = sp.SkeletonAnimation:create(Serial.Room.SpineFastEntry.json, Serial.Room.SpineFastEntry.atlas)

	slot2:setPosition(slot0.layerBottom.btnFastBegin:getContentSize().width * 0.5, 0)
	slot2:setAnimation(0, "animation", true)
	slot0.layerBottom.btnFastBegin:addChild(slot2)
end

SerialRoomCcsView.updateButtonState = function (slot0)
	slot3 = gameMgr:getServerVosDicEx()[slot0.model:getGameKind()] or {}
	slot0._cellScore = {}
	slot5 = 0
	slot6 = {}

	for slot10 = 1, 5, 1 do
		if slot3[slot0._roomBtns[slot10]._kind] then
			DisplayUtil.setVisible(slot11, true)

			slot6[slot5 + 1] = slot11

			slot11:setEnabled(true)
			slot11:setPosition(slot0._roomBtnInitPoses[slot5 + 1])

			slot0._cellScore[slot10] = slot12._dwCellScore

			if slot12._miniNeed > 0 then
				if slot11.costImage then
					slot11.costImage:setVisible(false)
				end

				slot11.txtEntry_tf:setText(HtmlUtil.createImg(Serial.Serial_Root .. "room/zhunru_shuzi/zhunru.png") .. HtmlUtil.createArtNumWithHansUnits(slot13, Serial.Serial_Root .. "room/zhunru_shuzi/zhunrushuzi_%s.png"))
			end

			slot11.node_tag:addChild(cc.Sprite:create(Serial.Room.FreeState[1]))
		else
			DisplayUtil.setVisible(slot11, false)

			if slot11.txtEntry_tf then
				slot11.txtEntry_tf:setVisible(false)
			end

			if slot11.costImage then
				slot11.costImage:setVisible(false)
			end

			slot11:setCanTouch(false)
			slot11.node_tag:addChild(cc.Sprite:create(Serial.Room.FreeState[1]))
		end
	end

	slot7 = slot0.layerRoomList.layerContent
	slot8 = slot0.layerRoomList.content_sv
	slot9 = 0
	slot0._roomCount = slot5

	if slot5 > 0 then
		slot9 = math.max(slot9, 50 + slot6[slot5].getPositionX(slot10) + slot6[slot5].getScaleX(slot10) * slot6[slot5].getContentSize(slot10).width * slot6[slot5]:getAnchorPoint().x)
	end

	slot8:setInnerContainerSize(cc.size(slot9 + 50, slot7:getContentSize().height))

	if display.width <= slot9 then
		slot11 = 80

		if math.abs(slot10) < 10 then
			slot11 = 0
		end

		if display.width <= CONFIG_CUR_WIDTH then
			slot11 = slot11 + 20
		end

		slot8:setPositionX(-slot10 + slot11)
	else
		slot8:setPositionX((CONFIG_DESIGN_WIDTH - display.width) * 0.5 + math.max(40, (display.width - slot9) * 0.5))
	end

	slot0._roomsWidth = slot9
	slot0._curShowingBtns = slot6
end

SerialRoomCcsView.onHide = function (slot0)
	Hero.pNickNameChangedSignal:remove(slot0.onUserNameChanged, slot0)
	Hero.userScoreChangedSignal:remove(slot0.onUserScoreChanged, slot0)
end

SerialRoomCcsView.onShow = function (slot0)
	TweenLite.to(slot0:getParent():getParent().layerNotice, 0.4, {
		x = 407,
		y = 673
	})
	Hero.pNickNameChangedSignal:add(slot0.onUserNameChanged, slot0)
	Hero.userScoreChangedSignal:add(slot0.onUserScoreChanged, slot0)
	slot0.layerRoomList.content_sv:jumpTo(0)
	slot0:updateButtonState()
	slot0:onUserNameChanged()
	slot0:onUserScoreChanged()
	slot0:playEntryAnimation()
end

SerialRoomCcsView.playEntryAnimation = function (slot0)
	slot0.layerRoomList:setCascadeOpacityEnabled(true)
	slot0.layerTop:setCascadeOpacityEnabled(true)
	slot0.layerBottom:setCascadeOpacityEnabled(true)

	if slot0._roomCount >= 5 then
		slot3, slot4 = slot0.layerRoomList.content_sv:getPosition()

		slot0.layerRoomList.layerContent:setPosition(slot5, slot2)
		slot0.layerRoomList.layerContent.setOpacity(slot6, 0)
		slot0.layerRoomList.layerContent.runAction(slot6, cc.Sequence:create(cc.DelayTime:create(0.2), cc.FadeTo:create(0.1, 255)))
		slot0.layerRoomList.layerContent:runAction(cc.Sequence:create(cc.DelayTime:create(0.3), cc.EaseBackOut:create(cc.MoveTo:create(1, cc.p(slot0._originX, slot0._originY)))))
	else
		slot2 = cc.p(slot0._originX, slot0._originY)

		slot0.layerRoomList.layerContent.setOpacity(slot1, 0)
		slot0.layerRoomList.layerContent.setPosition(slot1, slot2.x + 100, slot2.y)
		slot0.layerRoomList.layerContent.runAction(slot1, cc.FadeTo:create(0.3, 255))
		slot0.layerRoomList.layerContent:runAction(cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot2)))
	end

	slot2 = cc.p(slot0.layerTop.getPosition(slot1))

	slot0.layerTop.setOpacity(slot1, 0)
	slot0.layerTop.setPosition(slot1, slot2.x, slot2.y + 60)
	slot0.layerTop.runAction(slot1, cc.FadeTo:create(0.3, 255))
	slot0.layerTop.runAction(slot1, cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot2)))

	slot4 = cc.p(slot0.layerBottom.getPosition(slot3))

	slot0.layerBottom.setOpacity(slot3, 0)
	slot0.layerBottom.setPosition(slot3, slot4.x, slot4.y - 60)
	slot0.layerBottom.runAction(slot3, cc.FadeTo:create(0.3, 255))
	slot0.layerBottom:runAction(cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot4)))
end

SerialRoomCcsView.onUserNameChanged = function (slot0)
	slot0.layerBottom.text_name:setString(StringUtil.truncate(Hero:getPNickName(), 9, nil, 2))
end

SerialRoomCcsView.onUserScoreChanged = function (slot0)
	slot0._textScore:setNumber(slot1)
	slot0.controller:setHeadBg(slot0.layerBottom.head, GAME_STATE.ROOM)
end

SerialRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	print("--------onButtonEvent----")

	if slot1 == slot0.layerTop.btnBack then
		slot0.controller:exitGame()
	elseif slot1 == slot0.layerTop.btnQuestion then
		slot0.model:setIsShowingRule(true)
	elseif slot1 == slot0.layerBottom.btnInc then
		slot0.controller:try2OpenBank()
	elseif slot1 == slot0.layerBottom.btnFastBegin then
		slot0.controller:quickStartGame()
	else
		slot0.controller:requestEnterRoom(slot1._kind)
		slot0.model:setCellScore(slot0._cellScore[slot1._kind])
		slot0.controller:onNetMessageCabcelCache()
	end
end

SerialRoomCcsView.destroy = function (slot0)
	print("--destroy serial_room_view--")
	slot0.layerRoomList.layerContent.btn1:destroy()
	slot0.layerRoomList.layerContent.btn2:destroy()
	slot0.layerRoomList.layerContent.btn3:destroy()
	slot0.layerRoomList.layerContent.btn4:destroy()
	slot0.layerRoomList.layerContent.btn5:destroy()
	slot0.layerTop.btnBack:destroy()
	slot0.layerTop.btnQuestion:destroy()
	slot0.layerRoomList.content_sv:destroy()
	slot0.layerBottom.btnFastBegin:destroy()
end

return
