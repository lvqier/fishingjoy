slot2 = "DntglkRoomCcsView"
DntglkRoomCcsView = class(slot1)
slot0 = {
	{
		spine1 = "res/gameres/module/dntglk/roomSpine/lkpy_tiyanchang"
	},
	{},
	{
		spine1 = "res/gameres/module/dntglk/roomSpine/lkpy_chujichang"
	},
	{
		spine1 = "res/gameres/module/dntglk/roomSpine/lkpy_putongchang"
	},
	{
		spine1 = "res/gameres/module/dntglk/roomSpine/lkpy_zhongjichang"
	},
	{
		spine1 = "res/gameres/module/dntglk/roomSpine/lkpy_gaojichang"
	}
}

DntglkRoomCcsView.onCreationComplete = function (slot0)
	slot5 = cc.Director
	slot7 = cc.Director.getInstance(slot4).getVisibleSize(slot4)

	slot0.layerRoomList.content_sv.setContentSize(cc.Director.getInstance(slot4), slot2)

	slot7 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.addContentChild(cc.Director.getInstance(slot4), slot2)

	slot7 = true

	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(cc.Director.getInstance(slot4), slot2)

	slot6 = slot0.layerRoomList.content_sv
	slot9 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.setInnerContainerSize(cc.Director.getInstance(slot4), slot0.layerRoomList.layerContent.getContentSize(slot8))

	slot9 = 0

	slot0.controller.adjustSlimWidth(cc.Director.getInstance(slot4), slot0.controller, slot0.layerRoomList, UIConfig.ALIGN_LEFT)

	slot8 = 0
	slot0._roomBtnInitPoses = {
		[0] = cc.p(slot0.controller, -100)
	}
	slot0._intervalEnlargeRates = {
		[0] = 0,
		0,
		0.3,
		0.1,
		0.05,
		0
	}
	slot0._roomBtnsDic = {}
	slot0._roomBtnInterval = 0
	slot0.bInitSpine = false
	slot4 = 1
	slot5 = 1

	while slot4 <= 10 do
		if slot1["btn" .. slot4] then
			slot0._roomBtnsDic[slot4] = slot6
			slot6._kind = slot4
			slot12 = slot6
			slot0._roomBtnInitPoses[slot5] = DisplayUtil.ccpCopy(slot6.getPosition(slot11))
			slot5 = slot5 + 1
			slot10 = slot6

			slot2.addBtn2HandleTouchOperate(DisplayUtil.ccpCopy(slot6.getPosition(slot11)), slot2)

			if device.platform == "windows" then
				slot11 = "res/button/backtotoppressed.png"
				slot7 = ccui.Button.create(slot8, ccui.Button, "res/button/backtotopnormal.png")

				slot7.setPosition(slot6, slot7, slot6.getContentSize(ccui.Button).width / 2)

				slot11 = slot7
				slot16 = slot4

				slot7.addTouchEventListener(slot6, c_func(slot6.getContentSize(ccui.Button).height / 2, slot0.onButton_Click, slot0))

				slot12 = slot7

				slot6:addChild(slot6)
			end
		end

		slot4 = slot4 + 1
	end

	slot0._roomBtnInterval = slot0._roomBtnInitPoses[2].x - slot0._roomBtnInitPoses[1].x
	slot9 = 136

	slot0.layerBottom.scoreInfo.setStrBaseWidth(slot0._roomBtnInitPoses[1].x, slot0.layerBottom.scoreInfo)

	slot9 = true

	slot0.layerBottom.scoreInfo.setIsAutoHAlignCenter(slot0._roomBtnInitPoses[1].x, slot0.layerBottom.scoreInfo)

	slot9 = IS_IOS_VERIFY and IS_IOS_VERIFY_BANK

	DisplayUtil.setVisible(slot7, slot0.layerBottom.scoreInfo.btnAdd.sp)

	slot9 = not IS_IOS_VERIFY or not not IS_IOS_VERIFY_ALL

	DisplayUtil.setVisible(slot7, slot0.layerBottom.btnKSKS)

	slot11 = slot0._roomBtnsDic

	ClassUtil.extends(slot7, slot0, BaseGameRoomView, true)

	slot12 = 1
	slot7 = sp.SkeletonAnimation.create(slot0, sp.SkeletonAnimation, DisplayUtil.setVisible .. ".json", DisplayUtil.setVisible .. ".atlas")
	slot13 = true

	slot7.setAnimation(sp.SkeletonAnimation, slot7, 0, "animation")

	slot10 = slot7
	slot14 = 55

	slot7.setPosition(sp.SkeletonAnimation, cc.p("animation", 175))

	slot11 = slot7

	slot0.layerBottom.btnKSKS.addChild(sp.SkeletonAnimation, slot0.layerBottom.btnKSKS)
	Hero.pNickNameChangedSignal.add(sp.SkeletonAnimation, Hero.pNickNameChangedSignal, slot0.onNickNameChanged)

	slot10 = slot0

	slot0.onUserScoreChanged(sp.SkeletonAnimation)

	slot10 = slot0

	slot0.onNickNameChanged(sp.SkeletonAnimation)

	slot0.originalPosScroll = cc.p(slot0.layerRoomList.layerContent.getPosition(slot0))
	slot0.originalPosTopLayer = cc.p(slot0.layerTop.getPosition(slot0.layerBottom.btnKSKS))
	slot15 = slot0.layerBottom
	slot0.originalPosBottomLayer = cc.p(slot0.layerBottom.getPosition(slot0.layerTop))
end

DntglkRoomCcsView.onButton_Click = function (slot0, slot1, slot2, slot3)
	if slot3 == ccui.TouchEventType.ended then
		slot7 = slot1

		slot0.controller.requestEnterRoom(slot5, slot0.controller)

		slot7 = {}

		gameMgr.setGameStackMsgs(slot5, gameMgr)

		slot7 = false

		gameMgr.setNeedStoreGameStackMsg(slot5, gameMgr)
	end
end

DntglkRoomCcsView.updateRoomList = function (slot0)
	slot4 = slot0.model
	slot2 = 1
	slot3 = 0
	slot4 = {}
	slot7 = gameMgr.getServerVosDicEx(slot2)[slot0.model.getGameKind(gameMgr)] or {}

	dump(slot6)

	while slot2 <= 10 do
		slot5 = slot1[slot2]

		if slot0._roomBtnsDic[slot2] then
			slot10 = slot5 ~= nil

			DisplayUtil.setVisible(slot8, slot6)

			if slot5 then
				slot10 = slot0._roomBtnInitPoses[slot3 + 1]

				slot6.setPosition(slot8, slot6)

				if slot0.bInitSpine == false then
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

	slot0.bInitSpine = true
	slot10 = cc.Director
	slot10 = cc.Director.getInstance(slot9)
	slot9 = slot0.layerRoomList.content_sv
	slot10 = slot0._roomBtnInitPoses[slot3].x + 180 + slot0._roomBtnInterval * slot0._intervalEnlargeRates[slot3] * (slot3 - 1)
	slot12 = 0

	if cc.Director.getInstance(slot9).getVisibleSize(slot9).width - 1334 > 10 then
		slot10 = slot10 + 160
		slot12 = 80
	end

	if slot10 <= slot11 then
		slot16 = slot8

		slot9.setInnerContainerSize(slot14, slot9)

		slot12 = slot12 + (slot11 - slot10) / 2
	else
		slot15 = slot9
		slot19 = slot8.height

		slot9.setInnerContainerSize(slot14, cc.size(slot17, slot10))
	end

	for slot16 = 1, slot3, 1 do
		slot22 = slot4[slot16]
		slot18 = cc.p(slot4[slot16].getPosition(slot21))
		slot18.x = slot18.x + slot12 + slot6 * (slot16 - 1)
		slot22 = slot18

		slot4[slot16].setPosition(slot6 * (slot16 - 1), slot4[slot16])
	end
end

DntglkRoomCcsView.onHide = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)
end

DntglkRoomCcsView.onShow = function (slot0)
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

DntglkRoomCcsView.playEnterAnimation = function (slot0)
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

DntglkRoomCcsView.addSpineAni = function (slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if #slot0 < slot2 then
		return
	end

	slot9 = 1

	if sp.SkeletonAnimation.create(slot5, sp.SkeletonAnimation, slot3 .. ".json", slot3 .. ".atlas") ~= nil then
		slot10 = true

		slot4.setAnimation(slot6, slot4, 0, "animation")

		slot8 = display.CENTER

		slot4.setAnchorPoint(slot6, slot4)

		slot7 = slot4
		slot11 = -10

		slot4.setPosition(slot6, cc.p("animation", 0))

		slot8 = slot4

		slot1.addChild(slot6, slot1)
	end
end

DntglkRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2, slot3)
	if slot3 == 1 then
		slot7 = true

		slot1.imgFree.setVisible(slot5, slot1.imgFree)

		slot7 = false

		slot1.dntglk_limit_label.setVisible(slot5, slot1.dntglk_limit_label)

		slot7 = false

		slot1.txtNeed_tf.setVisible(slot5, slot1.txtNeed_tf)
	else
		slot7 = "#dntglk_room_%s.png"
		slot8 = HtmlUtil.createArtNumWithHansUnits(slot5, slot2._miniNeed)

		slot1.txtNeed_tf.setHtmlText(slot2._miniNeed, slot1.txtNeed_tf)

		slot8 = true

		slot1.dntglk_limit_label.setVisible(slot2._miniNeed, slot1.dntglk_limit_label)

		slot8 = false

		slot1.imgFree.setVisible(slot2._miniNeed, slot1.imgFree)
	end

	if slot1.imgOnline then
		slot4 = nil

		if slot2._totalOnline < 40 and slot2._totalOnline >= 0 then
			slot8 = "txt/ico_kongxian.png"
			slot4 = slot0.controller.getUIPath(slot6, slot0.controller)
		elseif slot2._totalOnline >= 40 and slot2._totalOnline < 80 then
			slot8 = "txt/ico_yongji.png"
			slot4 = slot0.controller.getUIPath(slot6, slot0.controller)
		elseif slot2._totalOnline >= 80 then
			slot8 = "txt/ico_huobao.png"
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

DntglkRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
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

DntglkRoomCcsView.onNickNameChanged = function (slot0)
	slot7 = 2
	slot5 = StringUtil.truncate(Hero, Hero.getPNickName(slot2), 10, nil)

	slot0.layerBottom.txtName.setString(Hero, slot0.layerBottom.txtName)
end

DntglkRoomCcsView.onUserScoreChanged = function (slot0)
	slot3 = slot0.layerBottom.scoreInfo
	slot8 = Hero
	slot15 = nil

	slot0.layerBottom.scoreInfo.setStrTxt(slot2, HtmlUtil.createArtNumDot(slot5, Hero.getUserScore(slot7), "#dntglk_score_%s.png", nil, nil, nil, nil, nil, nil, -4))

	slot5 = GAME_STATE.ROOM

	slot0.controller.setHeadBg(slot2, slot0.controller, slot0.layerBottom.head)
end

DntglkRoomCcsView.destroy = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.pNickNameChangedSignal.remove(slot2, Hero.pNickNameChangedSignal, slot0.onNickNameChanged)

	slot3 = slot0._roomBtnsDic

	for slot4, slot5 in pairs(slot2) do
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

return
