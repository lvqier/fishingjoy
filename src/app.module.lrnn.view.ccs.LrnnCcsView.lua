slot2 = "LrnnCcsView"
LrnnCcsView = class(slot1)

LrnnCcsView.onCreationComplete = function (slot0)
	slot4 = BaseGameCcsView

	ClassUtil.extends(slot2, slot0)

	slot4 = true

	BaseGameCcsView.onCreationComplete(slot2, slot0)

	slot5 = slot0

	slot0.model.roomKindChangedSignal.add(slot2, slot0.model.roomKindChangedSignal, slot0.onRoomKindChanged)

	slot5 = slot0

	slot0.model.isPoolRoomChangedSignal.add(slot2, slot0.model.isPoolRoomChangedSignal, slot0.onIsPoolRoom)

	slot5 = slot0

	Hero.pNickNameChangedSignal.add(slot2, Hero.pNickNameChangedSignal, slot0.onNickNameChanged)

	slot3 = slot0

	slot0.onRoomKindChanged(slot2)

	slot3 = slot0

	slot0.onIsPoolRoom(slot2)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)

	slot3 = slot0

	slot0.onNickNameChanged(slot2)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.btnBack, UIConfig.ALIGN_LEFT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.btnHelp, UIConfig.ALIGN_LEFT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerPlayerInfo, UIConfig.ALIGN_LEFT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerScore.layerScore, UIConfig.ALIGN_LEFT)

	slot6 = -80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.spLogo, UIConfig.ALIGN_RIGHT)

	slot6 = -80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerRoomTxt, UIConfig.ALIGN_RIGHT)

	slot6 = -80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerQuickStart, UIConfig.ALIGN_RIGHT)

	slot9 = 103
	slot12 = true

	slot0.bindPaneShowing(slot2, slot0, slot0.btnBack, "isShowingBtnBack", cc.p(slot7, -104), 0, nil, 0, nil, nil)

	slot9 = 103
	slot12 = true

	slot0.bindPaneShowing(slot2, slot0, slot0.btnHelp, "isShowingBtnHelp", cc.p(0, 0), 0, nil, 0, nil, nil)

	slot9 = 3.5
	slot12 = true

	slot0.bindPaneShowing(slot2, slot0, slot0.spLogo, "isShowingLogo", cc.p(0, 246), 0, nil, nil, nil, nil)

	slot9 = -66.15
	slot12 = true

	slot0.bindPaneShowing(slot2, slot0, slot0.layerPlayerInfo, "isShowingPlayerInfo", cc.p(0, -95.26), 0, nil, nil, nil, nil)

	slot9 = -58.21
	slot12 = true

	slot0.bindPaneShowing(slot2, slot0, slot0.layerScore, "isShowingMainScore", cc.p(0, 0), 0, nil, nil, nil, nil)

	slot9 = -44.39
	slot12 = true

	slot0.bindPaneShowing(slot2, slot0, slot0.layerQuickStart, "isShowingQuickStart", cc.p(0, 57.44), 0, 0.5, nil, Back.easeOut, nil)

	slot9 = 70
	slot12 = true

	slot0.bindPaneShowing(slot2, slot0, slot0.layerRoomTxt, "isShowingRoomTxt", cc.p(0, 0), 0, nil, nil, nil, nil)

	slot0.spineTbl = {}
	slot7 = true
	slot1 = slot0.controller.createSpineWithEvent(slot2, slot0.controller, "chongzhimenu", nil, false)
	slot4 = slot1
	slot8 = 0

	slot1.setPosition(slot0.controller, cc.p(false, 0))

	slot5 = slot1

	slot0.layerScore.layerScore.btnAdd.spine.addChild(slot0.controller, slot0.layerScore.layerScore.btnAdd.spine)

	slot5 = slot1

	table.insert(slot0.controller, slot0.spineTbl)

	slot8 = true
	slot4 = slot0.controller.createSpineWithEvent(slot0.controller, slot0.controller, "start", nil, false)
	slot8 = 0

	slot0.controller.createSpineWithEvent(slot0.controller, slot0.controller, "start", nil, false).setPosition(slot0.controller, cc.p(nil, 165))

	slot5 = slot0.controller.createSpineWithEvent(slot0.controller, slot0.controller, "start", nil, false)

	slot0.layerQuickStart.btnKSKS.addChild(slot0.controller, slot0.layerQuickStart.btnKSKS)

	slot5 = slot0.controller.createSpineWithEvent(slot0.controller, slot0.controller, "start", nil, false)

	table.insert(slot0.controller, slot0.spineTbl)

	slot5 = true

	slot0.layerPlayerInfo.head.setIsMine(slot0.controller, slot0.layerPlayerInfo.head)
end

LrnnCcsView.onRootViewHide = function (slot0)
	slot3 = slot0

	BaseGameCcsView.onRootViewHide(slot2)

	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)
end

LrnnCcsView.onRootViewShow = function (slot0)
	slot3 = slot0

	BaseGameCcsView.onRootViewShow(slot2)

	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)
end

LrnnCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnBack then
		slot5 = slot0.controller

		slot0.controller.onBtnBackClick(slot4)
	elseif slot1 == slot0.btnHelp then
		slot6 = true

		slot0.model.setIsShowingRule(slot4, slot0.model)
	elseif slot1 == slot0.layerQuickStart.btnKSKS then
		slot5 = slot0.controller

		slot0.controller.quickStartGame(slot4)
	end
end

LrnnCcsView.playSpine = function (slot0)
	slot1 = ipairs
	slot3 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot11 = true

		slot5.setAnimation(slot7, slot5, 0, "animation")
	end
end

LrnnCcsView.pauseSpine = function (slot0)
	slot1 = ipairs
	slot3 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot8 = slot5

		slot5.clearTracks(slot7)
	end
end

LrnnCcsView.cacheSpines = function (slot0)
	slot1 = ipairs
	slot3 = slot0.spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot9 = slot5

		spPoolMgr.put(slot7, spPoolMgr)
	end

	slot0.spineTbl = nil
end

LrnnCcsView.onRoomKindChanged = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getRoomKind(slot2) or slot1 <= 0 then
		return
	end

	slot9 = gameMgr
	slot9 = 2
	slot8 = ResConfig.getAssetPath("module/lrnn/ui/txt/room_kind_" .. slot1 .. ".png")
	slot6 = HtmlUtil.createImg(gameMgr.getCurRoomNum(slot8))
	slot8 = true

	slot0.layerRoomTxt.roomName_tf.setIsAssetVCenter(slot6, slot0.layerRoomTxt.roomName_tf)

	slot8 = HtmlUtil.createImg("module/lrnn/ui/txt/lrnn_txt_room_index.png") .. HtmlUtil.createArtNumEx(slot2, gameMgr.getCurRoomNum(slot8), "#lrnn_room_index_%s.png") .. slot6

	slot0.layerRoomTxt.roomName_tf.setHtmlText(slot6, slot0.layerRoomTxt.roomName_tf)
end

LrnnCcsView.onIsPoolRoom = function (slot0)
	slot5 = slot0.model.getIsPoolRoom(slot2)

	slot0.layerRoomTxt.spFlag.setVisible(slot0.model, slot0.layerRoomTxt.spFlag)
end

LrnnCcsView.onNickNameChanged = function (slot0)
	slot7 = 2
	slot5 = StringUtil.truncate(Hero, Hero.getPNickName(slot2), 10, nil)

	slot0.layerPlayerInfo.txtName.setString(Hero, slot0.layerPlayerInfo.txtName)
end

LrnnCcsView.onUserScoreChanged = function (slot0)
	slot4 = 145

	slot0.layerScore.layerScore.setStrBaseWidth(slot2, slot0.layerScore.layerScore)

	slot3 = slot0.layerScore.layerScore
	slot10 = Hero
	slot7 = "#lrnn_score_num_%s.png"

	slot0.layerScore.layerScore.setStrTxt(slot2, HtmlUtil.createArtNumDot(slot5, parseInt(Hero.getUserScore(slot9))))
end

return
