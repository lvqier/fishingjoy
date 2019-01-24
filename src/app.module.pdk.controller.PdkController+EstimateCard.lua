PdkController.isLegalValue = function (slot0, slot1)
	return slot1 < PDK_CV_2
end

PdkController.isLegalDatas = function (slot0, slot1)
	slot4 = slot1

	for slot5, slot6 in pairs(slot3) do
		slot10 = slot5

		if not slot0.isLegalValue(slot8, slot0) then
			return false
		end
	end

	return true
end

PdkController.isSingle = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	slot4 = slot1
	slot5 = slot1

	return slot0.calTableCount(slot3, slot0) == 1
end

PdkController.isPair = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	slot4 = slot1
	slot5 = slot1

	return slot0.calTableCount(slot3, slot0) == 2
end

PdkController.isBoom = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	slot4 = slot1
	slot5 = slot1

	return slot0.calTableCount(slot3, slot0) == 4
end

PdkController.isStraight = function (slot0, slot1, slot2, slot3)
	slot7 = slot1

	if not slot0.isLegalDatas(slot5, slot0) then
		return false
	end

	slot6 = slot1

	for slot7, slot8 in pairs(slot5) do
		slot11 = slot8

		if table.nums(slot10) ~= slot3 then
			return false
		end
	end

	slot6 = slot1

	if slot2 <= table.nums(slot5) then
		slot4 = {}
		slot7 = slot1

		for slot8, slot9 in pairs(slot6) do
			slot13 = slot8

			table.insert(slot11, slot4)
		end

		function slot8(slot0, slot1)
			return slot0 < slot1
		end

		table.sort(slot6, slot4)

		slot8 = slot4

		return slot4[table.nums(slot6)] - slot4[1] == table.nums(slot4) - 1
	end

	return false
end

PdkController.isSingleStraight = function (slot0, slot1)
	slot7 = 1

	return slot0.isStraight(slot3, slot0, slot1, 5)
end

PdkController.isPairStraight = function (slot0, slot1)
	slot7 = 2

	return slot0.isStraight(slot3, slot0, slot1, 2)
end

PdkController.isThreeTakeBb = function (slot0, slot1, slot2)
	slot7 = slot1

	if slot0.calTableCount(slot5, slot0) == ((slot2 == 1 and 4) or 5) then
		slot6 = slot1

		if table.nums(slot5) <= 3 then
			slot6 = slot1

			for slot7, slot8 in pairs(slot5) do
				slot11 = slot8

				if table.nums(slot10) >= 3 then
					return true
				end
			end
		end
	end

	return false
end

PdkController.isPlaneTakeWing = function (slot0, slot1)
	slot2 = 0
	slot3 = 0
	slot4 = {}
	slot5 = {}
	slot8 = slot1

	for slot9, slot10 in pairs(slot7) do
		slot13 = slot10

		if table.nums(slot12) >= 3 then
			slot14 = slot9

			if slot0.isLegalValue(slot12, slot0) then
				slot4[slot9] = slot10
			end
		end
	end

	slot11 = 2
	slot6, slot7 = slot0.findStraight(slot7, slot0, slot4, 0)

	if slot7 ~= nil then
		slot10 = slot7

		if table.nums(slot9) == 0 then
			return false, 0, 0
		end
	end

	slot8 = 0
	slot9 = {}
	slot12 = slot7

	for slot13, slot14 in pairs(slot11) do
		slot17 = slot14

		if slot8 < table.nums(slot16) then
			slot17 = slot14
			slot8 = table.nums(slot16)
			slot9 = slot14
		end
	end

	slot4 = {}
	slot12 = slot9

	for slot13, slot14 in pairs(slot11) do
		slot4[slot14] = slot1[slot14]
	end

	slot12 = slot4
	slot2 = table.nums(slot11)
	slot12 = slot1

	for slot13, slot14 in pairs(slot11) do
		if not slot4[slot13] then
			slot5[slot13] = slot14
		end
	end

	slot10 = 0
	slot13 = slot5

	for slot14, slot15 in pairs(slot12) do
		slot18 = slot15
		slot10 = slot10 + table.nums(slot17)
	end

	slot13 = slot4

	for slot14, slot15 in pairs(slot12) do
		slot18 = slot15

		if table.nums(slot17) == 4 then
			slot5[slot14] = {
				slot4[slot14][4]
			}
		end
	end

	slot13 = slot5

	for slot14, slot15 in pairs(slot12) do
		slot18 = slot15
		slot3 = slot3 + table.nums(slot17)
	end

	if slot2 * 2 == slot3 then
		return true, 2, slot2
	end

	if slot3 >= 1 and slot3 <= slot2 * 2 then
		return true, 1, slot2
	end

	if slot3 + 3 == (slot2 - 1) * 2 then
		return true, 2, slot2 - 1
	end

	return false, 0, 0
end

PdkController.isPlaneTakeBb = function (slot0, slot1, slot2)
	slot6 = slot1
	slot3, slot4, slot5 = slot0.isPlaneTakeWing(slot4, slot0)

	if slot4 ~= slot2 then
		slot3 = false
	end

	return slot3, slot5
end

PdkController.isThreeStraight = function (slot0, slot1)
	slot7 = 3

	return slot0.isStraight(slot3, slot0, slot1, 2)
end

PdkController.isThree = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	slot4 = slot1
	slot5 = slot1

	return slot0.calTableCount(slot3, slot0) == 3
end

PdkController.analyzeCardsDot = function (slot0, slot1, slot2)
	slot3 = 0
	slot4 = 0
	slot7 = slot1

	for slot8, slot9 in pairs(slot6) do
		slot12 = slot9

		if slot3 < table.nums(slot11) then
			slot12 = slot9
			slot3 = table.nums(slot11)
			slot4 = slot8
		else
			slot12 = slot9

			if table.nums(slot11) == slot3 then
				if slot2 == PDK_CT_FOUR_TAKE_TWO then
					if slot4 < slot8 then
						slot4 = slot8
					end
				elseif slot8 < slot4 then
					slot4 = slot8
				end
			end
		end
	end

	return slot4
end

PdkController.analyzeCardInfo = function (slot0, slot1)
	slot2 = {}

	if slot1 ~= nil then
		slot5 = slot1

		if table.nums(slot4) == 0 then
			return slot2
		end
	end

	slot4 = PDK_CT_ERROR
	slot8 = slot0.model.convertArrToDic(slot4, slot0.model)

	if slot0.isSingle(slot1, slot0) then
		slot4 = PDK_CT_SINGLE
	else
		slot8 = slot3

		if slot0.isPair(slot6, slot0) then
			slot4 = PDK_CT_DOUBLE
		else
			slot8 = slot3

			if slot0.isThree(slot6, slot0) then
				slot4 = PDK_CT_THREE
			else
				slot8 = slot3

				if slot0.isBoom(slot6, slot0) then
					slot4 = PDK_CT_BOMB_CARD
				else
					slot8 = slot3

					if slot0.isSingleStraight(slot6, slot0) then
						slot4 = PDK_CT_SINGLE_LINE
					else
						slot8 = slot3

						if slot0.isPairStraight(slot6, slot0) then
							slot4 = PDK_CT_DOUBLE_LINE
						else
							slot8 = slot3

							if slot0.isThreeStraight(slot6, slot0) then
								slot4 = PDK_CT_THREE_LINE
							else
								slot9 = 1

								if slot0.isThreeTakeBb(slot6, slot0, slot3) then
									slot4 = PDK_CT_THREE_TAKE_ONE
								else
									slot9 = 2

									if slot0.isThreeTakeBb(slot6, slot0, slot3) then
										slot4 = PDK_CT_THREE_TAKE_TWO
									else
										slot9 = 1

										if slot0.isPlaneTakeBb(slot6, slot0, slot3) then
											slot4 = PDK_CT_PLANE_TAKE_SINGLE_WING
										else
											slot9 = 2

											if slot0.isPlaneTakeBb(slot6, slot0, slot3) then
												slot4 = PDK_CT_PLANE_TAKE_PAIR_WING
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	if slot4 ~= PDK_CT_ERROR then
		slot9 = slot4
		slot2.dot = slot0.analyzeCardsDot(slot6, slot0, slot3)
	end

	if slot4 == PDK_CT_SINGLE_LINE or slot4 == PDK_CT_DOUBLE_LINE or slot4 == PDK_CT_THREE_LINE then
		slot7 = slot3
		slot2.st = table.nums(slot6)
	end

	if slot4 == PDK_CT_THREE_TAKE_ONE or slot4 == PDK_CT_THREE_TAKE_TWO then
		slot2.st = 1
	end

	if slot4 == PDK_CT_PLANE_TAKE_SINGLE_WING then
		slot9 = 1
		__, slot2.st = slot0.isPlaneTakeBb(slot6, slot0, slot3)
		__ = nil
	end

	if slot4 == PDK_CT_PLANE_TAKE_PAIR_WING then
		slot9 = 2
		__, slot2.st = slot0.isPlaneTakeBb(slot6, slot0, slot3)
		__ = nil
	end

	slot2.ct = slot4

	return slot2
end

return
