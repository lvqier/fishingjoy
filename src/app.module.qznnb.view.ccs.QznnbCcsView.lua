QznnbCcsView = class("QznnbCcsView")

QznnbCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseGameCcsView)
	BaseGameCcsView.onCreationComplete(slot0, true)
	slot0.model.roomKindChangedSignal:add(slot0.onRoomKindChanged, slot0)
	Hero.pNickNameChangedSignal:add(slot0.onNickNameChanged, slot0)
	slot0:onRoomKindChanged()
	slot0:onUserScoreChanged()
	slot0:onNickNameChanged()
	slot0.controller:adjustSlimWidth(slot0.btnBack, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.btnHelp, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerPlayerInfo, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.layerScore.layerScore, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.spLogo, UIConfig.ALIGN_RIGHT, -80)
	slot0.controller:adjustSlimWidth(slot0.layerRoomTxt, UIConfig.ALIGN_RIGHT, -80)
	slot0.controller:adjustSlimWidth(slot0.layerQuickStart, UIConfig.ALIGN_RIGHT, -80)
	slot0:bindPaneShowing(slot0.btnBack, "isShowingBtnBack", cc.p(-106, 99), 0, nil, 0, nil, nil, true)
	slot0:bindPaneShowing(slot0.btnHelp, "isShowingBtnHelp", cc.p(0, 103), 0, nil, 0, nil, nil, true)
	slot0:bindPaneShowing(slot0.spLogo, "isShowingLogo", cc.p(247.5, 24), 0, nil, nil, nil, nil, true)
	slot0:bindPaneShowing(slot0.layerPlayerInfo, "isShowingPlayerInfo", cc.p(-95.26, -66.15), 0, nil, nil, nil, nil, true)
	slot0:bindPaneShowing(slot0.layerScore, "isShowingMainScore", cc.p(0, -58.21), 0, nil, nil, nil, nil, true)
	slot0:bindPaneShowing(slot0.layerQuickStart, "isShowingQuickStart", cc.p(57.44, -44.39), 0, 0.5, nil, Back.easeOut, nil, true)
	slot0:bindPaneShowing(slot0.layerRoomTxt, "isShowingRoomTxt", cc.p(0, 70), 0, nil, nil, nil, nil, true)

	slot0.spineTbl = {}
	slot1 = slot0.controller:createSpineWithEvent("chongzhimenu", nil, false, true)

	slot1:setPosition(cc.p(0, 0))
	slot0.layerScore.layerScore.btnAdd.spine:addChild(slot1)
	table.insert(slot0.spineTbl, slot1)
	slot0.controller:createSpineWithEvent("start", nil, false, true).setPosition(slot1, cc.p(165, 0))
	slot0.layerQuickStart.btnKSKS:addChild(slot1)
	table.insert(slot0.spineTbl, slot1)
	slot0.layerPlayerInfo.head:setIsMine(true)
end

QznnbCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnBack then
		slot0.controller:onBtnBackClick()
	elseif slot1 == slot0.btnHelp then
		slot0.model:setIsShowingRule(true)
	elseif slot1 == slot0.layerQuickStart.btnKSKS then
		slot0.controller:quickStartGame()
	end
end

QznnbCcsView.onRootViewHide = function (slot0)
	BaseGameCcsView.onRootViewHide(slot0)
	Hero.userScoreChangedSignal:remove(slot0.onUserScoreChanged, slot0)
end

QznnbCcsView.onRootViewShow = function (slot0)
	BaseGameCcsView.onRootViewShow(slot0)
	Hero.userScoreChangedSignal:add(slot0.onUserScoreChanged, slot0)
	slot0:onUserScoreChanged()
end

QznnbCcsView.playSpine = function (slot0)
	slot1 = ipairs
	slot2 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:setAnimation(0, "animation", true)
	end
end

QznnbCcsView.pauseSpine = function (slot0)
	slot1 = ipairs
	slot2 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:clearTracks()
	end
end

QznnbCcsView.cacheSpines = function (slot0)
	slot1 = ipairs
	slot2 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		spPoolMgr:put(slot5)
	end

	slot0.spineTbl = nil
end

QznnbCcsView.onRoomKindChanged = function (slot0)
	if not slot0.model:getRoomKind() or slot1 <= 0 then
		return
	end

	slot0.layerRoomTxt.roomName_tf:setIsAssetVCenter(true)
	slot0.layerRoomTxt.roomName_tf:setHtmlText(HtmlUtil.createImg(slot2) .. HtmlUtil.createArtNumEx(gameMgr:getCurRoomNum(), "#qznnb_room_index_%s.png", 2) .. HtmlUtil.createImg(slot3))
end

QznnbCcsView.onNickNameChanged = function (slot0)
	slot0.layerPlayerInfo.txtName:setString(StringUtil.truncate(Hero:getPNickName(), 10, nil, 2))
end

QznnbCcsView.onUserScoreChanged = function (slot0)
	slot0.layerScore.layerScore:setStrBaseWidth(145)
	slot0.layerScore.layerScore:setStrTxt(HtmlUtil.createArtNumDot(parseInt(Hero:getUserScore()), "#qznnb_score_num_%s.png"))
end

return
