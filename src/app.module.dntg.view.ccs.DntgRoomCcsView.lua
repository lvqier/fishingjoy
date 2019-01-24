DntgRoomCcsView = class("DntgRoomCcsView")
slot0 = {
	{
		hero = "res/gameres/module/dntg/fishgame2d/roomSpine/dly/hero/dntg_dly_b1",
		backBg = "res/gameres/module/dntg/fishgame2d/roomSpine/dly/bg/denglongyu2DUI_a2",
		frontBg = "res/gameres/module/dntg/fishgame2d/roomSpine/dly/bg/denglongyu2DUI_a1"
	},
	{},
	{
		hero = "res/gameres/module/dntg/fishgame2d/roomSpine/wugui/hero/dntg_wugui",
		backBg = "res/gameres/module/dntg/fishgame2d/roomSpine/wugui/bg/wugui_Back_background",
		frontBg = "res/gameres/module/dntg/fishgame2d/roomSpine/wugui/bg/wugui_Fore_background"
	},
	{
		hero = "res/gameres/module/dntg/fishgame2d/roomSpine/sy/hero/dntg_sy_b",
		backBg = "res/gameres/module/dntg/fishgame2d/roomSpine/sy/bg/shayu2DUI_a2",
		frontBg = "res/gameres/module/dntg/fishgame2d/roomSpine/sy/bg/shayu2DUI_a1"
	},
	{
		hero = "res/gameres/module/dntg/fishgame2d/roomSpine/yudi/hero/dntg_yd",
		backBg = "res/gameres/module/dntg/fishgame2d/roomSpine/yudi/bg/yd_Back_background",
		frontBg = "res/gameres/module/dntg/fishgame2d/roomSpine/yudi/bg/yd_Fore_background"
	},
	{
		hero = "res/gameres/module/dntg/fishgame2d/roomSpine/sunwukong/hero/dntg_wk",
		backBg = "res/gameres/module/dntg/fishgame2d/roomSpine/sunwukong/bg/wukong_Back_background",
		frontBg = "res/gameres/module/dntg/fishgame2d/roomSpine/sunwukong/bg/wukong_Fore_background"
	}
}

DntgRoomCcsView.onCreationComplete = function (slot0)
	slot0.layerRoomList.content_sv.setContentSize(slot2, slot3)
	slot0.layerRoomList.content_sv.setClippingEnabled(slot2, false)
	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(slot2, true)
	slot0.layerRoomList.content_sv.addContentChild(slot2, slot1)
	slot0.layerRoomList.content_sv.setInnerContainerSize(slot2, slot0.layerRoomList.layerContent:getContentSize())

	slot0._roomBtnInitPoses = {}
	slot0._roomBtnsDic = {}
	slot0.bInitSpine = false
	slot4 = 1
	slot5 = 1

	while slot4 <= 10 do
		if slot1["btn" .. slot4] then
			slot0._roomBtnsDic[slot4] = slot6
			slot6._kind = slot4
			slot0._roomBtnInitPoses[slot5] = DisplayUtil.ccpCopy(slot6:getPosition())
			slot5 = slot5 + 1

			if device.platform ~= "windows" then
				slot2:addBtn2HandleTouchOperate(slot6)
			end
		end

		slot4 = slot4 + 1
	end

	DisplayUtil.setVisible(slot0.layerBottom.scoreInfo.btnAdd.sp, (IS_IOS_VERIFY and IS_IOS_VERIFY_BANK) or IS_SDK_VERIFY)
	DisplayUtil.setVisible(slot0.layerBottom.btnKSKS, not IS_IOS_VERIFY or not not IS_IOS_VERIFY_ALL)

	if NewbieUI then
		NewbieUI.plazaRoomQuickStartBtns[slot0.model:getGameKind()] = slot0.layerBottom.btnKSKS
	end

	ClassUtil.extends(slot0, BaseGameRoomView, true, slot0._roomBtnsDic)
	Hero.pNickNameChangedSignal:add(slot0.onNickNameChanged, slot0)
	slot0:onUserScoreChanged()
	slot0:onNickNameChanged()
	slot0:alignComponent()

	slot0.originalPosScroll = cc.p(slot0.layerRoomList.layerContent.getPosition(slot6))
	slot0.originalPosTopLayer = cc.p(slot0.layerTop.getPosition(slot7))
	slot0.originalPosBottomLayer = cc.p(slot0.layerBottom:getPosition())

	if IS_SDK_VERIFY then
		slot9 = ccui.Layout:create()

		ClassUtil.extends(slot9, ZoomCcsBtn, true, slot9)

		slot0._chongzhiSpine = sp.SkeletonAnimation:create(slot10, slot11)

		slot0._chongzhiSpine:setPosition(78, 35)
		slot0._chongzhiSpine:setAnimation(0, "animation", true)
		slot0:addChild(slot9)
		slot9:setContentSize(cc.size(172, 75))
		slot9:setPosition(cc.p(862, 0))
		slot9:addChild(slot0._chongzhiSpine)
		slot9:addTouchEventListener(handler(slot0, slot0.onRecharge))
	end
end

DntgRoomCcsView.onRecharge = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_ENDED then
		slot3 = nil

		requireModule("ChargeModule")
		ProxyCharge:show(nil, function ()
			slot0.model:setIsShowingBank(true)
		end)
	end
end

DntgRoomCcsView.onBottomShowComplete = function (slot0)
	eventMgr:dispatch(GameEvent.GAME_ROOM_BOTTOM_SHOW_COMPLETE, slot0.model:getGameKind())
end

DntgRoomCcsView.alignComponent = function (slot0)
	slot0.controller:adjustSlimWidth(slot0.layerTop.btnBack, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerTop.btnHelp, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.btnKSKS, UIConfig.ALIGN_RIGHT, -80)
	slot0.controller:adjustSlimWidth(slot0.layerTop.dntgtest_Room_logo, UIConfig.ALIGN_RIGHT, -80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.Dntg_Room_tx2bg, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.scoreInfo, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.head, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.txtName, UIConfig.ALIGN_LEFT, 80)
end

DntgRoomCcsView.updateRoomList = function (slot0)
	slot1 = gameMgr:getServerVosDicEx()[slot0.model:getGameKind()] or {}
	slot2 = 1
	slot3 = 0
	slot4 = {}

	while slot2 <= 10 do
		slot5 = slot1[slot2]

		if slot0._roomBtnsDic[slot2] then
			DisplayUtil.setVisible(slot6, slot5 ~= nil)

			if slot5 then
				slot3 = slot3 + 1

				if slot2 == 6 then
					slot6:setPosition(cc.p(slot0._roomBtnInitPoses[slot3].x + 10, slot0._roomBtnInitPoses[slot3].y))
				else
					slot6:setPosition(slot0._roomBtnInitPoses[slot3])
				end

				if slot0.bInitSpine == false then
					slot0:addSpineAni(slot6.spineNode, slot2)
				end

				slot4[slot3] = slot6

				slot0:updateRoomBtn(slot6, slot5)
			end
		end

		slot2 = slot2 + 1
	end

	slot0.bInitSpine = true
	slot5 = slot0.layerRoomList.layerContent
	slot6 = slot0.layerRoomList.content_sv
	slot7 = 0

	if slot3 > 0 then
		slot7 = math.max(slot7, 50 + slot4[slot3].getPositionX(slot8) + slot4[slot3].getScaleX(slot8) * slot4[slot3].getContentSize(slot8).width * slot4[slot3]:getAnchorPoint().x)
	end

	slot6:setInnerContainerSize(cc.size(slot7, slot5:getContentSize().height))
	slot6:setPositionX((CONFIG_DESIGN_WIDTH - display.width) * 0.5 + math.max(40, (display.width - slot7) * 0.5))
end

DntgRoomCcsView.onHide = function (slot0)
	Hero.userScoreChangedSignal:remove(slot0.onUserScoreChanged, slot0)
end

DntgRoomCcsView.onShow = function (slot0)
	slot0.model:setIsShowingBattleLoading(false)
	Hero.userScoreChangedSignal:add(slot0.onUserScoreChanged, slot0)
	slot0:onUserScoreChanged()
	slot0:updateRoomList()
	slot0.layerRoomList.content_sv:jumpTo(0)
	slot0:playEnterAnimation()
end

DntgRoomCcsView.playEnterAnimation = function (slot0)
	slot0.layerRoomList:setCascadeOpacityEnabled(true)
	slot0.layerTop:setCascadeOpacityEnabled(true)
	slot0.layerBottom:setCascadeOpacityEnabled(true)
	slot0.layerRoomList.layerContent.setOpacity(slot1, 0)
	slot0.layerRoomList.layerContent.setPosition(slot1, cc.p(slot0.originalPosScroll.x + 100, slot0.originalPosScroll.y))
	slot0.layerRoomList.layerContent.runAction(slot1, cc.FadeTo:create(0.3, 255))
	slot0.layerRoomList.layerContent.runAction(slot1, cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot2)))
	slot0.layerTop.setOpacity(slot3, 0)
	slot0.layerTop.setPosition(slot3, cc.p(slot0.originalPosTopLayer.x, slot0.originalPosTopLayer.y + 60))
	slot0.layerTop.runAction(slot3, cc.FadeTo:create(0.3, 255))
	slot0.layerTop.runAction(slot3, cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot4)))
	slot0.layerBottom.setOpacity(slot5, 0)
	slot0.layerBottom.setPosition(slot5, cc.p(slot0.originalPosBottomLayer.x, slot0.originalPosBottomLayer.y - 60))
	slot0.layerBottom.runAction(slot5, cc.FadeTo:create(0.3, 255))
	slot0.layerBottom:runAction(cc.Sequence:create({
		cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot0.originalPosBottomLayer)),
		cc.CallFunc:create(handler(slot0, slot0.onBottomShowComplete))
	}))
end

DntgRoomCcsView.addSpineAni = function (slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if #slot0 < slot2 then
		return
	end

	slot3 = slot0[slot2].hero
	slot4 = slot0[slot2].frontBg

	if sp.SkeletonAnimation:create(slot5 .. ".json", slot5 .. ".atlas", 1) ~= nil then
		slot6:setAnimation(0, "animation", true)
		slot6:setAnchorPoint(display.CENTER)
		slot6:setPosition(cc.p(5, -220))
		slot1:addChild(slot6)
	end

	if sp.SkeletonAnimation:create(slot3 .. ".json", slot3 .. ".atlas", 1) ~= nil then
		slot7:setAnimation(0, "animation", true)
		slot7:setAnchorPoint(display.CENTER)
		slot7:setPosition(cc.p(0, -100))
		slot1:addChild(slot7)
	end

	if sp.SkeletonAnimation:create(slot4 .. ".json", slot4 .. ".atlas", 1) ~= nil then
		slot8:setAnimation(0, "animation", true)
		slot8:setAnchorPoint(display.CENTER)
		slot8:setPosition(cc.p(5, -220))
		slot1:addChild(slot8)
	end
end

DntgRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2)
	if tonumber(slot2._miniNeed) == 0 then
		slot1.dntg_play_free:setVisible(true)
		slot1.txtNeed_tf:setVisible(false)
	else
		slot1.txtNeed_tf:setHtmlText(HtmlUtil.createImg(slot4, nil, nil, nil, 4) .. " " .. slot3)
	end

	if slot1.txtOnline_tf then
		slot1.txtOnline_tf:setVisible(false)
	end

	if slot1.imgOnline then
		slot4 = nil

		if slot2._totalOnline < 40 and slot2._totalOnline >= 0 then
			slot4 = slot0.controller:getUIPath("txt/ico_kongxian.png")
		elseif slot2._totalOnline >= 40 and slot2._totalOnline < 80 then
			slot4 = slot0.controller:getUIPath("txt/ico_yongji.png")
		elseif slot2._totalOnline >= 80 then
			slot4 = slot0.controller:getUIPath("txt/ico_huobao.png")
		end

		if slot4 == nil then
			slot1.imgOnline:setVisible(false)

			return
		end

		slot1.imgOnline:setVisible(true)
		slot1.imgOnline:loadTexture(slot4)
	end
end

DntgRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot0.controller:exitGame()
	elseif slot1 == slot0.layerTop.btnHelp then
		slot0.model:setIsShowingRule(true)
	elseif slot1 == slot0.layerBottom.btnJDZJ then
		tweenMsgMgr:showRedMsg("该功能尚未开放！")
	elseif slot1 == slot0.layerBottom.btnKSKS then
		slot0.controller:quickStartGame()
	elseif slot1._kind then
		slot0.controller:requestEnterRoom(slot1._kind)
		print("进入游戏", slot1._kind)
	end
end

DntgRoomCcsView.onNickNameChanged = function (slot0)
	slot0.layerBottom.txtName:setString(StringUtil.truncate(Hero:getPNickName(), 20, nil, 2))
end

DntgRoomCcsView.onUserScoreChanged = function (slot0)
	slot0.layerBottom.scoreInfo:setStrTxt(MathUtil.cookNumWithComma(parseInt(Hero:getUserScore())))
	slot0.controller:setHeadBg(slot0.layerBottom.head, GAME_STATE.ROOM)
end

DntgRoomCcsView.destroy = function (slot0)
	if NewbieUI then
		NewbieUI.plazaRoomQuickStartBtns[slot0.model:getGameKind()] = nil
	end

	Hero.userScoreChangedSignal:remove(slot0.onUserScoreChanged, slot0)
	Hero.pNickNameChangedSignal:remove(slot0.onNickNameChanged, slot0)

	for slot4, slot5 in pairs(slot0._roomBtnsDic) do
		destroySomeObj(slot5.txtNeed_tf)
		destroySomeObj(slot5.txtOnline_tf)
		slot5:destroy()
	end

	destroySomeObj(slot0.layerTop.btnBack)
	destroySomeObj(slot0.layerTop.btnHelp)
	destroySomeObj(slot0.layerBottom.btnJDZJ)
	destroySomeObj(slot0.layerBottom.btnKSKS)
	destroySomeObj(slot0.layerTop.layerNotice)
	destroySomeObj(slot0.layerBottom.head)
	destroySomeObj(slot0.layerBottom.scoreInfo)
	destroySomeObj(slot0.layerRoomList.content_sv)
	BaseGameRoomView.destroy(slot0)
end

return
