slot2 = "YszBetMenuCcsView"
YszBetMenuCcsView = class(slot1)
YszBetMenuCcsView.LVEL_1 = 3
YszBetMenuCcsView.LVEL_2 = 5
YszBetMenuCcsView.LVEL_3 = 8
YszBetMenuCcsView.LVEL_4 = 10

YszBetMenuCcsView.onCreationComplete = function (slot0)
	slot3 = slot0

	slot0.init(slot2)
end

YszBetMenuCcsView.init = function (slot0)
	slot0.btnTable = {
		slot0.btnBet1,
		slot0.btnBet2,
		slot0.btnBet3,
		slot0.btnBet4
	}
	slot0.m_lGoldCount = {}
	slot3 = slot0

	slot0.register(slot0.btnBet4)

	slot3 = slot0

	slot0.reset(slot0.btnBet4)
end

YszBetMenuCcsView.register = function (slot0)
	slot5 = slot0

	slot0.model.lCellScoreChangedSignal.add(slot2, slot0.model.lCellScoreChangedSignal, slot0.onChangeState)

	slot5 = slot0

	slot0.model.isShowBetMenuChangedSignal.add(slot2, slot0.model.isShowBetMenuChangedSignal, slot0.onIsShowBetMenuChanged)
end

YszBetMenuCcsView.onChangeJZScore = function (slot0)
	slot1 = 1
	slot2 = slot0.model.getMyTablePlayingUserData(slot3)[1].lScore
	slot5 = slot0.model
	slot3 = slot0.model.getMyTablePlayingUserData(slot0.model)[1] ~= nil
	slot6 = slot0.model

	if slot0.model.getBMingZhu(slot5)[1] then
		slot1 = slot1 * 2
	end

	slot6 = slot0.btnBet1
	slot4 = slot0.btnBet1.setEnabled
	slot9 = slot0.model

	if slot0.model.getLCurrentTimes(slot8) <= YszBetMenuCcsView.LVEL_1 and slot3 then

		-- Decompilation error in this vicinity:
		slot9 = slot0.model
		slot7 = slot2 >= slot0.model.getLCellScore(slot8) * YszBetMenuCcsView.LVEL_1 * slot1

		slot4(slot5, slot6)

		slot6 = slot0.btnBet2
		slot4 = slot0.btnBet2.setEnabled
		slot9 = slot0.model

		if slot3 then
			slot9 = slot0.model
			slot7 = slot2 >= slot0.model.getLCellScore(slot8) * YszBetMenuCcsView.LVEL_2 * slot1

			slot4(slot5, slot6)

			slot6 = slot0.btnBet3
			slot4 = slot0.btnBet3.setEnabled
			slot9 = slot0.model
		end

		if slot3 then
			slot9 = slot0.model
			slot7 = slot2 >= slot0.model.getLCellScore(slot8) * YszBetMenuCcsView.LVEL_3 * slot1

			slot4(slot5, slot6)

			slot6 = slot0.btnBet4
			slot4 = slot0.btnBet4.setEnabled
			slot9 = slot0.model
		end

		if slot3 then
			slot9 = slot0.model
			slot7 = slot2 >= slot0.model.getLCellScore(slot8) * YszBetMenuCcsView.LVEL_4 * slot1

			slot4(slot5, slot6)

			slot9 = slot0.btnBet1
		end

		slot7 = (slot0.btnBet1.isEnabled(slot8) and 255) or 100

		slot0.btnBet1.txt.setOpacity(slot5, slot0.btnBet1.txt)

		slot9 = slot0.btnBet2
		slot7 = (slot0.btnBet2.isEnabled(slot8) and 255) or 100

		slot0.btnBet2.txt.setOpacity(slot5, slot0.btnBet2.txt)

		slot9 = slot0.btnBet3
		slot7 = (slot0.btnBet3.isEnabled(slot8) and 255) or 100

		slot0.btnBet3.txt.setOpacity(slot5, slot0.btnBet3.txt)

		slot9 = slot0.btnBet4
		slot7 = (slot0.btnBet4.isEnabled(slot8) and 255) or 100

		slot0.btnBet4.txt.setOpacity(slot5, slot0.btnBet4.txt)

		return
	end
end

YszBetMenuCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnBet1 then
		slot6 = false

		slot0.model.setIsShowMenu(slot4, slot0.model)

		slot6 = false

		slot0.model.setIsShowBetMenu(slot4, slot0.model)

		slot6 = "点击了加注1按钮"

		slot0.controller.sendlog(slot4, slot0.controller)

		slot7 = 0

		slot0.controller.reqAddScore(slot4, slot0.controller, YszBetMenuCcsView.LVEL_1)
	elseif slot1 == slot0.btnBet2 then
		slot6 = false

		slot0.model.setIsShowBetMenu(slot4, slot0.model)

		slot6 = false

		slot0.model.setIsShowMenu(slot4, slot0.model)

		slot6 = "点击了加注2按钮"

		slot0.controller.sendlog(slot4, slot0.controller)

		slot7 = 0

		slot0.controller.reqAddScore(slot4, slot0.controller, YszBetMenuCcsView.LVEL_2)
	elseif slot1 == slot0.btnBet3 then
		slot6 = false

		slot0.model.setIsShowBetMenu(slot4, slot0.model)

		slot6 = false

		slot0.model.setIsShowMenu(slot4, slot0.model)

		slot6 = "点击了加注3按钮"

		slot0.controller.sendlog(slot4, slot0.controller)

		slot7 = 0

		slot0.controller.reqAddScore(slot4, slot0.controller, YszBetMenuCcsView.LVEL_3)
	elseif slot1 == slot0.btnBet4 then
		slot6 = false

		slot0.model.setIsShowBetMenu(slot4, slot0.model)

		slot6 = false

		slot0.model.setIsShowMenu(slot4, slot0.model)

		slot6 = "点击了加注4按钮"

		slot0.controller.sendlog(slot4, slot0.controller)

		slot7 = 0

		slot0.controller.reqAddScore(slot4, slot0.controller, YszBetMenuCcsView.LVEL_4)
	end
end

YszBetMenuCcsView.addScore = function (slot0, slot1)
	slot5 = 0

	slot0.control.reqAddScore(slot3, slot0.control)
end

YszBetMenuCcsView.onChangeState = function (slot0)
	slot1 = 1
	slot4 = slot0.model

	if slot0.model.getBMingZhu(slot3)[1] then
		slot1 = slot1 * 2
	end

	slot2 = ""
	slot5 = slot0.model

	if slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_1 * slot1 >= 10000 then
		slot5 = slot0.model
		slot2 = (slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_1) / 10000 * slot1 .. "万"
	else
		slot5 = slot0.model
		slot2 = slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_1 * slot1
	end

	slot6 = slot2

	slot0.btnBet1.txt.setString(slot4, slot0.btnBet1.txt)

	slot2 = ""
	slot5 = slot0.model

	if slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_2 * slot1 >= 10000 then
		slot5 = slot0.model
		slot2 = (slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_2) / 10000 * slot1 .. "万"
	else
		slot5 = slot0.model
		slot2 = slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_2 * slot1
	end

	slot6 = slot2

	slot0.btnBet2.txt.setString(slot4, slot0.btnBet2.txt)

	slot2 = ""
	slot5 = slot0.model

	if slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_3 * slot1 >= 10000 then
		slot5 = slot0.model
		slot2 = (slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_3) / 10000 * slot1 .. "万"
	else
		slot5 = slot0.model
		slot2 = slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_3 * slot1
	end

	slot6 = slot2

	slot0.btnBet3.txt.setString(slot4, slot0.btnBet3.txt)

	slot2 = ""
	slot5 = slot0.model

	if slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_4 * slot1 >= 10000 then
		slot5 = slot0.model
		slot2 = (slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_4) / 10000 * slot1 .. "万"
	else
		slot5 = slot0.model
		slot2 = slot0.model.getLCellScore(slot4) * YszBetMenuCcsView.LVEL_4 * slot1
	end

	slot6 = slot2

	slot0.btnBet4.txt.setString(slot4, slot0.btnBet4.txt)
end

YszBetMenuCcsView.onIsShowBetMenuChanged = function (slot0)
	slot3 = slot0

	slot0.stopAllActions(slot2)

	slot3 = slot0.model

	if slot0.model.getIsShowBetMenu(slot2) then
		slot3 = slot0

		slot0.onChangeState(slot2)

		slot3 = slot0

		slot0.showBtn(slot2)
	else
		slot3 = slot0

		slot0.hideBtn(slot2)
	end
end

YszBetMenuCcsView.showBtn = function (slot0)
	function slot4()
		for slot3 = 1, #slot0.btnTable, 1 do
			slot7 = true

			slot0.btnTable[slot3].setVisible(slot5, slot0.btnTable[slot3])

			slot7 = true

			slot0.btnTable[slot3].setEnabled(slot5, slot0.btnTable[slot3])
		end

		slot2 = slot0

		slot0.onChangeJZScore(slot1)
	end

	slot5 = true

	slot0.setVisible(cc.CallFunc, slot0)

	slot4 = slot0
	slot12 = 255
	slot10 = nil

	slot0.runAction(cc.CallFunc, cc.Sequence.create(slot6, cc.Sequence, cc.FadeTo.create(slot9, cc.FadeTo, 0.1), cc.CallFunc.create(slot2, cc.CallFunc)))
end

YszBetMenuCcsView.hideBtn = function (slot0)
	for slot4 = 1, #slot0.btnTable, 1 do
		slot8 = false

		slot0.btnTable[slot4].setVisible(slot6, slot0.btnTable[slot4])

		slot8 = false

		slot0.btnTable[slot4].setEnabled(slot6, slot0.btnTable[slot4])
	end

	function slot4()
		slot3 = false

		slot0.setVisible(slot1, slot0)
	end

	slot4 = slot0
	slot12 = 0
	slot10 = nil

	slot0.runAction(cc.CallFunc, cc.Sequence.create(slot6, cc.Sequence, cc.FadeTo.create(slot9, cc.FadeTo, 0.1), cc.CallFunc.create(slot2, cc.CallFunc)))
end

YszBetMenuCcsView.reset = function (slot0)
	for slot4 = 1, #slot0.btnTable, 1 do
		slot8 = false

		slot0.btnTable[slot4].setEnabled(slot6, slot0.btnTable[slot4])
	end

	slot4 = 0

	slot0.setOpacity(slot2, slot0)

	slot4 = false

	slot0.setVisible(slot2, slot0)

	slot3 = slot0

	slot0.stopAllActions(slot2)
end

return
