slot2 = "DdzStateTipsCcsPane"
DdzStateTipsCcsPane = class(slot1)

DdzStateTipsCcsPane.onCreationComplete = function (slot0)
	slot5 = slot0

	slot0.model.stateViewDicChangedSignal.add(slot2, slot0.model.stateViewDicChangedSignal, slot0.onStateViewDicChanged)

	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getCountDownSignal(slot2).add(slot2, slot0.model.getCountDownSignal(slot2), slot0.onCountDownSignalChanged)

	slot3 = slot0

	if slot0.getName(slot2) == "rightState" then
		slot0._viewId = DDZ_VIEW_CHAIRID_RIGHT
	else
		slot3 = slot0

		if slot0.getName(slot2) == "leftState" then
			slot0._viewId = DDZ_VIEW_CHAIRID_LEFT
		else
			slot3 = slot0

			if slot0.getName(slot2) == "mineState" then
				slot0._viewId = DDZ_VIEW_CHAIRID_ME
			end
		end
	end

	slot4 = slot0._viewId

	slot0.clock.root.setViewId(slot2, slot0.clock.root)

	slot3 = slot0

	slot0.onStateViewDicChanged(slot2)

	slot3 = slot0

	slot0.onCountDownSignalChanged(slot2)
end

DdzStateTipsCcsPane.onStateViewDicChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getRealGameKind(slot2) == GameKind_DDZ_JD then
		slot3 = slot0

		slot0.onStateViewDicChangedJD(slot2)
	else
		slot3 = slot0

		slot0.onStateViewDicChangedBXP(slot2)
	end
end

DdzStateTipsCcsPane.onStateViewDicChangedJD = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getLockViewDic(slot2) or not slot1.stateViewDic or not slot1.stateViewDic[slot0._viewId] then
		slot6 = slot0

		for slot5, slot6 in pairs(slot0.getChildren(slot5)) do
			slot10 = false

			slot6.setVisible(slot8, slot6)
		end

		slot6 = slot0.model.getStateViewDic(slot0.setVisible) ~= nil

		slot0.setVisible(slot0.model, slot0)

		slot5 = slot0

		slot0.updatePos(slot0.model)

		if slot2 then
			slot7 = slot2[slot0._viewId] == "buJia"

			slot0.txtUnAdd.setVisible(slot5, slot0.txtUnAdd)

			slot7 = slot3 == "jiaBei"

			slot0.txtAdd.setVisible(slot5, slot0.txtAdd)

			slot7 = slot3 == "jiao1fen" or slot3 == "jiao2fen" or slot3 == "jiao3fen" or slot3 == "buJiao"

			slot0.txtScore.setVisible(slot5, slot0.txtScore)

			slot7 = slot3 == "ok"

			slot0.txtOk.setVisible(slot5, slot0.txtOk)

			slot7 = slot3 == "buChu"

			slot0.txtBuchu.setVisible(slot5, slot0.txtBuchu)

			if slot3 == "jiao1fen" then
				slot6 = slot0.txtScore
				slot10 = "txt/ddz_txt_1fen.png"

				slot0.txtScore.setTexture(slot5, slot0.controller.getUIPath(slot8, slot0.controller))
			elseif slot3 == "jiao2fen" then
				slot6 = slot0.txtScore
				slot10 = "txt/ddz_txt_2fen.png"

				slot0.txtScore.setTexture(slot5, slot0.controller.getUIPath(slot8, slot0.controller))
			elseif slot3 == "jiao3fen" then
				slot6 = slot0.txtScore
				slot10 = "txt/ddz_txt_3fen.png"

				slot0.txtScore.setTexture(slot5, slot0.controller.getUIPath(slot8, slot0.controller))
			elseif slot3 == "buJiao" then
				slot6 = slot0.txtScore
				slot10 = "txt/ddz_txt_bujiao.png"

				slot0.txtScore.setTexture(slot5, slot0.controller.getUIPath(slot8, slot0.controller))
			end

			if slot0._viewId == DDZ_VIEW_CHAIRID_ME then
				if slot3 == "openMenu" or slot3 == "addTimesMenu" then
					slot6 = slot0.clock
					slot9 = slot0.openPos

					slot0.clock.setPosition(slot5, slot0.openPos.getPosition(slot8))

					slot7 = true

					slot0.clock.setVisible(slot5, slot0.clock)
				elseif slot3 == "callMenu1" or slot3 == "callMenu2" or slot3 == "callMenu0" then
					slot6 = slot0.clock
					slot9 = slot0.callPos

					slot0.clock.setPosition(slot5, slot0.callPos.getPosition(slot8))

					slot7 = true

					slot0.clock.setVisible(slot5, slot0.clock)
				elseif slot3 == "normalMenu" or slot3 == "onlyOutMenu" or slot3 == "onlyPassMenu" then
					slot6 = slot0.clock
					slot9 = slot0.normalPos

					slot0.clock.setPosition(slot5, slot0.normalPos.getPosition(slot8))

					slot7 = true

					slot0.clock.setVisible(slot5, slot0.clock)
				end
			else
				slot7 = slot3 == "turnView"

				slot0.clock.setVisible(slot5, slot0.clock)
			end
		end
	end
end

DdzStateTipsCcsPane.onStateViewDicChangedBXP = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getLockViewDic(slot2) or not slot1.stateViewDic or not slot1.stateViewDic[slot0._viewId] then
		slot6 = slot0

		for slot5, slot6 in pairs(slot0.getChildren(slot5)) do
			slot10 = false

			slot6.setVisible(slot8, slot6)
		end

		slot6 = slot0.model.getStateViewDic(slot0.setVisible) ~= nil

		slot0.setVisible(slot0.model, slot0)

		slot5 = slot0

		slot0.updatePos(slot0.model)

		if slot2 then
			slot7 = slot2[slot0._viewId] == "buJia"

			slot0.txtUnAdd.setVisible(slot5, slot0.txtUnAdd)

			slot7 = slot3 == "jiaBei"

			slot0.txtAdd.setVisible(slot5, slot0.txtAdd)

			slot7 = slot3 == "jiaoDiZhu"

			slot0.txtCall.setVisible(slot5, slot0.txtCall)

			slot7 = slot3 == "buJiao"

			slot0.txtUnCall.setVisible(slot5, slot0.txtUnCall)

			slot7 = slot3 == "qiangDiZhu"

			slot0.txtRob.setVisible(slot5, slot0.txtRob)

			slot7 = slot3 == "buQiang"

			slot0.txtUnRob.setVisible(slot5, slot0.txtUnRob)

			slot7 = slot3 == "ok"

			slot0.txtOk.setVisible(slot5, slot0.txtOk)

			slot7 = slot3 == "buChu"

			slot0.txtBuchu.setVisible(slot5, slot0.txtBuchu)

			if slot0._viewId == DDZ_VIEW_CHAIRID_ME then
				if slot3 == "openMenu" or slot3 == "callMenu" or slot3 == "robMenu" or slot3 == "addTimesMenu" then
					slot6 = slot0.clock
					slot9 = slot0.openPos

					slot0.clock.setPosition(slot5, slot0.openPos.getPosition(slot8))

					slot7 = true

					slot0.clock.setVisible(slot5, slot0.clock)
				elseif slot3 == "normalMenu" or slot3 == "onlyOutMenu" or slot3 == "onlyPassMenu" then
					slot6 = slot0.clock
					slot9 = slot0.normalPos

					slot0.clock.setPosition(slot5, slot0.normalPos.getPosition(slot8))

					slot7 = true

					slot0.clock.setVisible(slot5, slot0.clock)
				end
			else
				slot7 = slot3 == "turnView"

				slot0.clock.setVisible(slot5, slot0.clock)
			end
		end
	end
end

DdzStateTipsCcsPane.onCountDownSignalChanged = function (slot0)
	slot3 = slot0.model

	if (not slot0.model.getLockViewDic(slot2) or not slot1.countDown) and slot0.clock then
		function slot2()
			slot0 = slot0.controller.getCurClockTime(slot1)
			slot6 = true

			slot0.clock.root.progress.setProgressPlaying(slot0.controller, slot0.clock.root.progress, true, slot0)

			slot6 = "#plist_ddz_font_clock_yellow_1_%s.png"

			slot0.clock.root.start(slot0.controller, slot0.clock.root, slot0, nil)
		end

		slot5 = slot0.model

		if slot0.model.getGameState(slot4) == DDZ_GAMESTATE_ADDTIMES then
			slot2()
		else
			slot6 = slot0.model

			if slot0.model.getCurrentUser(slot5) == slot0._viewId then
				slot2()
			end
		end
	end
end

DdzStateTipsCcsPane.updatePos = function (slot0)
	slot3 = slot0.model

	if slot0.model.getFigureState(slot2) == "normal" or slot1 == "result" then
		if slot0._viewId == DDZ_VIEW_CHAIRID_LEFT then
			slot6 = 439

			slot0.setPosition(slot3, slot0, 318)
		elseif slot0._viewId == DDZ_VIEW_CHAIRID_RIGHT then
			slot6 = 439

			slot0.setPosition(slot3, slot0, 855)
		end
	elseif slot0._viewId == DDZ_VIEW_CHAIRID_LEFT then
		slot6 = 513

		slot0.setPosition(slot3, slot0, 347)
	elseif slot0._viewId == DDZ_VIEW_CHAIRID_RIGHT then
		slot6 = 513

		slot0.setPosition(slot3, slot0, 845)
	end
end

DdzStateTipsCcsPane.destroy = function (slot0)
	slot5 = slot0

	slot0.model.stateViewDicChangedSignal.remove(slot2, slot0.model.stateViewDicChangedSignal, slot0.onStateViewDicChanged)

	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getCountDownSignal(slot2).remove(slot2, slot0.model.getCountDownSignal(slot2), slot0.onCountDownSignalChanged)

	slot3 = slot0.clock.root

	slot0.clock.root.destroy(slot2)
end

return
