DzpkController.MAX_COUNT = 7
DzpkController.DRAW = 2
DzpkController.LOGIC_MASK_COLOR = 240
DzpkController.LOGIC_MASK_VALUE = 15
DzpkController.CT_HJTHS = 1
DzpkController.CT_THS = 2
DzpkController.CT_JGP = 3
DzpkController.CT_HLP = 4
DzpkController.CT_THP = 5
DzpkController.CT_SHUN_ZI = 6
DzpkController.CT_STP = 7
DzpkController.CT_LDP = 8
DzpkController.CT_DUIZI = 9
DzpkController.CT_SINGLE = 10
DzpkController.cardTypeName = {
	"皇家同花顺",
	"同花顺",
	"金刚",
	"葫芦",
	"同花",
	"顺子",
	"三条",
	"两对",
	"对子",
	"高牌"
}
DzpkController.m_cbCardListData = {
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

DzpkController.getCardType = function (slot0, slot1)
	slot2 = {}

	if #slot1 <= 5 then
		slot7 = slot1
		slot7 = {
			type = slot0.getCardTypeOne(slot5, slot0),
			data = slot1
		}

		table.insert(slot5, slot2)
	elseif #slot1 > 5 then
		for slot6 = 1, #slot1 - 4, 1 do
			for slot10 = slot6 + 1, #slot1 - 3, 1 do
				for slot14 = slot10 + 1, #slot1 - 2, 1 do
					for slot18 = slot14 + 1, #slot1 - 1, 1 do
						for slot22 = slot18 + 1, #slot1, 1 do
							slot27 = slot1[slot6]

							table.insert(slot25, slot23)

							slot27 = slot1[slot10]

							table.insert(slot25, slot23)

							slot27 = slot1[slot14]

							table.insert(slot25, slot23)

							slot27 = slot1[slot18]

							table.insert(slot25, slot23)

							slot27 = slot1[slot22]

							table.insert(slot25, {})

							slot28 = 
							slot28 = {
								type = slot0.getCardTypeOne(, slot0),
								data = 
							}

							table.insert(, slot2)
						end
					end
				end
			end
		end
	end

	if #slot2 > 0 then
		function slot6(slot0, slot1)
			return slot0.type < slot1.type
		end

		table.sort(slot4, slot2)

		return slot2[1].type, slot2[1].data
	end

	return DzpkController.CT_SINGLE
end

DzpkController.getCardTypeOne = function (slot0, slot1)
	if slot1 == nil then
		return DzpkController.CT_SINGLE
	end

	slot2 = {}
	slot3 = {}
	slot4 = false
	slot8 = slot1
	slot2, slot3 = slot0.handleCardData(slot6, slot0)

	function isSameColor()
		for slot3 = 1, #slot0, 1 do
			if slot0[1] ~= slot0[slot3] then
				return false
			end
		end

		return true
	end

	if #slot5 > 4 then
		slot9 = isSameColor()

		if slot0.isShunZi(slot6, slot0, slot2) ~= nil then
			return slot5
		end
	end

	slot8 = slot2

	if slot0.samValue(slot6, slot0) ~= nil then
		return slot5
	end

	return DzpkController.CT_SINGLE
end

DzpkController.getCardTypeName = function (slot0, slot1)
	return DzpkController.cardTypeName[slot1]
end

DzpkController.handleCardData = function (slot0, slot1)
	slot2 = {}
	slot3 = {}

	for slot7 = 1, DzpkController.MAX_COUNT, 1 do
		if slot1[slot7] ~= nil and slot1[slot7] ~= 0 then
			slot10 = slot2
			slot14 = slot1[slot7]

			table.insert(slot9, gameMgr.getCardValue(slot12, gameMgr))

			slot10 = slot3
			slot14 = slot1[slot7]

			table.insert(slot9, gameMgr.getCardColor(slot12, gameMgr))
		end
	end

	function slot7(slot0, slot1)
		return slot0 < slot1
	end

	table.sort(slot5, slot2)

	return slot2, slot3
end

DzpkController.samValue = function (slot0, slot1)
	slot2 = 0

	for slot6 = 1, #slot1 - 1, 1 do
		for slot10 = slot6 + 1, #slot1, 1 do
			if slot1[slot6] == slot1[slot10] and slot1[slot6] ~= 0 then
				slot2 = slot2 + 1
			end
		end
	end

	if slot2 == 6 then
		return DzpkController.CT_JGP
	elseif slot2 == 4 then
		return DzpkController.CT_HLP
	elseif slot2 == 3 then
		return DzpkController.CT_STP
	elseif slot2 == 2 then
		return DzpkController.CT_LDP
	elseif slot2 == 1 then
		return DzpkController.CT_DUIZI
	else
		return nil
	end
end

DzpkController.isShunZi = function (slot0, slot1, slot2)
	slot3 = true
	slot4 = false

	for slot8 = 1, #slot1 - 1, 1 do
		if slot1[slot8 + 1] - slot1[slot8] ~= 1 then
			slot3 = false
		end
	end

	if slot1[1] == 1 and slot1[2] == 10 and slot1[3] == 11 and slot1[4] == 12 and slot1[5] == 13 then
		slot3 = true
		slot4 = true
	end

	if slot3 then
		if slot2 then
			if slot4 then
				return DzpkController.CT_HJTHS
			else
				return DzpkController.CT_THS
			end
		else
			return DzpkController.CT_SHUN_ZI
		end
	elseif slot2 then
		return DzpkController.CT_THP
	end

	return nil
end

DzpkController.getNeedToShow = function (slot0, slot1, slot2)
	if slot1 == nil or #slot1 < 2 then
		return nil
	end

	if slot2 == DzpkController.CT_SINGLE then
		slot3 = {}
		slot4 = {}
		slot8 = slot1[1]
		slot9 = slot1[2]
		slot6 = gameMgr.getCardValue(gameMgr, gameMgr)

		if gameMgr.getCardValue(slot6, gameMgr) == 1 then
			slot10 = slot1[1]

			table.insert(slot8, slot3)
		elseif slot6 == 1 then
			slot10 = slot1[2]

			table.insert(slot8, slot3)
		elseif slot6 < slot5 then
			slot10 = slot1[1]

			table.insert(slot8, slot3)
		else
			slot10 = slot1[2]

			table.insert(slot8, slot3)
		end

		return slot3
	elseif slot2 == DzpkController.CT_DUIZI or slot2 == DzpkController.CT_JGP or slot2 == DzpkController.CT_STP then
		slot6 = slot1

		return slot0.getSamePuke(slot4, slot0)
	elseif slot2 == DzpkController.CT_LDP then
		slot6 = slot1
		slot4 = {}

		if slot0.getSamePuke(slot4, slot0) ~= nil and #slot3 > 4 then
			slot5 = {}

			for slot9 = 1, #slot3, 1 do
				if slot3[slot9] ~= nil then
					slot14 = slot3[slot9]
					slot14 = {
						data = slot3[slot9],
						v = gameMgr.getCardValue(slot12, gameMgr)
					}

					table.insert(slot12, slot5)
				end
			end

			if #slot5 > 0 then
				if #slot5 > 1 then
					function slot9(slot0, slot1)
						return slot1.v < slot0.v
					end

					table.sort(slot7, slot5)
				end

				if slot5[#slot5].v == 1 then
					slot9 = slot5[#slot5].data

					table.insert(slot7, slot4)

					slot9 = slot5[#slot5 - 1].data

					table.insert(slot7, slot4)

					for slot9 = 1, 2, 1 do
						if slot5[slot9] ~= nil then
							slot13 = slot5[slot9].data

							table.insert(slot11, slot4)
						end
					end
				else
					for slot9 = 1, 4, 1 do
						if slot5[slot9] ~= nil then
							slot13 = slot5[slot9].data

							table.insert(slot11, slot4)
						end
					end
				end
			end

			return slot4
		else
			return slot3
		end
	else
		return slot1
	end
end

DzpkController.getSamePuke = function (slot0, slot1)
	slot2 = {}
	slot3 = {}

	function justPushDir(slot0)
		if slot0 == nil then
			return
		end

		slot1 = false

		for slot5 = 1, #slot0, 1 do
			if slot0[slot5] ~= nil and slot0[slot5] == slot0 then
				slot1 = true
			end
		end

		if not slot1 then
			slot5 = slot0

			table.insert(slot3, slot0)
		end
	end

	for slot7 = 1, #slot1, 1 do
		slot10 = slot3
		slot14 = slot1[slot7]

		table.insert(slot9, gameMgr.getCardValue(slot12, gameMgr))
	end

	for slot7 = 1, #slot3 - 1, 1 do
		for slot11 = slot7 + 1, #slot3, 1 do
			if slot3[slot7] == slot3[slot11] and slot3[slot7] ~= 0 then
				slot14 = slot1[slot7]

				justPushDir(slot13)

				slot14 = slot1[slot11]

				justPushDir(slot13)
			end
		end
	end

	return slot2
end

DzpkController.getPukeMax = function (slot0, slot1, slot2)
	if slot2 == nil or #slot2 >= 5 or slot1 == nil then
		return nil
	end

	slot3 = {}
	slot4 = false
	slot5 = {}

	for slot9 = 1, #slot1, 1 do
		slot4 = false

		if slot1[slot9] ~= nil then
			for slot13 = 1, #slot2, 1 do
				if slot2[slot13] ~= nil and slot2[slot13] == slot1[slot9] then
					slot4 = true
				end
			end

			if not slot4 then
				slot13 = slot1[slot9]

				table.insert(slot11, slot3)
			end
		end
	end

	if #slot3 == 0 then
		return nil
	end

	slot6 = {}

	for slot10 = 1, #slot3, 1 do
		if slot3[slot10] ~= nil then
			slot15 = slot3[slot10]
			slot15 = {
				data = slot3[slot10],
				v = gameMgr.getCardValue(slot13, gameMgr)
			}

			table.insert(slot13, slot6)
		end
	end

	if #slot6 > 0 then
		if #slot6 > 1 then
			function slot10(slot0, slot1)
				return slot1.v < slot0.v
			end

			table.sort(slot8, slot6)
		end

		if slot6[#slot6].v == 1 then
			slot10 = slot6[#slot6].data

			table.insert(slot8, slot5)

			for slot10 = 1, 5 - #slot2 - 1, 1 do
				if slot6[slot10] ~= nil then
					slot14 = slot6[slot10].data

					table.insert(slot12, slot5)
				end
			end
		else
			for slot10 = 1, 5 - #slot2, 1 do
				if slot6[slot10] ~= nil then
					slot14 = slot6[slot10].data

					table.insert(slot12, slot5)
				end
			end
		end
	end

	return slot5
end

DzpkController.sortFun = function (slot0, slot1, slot2)
	if slot1.type < slot2.type then
		return true
	elseif slot1.type == slot2.type then
		if slot1.type == DzpkController.CT_THS then
			slot7 = slot2

			return slot0.sortShunZi(slot4, slot0, slot1)
		elseif slot1.type == DzpkController.CT_HLP then
		elseif slot1.type == DzpkController.CT_THP then
		elseif slot1.type == DzpkController.CT_SHUN_ZI then
			slot7 = slot2

			return slot0.sortShunZi(slot4, slot0, slot1)
		end
	else
		return false
	end
end

DzpkController.sortShunZi = function (slot0, slot1, slot2)
	slot3 = {}

	for slot7 = 1, #slot1, 1 do
		if slot1[slot7] ~= nil then
			slot12 = slot1[slot7]
			slot12 = {
				data = slot1[slot7],
				v = gameMgr.getCardValue(slot10, gameMgr)
			}

			table.insert(slot10, slot3)
		end
	end

	if #slot3 > 0 and #slot3 > 1 then
		function slot7(slot0, slot1)
			return slot1.v < slot0.v
		end

		table.sort(slot5, slot3)
	end

	slot4 = {}

	for slot8 = 1, #slot2, 1 do
		if slot2[slot8] ~= nil then
			slot13 = slot2[slot8]
			slot13 = {
				data = slot2[slot8],
				v = gameMgr.getCardValue(slot11, gameMgr)
			}

			table.insert(slot11, slot4)
		end
	end

	if #slot4 > 0 and #slot4 > 1 then
		function slot8(slot0, slot1)
			return slot1.v < slot0.v
		end

		table.sort(slot6, slot4)
	end

	return slot4[1] < slot3[1]
end

DzpkController.getIScore = function (slot0, slot1)
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
	elseif slot2 >= 10000 then
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
			slot4[slot12] = "d"
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
