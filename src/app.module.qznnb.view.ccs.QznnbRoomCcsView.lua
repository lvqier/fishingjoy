QznnbRoomCcsView = class("QznnbRoomCcsView")

QznnbRoomCcsView.onCreationComplete = function (slot0)
	slot0._btnWidth = 305

	slot0.layerRoomList.content_sv.setContentSize(slot2, cc.size(display.width, display.height))
	slot0.layerRoomList.content_sv.setPositionX(slot2, (CONFIG_DESIGN_WIDTH - display.width) * 0.5)
	slot0.layerRoomList.content_sv.setClippingEnabled(slot2, false)
	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(slot2, true)
	slot0.layerRoomList.content_sv.addContentChild(slot2, slot1)
	slot0.layerRoomList.content_sv.setInnerContainerSize(slot2, slot0.layerRoomList.layerContent.getContentSize(slot1))
	DisplayUtil.setAllCascadeOpacityEnabled(slot2)

	slot0._roomBtnInitPoses = {}
	slot0._roomBtns = {}
	slot3 = {
		"qznnb_niu1",
		"qznnb_niu2",
		"qznnb_niu3",
		"qznnb_niu4",
		"qznnb_niu5"
	}
	slot4 = {
		"qznnb_niu1_effect",
		"qznnb_niu2_effect",
		"qznnb_niu3_effect",
		"qznnb_niu4_effect",
		"qznnb_niu5_effect"
	}
	slot5 = {
		cc.p(0, 0.5),
		cc.p(2.5, 0),
		cc.p(-1, 2.8),
		cc.p(0, 0),
		cc.p(0, 0)
	}
	slot0.spineTbl = {}
	slot6 = 1

	while true do
		if slot1["btn" .. slot6] then
			table.insert(slot0._roomBtns, slot7)

			slot7._kind = slot6

			slot2:addBtn2HandleTouchOperate(slot7)

			slot8 = slot0.controller:createSpineWithEvent(slot3[slot6], nil, false, true)

			slot8:setPosition(cc.p(0, 0))
			slot7.spine:addChild(slot8)
			table.insert(slot0.spineTbl, slot8)

			if slot4[slot6] then
				slot9 = slot0.controller:createSpineWithEvent(slot4[slot6], nil, false, true)

				slot9:setPosition(slot5[slot6])
				slot7.spine:addChild(slot9)
				table.insert(slot0.spineTbl, slot9)
			end
		else
			break
		end

		slot6 = slot6 + 1
	end

	ClassUtil.extends(slot0, BaseGameAniamtionView, true, slot8)
	ClassUtil.extends(slot0, BaseGameRoomView, true, slot0._roomBtns)
	DisplayUtil.setVisible(slot0.bg, false)
end

QznnbRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1._kind then
		slot0.controller:requestEnterRoom(slot1._kind)
	end
end

QznnbRoomCcsView.updateRoomList = function (slot0)
	slot1 = gameMgr:getServerVosDicEx()[slot0.model:getGameKind()] or {}
	slot2 = #slot0._roomBtns
	slot3 = 0
	slot4 = 1

	while slot2 >= slot4 do
		if slot1[slot4] then
			slot3 = slot3 + 1
		end

		slot4 = slot4 + 1
	end

	slot5 = 0

	if slot3 == 1 then
		slot5 = 0
	elseif slot3 == 2 then
		slot5 = 120
	elseif slot3 == 3 then
		slot5 = 63
	elseif slot3 == 4 then
		slot5 = -12
	elseif slot3 == 5 then
		slot5 = -33
	end

	slot7 = math.max(50, (display.width - slot0._btnWidth * slot3 - slot5 * (slot3 - 1)) * 0.5) + slot0._btnWidth * 0.5
	slot8 = 1
	slot9 = 0
	slot10 = {}

	while slot8 <= slot2 do
		DisplayUtil.setVisible(slot0._roomBtns[slot8], slot1[slot8] ~= nil)

		if slot11 then
			slot12:setPosition(cc.p(slot13, 340))

			slot10[slot9 + 1] = slot12

			slot0:updateRoomBtn(slot12, slot11)
		end

		slot8 = slot8 + 1
	end

	slot11 = slot0.layerRoomList.layerContent
	slot12 = slot0.layerRoomList.content_sv
	slot13 = 0

	if slot9 > 0 then
		slot13 = math.max(slot13, 50 + slot10[slot9].getPositionX(slot14) + slot10[slot9].getScaleX(slot14) * slot10[slot9].getContentSize(slot14).width * slot10[slot9]:getAnchorPoint().x)
	end

	slot12:setInnerContainerSize(cc.size(slot13, slot11:getContentSize().height))
end

QznnbRoomCcsView.onShow = function (slot0)
	slot0:updateRoomList()
	slot0.layerRoomList.content_sv:jumpTo(0)
	BaseGameAniamtionView.onShow(slot0)
	TweenLite.to(slot0.bg, 0.05, {
		autoAlpha = 1
	})
	slot0.model:setIsShowingRoomTxt(false)
	slot0.model:setIsShowingBtnBack(true)
	slot0.model:setIsShowingBtnHelp(true)

	if not NEED_CHANGE_SUB_GAME_NAME then
		slot0.model:setIsShowingLogo(true)
	end

	slot0.model:setIsShowingPlayerInfo(true)
	slot0.model:setIsShowingMainScore(true)
	slot0.model:setIsShowingQuickStart(true)
	slot0:playSpine()
end

QznnbRoomCcsView.killTweens = function (slot0)
	slot1 = ipairs
	slot2 = slot0.tlline or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:kill()
	end

	slot0.tlline = nil
end

QznnbRoomCcsView.playSpine = function (slot0)
	slot1 = ipairs
	slot2 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:setAnimation(0, "animation", true)
	end
end

QznnbRoomCcsView.pauseSpine = function (slot0)
	slot1 = ipairs
	slot2 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:clearTracks()
	end
end

QznnbRoomCcsView.cacheSpines = function (slot0)
	slot1 = ipairs
	slot2 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		spPoolMgr:put(slot5)
	end

	slot0.spineTbl = nil
end

QznnbRoomCcsView.onHide = function (slot0)
	slot0:killTweens()
	slot0:pauseSpine()
	TweenLite.to(slot0.bg, 0.05, {
		autoAlpha = 0
	})
	BaseGameAniamtionView.onHide(slot0)
end

QznnbRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2)
	slot3 = ResConfig.getAssetPath("module/qznnb/ui/txt/Qznnb_Room_zf1.png")
	slot4 = ResConfig.getAssetPath("module/qznnb/ui/txt/Qznnb_Room_txt_diZhu.png")
	slot5 = slot2._miniNeed
	slot6 = slot2._dwCellScore

	if IS_HL_VERSION then
		slot5 = slot5 / 100
		slot6 = slot6 / 100
	end

	slot7 = ""

	if slot5 >= 10000 then
		slot10 = ""
		slot7 = ((not IS_HL_VERSION or HtmlUtil.createArtNumDP(math.floor(slot5 / 10000), "#qznnb_room_zr_%s.png", nil, nil, nil, nil, 3)) and HtmlUtil.createArtNum(math.floor(slot5 / 10000), "#qznnb_room_zr_%s.png", nil, nil, nil, 3)) .. HtmlUtil.createImg("#qznnb_room_zr_w.png", nil, nil, nil, 4)
	else
		slot7 = (not IS_HL_VERSION or HtmlUtil.createArtNumDP(slot5, "#qznnb_room_zr_%s.png", nil, nil, nil, nil, 3)) and HtmlUtil.createArtNum(slot5, "#qznnb_room_zr_%s.png", nil, nil, nil, 3)
	end

	slot7 = HtmlUtil.createImg(slot3, nil, nil, nil, 4) .. " " .. slot7
	slot8 = ""

	if slot6 >= 10000 then
		slot11 = ""
		slot8 = ((not IS_HL_VERSION or HtmlUtil.createArtNumDP(math.floor(slot6 / 10000), "#qznnb_room_zr_%s.png", nil, nil, nil, nil, 3)) and HtmlUtil.createArtNum(math.floor(slot6 / 10000), "#qznnb_room_zr_%s.png", nil, nil, nil, 3)) .. HtmlUtil.createImg("#qznnb_room_zr_w.png", nil, nil, nil, 4)
	else
		slot8 = (not IS_HL_VERSION or HtmlUtil.createArtNumDP(slot6, "#qznnb_room_zr_%s.png", nil, nil, nil, nil, 3)) and HtmlUtil.createArtNum(slot6, "#qznnb_room_zr_%s.png", nil, nil, nil, 3)
	end

	slot8 = HtmlUtil.createImg(slot4, nil, nil, nil, 4) .. " " .. slot8

	if slot1._kind == 1 then
		slot1.txtNeed_tf:setVisible(false)

		if slot1.txtDiZhu_tf then
			slot1.txtDiZhu_tf:setVisible(false)
		end

		slot7 = HtmlUtil.createImg(slot0.controller:getUIPath("txt/qznnb_txt_tip_free.png"), nil, nil, nil, 2.5)

		if slot1.txtFree_tf then
			slot1.txtFree_tf:setVisible(true)
			slot1.txtFree_tf:setHtmlText(slot7)
		end
	else
		if slot1.txtFree_tf then
			slot1.txtFree_tf:setVisible(false)
		end

		slot1.txtNeed_tf:setVisible(true)
		slot1.txtNeed_tf:setHtmlText(slot7)

		if slot1.txtDiZhu_tf then
			slot1.txtDiZhu_tf:setVisible(true)
			slot1.txtDiZhu_tf:setHtmlText(slot8)
		end
	end

	slot9 = 1

	if slot2._totalOnline >= 80 then
		slot9 = 3
	elseif slot2._totalOnline >= 40 then
		slot9 = 2
	end

	slot1.txtOnline_tf:setHtmlText(HtmlUtil.createImg(slot10, nil, nil, nil, 0))
end

QznnbRoomCcsView.destroy = function (slot0)
	slot0:cacheSpines()
	slot0:killTweens()

	for slot4, slot5 in ipairs(slot0._roomBtns) do
		destroySomeObj(slot5.txtNeed_tf)
		destroySomeObj(slot5.txtFree_tf)
		destroySomeObj(slot5.txtDiZhu_tf)
		destroySomeObj(slot5.txtOnline_tf)
		slot5:destroy()
	end

	destroySomeObj(slot0.layerRoomList.content_sv)
	BaseGameAniamtionView.destroy(slot0)
	BaseGameRoomView.destroy(slot0)
end

return
