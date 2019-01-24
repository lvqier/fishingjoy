PdkController.filterMinCountDic = function (slot0, slot1)
	if slot1 ~= nil then
		slot4 = slot1

		if table.nums(slot3) ~= 0 then
			slot2 = {}
			slot3 = 100
			slot6 = slot1

			for slot7, slot8 in pairs(slot5) do
				slot11 = slot8

				if table.nums(slot10) < slot3 then
					slot11 = slot8
					slot3 = table.nums(slot10)
				end
			end

			slot6 = slot1

			for slot7, slot8 in pairs(slot5) do
				slot11 = slot8

				if table.nums(slot10) <= slot3 then
					slot2[slot7] = slot1[slot7]
				end
			end

			return slot2
		end
	else
		return nil
	end
end

PdkController.filterMinValueDic = function (slot0, slot1)
	slot2 = 100
	slot5 = slot1

	for slot6, slot7 in pairs(slot4) do
		if slot6 < slot2 then
			slot2 = slot6
		end
	end

	return slot1[slot2]
end

PdkController.filterBbDicInAaDic = function (slot0, slot1, slot2)
	slot3 = TableUtil.copyData(slot4)
	slot6 = slot2

	for slot7, slot8 in pairs(slot1) do
		if slot3[slot7] then
			slot3[slot7] = nil
		end
	end

	return slot3
end

PdkController.filterBoomDic = function (slot0, slot1)
	if slot1 ~= nil then
		slot4 = slot1

		if table.nums(slot3) ~= 0 then
			slot5 = TableUtil.copyData(slot3)

			for slot6, slot7 in pairs(slot1) do
				slot10 = slot7

				if table.nums(slot9) == 4 then
					slot2[slot6] = nil
				end
			end

			slot6 = slot2

			return slot0.model.nilEmptyTable(slot4, slot0.model)
		end
	else
		return nil
	end
end

PdkController.convertDicKeyToArr = function (slot0, slot1)
	slot2 = {}
	slot5 = slot1

	for slot6, slot7 in pairs(slot4) do
		slot11 = slot6

		table.insert(slot9, slot2)
	end

	function slot6(slot0, slot1)
		return slot0 < slot1
	end

	table.sort(slot4, slot2)

	return slot2
end

PdkController.recentTurnIsOutCard = function (slot0)
	return slot0.model._recentTurnUser == slot0.model._recentOutCardUser
end

PdkController.isLongAnimateCt = function (slot0, slot1)
	return PDK_CT_THREE_LINE == slot1 or PDK_CT_PLANE_TAKE_SINGLE_WING == slot1 or PDK_CT_PLANE_TAKE_PAIR_WING == slot1 or PDK_CT_BOMB_CARD == slot1
end

PdkController.isRoundWinner = function (slot0, slot1)
	slot1 = slot1 or PDK_VIEW_CHAIRID_ME
	slot4 = slot0.model

	if slot0.model.getWinnerViewId(slot3) then
		slot5 = slot2

		for slot6, slot7 in pairs(slot4) do
			if slot7 == slot1 then
				return true
			end
		end
	end

	return false
end

PdkController.isTurnWinner = function (slot0, slot1)
	if slot0.model._recentOutCardUser == (slot1 or PDK_VIEW_CHAIRID_ME) then
		slot4 = slot0.model

		return slot0.model.getCurrentUser(slot3) == slot1
	else
		return false
	end
end

PdkController.isFirstHand = function (slot0, slot1)
	slot1 = slot1 or PDK_VIEW_CHAIRID_ME

	if slot0.model._recentOutCardUser == nil then
		slot4 = slot0.model

		return slot0.model.getCurrentUser(slot3) == slot1
	else
		return false
	end
end

PdkController.isNonOutCard = function (slot0)
	return slot0.model._recentOutCardUser == nil
end

PdkController.isAutoState = function (slot0, slot1)
	slot1 = slot1 or PDK_VIEW_CHAIRID_ME
	slot4 = slot0.model

	if slot0.model.getAutoDic(slot3) then
		slot4 = slot0.model
		slot2 = slot0.model.getAutoDic(slot3)[slot1]
	end

	return slot2
end

PdkController.calTableCount = function (slot0, slot1)
	if slot1 ~= nil then
		slot2 = 0
		slot5 = slot1

		for slot6, slot7 in pairs(slot4) do
			slot10 = slot7
			slot2 = slot2 + table.nums(slot9)
		end

		return slot2
	else
		return 0
	end
end

PdkController.getMyCardIndex = function (slot0, slot1)
	slot4 = slot0.model

	if slot0.model.getMyCardsIndexDic(slot3) then
		slot4 = slot0.model

		return slot0.model.getMyCardsIndexDic(slot3)[slot1]
	else
		return nil
	end
end

PdkController.switchViewId = function (slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1

	if slot1 ~= INVALID_WORD then
		slot6 = slot1
		slot2 = gameMgr.switchViewChairID(slot4, gameMgr)
	end

	return slot2
end

return
