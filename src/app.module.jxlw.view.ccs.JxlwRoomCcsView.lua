slot2 = "JxlwRoomCcsView"
JxlwRoomCcsView = class(slot1)

JxlwRoomCcsView.onCreationComplete = function (slot0)
	slot6 = -80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerTop.hhsw_room_logo_220, UIConfig.ALIGN_RIGHT)

	slot6 = slot0.layerRoomList.content_sv.getContentSize(slot7).height
	slot7 = cc.size(slot0.layerTop.hhsw_room_logo_220, display.width)

	slot0.layerRoomList.content_sv.setContentSize(display.width, slot2)

	slot7 = false

	slot0.layerRoomList.content_sv.setClippingEnabled(display.width, slot2)

	slot7 = true

	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(display.width, slot2)

	slot7 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.addContentChild(display.width, slot2)

	slot6 = slot0.layerRoomList.content_sv
	slot9 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.setInnerContainerSize(display.width, slot0.layerRoomList.layerContent.getContentSize(slot2))

	slot6 = slot0.layerRoomList.content_sv

	DisplayUtil.setAllCascadeOpacityEnabled(display.width)

	slot6 = slot0.layerBottom.bg
	slot12 = slot0.layerBottom.bg
	slot10 = slot0.layerBottom.bg.getContentSize(slot11).height

	slot0.layerBottom.bg.setContentSize(display.width, cc.size(slot2, display.width))

	slot9 = -30

	slot0.controller.adjustSlimWidth(display.width, slot0.controller, slot0.layerBottom.btnKSKS, UIConfig.ALIGN_RIGHT)

	slot9 = 80

	slot0.controller.adjustSlimWidth(display.width, slot0.controller, slot0.layerBottom.headFrame, UIConfig.ALIGN_LEFT)

	slot9 = 80

	slot0.controller.adjustSlimWidth(display.width, slot0.controller, slot0.layerBottom.head, UIConfig.ALIGN_LEFT)

	slot9 = 80

	slot0.controller.adjustSlimWidth(display.width, slot0.controller, slot0.layerBottom.txtName, UIConfig.ALIGN_LEFT)

	slot9 = 80

	slot0.controller.adjustSlimWidth(display.width, slot0.controller, slot0.layerBottom.userScore, UIConfig.ALIGN_LEFT)

	slot0._roomBtnInitPoses = {}
	slot0._roomBtns = {}
	slot4 = 1

	while true do
		if slot1["btn" .. slot4] then
			slot9 = slot5

			table.insert(slot7, slot0._roomBtns)

			slot5._kind = slot4
			slot11 = slot5
			slot0._roomBtnInitPoses[slot4] = DisplayUtil.ccpCopy(slot5.getPosition(slot10))
			slot9 = slot5

			slot2.addBtn2HandleTouchOperate(DisplayUtil.ccpCopy(slot5.getPosition(slot10)), slot2)
		else
			break
		end

		slot12 = "room/spines/jxlw_xuanchanglg.json"
		slot9 = slot0.controller.getUIPath(slot10, slot0.controller)
		slot13 = "room/spines/jxlw_xuanchanglg.atlas"
		slot6 = sp.SkeletonAnimation.createWithJsonFile(slot7, sp.SkeletonAnimation, slot0.controller.getUIPath(slot0.controller, slot0.controller))
		slot12 = true

		slot6.setAnimation(sp.SkeletonAnimation, slot6, 0, "animation")

		slot9 = slot6
		slot13 = 210

		slot6.setPosition(sp.SkeletonAnimation, cc.p("animation", 138))

		slot10 = slot6

		slot5.addChild(sp.SkeletonAnimation, slot5)

		if slot4 == 1 then
			slot13 = "room/spines/jxlw_tiyanxuanchang.json"
			slot10 = slot0.controller.getUIPath(slot11, slot0.controller)
			slot14 = "room/spines/jxlw_tiyanxuanchang.atlas"
			slot7 = sp.SkeletonAnimation.createWithJsonFile(slot8, sp.SkeletonAnimation, slot0.controller.getUIPath(slot0.controller, slot0.controller))
			slot13 = true

			slot7.setAnimation(sp.SkeletonAnimation, slot7, 0, "animation")

			slot10 = slot7
			slot14 = 280

			slot7.setPosition(sp.SkeletonAnimation, cc.p("animation", 138))

			slot11 = slot7

			slot5.addChild(sp.SkeletonAnimation, slot5)
		elseif slot4 == 2 then
			slot13 = "room/spines/jxlw_chujixuanchang.json"
			slot10 = slot0.controller.getUIPath(slot11, slot0.controller)
			slot14 = "room/spines/jxlw_chujixuanchang.atlas"
			slot7 = sp.SkeletonAnimation.createWithJsonFile(slot8, sp.SkeletonAnimation, slot0.controller.getUIPath(slot0.controller, slot0.controller))
			slot13 = true

			slot7.setAnimation(sp.SkeletonAnimation, slot7, 0, "animation")

			slot10 = slot7
			slot14 = 280

			slot7.setPosition(sp.SkeletonAnimation, cc.p("animation", 138))

			slot11 = slot7

			slot5.addChild(sp.SkeletonAnimation, slot5)
		elseif slot4 == 3 then
			slot13 = "room/spines/jxlw_putongxuanchang.json"
			slot10 = slot0.controller.getUIPath(slot11, slot0.controller)
			slot14 = "room/spines/jxlw_putongxuanchang.atlas"
			slot7 = sp.SkeletonAnimation.createWithJsonFile(slot8, sp.SkeletonAnimation, slot0.controller.getUIPath(slot0.controller, slot0.controller))
			slot13 = true

			slot7.setAnimation(sp.SkeletonAnimation, slot7, 0, "animation")

			slot10 = slot7
			slot14 = 280

			slot7.setPosition(sp.SkeletonAnimation, cc.p("animation", 138))

			slot11 = slot7

			slot5.addChild(sp.SkeletonAnimation, slot5)
		elseif slot4 == 4 then
			slot13 = "room/spines/jxlw_zhongjichang.json"
			slot10 = slot0.controller.getUIPath(slot11, slot0.controller)
			slot14 = "room/spines/jxlw_zhongjichang.atlas"
			slot7 = sp.SkeletonAnimation.createWithJsonFile(slot8, sp.SkeletonAnimation, slot0.controller.getUIPath(slot0.controller, slot0.controller))
			slot13 = true

			slot7.setAnimation(sp.SkeletonAnimation, slot7, 0, "animation")

			slot10 = slot7
			slot14 = 280

			slot7.setPosition(sp.SkeletonAnimation, cc.p("animation", 138))

			slot11 = slot7

			slot5.addChild(sp.SkeletonAnimation, slot5)
		elseif slot4 == 5 then
			slot13 = "room/spines/jxlw_gaojixuanchang.json"
			slot10 = slot0.controller.getUIPath(slot11, slot0.controller)
			slot14 = "room/spines/jxlw_gaojixuanchang.atlas"
			slot7 = sp.SkeletonAnimation.createWithJsonFile(slot8, sp.SkeletonAnimation, slot0.controller.getUIPath(slot0.controller, slot0.controller))
			slot13 = true

			slot7.setAnimation(sp.SkeletonAnimation, slot7, 0, "animation")

			slot10 = slot7
			slot14 = 280

			slot7.setPosition(sp.SkeletonAnimation, cc.p("animation", 138))

			slot11 = slot7

			slot5.addChild(sp.SkeletonAnimation, slot5)
		end

		slot4 = slot4 + 1
	end

	slot11 = "room/spines/jxlw_quickstart.json"
	slot8 = slot0.controller.getUIPath(slot9, slot0.controller)
	slot12 = "room/spines/jxlw_quickstart.atlas"
	slot5 = sp.SkeletonAnimation.createWithJsonFile(slot6, sp.SkeletonAnimation, slot0.controller.getUIPath(slot0.controller, slot0.controller))
	slot11 = true

	slot5.setAnimation(sp.SkeletonAnimation, slot5, 0, "animation")

	slot8 = slot5
	slot12 = -40

	slot5.setPosition(sp.SkeletonAnimation, cc.p("animation", 188))

	slot9 = slot5

	slot0.layerBottom.btnKSKS.spine.addChild(sp.SkeletonAnimation, slot0.layerBottom.btnKSKS.spine)

	slot9 = 210

	slot0.layerBottom.userScore.setStrBaseWidth(sp.SkeletonAnimation, slot0.layerBottom.userScore)

	slot10 = slot0

	Hero.pNickNameChangedSignal.add(sp.SkeletonAnimation, Hero.pNickNameChangedSignal, slot0.onNickNameChanged)

	slot8 = slot0

	slot0.onUserScoreChanged(sp.SkeletonAnimation)

	slot8 = slot0

	slot0.onNickNameChanged(sp.SkeletonAnimation)

	slot11 = slot0._roomBtns

	ClassUtil.extends(sp.SkeletonAnimation, slot0, BaseGameRoomView, true)

	slot0.originalPosScroll = cc.p(slot0.layerRoomList.layerContent.getPosition(true))
	slot0.originalPosTopLayer = cc.p(slot0.layerTop.getPosition(slot6))
	slot13 = slot0.layerBottom
	slot0.originalPosBottomLayer = cc.p(slot0.layerBottom.getPosition(slot0.layerTop))
end

JxlwRoomCcsView.updateRoomList = function (slot0)
	slot4 = slot0.model
	slot1 = gameMgr.getServerVosDicEx(slot2)[slot0.model.getGameKind(gameMgr)] or {}
	slot2 = 1
	slot3 = #slot0._roomBtns
	slot4 = 0
	slot5 = {}

	while slot2 <= slot3 do
		slot11 = slot1[slot2] ~= nil

		DisplayUtil.setVisible(slot9, slot0._roomBtns[slot2])

		if slot6 then
			slot11 = slot0._roomBtnInitPoses[slot4 + 1]

			slot7.setPosition(slot9, slot7)

			slot5[slot4 + 1] = slot7
			slot12 = slot6

			slot0.updateRoomBtn(slot9, slot0, slot7)
		end

		slot2 = slot2 + 1
	end

	slot6 = slot0.layerRoomList.layerContent
	slot7 = slot0.layerRoomList.content_sv
	slot8 = 0

	if slot4 > 0 then
		slot18 = slot5[slot4]
		slot18 = slot5[slot4]
		slot14 = 50 + slot5[slot4].getPositionX(slot15) + slot5[slot4].getScaleX(slot9) * slot5[slot4]:getContentSize().width * slot5[slot4]:getAnchorPoint().x
		slot8 = math.max(slot12, slot8)
	end

	slot11 = slot7
	slot17 = slot6
	slot15 = slot6.getContentSize(slot16).height

	slot7.setInnerContainerSize(slot10, cc.size(slot13, slot8))

	slot12 = (display.width - slot8) * 0.5
	slot13 = (CONFIG_DESIGN_WIDTH - display.width) * 0.5 + math.max(slot10, 40)

	slot7.setPositionX(40, slot7)
end

JxlwRoomCcsView.onShow = function (slot0)
	slot3 = slot0

	slot0.updateRoomList(slot2)

	slot5 = {
		autoAlpha = 1
	}

	TweenLite.to(slot2, slot0.bg, 0.05)

	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)

	slot3 = slot0

	slot0.playEnterAnimation(slot2)
end

JxlwRoomCcsView.playEnterAnimation = function (slot0)
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

	slot9 = slot0.layerBottom

	slot0.layerBottom.runAction(cc.EaseBackOut.create, cc.FadeTo.create(cc.MoveTo.create, cc.FadeTo, 0.3))

	slot9 = slot0.layerBottom
	slot12 = cc.EaseBackOut
	slot17 = slot0.originalPosBottomLayer

	slot0.layerBottom.runAction(cc.EaseBackOut.create, cc.EaseBackOut.create(cc.MoveTo.create, cc.MoveTo.create(255, cc.MoveTo, 0.4)))
end

JxlwRoomCcsView.onHide = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)
end

JxlwRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2)
	if slot1._kind ~= 1 then
		if slot2._miniNeed >= 10000 then
			slot7 = true

			slot1.txt_tf.setVisible(slot5, slot1.txt_tf)

			slot6 = slot1.Sprite_14
			slot10 = "room/number/image_threshold.png"

			slot1.Sprite_14.setTexture(slot5, slot0.controller.getUIPath(slot8, slot0.controller))

			slot6 = slot1.Sprite_14
			slot10 = 78

			slot1.Sprite_14.setPosition(slot5, cc.p(slot8, 63))

			slot7 = "room/number/jxlw_room_number_w.png"
			slot7 = slot3

			dump(slot0.controller)

			slot9 = "#jxlw_room_number_%d.png"
			slot3 = HtmlUtil.createArtNum(slot3 / 10000, math.ceil(slot0.controller)) .. HtmlUtil.createImg(math.ceil(slot0.controller), slot0.controller.getUIPath(slot5, slot0.controller), nil, 25, nil)
		elseif slot3 == 0 then
			slot6 = slot1.Sprite_14
			slot10 = "room/number/image_free.png"

			slot1.Sprite_14.setTexture(slot5, slot0.controller.getUIPath(slot8, slot0.controller))

			slot6 = slot1.Sprite_14
			slot10 = 78

			slot1.Sprite_14.setPosition(slot5, cc.p(slot8, 98))

			slot7 = false

			slot1.txt_tf.setVisible(slot5, slot1.txt_tf)
		else
			slot6 = slot1.Sprite_14
			slot10 = 78

			slot1.Sprite_14.setPosition(slot5, cc.p(slot8, 63))

			slot6 = slot1.Sprite_14
			slot10 = "room/number/image_threshold.png"

			slot1.Sprite_14.setTexture(slot5, slot0.controller.getUIPath(slot8, slot0.controller))

			slot7 = true

			slot1.txt_tf.setVisible(slot5, slot1.txt_tf)

			slot3 = HtmlUtil.createArtNum(slot5, slot3, "#jxlw_room_number_%d.png", nil, 25, nil)
		end

		slot7 = slot3

		slot1.txt_tf.setHtmlText(slot5, slot1.txt_tf)
	end

	slot6 = "room/number/image_sparse.png"
	slot3 = slot0.controller.getUIPath(slot4, slot0.controller)

	if slot2._totalOnline >= 80 then
		slot7 = "room/number/image_excessive.png"
		slot3 = slot0.controller.getUIPath(slot5, slot0.controller)
	elseif slot2._totalOnline >= 40 then
		slot7 = "room/number/image_crowded.png"
		slot3 = slot0.controller.getUIPath(slot5, slot0.controller)
	end

	slot7 = slot3

	slot1.Spr_state.setTexture(slot5, slot1.Spr_state)
end

JxlwRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot5 = slot0.controller

		slot0.controller.exitGame(slot4)
	elseif slot1 == slot0.layerTop.btnHelp then
		slot6 = true

		slot0.model.setIsShowingRule(slot4, slot0.model)
	elseif slot1 == slot0.layerBottom.btnKSKS then
		slot5 = slot0.controller

		slot0.controller.quickStartGame(slot4)
	elseif slot1._kind then
		slot6 = slot1._kind

		slot0.controller.requestEnterRoom(slot4, slot0.controller)
	end
end

JxlwRoomCcsView.onNickNameChanged = function (slot0)
	slot7 = 2
	slot5 = StringUtil.truncate(Hero, Hero.getPNickName(slot2), 10, nil)

	slot0.layerBottom.txtName.setString(Hero, slot0.layerBottom.txtName)
end

JxlwRoomCcsView.onUserScoreChanged = function (slot0)
	slot0.controller.setHeadBg(slot2, slot0.controller, slot0.layerBottom.head)

	slot4 = 170

	slot0.layerBottom.userScore.setStrBaseWidth(slot2, slot0.layerBottom.userScore)

	slot3 = slot0.layerBottom.userScore
	slot10 = Hero
	slot7 = "#jxlw_gold_number_%s.png"

	slot0.layerBottom.userScore.setStrTxt(slot2, HtmlUtil.createArtNumDot(GAME_STATE.ROOM, parseInt(Hero.getUserScore(slot9))))
end

JxlwRoomCcsView.destroy = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.pNickNameChangedSignal.remove(slot2, Hero.pNickNameChangedSignal, slot0.onNickNameChanged)

	slot3 = slot0._roomBtns

	for slot4, slot5 in ipairs(slot2) do
		if slot5.NodeNeed and slot5.NodeNeed.txtNeed_tf then
			slot8 = slot5.NodeNeed.txtNeed_tf

			slot5.NodeNeed.txtNeed_tf.destroy(slot7)
		end

		slot8 = slot5

		slot5.destroy(slot7)
	end

	slot3 = slot0.layerRoomList.content_sv

	destroySomeObj(slot2)

	slot3 = slot0.layerTop.layerNotice

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.userScore

	destroySomeObj(slot2)

	slot3 = slot0.layerTop.btnHelp

	destroySomeObj(slot2)

	slot3 = slot0.layerTop.btnBack

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.btnKSKS

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.head

	destroySomeObj(slot2)

	slot3 = slot0

	BaseGameRoomView.destroy(slot2)
end

return
