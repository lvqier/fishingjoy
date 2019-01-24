HlssmRoomCcsView = class("HlssmRoomCcsView")

HlssmRoomCcsView.onCreationComplete = function (slot0)
	slot1 = slot0.layerCenter.content_sv

	slot0.layerBottom.infoMine.scoreInfo:setStrBaseWidth(210)
	slot0.layerBottom.infoMine:setArtFileName("#hlssm_room_gold_%s.png")

	if slot0.model:getIsAdjustSlimWidth() then
		slot1:setContentSize(slot2)
		slot0.controller:adjustSlimWidth(slot1, UIConfig.ALIGN_LEFT)
	end

	slot0._avatarSpine = slot0.controller:createSpineByPool("hlssmheguan")

	slot0._avatarSpine:setAnimation(0, "animation", true)
	slot0._avatarSpine:setPositionX(45)
	slot0.layerCenter.sp:addChild(slot0._avatarSpine)

	slot0._btnSpine = slot0.controller:createSpineByPool("hlssmxc_quickstart")

	slot0._btnSpine:setAnimation(0, "animation", true)
	slot0._btnSpine:setPosition(220, 44)
	slot0.layerBottom.btnStart:addChild(slot0._btnSpine)

	slot0.spineTbl = {}
	slot0._spineName = {
		"hlssmxc_room1",
		nil,
		"hlssmxc_room3",
		"hlssmxc_room4"
	}

	slot0.controller:adjustSlimWidth(slot0.layerBottom.btnStart, UIConfig.ALIGN_RIGHT, -60)
	ClassUtil.extends(slot0, BaseGameRoomView, true, slot0._roomBtns)

	slot0.layerTop.logo.pos = cc.p(slot0.layerTop.logo:getPosition())
	slot0._roomBtnInitPoses = {
		{
			cc.p(860, 346.48)
		},
		{
			cc.p(700, 346.48),
			cc.p(1070, 346.48)
		},
		{
			cc.p(630, 346.48),
			cc.p(1000, 346.48),
			cc.p(1370, 346.48)
		}
	}

	slot1:setClippingEnabled(false)
	slot1:addContentChild(slot2)
	slot1:setInnerContainerSize(slot0.layerCenter.layerContent.getContentSize(slot2))
	DisplayUtil.setAllCascadeOpacityEnabled(slot1)
	slot1:getOnPosChangedSignal():add(slot0.onSvPosChanged, slot0)

	slot0._roomBtns = {}
	slot3 = 1

	while slot3 <= 5 do
		if slot2["btn" .. slot3] then
			table.insert(slot0._roomBtns, slot4)

			slot4._kind = slot3

			slot1:addBtn2HandleTouchOperate(slot4)
		end

		slot3 = slot3 + 1
	end

	slot0.layerCenter.sp._initX = slot0.layerCenter.sp:getPositionX()

	ClassUtil.extends(slot0, BaseGameAniamtionView, true, {
		{
			fromAlpha = 0,
			node = slot0.layerCenter.sp,
			fromPos = cc.p(-17.47, -7.67),
			fadeInEase = Sine.easeOut,
			onShowStart = handler(slot0, slot0.onAvatarShowInStart),
			onShowComplete = handler(slot0, slot0.onAvatarShowInComplete)
		},
		{
			fromAlpha = 0,
			showDuration = 0.5,
			fadeInDuration = 0.2,
			hideDuration = 0.3,
			node = slot0.layerCenter.content_sv,
			fromPos = cc.p(200.71, 0),
			fadeInEase = Sine.easeOut,
			showEase = Back.easeOut
		},
		{
			fromAlpha = 0,
			showDuration = 0.5,
			fadeInDuration = 0.2,
			hideDuration = 0.3,
			node = slot0.layerTop.btnBack,
			fromPos = cc.p(-40, 790),
			fadeInEase = Sine.easeOut,
			showEase = Back.easeOut
		},
		{
			fromAlpha = 0,
			showDuration = 0.5,
			fadeInDuration = 0.2,
			hideDuration = 0.3,
			node = slot0.layerTop.btnHelp,
			fromPos = cc.p(151, 790),
			fadeInEase = Sine.easeOut,
			showEase = Back.easeOut
		},
		{
			fromAlpha = 0,
			showDuration = 0.5,
			fadeInDuration = 0.2,
			hideDuration = 0.3,
			node = slot0.layerTop.logo,
			fromPos = cc.p(1220.9, 770),
			fadeInEase = Sine.easeOut,
			showEase = Back.easeOut
		},
		{
			fromAlpha = 0,
			showDuration = 0.5,
			fadeInDuration = 0.2,
			hideDuration = 0.3,
			node = slot0.layerBottom,
			fromPos = cc.p(0, -54),
			fadeInEase = Sine.easeOut,
			showEase = Sine.easeOut
		}
	})
end

HlssmRoomCcsView.onAvatarShowInComplete = function (slot0)
	slot0._isAvatarTweening = false
end

HlssmRoomCcsView.onAvatarShowInStart = function (slot0)
	slot0._isAvatarTweening = true
end

HlssmRoomCcsView.onSvPosChanged = function (slot0)
	if not slot0._isAvatarTweening then
		slot0.layerCenter.sp:setPositionX(math.min(slot0.layerCenter.sp._initX + slot0.layerCenter.content_sv:getInnerContainer().getPositionX(slot1) * 1.2, slot3))
	end
end

HlssmRoomCcsView.onShow = function (slot0)
	slot0:updateRoomList()

	slot0._isAvatarTweening = true

	slot0.layerCenter.content_sv:jumpTo(0)
	BaseGameAniamtionView.onShow(slot0)
	TweenLite.to(slot0.bg, 0.05, {
		autoAlpha = 1
	})
end

HlssmRoomCcsView.onHide = function (slot0)
	TweenLite.to(slot0.bg, 0.05, {
		autoAlpha = 0
	})
	BaseGameAniamtionView.onHide(slot0)
end

HlssmRoomCcsView.updateRoomList = function (slot0)
	for slot4, slot5 in pairs(slot0._roomBtns) do
		slot5:setVisible(false)
	end

	slot1 = gameMgr:getServerVosDicEx()[slot0.model:getGameKind()] or {}
	slot2 = 1
	slot3 = 0
	slot4 = {}

	for slot8, slot9 in pairs(slot0._roomBtns) do
		DisplayUtil.setVisible(slot9, slot1[slot9._kind] ~= nil)

		if slot10 then
			slot4[slot3 + 1] = slot9

			slot0:updateRoomBtn(slot9, slot10)
		end
	end

	for slot8, slot9 in ipairs(slot4) do
		slot9:setPosition(slot0._roomBtnInitPoses[slot3][slot8].x + (display.width - CONFIG_DESIGN_WIDTH) * 0.5, slot0._roomBtnInitPoses[slot3][slot8].y)
	end

	slot5 = slot0.layerCenter.layerContent
	slot6 = slot0.layerCenter.content_sv
	slot7 = 0

	if slot3 > 0 then
		slot7 = math.max(slot7, 50 + slot4[slot3].getPositionX(slot8) + slot4[slot3].getScaleX(slot8) * slot4[slot3].getContentSize(slot8).width * slot4[slot3]:getAnchorPoint().x)
	end

	slot6:setInnerContainerSize(cc.size(slot7, slot5:getContentSize().height))
end

HlssmRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2)
	if slot1.need_tf then
		slot4 = nil

		slot1.need_tf:setIsAssetVCenter(true)
		slot1.need_tf:setHtmlText((slot1._kind == 1 and HtmlUtil.createImg(slot0.controller:getUIPath("txt/hlssm_txt_tip_free.png"), nil, nil, nil, 0) .. HtmlUtil.createSpacer(8)) or (IS_HL_VERSION and HtmlUtil.createArtNumWithCustomFormat(nil, "#hlssm_room_zr_" .. slot1._kind .. "_%s.png", {
			"txt",
			3
		}) .. HtmlUtil.createArtNumDP(slot2._miniNeed / 100, "#hlssm_room_zr_" .. slot1._kind .. "_%s.png", nil, nil, nil, nil, nil, nil, nil, 0, nil)) or HtmlUtil.createArtNumWithCustomFormat(nil, "#hlssm_room_zr_" .. slot1._kind .. "_%s.png", {
			"txt",
			3
		}) .. HtmlUtil.createArtNumWithHansUnits(slot2._miniNeed, "#hlssm_room_zr_" .. slot1._kind .. "_%s.png", nil, nil, nil, nil, nil, nil, nil, 0, nil))
	end

	if slot1.spState then
		slot3 = 1

		if slot2._totalOnline >= 80 then
			slot3 = 3
		elseif slot2._totalOnline >= 40 then
			slot3 = 2
		end

		slot1.spState:setTexture(slot0.controller:getUIPath(string.format("txt/hlssm_room_state_%d_%d.png", slot1._kind, slot3)))
	end

	if not slot1._spine and slot0._spineName[slot1._kind] then
		slot1._spine = slot0.controller:createSpineWithEvent(slot0._spineName[slot1._kind], nil, false, true)

		slot1._spine:setPosition(cc.p(0, 0))
		slot1.spine:addChild(slot1._spine)
		table.insert(slot0.spineTbl, slot1._spine)

		slot3 = slot0.controller:createSpine("hlssmxc_kuanglg")

		slot3:setAnimation(0, "animation", true)
		slot1.spine:addChild(slot3)
		table.insert(slot0.spineTbl, slot3)
	end
end

HlssmRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot0.controller:exitGame()
	elseif slot1 == slot0.layerTop.btnHelp then
		slot0.model:setIsShowingRule(true)
	elseif slot1 == slot0.layerBottom.btnStart then
		slot0.controller:quickStartGame()
	elseif slot1._kind then
		slot0.controller:requestEnterRoom(slot3)
	end
end

HlssmRoomCcsView.destroy = function (slot0)
	spPoolMgr:put(slot0._avatarSpine)
	spPoolMgr:put(slot0._btnSpine)

	slot1 = ipairs
	slot2 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		spPoolMgr:put(slot5)
	end

	slot0.spineTbl = nil

	for slot4, slot5 in pairs(slot0._roomBtns) do
		destroySomeObj(slot5.need_tf)
		destroySomeObj(slot5)
	end

	destroySomeObj(slot0.layerTop.btnBack)
	destroySomeObj(slot0.layerTop.btnHelp)
	destroySomeObj(slot0.layerCenter.btnStart)
	destroySomeObj(slot0.layerBottom.infoMine)
	BaseGameRoomView.destroy(slot0)
end

return
