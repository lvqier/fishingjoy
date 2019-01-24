PdkController.findCommon = function (slot0, slot1, slot2, slot3)
	slot4 = {}
	slot7 = slot1

	for slot8, slot9 in pairs(slot6) do
		if slot2 < slot8 then
			slot12 = slot9

			if slot3 <= table.nums(slot11) then
				slot4[slot8] = slot9
			end
		end
	end

	slot8 = slot4

	return slot0.model.nilEmptyTable(slot6, slot0.model)
end

PdkController.findSingle = function (slot0, slot1, slot2)
	slot8 = 1

	return slot0.findCommon(slot4, slot0, slot1, slot2)
end

PdkController.findPair = function (slot0, slot1, slot2)
	slot8 = 2

	return slot0.findCommon(slot4, slot0, slot1, slot2)
end

PdkController.findBoom = function (slot0, slot1, slot2)
	slot8 = 4

	return slot0.findCommon(slot4, slot0, slot1, slot2)
end

PdkController.findThree = function (slot0, slot1, slot2)
	slot8 = 3

	return slot0.findCommon(slot4, slot0, slot1, slot2)
end

PdkController.findStraight = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	slot7 = slot1
	slot7 = slot0.convertDicKeyToArr(slot5, slot0)
	slot6 = {}
	slot7 = {}
	slot8 = 1
	slot12 = slot7
	slot13 = slot6

	return slot0.model.nilEmptyTable(slot10, slot0.model), slot0.model.nilEmptyTable(slot0.model, slot0.model)
end

PdkController.findPairStraight = function (slot0, slot1, slot2, slot3)
	slot8 = slot2

	if slot0.findPair(slot5, slot0, slot1) then
		slot10 = slot3

		return slot0.findStraight(slot6, slot0, slot4, slot2)
	end

	return nil
end

PdkController.findThreeTakeTwo = function (slot0, slot1, slot2)
	slot7 = slot2
	slot8 = 0

	return slot0.findThree(slot4, slot0, slot1), slot0:findSingle(slot0, slot1)
end

PdkController.findPlaneTakeDoubleWing = function (slot0, slot1, slot2, slot3)
	slot8 = slot2

	if slot0.findThree(slot5, slot0, slot1) then
		slot10 = slot3
		slot10 = 0

		return slot0.findStraight(slot6, slot0, slot4, slot2), slot0:findPair(slot0, slot1)
	end

	return nil, nil
end

PdkController.findCanFollowCard = function (slot0, slot1, slot2)
	if not slot2 then
		slot5 = slot0.model
		slot2 = slot0.model.getOutCardInfo(slot4)
	end

	if not slot1 then
		slot5 = slot0.model
		slot1 = slot0.model.getMyCards(slot4)
	end

	slot3 = {}
	slot4, slot5, slot6 = nil
	slot10 = slot1
	slot7 = slot0.model.convertArrToDic(slot8, slot0.model)
	slot9 = slot2.dot
	slot10 = slot2.st

	if slot2.ct == PDK_CT_SINGLE then
		slot15 = slot9
		slot4 = slot0.findSingle(slot12, slot0, slot7)
	elseif slot8 == PDK_CT_DOUBLE then
		slot15 = slot9
		slot4 = slot0.findPair(slot12, slot0, slot7)
	elseif slot8 == PDK_CT_SINGLE_LINE then
		slot16 = slot10
		slot4 = slot0.findStraight(slot12, slot0, slot7, slot9)
	elseif slot8 == PDK_CT_DOUBLE_LINE then
		slot16 = slot10
		slot4 = slot0.findPairStraight(slot12, slot0, slot7, slot9)
	elseif slot8 == PDK_CT_THREE_TAKE_TWO then
		slot15 = slot9
		slot4, slot6 = slot0.findThreeTakeTwo(slot12, slot0, slot7)
	elseif slot8 == PDK_CT_PLANE_TAKE_PAIR_WING then
		slot16 = slot10
		slot4, slot6 = slot0.findPlaneTakeDoubleWing(slot12, slot0, slot7, slot9)
	elseif slot8 == PDK_CT_BOMB_CARD then
		slot15 = slot9
		slot4 = slot0.findBoom(slot12, slot0, slot7)
	end

	slot15 = 0
	slot5 = slot0.findBoom(slot12, slot0, slot7)

	if slot8 == PDK_CT_BOMB_CARD then
		slot14 = {
			boomDic = slot4
		}

		return slot0.model.nilEmptyTable(slot12, slot0.model)
	elseif slot4 == nil and slot5 == nil then
		return nil
	end

	slot14 = slot4
	slot14 = slot6
	slot6 = slot0.filterBoomDic(slot12, slot0)

	if slot0.filterBoomDic(slot12, slot0) == nil then
		return {
			boomDic = slot5
		}
	end

	if slot8 == PDK_CT_SINGLE or slot8 == PDK_CT_DOUBLE then
		slot14 = slot4

		return {
			ctDic = slot0.filterMinCountDic(slot12, slot0),
			boomDic = slot5
		}
	end

	if slot8 == PDK_CT_SINGLE_LINE or slot8 == PDK_CT_DOUBLE_LINE then
		return {
			ctDic = slot4,
			boomDic = slot5
		}
	end

	if slot6 == nil then
		return {
			boomDic = slot5
		}
	end

	if slot8 == PDK_CT_PLANE_TAKE_PAIR_WING then
		slot16 = slot10
		slot4 = slot0.findPlaneTakeDoubleWing(slot12, slot0, slot4, slot9)
	end

	if slot4 == nil then
		return {
			boomDic = slot5
		}
	end

	slot15 = slot4
	slot15 = slot0.filterBbDicInAaDic(slot12, slot0, slot6)

	if slot0:calTableCount(slot0) >= slot10 * 2 then
		slot15 = slot11
		slot16 = slot0.filterMinCountDic(slot13, slot0)

		if slot0:calTableCount(slot0) >= slot10 * 2 then
			slot11 = slot12
		end
	else
		slot16 = slot11

		if (table.nums(slot13) - slot10) * 3 + slot0.calTableCount(slot4, slot0) < slot10 * 2 then
			slot12 = false
		else
			slot12 = true
		end

		if slot12 then
			slot11 = slot6
		else
			return {
				boomDic = slot5
			}
		end
	end

	return {
		ctDic = slot4,
		boomDic = slot5,
		bbDic = slot11
	}
end

PdkController.findCanOutCard = function (slot0)
	slot5 = slot0.model.getMyCards(slot2)
	slot7 = 0
	slot7 = slot0.model.convertArrToDic(slot0.model, slot0.model)
	slot7 = {
		ctDic = slot0:filterBoomDic(slot0),
		boomDic = slot0.findBoom(slot0.model, slot0, slot2)
	}

	return slot0.model.nilEmptyTable(slot0, slot0.model)
end

return
