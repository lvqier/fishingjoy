GameManager.MAX_COUNT = 5
GameManager.OX_VALUE0 = 0
GameManager.OX_FOURKING = 12
GameManager.OX_FIVEKING = 13
GameManager.OX_HULU = 14
GameManager.OX_BOMB = 15
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

GameManager.initLogicHelper = function (slot0)
	return
end

GameManager.getMyType = function (slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot6 = slot1

	for slot7, slot8 in ipairs(slot5) do
		if slot7 <= 3 then
			slot12 = slot8

			table.insert(slot10, slot2)
		else
			slot12 = slot8

			table.insert(slot10, slot3)
		end
	end

	slot4 = 0

	for slot8 = 1, 3, 1 do
		slot12 = slot2[slot8]
		slot4 = slot4 + slot0.getCardLogicValue(slot10, slot0)
	end

	if slot4 % 10 == 0 then
		for slot8 = 0, 2, 1 do
			slot12 = slot3[slot8]
			slot4 = slot4 + slot0.getCardLogicValue(slot10, slot0)
		end

		return (slot4 % 10 == 0 and 10) or slot5
	end

	return GameManager.OX_VALUE0
end

GameManager.getCardTypeMo = function (slot0, slot1)
	slot2 = {}
	slot3 = GameManager.OX_VALUE0

	for slot7 = 1, 3, 1 do
		for slot11 = slot7 + 1, 4, 1 do
			for slot15 = slot11 + 1, 5, 1 do
				slot20 = slot1[slot7]

				table.insert(slot18, slot16)

				slot20 = slot1[slot11]

				table.insert(slot18, slot16)

				slot20 = slot1[slot15]

				table.insert(slot18, slot16)

				for slot20 = 1, 5, 1 do
					if slot20 ~= slot7 and slot20 ~= slot11 and slot20 ~= slot15 then
						slot24 = slot1[slot20]

						table.insert(slot22, slot16)
					end
				end

				slot20 = slot16
				slot17 = slot0.getMyType(slot18, slot0)

				if slot3 == GameManager.OX_VALUE0 or slot3 < slot17 then
					slot3 = slot17
					slot20 = slot16
					slot2 = TableUtil.copyDataDep(slot19)
				end
			end
		end
	end

	return slot3
end

GameManager.analysebCardData = function (slot0, slot1, slot2)
	slot5 = slot0
	slot3 = TableUtil.copyDataDep(slot4)
	slot4 = 1

	for slot8 = 1, slot2, 1 do
		if slot4 <= slot8 then
			slot9 = 1
			slot13 = slot1[slot8]

			if slot0.getCardValue(slot11, slot0) <= 0 then
				return false
			end

			for slot14 = slot8 + 1, slot2, 1 do
				slot18 = slot1[slot14]

				if slot0.getCardValue(slot16, slot0) == slot10 then
					slot9 = slot9 + 1
				end
			end

			if slot9 == 1 then
				slot3.cbSignedCount = slot3.cbSignedCount + 1
				slot3.cbSignedCardData[slot3.cbSignedCount * slot9] = slot1[slot8]
			elseif slot9 == 2 then
				slot3.cbDoubleCount = slot3.cbDoubleCount + 1
				slot3.cbDoubleCardData[slot3.cbDoubleCount * slot9] = slot1[slot8]
				slot3.cbDoubleCardData[slot3.cbDoubleCount * slot9 + 1] = slot1[slot8 + 1]
			elseif slot9 == 3 then
				slot3.cbThreeCount = slot3.cbThreeCount + 1
				slot3.cbThreeCardData[slot3.cbThreeCount * slot9] = slot1[slot8]
				slot3.cbThreeCardData[slot3.cbThreeCount * slot9 + 1] = slot1[slot8 + 1]
				slot3.cbThreeCardData[slot3.cbThreeCount * slot9 + 2] = slot1[slot8 + 2]
			elseif slot9 == 4 then
				slot3.cbFourCount = slot3.cbFourCount + 1
				slot3.cbFourCardData[slot3.cbFourCount * slot9] = slot1[slot8]
				slot3.cbFourCardData[slot3.cbFourCount * slot9 + 1] = slot1[slot8 + 1]
				slot3.cbFourCardData[slot3.cbFourCount * slot9 + 2] = slot1[slot8 + 2]
				slot3.cbFourCardData[slot3.cbFourCount * slot9 + 3] = slot1[slot8 + 3]
			end

			slot4 = slot4 + slot9
		end
	end

	return true, slot3
end

GameManager.getCardType = function (slot0, slot1, slot2)
	if slot2 ~= GameManager.MAX_COUNT then
		return
	end

	slot7 = slot2

	slot0.sortCardList(slot4, slot0, slot1)

	slot7 = slot2
	slot3, slot4 = slot0.analysebCardData(slot4, slot0, slot1)

	if slot3 then
		if slot4.cbFourCount == 1 then
			return GameManager.OX_BOMB
		elseif slot4.cbThreeCount == 1 and slot4.cbDoubleCount == 1 then
			return GameManager.OX_HULU
		end
	end

	slot5 = 0
	slot6 = 0

	for slot10 = 1, slot2, 1 do
		slot14 = slot1[slot10]

		if slot0.getCardValue(slot12, slot0) >= 10 then
			slot5 = slot5 + 1
		end
	end

	if slot5 == GameManager.MAX_COUNT then
		return 13
	end

	slot7 = {}
	slot8 = 0

	for slot12 = 1, slot2, 1 do
		slot16 = slot1[slot12]
		slot7[slot12] = slot0.getCardLogicValue(slot14, slot0)
		slot8 = slot8 + slot7[slot12]
	end

	for slot12 = 1, slot2 - 1, 1 do
		for slot16 = slot12 + 1, slot2, 1 do
			if (slot8 - slot7[slot12] - slot7[slot16]) % 10 == 0 then
				return (slot7[slot12] + slot7[slot16] > 10 and (slot7[slot12] + slot7[slot16]) - 10) or slot7[slot12] + slot7[slot16]
			end
		end
	end

	return GameManager.OX_VALUE0
end

GameManager.getTimes = function (slot0, slot1, slot2)
	if slot2 ~= GameManager.MAX_COUNT then
		return 0
	end

	slot7 = slot2
	slot7 = slot0.getCardType(slot4, slot0, slot1)

	return slot0:getTimesByCardType(slot0)
end

GameManager.getTimesByCardType = function (slot0, slot1)
	if slot1 == GameManager.OX_BOMB then
		return 5
	elseif slot1 == GameManager.OX_HULU then
		return 5
	elseif slot1 == GameManager.OX_FIVEKING then
		return 5
	elseif slot1 == GameManager.OX_FOURKING then
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

GameManager.getCardLogicNewValue = function (slot0, slot1)
	slot5 = slot1

	if slot0.getCardValue(slot3, slot0) > 10 then
		slot2 = 10
	end

	if slot1 == 65 then
		return 15
	elseif slot1 == 66 then
		return 18
	end

	return slot2
end

GameManager.getHuluCard = function (slot0, slot1, slot2)
	slot3 = nil
	slot4 = 1

	for slot8 = 1, slot2, 1 do
		slot4 = slot8

		for slot12 = slot8 + 1, slot2, 1 do
			slot16 = slot1[slot12]
			slot17 = slot1[slot4]

			if slot0:getCardLogicNewValue(slot0) < slot0.getCardLogicNewValue(slot14, slot0) then
				slot4 = slot12
			end
		end

		if slot4 ~= slot8 then
			slot1[slot4] = slot1[slot8]
			slot1[slot8] = slot1[slot4]
		end
	end

	slot5, slot6 = nil
	slot10 = slot1[1]
	slot11 = slot1[2]

	if slot0.getCardLogicNewValue(slot8, slot0) == slot0:getCardLogicNewValue(slot0) then
		slot10 = slot1[1]
		slot11 = slot1[3]

		if slot0.getCardLogicNewValue(slot8, slot0) == slot0:getCardLogicNewValue(slot0) then
			return
		end
	else
		slot1[1] = slot1[4]
		slot1[2] = slot1[5]
		slot1[4] = slot1[1]
		slot1[5] = slot1[2]
	end
end

GameManager.getOxCardEx = function (slot0, slot1, slot2)
	if slot2 ~= GameManager.MAX_COUNT then
		return
	end

	slot5 = slot1
	slot3 = TableUtil.copyDataDep(slot4)
	slot4 = 0

	for slot8 = 1, slot2, 1 do
		if slot1[slot8] ~= 65 and slot1[slot8] ~= 66 then
			slot12 = slot1[slot8]

			if slot0.getCardValue(slot10, slot0) >= 10 then
				slot4 = slot4 + 1
			end
		end
	end

	slot5 = nil
	slot6 = 0

	for slot10 = 1, slot2, 1 do
		slot6 = slot10

		for slot14 = slot10 + 1, slot2, 1 do
			slot18 = slot1[slot14]
			slot19 = slot1[slot6]

			if slot0:getCardLogicNewValue(slot0) < slot0.getCardLogicNewValue(slot16, slot0) then
				slot6 = slot14
			end
		end

		if slot6 ~= slot10 then
			slot1[slot6] = slot1[slot10]
			slot1[slot10] = slot1[slot6]
		end
	end

	if slot4 >= 3 then
		return true
	elseif slot4 == 2 then
		slot7, slot8 = nil
		slot12 = slot1[3]
		slot13 = slot1[4]

		if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) == 10 then
			slot1[1] = slot1[3]
			slot1[3] = slot1[1]
			slot1[2] = slot1[4]
			slot1[4] = slot1[2]

			return true
		else
			slot12 = slot1[3]
			slot13 = slot1[5]

			if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) == 10 then
				slot1[1] = slot1[3]
				slot1[3] = slot1[1]
				slot1[2] = slot1[5]
				slot1[5] = slot1[2]

				return true
			else
				slot12 = slot1[4]
				slot13 = slot1[5]

				if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) == 10 then
					slot1[2] = slot1[4]
					slot1[4] = slot1[2]
					slot1[3] = slot1[5]
					slot1[5] = slot1[3]

					return true
				else
					slot12 = slot1[3]
					slot13 = slot1[4]
					slot13 = slot1[5]

					if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
						slot12 = slot1[3]
						slot13 = slot1[4]
						slot13 = slot1[5]

						if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
							slot1[1] = slot1[4]
							slot1[4] = slot1[1]
							slot1[2] = slot1[5]
							slot1[5] = slot1[2]

							return true
						end
					end
				end
			end
		end
	elseif slot4 == 1 then
		slot7, slot8 = nil
		slot12 = slot1[2]
		slot13 = slot1[3]
		slot13 = slot1[4]

		if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
			slot12 = slot1[2]
			slot13 = slot1[3]
			slot13 = slot1[4]

			if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
				slot1[1] = slot1[4]
				slot1[4] = slot1[1]

				return true
			else
				slot12 = slot1[2]
				slot13 = slot1[3]
				slot13 = slot1[5]

				if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
					slot12 = slot1[2]
					slot13 = slot1[3]
					slot13 = slot1[5]

					if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
						slot1[1] = slot1[5]
						slot1[5] = slot1[1]

						return true
					else
						slot12 = slot1[2]
						slot13 = slot1[4]
						slot13 = slot1[5]

						if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
							slot12 = slot1[2]
							slot13 = slot1[4]
							slot13 = slot1[5]

							if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
								slot1[1] = slot1[4]
								slot1[4] = slot1[1]
								slot1[3] = slot1[5]
								slot1[5] = slot1[3]

								return true
							else
								slot12 = slot1[3]
								slot13 = slot1[4]
								slot13 = slot1[5]

								if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
									slot12 = slot1[3]
									slot13 = slot1[4]
									slot13 = slot1[5]

									if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
										slot1[1] = slot1[4]
										slot1[4] = slot1[1]
										slot1[2] = slot1[5]
										slot1[5] = slot1[2]

										return true
									else
										slot12 = slot1[2]
										slot13 = slot1[3]

										if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) == 10 then
											return true
										else
											slot12 = slot1[2]
											slot13 = slot1[4]

											if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) == 10 then
												slot1[3] = slot1[4]
												slot1[4] = slot1[3]

												return true
											else
												slot12 = slot1[2]
												slot13 = slot1[5]

												if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) == 10 then
													slot1[3] = slot1[5]
													slot1[5] = slot1[3]

													return true
												else
													slot12 = slot1[3]
													slot13 = slot1[4]

													if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) == 10 then
														slot1[2] = slot1[4]
														slot1[4] = slot1[2]

														return true
													else
														slot12 = slot1[3]
														slot13 = slot1[5]

														if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) == 10 then
															slot1[2] = slot1[5]
															slot1[5] = slot1[2]

															return true
														else
															slot12 = slot1[4]
															slot13 = slot1[5]

															if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) == 10 then
																slot1[2] = slot1[4]
																slot1[4] = slot1[2]
																slot1[3] = slot1[5]
																slot1[5] = slot1[3]

																return true
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
	else
		slot7, slot8 = nil
		slot12 = slot1[1]
		slot13 = slot1[2]
		slot13 = slot1[3]

		if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
			slot12 = slot1[1]
			slot13 = slot1[2]
			slot13 = slot1[3]

			if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
				return true
			else
				slot12 = slot1[1]
				slot13 = slot1[2]
				slot13 = slot1[4]

				if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
					slot12 = slot1[1]
					slot13 = slot1[2]
					slot13 = slot1[4]

					if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
						slot1[3] = slot1[4]
						slot1[4] = slot1[3]

						return true
					else
						slot12 = slot1[1]
						slot13 = slot1[2]
						slot13 = slot1[5]

						if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
							slot12 = slot1[1]
							slot13 = slot1[2]
							slot13 = slot1[5]

							if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
								slot1[3] = slot1[5]
								slot1[5] = slot1[3]

								return true
							else
								slot12 = slot1[1]
								slot13 = slot1[3]
								slot13 = slot1[4]

								if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
									slot12 = slot1[1]
									slot13 = slot1[3]
									slot13 = slot1[4]

									if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
										slot1[2] = slot1[4]
										slot1[4] = slot1[2]

										return true
									else
										slot12 = slot1[1]
										slot13 = slot1[3]
										slot13 = slot1[5]

										if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
											slot12 = slot1[1]
											slot13 = slot1[3]
											slot13 = slot1[5]

											if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
												slot1[2] = slot1[5]
												slot1[5] = slot1[2]

												return true
											else
												slot12 = slot1[1]
												slot13 = slot1[4]
												slot13 = slot1[5]

												if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
													slot12 = slot1[1]
													slot13 = slot1[4]
													slot13 = slot1[5]

													if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
														slot1[2] = slot1[4]
														slot1[4] = slot1[2]
														slot1[3] = slot1[5]
														slot1[5] = slot1[3]

														return true
													else
														slot12 = slot1[2]
														slot13 = slot1[3]
														slot13 = slot1[4]

														if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
															slot12 = slot1[2]
															slot13 = slot1[3]
															slot13 = slot1[4]

															if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
																slot1[1] = slot1[4]
																slot1[4] = slot1[1]

																return true
															else
																slot12 = slot1[2]
																slot13 = slot1[3]
																slot13 = slot1[5]

																if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
																	slot12 = slot1[2]
																	slot13 = slot1[3]
																	slot13 = slot1[5]

																	if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
																		slot1[1] = slot1[5]
																		slot1[5] = slot1[1]

																		return true
																	else
																		slot12 = slot1[2]
																		slot13 = slot1[4]
																		slot13 = slot1[5]

																		if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
																			slot12 = slot1[2]
																			slot13 = slot1[4]
																			slot13 = slot1[5]

																			if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
																				slot1[1] = slot1[4]
																				slot1[4] = slot1[1]
																				slot1[3] = slot1[5]
																				slot1[5] = slot1[3]

																				return true
																			else
																				slot12 = slot1[3]
																				slot13 = slot1[4]
																				slot13 = slot1[5]

																				if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) ~= 10 then
																					slot12 = slot1[3]
																					slot13 = slot1[4]
																					slot13 = slot1[5]

																					if slot0.getCardValue(slot10, slot0) + slot0:getCardValue(slot0) + slot0:getCardValue(slot0) == 20 then
																						slot1[1] = slot1[4]
																						slot1[4] = slot1[1]
																						slot1[2] = slot1[5]
																						slot1[5] = slot1[2]

																						return true
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
						end
					end
				end
			end
		end

		return false
	end

	return false
end

GameManager.getOxCard = function (slot0, slot1, slot2)
	slot9 = 2
	slot5 = "没实现   GameManager:getOxCard." .. debug.traceback(slot7, "")

	print(slot4)
end

GameManager.isIntValue = function (slot0, ...)
	slot7 = 2
	slot3 = "没实现   GameManager:isIntValue." .. debug.traceback(slot5, "")

	print(slot2)
end

GameManager.sortCardList = function (slot0, slot1, slot2)
	slot6 = slot1

	slot0.sortCardListEx(slot4, slot0)
end

GameManager.sortCardListEx = function (slot0, slot1)
	function slot5(slot0, slot1)
		slot5 = slot0
		slot6 = slot1

		if slot0.getCardValue(slot3, slot0) == slot0:getCardValue(slot0) then
			return slot1 < slot0
		else
			return slot3 < slot2
		end
	end

	table.sort(slot3, slot1)
end

GameManager.randCardList = function (slot0)
	slot7 = 2
	slot3 = "没实现   GameManager:randCardList." .. debug.traceback(slot5, "")

	print(slot2)
end

GameManager.compareCard = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if slot4 ~= slot5 then
		return slot4
	end

	slot10 = slot3
	slot11 = slot3

	if slot0:getCardType(slot0, slot1) ~= slot0.getCardType(slot7, slot0, slot2) then
		return slot6 < slot7
	end

	slot14 = slot3

	slot0.sortCardList(slot2, slot0, slot8)

	slot14 = slot3

	slot0.sortCardList(slot2, slot0, slot9)

	slot13 = TableUtil.copyDataDep(slot1)[0]
	slot14 = TableUtil.copyDataDep(slot9)[0]

	if slot0.getCardValue(slot2, slot0) ~= slot0:getCardValue(slot0) then
		return slot10 < slot11
	end

	slot15 = slot8[0]
	slot16 = slot9[0]

	return slot0:getCardColor(slot0) < slot0.getCardColor(slot13, slot0)
end

GameManager.getCardLogicValue = function (slot0, slot1)
	slot5 = LOGIC_MASK_VALUE

	return (bit.band(slot3, slot1) > 10 and 10) or slot2
end

GameManager.getCardValue = function (slot0, slot1)
	slot5 = LOGIC_MASK_VALUE

	return bit.band(slot3, slot1)
end

GameManager.getCardColor = function (slot0, slot1)
	slot7 = LOGIC_MASK_COLOR
	slot5 = 4

	return bit.rshift(slot3, bit.band(slot5, slot1))
end

slot3 = gameMgr

gameMgr.initLogicHelper(function (slot0, slot1)
	slot7 = LOGIC_MASK_COLOR
	slot5 = 4

	return bit.rshift(slot3, bit.band(slot5, slot1))
end)

return
