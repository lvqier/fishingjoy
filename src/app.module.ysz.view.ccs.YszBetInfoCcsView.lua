slot2 = "YszBetInfoCcsView"
YszBetInfoCcsView = class(slot1)

YszBetInfoCcsView.onCreationComplete = function (slot0)
	slot3 = slot0

	slot0.init(slot2)
end

YszBetInfoCcsView.init = function (slot0)
	slot0.roomName = ""
	slot3 = slot0

	slot0.register(slot2)

	slot3 = slot0

	slot0.reset(slot2)
end

YszBetInfoCcsView.register = function (slot0)
	slot5 = slot0

	slot0.model.lCellScoreChangedSignal.add(slot2, slot0.model.lCellScoreChangedSignal, slot0.onChangeDZ)

	slot5 = slot0

	slot0.model.nCurRoundsChangedSignal.add(slot2, slot0.model.nCurRoundsChangedSignal, slot0.onChangeDJL)

	slot5 = slot0

	slot0.model.nMaxRoundsChangedSignal.add(slot2, slot0.model.nMaxRoundsChangedSignal, slot0.onChangeDJL)

	slot5 = slot0

	slot0.model.lMaxScoreChangedSignal.add(slot2, slot0.model.lMaxScoreChangedSignal, slot0.onChangeSX)

	slot5 = slot0

	slot0.model.meCardTypeChangedSignal.add(slot2, slot0.model.meCardTypeChangedSignal, slot0.onChangeCardType)

	slot5 = slot0

	slot0.model.xzTotalScoreChangedSignal.add(slot2, slot0.model.xzTotalScoreChangedSignal, slot0.onChangeZXZ)

	slot5 = slot0

	slot0.model.lTablePlayerScoreChangedSignal.add(slot2, slot0.model.lTablePlayerScoreChangedSignal, slot0.onLTablePlayerScore)
end

YszBetInfoCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnMenu1 or slot1 == slot0.btnMenu2 then
		slot5 = slot0.controller

		slot0.controller.onMenuBtnClick(slot4)
	end
end

YszBetInfoCcsView.onChangeDZ = function (slot0)
	slot3 = slot0

	slot0.onChangeSX(slot2)
end

YszBetInfoCcsView.onChangeSX = function (slot0)
	slot1 = ""
	slot4 = slot0.model

	if slot0.model.getLCellScore(slot3) ~= 0 then
		slot4 = slot0.model

		if slot0.model.getLMaxScore(slot3) == 0 then
			slot5 = slot0.roomName .. " 底注:0 单注上限:0"

			slot0.txtFJH1.setString(slot3, slot0.txtFJH1)

			return
		end
	end

	slot8 = slot0.model
	slot8 = slot0.model
	slot6 = slot0.model
	slot8 = slot0.model
	slot5 = slot0.roomName .. " 底注:" .. MathUtil.cookNumWithHansUnits(slot5, slot0.model.getLCellScore(slot7)) .. " 单注上限:" .. MathUtil.cookNumWithHansUnits(slot5, slot0.model.getLMaxScore(0)) .. " 第" .. slot0.model.getNCurRounds(slot5) .. "/" .. slot0.model.getNMaxRounds(0) .. "轮"

	slot0.txtFJH1.setString(" 第", slot0.txtFJH1)
end

YszBetInfoCcsView.setRoomName = function (slot0, slot1)
	slot0.roomName = slot1
	slot4 = slot0

	slot0.onChangeSX(slot3)
end

YszBetInfoCcsView.onChangeZXZ = function (slot0)
	slot1 = ""
	slot6 = slot0.model
	slot5 = 2
	slot5 = MathUtil.cookNumWithHansUnits(slot3, slot0.model.getXzTotalScore(slot5))

	slot0.txtZXZ.setString(slot3, slot0.txtZXZ)
end

YszBetInfoCcsView.onChangeDJL = function (slot0)
	slot3 = slot0

	slot0.onChangeSX(slot2)
end

YszBetInfoCcsView.setAddSore = function (slot0, slot1, slot2)
	slot6 = true

	slot1.setVisible(slot4, slot1)

	slot6 = slot2

	slot1.txtZXZ.setString(slot4, slot1.txtZXZ)
end

YszBetInfoCcsView.onChangeCardType = function (slot0)
	slot4 = true

	slot0.Ysz_Battle_dk2.setVisible(slot2, slot0.Ysz_Battle_dk2)

	slot3 = slot0.model

	if slot0.model.getMeCardType(slot2) == YszController.CT_SINGLE then
		slot4 = "高牌"

		slot0.Ysz_Battle_dk2.txt.setString(slot2, slot0.Ysz_Battle_dk2.txt)
	else
		slot3 = slot0.model

		if slot0.model.getMeCardType(slot2) == YszController.CT_DOUBLE then
			slot4 = "对子"

			slot0.Ysz_Battle_dk2.txt.setString(slot2, slot0.Ysz_Battle_dk2.txt)
		else
			slot3 = slot0.model

			if slot0.model.getMeCardType(slot2) == YszController.CT_SHUN_ZI then
				slot4 = "顺子"

				slot0.Ysz_Battle_dk2.txt.setString(slot2, slot0.Ysz_Battle_dk2.txt)
			else
				slot3 = slot0.model

				if slot0.model.getMeCardType(slot2) == YszController.CT_JIN_HUA then
					slot4 = "同花"

					slot0.Ysz_Battle_dk2.txt.setString(slot2, slot0.Ysz_Battle_dk2.txt)
				else
					slot3 = slot0.model

					if slot0.model.getMeCardType(slot2) == YszController.CT_SHUN_JIN then
						slot4 = "同花顺"

						slot0.Ysz_Battle_dk2.txt.setString(slot2, slot0.Ysz_Battle_dk2.txt)
					else
						slot3 = slot0.model

						if slot0.model.getMeCardType(slot2) == YszController.CT_BAO_ZI then
							slot4 = "三条"

							slot0.Ysz_Battle_dk2.txt.setString(slot2, slot0.Ysz_Battle_dk2.txt)
						else
							slot3 = slot0.model

							if slot0.model.getMeCardType(slot2) == YszController.CT_SPECIAL then
								slot4 = "二三五牌"

								slot0.Ysz_Battle_dk2.txt.setString(slot2, slot0.Ysz_Battle_dk2.txt)
							end
						end
					end
				end
			end
		end
	end
end

YszBetInfoCcsView.onLTablePlayerScore = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getLTablePlayerScore(slot2)

	for slot5 = 1, YSZ_GAME_PLAYER, 1 do
		slot6 = slot1[slot5]

		if slot0["info" .. slot5] ~= nil and slot6 ~= nil and slot6 > 0 then
			slot12 = slot6

			slot0.setAddSore(slot9, slot0, slot7)
		end
	end
end

YszBetInfoCcsView.showWait = function (slot0)
	slot4 = true

	slot0.ysz_wait.setVisible(slot2, slot0.ysz_wait)
end

YszBetInfoCcsView.hideWait = function (slot0)
	slot4 = false

	slot0.ysz_wait.setVisible(slot2, slot0.ysz_wait)
end

YszBetInfoCcsView.reset = function (slot0)
	slot4 = false

	slot0.Ysz_Battle_dk2.setVisible(slot2, slot0.Ysz_Battle_dk2)

	slot4 = false

	slot0.ysz_wait.setVisible(slot2, slot0.ysz_wait)

	for slot4 = 1, 5, 1 do
		slot8 = false

		slot0["info" .. slot4].setVisible(slot4, slot0["info" .. slot4])
	end
end

return
