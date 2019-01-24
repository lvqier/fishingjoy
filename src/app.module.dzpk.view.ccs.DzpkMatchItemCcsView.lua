slot2 = "DzpkMatchItemCcsView"
DzpkMatchItemCcsView = class(slot1)

DzpkMatchItemCcsView.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0.Sprite_Type1
	slot0.SpTypeStartPosX = slot0.Sprite_Type1.getPositionX(slot2)

	if display.width == 1624 then
		slot3 = slot0.ImageBg
		slot7 = 127

		slot0.ImageBg.setContentSize(slot2, cc.size(slot5, display.width - 270))
	else
		slot3 = slot0.ImageBg
		slot7 = 127

		slot0.ImageBg.setContentSize(slot2, cc.size(slot5, 1142))
	end
end

DzpkMatchItemCcsView.updateView = function (slot0)
	if not slot0._data then
		return
	end

	if slot0._data.wAwardType == 0 then
		slot3 = slot0.icon
		slot7 = "common/matchItemIcon_1.png"

		slot0.icon.setTexture(slot2, slot0.controller.getUIPath(slot5, slot0.controller))
	elseif slot0._data.wAwardType == 1 then
		slot3 = slot0.icon
		slot7 = "common/matchItemIcon_2.png"

		slot0.icon.setTexture(slot2, slot0.controller.getUIPath(slot5, slot0.controller))
	end

	slot4 = slot0._data.szMatchName

	slot0.txt_gameName.setString(slot2, slot0.txt_gameName)

	slot4 = slot0._data.wJoinUserCount

	slot0.Text_peopleNum.setString(slot2, slot0.Text_peopleNum)

	slot1 = slot0.SpTypeStartPosX

	for slot5 = 1, 3, 1 do
		if (slot5 == 1 and slot0._data.wRebuyTimes > 0) or (slot5 == 2 and slot0._data.wAddOnTimes > 0) or (slot5 == 3 and slot0._data.wAddOnTimes > 0) then
			slot9 = true

			slot0["Sprite_Type" .. slot5].setVisible(slot5, slot0["Sprite_Type" .. slot5])

			slot9 = slot1

			slot0["Sprite_Type" .. slot5].setPositionX(slot5, slot0["Sprite_Type" .. slot5])

			slot8 = slot0["Sprite_Type" .. slot5]
			slot1 = slot1 + slot0["Sprite_Type" .. slot5].getContentSize(slot5).width + 5
		else
			slot9 = false

			slot0["Sprite_Type" .. slot5].setVisible(slot5, slot0["Sprite_Type" .. slot5])
		end
	end

	slot5 = tickMgr

	if slot0._data.StartTime - tickMgr.getTime(slot4) <= slot0._data.dwRegistrationStartTime then
		slot6 = slot0._data.StartTime
		slot3 = os.date(slot4, "%d")
		slot7 = slot0._data.StartTime
		slot8 = slot0._data.StartTime
		slot9 = "即将开赛"

		slot0.txt_timeTip.setString("%M", slot0.txt_timeTip)

		slot9 = true

		slot0.Sprite_willBg.setVisible("%M", slot0.Sprite_willBg)

		slot9 = true

		slot0.txt_time_will_h.setVisible("%M", slot0.txt_time_will_h)

		slot9 = true

		slot0.txt_time_will_m.setVisible("%M", slot0.txt_time_will_m)

		slot9 = os.date("%d", "%H")

		slot0.txt_time_will_h.setString("%M", slot0.txt_time_will_h)

		slot9 = os.date("%H", "%M")

		slot0.txt_time_will_m.setString("%M", slot0.txt_time_will_m)

		slot9 = false

		slot0.txt_time.setVisible("%M", slot0.txt_time)
	else
		slot6 = slot0._data.StartTime
		slot9 = tickMgr
		slot8 = slot0._data.StartTime
		slot5 = os.date("%d", "%m")
		slot8 = "%m"
		slot11 = tickMgr
		slot6 = os.date("%m", tickMgr.getTime(slot10))

		if os.date(slot4, "%d") == os.date("%d", tickMgr.getTime(slot8)) and slot5 == slot6 then
			slot10 = "今天"

			slot0.txt_timeTip.setString(slot8, slot0.txt_timeTip)
		else
			slot10 = 7
			slot11 = DateUtil.getDateString(slot8, slot0._data.StartTime)

			slot0.txt_timeTip.setString(slot0._data.StartTime, slot0.txt_timeTip)
		end

		slot10 = false

		slot0.Sprite_willBg.setVisible(slot8, slot0.Sprite_willBg)

		slot10 = false

		slot0.txt_time_will_h.setVisible(slot8, slot0.txt_time_will_h)

		slot10 = false

		slot0.txt_time_will_m.setVisible(slot8, slot0.txt_time_will_m)

		slot10 = true

		slot0.txt_time.setVisible(slot8, slot0.txt_time)

		slot10 = 4
		slot11 = DateUtil.getDateString(slot8, slot0._data.StartTime)

		slot0.txt_time.setString(slot0._data.StartTime, slot0.txt_time)
	end

	if slot2 <= 0 then
		if slot0._data.CycleTime > 0 then
			slot0._data.StartTime = slot0._data.StartTime + slot0._data.CycleTime
			slot0._data.bJoin = false
			slot6 = slot0.model.getMatchResponseTab(false)

			for slot7, slot8 in ipairs(slot0.model) do
				if slot8.wMatchID == slot0._data.wMatchID then
					slot8.StartTime = slot8.StartTime + slot8.CycleTime
					slot8.bJoin = false

					break
				end
			end

			slot7 = slot0.model.getJoinMatchResponseTab(slot5)

			for slot8, slot9 in ipairs(slot0.model) do
				if slot9.wMatchID == slot0._data.wMatchID then
					slot13 = 1

					table.remove(slot11, slot4)

					break
				end
			end

			slot7 = slot0.model

			if slot0.model.getSelMatchData(slot6) and slot5.wMatchID == slot0._data.wMatchID then
				slot5.bJoin = false
			end
		else
			slot6 = slot0.model.getMatchResponseTab(slot4)

			for slot7, slot8 in ipairs(slot0.model) do
				if slot8.wMatchID == slot0._data.wMatchID then
					slot12 = 1

					table.remove(slot10, slot3)

					break
				end
			end

			slot7 = slot0.model.getJoinMatchResponseTab(slot5)

			for slot8, slot9 in ipairs(slot0.model) do
				if slot9.wMatchID == slot0._data.wMatchID then
					slot13 = 1

					table.remove(slot11, slot4)

					break
				end
			end

			slot8 = false

			slot0.btn_enroll.setVisible(slot6, slot0.btn_enroll)

			slot8 = false

			slot0.btn_enter.setVisible(slot6, slot0.btn_enter)

			slot8 = true

			slot0.Text_stateTips.setVisible(slot6, slot0.Text_stateTips)

			slot8 = "比赛已开始"

			slot0.Text_stateTips.setString(slot6, slot0.Text_stateTips)

			slot7 = slot0.model

			if slot0.model.getSelMatchData(slot6) and slot5.wMatchID == slot0._data.wMatchID then
				slot9 = 3

				slot0.model.setSelMatchState(slot7, slot0.model)
			end

			slot0.matchState = 3
		end
	elseif slot2 <= slot0._data.dwRegistrationEndTime then
		slot6 = false

		slot0.btn_enroll.setVisible(slot4, slot0.btn_enroll)

		slot6 = slot0._data.bJoin

		slot0.btn_enter.setVisible(slot4, slot0.btn_enter)

		slot6 = not slot0._data.bJoin

		slot0.Text_stateTips.setVisible(slot4, slot0.Text_stateTips)

		slot5 = slot0.Text_stateTips

		if slot0.Text_stateTips.isVisible(slot4) then
			slot6 = "未报名\n报名截止"

			slot0.Text_stateTips.setString(slot4, slot0.Text_stateTips)
		end

		slot5 = slot0.model

		if slot0.model.getSelMatchData(slot4) and slot3.wMatchID == slot0._data.wMatchID then
			slot7 = 2

			slot0.model.setSelMatchState(slot5, slot0.model)
		end

		slot0.matchState = 2
	elseif slot2 <= slot0._data.dwRegistrationStartTime and slot0._data.dwRegistrationEndTime < slot2 then
		slot6 = false

		slot0.btn_enter.setVisible(slot4, slot0.btn_enter)

		slot6 = not slot0._data.bJoin

		slot0.btn_enroll.setVisible(slot4, slot0.btn_enroll)

		slot6 = slot0._data.bJoin

		slot0.Text_stateTips.setVisible(slot4, slot0.Text_stateTips)

		slot5 = slot0.Text_stateTips

		if slot0.Text_stateTips.isVisible(slot4) then
			slot6 = "已报名\n等待开赛"

			slot0.Text_stateTips.setString(slot4, slot0.Text_stateTips)
		end

		slot5 = slot0.model

		if slot0.model.getSelMatchData(slot4) and slot3.wMatchID == slot0._data.wMatchID then
			slot7 = 1

			slot0.model.setSelMatchState(slot5, slot0.model)
		end

		slot0.matchState = 1
	elseif slot0._data.dwRegistrationStartTime < slot2 then
		slot6 = false

		slot0.btn_enroll.setVisible(slot4, slot0.btn_enroll)

		slot6 = false

		slot0.btn_enter.setVisible(slot4, slot0.btn_enter)

		slot6 = true

		slot0.Text_stateTips.setVisible(slot4, slot0.Text_stateTips)

		slot7 = slot0._data.StartTime - slot0._data.dwRegistrationStartTime
		slot7 = "%d"
		slot10 = tickMgr
		slot6 = ""

		if os.date(slot0.Text_stateTips, "%d") == os.date("%d", tickMgr.getTime(slot9)) then
			slot10 = 4
			slot6 = DateUtil.getDateString(slot8, slot3)
		else
			slot10 = 8
			slot6 = DateUtil.getDateString(slot8, slot3)
		end

		slot10 = slot6 .. "\n开始报名"

		slot0.Text_stateTips.setString(slot8, slot0.Text_stateTips)

		slot9 = slot0.model

		if slot0.model.getSelMatchData(slot8) and slot7.wMatchID == slot0._data.wMatchID then
			slot11 = -1

			slot0.model.setSelMatchState(slot9, slot0.model)
		end

		slot0.matchState = -1
	end

	slot5 = slot0.txt_reward
	slot10 = true

	slot0.txt_reward.setString(slot4, MathUtil.cookNumWithHansUnits(slot7, slot0._data.lTotalAward, 2))

	slot7 = true
	slot8 = true
	slot8 = slot3 .. "+" .. MathUtil.cookNumWithHansUnits(slot0._data.lRegistrationFee, slot0._data.lServiceFee, 2)

	slot0.txt_NeedMoney.setString(slot0._data.lServiceFee, slot0.txt_NeedMoney)
end

DzpkMatchItemCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btn_enroll then
		slot7 = slot0._data.wServerID

		slot0.controller.requestJoinMatch(slot4, slot0.controller, slot0._data.wMatchID)

		slot6 = slot0._data

		slot0.model.setSelMatchData(slot4, slot0.model)
	elseif slot1 == slot0.btn_enter then
		slot6 = slot0._data.wSortID
		slot7 = gameMgr.getRoomTypeBySortID(slot4, gameMgr)

		slot0.model.setGameType(gameMgr, slot0.model)

		slot7 = gameMgr.getRoomTypeBySortID(slot4, gameMgr)

		slot0.controller.requestEnterRoom(gameMgr, slot0.controller)
	end
end

DzpkMatchItemCcsView.onClick = function (slot0)
	if not slot0._data then
		return
	end

	slot4 = slot0._data

	slot0.model.setSelMatchData(slot2, slot0.model)

	slot3 = slot0.model

	if slot0.model.getSelMatchData(slot2) and slot1.wMatchID == slot0._data.wMatchID then
		slot5 = slot0.matchState

		slot0.model.setSelMatchState(slot3, slot0.model)
	end

	slot5 = true

	slot0.model.setIsShowingMatchInfo(slot3, slot0.model)
end

DzpkMatchItemCcsView.destroy = function (slot0)
	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
