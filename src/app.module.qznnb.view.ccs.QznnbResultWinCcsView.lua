QznnbResultWinCcsView = class("QznnbResultWinCcsView")

QznnbResultWinCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0:setBlockCanTouch(false)
	slot0.view.btnStart:setVisible(false)
end

QznnbResultWinCcsView.onZoomShowTweenComplete = function (slot0)
	slot0.view.btnStart:setVisible(false)
	slot0:killTweens()

	slot0.tlline = {}
	slot1 = slot0.model:getGameScore() or {}

	audioMgr:holdVolume(0.1)

	if slot0.model:getCloseScore() >= 0 then
		slot0.controller:playGameEffect("effect/effect_win.mp3")
	else
		slot0.controller:playGameEffect("effect/effect_lose.mp3")
	end

	slot0.view.btnStart:setVisible(false)

	slot5 = TimelineLite.new()

	slot5:insert(TweenLite.to(slot0.view.btnStart, 0.001, {
		onComplete = function ()
			TweenLite.killTweensOf(slot0.view.btnStart)
			TweenLite.killTweensOf.model:setIsShowingResult(false)

			if TweenLite.killTweensOf.model.setIsShowingResult.model:getIsAuto() then
				slot0.controller:requestStartGameInResultView()
			end
		end
	}), 1)
	table.insert(slot0.tlline, slot5)
end

QznnbResultWinCcsView.show = function (slot0, slot1, slot2)
	ZoomPopUpChildView.show(slot0, true, slot2)
end

QznnbResultWinCcsView.killTweens = function (slot0)
	TweenLite.killTweensOf(slot0.view.btnStart)

	if slot0.tlline then
		for slot4, slot5 in ipairs(slot0.tlline) do
			slot5:kill()
		end

		slot0.tlline = nil
	end
end

QznnbResultWinCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, true, slot2)
	slot0:killTweens()
	slot0.view.btnStart:setVisible(false)
end

QznnbResultWinCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnStart then
		slot0.controller:requestStartGameInResultView()
	end
end

QznnbResultWinCcsView.destroy = function (slot0)
	slot0:killTweens()

	slot1 = ipairs
	slot2 = slot0.timerTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:stop()
		slot5:destroy()
	end

	destroySomeObj(slot0.view.btnStart)
	ZoomPopUpChildView.destroy(slot0)
end

return
