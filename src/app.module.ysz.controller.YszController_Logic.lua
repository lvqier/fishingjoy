YszController.MAX_COUNT = 3
YszController.DRAW = 2
YszController.LOGIC_MASK_COLOR = 240
YszController.LOGIC_MASK_VALUE = 15
YszController.CT_SINGLE = 1
YszController.CT_DOUBLE = 2
YszController.CT_SHUN_ZI = 3
YszController.CT_JIN_HUA = 4
YszController.CT_SHUN_JIN = 5
YszController.CT_BAO_ZI = 6
YszController.CT_SPECIAL = 7
YszController.m_cbCardListData = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	12,
	13,
	17,
	18,
	19,
	20,
	21,
	22,
	23,
	24,
	25,
	26,
	27,
	28,
	29,
	33,
	34,
	35,
	36,
	37,
	38,
	39,
	40,
	41,
	42,
	43,
	44,
	45,
	49,
	50,
	51,
	52,
	53,
	54,
	55,
	56,
	57,
	58,
	59,
	60,
	61
}

YszController.GetCardType = function (slot0, slot1)
	if slot1 == nil then
		return YszController.CT_SINGLE
	end

	slot2 = {}
	slot3 = {}
	slot4 = 0
	slot5 = false

	for slot9 = 1, 3, 1 do
		slot13 = slot1[slot9]
		slot2[slot9] = gameMgr.getCardValue(slot11, gameMgr)
		slot13 = slot1[slot9]
		slot3[slot9] = gameMgr.getCardColor(slot11, gameMgr)
	end

	function slot9(slot0, slot1)
		return slot0 < slot1
	end

	table.sort(slot7, slot2)

	slot9 = "_value:"

	dump(slot7, slot2)

	if slot3[1] == slot3[2] and slot3[2] == slot3[3] then
		slot5 = true
	end

	for slot9 = 1, #slot2 - 1, 1 do
		for slot13 = slot9 + 1, #slot2, 1 do
			if slot2[slot9] == slot2[slot13] then
				slot4 = slot4 + 1
			end
		end
	end

	if slot4 == 3 then
		return YszController.CT_BAO_ZI
	end

	if (slot2[3] - slot2[2] == 1 and slot2[2] - slot2[1] == 1) or (slot2[1] == 1 and slot2[2] == 12 and slot2[3] == 13) then
		if slot5 == true then
			return YszController.CT_SHUN_JIN
		else
			return YszController.CT_SHUN_ZI
		end
	elseif slot5 == true then
		return YszController.CT_JIN_HUA
	elseif slot4 == 1 then
		return YszController.CT_DOUBLE
	end

	if slot2[1] == 2 and slot2[2] == 3 and slot2[3] == 5 then
		return YszController.CT_SPECIAL
	end

	return YszController.CT_SINGLE
end

YszController.getIScore = function (slot0, slot1)
	slot3 = {}
	slot4 = {}
	slot5 = ""
	slot6 = 0
	slot7 = 0
	slot8 = 0

	if slot1 >= 100000000 then
		if slot2 % 100000000 ~= 0 then
			slot12 = 0
			slot14 = HtmlUtil.getPreciseDecimal(slot10, slot2 / 100000000)
			slot7 = string.len(string.format(2, "%d"))

			if HtmlUtil.getPreciseDecimal(slot10, slot2 / 100000000) - HtmlUtil.getPreciseDecimal(slot10, slot2 / 100000000) > 0.01 then
				if slot7 >= 4 then
					slot12 = slot6
					slot5 = string.format(slot10, "%.0f")
				elseif slot7 >= 3 then
					slot12 = 1
					slot5 = HtmlUtil.getPreciseDecimal(slot10, slot1 / 100000000)
				elseif slot7 < 3 then
					slot12 = 2
					slot5 = HtmlUtil.getPreciseDecimal(slot10, slot1 / 100000000)
				end
			else
				slot12 = slot6
				slot5 = string.format(slot10, "%.0f")
			end
		else
			slot12 = slot2 / 100000000
			slot5 = string.format(slot10, "%.0f")
		end

		slot12 = "亿"

		table.insert(slot10, slot3)
	elseif slot2 >= 100000 then
		slot9 = slot2

		if slot2 % 10000 ~= 0 then
			slot13 = 0
			slot15 = HtmlUtil.getPreciseDecimal(slot11, slot2 / 10000)
			slot7 = string.len(string.format(2, "%d"))

			if HtmlUtil.getPreciseDecimal(slot11, slot2 / 10000) - HtmlUtil.getPreciseDecimal(slot11, slot2 / 10000) >= 0.01 then
				if slot7 >= 4 then
					slot13 = slot6
					slot5 = string.format(slot11, "%.0f")
				elseif slot7 >= 3 then
					slot13 = 1
					slot5 = HtmlUtil.getPreciseDecimal(slot11, slot1 / 10000)
				elseif slot7 < 3 then
					slot13 = 2
					slot5 = HtmlUtil.getPreciseDecimal(slot11, slot1 / 10000)
				end
			else
				slot13 = slot6
				slot5 = string.format(slot11, "%.0f")
			end
		else
			slot13 = slot2 / 10000
			slot5 = string.format(slot11, "%.0f")
		end

		slot13 = "万"

		table.insert(slot11, slot3)
	else
		slot12 = slot2
		slot5 = string.format(slot10, "%.0f")
	end

	slot12 = slot5

	for slot12 = 1, #string.format(slot10, "%s"), 1 do
		slot17 = slot12

		if string.sub(slot14, slot5, slot12) == "." then
			slot4[slot12] = "."
		else
			slot17 = slot12
			slot4[slot12] = string.sub(slot14, slot5, slot12)
		end
	end

	for slot12 = 1, #slot3, 1 do
		slot5 = slot5 .. slot3[slot12]

		if slot3[slot12] == "万" then
			slot16 = "w"

			table.insert(slot14, slot4)
		elseif slot3[slot12] == "亿" then
			slot16 = "y"

			table.insert(slot14, slot4)
		end
	end

	return slot5, slot4
end

return
