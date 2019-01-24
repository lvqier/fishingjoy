slot2 = "DdzKindCcsView"
DdzKindCcsView = class(slot1)

DdzKindCcsView.onCreationComplete = function (slot0)
	slot6 = -200
	slot6 = slot0.onBottomShowComplete
	slot6 = 200
	slot7 = {
		{
			fromAlpha = 0,
			showDuration = 0.4,
			fadeInDuration = 0.5,
			hideDuration = 0.2,
			node = slot0.layerBottom,
			fromPos = cc.p(slot4, 0),
			fadeInEase = Sine.easeOut,
			onShowComplete = handler(slot4, slot0)
		},
		{
			fromAlpha = 0,
			showDuration = 0.7,
			fadeInDuration = 0.5,
			hideDuration = 0.2,
			node = slot0.layerTop,
			fromPos = cc.p(slot4, 0),
			fadeInEase = Sine.easeOut,
			showEase = Back.easeOut
		}
	}

	ClassUtil.extends(Back.easeOut, slot0, BaseGameAniamtionView, true)

	slot0._spineTbl = {}
	slot10 = true
	slot4 = slot0.controller.createSpineWithEvent(BaseGameAniamtionView, slot0.controller, "ddz_sencejdwf", nil, false)
	slot0.layerCenter.btn1._spine = slot4
	slot5 = slot0.layerCenter.btn1._spine
	slot9 = 0

	slot0.layerCenter.btn1._spine.setPosition(slot4, cc.p("ddz_sencejdwf", 0))

	slot6 = slot0.layerCenter.btn1._spine

	slot0.layerCenter.btn1.spine.addChild(slot4, slot0.layerCenter.btn1.spine)

	slot10 = true
	slot4 = slot0.controller.createSpineWithEvent(slot0.layerCenter.btn1.spine, slot0.controller, "ddz_sencebxp", nil, false)
	slot0.layerCenter.btn2._spine = slot4
	slot5 = slot0.layerCenter.btn2._spine
	slot9 = 0

	slot0.layerCenter.btn2._spine.setPosition(slot4, cc.p("ddz_sencebxp", 0))

	slot6 = slot0.layerCenter.btn2._spine

	slot0.layerCenter.btn2.spine.addChild(slot4, slot0.layerCenter.btn2.spine)

	slot6 = slot0.layerCenter.btn1._spine

	table.insert(slot4, slot0._spineTbl)

	slot6 = slot0.layerCenter.btn2._spine

	table.insert(slot4, slot0._spineTbl)

	slot6 = 174

	slot0.layerBottom.infoMine.scoreInfo.setStrBaseWidth(slot4, slot0.layerBottom.infoMine.scoreInfo)

	if NewbieUI then
		NewbieUI.ddzKindBtn[GameKind_DDZ_JD] = slot0.layerCenter.btn1
		NewbieUI.ddzKindBtn[GameKind_DDZ_BXP] = slot0.layerCenter.btn2
	end
end

DdzKindCcsView.onBottomShowComplete = function (slot0)
	slot4 = GameEvent.GAME_ROOM_BOTTOM_SHOW_COMPLETE
	slot7 = slot0.model

	eventMgr.dispatch(slot2, eventMgr, slot0.model.getGameKind(slot6))
end

DdzKindCcsView.onShow = function (slot0)
	slot3 = slot0

	BaseGameAniamtionView.onShow(slot2)

	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)

	slot5 = {
		autoAlpha = 1
	}

	TweenLite.to(slot2, slot0.bg, 0.05)
end

DdzKindCcsView.onHide = function (slot0)
	slot3 = slot0

	BaseGameAniamtionView.onHide(slot2)

	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot4 = GameEvent.DDZ_KIND_HIDE_BEGIN

	eventMgr.dispatch(slot2, eventMgr)
end

DdzKindCcsView.onHideAnimationComplete = function (slot0)
	slot4 = GameEvent.DDZ_KIND_HIDE_COMPLETE

	eventMgr.dispatch(slot2, eventMgr)
end

DdzKindCcsView.onUserScoreChanged = function (slot0)
	slot7 = Hero
	slot3 = parseInt(Hero.getUserScore(slot6))
	slot11 = -1
	slot5 = HtmlUtil.createArtNumDot(slot2, slot3, "#plist_ddz_font_room_score_%s.png", nil, nil, nil, nil, nil, nil)

	slot0.layerBottom.infoMine.scoreInfo.setStrTxt(slot3, slot0.layerBottom.infoMine.scoreInfo)

	slot6 = GAME_STATE.ROOM

	slot0.controller.setHeadBg(slot3, slot0.controller, slot0.layerBottom.infoMine.head)

	if not B_HEADCLIPPING then
		slot5 = slot0.layerBottom.infoMine.head.mask

		slot0.layerBottom.infoMine.head.checkMask2(slot3, slot0.layerBottom.infoMine.head)
	else
		slot5 = false

		slot0.layerBottom.infoMine.head.mask.setVisible(slot3, slot0.layerBottom.infoMine.head.mask)
	end
end

DdzKindCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot5 = slot0.controller

		slot0.controller.exitGame(slot4)
	elseif slot1 == slot0.layerCenter.btn1 then
		slot6 = 1

		slot0.model.setRoomTabIndex(slot4, slot0.model)

		slot6 = VIEW_TYPE_ROOM

		slot0.model.setCurShowingViewType(slot4, slot0.model)
	elseif slot1 == slot0.layerCenter.btn2 then
		slot6 = 2

		slot0.model.setRoomTabIndex(slot4, slot0.model)

		slot6 = VIEW_TYPE_ROOM

		slot0.model.setCurShowingViewType(slot4, slot0.model)
	elseif slot1 == slot0.layerBottom.btnStart then
		slot0.controller.isFromQuikStart = true
		slot5 = slot0.controller

		slot0.controller.quickStartGame(true)
	end
end

DdzKindCcsView.destroy = function (slot0)
	if NewbieUI then
		NewbieUI.ddzKindBtn[GameKind_DDZ_JD] = slot0.layerCenter.btn1
		NewbieUI.ddzKindBtn[GameKind_DDZ_BXP] = slot0.layerCenter.btn2
	end

	slot3 = slot0.layerTop.btnBack

	destroySomeObj(slot2)

	slot3 = slot0.layerCenter.btn1

	destroySomeObj(slot2)

	slot3 = slot0.layerCenter.btn2

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.btnStart

	destroySomeObj(slot2)

	slot1 = ipairs
	slot3 = slot0._spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot9 = slot5

		spPoolMgr.put(slot7, spPoolMgr)
	end
end

return
