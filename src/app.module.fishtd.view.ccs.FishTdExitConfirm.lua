FishTdExitConfirm = class("FishTdExitConfirm")

FishTdExitConfirm.onCreationComplete = function (slot0)
	slot1 = ClassLoader:aquireSingleton("Tools")

	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0.countDownTimer = TimerBase.new(handler(slot0, slot0.onCountDown), 1000, -1, "FishTdExitConfirm:countDownTimer")
	slot0.countDownTimer.autoDispose = false

	slot0.countDownTimer:reset()

	slot0.countDownCounter = 10
end

FishTdExitConfirm.onBtnClick = function (slot0, slot1, slot2)
	slot3 = false

	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingExitConfirm(false)

		slot3 = true
	elseif slot1 == slot0.view.btnCancel then
		slot0.model:setIsShowingExitConfirm(false)

		slot3 = true
	elseif slot1 == slot0.view.btnSure then
		slot0.controller:requestExitBattle()

		slot3 = true
	end

	if slot3 then
		fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.DIALOG_CLOSE)
	end
end

FishTdExitConfirm.onShow = function (slot0)
	slot0.countDownCounter = 9

	slot0.countDownTimer:startTick()
	slot0.view.tick_daojishi:setString(tostring(9))
end

FishTdExitConfirm.onHide = function (slot0)
	slot0.countDownTimer:reset()
end

FishTdExitConfirm.onCountDown = function (slot0)
	slot0.countDownCounter = slot0.countDownCounter - 1

	slot0.view.tick_daojishi:setString(tostring(slot0.countDownCounter))

	if slot0.countDownCounter == 0 then
		slot0.model:setIsShowingExitConfirm(false)
	end
end

FishTdExitConfirm.destroy = function (slot0)
	slot0.countDownTimer:destroy()
	destroySomeObj(slot0.view.btnCancel)
	destroySomeObj(slot0.view.btnSure)
	ZoomPopUpChildView.destroy(slot0)
end

return FishTdExitConfirm
