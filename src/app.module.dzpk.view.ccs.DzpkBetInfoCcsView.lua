slot2 = "DzpkBetInfoCcsView"
DzpkBetInfoCcsView = class(slot1)

DzpkBetInfoCcsView.onCreationComplete = function (slot0)
	slot0._spRes = {
		"common/texasHoldem_jesson_tip.png",
		nil,
		"common/Ysz_jetton_1.png",
		nil,
		"common/Ysz_jetton_2.png",
		nil,
		nil,
		"common/Ysz_jetton_3.png",
		nil,
		"common/Ysz_jetton_4.png",
		[255.0] = "common/Ysz_Battle_XPcm.png"
	}
	slot5 = 184
	slot5 = 186
	slot5 = 314
	slot5 = 555
	slot5 = 575
	slot5 = 316
	slot0._startPos = {
		cc.p(slot3, 738),
		cc.p(slot3, 398),
		cc.p(slot3, 122),
		cc.p(slot3, 215),
		cc.p(slot3, 1122),
		cc.p(slot3, 1210)
	}
	slot0.showSidePot = {}
	slot0.delSidePotList = {}
	slot3 = slot0

	slot0.init(cc.p(slot3, 1210))
end

DzpkBetInfoCcsView.init = function (slot0)
	slot1 = nil
	slot2 = 20
	slot5 = slot0["b" .. 1]
	slot0.startX = (600 - slot0["b" .. 1].getContentSize(1).width) / 2 + 400
	slot5 = slot0["info" .. 1].Ysz_Battle_dk4
	slot0.infobgWidth = slot0["info" .. 1].Ysz_Battle_dk4.getContentSize(1).width
	slot5 = slot0["info" .. 1].Ysz_Battle_dk4
	slot0.infobgHeight = slot0["info" .. 1].Ysz_Battle_dk4.getContentSize(1).height
	slot0.offsetWidth = 32
	slot0.roomName = ""
	slot5 = slot0

	slot0.register(1)

	slot5 = slot0

	slot0.reset(1)

	slot5 = slot0

	slot0.onChangeZXZ(1)

	slot7 = slot0

	slot0.model.gameModelChangedSignal.add(1, slot0.model.gameModelChangedSignal, slot0.onChangeGameModel)
end

DzpkBetInfoCcsView.onChangeGameModel = function (slot0)
	slot3 = slot0.model

	if slot0.model.getGameModel(slot2) == GAMEMODEL_FREE then
		slot4 = slot0.txtDiChi
		slot7 = 8633006

		slot0.txtDiChi.setTextColor(slot3, DisplayUtil.rgb2ccc3(slot6))

		slot4 = slot0.txtRoomInfo
		slot7 = 8633006

		slot0.txtRoomInfo.setTextColor(slot3, DisplayUtil.rgb2ccc3(slot6))
	elseif slot1 == GAMEMODEL_COMPETITION then
		slot4 = slot0.txtDiChi
		slot7 = 8633006

		slot0.txtDiChi.setTextColor(slot3, DisplayUtil.rgb2ccc3(slot6))

		slot4 = slot0.txtRoomInfo
		slot7 = 8633006

		slot0.txtRoomInfo.setTextColor(slot3, DisplayUtil.rgb2ccc3(slot6))
	end
end

DzpkBetInfoCcsView.register = function (slot0)
	slot5 = slot0

	slot0.model.smallRaiseChangedSignal.add(slot2, slot0.model.smallRaiseChangedSignal, slot0.onChangeSX)

	slot5 = slot0

	slot0.model.gamePoolChangedSignal.add(slot2, slot0.model.gamePoolChangedSignal, slot0.onChangeZXZ)

	slot5 = slot0

	slot0.model.lAnteBXCChangedSignal.add(slot2, slot0.model.lAnteBXCChangedSignal, slot0.onChangeSX)

	slot5 = slot0

	slot0.model.isEndShowPukeChangedSignal.add(slot2, slot0.model.isEndShowPukeChangedSignal, slot0.onFinishEndPukeShow)

	slot5 = slot0

	slot0.model.isDeletePotChangedSignal.add(slot2, slot0.model.isDeletePotChangedSignal, slot0.onDeletePot)

	slot5 = slot0

	slot0.model.updatePlayer2SideChangedSignal.add(slot2, slot0.model.updatePlayer2SideChangedSignal, slot0.updatePlayer2Side)

	slot6 = slot0.updateProgress
	slot6 = "DzpkBetInfoCcsView:_effectTimer"
	slot0._effectTimer = TimerBase.new(slot2, handler(slot0.updatePlayer2Side, slot0), 1000, 3)
	slot0._effectTimer.autoDispose = false
	slot3 = slot0._effectTimer

	slot0._effectTimer.reset(false)
end

DzpkBetInfoCcsView.updatePlayer2Side = function (slot0)
	slot5 = slot0.model

	for slot4, slot5 in pairs(slot0.model.getUpdatePlayer2Side(slot4)) do
		if slot5 ~= nil and #slot5 > 0 then
			for slot9 = 1, #slot5, 1 do
				slot13 = slot4

				slot0["b" .. slot5[slot9]].pushPlayer(slot5[slot9], slot0["b" .. slot5[slot9]])
			end
		end
	end
end

DzpkBetInfoCcsView.showScore = function (slot0)
	slot1 = slot0.model.getLTablePlayerScore(slot2)
	slot4 = slot0.model
	slot2 = slot0.model.getCbPlayStatus(slot0.model)

	for slot6 = 1, Dzpk_GAME_PLAYER, 1 do
		slot7 = slot1[slot6]

		if slot0["info" .. slot6] ~= nil and slot7 ~= nil and slot7 > 0 and slot2[slot6] ~= Dzpk_ACTION_INVALID and slot2[slot6] ~= Dzpk_ACTION_FOLD then
			slot13 = slot7

			slot0.setAddSore(slot10, slot0, slot8)
		end
	end
end

DzpkBetInfoCcsView.playBetByChairId = function (slot0, slot1, slot2)
	if slot2 > 0 then
		slot6 = slot1

		if not slot0.controller.isChair(slot4, slot0.controller) then
			return
		end
	end

	slot6 = true

	slot0.model.setIsMovingJetton(slot4, slot0.model)

	slot13 = slot0["info" .. slot1].Ysz_Battle_cm4

	function slot10()
		slot0 = slot0.model.getLTablePlayerScore(slot1)
		slot5 = slot0[slot1]

		slot0.setAddSore(slot0.model, slot0, slot0["info" .. slot0.setAddSore])

		slot4 = false

		slot0.model.setIsMovingJetton(slot0.model, slot0.model)
	end

	slot0.doAction(slot0.model, slot0, 5, slot0._startPos[slot1], cc.p(slot0["info" .. slot1].Ysz_Battle_cm4.getPosition(slot1)))
end

DzpkBetInfoCcsView.playBetToSidePot = function (slot0, slot1)
	slot0.handleSidePot = false
	slot2 = 1.2
	slot3 = 3

	if slot0["b" .. #slot0.showSidePot + 1] ~= nil then
		slot6 = slot0["b" .. #slot0.showSidePot + 1]
		slot7 = slot0["b" .. #slot0.showSidePot + 1].icon
		slot4 = slot0["b" .. #slot0.showSidePot + 1].getPositionX(#slot0.showSidePot + 1) + slot0["b" .. #slot0.showSidePot + 1].icon.getPositionX(#slot0.showSidePot + 1)
		slot7 = slot0["b" .. #slot0.showSidePot + 1]
		slot8 = slot0["b" .. #slot0.showSidePot + 1].icon
		slot5 = slot0["b" .. #slot0.showSidePot + 1].getPositionY(#slot0.showSidePot + 1) + slot0["b" .. #slot0.showSidePot + 1].icon.getPositionY(#slot0.showSidePot + 1) + slot0["b" .. #slot0.showSidePot + 1].icon.getContentSize(#slot0.showSidePot + 1).height / 2

		function slot6()
			slot9 = slot1 / slot2

			function slot10()
				if slot0 ~= nil then
					slot0()
				end
			end

			slot8 = nil

			slot0.runAction(slot1, cc.Sequence.create(slot4, cc.Sequence, cc.DelayTime.create(slot7, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
		end

		slot0.controller.playGameEffect(slot0["b" .. #slot0.showSidePot + 1].icon, slot0.controller)

		slot11 = slot0.model

		for slot10, slot11 in pairs(slot0.model.getTableChair(Dzpk_SOUND_HECHIP)) do
			if slot11 ~= nil and slot0["info" .. slot10].score > 0 then
				slot3 = 1
				slot20 = slot0["info" .. slot10].Ysz_Battle_cm4
				slot20 = slot5

				function slot18()
					if slot0["info" .. ] ~= nil then
						slot3 = slot0

						if slot0.isVisible(slot2) then
							slot0.score = 0
							slot5 = 0

							slot0.setAddSore(slot2, slot0, slot0)
						end
					end

					slot3 = slot0

					slot0.setSidePot(slot2)
				end

				slot0.doAction(slot13, slot0, 5, cc.p(slot0["info" .. slot10].Ysz_Battle_cm4.getPosition(slot10)), cc.p(slot0["info" .. slot10].Ysz_Battle_cm4.getPosition, slot4))
			end
		end

		slot6()
	elseif slot1 ~= nil then
		slot1()
	end
end

DzpkBetInfoCcsView.setSidePot = function (slot0)
	if slot0.handleSidePot == true then
		return
	end

	slot0.handleSidePot = true
	slot3 = slot0.model

	if slot0.model.getDeskSidePotData(slot2) == nil then
		return
	end

	if slot0.showSidePot ~= nil and #slot0.showSidePot > 0 and #slot1 == #slot0.showSidePot then
		for slot5 = 1, #slot1, 1 do
			if slot0["b" .. slot5] ~= nil then
				slot9 = slot1[slot5]

				slot0["b" .. slot5].setData(slot5, slot0["b" .. slot5])
			end
		end

		return
	end

	slot2 = {}

	for slot6 = 1, #slot1, 1 do
		slot10 = slot1[slot6]

		slot0["b" .. slot6].setData(slot6, slot0["b" .. slot6])

		slot10 = false

		slot0["b" .. slot6].setVisible(slot6, slot0["b" .. slot6])

		slot10 = slot0["b" .. slot6]

		table.insert(slot6, slot2)
	end

	slot0.showSidePot = slot2
	slot3 = nil
	slot8 = slot0["b" .. 1]
	slot3 = (600 - (#slot2 * slot0["b" .. 1].getContentSize(1).width + (#slot2 - 1) * 20)) / 2 + 400

	for slot8 = 1, #slot2, 1 do
		slot11 = slot0["b" .. slot8]
		slot16 = slot0["b" .. 1]
		slot14 = slot3 + 0 * (slot0["b" .. 1].getContentSize(1).width + slot4)
		slot17 = slot0["b" .. 1]

		slot0["b" .. slot8].setPosition(slot8, cc.p(slot13, slot0["b" .. 1].getPositionY(1)))

		slot12 = true

		slot0["b" .. slot8].setVisible(slot8, slot0["b" .. slot8])
	end

	for slot8 = 1, #slot2, 1 do
		slot11 = slot0["b" .. slot8]
		slot15 = 0.2
		slot21 = slot0["b" .. 1]
		slot18 = slot3 + (slot8 - 1) * (slot0["b" .. 1].getContentSize(1).width + slot4)
		slot21 = slot0["b" .. 1]

		slot0["b" .. slot8].runAction(slot8, cc.MoveTo.create(slot13, cc.MoveTo, cc.p(slot17, slot0["b" .. 1].getPositionY(1))))
	end
end

DzpkBetInfoCcsView.onDeletePot = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getIsDeletePot(slot2) then
		return
	end

	if slot0.showSidePot ~= nil then
		slot3 = slot0.showSidePot

		for slot4, slot5 in pairs(slot2) do
			if slot5 ~= nil then
				slot8 = slot5

				if slot5.isPoor(slot7) then
					slot8 = slot5

					slot5.reset(slot7)

					slot0.showSidePot[slot4] = nil
				end
			end
		end
	end

	slot6 = true

	slot0.model.setIsHandleEndPuke(slot2, slot0.model, true, true)

	slot3 = slot0.model.isHandleEndPukeChangedSignal

	slot0.model.isHandleEndPukeChangedSignal.emit(slot2)
end

DzpkBetInfoCcsView.onFinishEndPukeShow = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getIsEndShowPuke(slot2) then
		return
	end

	slot3 = "============DzpkBetInfoCcsView:onFinishEndPukeShow==============="

	print(slot2)

	slot3 = slot0.model

	if #slot0.model.getEndWinnerTable(slot2) > 0 then
		slot4 = slot0.model
		slot2 = slot0.model.getWGameEndData(slot3)

		for slot6 = 1, #slot1[1], 1 do
			print(slot8)

			slot13 = slot6

			slot0.playGameEndJetton("=====开始播放筹码动画=======", slot0, slot1[1][slot6], slot2.lUserWinScore[slot1[1][slot6]])
		end

		slot6 = 1

		table.remove(slot4, slot1)

		slot6 = slot1

		slot0.model.setEndWinnerTable(slot4, slot0.model)
	end

	slot4 = "=========DzpkBetInfoCcsView:onFinishEndPukeShow============" .. #slot1

	print(slot3)

	if #slot1 == 0 then
		slot4 = "=========DzpkBetInfoCcsView:onFinishEndPukeShow==进来=========="

		print(slot3)

		slot4 = slot0
		slot11 = 2

		function slot12()
			slot2 = slot0.model

			if slot0.model.getBankContentTxt(slot1) ~= nil then
				slot3 = nil

				slot0.model.setWGameEndData(slot1, slot0.model)

				slot3 = slot0.model.getBankContentTxt(slot4)
				slot6 = slot0.model

				slot0.model.setWGameEndData.controller.gotoBankOrChargeA(slot1, slot0.model.setWGameEndData.controller, slot0.model.getBankNeedReqStandUp(slot0.model))
			end

			slot4 = true

			slot0.model.setGameState(slot1, slot0.model, GAME_STATUS_FREE)
		end

		slot10 = nil

		slot0.runAction(slot3, cc.Sequence.create(slot6, cc.Sequence, cc.DelayTime.create(slot9, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
	end
end

DzpkBetInfoCcsView.playGameEndJetton = function (slot0, slot1, slot2, slot3)
	slot4 = nil

	function moveFinish()
		if slot0 == nil or slot0 <= 0 then
			slot2 = slot1
			slot3 = slot1:getParent()

			slot1.getParent().updateWinerScore(slot1, slot1.getParent())

			slot5 = true

			slot1.model.setIsDeletePot(slot1, slot1.model, true, true)

			slot2 = slot1.model.isDeletePotChangedSignal

			slot1.model.isDeletePotChangedSignal.emit(slot1)

			return
		end

		slot3 = slot1.model

		if slot0 < 100 * slot1.model.getBigRaise(slot2) then
			slot3 = Dzpk_SOUND_YING

			slot1.controller.playGameEffect(slot1, slot1.controller)
		else
			slot3 = Dzpk_SOUND_BIGYING

			slot1.controller.playGameEffect(slot1, slot1.controller)
		end

		slot3 = slot1.model

		slot1.model.setLastShowCardPlayer(slot1, slot1.model)

		slot0 = slot1._startPos[slot2].x

		if slot1._startPos[].y + 100 == 2 or slot2 == 3 or slot2 == 4 then
			slot10 = TextField.H_CENTER
			slot5 = TextField.new(slot4, nil, 22, "#00ff00", 300, nil)
			slot9 = 0.5

			TextField.new(slot4, nil, 22, "#00ff00", 300, nil).setAnchorPoint(slot4, cc.p("#00ff00", 0.5))

			slot0 = slot1._startPos[slot2].x - 150
			slot1 = slot1._startPos[slot2].y
		elseif slot2 == 6 or slot2 == 5 then
			slot10 = TextField.H_CENTER
			slot5 = TextField.new(slot4, nil, 22, "#00ff00", 300, nil)
			slot9 = 0.5

			TextField.new(slot4, nil, 22, "#00ff00", 300, nil).setAnchorPoint(slot4, cc.p("#00ff00", 0.5))

			slot0 = slot1._startPos[slot2].x - 150
			slot1 = slot1._startPos[slot2].y
		else
			slot10 = TextField.H_CENTER
			slot5 = TextField.new(slot4, nil, 22, "#00ff00", 300, nil)
			slot9 = 0.5

			TextField.new(slot4, nil, 22, "#00ff00", 300, nil).setAnchorPoint(slot4, cc.p("#00ff00", 0.5))

			slot0 = slot1._startPos[slot2].x - 150
			slot1 = slot1._startPos[slot2].y
		end

		slot6 = slot3
		slot10 = "#dzpk_js_%s.png"

		slot3.setHtmlText(slot5, HtmlUtil.createArtNumDotSignStringWY(slot8, slot0))

		slot4, slot5, slot6 = nil
		slot9 = slot1.model

		if slot1.model.getWGameEndData(slot8) == nil then
			slot11 = "dzpk_jiafenlizi/dzpk_jiafenlizi.json"
			slot11 = "dzpk_jiafenlizi/dzpk_jiafenlizi.atlas"
			slot10 = sp.SkeletonAnimation.create(slot9, sp.SkeletonAnimation, slot4)
			slot14 = slot1._startPos[slot2].y

			sp.SkeletonAnimation.create(slot9, sp.SkeletonAnimation, slot4).setPosition(slot9, cc.p(slot1.controller.getSpinePath(slot9, slot1.controller), slot1._startPos[slot2].x))
		elseif slot7.cbCardData[slot2] == nil then
			slot11 = "dzpk_jiafenlizi/dzpk_jiafenlizi.json"
			slot11 = "dzpk_jiafenlizi/dzpk_jiafenlizi.atlas"
			slot10 = sp.SkeletonAnimation.create(slot9, sp.SkeletonAnimation, slot4)
			slot14 = slot1._startPos[slot2].y

			sp.SkeletonAnimation.create(slot9, sp.SkeletonAnimation, slot4).setPosition(slot9, cc.p(slot1.controller.getSpinePath(slot9, slot1.controller), slot1._startPos[slot2].x))
		else
			slot11 = "dzpk_dapaijiafenlizi/dzpk_dapaijiafenlizi.json"
			slot11 = "dzpk_dapaijiafenlizi/dzpk_dapaijiafenlizi.atlas"
			slot12 = slot1.controller.getSpinePath(slot9, slot1.controller)
			slot6 = sp.SkeletonAnimation.create(slot9, sp.SkeletonAnimation, slot1.controller.getSpinePath(slot9, slot1.controller))
			slot10 = slot1.model

			if slot1.model.getGameEndCardType(slot9) == 0 then
				slot11 = 0.9

				slot6.setScale(slot9, slot6)

				slot10 = slot6
				slot14 = slot1._startPos[slot2].y + 14

				slot6.setPosition(slot9, cc.p(slot12, slot1._startPos[slot2].x + 2))
			else
				slot10 = slot6
				slot14 = slot1._startPos[slot2].y + 12

				slot6.setPosition(slot9, cc.p(slot12, slot1._startPos[slot2].x))
			end
		end

		if slot1.JettonLayer ~= nil then
			slot11 = slot6

			slot1.JettonLayer.addChild(slot9, slot1.JettonLayer)

			slot11 = slot3

			slot1.JettonLayer.addChild(slot9, slot1.JettonLayer)
		else
			slot11 = slot6

			slot1.addChild(slot9, slot1)

			slot11 = slot3

			slot1.addChild(slot9, slot1)
		end

		slot13 = false

		slot6.setAnimation(slot9, slot6, 0, "animation")

		slot10 = slot3
		slot14 = slot1

		slot3.setPosition(slot9, cc.p("animation", slot0))

		slot10 = slot3
		slot17 = 0.2
		slot21 = slot2

		function slot18()
			slot2 = slot0
			slot3 = slot1

			slot0.getParent(slot1).updateWinerScore(slot1, slot0.getParent(slot1))

			slot5 = true

			slot0.getParent(slot1).updateWinerScore.model.setIsDeletePot(slot1, slot0.getParent(slot1).updateWinerScore.model, true, true)

			slot2 = slot0.getParent(slot1).updateWinerScore.model.setIsDeletePot.model.isDeletePotChangedSignal

			slot0.getParent(slot1).updateWinerScore.model.setIsDeletePot.model.isDeletePotChangedSignal.emit(slot1)
		end

		slot19 = 1

		function slot20()
			slot2 = slot0

			slot0.removeSelf(slot1)
		end

		slot18 = nil

		slot3.runAction(slot9, cc.Sequence.create("animation", cc.Sequence, cc.MoveTo.create(slot15, cc.MoveTo, cc.p(slot19, slot3)), cc.CallFunc.create(cc.MoveTo, cc.CallFunc), cc.DelayTime.create(cc.CallFunc, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
	end

	slot7 = slot0.model

	if slot0.model.getUpdatePlayer2Side(slot6)[slot1] ~= nil and #slot5 > 0 then
		for slot9 = 1, #slot5, 1 do
			slot14 = slot0["b" .. slot5[slot9]].icon
			slot11 = slot0["b" .. slot5[slot9]].getPositionX(slot12) + slot0["b" .. slot5[slot9]].icon.getPositionX(slot10)
			slot15 = slot0["b" .. slot5[slot9]].icon
			slot15 = slot0["b" .. slot5[slot9]].icon
			slot12 = slot0["b" .. slot5[slot9]].getPositionY(slot10) + slot0["b" .. slot5[slot9]].icon.getPositionY(slot0["b" .. slot5[slot9]]) + slot0["b" .. slot5[slot9]].icon.getContentSize(slot0["b" .. slot5[slot9]]).height / 2
			slot16 = slot1

			slot0["b" .. slot5[slot9]]:popPlayer(slot0["b" .. slot5[slot9]])

			if slot9 == #slot5 then
				slot20 = slot12
				slot19 = moveFinish

				slot0.doAction(slot14, slot0, 5, cc.p(slot18, slot11), slot0._startPos[slot1])
			else
				slot20 = slot12
				slot19 = nil

				slot0.doAction(slot14, slot0, 5, cc.p(slot18, slot11), slot0._startPos[slot1])
			end
		end
	end

	slot8 = slot0.model
	slot6 = slot0.model.getCbPlayStatus(slot7)

	if slot1 == 1 and slot6[slot1] ~= nil and slot6[slot1] ~= 0 and slot6[slot1] ~= 4 and slot2 ~= nil and slot2 > 0 then
		slot12 = true

		slot0.model.setIsShowEffectWin(slot8, slot0.model, true, true)

		slot9 = slot0.model.isShowEffectWinChangedSignal

		slot0.model.isShowEffectWinChangedSignal.emit(slot8)
	end
end

DzpkBetInfoCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnMenu1 or slot1 == slot0.btnMenu2 then
		slot5 = slot0.controller

		slot0.controller.onMenuBtnClick(slot4)
	end
end

DzpkBetInfoCcsView.onChangeSX = function (slot0)
	slot1 = ""
	slot4 = slot0.model

	if slot0.model.getSmallRaise(slot3) ~= 0 then
		slot4 = slot0.model

		if slot0.model.getBigRaise(slot3) == 0 then
			slot5 = slot0.roomName .. " 小/大盲注:0/0"

			slot0.txtRoomInfo.setString(slot3, slot0.txtRoomInfo)

			return
		end
	end

	slot4 = slot0.model

	if slot0.model.getGameModel(slot3) == GAMEMODEL_COMPETITION then
		slot2 = slot0.model.getSmallRaise(slot3)
		slot4 = slot0.model.getBigRaise(slot0.model)
		slot7 = slot0.model
		slot5 = slot0.model.getOldBigRaise(slot0.model)

		if slot0.model.getOldSmallRaise(slot0.model) and slot5 and (slot3 < slot2 or slot5 < slot4) then
			slot8 = tweenMsgMgr
			slot13 = slot4

			tweenMsgMgr.showRedMsg(slot7, string.format(slot10, "本轮盲注已上涨为：小盲%d／%d大盲", slot2))
		end

		slot9 = slot2

		slot0.model.setOldSmallRaise(slot7, slot0.model)

		slot9 = slot4

		slot0.model.setOldBigRaise(slot7, slot0.model)
	end

	slot8 = slot0.model
	slot8 = true
	slot10 = slot0.model
	slot10 = true
	slot1 = slot0.roomName .. " 小/大盲注:" .. MathUtil.cookNumWithHansUnits(slot5, slot0.model.getSmallRaise(slot7), 0) .. "/" .. MathUtil.cookNumWithHansUnits(0, slot0.model.getBigRaise(slot9), 1)
	slot4 = slot0.model

	if slot0.model.getGameModel(" 小/大盲注:") == GAMEMODEL_COMPETITION then
		slot4 = slot0.model

		if slot0.model.getUpdateMatchInfo(slot3) ~= nil then
			slot6 = slot0.model
			slot1 = slot1 .. " 前注:" .. slot0.model.getUpdateMatchInfo(slot5).lAnte
		end
	else
		slot4 = slot0.model

		if slot0.model.getGameModel(slot3) == GAMEMODEL_FREE then
			slot4 = gameMgr

			if gameMgr.getCurRoomVo(slot3) and slot2.wSortID % 2 == 1 then
				slot7 = slot0.model
				slot1 = slot1 .. " 前注:" .. slot0.model.getLAnteBXC(slot6)
			end
		end
	end

	slot5 = slot1

	slot0.txtRoomInfo.setString(slot3, slot0.txtRoomInfo)
end

DzpkBetInfoCcsView.setRoomName = function (slot0, slot1)
	slot0.roomName = slot1
	slot4 = slot0

	slot0.onChangeSX(slot3)
end

DzpkBetInfoCcsView.onChangeZXZ = function (slot0)
	slot7 = slot0.model
	slot6 = 2
	slot5 = "底池:" .. MathUtil.cookNumWithHansUnits(slot4, slot0.model.getGamePool(slot6))

	slot0.txtDiChi.setString(MathUtil.cookNumWithHansUnits(slot4, slot0.model.getGamePool(slot6)), slot0.txtDiChi)
end

DzpkBetInfoCcsView.doAction = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil or slot2 == nil or slot3 == nil then
		return
	end

	slot5 = 1

	slot6()

	slot9 = slot0
	slot16 = 0.5

	function slot17()
		if slot0 ~= nil then
			slot0()
		end
	end

	slot15 = nil

	slot0.runAction(slot8, cc.Sequence.create(slot11, cc.Sequence, cc.DelayTime.create(slot14, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
end

DzpkBetInfoCcsView.setAddSore = function (slot0, slot1, slot2)
	if slot2 ~= nil and slot2 > 0 then
		slot6 = true

		slot1.setVisible(slot4, slot1)
	else
		slot6 = false

		slot1.setVisible(slot4, slot1)

		return
	end

	slot1.score = slot2
	slot8, slot4 = slot0.controller.getIScore(slot4, slot0.controller)

	slot1.txtZXZ.setString((slot1.score > 0 and slot1.score) or 0, slot1.txtZXZ)

	slot7 = slot1.Ysz_Battle_dk4
	slot13 = slot1.txtZXZ
	slot11 = slot0.infobgHeight

	slot1.Ysz_Battle_dk4.setContentSize((slot1.score > 0 and slot1.score) or 0, cc.size(slot9, slot0.offsetWidth + slot1.txtZXZ.getContentSize(slot12).width + 12))
end

DzpkBetInfoCcsView.showWait = function (slot0, slot1)
	slot4 = slot0.model

	if slot0.model.getGameState(slot3) ~= Dzpk_GS_WAITING then
		slot5 = true

		slot0.ysz_wait.setVisible(slot3, slot0.ysz_wait)

		slot5 = slot1

		slot0.ysz_wait.setPositionY(slot3, slot0.ysz_wait)
	else
		slot4 = slot0

		slot0.hideWait(slot3)
	end
end

DzpkBetInfoCcsView.hideWait = function (slot0)
	slot4 = false

	slot0.ysz_wait.setVisible(slot2, slot0.ysz_wait)
end

DzpkBetInfoCcsView.countDown = function (slot0, slot1, slot2)
	slot0.num = slot1
	slot0.callback = slot2
	slot5 = slot0

	slot0.updateProgress(slot4)

	slot5 = slot0._effectTimer

	slot0._effectTimer.start(slot4)
end

DzpkBetInfoCcsView.updateProgress = function (slot0)
	if slot0.num > 0 then
		slot4 = "txt/texasHoldem_start_tip.png"
		slot11 = 8
		slot6 = "#dzpk_countDown_%s.png"
		slot6 = HtmlUtil.createImg(slot0.controller, slot0.controller.getUIPath(slot2, slot0.controller), nil, nil, nil, 0, nil, nil) .. HtmlUtil.createArtNumEx(slot0.controller.getUIPath(slot2, slot0.controller), slot0.num)

		slot0.txtTime_tf.setHtmlText(slot0.controller.getUIPath(slot2, slot0.controller), slot0.txtTime_tf)

		slot6 = true

		slot0.txtTime_tf.setVisible(slot0.controller.getUIPath(slot2, slot0.controller), slot0.txtTime_tf)

		slot0.num = slot0.num - 1
	else
		slot3 = slot0._effectTimer

		slot0._effectTimer.reset(slot2)

		slot4 = false

		slot0.txtTime_tf.setVisible(slot2, slot0.txtTime_tf)

		if slot0.callback ~= nil then
			slot0.callback()
		end
	end
end

DzpkBetInfoCcsView.setJettonLayer = function (slot0, slot1)
	slot0.JettonLayer = slot1
end

DzpkBetInfoCcsView.reset = function (slot0)
	slot4 = false

	slot0.ysz_wait.setVisible(slot2, slot0.ysz_wait)

	slot0.handleSidePot = false
	slot0.showSidePot = {}

	for slot4 = 1, 6, 1 do
		slot8 = false

		slot0["info" .. slot4].setVisible(slot4, slot0["info" .. slot4])

		slot0["info" .. slot4].score = 0
	end

	for slot4 = 1, 6, 1 do
		slot8 = false

		slot0["b" .. slot4].setVisible(slot4, slot0["b" .. slot4])

		slot7 = slot0["b" .. slot4]
		slot10 = slot0.startX
		slot13 = slot0["b" .. 1]

		slot0["b" .. slot4].setPosition(slot4, cc.p(slot9, slot0["b" .. 1].getPositionY(1)))
	end

	if slot0.JettonLayer ~= nil then
		slot3 = slot0.JettonLayer

		slot0.JettonLayer.removeAllChildren(slot2)
	end

	slot3 = slot0._effectTimer

	slot0._effectTimer.reset(slot2)

	slot4 = false

	slot0.txtTime_tf.setVisible(slot2, slot0.txtTime_tf)

	slot0.callback = nil
	slot3 = slot0

	slot0.onChangeSX(slot2)
end

DzpkBetInfoCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.gameModelChangedSignal.remove(slot2, slot0.model.gameModelChangedSignal, slot0.onChangeGameModel)
end

return
