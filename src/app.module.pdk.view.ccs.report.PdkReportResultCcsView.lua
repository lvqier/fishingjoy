slot2 = "PdkReportResultCcsView"
PdkReportResultCcsView = class(slot1)

PdkReportResultCcsView.onCreationComplete = function (slot0)
	slot0.view = (slot0.winView ~= nil and slot0.winView) or slot0.loseView
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, nil)

	slot0._isWin = slot0.winView ~= nil
	slot0._bgAlpha = 0.5
	slot5 = slot0

	slot0.model.reportResultChangedSignal.add(slot2, slot0.model.reportResultChangedSignal, slot0.onReportResultChanged)

	slot5 = slot0

	slot0.model.curShowingViewTypeChangedSignal.add(slot2, slot0.model.curShowingViewTypeChangedSignal, slot0.onCurShowingViewTypeChanged)

	slot3 = slot0

	slot0.onReportResultChanged(slot2)

	slot3 = slot0

	slot0.onCurShowingViewTypeChanged(slot2)
end

PdkReportResultCcsView.onCurShowingViewTypeChanged = function (slot0)
	slot5 = not (slot0.model.getCurShowingViewType(slot2) == VIEW_TYPE_BATTLE_REPORT)

	slot0.view.btnReport.setVisible(slot0.model, slot0.view.btnReport)

	slot5 = not (slot0.model.getCurShowingViewType(slot2) == VIEW_TYPE_BATTLE_REPORT)

	slot0.view.btnClose.setVisible(slot0.model, slot0.view.btnClose)
end

PdkReportResultCcsView.onReportResultChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getReportResult(slot2) then
		slot1 = slot0.model.getReportResult(slot2)
		slot5 = PDK_VIEW_CHAIRID_ME
		slot6 = PDK_VIEW_CHAIRID_ME
		slot3 = slot0.controller.isReportDizhu(slot0.controller, slot0.controller)
		slot7 = slot0._spineCharacter

		spPoolMgr.put(slot0.controller, spPoolMgr)

		slot7 = slot0.controller.getReportAnimName(slot0.model, slot0.controller) .. "_l"
		slot0._spineCharacter = slot0.controller.createSpineByPool(slot0.controller, slot0.controller)

		if slot0.controller.getReportAnimName(slot0.model, slot0.controller) .. "_l" == "nvnongming_l" then
			slot7 = "left"

			slot0._spineCharacter.setSkin(slot5, slot0._spineCharacter)
		end

		slot8 = (slot3 and 1) or -1

		slot0._spineCharacter.setScaleX(slot6, slot0._spineCharacter)

		slot8 = PDK_VIEW_CHAIRID_ME

		if slot0.controller.isReportWinner(slot6, slot0.controller) then
			slot10 = true

			slot0._spineCharacter.setAnimation(slot6, slot0._spineCharacter, 0, "win")
		else
			slot10 = true

			slot0._spineCharacter.setAnimation(slot6, slot0._spineCharacter, 0, "lose")
		end

		slot8 = slot0._spineCharacter

		slot0.view.figure.addChild(slot6, slot0.view.figure)

		slot7 = slot1

		for slot8, slot9 in pairs(slot6) do
			slot15 = slot0.model._chairIdDic[slot9.chairid]
			slot15 = true

			slot0.view["player" .. tostring(slot14)].root.setIsWin("player" .. tostring(slot14), slot0.view["player" .. tostring(slot14)].root, slot0._isWin)

			slot15 = slot0.model._chairIdDic[slot9.chairid]
			slot14 = slot9

			slot0.view["player" .. tostring(slot0._isWin)].root.setData("player" .. tostring(slot0._isWin), slot0.view["player" .. tostring(slot0._isWin)].root)
		end
	end
end

PdkReportResultCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.btnReport then
		slot5 = true

		slot0.model.setIsShowingReportJuBao(slot3, slot0.model)
	elseif slot1 == slot0.view.btnClose then
		slot5 = false

		slot0.model.setIsShowingReportOutLose(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowingReportOutWin(slot3, slot0.model)
	end
end

PdkReportResultCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.reportResultChangedSignal.remove(slot2, slot0.model.reportResultChangedSignal, slot0.onReportResultChanged)

	slot5 = slot0

	slot0.model.curShowingViewTypeChangedSignal.remove(slot2, slot0.model.curShowingViewTypeChangedSignal, slot0.onCurShowingViewTypeChanged)

	slot3 = slot0.view.btnReport

	destroySomeObj(slot2)

	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
