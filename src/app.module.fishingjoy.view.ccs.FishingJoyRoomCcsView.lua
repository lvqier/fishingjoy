slot2 = "FishingJoyRoomCcsView"
FishingJoyRoomCcsView = class(slot1)

FishingJoyRoomCcsView.onCreationComplete = function (slot0)
	slot6 = slot0.layerRoomList.content_sv.getContentSize(slot7).height
	slot7 = cc.size(slot4, display.width)

	slot0.layerRoomList.content_sv.setContentSize(display.width, slot2)

	slot7 = false

	slot0.layerRoomList.content_sv.setClippingEnabled(display.width, slot2)

	slot7 = true

	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(display.width, slot2)

	slot7 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.addContentChild(display.width, slot2)

	slot6 = slot0.layerRoomList.content_sv
	slot9 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.setInnerContainerSize(display.width, slot0.layerRoomList.layerContent.getContentSize(slot0.layerRoomList.content_sv))

	slot6 = slot0.layerRoomList.content_sv

	DisplayUtil.setAllCascadeOpacityEnabled(display.width)

	slot0.roomBtnPosition = {}
	slot0.roomBtnContainer = {}
	slot0.initedSpine = false
	slot4 = 1
	slot5 = 1

	while slot4 <= 10 do
		if slot1["btn" .. slot4] then
			slot0.roomBtnContainer[slot4] = slot6
			slot6._kind = slot4
			slot12 = slot6
			slot0.roomBtnPosition[slot5] = DisplayUtil.ccpCopy(slot6.getPosition(slot11))
			slot5 = slot5 + 1
			slot10 = slot6

			slot2.addBtn2HandleTouchOperate(DisplayUtil.ccpCopy(slot6.getPosition(slot11)), slot2)
		end

		slot4 = slot4 + 1
	end

	slot9 = IS_IOS_VERIFY and IS_IOS_VERIFY_BANK

	DisplayUtil.setVisible(slot7, slot0.layerBottom.scoreInfo.btnAdd)

	slot9 = not IS_IOS_VERIFY or not not IS_IOS_VERIFY_ALL

	DisplayUtil.setVisible(slot7, slot0.layerBottom.btnKSKS)

	if NewbieUI then
		slot9 = slot0.model
		NewbieUI.plazaRoomQuickStartBtns[slot0.model.getGameKind(slot8)] = slot0.layerBottom.btnKSKS
	end

	slot11 = slot0.roomBtnContainer

	ClassUtil.extends(slot7, slot0, BaseGameRoomView, true)
	Hero.pNickNameChangedSignal.add(slot7, Hero.pNickNameChangedSignal, slot0.onNickNameChanged)

	slot8 = slot0

	slot0.onUserScoreChanged(slot7)

	slot8 = slot0

	slot0.onNickNameChanged(slot7)

	slot8 = slot0

	slot0.alignComponent(slot7)

	slot0.originalPosScroll = cc.p(slot0.layerRoomList.layerContent.getPosition(slot0))
	slot0.originalPosTopLayer = cc.p(slot0.layerTop.getPosition(slot6))
	slot13 = slot0.layerBottom
	slot0.originalPosBottomLayer = cc.p(slot0.layerBottom.getPosition(slot0.layerTop))
end

FishingJoyRoomCcsView.onBottomShowComplete = function (slot0)
	slot4 = GameEvent.GAME_ROOM_BOTTOM_SHOW_COMPLETE
	slot7 = slot0.model

	eventMgr.dispatch(slot2, eventMgr, slot0.model.getGameKind(slot6))
end

FishingJoyRoomCcsView.alignComponent = function (slot0)
	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerTop.btnBack, UIConfig.ALIGN_LEFT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerTop.btnHelp, UIConfig.ALIGN_LEFT)

	slot6 = -80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.btnKSKS, UIConfig.ALIGN_RIGHT)

	slot6 = -80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerTop.dntgtest_Room_logo, UIConfig.ALIGN_RIGHT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.Dntg_Room_tx2bg, UIConfig.ALIGN_LEFT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.scoreInfo, UIConfig.ALIGN_LEFT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.head, UIConfig.ALIGN_LEFT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.txtName, UIConfig.ALIGN_LEFT)
end

FishingJoyRoomCcsView.onButton_Click = function (slot0, slot1, slot2, slot3)
	if slot3 == ccui.TouchEventType.ended then
		slot7 = slot1

		slot0.controller.requestEnterRoom(slot5, slot0.controller)

		slot7 = {}

		gameMgr.setGameStackMsgs(slot5, gameMgr)

		slot7 = false

		gameMgr.setNeedStoreGameStackMsg(slot5, gameMgr)
	end
end

FishingJoyRoomCcsView.updateRoomList = function (slot0)
	slot4 = slot0.model
	slot1 = gameMgr.getServerVosDicEx(slot2)[slot0.model.getGameKind(gameMgr)] or {}
	slot2 = 1
	slot3 = 0
	slot4 = {}

	while slot2 <= 10 do
		slot5 = slot1[slot2]

		if slot0.roomBtnContainer[slot2] then
			slot10 = slot5 ~= nil

			DisplayUtil.setVisible(slot8, slot6)

			if slot5 then
				slot3 = slot3 + 1

				if slot2 == 6 then
					slot9 = slot6
					slot13 = slot0.roomBtnPosition[slot3].y

					slot6.setPosition(slot8, cc.p(slot11, slot0.roomBtnPosition[slot3].x + 10))
				else
					slot10 = slot0.roomBtnPosition[slot3]

					slot6.setPosition(slot8, slot6)
				end

				if slot0.initedSpine == false then
					slot11 = slot2

					slot0.addSpineAni(slot8, slot0, slot6.spineNode)
				end

				slot4[slot3] = slot6
				slot12 = slot2

				slot0.updateRoomBtn(slot8, slot0, slot6, slot5)
			end
		end

		slot2 = slot2 + 1
	end

	slot0.initedSpine = true
	slot5 = slot0.layerRoomList.layerContent
	slot6 = slot0.layerRoomList.content_sv
	slot7 = 0

	if slot3 > 0 then
		slot17 = slot4[slot3]
		slot17 = slot4[slot3]
		slot13 = 50 + slot4[slot3].getPositionX(slot14) + slot4[slot3].getScaleX(slot8) * slot4[slot3]:getContentSize().width * slot4[slot3]:getAnchorPoint().x
		slot7 = math.max(slot11, slot7)
	end

	slot10 = slot6
	slot16 = slot5
	slot14 = slot5.getContentSize(slot15).height

	slot6.setInnerContainerSize(slot9, cc.size(slot12, slot7))

	slot11 = (display.width - slot7) * 0.5
	slot12 = (CONFIG_DESIGN_WIDTH - display.width) * 0.5 + math.max(slot9, 40)

	slot6.setPositionX(40, slot6)
end

FishingJoyRoomCcsView.onHide = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)
end

FishingJoyRoomCcsView.onShow = function (slot0)
	slot4 = false

	slot0.model.setIsShowingBattleLoading(slot2, slot0.model)

	slot3 = slot0

	slot0.updateRoomList(slot2)

	slot4 = 0

	slot0.layerRoomList.content_sv.jumpTo(slot2, slot0.layerRoomList.content_sv)

	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)

	slot3 = slot0

	slot0.playEnterAnimation(slot2)
end

FishingJoyRoomCcsView.playEnterAnimation = function (slot0)
	slot4 = true

	slot0.layerRoomList.setCascadeOpacityEnabled(slot2, slot0.layerRoomList)

	slot4 = true

	slot0.layerTop.setCascadeOpacityEnabled(slot2, slot0.layerTop)
	slot0.layerBottom.setCascadeOpacityEnabled(slot2, slot0.layerBottom)

	slot6 = 0

	slot0.layerRoomList.layerContent.setOpacity(true, slot1)

	slot5 = slot0.layerRoomList.layerContent
	slot9 = slot0.originalPosScroll.y

	slot0.layerRoomList.layerContent.setPosition(true, cc.p(slot7, slot0.originalPosScroll.x + 100))

	slot5 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.layerContent.runAction(true, cc.FadeTo.create(slot7, cc.FadeTo, 0.3))

	slot5 = slot0.layerRoomList.layerContent
	slot8 = cc.EaseBackOut
	slot13 = slot0.originalPosScroll

	slot0.layerRoomList.layerContent.runAction(true, cc.EaseBackOut.create(slot7, cc.MoveTo.create(255, cc.MoveTo, 0.4)))

	slot8 = 0

	slot0.layerTop.setOpacity(cc.EaseBackOut.create, slot3)

	slot7 = slot0.layerTop
	slot11 = slot0.originalPosTopLayer.y + 60

	slot0.layerTop.setPosition(cc.EaseBackOut.create, cc.p(cc.MoveTo.create, slot0.originalPosTopLayer.x))

	slot7 = slot0.layerTop

	slot0.layerTop.runAction(cc.EaseBackOut.create, cc.FadeTo.create(cc.MoveTo.create, cc.FadeTo, 0.3))

	slot7 = slot0.layerTop
	slot10 = cc.EaseBackOut
	slot15 = slot0.originalPosTopLayer

	slot0.layerTop.runAction(cc.EaseBackOut.create, cc.EaseBackOut.create(cc.MoveTo.create, cc.MoveTo.create(255, cc.MoveTo, 0.4)))

	slot10 = 0

	slot0.layerBottom.setOpacity(cc.EaseBackOut.create, slot5)

	slot9 = slot0.layerBottom
	slot13 = slot0.originalPosBottomLayer.y - 60

	slot0.layerBottom.setPosition(cc.EaseBackOut.create, cc.p(cc.MoveTo.create, slot0.originalPosBottomLayer.x))

	slot14 = 255

	slot0.layerBottom.runAction(cc.EaseBackOut.create, cc.FadeTo.create(cc.MoveTo.create, cc.FadeTo, 0.3))

	slot10 = cc.EaseBackOut
	slot15 = slot0.originalPosBottomLayer
	slot10 = cc.CallFunc
	slot14 = slot0.onBottomShowComplete
	slot10 = slot0.layerBottom
	slot14 = {
		cc.EaseBackOut.create(slot0.layerBottom, cc.MoveTo.create(cc.FadeTo, cc.MoveTo, 0.4)),
		cc.CallFunc.create(slot0.layerBottom, handler(cc.FadeTo, slot0))
	}

	slot0.layerBottom:runAction(cc.Sequence.create(cc.FadeTo, cc.Sequence))
end

FishingJoyRoomCcsView.addSpineAni = function (slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot5 = slot2

	if not FishingJoy_LocalRes_GetRoomSpine(slot4) then
		return
	end

	slot4 = slot3.hero
	slot5 = slot3.frontBg
	slot12 = 1

	if sp.SkeletonAnimation.create(slot8, sp.SkeletonAnimation, slot6 .. ".json", slot6 .. ".atlas") ~= nil then
		slot13 = true

		slot7.setAnimation(slot9, slot7, 0, "animation")

		slot11 = display.CENTER

		slot7.setAnchorPoint(slot9, slot7)

		slot10 = slot7
		slot14 = -220

		slot7.setPosition(slot9, cc.p("animation", 5))

		slot11 = slot7

		slot1.addChild(slot9, slot1)
	end

	slot13 = 1

	if sp.SkeletonAnimation.create(slot9, sp.SkeletonAnimation, slot4 .. ".json", slot4 .. ".atlas") ~= nil then
		slot14 = true

		slot8.setAnimation(slot10, slot8, 0, "animation")

		slot12 = display.CENTER

		slot8.setAnchorPoint(slot10, slot8)

		slot11 = slot8
		slot15 = -100

		slot8.setPosition(slot10, cc.p("animation", 5))

		slot12 = slot8

		slot1.addChild(slot10, slot1)
	end

	slot14 = 1

	if sp.SkeletonAnimation.create(slot10, sp.SkeletonAnimation, slot5 .. ".json", slot5 .. ".atlas") ~= nil then
		slot15 = true

		slot9.setAnimation(slot11, slot9, 0, "animation")

		slot13 = display.CENTER

		slot9.setAnchorPoint(slot11, slot9)

		slot12 = slot9
		slot16 = -220

		slot9.setPosition(slot11, cc.p("animation", 5))

		slot13 = slot9

		slot1.addChild(slot11, slot1)
	end
end

FishingJoyRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2, slot3)
	if slot3 == 1 and slot1.imgFree then
		slot7 = true

		slot1.imgFree.setVisible(slot5, slot1.imgFree)

		if slot1.txtNeed_tf then
			slot7 = false

			slot1.txtNeed_tf.setVisible(slot5, slot1.txtNeed_tf)
		end
	else
		slot8 = "common/fishingJoy_hld.png"
		slot12 = 4
		slot9 = HtmlUtil.createImg(slot0.controller, slot5, nil, nil, nil) .. " " .. slot2._miniNeed

		slot1.txtNeed_tf.setHtmlText(" ", slot1.txtNeed_tf)
	end

	if slot1.txtOnline_tf then
		slot7 = false

		slot1.txtOnline_tf.setVisible(slot5, slot1.txtOnline_tf)
	end

	if slot1.imgOnline then
		slot4 = nil

		if slot2._totalOnline < 40 and slot2._totalOnline >= 0 then
			slot8 = "room/fishingJoy_ico_kongxian.png"
			slot4 = slot0.controller.getUIPath(slot6, slot0.controller)
		elseif slot2._totalOnline >= 40 and slot2._totalOnline < 80 then
			slot8 = "room/fishingJoy_ico_yongji.png"
			slot4 = slot0.controller.getUIPath(slot6, slot0.controller)
		elseif slot2._totalOnline >= 80 then
			slot8 = "room/fishingJoy_ico_huobao.png"
			slot4 = slot0.controller.getUIPath(slot6, slot0.controller)
		end

		if slot4 == nil then
			slot8 = false

			slot1.imgOnline.setVisible(slot6, slot1.imgOnline)

			return
		end

		slot8 = true

		slot1.imgOnline.setVisible(slot6, slot1.imgOnline)

		slot8 = slot4

		slot1.imgOnline.loadTexture(slot6, slot1.imgOnline)
	end
end

FishingJoyRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot5 = slot0.controller

		slot0.controller.exitGame(slot4)
	elseif slot1 == slot0.layerTop.btnHelp then
		slot6 = true

		slot0.model.setIsShowingRule(slot4, slot0.model)
	elseif slot1 == slot0.layerBottom.btnJDZJ then
		slot6 = "该功能尚未开放！"

		tweenMsgMgr.showRedMsg(slot4, tweenMsgMgr)
	elseif slot1 == slot0.layerBottom.btnKSKS then
		slot5 = slot0.controller

		slot0.controller.quickStartGame(slot4)
	elseif slot1._kind then
		slot6 = slot1._kind

		slot0.controller.requestEnterRoom(slot4, slot0.controller)

		slot6 = {}

		gameMgr.setGameStackMsgs(slot4, gameMgr)

		slot6 = false

		gameMgr.setNeedStoreGameStackMsg(slot4, gameMgr)
	end
end

FishingJoyRoomCcsView.onNickNameChanged = function (slot0)
	slot6 = nil
	slot5 = StringUtil.truncate(Hero, Hero.getPNickName(slot2), 8)

	slot0.layerBottom.txtName.setString(Hero, slot0.layerBottom.txtName)
end

FishingJoyRoomCcsView.onUserScoreChanged = function (slot0)
	slot3 = slot0.layerBottom.scoreInfo
	slot8 = Hero
	slot7 = "#fishingJoy_room_score_%s.png"

	slot0.layerBottom.scoreInfo.setStrTxt(slot2, HtmlUtil.createArtNumDot(slot5, Hero.getUserScore(slot7)))

	slot5 = GAME_STATE.ROOM

	slot0.controller.setHeadBg(slot2, slot0.controller, slot0.layerBottom.head)
end

FishingJoyRoomCcsView.destroy = function (slot0)
	if NewbieUI then
		slot4 = slot0.model
		NewbieUI.plazaRoomQuickStartBtns[slot0.model.getGameKind(slot3)] = nil
	end

	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.pNickNameChangedSignal.remove(slot2, Hero.pNickNameChangedSignal, slot0.onNickNameChanged)

	slot1 = pairs
	slot3 = slot0.roomBtnContainer or {}

	for slot4, slot5 in slot1(slot2) do
		slot8 = slot5.txtNeed_tf

		destroySomeObj(slot7)

		slot8 = slot5.txtOnline_tf

		destroySomeObj(slot7)

		slot8 = slot5

		slot5.destroy(slot7)
	end

	slot3 = slot0.layerTop.btnBack

	destroySomeObj(slot2)

	slot3 = slot0.layerTop.btnHelp

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.btnJDZJ

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.btnKSKS

	destroySomeObj(slot2)

	slot3 = slot0.layerTop.layerNotice

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.head

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.scoreInfo

	destroySomeObj(slot2)

	slot3 = slot0.layerRoomList.content_sv

	destroySomeObj(slot2)

	slot3 = slot0

	BaseGameRoomView.destroy(slot2)
end

return FishingJoyRoomCcsView
