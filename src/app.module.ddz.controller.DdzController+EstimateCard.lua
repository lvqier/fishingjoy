DdzController.isLegalValue = function (slot0, slot1)
	return slot1 < DDZ_CV_2
end

DdzController.isLegalDatas = function (slot0, slot1)
	slot4 = slot1

	for slot5, slot6 in pairs(slot3) do
		slot10 = slot5

		if not slot0.isLegalValue(slot8, slot0) then
			return false
		end
	end

	return true
end

DdzController.isSingle = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	slot4 = slot1
	slot5 = slot1

	return slot0.calTableCount(slot3, slot0) == 1
end

DdzController.isPair = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	slot4 = slot1
	slot5 = slot1

	return slot0.calTableCount(slot3, slot0) == 2
end

DdzController.isThree = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	slot4 = slot1
	slot5 = slot1

	return slot0.calTableCount(slot3, slot0) == 3
end

DdzController.isBoom = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	slot4 = slot1
	slot5 = slot1

	return slot0.calTableCount(slot3, slot0) == 4
end

DdzController.isStraight = function (slot0, slot1, slot2, slot3)
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

DdzController.isSingleStraight = function (slot0, slot1)
	slot7 = 1

	return slot0.isStraight(slot3, slot0, slot1, 5)
end

DdzController.isPairStraight = function (slot0, slot1)
	slot7 = 2

	return slot0.isStraight(slot3, slot0, slot1, 3)
end

DdzController.isThreeStraight = function (slot0, slot1)
	slot7 = 3

	return slot0.isStraight(slot3, slot0, slot1, 2)
end

DdzController.isThreeTakeBb = function (slot0, slot1, slot2)
	slot3 = (slot2 == 1 and 4) or 5
	slot6 = slot1

	if table.nums(slot5) == 2 then
		slot7 = slot1

		if slot0.calTableCount(slot5, slot0) == slot3 then
			slot6 = slot1

			for slot7, slot8 in pairs(slot5) do
				slot11 = slot8

				if table.nums(slot10) == 3 then
					return true
				end
			end
		end
	end

	return false
end

DdzController.isFourTakeOne = function (slot0, slot1)
	slot5 = slot1

	if slot0.calTableCount(slot3, slot0) == 6 then
		slot4 = slot1

		if table.nums(slot3) <= 3 then
			slot4 = slot1

			for slot5, slot6 in pairs(slot3) do
				slot9 = slot6

				if table.nums(slot8) == 4 then
					return true
				end
			end
		end
	end

	return false
end

DdzController.isFourTakeTwo = function (slot0, slot1)
	slot5 = slot1

	if slot0.calTableCount(slot3, slot0) == 8 then
		slot4 = slot1

		if table.nums(slot3) == 3 then
			slot2 = 0
			slot3 = 0
			slot6 = slot1

			for slot7, slot8 in pairs(slot5) do
				slot11 = slot8

				if table.nums(slot10) == 4 then
					slot3 = slot3 + 1
				else
					slot11 = slot8

					if table.nums(slot10) == 2 then
						slot2 = slot2 + 1
					end
				end
			end

			if slot3 == 1 and slot2 == 2 then
				return true
			end
		end
	end

	return false
end

DdzController.isRocket = function (slot0, slot1)
	slot4 = slot1

	if table.nums(slot3) == 2 then
		slot4 = slot1

		for slot5, slot6 in pairs(slot3) do
			slot9 = slot6

			if table.nums(slot8) ~= 1 or (slot5 ~= DDZ_CV_BIG_JOKER and slot5 ~= DDZ_CV_LITTLE_JOKER) then
				return false
			end
		end
	else
		return false
	end

	return true
end

DdzController.isPlaneTakeWing = function (slot0, slot1)
	slot2 = 0
	slot3 = 0
	slot4 = {}
	slot5 = {}

	if slot1[DDZ_CV_LITTLE_JOKER] ~= nil and slot1[DDZ_CV_BIG_JOKER] ~= nil then
		slot8 = slot1[DDZ_CV_LITTLE_JOKER]

		if table.nums(slot7) > 0 then
			slot8 = slot1[DDZ_CV_BIG_JOKER]

			if table.nums(slot7) > 0 then
				return false, 0, 0
			end
		end
	end

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

	slot12 = slot4

	for slot13, slot14 in pairs(slot11) do
		slot17 = slot14

		if table.nums(slot16) == 4 then
			slot5[slot13] = {
				slot4[slot13][1]
			}
		end
	end

	slot12 = slot5

	for slot13, slot14 in pairs(slot11) do
		slot17 = slot14
		slot3 = slot3 + table.nums(slot16)
	end

	slot12 = slot5

	for slot13, slot14 in pairs(slot11) do
		slot17 = slot14

		if table.nums(slot16) == 4 then
			return false, 0, 0
		end
	end

	if slot2 == slot3 then
		return true, 1, slot2
	end

	if slot2 * 2 == slot3 then
		slot10 = false
		slot13 = slot5

		for slot14, slot15 in pairs(slot12) do
			slot18 = slot15

			if table.nums(slot17) ~= 2 then
				slot18 = slot15

				if table.nums(slot17) ~= 4 then
					slot10 = true

					break
				end
			end
		end

		if not slot10 then
			return true, 2, slot2
		end
	end

	if slot3 + 3 == slot2 - 1 then
		return true, 1, slot2 - 1
	else
		return false, 0, 0
	end
end

DdzController.isPlaneTakeXXWing = function (slot0, slot1, slot2)
	slot6 = slot1
	slot3, slot4, slot5 = slot0.isPlaneTakeWing(slot4, slot0)

	if slot4 ~= slot2 then
		slot3 = false
	end

	return slot3, slot5
end

DdzController.analyzeCardsDot = function (slot0, slot1, slot2)
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
				if slot2 == DDZ_CT_FOUR_TAKE_TWO then
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

DdzController.analyzeCardInfo = function (slot0, slot1)
	slot2 = {}

	if slot1 ~= nil then
		slot5 = slot1

		if table.nums(slot4) == 0 then
			return slot2
		end
	end

	slot4 = DDZ_CT_ERROR
	slot8 = slot0.model.convertArrToDic(slot4, slot0.model)
	slot9 = slot0.findRocket(slot1, slot0)

	if slot0.model.nilEmptyTable(slot0, slot0.model) ~= nil then
		slot9 = slot3
		slot6 = not slot0.isRocket(slot7, slot0)
	else
		slot6 = false

		if false then
			slot6 = true
		end
	end

	if not slot6 then
		slot10 = slot3

		if slot0.isSingle(slot8, slot0) then
			slot4 = DDZ_CT_SINGLE
		else
			slot10 = slot3

			if slot0.isPair(slot8, slot0) then
				slot4 = DDZ_CT_DOUBLE
			else
				slot10 = slot3

				if slot0.isThree(slot8, slot0) then
					slot4 = DDZ_CT_THREE
				else
					slot10 = slot3

					if slot0.isBoom(slot8, slot0) then
						slot4 = DDZ_CT_BOMB_CARD
					else
						slot10 = slot3

						if slot0.isSingleStraight(slot8, slot0) then
							slot4 = DDZ_CT_SINGLE_LINE
						else
							slot10 = slot3

							if slot0.isPairStraight(slot8, slot0) then
								slot4 = DDZ_CT_DOUBLE_LINE
							else
								slot10 = slot3

								if slot0.isThreeStraight(slot8, slot0) then
									slot4 = DDZ_CT_THREE_LINE
								else
									slot11 = 1

									if slot0.isThreeTakeBb(slot8, slot0, slot3) then
										slot4 = DDZ_CT_THREE_TAKE_ONE
									else
										slot11 = 2

										if slot0.isThreeTakeBb(slot8, slot0, slot3) then
											slot4 = DDZ_CT_THREE_TAKE_TWO
										else
											slot10 = slot3

											if slot0.isFourTakeOne(slot8, slot0) then
												slot4 = DDZ_CT_FOUR_TAKE_ONE
											else
												slot10 = slot3

												if slot0.isFourTakeTwo(slot8, slot0) then
													slot4 = DDZ_CT_FOUR_TAKE_TWO
												else
													slot11 = 1

													if slot0.isPlaneTakeXXWing(slot8, slot0, slot3) then
														slot4 = DDZ_CT_PLANE_TAKE_SINGLE_WING
													else
														slot11 = 2

														if slot0.isPlaneTakeXXWing(slot8, slot0, slot3) then
															slot4 = DDZ_CT_PLANE_TAKE_PAIR_WING
														else
															slot10 = slot3

															if slot0.isRocket(slot8, slot0) then
																slot4 = DDZ_CT_MISSILE_CARD
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
				end
			end
		end
	end

	if slot4 ~= DDZ_CT_ERROR then
		slot11 = slot4
		slot2.dot = slot0.analyzeCardsDot(slot8, slot0, slot3)
	end

	if slot4 == DDZ_CT_SINGLE_LINE or slot4 == DDZ_CT_DOUBLE_LINE or slot4 == DDZ_CT_THREE_LINE then
		slot9 = slot3
		slot2.st = table.nums(slot8)
	end

	if slot4 == DDZ_CT_THREE_TAKE_ONE or slot4 == DDZ_CT_THREE_TAKE_TWO or slot4 == DDZ_CT_FOUR_TAKE_ONE or slot4 == DDZ_CT_FOUR_TAKE_TWO then
		slot2.st = 1
	end

	if slot4 == DDZ_CT_PLANE_TAKE_SINGLE_WING then
		slot11 = 1
		__, slot2.st = slot0.isPlaneTakeXXWing(slot8, slot0, slot3)
		__ = nil
	end

	if slot4 == DDZ_CT_PLANE_TAKE_PAIR_WING then
		slot11 = 2
		__, slot2.st = slot0.isPlaneTakeXXWing(slot8, slot0, slot3)
		__ = nil
	end

	slot2.ct = slot4

	return slot2
end

return
