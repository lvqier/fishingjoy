DntgExitCcsView = class("DntgExitCcsView")

DntgExitCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
end

DntgExitCcsView.onShow = function (slot0)
	slot0.iCloseTime = 10

	slot0:initView()
end

DntgExitCcsView.onHide = function (slot0)
	if slot0.oTimeClose then
		slot0.oTimeClose:destroy()

		slot0.oTimeClose = nil
	end
end

DntgExitCcsView.initView = function (slot0)
	if slot0.oTimeClose then
		slot0.oTimeClose:destroy()

		slot0.oTimeClose = nil
	end

	slot0.view.tick_daojishi:setString(tostring(slot1))

	slot0.oTimeClose = tickMgr:delayedCall(function ()
		if slot0 - 1 >= 1 then
			if slot1.view.tick_daojishi then
				slot1.view.tick_daojishi:setString(tostring(slot1.view.tick_daojishi.setString))
			end
		else
			if slot1.oTimeClose then
				slot1.oTimeClose:destroy()

				slot1.oTimeClose.oTimeClose = nil
			end

			slot1.model:setIsShowingExit(false)
		end
	end, 1000, slot0.iCloseTime)
end

DntgExitCcsView.onBtnClick = function (slot0, slot1, slot2)
	slot0:closeExitView()

	if slot1 == slot0.view.btnSure then
		slot0.controller:requestExitBattle()
	end
end

DntgExitCcsView.closeExitView = function (slot0)
	if slot0.oTimeClose then
		slot0.oTimeClose:destroy()

		slot0.oTimeClose = nil
	end

	slot0.model:setIsShowingExit(false)
end

DntgExitCcsView.onRootClick = function (slot0)
	slot0:closeExitView()
end

DntgExitCcsView.destroy = function (slot0)
	slot0:closeExitView()
end

return
