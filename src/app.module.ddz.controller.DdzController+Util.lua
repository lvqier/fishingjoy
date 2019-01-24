DdzController.recentTurnIsOutCard = function (slot0)
	return slot0.model._recentTurnUser == slot0.model._recentOutCardUser
end

DdzController.isTurnWinner = function (slot0, slot1)
	return slot0.model._recentOutCardUser == nil or slot0.model._recentOutCardUser == (slot1 or DDZ_VIEW_CHAIRID_ME)
end

DdzController.isFirstHand = function (slot0, slot1)
	slot1 = slot1 or DDZ_VIEW_CHAIRID_ME

	if slot0.model._recentOutCardUser == nil then
		slot4 = slot0.model

		return slot0.model.getCurrentUser(slot3) == slot1
	else
		return false
	end
end

DdzController.isRoundWinner = function (slot0, slot1)
	slot1 = slot1 or DDZ_VIEW_CHAIRID_ME
	slot4 = slot0.model

	if slot0.model.getWinnerViewIds(slot3) then
		slot5 = slot2

		for slot6, slot7 in pairs(slot4) do
			if slot7 == slot1 then
				return true
			end
		end
	end

	return false
end

DdzController.isNonOutCard = function (slot0)
	return slot0.model._recentOutCardUser == nil
end

DdzController.isAutoState = function (slot0, slot1)
	slot1 = slot1 or DDZ_VIEW_CHAIRID_ME
	slot4 = slot0.model

	if slot0.model.getAutoDic(slot3) then
		slot4 = slot0.model
		slot2 = slot0.model.getAutoDic(slot3)[slot1]
	end

	return slot2
end

DdzController.calTableCount = function (slot0, slot1)
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

DdzController.getMyCardIndex = function (slot0, slot1)
	slot4 = slot0.model

	if slot0.model.getMyCardsIndexDic(slot3) then
		slot4 = slot0.model

		return slot0.model.getMyCardsIndexDic(slot3)[slot1]
	else
		return nil
	end
end

DdzController.filterMinCountDic = function (slot0, slot1)
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

DdzController.filterMinValueDic = function (slot0, slot1)
	slot2 = 100
	slot5 = slot1

	for slot6, slot7 in pairs(slot4) do
		if slot6 < slot2 then
			slot2 = slot6
		end
	end

	return slot1[slot2]
end

DdzController.convertDetailToCv = function (slot0, slot1)
	if slot1 == 1 or slot1 == 2 then
		slot1 = slot1 + 13
	elseif slot1 == 14 or slot1 == 15 then
		slot1 = slot1 + 2
	end

	return slot1
end

DdzController.switchViewId = function (slot0, slot1)
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
