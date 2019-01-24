SerialExitCcsView = class("SerialExitCcsView")

SerialExitCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._isUIClose = false
end

SerialExitCcsView.onShow = function (slot0)
	slot0:initView()
end

SerialExitCcsView.onHide = function (slot0)
	return
end

SerialExitCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
end

SerialExitCcsView.show = function (slot0, slot1, slot2)
	ZoomPopUpChildView.show(slot0, slot1, slot2)
end

SerialExitCcsView.initView = function (slot0)
	slot0.view.tipFirst:setVisible(true)
	slot0.view.tipSecond:setVisible(false)
end

SerialExitCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.tipFirst.btnSure then
		reqSerialGameStorage({
			bSave = true
		})
		slot0.controller:try2ExitBattle()
	elseif slot1 == slot0.view.tipFirst.btnCancel then
		slot0.view.tipFirst:setVisible(false)
		slot0.view.tipSecond:setVisible(true)
	elseif slot1 == slot0.view.tipSecond.btnSure then
		reqSerialGameStorage({
			bSave = false
		})
		slot0.controller:try2ExitBattle()
	elseif slot1 == slot0.view.tipSecond.btnCancel then
		reqSerialGameStorage({
			bSave = true
		})
		slot0.controller:try2ExitBattle()
	elseif slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingExit(false)
	end
end

SerialExitCcsView.closeExitView = function (slot0)
	slot0.model:setIsShowingExit(false)
end

return
