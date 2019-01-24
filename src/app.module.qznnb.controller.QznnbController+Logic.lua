QZNNB_CONST = {
	MAX_COUNT = 5,
	OX_VALUE0 = 0,
	OX_FOURKING = 12,
	OX_FIVEKING = 13,
	OX_HULU = 14,
	OX_BOMB = 15
}
slot0 = {
	cbSignedCount = 0,
	cbFourCount = 0,
	cbDoubleCount = 0,
	cbThreeCount = 0,
	cbFourLogicVolue = {},
	cbThreeLogicVolue = {},
	cbDoubleLogicVolue = {},
	cbSignedLogicVolue = {},
	cbFourCardData = {},
	cbThreeCardData = {},
	cbDoubleCardData = {},
	cbSignedCardData = {}
}

QznnbController.analysebCardData = function (slot0, slot1, slot2)
	slot3 = TableUtil.copyDataDep(slot0)

	slot0:sortCardList(slot1)

	slot4 = 1

	for slot8 = 1, slot2, 1 do
		if slot4 <= slot8 then
			slot9 = 1

			if slot0:getCardValue(slot1[slot8]) <= 0 then
				return false
			end

			for slot14 = slot8 + 1, slot2, 1 do
				if slot0:getCardValue(slot1[slot14]) == slot10 then
					slot9 = slot9 + 1
				end
			end

			if slot9 == 1 then
				slot3.cbSignedCount = slot3.cbSignedCount + 1
				slot3.cbSignedCardData[(slot3.cbSignedCount - 1) * slot9 + 1] = slot1[slot8]
			elseif slot9 == 2 then
				slot3.cbDoubleCount = slot3.cbDoubleCount + 1
				slot3.cbDoubleCardData[(slot3.cbDoubleCount - 1) * slot9 + 1] = slot1[slot8]
				slot3.cbDoubleCardData[(slot3.cbDoubleCount - 1) * slot9 + 2] = slot1[slot8 + 1]
			elseif slot9 == 3 then
				slot3.cbThreeCount = slot3.cbThreeCount + 1
				slot3.cbThreeCardData[(slot3.cbThreeCount - 1) * slot9 + 1] = slot1[slot8]
				slot3.cbThreeCardData[(slot3.cbThreeCount - 1) * slot9 + 2] = slot1[slot8 + 1]
				slot3.cbThreeCardData[(slot3.cbThreeCount - 1) * slot9 + 3] = slot1[slot8 + 2]
			elseif slot9 == 4 then
				slot3.cbFourCount = slot3.cbFourCount + 1
				slot3.cbFourCardData[(slot3.cbFourCount - 1) * slot9 + 1] = slot1[slot8]
				slot3.cbFourCardData[(slot3.cbFourCount - 1) * slot9 + 2] = slot1[slot8 + 1]
				slot3.cbFourCardData[(slot3.cbFourCount - 1) * slot9 + 3] = slot1[slot8 + 2]
				slot3.cbFourCardData[(slot3.cbFourCount - 1) * slot9 + 4] = slot1[slot8 + 3]
			end

			slot4 = slot4 + slot9
		end
	end

	return true, slot3
end

QznnbController.getCardType = function (slot0, slot1, slot2)
	if slot2 ~= QZNNB_CONST.MAX_COUNT then
		return
	end

	slot3, slot4 = slot0:analysebCardData(slot1, slot2)

	slot0:sortCardList(slot1, slot2)

	if slot3 then
		if slot4.cbFourCount == 1 then
			slot1[1] = slot4.cbFourCardData[1]
			slot1[2] = slot4.cbFourCardData[2]
			slot1[3] = slot4.cbFourCardData[3]
			slot1[4] = slot4.cbFourCardData[4]
			slot1[5] = slot4.cbSignedCardData[1]

			return QZNNB_CONST.OX_BOMB
		elseif slot4.cbThreeCount == 1 and slot4.cbDoubleCount == 1 then
			slot1[1] = slot4.cbThreeCardData[1]
			slot1[2] = slot4.cbThreeCardData[2]
			slot1[3] = slot4.cbThreeCardData[3]
			slot1[4] = slot4.cbDoubleCardData[1]
			slot1[5] = slot4.cbDoubleCardData[2]

			return QZNNB_CONST.OX_HULU
		end
	end

	slot5 = 0
	slot6 = 0

	for slot10 = 1, slot2, 1 do
		if slot0:getCardValue(slot1[slot10]) > 10 then
			slot5 = slot5 + 1
		end
	end

	if slot5 == QZNNB_CONST.MAX_COUNT then
		return QZNNB_CONST.OX_FIVEKING
	end

	slot7 = {}
	slot8 = 0

	for slot12 = 1, slot2, 1 do
		slot7[slot12] = slot0:getCardLogicValue(slot1[slot12])
		slot8 = slot8 + slot7[slot12]
	end

	for slot12 = 1, slot2 - 1, 1 do
		for slot16 = slot12 + 1, slot2, 1 do
			if (slot8 - slot7[slot12] - slot7[slot16]) % 10 == 0 then
				slot0:getOxCard(slot1, #slot1)

				return (slot7[slot12] + slot7[slot16] > 10 and (slot7[slot12] + slot7[slot16]) - 10) or slot7[slot12] + slot7[slot16]
			end
		end
	end

	return QZNNB_CONST.OX_VALUE0
end

QznnbController.getTimes = function (slot0, slot1, slot2)
	if slot2 ~= QZNNB_CONST.MAX_COUNT then
		return 0
	end

	return slot0:getTimesByCardType(slot0:getCardType(slot1, slot2))
end

QznnbController.getTimesByCardType = function (slot0, slot1)
	if slot1 == QZNNB_CONST.OX_BOMB then
		return 5
	elseif slot1 == QZNNB_CONST.OX_HULU then
		return 5
	elseif slot1 == QZNNB_CONST.OX_FIVEKING then
		return 5
	elseif slot1 == 10 then
		return 5
	elseif slot1 == 9 then
		return 4
	elseif slot1 == 8 then
		return 3
	elseif slot1 == 7 then
		return 2
	else
		return 1
	end
end

QznnbController.getOxCard = function (slot0, slot1, slot2)
	assert(slot2 == QZNNB_CONST.MAX_COUNT)

	slot3 = {}
	slot4 = {}
	slot4 = TableUtil.copyDataDep(slot1)
	slot5 = 0

	for slot9 = 1, slot2, 1 do
		slot3[slot9] = slot0:getCardLogicValue(slot1[slot9])
		slot5 = slot5 + slot3[slot9]
	end

	for slot9 = 1, slot2 - 1, 1 do
		for slot13 = slot9 + 1, slot2, 1 do
			if (slot5 - slot3[slot9] - slot3[slot13]) % 10 == 0 then
				slot14 = 1

				for slot18 = 1, slot2, 1 do
					if slot18 ~= slot9 and slot18 ~= slot13 then
						slot1[slot14] = slot4[slot18]
						slot14 = slot14 + 1
					end
				end

				assert(slot14 == 4)

				slot1[slot14] = slot4[slot9]
				slot1[slot14 + 1] = slot4[slot13]

				return true
			end
		end
	end

	if slot0:getCardType(slot1, slot2) > 0 then
		return true
	else
		return false
	end
end

QznnbController.isIntValue = function (slot0, slot1, slot2)
	return
end

QznnbController.sortCardList = function (slot0, slot1, slot2)
	table.sort(slot1, function (slot0, slot1)
		slot4 = slot0:getCardColor(slot0)
		slot5 = slot0:getCardColor(slot1)

		if slot0:getCardValue(slot0) == slot0:getCardValue(slot1) then
			return slot5 < slot4
		else
			return slot3 < slot2
		end
	end)
end

QznnbController.randCardList = function (slot0, slot1, slot2)
	return
end

QznnbController.getCardLogicValue = function (slot0, slot1)
	return (bit.band(slot1, LOGIC_MASK_VALUE) > 10 and 10) or slot2
end

QznnbController.compareCard = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if slot4 ~= slot5 then
		return slot4
	end

	if slot0:getCardType(slot1, slot3) ~= slot0:getCardType(slot2, slot3) then
		return slot6 < slot7
	end

	if slot7 == QZNNB_CONST.OX_BOMB then
		slot8, slot9 = slot0:analysebCardData(slot1, slot3)
		slot10, slot11 = slot0:analysebCardData(slot1, slot3)

		return slot0:getCardValue(slot11.cbFourCardData[0]) < slot0:getCardValue(slot9.cbFourCardData[0])
	elseif slot7 == QZNNB_CONST.OX_HULU then
		slot8, slot9 = slot0:analysebCardData(slot1, slot3)
		slot10, slot11 = slot0:analysebCardData(slot1, slot3)

		return slot0:getCardValue(slot11.cbThreeCardData[0]) < slot0:getCardValue(slot9.cbThreeCardData[0])
	end

	slot0:sortCardList(slot8, slot3)
	slot0:sortCardList(slot9, slot3)

	if slot0:getCardValue(TableUtil.copyDataDep(slot2)[0]) ~= slot0:getCardValue(TableUtil.copyDataDep(slot1)[0]) then
		return slot10 < slot11
	end

	return slot0:getCardColor(slot9[0]) < slot0:getCardColor(slot8[0])
end

QznnbController.getCardLogicValue = function (slot0, slot1)
	return (bit.band(slot1, LOGIC_MASK_VALUE) > 10 and 10) or slot2
end

QznnbController.getCardValue = function (slot0, slot1)
	return bit.band(slot1, LOGIC_MASK_VALUE)
end

QznnbController.getCardColor = function (slot0, slot1)
	return bit.rshift(bit.band(slot1, LOGIC_MASK_COLOR), 4)
end

return
