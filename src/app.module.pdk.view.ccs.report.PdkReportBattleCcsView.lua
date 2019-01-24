slot2 = "PdkReportBattleCcsView"
PdkReportBattleCcsView = class(slot1)

PdkReportBattleCcsView.onCreationComplete = function (slot0)
	slot4 = true

	slot0.roomInfo.roomName_tf.setIsAssetVCenter(slot2, slot0.roomInfo.roomName_tf)

	slot4 = true

	slot0.roomInfo.cellScore_tf.setIsAssetVCenter(slot2, slot0.roomInfo.cellScore_tf)

	slot0._nodeInfoDiZhus = {
		[PDK_VIEW_CHAIRID_ME] = slot0.nodeInfoDizhu.mine,
		[PDK_VIEW_CHAIRID_RIGHT] = slot0.nodeInfoDizhu.right,
		[PDK_VIEW_CHAIRID_LEFT] = slot0.nodeInfoDizhu.left
	}
	slot0._outSheetPukes = {
		[PDK_VIEW_CHAIRID_ME] = slot0.sheetMinePuke.outSheetPukeNode,
		[PDK_VIEW_CHAIRID_RIGHT] = slot0.outSheetRightPuke,
		[PDK_VIEW_CHAIRID_LEFT] = slot0.outSheetLeftPuke
	}
	slot0._autoIcons = {
		[PDK_VIEW_CHAIRID_ME] = slot0.mineAutoIcon,
		[PDK_VIEW_CHAIRID_RIGHT] = slot0.rightAutoIcon,
		[PDK_VIEW_CHAIRID_LEFT] = slot0.leftAutoIcon
	}
	slot4 = 102

	slot0.nodeInfoDizhu.mine.autoNode.setStrBaseWidth(PDK_VIEW_CHAIRID_LEFT, slot0.nodeInfoDizhu.mine.autoNode)

	slot4 = 41

	slot0.nodeInfoDizhu.right.autoNode.setStrBaseWidth(PDK_VIEW_CHAIRID_LEFT, slot0.nodeInfoDizhu.right.autoNode)

	slot4 = 27

	slot0.nodeInfoDizhu.left.autoNode.setStrBaseWidth(PDK_VIEW_CHAIRID_LEFT, slot0.nodeInfoDizhu.left.autoNode)

	slot4 = false

	slot0.nodeInfoDizhu.mine.autoNode.btnAdd.setVisible(PDK_VIEW_CHAIRID_LEFT, slot0.nodeInfoDizhu.mine.autoNode.btnAdd)

	slot0.btnMenu.onPushingDownChanged = function ()
		return
	end

	slot5 = slot0

	slot0.model.reportRawDataChangedSignal.add(function ()
		return
	end, slot0.model.reportRawDataChangedSignal, slot0.onReportDataChanged)

	slot5 = slot0

	slot0.model.curIdxChangedSignal.add(function ()
		return
	end, slot0.model.curIdxChangedSignal, slot0.onCurIdxChanged)

	slot5 = slot0

	slot0.model.isShowingReportMenuChangedSignal.add(function ()
		return
	end, slot0.model.isShowingReportMenuChangedSignal, slot0.onIsShowingReportMenuChanged)

	slot5 = slot0

	slot0.model.startReplayChangedSignal.add(function ()
		return
	end, slot0.model.startReplayChangedSignal, slot0.onStartReplayChanged)

	slot5 = slot0

	slot0.model.isShowingReportWinChangedSignal.add(function ()
		return
	end, slot0.model.isShowingReportWinChangedSignal, slot0.onIsShowingReportWinChanged)

	slot5 = slot0

	slot0.model.isShowingReportLoseChangedSignal.add(function ()
		return
	end, slot0.model.isShowingReportLoseChangedSignal, slot0.onIsShowingReportLoseChanged)

	slot4 = PDK_VIEW_CHAIRID_LEFT

	slot0.handSheetLeftPuke.setViewChairId(function ()
		return
	end, slot0.handSheetLeftPuke)

	slot4 = PDK_VIEW_CHAIRID_LEFT

	slot0.outSheetLeftPuke.setViewChairId(function ()
		return
	end, slot0.outSheetLeftPuke)

	slot4 = PDK_VIEW_CHAIRID_RIGHT

	slot0.handSheetRightPuke.setViewChairId(function ()
		return
	end, slot0.handSheetRightPuke)

	slot4 = PDK_VIEW_CHAIRID_RIGHT

	slot0.outSheetRightPuke.setViewChairId(function ()
		return
	end, slot0.outSheetRightPuke)

	slot3 = slot0

	slot0.onIsShowingReportMenuChanged(function ()
		return
	end)

	slot3 = slot0

	slot0.onIsShowingReportWinChanged(function ()
		return
	end)

	slot3 = slot0

	slot0.onIsShowingReportLoseChanged(function ()
		return
	end)

	slot3 = slot0

	slot0.onStartReplayChanged(function ()
		return
	end)

	slot3 = slot0

	slot0.onReportDataChanged(function ()
		return
	end)
end

PdkReportBattleCcsView.onShow = function (slot0)
	slot3 = slot0

	slot0.onIsShowingReportMenuChanged(slot2)
end

PdkReportBattleCcsView.onIsShowingReportWinChanged = function (slot0)
	slot3 = slot0.winView
	slot6 = slot0.model

	slot0.winView.setVisible(slot2, slot0.model.getIsShowingReportWin(slot5))

	slot3 = slot0.btnReport
	slot6 = slot0.model

	slot0.btnReport.setVisible(slot2, slot0.model.getIsShowingReportWin(slot5))
end

PdkReportBattleCcsView.onIsShowingReportLoseChanged = function (slot0)
	slot3 = slot0.loseView
	slot6 = slot0.model

	slot0.loseView.setVisible(slot2, slot0.model.getIsShowingReportLose(slot5))

	slot3 = slot0.btnReport
	slot6 = slot0.model

	slot0.btnReport.setVisible(slot2, slot0.model.getIsShowingReportLose(slot5))
end

PdkReportBattleCcsView.onIsShowingReportMenuChanged = function (slot0)
	slot5 = slot0.model.getIsShowingReportMenu(slot2)

	slot0.btnMenu.frame.setVisible(slot0.model, slot0.btnMenu.frame)

	if slot0.model.getIsShowingReportMenu(slot2) then
		slot7 = 3000

		slot0.controller.startEventTick(slot3, slot0.controller, function ()
			slot3 = false

			slot0.model.setIsShowingReportMenu(slot1, slot0.model)
		end, "PdkReportBattleCcsView:onIsShowingReportMenuChanged1")
	end
end

PdkReportBattleCcsView.onStartReplayChanged = function (slot0)
	slot5 = not slot0.model.getStartReplay(slot2)

	slot0.btnMenu.frame.btnPlay.setVisible(slot0.model, slot0.btnMenu.frame.btnPlay)

	slot5 = slot0.model.getStartReplay(slot2)

	slot0.btnMenu.frame.btnStop.setVisible(slot0.model, slot0.btnMenu.frame.btnStop)
end

PdkReportBattleCcsView.onReportDataChanged = function (slot0)
	slot3 = slot0

	slot0.updateDizhuCardNode(slot2)

	slot3 = slot0

	slot0.onMyTableUserDatasDicChanged(slot2)

	slot3 = slot0

	slot0.addPlayerFigure(slot2)
end

PdkReportBattleCcsView.updateDizhuCardNode = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getReportRawData(slot2) then
		return
	end

	slot3 = slot0.nodeDiZhu.beiShu
	slot6 = slot1.backcard

	for slot7, slot8 in ipairs(slot5) do
		slot13 = slot7
		slot11 = tostring(slot12)
		slot13 = slot8

		slot0.nodeDiZhu["card" .. slot11].root.setDataInt(slot11, slot0.nodeDiZhu["card" .. slot11].root)

		slot13 = false

		slot0.nodeDiZhu["card" .. slot11].root.setIsShowingBack(slot11, slot0.nodeDiZhu["card" .. slot11].root)
	end

	slot8 = slot1.timesidx
	slot8 = slot1.timesidx
	slot8 = slot3.num.txt
	slot12 = "txt/pdk_txt_" .. slot4.times .. "bei.png"

	slot3.num.txt.setTexture(slot7, slot0.model.getUIPath(slot10, slot0.model))

	slot9 = ({
		cardType = slot0.model.getBctByTimeIdx(slot6, slot0.model),
		times = slot0.model.getBeiShuByTimeIdx(slot6, slot0.model)
	})["cardType"] ~= nil and slot4.cardType ~= BCT_SINGLE

	slot3.setVisible(slot7, slot3)

	if ()["cardType"] ~= nil and slot4.cardType ~= BCT_SINGLE then
		slot8 = slot3.tips.txt
		slot12 = "txt/" .. PDK_DIPAI_TEX[slot4.cardType]

		slot3.tips.txt.setTexture(slot7, slot0.model.getUIPath(slot10, slot0.model))
	end
end

PdkReportBattleCcsView.addPlayerFigure = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getReportRawData(slot2) then
		return
	end

	slot6 = slot0.model
	slot2 = table.nums(slot0.model.getReportStepDatasDic(slot5))
	slot3 = slot0.model.getCurIdx(slot0.model.getReportStepDatasDic)
	slot4 = slot0.model.getBankerViewChairId(slot0.model)
	slot7 = slot0._nodeInfoDiZhus

	for slot8, slot9 in pairs(slot0.model) do
		slot13 = false

		slot9.figure.setVisible(slot11, slot9.figure)

		slot13 = slot8
		slot13 = slot9.figure
		slot15, slot12 = slot9.figure.getPosition(slot0.controller)
		slot16 = slot12 - 100
		slot13 = cc.p(slot14, slot11)
		slot0._spineHead = slot0._spineHead or {}
		slot17 = slot0._spineHead[slot8]

		spPoolMgr.put(slot15, spPoolMgr)

		slot18 = slot0.controller.getReportAnimName(slot11, slot0.controller)
		slot0._spineHead[slot8] = slot0.controller.createSpineByPool(spPoolMgr, slot0.controller)
		slot14 = (slot8 == PDK_VIEW_CHAIRID_RIGHT and 1) or -1

		if slot4 == slot8 then
			slot14 = -1 * slot14
		end

		if slot10 == "nvnongming" then
			slot19 = (slot8 == PDK_VIEW_CHAIRID_RIGHT and "right") or "left"

			slot0._spineHead[slot8].setSkin(slot17, slot0._spineHead[slot8])
		end

		slot18 = -1

		slot0._spineHead[slot8].setLocalZOrder(slot16, slot0._spineHead[slot8])

		slot18 = 1

		slot0._spineHead[slot8].setScale(slot16, slot0._spineHead[slot8])

		slot18 = 1 * slot14

		slot0._spineHead[slot8].setScaleX(slot16, slot0._spineHead[slot8])

		slot18 = slot13

		slot0._spineHead[slot8].setPosition(slot16, slot0._spineHead[slot8])
		slot0._spineHead[slot8].setAnimation(slot16, slot0._spineHead[slot8], 0, "idle")

		slot18 = slot0._spineHead[slot8]

		slot9.addChild(slot16, slot9)

		slot18 = "bianshe"
		slot15 = slot0.controller.createSpineWithEvent(slot16, slot0.controller)
		slot18 = slot15
		slot22 = slot12

		slot15.setPosition(slot0.controller, cc.p(true, slot11))

		slot19 = 0.5

		slot15.setTimeScale(slot0.controller, slot15)

		slot19 = slot15

		slot9.addChild(slot0.controller, slot9)

		slot24 = 1.1
		slot25 = 0.95
		slot20 = cc.ScaleTo.create(cc.ScaleTo, cc.ScaleTo, 0.3, 0.95 * slot14)
		slot26 = 1
		slot20 = cc.Sequence.create(slot0.controller, cc.Sequence, cc.ScaleTo.create(true, cc.ScaleTo, 0.2, 1.1 * slot14), cc.ScaleTo.create(cc.ScaleTo, cc.ScaleTo, 0.2, 1 * slot14))

		slot0._spineHead[slot8].runAction(cc.Sequence, slot0._spineHead[slot8])
	end
end

PdkReportBattleCcsView.onMyTableUserDatasDicChanged = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getReportRawData(slot2) then
		return
	end

	slot4 = slot0.model
	slot2 = slot0.model.getReportUsersInfoDic(slot3) or {}
	slot5 = slot0._nodeInfoDiZhus

	for slot6, slot7 in pairs(slot4) do
		slot12 = slot2[slot6] ~= nil

		slot7.setVisible(slot10, slot7)

		if slot8 then
			slot9 = slot8.name

			if slot0.model._reportIncludeMySelf and slot6 == PDK_VIEW_CHAIRID_ME then
				slot12 = Hero
				slot9 = Hero.getPNickName(slot11)
			end

			slot12 = slot7.txtName
			slot18 = 2

			slot7.txtName.setString(slot11, StringUtil.truncate(slot14, slot9, 8, nil))

			slot14 = slot8.score
			slot22 = nil
			slot14 = HtmlUtil.createArtNumWithHansUnits(slot11, parseInt(StringUtil.truncate), "#plist_pdk_font_bean_2_%s.png", nil, nil, nil, nil, nil, nil, nil, 0)

			slot7.autoNode.setStrTxt(parseInt(StringUtil.truncate), slot7.autoNode)
		end
	end
end

PdkReportBattleCcsView.onCurIdxChanged = function (slot0)
	slot4 = slot0.model
	slot2 = slot0.model.getReportStepDatasDic(slot0.model)

	if slot0.model.getCurIdx(slot2) == -1 then
		slot5 = slot0._autoIcons

		for slot6, slot7 in pairs(slot4) do
			slot11 = false

			slot7.setVisible(slot9, slot7)
		end

		slot5 = slot0.beishu.txt_tf
		slot9 = "#plist_pdk_font_bean_2_%s.png"

		slot0.beishu.txt_tf.setHtmlText(slot4, HtmlUtil.createArtNum(slot7, 0))
	elseif slot2 and slot2[slot1] then
		slot5 = slot2[slot1].trustee

		for slot6, slot7 in pairs(slot4) do
			slot11 = slot7 ~= 0

			slot0._autoIcons[slot6].setVisible(slot9, slot0._autoIcons[slot6])
		end

		slot6 = slot0.beishu.txt_tf
		slot10 = "#plist_pdk_font_bean_2_%s.png"

		slot0.beishu.txt_tf.setHtmlText(slot5, HtmlUtil.createArtNum(slot8, slot2[slot1].times[slot0.model._myChairId + 1]))
	end

	slot5 = slot0

	slot0.updatePlayerFigure(slot4)
end

PdkReportBattleCcsView.updatePlayerFigure = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getCurIdx(slot2)
	slot2 = table.nums
	slot6 = slot0.model
	slot4 = slot0.model.getReportStepDatasDic(slot5) or {}

	if slot2(slot3) <= slot1 then
		slot5 = PDK_VIEW_CHAIRID_ME

		if slot0.controller.isReportWinner(slot3, slot0.controller) then
			slot5 = "effect/WINPOINT.mp3"

			slot0.controller.playGameEffect(slot3, slot0.controller)
		else
			slot5 = "effect/LOSEPOINT.mp3"

			slot0.controller.playGameEffect(slot3, slot0.controller)
		end

		for slot5 = PDK_VIEW_CHAIRID_ME, PDK_VIEW_CHAIRID_LEFT, 1 do
			slot9 = slot5

			if slot0.controller.isReportWinner(slot7, slot0.controller) then
				slot11 = true

				slot0._spineHead[slot5].setAnimation(slot7, slot0._spineHead[slot5], 0, "win")
			else
				slot11 = true

				slot0._spineHead[slot5].setAnimation(slot7, slot0._spineHead[slot5], 0, "lose")
			end
		end
	else
		slot4 = slot0.controller

		if slot0.controller.curIdxInBattle(slot3) then
			slot2 = slot0.model.getReportStepDatasDic(slot3)[slot1]
			slot5 = slot0.model

			if slot0.model.getStartReplay(slot0.model) then
				slot5 = slot2.outcard

				if table.nums(slot4) > 0 then
					slot9 = false

					slot0._spineHead[slot0.model._chairIdDic[slot2.chairid]].setAnimation(slot5, slot0._spineHead[slot0.model._chairIdDic[slot2.chairid]], 0, "attack")

					slot9 = true

					slot0._spineHead[slot0.model._chairIdDic[slot2.chairid]].addAnimation(slot5, slot0._spineHead[slot0.model._chairIdDic[slot2.chairid]], 0, "idle")
				end
			else
				for slot6 = PDK_VIEW_CHAIRID_ME, PDK_VIEW_CHAIRID_LEFT, 1 do
					slot12 = false

					slot0._spineHead[slot6].setAnimation(slot8, slot0._spineHead[slot6], 0, "idle")
				end
			end
		end
	end
end

PdkReportBattleCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnMenu1 or slot1 == slot0.btnMenu2 then
		slot5 = slot0.controller

		slot0.controller.onMenuBtnClick(slot4)
	elseif slot1 == slot0.btnChat then
		slot5 = slot0.controller

		slot0.controller.onBtnChatClick(slot4)
	elseif slot1 == slot0.btnMenu.frame.btnBack then
		slot5 = slot0.controller

		slot0.controller.try2ExitReportBattle(slot4)
	elseif slot1 == slot0.btnMenu.frame.btnLast then
		slot6 = -1

		slot0.controller.addCurIdx(slot4, slot0.controller)

		slot7 = true

		slot0.model.setIsShowingReportMenu(slot4, slot0.model, true)
	elseif slot1 == slot0.btnMenu.frame.btnPlay then
		slot6 = true

		slot0.model.setStartReplay(slot4, slot0.model)

		slot7 = true

		slot0.model.setIsShowingReportMenu(slot4, slot0.model, true)
	elseif slot1 == slot0.btnMenu.frame.btnStop then
		slot6 = false

		slot0.model.setStartReplay(slot4, slot0.model)

		slot7 = true

		slot0.model.setIsShowingReportMenu(slot4, slot0.model, true)
	elseif slot1 == slot0.btnMenu.frame.btnNext then
		slot6 = 1

		slot0.controller.addCurIdx(slot4, slot0.controller)

		slot7 = true

		slot0.model.setIsShowingReportMenu(slot4, slot0.model, true)
	elseif slot1 == slot0.btnMenu then
		slot8 = slot0.model
		slot6 = not slot0.model.getIsShowingReportMenu(slot7)

		slot0.model.setIsShowingReportMenu(slot4, slot0.model)
	elseif slot1 == slot0.btnReport then
		slot6 = true

		slot0.model.setIsShowingReportJuBao(slot4, slot0.model)
	end
end

return
