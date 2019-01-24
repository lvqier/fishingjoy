slot2 = "PdkRoomCcsView"
PdkRoomCcsView = class(slot1)

PdkRoomCcsView.onCreationComplete = function (slot0)
	slot0._roomBtns = {}
	slot0._spineTbl = {}
	slot0._spineName = {
		"pdktiyan",
		"pdkchuji",
		"pdkputong",
		"pdkzhongji",
		"pdkgaoji"
	}
	slot6 = false

	slot0.layerRoomList.content_sv.setClippingEnabled(slot4, slot2)

	slot6 = true

	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(slot4, slot2)

	slot6 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.addContentChild(slot4, slot2)

	slot5 = slot0.layerRoomList.content_sv
	slot8 = slot0.layerRoomList.layerContent

	slot0.layerRoomList.content_sv.setInnerContainerSize(slot4, slot0.layerRoomList.layerContent.getContentSize(slot7))

	slot7 = slot0.layerRoomList.layerContent

	for slot6, slot7 in pairs(slot0.layerRoomList.layerContent.getChildren(slot0.layerRoomList.layerContent.getContentSize)) do
		slot12 = slot7
		slot11 = "btn(%d)"

		if string.match(slot9, slot7.getName(slot11)) then
			slot12 = 132

			slot7.count.setStrBaseWidth(slot10, slot7.count)

			slot12 = slot7

			table.insert(slot10, slot0._roomBtns)

			slot12 = slot7

			slot2.addBtn2HandleTouchOperate(slot10, slot2)
		end

		slot11 = slot8
		slot7._kind = parseInt(slot10)
	end

	slot5 = slot0._roomBtns

	for slot6, slot7 in pairs(slot4) do
		if slot0._spineName[slot7._kind] then
			slot14 = true
			slot7._spine = slot0.controller.createSpineWithEvent(slot9, slot0.controller, slot0._spineName[slot7._kind], nil, false)
			slot10 = slot7._spine
			slot14 = 186

			slot7._spine.setPosition(slot9, cc.p(nil, 136.5))

			slot12 = -1

			slot7.addChild(slot9, slot7, slot7._spine)

			slot11 = slot7._spine

			table.insert(slot9, slot0._spineTbl)
		end
	end

	slot6 = "pdkksks"
	slot0._startSpine = slot0.controller.createSpine(slot4, slot0.controller)
	slot6 = slot0._startSpine

	slot0.layerBottom.btnStart.addChild(slot4, slot0.layerBottom.btnStart)

	slot7 = 75

	slot0._startSpine.setPosition(slot4, slot0._startSpine, 170)

	slot8 = true

	slot0._startSpine.setAnimation(slot4, slot0._startSpine, 0, "animation")

	slot0._roomBtnPos = {
		{
			{
				x = 667,
				y = 371
			}
		},
		{
			{
				x = 511,
				y = 371
			},
			{
				x = 820,
				y = 371
			}
		},
		{
			{
				x = 349,
				y = 371
			},
			{
				x = 658,
				y = 371
			},
			{
				x = 967,
				y = 371
			}
		},
		{
			{
				x = 202,
				y = 371
			},
			{
				x = 511,
				y = 371
			},
			{
				x = 820,
				y = 371
			},
			{
				x = 1129,
				y = 371
			}
		},
		{
			{
				x = 202,
				y = 371
			},
			{
				x = 511,
				y = 371
			},
			{
				x = 820,
				y = 371
			},
			{
				x = 1129,
				y = 371
			},
			{
				x = 1438,
				y = 371
			}
		}
	}
	slot8 = -200
	slot8 = 0
	slot8 = 200
	slot9 = {
		{
			fromAlpha = 0,
			showDuration = 0.4,
			hideDuration = 0.2,
			fadeInDuration = 0.5,
			node = slot0.layerBottom,
			fromPos = cc.p(0, 0),
			fadeInEase = Sine.easeOut
		},
		{
			fromAlpha = 0,
			showDuration = 0.7,
			fadeInDuration = 0.5,
			hideDuration = 0.2,
			node = slot0.layerRoomList,
			fromPos = cc.p(0, 200),
			fadeInEase = Sine.easeOut,
			showEase = Back.easeOut
		},
		{
			fromAlpha = 0,
			showDuration = 0.7,
			fadeInDuration = 0.5,
			hideDuration = 0.2,
			node = slot0.layerTop,
			fromPos = cc.p(0, 0),
			fadeInEase = Sine.easeOut,
			showEase = Back.easeOut
		}
	}

	ClassUtil.extends(Back.easeOut, slot0, BaseGameAniamtionView, true)

	slot9 = slot0._roomBtns

	ClassUtil.extends(Back.easeOut, slot0, BaseGameRoomView, true)

	slot7 = 174

	slot0.layerBottom.infoMine.scoreInfo.setStrBaseWidth(Back.easeOut, slot0.layerBottom.infoMine.scoreInfo)

	slot6 = slot0

	slot0.onUserScoreChanged(Back.easeOut)
end

PdkRoomCcsView.onShow = function (slot0)
	slot3 = slot0

	BaseGameAniamtionView.onShow(slot2)

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
end

PdkRoomCcsView.onHide = function (slot0)
	slot3 = slot0

	BaseGameAniamtionView.onHide(slot2)

	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)
end

PdkRoomCcsView.updateRoomList = function (slot0)
	slot5 = gameMgr.getServerVosDicEx(slot2)[slot0.model.getGameKind(gameMgr)] or {}
	slot2 = slot0._roomBtnPos[table.nums(slot0.model)]
	slot3 = 1
	slot4 = 0
	slot5 = {}
	slot8 = slot0._roomBtns

	for slot9, slot10 in pairs(slot7) do
		slot15 = slot1[slot10._kind] ~= nil

		slot10.setVisible(slot13, slot10)

		if slot11 then
			slot17 = slot2[slot3].y

			slot10.setPosition(slot14, slot10, slot2[slot3].x)

			slot5[slot4 + 1] = slot10
			slot13 = "#plist_pdk_font_room_zr_1_%s.png"
			slot14 = ""

			if slot11._miniNeed > 0 then
				slot28 = 2
				slot14 = HtmlUtil.createArtNumWithCustomFormat(slot16, nil, slot13, nil, {
					"zhunru"
				}, nil, nil, nil, nil, nil) .. " " .. HtmlUtil.createArtNumWithHansUnits(slot13, slot11._miniNeed, slot13, nil, nil, nil, nil, nil, nil, nil)
			else
				slot20 = "txt/pdk_txt_mfty.png"
				slot14 = HtmlUtil.createImg(slot0.controller.getUIPath(slot18, slot0.controller))
			end

			slot18 = slot14

			slot10.count.setStrTxt(slot16, slot10.count)

			slot15 = 1

			if slot11._totalOnline >= 80 then
				slot15 = 3
			elseif slot11._totalOnline >= 40 then
				slot15 = 2
			end

			slot19 = "txt/pdk_txt_room_state" .. slot15 .. ".png"
			slot20 = slot0.controller.getUIPath(slot17, slot0.controller)

			slot10.state.setTexture(slot0.controller, slot10.state)

			slot3 = slot3 + 1
		end
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
end

PdkRoomCcsView.onUserScoreChanged = function (slot0)
	slot3 = slot0.layerBottom.infoMine.scoreInfo
	slot10 = Hero
	slot14 = -1

	slot0.layerBottom.infoMine.scoreInfo.setStrTxt(slot2, HtmlUtil.createArtNumDot(slot5, parseInt(Hero.getUserScore(slot9)), "#plist_pdk_font_room_score_%s.png", nil, nil, nil, nil, nil, nil))

	slot5 = GAME_STATE.ROOM

	slot0.controller.setHeadBg(slot2, slot0.controller, slot0.layerBottom.infoMine.head)

	if not B_HEADCLIPPING then
		slot4 = slot0.layerBottom.infoMine.head.mask

		slot0.layerBottom.infoMine.head.checkMask2(slot2, slot0.layerBottom.infoMine.head)
	else
		slot4 = false

		slot0.layerBottom.infoMine.head.mask.setVisible(slot2, slot0.layerBottom.infoMine.head.mask)
	end
end

PdkRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot5 = slot0.controller

		slot0.controller.exitGame(slot4)
	elseif slot1 == slot0.layerBottom.btnReport then
		slot6 = "该功能暂未开放"

		tweenMsgMgr.showWhiteMsg(slot4, tweenMsgMgr)
	elseif slot1 == slot0.layerTop.btnHelp then
		slot6 = true

		slot0.model.setIsShowingRule(slot4, slot0.model)
	elseif slot1 == slot0.layerBottom.btnStart then
		slot0.controller.isFromQuikStart = true
		slot5 = slot0.controller

		slot0.controller.quickStartGame(true)
	elseif slot1._kind then
		slot0.controller.isFromEnterRoom = true
		slot6 = slot1._kind

		slot0.controller.requestEnterRoom(true, slot0.controller)
	end
end

PdkRoomCcsView.destroy = function (slot0)
	slot3 = slot0.layerBottom.infoMine

	slot0.layerBottom.infoMine.destroy(slot2)

	slot3 = slot0.layerBottom.infoMine.head

	slot0.layerBottom.infoMine.head.destroy(slot2)

	slot3 = slot0.layerBottom.infoMine.scoreInfo

	slot0.layerBottom.infoMine.scoreInfo.destroy(slot2)

	slot3 = slot0.layerTop.btnHelp

	destroySomeObj(slot2)

	slot3 = slot0.layerTop.btnBack

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.btnReport

	destroySomeObj(slot2)

	slot4 = slot0._startSpine

	spPoolMgr.put(slot2, spPoolMgr)

	slot1 = ipairs
	slot3 = slot0._spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot9 = slot5

		spPoolMgr.put(slot7, spPoolMgr)
	end

	slot3 = slot0._roomBtns

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5.count.txt_tf

		destroySomeObj(slot7)

		slot8 = slot5.zhunru_tf

		destroySomeObj(slot7)

		slot8 = slot5

		slot5.destroy(slot7)
	end

	slot3 = slot0.layerBottom.btnStart

	destroySomeObj(slot2)

	slot3 = slot0

	BaseGameRoomView.destroy(slot2)
end

return
