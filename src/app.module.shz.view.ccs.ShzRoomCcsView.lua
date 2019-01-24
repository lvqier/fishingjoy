ShzRoomCcsView = class("ShzRoomCcsView")

ShzRoomCcsView.onCreationComplete = function (slot0)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.spBottomBgLeft, UIConfig.ALIGN_LEFT)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.spBottomBgRight, UIConfig.ALIGN_RIGHT)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.head, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.txtName, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.headFrame, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.userScore, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.btnKSKS, UIConfig.ALIGN_RIGHT, -80)
	slot0.layerRoomList.content_sv.setContentSize(slot2, slot3)
	slot0.layerRoomList.content_sv.addContentChild(slot2, slot1)
	slot0.layerRoomList.content_sv.setInnerContainerSize(slot2, slot0.layerRoomList.layerContent.getContentSize(slot1))
	slot0.layerRoomList.content_sv.setClippingEnabled(slot2, false)
	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(slot2, true)
	DisplayUtil.setAllCascadeOpacityEnabled(slot2)

	slot0._roomBtnInitPoses = {}
	slot0.newBtnPos = {
		{
			cc.p(669.39, 382)
		},
		{
			cc.p(453, 382),
			cc.p(894, 382)
		},
		{
			cc.p(228, 382),
			cc.p(669, 382),
			cc.p(1110, 382)
		},
		{
			cc.p(215, 382),
			cc.p(514, 382),
			cc.p(811, 382),
			cc.p(1110, 382)
		},
		{
			cc.p(183, 382),
			cc.p(485, 382),
			cc.p(785, 382),
			cc.p(1080, 382),
			cc.p(1373, 382)
		}
	}
	slot0._roomBtns = {}
	slot4 = 1

	while true do
		if slot1["btn" .. slot4] then
			table.insert(slot0._roomBtns, slot5)

			slot5._kind = slot4
			slot0._roomBtnInitPoses[slot4] = DisplayUtil.ccpCopy(slot5:getPosition())

			slot2:addBtn2HandleTouchOperate(slot5)
		else
			break
		end

		slot4 = slot4 + 1
	end

	slot0.tiyanchangSpine = slot0:getSpineBy(slot1.btn1.spine, "shz_tiyanchang", 660, 220)
	slot0.chujichangSpine = slot0:getSpineBy(slot1.btn2.spine, "shz_chujichang", 360, 220)
	slot0.putongchangSpine = slot0:getSpineBy(slot1.btn3.spine, "shz_putongchang", 65, 220)
	slot0.zhongjichangSpine = slot0:getSpineBy(slot1.btn4.spine, "shz_zhongjichang", -230, 220)
	slot0.gaojichangSpine = slot0:getSpineBy(slot1.btn5.spine, "shz_gaojichang", -530, 220)
	slot0.ksksSpine = slot0:getSpineBy(slot0.layerBottom.btnKSKS.spine, "shz_quickstart", -30, 0)

	slot0.layerBottom.userScore:setStrBaseWidth(210)
	Hero.pNickNameChangedSignal:add(slot0.onNickNameChanged, slot0)
	slot0:onUserScoreChanged()
	slot0:onNickNameChanged()
	ClassUtil.extends(slot0, BaseGameAniamtionView, true, slot5)
	ClassUtil.extends(slot0, BaseGameRoomView, true, slot0._roomBtns)
	DisplayUtil.setVisible(slot0.bg, false)
end

ShzRoomCcsView.getSpineBy = function (slot0, slot1, slot2, slot3, slot4)
	if slot0.controller:createSpineWithEvent(slot2, nil, true, true) then
		slot5:setPositionX(slot3)
		slot5:setPositionY(slot4)
		slot1:addChild(slot5)
	end

	return slot5
end

ShzRoomCcsView.updateRoomList = function (slot0)
	slot1 = gameMgr:getServerVosDicEx()[slot0.model:getGameKind()] or {}
	slot2 = 1
	slot3 = #slot0._roomBtns
	slot4 = 0
	slot5 = {}

	while slot2 <= slot3 do
		DisplayUtil.setVisible(slot0._roomBtns[slot2], slot1[slot2] ~= nil)

		if slot6 then
			slot5[slot4 + 1] = slot7

			slot0:updateRoomBtn(slot7, slot6)
		end

		slot2 = slot2 + 1
	end

	slot6 = slot0.newBtnPos[slot4]

	for slot10, slot11 in pairs(slot5) do
		slot5[slot10]:setPosition(slot6[slot10])
	end

	slot7 = slot0.layerRoomList.layerContent
	slot8 = slot0.layerRoomList.content_sv
	slot9 = 0
	slot10 = 50

	if slot4 > 0 then
		slot9 = math.max(slot9, slot10 + slot5[slot4].getPositionX(slot11) + slot5[slot4].getScaleX(slot11) * slot5[slot4].getContentSize(slot11).width * slot5[slot4]:getAnchorPoint().x)
	end

	slot11 = slot9 - slot10

	if slot4 >= 5 and slot11 < display.width then
		slot8:setPositionX((CONFIG_DESIGN_WIDTH - display.width) * 0.5 + math.max(0, (display.width - slot9) * 0.5))
		slot8:setContentSize(cc.size(math.min(display.width, display.width - math.max(0, (display.width - slot9) * 0.5)), slot7:getContentSize().height))
	end

	slot8:setInnerContainerSize(cc.size(slot9, slot7:getContentSize().height))
end

ShzRoomCcsView.onShow = function (slot0)
	TweenLite.to(slot0:getParent():getParent().layerNotice, 0.2, {
		x = 422,
		y = 695
	})
	slot0:updateRoomList()
	slot0.layerRoomList.content_sv:jumpTo(0)
	BaseGameAniamtionView.onShow(slot0)
	TweenLite.to(slot0.bg, 0.05, {
		autoAlpha = 1
	})
	Hero.userScoreChangedSignal:add(slot0.onUserScoreChanged, slot0)
	slot0:onUserScoreChanged()
end

ShzRoomCcsView.onHide = function (slot0)
	BaseGameAniamtionView.onHide(slot0)
	Hero.userScoreChangedSignal:remove(slot0.onUserScoreChanged, slot0)
end

ShzRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2)
	if slot1._kind ~= 1 then
		slot1.NodeNeed.txtNeed_tf:setHtmlText(HtmlUtil.createImg(slot0.controller:getUIPath("txt/shz_xc_zr.png"), nil, 25, nil, nil) .. ((slot2._miniNeed >= 10000 and HtmlUtil.createArtNum(math.floor(slot4 / 10000), "#shz_roomMinNeedNum_%d.png") .. HtmlUtil.createImg(slot0.controller:getUIPath("txt/shz_xc_wan.png"), nil, 25, nil, nil)) or HtmlUtil.createArtNum(slot4, "#shz_roomMinNeedNum_%d.png", nil, 25, nil, nil)))
	end

	slot3 = slot0.controller:getUIPath("txt/shzRoomState_kx.png")

	if slot2._totalOnline >= 80 then
		slot3 = slot0.controller:getUIPath("txt/shzRoomState_yj.png")
	elseif slot2._totalOnline >= 40 then
		slot3 = slot0.controller:getUIPath("txt/shzRoomState_bm.png")
	end

	slot1.Spr_state:setTexture(slot3)
end

ShzRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot0.controller:exitGame()
	elseif slot1 == slot0.layerTop.btnHelp then
		slot0.model:setIsShowingRule(true)
	elseif slot1 == slot0.layerBottom.btnKSKS then
		slot0.controller:quickStartGame()
	elseif slot1._kind then
		slot0.controller:requestEnterRoom(slot1._kind)
	end
end

ShzRoomCcsView.onNickNameChanged = function (slot0)
	slot0.layerBottom.txtName:setString(StringUtil.truncate(Hero:getPNickName(), 10, nil, 2))
end

ShzRoomCcsView.onUserScoreChanged = function (slot0)
	slot0.layerBottom.userScore:setStrTxt(StringUtil.numberStr2FormatNumberStr(slot1))
	slot0.controller:setHeadBg(slot0.layerBottom.head, GAME_STATE.ROOM)
end

ShzRoomCcsView.destroy = function (slot0)
	Hero.userScoreChangedSignal:remove(slot0.onUserScoreChanged, slot0)
	Hero.pNickNameChangedSignal:remove(slot0.onNickNameChanged, slot0)
	spPoolMgr:put(slot0.tiyanchangSpine)
	spPoolMgr:put(slot0.chujichangSpine)
	spPoolMgr:put(slot0.putongchangSpine)
	spPoolMgr:put(slot0.zhongjichangSpine)
	spPoolMgr:put(slot0.gaojichangSpine)
	spPoolMgr:put(slot0.ksksSpine)
	spPoolMgr:put(slot0.girlSpine)
	spPoolMgr:put(slot0.startBtnspine)
	spPoolMgr:put(slot0.Btn1spine)
	spPoolMgr:put(slot0.Btn3spine)

	for slot4, slot5 in ipairs(slot0._roomBtns) do
		if slot5.NodeNeed and slot5.NodeNeed.txtNeed_tf then
			slot5.NodeNeed.txtNeed_tf:destroy()
		end

		slot5:destroy()
	end

	destroySomeObj(slot0.layerTop.layerNotice)
	destroySomeObj(slot0.layerBottom.userScore)
	destroySomeObj(slot0.layerTop.btnHelp)
	destroySomeObj(slot0.layerTop.btnBack)
	destroySomeObj(slot0.layerBottom.btnKSKS)
	destroySomeObj(slot0.layerBottom.head)
	BaseGameAniamtionView.destroy(slot0)
	BaseGameRoomView.destroy(slot0)
end

return
