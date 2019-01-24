slot2 = "LrnnResultWinCcsView"
LrnnResultWinCcsView = class(slot1)

LrnnResultWinCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot4 = false

	slot0.setBlockCanTouch(slot2, slot0)

	slot4 = false

	slot0.view.btnStart.setVisible(slot2, slot0.view.btnStart)
end

LrnnResultWinCcsView.onZoomShowTweenComplete = function (slot0)
	slot4 = false

	slot0.view.btnStart.setVisible(slot2, slot0.view.btnStart)

	slot3 = slot0

	slot0.killTweens(slot2)

	slot0.tlline = {}
	slot1 = slot0.model.getGameScore(slot2) or {}
	slot4 = slot0.model
	slot3 = slot0.model.getCloseScore(slot0.model) >= 0
	slot7 = 0.1

	audioMgr.holdVolume(slot5, audioMgr)

	if slot3 then
		slot7 = "effect/effect_win.mp3"

		slot0.controller.playGameEffect(slot5, slot0.controller)
	else
		slot7 = "effect/effect_lose.mp3"

		slot0.controller.playGameEffect(slot5, slot0.controller)
	end

	slot0.view.btnStart.setVisible(slot5, slot0.view.btnStart)

	slot5 = TimelineLite.new()
	slot13 = {
		onComplete = function ()
			slot2 = slot0.view.btnStart

			TweenLite.killTweensOf(slot1)

			slot3 = false

			TweenLite.killTweensOf.model.setIsShowingResult(slot1, TweenLite.killTweensOf.model)
			TweenLite.killTweensOf.model.setIsShowingResult.model.setIsShowingCd(slot1, TweenLite.killTweensOf.model.setIsShowingResult.model)

			slot2 = TweenLite.killTweensOf.model.setIsShowingResult.model.setIsShowingCd.model
			slot4 = slot0.model
			slot4 = slot0.model
			slot4 = {
				slot0.model.getOtherUserData(true),
				slot0.model.getMyUserData(true)
			}

			for slot5, slot6 in pairs(true) do
				if slot6.wChairID and slot0[slot6.wChairID] then
					slot14 = tickMgr
					slot11 = slot0[slot6.wChairID].endT - tickMgr.getServerTime(slot13)

					slot0.controller.setCd(slot8, slot0.controller, slot6.wChairID)
				end
			end

			slot4 = slot0.model

			if slot0.model.getIsAuto(slot3) then
				slot4 = slot0.controller

				slot0.controller.requestStartGameInResultView(slot3)
			else
				slot5 = true

				slot0.view.btnStart.setVisible(slot3, slot0.view.btnStart)
			end
		end
	}
	slot10 = 1

	slot5.insert(false, slot5, TweenLite.to(slot10, slot0.view.btnStart, 0.001))

	slot9 = slot5

	table.insert(false, slot0.tlline)
end

LrnnResultWinCcsView.show = function (slot0, slot1, slot2)
	slot7 = slot2

	ZoomPopUpChildView.show(slot4, slot0, true)
end

LrnnResultWinCcsView.killTweens = function (slot0)
	slot3 = slot0.view.btnStart

	TweenLite.killTweensOf(slot2)

	if slot0.tlline then
		slot3 = slot0.tlline

		for slot4, slot5 in ipairs(slot2) do
			slot8 = slot5

			slot5.kill(slot7)
		end

		slot0.tlline = nil
	end
end

LrnnResultWinCcsView.hide = function (slot0, slot1, slot2)
	slot7 = slot2

	ZoomPopUpChildView.hide(slot4, slot0, true)

	slot5 = slot0

	slot0.killTweens(slot4)

	slot6 = false

	slot0.view.btnStart.setVisible(slot4, slot0.view.btnStart)
end

LrnnResultWinCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnStart then
		slot5 = slot0.controller

		slot0.controller.requestStartGameInResultView(slot4)
	end
end

LrnnResultWinCcsView.destroy = function (slot0)
	slot3 = slot0

	slot0.killTweens(slot2)

	slot1 = ipairs
	slot3 = slot0.timerTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot8 = slot5

		slot5.stop(slot7)

		slot8 = slot5

		slot5.destroy(slot7)
	end

	slot3 = slot0.view.btnStart

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
