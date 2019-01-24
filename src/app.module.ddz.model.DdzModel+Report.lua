DdzModel.initReportModel = function (slot0)
	slot13 = slot0.onReportRawDataChanged

	createSetterGetter(slot2, slot0, "reportRawData", nil, true, nil, nil, handler(slot11, slot0))

	slot7 = true

	createSetterGetter(slot2, slot0, "reportUsersInfoDic", {}, true)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingReportMark", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingReportJuBao", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingReportCode", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingReportMenu", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "reportDatas", {})

	slot5 = {}

	createSetterGetter(slot2, slot0, "reportStepDatasDic")

	slot6 = true

	createSetterGetter(slot2, slot0, "reportResult", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingReportLose", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingReportWin", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingReportOutLose", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingReportOutWin", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "curViewChairId", 0)

	slot9 = true

	createSetterGetter(slot2, slot0, "curIdx", -1, true, false, false)

	slot6 = true

	createSetterGetter(slot2, slot0, "bankerViewChairId", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "startReplay", false)

	slot5 = {}

	createSetterGetter(slot2, slot0, "winnerDic")

	slot5 = nil

	createSetterGetter(slot2, slot0, "curReportCode")

	slot0._timeIdx2BctConfig = {
		[0] = BCT_SINGLE,
		BCT_SINGLE_KING,
		BCT_DOUBLE,
		BCT_THREE,
		BCT_DOUBLE_KING,
		BCT_LINE,
		BCT_SAME_COLOR,
		BCT_SAME_LINE
	}
	slot0._bct2BeishuConfig = {
		[BCT_SINGLE] = 0,
		[BCT_LINE] = 3,
		[BCT_SAME_COLOR] = 3,
		[BCT_DOUBLE] = 2,
		[BCT_THREE] = 5,
		[BCT_SINGLE_KING] = 2,
		[BCT_DOUBLE_KING] = 5,
		[BCT_SAME_LINE] = 5
	}
	slot0._reportIncludeMySelf = false
	slot0._reportTickTime = 1000
end

DdzModel.getBeiShuByTimeIdx = function (slot0, slot1)
	slot5 = slot1

	return slot0._bct2BeishuConfig[slot0.getBctByTimeIdx(slot3, slot0)]
end

DdzModel.onReportRawDataChanged = function (slot0)
	slot0._reportStepDatas = nil
	slot0._reportIncludeMySelf = false
	slot0._myChairId = nil
	slot0._winnerArr = {}
	slot0._reportUsersInfoDic = {}
	slot0._reportStepDatasDic = {}
	slot0._reportStepDatas = {}
	slot0._winnerDic = {}

	if slot0._reportRawData then
		slot3 = slot0._reportRawData.userinfo

		for slot4, slot5 in ipairs(slot2) do
			slot9 = Hero

			if slot5.gameid == Hero.getDwGameID(slot8) then
				slot0._reportIncludeMySelf = true
				slot0._myChairId = slot5.chairid

				break
			end
		end

		if slot0._myChairId == nil then
			slot0._myChairId = 0
		end

		if slot0._reportIncludeMySelf then
			slot3 = slot0._reportRawData.userinfo

			for slot4, slot5 in ipairs(slot2) do
				slot11 = slot0._myChairId
				slot0._reportUsersInfoDic[gameMgr.switchViewChairID(slot7, gameMgr, slot5.chairid, 3)] = slot5

				if slot5.chairid == slot0._reportRawData.dzicon then
					slot0._bankerViewChairId = slot6
				end
			end
		else
			slot3 = slot0._reportRawData.userinfo

			for slot4, slot5 in ipairs(slot2) do
				slot0._reportUsersInfoDic[slot5.chairid + 1] = slot5

				if slot5.chairid == slot0._reportRawData.dzicon then
					slot0._bankerViewChairId = slot5.chairid + 1
				end
			end
		end

		slot1 = 0
		slot4 = slot0._reportRawData.step

		for slot5, slot6 in ipairs(slot3) do

			-- Decompilation error in this vicinity:
			slot0._reportStepDatasDic[slot6.idx] = slot6

			if slot1 == 2 and slot6.outcard ~= nil then
				slot9 = slot6.outcard

				if table.nums(slot8) > 0 then
					slot10 = slot6.idx

					table.insert(slot8, slot0._winnerArr)

					slot0._winnerDic[slot6.idx] = true
				end
			end

			slot9 = slot6.outcard
			slot1 = (table.nums(slot8) == 0 and slot1 + 1) or 0
		end

		slot4 = slot0

		slot0.initReportViewChairIdDic(slot3)

		slot0._curViewChairId = slot0._bankerViewChairId
		slot0._reportStepDatas = slot0._reportRawData.step
		slot5 = slot0._reportRawData.result

		slot0.setReportResult(slot3, slot0)
	end
end

DdzModel.initReportViewChairIdDic = function (slot0)
	slot0._viewChairIdDic = {}
	slot0._chairIdDic = {}

	if slot0._reportIncludeMySelf then
		for slot4 = 0, 2, 1 do
			slot10 = slot0._myChairId
			slot0._viewChairIdDic[gameMgr.switchViewChairID(slot6, gameMgr, slot4, 3)] = slot4
			slot0._chairIdDic[slot4] = gameMgr.switchViewChairID(slot6, gameMgr, slot4, 3)
		end
	else
		for slot4 = 0, 2, 1 do
			slot0._viewChairIdDic[slot4 + 1] = slot4
			slot0._chairIdDic[slot4] = slot4 + 1
		end
	end
end

DdzModel.getBctByTimeIdx = function (slot0, slot1)
	return slot0._timeIdx2BctConfig[slot1]
end

return
