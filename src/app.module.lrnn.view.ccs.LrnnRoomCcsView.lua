slot2 = "LrnnRoomCcsView"
LrnnRoomCcsView = class(slot1)

LrnnRoomCcsView.onCreationComplete = function (slot0)
	slot0._btnWidth = 305
	slot5 = slot0.layerRoomList.content_sv
	slot9 = display.height

	slot0.layerRoomList.content_sv.setContentSize(slot4, cc.size(slot7, display.width))

	slot6 = (CONFIG_DESIGN_WIDTH - display.width) * 0.5

	slot0.layerRoomList.content_sv.setPositionX(slot4, slot2)

	slot6 = false

	slot0.layerRoomList.content_sv.setClippingEnabled(slot4, slot2)

	slot6 = true

	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(slot4, slot2)

	slot6 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.addContentChild(slot4, slot2)

	slot5 = slot0.layerRoomList.content_sv
	slot8 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.setInnerContainerSize(slot4, slot0.layerRoomList.layerContent.getContentSize(display.width))

	slot5 = slot0.layerRoomList.content_sv

	DisplayUtil.setAllCascadeOpacityEnabled(slot4)

	slot0._roomBtnInitPoses = {}
	slot0._roomBtns = {}
	slot3 = {
		"tbnn_niu1",
		"tbnn_niu2",
		"tbnn_niu3",
		"tbnn_niu4",
		"tbnn_niu5"
	}
	slot4 = {
		"tbnn_niu1_effect",
		"tbnn_niu2_effect",
		"tbnn_niu3_effect",
		"tbnn_niu4_effect",
		"tbnn_niu5_effect"
	}
	slot5 = {
		cc.p(display.width, 0),
		cc.p(display.width, 2.5),
		cc.p(display.width, -1),
		cc.p(display.width, 0),
		cc.p(display.width, 0)
	}
	slot9 = 0.5
	slot9 = 0
	slot9 = 2.8
	slot9 = 0
	slot9 = 0
	slot0.spineTbl = {}
	slot6 = 1

	while true do
		if slot1["btn" .. slot6] then
			slot11 = slot7

			table.insert(slot9, slot0._roomBtns)

			slot7._kind = slot6
			slot13 = slot7
			slot9 = DisplayUtil.ccpCopy(slot7.getPosition(slot12))
			slot0._roomBtnInitPoses[slot6] = slot9
			slot11 = slot7

			slot2.addBtn2HandleTouchOperate(slot9, slot2)

			slot14 = true
			slot8 = slot0.controller.createSpineWithEvent(slot9, slot0.controller, slot3[slot6], nil, false)
			slot11 = slot8
			slot15 = 0

			slot8.setPosition(slot0.controller, cc.p(false, 0))

			slot12 = slot8

			slot7.spine.addChild(slot0.controller, slot7.spine)

			slot12 = slot8

			table.insert(slot0.controller, slot0.spineTbl)

			if slot4[slot6] then
				slot15 = true
				slot9 = slot0.controller.createSpineWithEvent(slot10, slot0.controller, slot4[slot6], nil, false)
				slot13 = slot5[slot6]

				slot9.setPosition(slot0.controller, slot9)

				slot13 = slot9

				slot7.spine.addChild(slot0.controller, slot7.spine)

				slot13 = slot9

				table.insert(slot0.controller, slot0.spineTbl)
			end
		else
			break
		end

		slot6 = slot6 + 1
	end

	slot13 = 0
	slot14 = {
		{
			fromAlpha = 0,
			showDuration = 0.5,
			fadeInDuration = 0.2,
			hideDuration = 0.3,
			node = slot0.layerRoomList.content_sv,
			fromPos = cc.p(slot11, 200.71),
			fadeInEase = Sine.easeOut,
			showEase = Back.easeOut
		}
	}

	ClassUtil.extends(Sine.easeOut, slot0, BaseGameAniamtionView, true)

	slot14 = slot0._roomBtns

	ClassUtil.extends(Sine.easeOut, slot0, BaseGameRoomView, true)

	slot12 = false

	DisplayUtil.setVisible(Sine.easeOut, slot0.bg)
end

LrnnRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1._kind then
		slot6 = slot1._kind

		slot0.controller.requestEnterRoom(slot4, slot0.controller)
	end
end

LrnnRoomCcsView.updateRoomList = function (slot0)
	slot4 = slot0.model
	slot1 = gameMgr.getServerVosDicEx(slot2)[slot0.model.getGameKind(gameMgr)] or {}
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

	slot9 = (display.width - slot0._btnWidth * slot3 - slot5 * (slot3 - 1)) * 0.5
	slot7 = math.max(slot7, 50) + slot0._btnWidth * 0.5
	slot8 = 1
	slot9 = 0
	slot10 = {}

	while slot8 <= slot2 do
		slot16 = slot1[slot8] ~= nil

		DisplayUtil.setVisible(slot14, slot0._roomBtns[slot8])

		if slot11 then
			slot16 = slot12
			slot20 = 340

			slot12.setPosition(slot15, cc.p(slot18, slot7 + ((slot9 + 1) - 1) * (slot0._btnWidth + slot5)))

			slot10[slot9 + 1] = slot12
			slot18 = slot11

			slot0.updateRoomBtn(slot15, slot0, slot12)
		end

		slot8 = slot8 + 1
	end

	slot11 = slot0.layerRoomList.layerContent
	slot12 = slot0.layerRoomList.content_sv
	slot13 = 0

	if slot9 > 0 then
		slot23 = slot10[slot9]
		slot23 = slot10[slot9]
		slot19 = 50 + slot10[slot9].getPositionX(slot20) + slot10[slot9].getScaleX(slot14) * slot10[slot9]:getContentSize().width * slot10[slot9]:getAnchorPoint().x
		slot13 = math.max(slot17, slot13)
	end

	slot16 = slot12
	slot22 = slot11
	slot20 = slot11.getContentSize(slot21).height

	slot12.setInnerContainerSize(slot15, cc.size(slot18, slot13))
end

LrnnRoomCcsView.onShow = function (slot0)
	slot3 = slot0

	slot0.updateRoomList(slot2)

	slot4 = 0

	slot0.layerRoomList.content_sv.jumpTo(slot2, slot0.layerRoomList.content_sv)

	slot3 = slot0

	BaseGameAniamtionView.onShow(slot2)

	slot5 = {
		autoAlpha = 1
	}

	TweenLite.to(slot2, slot0.bg, 0.05)

	slot4 = false

	slot0.model.setIsShowingRoomTxt(slot2, slot0.model)

	slot4 = true

	slot0.model.setIsShowingBtnBack(slot2, slot0.model)

	slot4 = true

	slot0.model.setIsShowingBtnHelp(slot2, slot0.model)

	if not NEED_CHANGE_SUB_GAME_NAME then
		slot4 = true

		slot0.model.setIsShowingLogo(slot2, slot0.model)
	end

	slot4 = true

	slot0.model.setIsShowingPlayerInfo(slot2, slot0.model)

	slot4 = true

	slot0.model.setIsShowingMainScore(slot2, slot0.model)

	slot4 = true

	slot0.model.setIsShowingQuickStart(slot2, slot0.model)

	slot3 = slot0

	slot0.playSpine(slot2)
end

LrnnRoomCcsView.playSpine = function (slot0)
	slot1 = ipairs
	slot3 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot11 = true

		slot5.setAnimation(slot7, slot5, 0, "animation")
	end
end

LrnnRoomCcsView.pauseSpine = function (slot0)
	slot1 = ipairs
	slot3 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot8 = slot5

		slot5.clearTracks(slot7)
	end
end

LrnnRoomCcsView.cacheSpines = function (slot0)
	slot1 = ipairs
	slot3 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot9 = slot5

		spPoolMgr.put(slot7, spPoolMgr)
	end

	slot0.spineTbl = nil
end

LrnnRoomCcsView.killTweens = function (slot0)
	slot1 = ipairs
	slot3 = slot0.tlline or {}

	for slot4, slot5 in slot1(slot2) do
		slot8 = slot5

		slot5.kill(slot7)
	end

	slot0.tlline = nil
end

LrnnRoomCcsView.onHide = function (slot0)
	slot3 = slot0

	slot0.killTweens(slot2)

	slot3 = slot0

	slot0.pauseSpine(slot2)

	slot5 = {
		autoAlpha = 0
	}

	TweenLite.to(slot2, slot0.bg, 0.05)

	slot3 = slot0

	BaseGameAniamtionView.onHide(slot2)
end

LrnnRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2)
	slot3 = ResConfig.getAssetPath(slot4)
	slot6 = "module/lrnn/ui/txt/Lrnn_Room_zf1.png"
	slot4 = ResConfig.getAssetPath("module/lrnn/ui/txt/Lrnn_Room_zf2.png")

	if slot2._miniNeed >= 10000 then
		slot15 = 3
		slot15 = 4
		slot5 = HtmlUtil.createArtNum(slot5 / 10000, math.floor(slot8), "#lrnn_room_zr_%s.png", nil, nil, nil) .. HtmlUtil.createImg(math.floor(slot8), "#lrnn_room_zr_w.png", nil, nil, nil)
	else
		slot13 = 3
		slot5 = HtmlUtil.createArtNum(slot7, slot5, "#lrnn_room_zr_%s.png", nil, nil, nil)
	end

	slot12 = 4
	slot5 = HtmlUtil.createImg(slot7, slot4, nil, nil, nil) .. " " .. slot5

	if slot1._kind == 1 then
		slot11 = "txt/lrnn_txt_tip_free.png"
		slot12 = 2
		slot5 = HtmlUtil.createImg(slot7, slot0.controller.getUIPath(slot9, slot0.controller), nil, nil, nil)
	end

	slot1.txtNeed_tf.setHtmlText(slot7, slot1.txtNeed_tf)

	slot6 = 0
	slot7 = 0
	slot10 = slot2

	for slot11, slot12 in ipairs(slot5) do
		if slot12.wSortID % 2 == 0 then
			slot6 = slot6 + slot12.dwOnLineCount
		else
			slot7 = slot7 + slot12.dwOnLineCount
		end
	end

	slot9 = 1

	if ((slot6 < slot7 and slot6) or slot7) >= 80 then
		slot9 = 3
	elseif slot8 >= 40 then
		slot9 = 2
	end

	slot13 = "txt/lrnn_room_count_state_" .. slot9 .. ".png"
	slot17 = 0
	slot15 = HtmlUtil.createImg(slot0.controller, slot0.controller.getUIPath(slot11, slot0.controller), nil, nil, nil)

	slot1.txtOnline_tf.setHtmlText(slot0.controller.getUIPath(slot11, slot0.controller), slot1.txtOnline_tf)
end

LrnnRoomCcsView.destroy = function (slot0)
	slot3 = slot0

	slot0.cacheSpines(slot2)

	slot3 = slot0

	slot0.killTweens(slot2)

	slot3 = slot0._roomBtns

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5.txtNeed_tf

		destroySomeObj(slot7)

		slot8 = slot5.txtOnline_tf

		destroySomeObj(slot7)

		slot8 = slot5

		slot5.destroy(slot7)
	end

	slot3 = slot0.layerRoomList.content_sv

	destroySomeObj(slot2)

	slot3 = slot0

	BaseGameAniamtionView.destroy(slot2)

	slot3 = slot0

	BaseGameRoomView.destroy(slot2)
end

return
