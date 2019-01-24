slot2 = "DntgtestExitCcsView"
DntgtestExitCcsView = class(slot1)

DntgtestExitCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)
end

DntgtestExitCcsView.onShow = function (slot0)
	slot0.iCloseTime = 10
	slot3 = slot0

	slot0.initView(slot2)
end

DntgtestExitCcsView.onHide = function (slot0)
	if slot0.oTimeClose then
		slot3 = slot0.oTimeClose

		slot0.oTimeClose.destroy(slot2)

		slot0.oTimeClose = nil
	end
end

DntgtestExitCcsView.initView = function (slot0)
	if slot0.oTimeClose then
		slot3 = slot0.oTimeClose

		slot0.oTimeClose.destroy(slot2)

		slot0.oTimeClose = nil
	end

	slot7 = slot0.iCloseTime - 1

	slot0.view.tick_daojishi.setString(slot3, tostring(slot6))

	slot8 = slot0.iCloseTime
	slot0.oTimeClose = tickMgr.delayedCall(slot0.view.tick_daojishi, tickMgr, function ()
		if slot0 - 1 >= 1 then
			if slot1.view.tick_daojishi then
				slot2 = slot1.view.tick_daojishi
				slot5 = slot1.view.tick_daojishi.setString

				slot1.view.tick_daojishi.setString(slot1, tostring(slot4))
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

DntgtestExitCcsView.onBtnClick = function (slot0, slot1, slot2)
	slot5 = slot0

	slot0.closeExitView(slot4)

	if slot1 == slot0.view.btnSure then
		slot5 = slot0.controller

		slot0.controller.requestExitBattle(slot4)
	end
end

DntgtestExitCcsView.closeExitView = function (slot0)
	if slot0.oTimeClose then
		slot3 = slot0.oTimeClose

		slot0.oTimeClose.destroy(slot2)

		slot0.oTimeClose = nil
	end

	slot4 = false

	slot0.model.setIsShowingExit(slot2, slot0.model)
end

DntgtestExitCcsView.onRootClick = function (slot0)
	slot3 = slot0

	slot0.closeExitView(slot2)
end

DntgtestExitCcsView.destroy = function (slot0)
	slot3 = slot0

	slot0.closeExitView(slot2)
end

return
