slot2 = "DntglkExitCcsView"
DntglkExitCcsView = class(slot1)

DntglkExitCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)
end

DntglkExitCcsView.onShow = function (slot0)
	slot0.iCloseTime = 10
	slot3 = slot0

	slot0.initView(slot2)
end

DntglkExitCcsView.onHide = function (slot0)
	if slot0.oTimeClose then
		slot3 = slot0.oTimeClose

		slot0.oTimeClose.destroy(slot2)

		slot0.oTimeClose = nil
	end
end

DntglkExitCcsView.initView = function (slot0)
	if slot0.oTimeClose then
		slot3 = slot0.oTimeClose

		slot0.oTimeClose.destroy(slot2)

		slot0.oTimeClose = nil
	end

	slot8 = "#dntglk_exit_%d.png"

	slot0.view.count_tf.setHtmlText(slot3, HtmlUtil.createArtNum(slot6, slot1))

	slot8 = slot0.iCloseTime
	slot0.oTimeClose = tickMgr.delayedCall(slot0.view.count_tf, tickMgr, function ()
		if slot0 - 1 >= 1 then
			if slot1.view.count_tf then
				slot2 = slot1.view.count_tf
				slot6 = "#dntglk_exit_%d.png"

				slot1.view.count_tf.setHtmlText(slot1, HtmlUtil.createArtNum(slot4, slot1.view.count_tf.setHtmlText))
			end
		else
			if slot1.oTimeClose then
				slot2 = slot1.oTimeClose

				slot1.oTimeClose.destroy(slot1)

				slot1.oTimeClose = nil
			end

			slot3 = false

			slot1.model.setIsShowingExit(slot1, slot1.model)
		end
	end, 1000)
end

DntglkExitCcsView.onBtnClick = function (slot0, slot1, slot2)
	slot5 = slot0

	slot0.closeExitView(slot4)

	if slot1 == slot0.view.btnSure then
		slot5 = slot0.controller

		slot0.controller.requestExitBattle(slot4)
	end

	slot5 = "close"

	trace_r(slot4)
end

DntglkExitCcsView.closeExitView = function (slot0)
	if slot0.oTimeClose then
		slot3 = slot0.oTimeClose

		slot0.oTimeClose.destroy(slot2)

		slot0.oTimeClose = nil
	end

	slot5 = true

	slot0.model.setIsShowingExit(slot2, slot0.model, false)
end

DntglkExitCcsView.onRootClick = function (slot0)
	slot3 = slot0

	slot0.closeExitView(slot2)
end

DntglkExitCcsView.destroy = function (slot0)
	slot3 = slot0

	slot0.closeExitView(slot2)
end

return
