slot2 = "PdkBattleCcsView"
PdkBattleCcsView = class(slot1)

PdkBattleCcsView.onCreationComplete = function (slot0)
	slot4 = BaseGameBattleView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	slot0.initSignal(slot2)

	slot4 = true

	slot0.btnArea.setIsIgnoreSound(slot2, slot0.btnArea)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.nodeInfo.mine, UIConfig.ALIGN_LEFT)

	slot0._nodeInfos = {
		[PDK_VIEW_CHAIRID_ME] = slot0.nodeInfo.mine,
		[PDK_VIEW_CHAIRID_RIGHT] = slot0.nodeInfo.right,
		[PDK_VIEW_CHAIRID_LEFT] = slot0.nodeInfo.left
	}
	slot0._ctScoreTfs = {
		[PDK_VIEW_CHAIRID_ME] = slot0.mineScore.tf_tf,
		[PDK_VIEW_CHAIRID_RIGHT] = slot0.rightScore.tf_tf,
		[PDK_VIEW_CHAIRID_LEFT] = slot0.leftScore.tf_tf
	}
	slot4 = 13

	slot0.nodeInfo.mine.autoNode.setStrBaseWidth(PDK_VIEW_CHAIRID_LEFT, slot0.nodeInfo.mine.autoNode)

	slot4 = 90

	slot0.nodeInfo.right.autoNode.setStrBaseWidth(PDK_VIEW_CHAIRID_LEFT, slot0.nodeInfo.right.autoNode)

	slot4 = 86

	slot0.nodeInfo.left.autoNode.setStrBaseWidth(PDK_VIEW_CHAIRID_LEFT, slot0.nodeInfo.left.autoNode)

	slot4 = true

	slot0.roomInfo.roomName_tf.setIsAssetVCenter(PDK_VIEW_CHAIRID_LEFT, slot0.roomInfo.roomName_tf)

	slot4 = true

	slot0.roomInfo.cellScore_tf.setIsAssetVCenter(PDK_VIEW_CHAIRID_LEFT, slot0.roomInfo.cellScore_tf)

	slot3 = slot0

	slot0.onIsShowBtnStartChanged(PDK_VIEW_CHAIRID_LEFT)

	slot3 = slot0

	slot0.onIsShowAutoIconDicChanged(PDK_VIEW_CHAIRID_LEFT)

	slot3 = slot0

	slot0.onIsShowingMenuChanged(PDK_VIEW_CHAIRID_LEFT)

	slot3 = slot0

	slot0.onRoomKindChanged(PDK_VIEW_CHAIRID_LEFT)

	slot3 = slot0

	slot0.onMyTableUserDatasDicChanged(PDK_VIEW_CHAIRID_LEFT)

	slot3 = slot0

	slot0.onStateViewDicChanged(PDK_VIEW_CHAIRID_LEFT)

	slot3 = slot0

	slot0.onCurrentUserChanged(PDK_VIEW_CHAIRID_LEFT)

	slot3 = slot0

	slot0.onCellScoreChanged(PDK_VIEW_CHAIRID_LEFT)

	slot3 = slot0

	slot0.onCurCtScoreDicChanged(PDK_VIEW_CHAIRID_LEFT)

	slot3 = slot0

	slot0.onLeaveCardsCountDicChanged(PDK_VIEW_CHAIRID_LEFT)

	slot3 = slot0

	slot0.onGameStateChanged(PDK_VIEW_CHAIRID_LEFT)
end

PdkBattleCcsView.initSignal = function (slot0)
	slot5 = slot0

	slot0.model.isShowingMenuChangedSignal.add(slot2, slot0.model.isShowingMenuChangedSignal, slot0.onIsShowingMenuChanged)

	slot5 = slot0

	slot0.model.isShowAutoIconDicChangedSignal.add(slot2, slot0.model.isShowAutoIconDicChangedSignal, slot0.onIsShowAutoIconDicChanged)

	slot5 = slot0

	slot0.model.isShowBtnStartChangedSignal.add(slot2, slot0.model.isShowBtnStartChangedSignal, slot0.onIsShowBtnStartChanged)

	slot5 = slot0

	slot0.model.stateViewDicChangedSignal.add(slot2, slot0.model.stateViewDicChangedSignal, slot0.onStateViewDicChanged)

	slot5 = slot0

	slot0.model.currentUserChangedSignal.add(slot2, slot0.model.currentUserChangedSignal, slot0.onCurrentUserChanged)

	slot5 = slot0

	slot0.model.myTableUserDatasDicChangedSignal.add(slot2, slot0.model.myTableUserDatasDicChangedSignal, slot0.onMyTableUserDatasDicChanged)

	slot5 = slot0

	slot0.model.roomKindChangedSignal.add(slot2, slot0.model.roomKindChangedSignal, slot0.onRoomKindChanged)

	slot5 = slot0

	slot0.model.lCellScoreChangedSignal.add(slot2, slot0.model.lCellScoreChangedSignal, slot0.onCellScoreChanged)

	slot5 = slot0

	slot0.model.curCtScoreDicChangedSignal.add(slot2, slot0.model.curCtScoreDicChangedSignal, slot0.onCurCtScoreDicChanged)

	slot5 = slot0

	slot0.model.leaveCardsCountDicChangedSignal.add(slot2, slot0.model.leaveCardsCountDicChangedSignal, slot0.onLeaveCardsCountDicChanged)

	slot5 = slot0

	slot0.model.gameStateChangedSignal.add(slot2, slot0.model.gameStateChangedSignal, slot0.onGameStateChanged)
end

PdkBattleCcsView.onLeaveCardsCountDicChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getLeaveCardsCountDic(slot2) then
		if slot1[PDK_VIEW_CHAIRID_LEFT] == 1 then
			slot5 = 1

			slot0.leaveLeft.num_tf.setHtmlText(slot3, slot0.leaveLeft.num_tf)
		else
			slot5 = ""

			slot0.leaveLeft.num_tf.setHtmlText(slot3, slot0.leaveLeft.num_tf)
		end

		if slot1[PDK_VIEW_CHAIRID_RIGHT] == 1 then
			slot5 = 1

			slot0.leaveRight.num_tf.setHtmlText(slot3, slot0.leaveRight.num_tf)
		else
			slot5 = ""

			slot0.leaveRight.num_tf.setHtmlText(slot3, slot0.leaveRight.num_tf)
		end
	end
end

PdkBattleCcsView.onRoomKindChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getRoomKind(slot2) <= 0 then
		return
	end

	slot5 = "txt/pdk_room_kind" .. slot1 .. ".png"
	slot6 = "txt/pdk_txt_haofang.png"
	slot9 = gameMgr
	slot9 = 2
	slot8 = slot0.controller.getUIPath(slot0.controller, slot0.controller)
	slot8 = HtmlUtil.createImg(slot0.controller) .. HtmlUtil.createArtNumEx(slot2, gameMgr.getCurRoomNum(slot8), "#plist_pdk_font_room_index_%s.png") .. HtmlUtil.createImg(gameMgr.getCurRoomNum(slot8))

	slot0.roomInfo.roomName_tf.setHtmlText(HtmlUtil.createImg(gameMgr.getCurRoomNum(slot8)), slot0.roomInfo.roomName_tf)
end

PdkBattleCcsView.onCellScoreChanged = function (slot0)
	slot5 = "txt/pdk_txt_difen.png"
	slot6 = "txt/pdk_txt_fen.png"
	slot8 = "#plist_pdk_font_cell_score_%s.png"
	slot8 = slot0.controller.getUIPath(slot0.controller, slot0.controller)
	slot8 = HtmlUtil.createImg(slot0.controller) .. HtmlUtil.createArtNum(slot2, slot1) .. HtmlUtil.createImg(slot1)

	slot0.roomInfo.cellScore_tf.setHtmlText(HtmlUtil.createImg(slot1), slot0.roomInfo.cellScore_tf)
end

PdkBattleCcsView.onCurrentUserChanged = function (slot0)
	slot3 = slot0.nodeOpMenu.clock.root

	slot0.nodeOpMenu.clock.root.stop(slot2)

	slot3 = slot0.model

	if slot0.model.getCurrentUser(slot2) == PDK_VIEW_CHAIRID_ME then
		slot7 = true

		slot0.nodeOpMenu.clock.root.progress.setProgressPlaying(slot0.controller, slot0.nodeOpMenu.clock.root.progress, true, slot1)

		slot7 = "#plist_pdk_font_clock_yellow_1_%s.png"

		slot0.nodeOpMenu.clock.root.start(slot0.controller, slot0.nodeOpMenu.clock.root, slot0.controller.getCurClockTime(slot2), nil)
	end
end

PdkBattleCcsView.onIsShowAutoIconDicChanged = function (slot0)
	slot5 = slot0.model.getIsShowAutoIconDic(slot2) or {}[PDK_VIEW_CHAIRID_LEFT]

	slot0.leftAutoIcon.setVisible(slot0.model, slot0.leftAutoIcon)

	slot5 = slot0.model.getIsShowAutoIconDic(slot2) or [PDK_VIEW_CHAIRID_RIGHT]

	slot0.rightAutoIcon.setVisible(slot0.model, slot0.rightAutoIcon)

	slot5 = slot0.model.getIsShowAutoIconDic(slot2) or .isShowBtnAuto == true

	slot0.btnAuto.setVisible(slot0.model, slot0.btnAuto)
end

PdkBattleCcsView.onStateViewDicChanged = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getLockViewDic(slot2) or not slot1.stateViewDic or not slot1.stateViewDic[PDK_VIEW_CHAIRID_ME] then
		slot4 = slot0.model
		slot3 = slot0.model.getStateViewDic(slot3) and slot2[PDK_VIEW_CHAIRID_ME] == "turnView"

		if slot3 then
			slot6 = slot0.controller

			if not slot0.controller.isFirstHand(slot5) then
				slot6 = slot0.controller
				slot4 = not slot0.controller.isTurnWinner(slot5)
			else
				slot4 = false

				if false then
					slot4 = true
				end
			end

			slot8 = slot4

			slot0.nodeOpMenu.btnTips.setVisible(slot6, slot0.nodeOpMenu.btnTips)

			if slot4 then
				slot8 = 487.53

				slot0.nodeOpMenu.btnOut.setPositionX(slot6, slot0.nodeOpMenu.btnOut)

				slot8 = 252.11

				slot0.nodeOpMenu.clock.setPositionX(slot6, slot0.nodeOpMenu.clock)
			else
				slot8 = 359.53

				slot0.nodeOpMenu.btnOut.setPositionX(slot6, slot0.nodeOpMenu.btnOut)

				slot8 = 124.11

				slot0.nodeOpMenu.clock.setPositionX(slot6, slot0.nodeOpMenu.clock)
			end
		end

		slot7 = slot2 and slot2[PDK_VIEW_CHAIRID_ME] == "turnView"

		slot0.nodeOpMenu.setVisible(slot5, slot0.nodeOpMenu)
	end
end

PdkBattleCcsView.onCurCtScoreDicChanged = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getCurCtScoreDic(slot2) then
		return
	end

	slot4 = slot0._ctScoreTfs

	for slot5, slot6 in pairs(slot3) do
		slot10 = false

		slot6.setVisible(slot8, slot6)
	end

	slot4 = slot1

	for slot5, slot6 in pairs(slot3) do
		slot7 = slot0._ctScoreTfs[slot5]
		slot8 = ""
		slot9 = false

		if PDK_VIEW_CHAIRID_ME == slot5 then
			if slot6 > 0 then
				slot13 = "#plist_pdk_font_ctScore_win2_%s.png"
				slot8 = HtmlUtil.createArtNumDotSign(slot11, slot6)
				slot9 = true
			elseif slot6 <= 0 then
				slot13 = "#plist_pdk_font_ctScore_lose2_%s.png"
				slot8 = HtmlUtil.createArtNumDotSign(slot11, slot6)
			end
		elseif slot6 > 0 then
			slot13 = "#plist_pdk_font_ctScore_win1_%s.png"
			slot8 = HtmlUtil.createArtNumDotSign(slot11, slot6)
			slot9 = true
		elseif slot6 <= 0 then
			slot13 = "#plist_pdk_font_ctScore_lose1_%s.png"
			slot8 = HtmlUtil.createArtNumDotSign(slot11, slot6)
		end

		if slot8 ~= "" then
			slot10 = 0

			function slot11()
				slot0._ctScoreSpineDic = slot0._ctScoreSpineDic or {}

				if not slot0._ctScoreSpineDic[slot0._ctScoreSpineDic or ] then
					slot4 = "pdkshanguang"
					slot7 = -10

					slot0.controller.createSpineByPool(slot2, slot0.controller).setPosition(slot2, cc.p(slot5, slot2))

					slot3 = slot0
					slot4 = slot0.controller.createSpineByPool(slot2, slot0.controller)

					slot0.getParent(slot2).addChild(slot2, slot0.getParent(slot2))
				end

				slot6 = false

				slot0.addAnimation(slot2, slot0, 0, "animation")

				slot0._ctScoreSpineDic[] = slot0

				if 0 then
					slot4 = "GET_REWARD.mp3"

					slot0.controller.playEffect(slot2, slot0.controller)
				end
			end

			function slot12()
				slot3 = -30

				slot0.setPositionY(slot1, slot0)
			end

			slot16 = slot8

			slot7.setHtmlText(slot14, slot7)

			if slot5 == PDK_VIEW_CHAIRID_LEFT then
				slot15 = slot7
				slot10 = slot7.getTextWidth(slot14) * 0.5
			elseif slot5 == PDK_VIEW_CHAIRID_RIGHT then
				slot15 = slot7
				slot10 = slot7.getTextWidth(slot14) * -0.5
			end

			slot13 = nil

			if slot6 > 0 then
				slot13 = slot11
			end

			slot17 = -30

			slot7.setPositionY(slot15, slot7)

			slot14 = TimelineLite.new(slot15)
			slot17 = slot14
			slot22 = {
				autoAlpha = 1,
				y = -20,
				onComplete = slot13
			}

			slot14.insert({
				onComplete = slot12
			}, TweenLite.to(slot19, slot7, 0.3))

			slot17 = slot14
			slot22 = {
				delay = 1,
				autoAlpha = 0
			}

			slot14.insert(, TweenLite.to(slot19, slot7, 0.6))
		end
	end
end

PdkBattleCcsView.onIsShowBtnStartChanged = function (slot0)
	slot3 = slot0.btnStart
	slot6 = slot0.model

	slot0.btnStart.setVisible(slot2, slot0.model.getIsShowBtnStart(slot5))
end

PdkBattleCcsView.onIsShowingMenuChanged = function (slot0)
	slot5 = not slot0.model.getIsShowingMenu(slot2)

	slot0.btnMenu1.setVisible(slot0.model, slot0.btnMenu1)

	slot5 = slot0.model.getIsShowingMenu(slot2)

	slot0.btnMenu2.setVisible(slot0.model, slot0.btnMenu2)
end

PdkBattleCcsView.onMyTableUserDatasDicChanged = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getMyTableUserDatasDic(slot2) or {}
	slot4 = slot0._nodeInfos

	for slot5, slot6 in pairs(slot3) do
		slot10 = slot1[slot5] ~= nil

		slot6.setVisible(slot8, slot6)

		if slot1[slot5] then
			slot11 = true

			slot6.setData(slot8, slot6, slot1[slot5])
		end
	end
end

PdkBattleCcsView.onGameStateChanged = function (slot0)
	slot5 = slot0.model.getGameState(slot0.leaveRight.setVisible) == PDK_GAMESTATE_PLAY

	slot0.leaveRight.setVisible(slot0.model, slot0.leaveRight)

	slot5 = slot1 == PDK_GAMESTATE_PLAY

	slot0.leaveLeft.setVisible(slot0.model, slot0.leaveLeft)
end

PdkBattleCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnMenu1 or slot1 == slot0.btnMenu2 then
		slot5 = slot0.controller

		slot0.controller.onMenuBtnClick(slot4)
	elseif slot1 == slot0.btnStart then
		slot5 = slot0.controller

		slot0.controller.onClickStartGame(slot4)
	elseif slot1 == slot0.nodeOpMenu.btnTips then
		slot5 = slot0.controller

		slot0.controller.clickTips(slot4)
	elseif slot1 == slot0.nodeOpMenu.btnOut then
		slot5 = slot0.controller

		slot0.controller.requestOutCard(slot4)
	elseif slot1 == slot0.btnAuto then
		slot5 = true

		reqPdkAuto(slot4)
	elseif slot1 == slot0.btnArea then
		slot6 = nil

		slot0.model.setSelectedCardsDic(slot4, slot0.model)

		slot6 = nil

		slot0.model.setSelectedOutCardsDic(slot4, slot0.model)

		slot6 = nil

		slot0.model.setTipsInfo(slot4, slot0.model)
	elseif slot1 == slot0.btnChat then
		slot5 = slot0.controller

		slot0.controller.onBtnChatClick(slot4)
	else
		slot6 = "敬请期待, 该功能即将开放"

		tweenMsgMgr.showWhiteMsg(slot4, tweenMsgMgr)
	end
end

return
