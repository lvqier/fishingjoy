slot2 = "YszCompareCcsView"
YszCompareCcsView = class(slot1)

YszCompareCcsView.onCreationComplete = function (slot0)
	slot3 = slot0

	slot0.init(slot2)
end

YszCompareCcsView.init = function (slot0)
	slot0.showBtn = {}
	slot0.dirTable = {}
	slot0.m_timers = {}
	slot5 = slot0

	slot0.model.cancelWaitCompareChangedSignal.add(slot2, slot0.model.cancelWaitCompareChangedSignal, slot0.onChangeCompareWait)
end

YszCompareCcsView.ready = function (slot0)
	slot0.showBtn = {}
	slot0.dirTable = {}

	for slot4 = 1, 5, 1 do
		slot9 = YSZ_GAME_PLAYER
		slot12 = slot0.model
		slot8 = slot0.model

		if slot0.model.getMyTablePlayingUserData(gameMgr)[gameMgr.switchViewChairID(slot6, gameMgr, slot4 - 1, slot0.model.getMeWChairID(slot11))] ~= nil and slot6.cbUserStatus == US_PLAYING then
			slot9 = slot0.model

			if slot0.model.getCbPlayStatus(slot8)[slot5] == 1 and slot0["btn" .. slot5] ~= nil then
				slot10 = slot5

				slot0["btn" .. slot5].setTag(slot5, slot0["btn" .. slot5])

				slot0.showBtn[slot5] = slot0["btn" .. slot5]
				slot0.dirTable[slot5] = slot0["sss" .. slot5]
			end
		end
	end
end

YszCompareCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btn2 or slot1 == slot0.btn3 or slot1 == slot0.btn4 or slot1 == slot0.btn5 then
		slot6 = slot1
		slot4 = slot1.getTag(slot0.model)

		if slot0.model.getMyTablePlayingUserData(slot4) ~= nil and slot3[slot4] ~= nil then
			slot8 = "选择对象比牌"

			slot0.controller.sendlog(slot6, slot0.controller)

			slot8 = slot3[slot4].wChairID

			slot0.controller.reqChooseCUser(slot6, slot0.controller)
		end

		slot7 = slot0

		slot0.reset(slot6)
	end
end

YszCompareCcsView.showCompareBtnEffect = function (slot0)
	slot3 = slot0

	slot0.reset(slot2)
	slot0.ready(slot2)

	slot1 = false
	slot4 = slot0.showBtn

	for slot5, slot6 in pairs(slot0) do
		slot9 = slot6

		slot6.stopAllActions(slot8)

		slot10 = true

		slot6.setVisible(slot8, slot6)

		slot1 = true
	end

	if not slot1 then
		return
	end

	slot5 = true

	slot0.compareTxt.setVisible(slot3, slot0.compareTxt)

	slot2 = 1

	function changeImage()
		slot2 = slot0.dirTable

		for slot3, slot4 in pairs(slot1) do
			slot8 = true

			slot4.setVisible(slot6, slot4)

			if slot1 == 1 then
				for slot8 = 2, 3, 1 do
					slot12 = false

					slot4["Image_1" .. slot8].setVisible(slot8, slot4["Image_1" .. slot8])
				end
			elseif slot1 == 2 then
				slot8 = true

				slot4["Image_1" .. 2].setVisible(2, slot4["Image_1" .. 2])
			elseif slot1 == 3 then
				slot8 = true

				slot4["Image_1" .. 3].setVisible(3, slot4["Image_1" .. 3])
			end
		end

		if slot1 + 1 > 3 then
			slot1 = 1
		end
	end

	slot5 = slot0.m_timers
	slot11 = -1

	table.insert(slot0.compareTxt, tickMgr.delayedCall(slot7, tickMgr, changeImage, 400))
end

YszCompareCcsView.onChangeCompareWait = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCancelWaitCompare(slot2) then
		slot3 = slot0

		slot0.reset(slot2)
	end
end

YszCompareCcsView.reset = function (slot0)
	for slot4 = 2, 5, 1 do
		slot7 = slot0["btn" .. slot4]

		slot0["btn" .. slot4].stopAllActions(slot4)

		slot8 = false

		slot0["btn" .. slot4].setVisible(slot4, slot0["btn" .. slot4])

		slot8 = false

		slot0["sss" .. slot4].setVisible(slot4, slot0["sss" .. slot4])
	end

	slot4 = false

	slot0.compareTxt.setVisible(slot2, slot0.compareTxt)

	slot3 = slot0.m_timers

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.stop(slot7)

		slot8 = slot5

		slot5.destroy(slot7)

		slot5 = nil
	end

	slot0.m_timers = {}
end

return
