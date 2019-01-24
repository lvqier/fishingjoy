slot2 = "DzpkMatchReadyCcsView"
DzpkMatchReadyCcsView = class(slot1)

DzpkMatchReadyCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot3 = slot0

	slot0.init(slot2)
end

DzpkMatchReadyCcsView.init = function (slot0)
	slot0.timer = {}
	slot4 = "dzpk_nvheguan"
	slot0.npcSpine = slot0.controller.createSpineByPool(slot2, slot0.controller)
	slot0.npcAction = {
		"suiji1",
		"suiji2",
		"suiji3",
		"suiji4"
	}

	if slot0.npcSpine ~= nil then
		slot4 = slot0.npcSpine

		slot0.npc.addChild(slot2, slot0.npc)

		slot6 = true

		slot0.npcSpine.setAnimation(slot2, slot0.npcSpine, 0, "suiji1")

		slot5 = -206

		slot0.npcSpine.setPosition(slot2, slot0.npcSpine, 0)
	end

	slot5 = slot0

	slot0.model.matchWaitTimerChangedSignal.add(slot2, slot0.model.matchWaitTimerChangedSignal, slot0.showCountDown)
end

DzpkMatchReadyCcsView.onRootClick = function (slot0)
	return
end

DzpkMatchReadyCcsView.onShow = function (slot0)
	slot4 = false

	slot0.model.setIsShowingMatchInfo(slot2, slot0.model)

	slot3 = slot0.model.matchWaitTimerChangedSignal

	slot0.model.matchWaitTimerChangedSignal.emit(slot2)
end

DzpkMatchReadyCcsView.showCountDown = function (slot0)
	slot3 = slot0.model

	function slot3()
		if slot0 <= 0 then
			slot3 = "00"

			slot1.timeTipLayer.fenTxt.setString(slot1, slot1.timeTipLayer.fenTxt)

			slot3 = "00"

			slot1.timeTipLayer.fenTxt2.setString(slot1, slot1.timeTipLayer.fenTxt2)
		else
			slot0 = slot0 - 1
			slot4 = ":"
			slot1 = string.split(DateUtil.getTimeString, DateUtil.getTimeString(slot1))
			slot5 = slot1[2]

			slot1.timeTipLayer.fenTxt.setString(DateUtil.getTimeString(slot1), slot1.timeTipLayer.fenTxt)

			slot5 = slot1[3]

			slot1.timeTipLayer.fenTxt2.setString(DateUtil.getTimeString(slot1), slot1.timeTipLayer.fenTxt2)
		end
	end

	if slot0.model.getMatchWaitTimer(slot2) > 0 then
		slot6 = slot0

		slot0.clearCd(slot5)

		slot6 = slot0.timer
		slot12 = slot1

		table.insert(slot5, tickMgr.delayedCall(slot8, tickMgr, slot3, 1000))

		slot7 = true

		slot0.timeTipLayer.setVisible(slot5, slot0.timeTipLayer)

		slot8 = ":"
		slot9 = string.split(slot2, DateUtil.getTimeString(slot5))[2]

		slot0.timeTipLayer.fenTxt.setString(DateUtil.getTimeString(slot5), slot0.timeTipLayer.fenTxt)

		slot9 = string.split(slot2, DateUtil.getTimeString(slot5))[3]

		slot0.timeTipLayer.fenTxt2.setString(DateUtil.getTimeString(slot5), slot0.timeTipLayer.fenTxt2)
	else
		slot7 = false

		slot0.timeTipLayer.setVisible(slot5, slot0.timeTipLayer)
	end
end

DzpkMatchReadyCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnBack then
		slot6 = false

		slot0.model.setIsShowingMatchReadyUI(slot4, slot0.model)

		slot5 = slot0

		slot0.clearCd(slot4)
	end
end

DzpkMatchReadyCcsView.clearCd = function (slot0)
	slot3 = slot0.timer

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.stop(slot7)

		slot8 = slot5

		slot5.destroy(slot7)

		slot5 = nil
	end

	slot0.timer = {}
end

DzpkMatchReadyCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.matchWaitTimerChangedSignal.remove(slot2, slot0.model.matchWaitTimerChangedSignal, slot0.showCountDown)

	slot3 = slot0

	slot0.clearCd(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
