LRNN_CONST = {
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

LrnnController.getCardType = function (slot0, slot1, slot2, slot3)
	slot6 = LRNN_CONST.MAX_COUNT == slot2

	assert(slot5)

	if LRNN_CONST.MAX_COUNT ~= slot2 then
		return 0
	end

	slot9 = slot2

	slot0.sortCardList(slot1, slot0, slot4)

	for slot8 = 1, 5, 1 do
		slot3[slot8] = slot4[slot8]
	end

	slot5 = 1
	slot6 = {
		slot4[1],
		0,
		0,
		0,
		0
	}
	slot7 = 0
	slot8 = {
		0,
		0
	}
	slot9 = 0
	slot10 = 0

	for slot14 = 1, slot2, 1 do
		slot18 = slot4[slot14]

		if slot0.getCardLogicValue(slot16, slot0) ~= 10 then
			slot18 = slot4[slot14]

			if slot0.getCardLogicValue(slot16, slot0) == 11 then
				slot10 = slot10 + 1
			end
		end
	end

	if slot10 >= 3 then
		slot14 = slot4[1]

		if slot0.getCardColor(slot12, slot0) == 4 then
			slot14 = slot4[2]

			if slot0.getCardColor(slot12, slot0) == 4 then
				slot3[1] = slot4[1]
				slot3[2] = slot4[4]
				slot3[3] = slot4[5]
				slot3[4] = slot4[2]
				slot3[5] = slot4[3]

				return 10
			end
		end

		slot14 = slot4[1]

		if slot0.getCardColor(slot12, slot0) == 4 then
			slot3[1] = slot4[1]
			slot3[2] = slot4[4]
			slot3[3] = slot4[5]
			slot3[4] = slot4[2]
			slot3[5] = slot4[3]

			return 10
		else
			slot14 = slot4[4]
			slot15 = slot4[5]

			return ((slot0.getCardLogicValue(slot12, slot0) + slot0:getCardLogicValue(slot0)) % 10 == 0 and 10) or slot7 % 10
		end
	end

	if slot10 ~= 2 and slot10 == 1 then
		slot14 = slot4[1]

		if slot0.getCardColor(slot12, slot0) == 4 then
			slot14 = slot4[1]

			if slot0.getCardColor(slot12, slot0) == 4 then
				slot14 = slot4[2]

				if slot0.getCardColor(slot12, slot0) == 4 then
					slot3[1] = slot4[1]
					slot3[2] = slot4[4]
					slot3[3] = slot4[5]
					slot3[4] = slot4[2]
					slot3[5] = slot4[3]

					return 10
				end
			else
				slot14 = slot4[1]

				if slot0.getCardColor(slot12, slot0) == 4 then
					for slot14 = 1, slot2 - 1, 1 do
						for slot18 = 1, slot2 - 1, 1 do
							if slot18 ~= slot14 then
								for slot22 = 1, slot2 - 1, 1 do
									if slot22 ~= slot14 and slot22 ~= slot18 then
										slot26 = slot4[slot14 + 1]
										slot27 = slot4[slot18 + 1]
										slot27 = slot4[slot22 + 1]

										if (slot0.getCardLogicValue(slot24, slot0) + slot0:getCardLogicValue(slot0) + slot0:getCardLogicValue(slot0)) % 10 == 0 then
											slot23 = 0

											for slot27 = 1, slot2 + 1, 1 do
												if slot27 ~= slot14 and slot27 ~= slot18 and slot27 ~= slot22 then
													slot8[slot23 + 1] = slot4[slot27 + 1]
													slot23 = slot23 + 1
												end
											end

											slot3[1] = slot4[slot14 + 1]
											slot3[2] = slot4[slot18 + 1]
											slot3[3] = slot4[slot22 + 1]
											slot3[4] = slot4[1]
											slot3[5] = slot8[1]

											return 10
										end
									end
								end
							end
						end
					end

					slot11 = {}
					slot12 = 0

					for slot16 = 1, slot2 - 1, 1 do
						for slot20 = 1, slot2 - 1, 1 do
							if slot16 ~= slot20 then
								slot24 = slot4[slot16 + 1]
								slot25 = slot4[slot20 + 1]

								if slot12 < (slot0.getCardLogicValue(slot22, slot0) + slot0:getCardLogicValue(slot0)) % 10 then
									slot12 = slot21
									slot22 = 0
									slot11[1] = slot4[slot16 + 1]
									slot11[2] = slot4[slot20 + 1]

									for slot26 = 1, slot2 - 1, 1 do
										if slot26 ~= slot16 and slot26 ~= slot20 then
											slot8[slot22 + 1] = slot4[slot26 + 1]
											slot22 = slot22 + 1
										end
									end

									slot11[3] = slot8[1]
									slot11[4] = slot8[2]
								end
							end
						end
					end

					slot3[1] = slot4[1]
					slot3[2] = slot11[3]
					slot3[3] = slot11[4]
					slot3[4] = slot11[1]
					slot3[5] = slot11[2]

					if slot10 == 1 then
						slot16 = slot4[1]

						if slot0.getCardColor(slot14, slot0) == 4 then
						end
					else
						slot16 = slot11[1]
						slot17 = slot11[2]

						return ((slot0.getCardLogicValue(slot14, slot0) + slot0:getCardLogicValue(slot0)) % 10 == 0 and 10) or slot7 % 10
					end
				else
					slot14 = slot4[3]
					slot15 = slot4[4]
					slot15 = slot4[5]

					if (slot0.getCardLogicValue(slot12, slot0) + slot0:getCardLogicValue(slot0) + slot0:getCardLogicValue(slot0)) % 10 == 0 then
						slot3[1] = slot4[3]
						slot3[2] = slot4[4]
						slot3[3] = slot4[5]
						slot3[4] = slot4[1]
						slot3[5] = slot4[2]

						return 10
					else
						for slot14 = 2, slot2 - 1, 1 do
							for slot18 = 2, slot2 - 1, 1 do
								if slot18 ~= slot14 then
									slot22 = slot4[slot14 + 1]
									slot23 = slot4[slot18 + 1]

									if (slot0.getCardLogicValue(slot20, slot0) + slot0:getCardLogicValue(slot0)) % 10 == 0 then
										slot19 = 0

										for slot23 = 2, slot2 - 1, 1 do
											if slot23 ~= slot14 and slot23 ~= slot18 then
												slot8[slot19 + 1] = slot4[slot23 + 1]
												slot19 = slot19 + 1
											end
										end

										if slot7 <= slot8[1] % 10 then
											slot23 = slot8[1]
											slot3[1] = slot4[1]
											slot3[2] = slot4[slot14 + 1]
											slot3[3] = slot4[slot18 + 1]
											slot3[4] = slot4[2]
											slot3[5] = slot8[1]

											if slot0.getCardLogicValue(slot21, slot0) % 10 == 0 then
												return 10
											end
										end
									end
								end
							end
						end

						if slot7 ~= 0 then
							return (slot7 % 10 == 0 and 10) or slot7 % 10
						end
					end
				end
			end

			slot10 = 1
		end
	end

	if slot10 == 1 then
		slot14 = slot4[1]

		if slot0.getCardColor(slot12, slot0) == 4 then
			for slot14 = 1, slot2 - 1, 1 do
				for slot18 = 1, slot2 - 1, 1 do
					if slot18 ~= slot14 then
						slot22 = slot4[slot14 + 1]
						slot23 = slot4[slot18 + 1]

						if (slot0.getCardLogicValue(slot20, slot0) + slot0:getCardLogicValue(slot0)) % 10 == 0 then
							slot19 = 0

							for slot23 = 1, slot2 - 1, 1 do
								if slot23 ~= slot14 and slot23 ~= slot18 then
									slot8[slot19 + 1] = slot4[slot23 + 1]
									slot19 = slot19 + 1
								end
							end

							slot3[1] = slot4[1]
							slot3[2] = slot8[1]
							slot3[3] = slot8[2]
							slot3[4] = slot4[slot14 + 1]
							slot3[5] = slot4[slot18 + 1]

							return 10
						end
					end
				end
			end

			slot11 = {}
			slot12 = 0

			for slot16 = 1, slot2 - 1, 1 do
				for slot20 = 1, slot2 - 1, 1 do
					if slot16 ~= slot20 then
						slot24 = slot4[slot16 + 1]
						slot25 = slot4[slot20 + 1]

						if slot12 < (slot0.getCardLogicValue(slot22, slot0) + slot0:getCardLogicValue(slot0)) % 10 then
							slot12 = slot21
							slot22 = 0
							slot11[1] = slot4[slot16 + 1]
							slot11[2] = slot4[slot20 + 1]

							for slot26 = 1, slot2 - 1, 1 do
								if slot26 ~= slot16 and slot26 ~= slot20 then
									slot8[slot22 + 1] = slot4[slot26 + 1]
									slot22 = slot22 + 1
								end
							end

							slot11[3] = slot8[1]
							slot11[4] = slot8[2]
						end
					end
				end
			end

			slot3[1] = slot4[1]
			slot3[2] = slot11[3]
			slot3[3] = slot11[4]
			slot3[4] = slot11[1]
			slot3[5] = slot11[2]
			slot16 = slot11[1]
			slot17 = slot11[2]

			return ((slot0.getCardLogicValue(slot14, slot0) + slot0:getCardLogicValue(slot0)) % 10 == 0 and 10) or slot7 % 10
		end

		for slot14 = 1, slot2 - 1, 1 do
			for slot18 = 1, slot2 - 1, 1 do
				if slot18 ~= slot14 then
					slot22 = slot4[slot14 + 1]
					slot23 = slot4[slot18 + 1]

					if (slot0.getCardLogicValue(slot20, slot0) + slot0:getCardLogicValue(slot0)) % 10 == 0 then
						slot19 = 0

						for slot23 = 1, slot2 - 1, 1 do
							if slot23 ~= slot14 and slot23 ~= slot18 then
								slot8[slot19 + 1] = slot4[slot23 + 1]
								slot19 = slot19 + 1
							end
						end

						slot23 = slot8[1]
						slot24 = slot8[2]

						if slot7 <= (slot0.getCardLogicValue(slot21, slot0) + slot0:getCardLogicValue(slot0)) % 10 then
							slot23 = slot8[1]
							slot24 = slot8[2]
							slot6[1] = slot4[1]
							slot6[2] = slot4[slot18 + 1]
							slot6[3] = slot4[slot14 + 1]
							slot6[4] = slot8[1]
							slot6[5] = slot8[2]
							slot23 = slot3

							TableUtil.copyPropertyTo(slot0:getCardLogicValue(slot0) % 10, slot6)

							if slot0.getCardLogicValue(slot21, slot0) + slot0:getCardLogicValue() % 10 == 0 then
								return 10
							end
						end
					end
				end
			end
		end

		if slot7 ~= 0 then
			return (slot7 % 10 == 0 and 10) or slot7 % 10
		else
			slot10 = 0
		end
	end

	if slot10 == 0 then
		for slot14 = 0, slot2 - 1, 1 do
			for slot18 = 0, slot2 - 1, 1 do
				if slot18 ~= slot14 then
					for slot22 = 0, slot2 - 1, 1 do
						if slot22 ~= slot14 and slot22 ~= slot18 then
							slot26 = slot4[slot14 + 1]
							slot27 = slot4[slot18 + 1]
							slot27 = slot4[slot22 + 1]

							if (slot0.getCardLogicValue(slot24, slot0) + slot0:getCardLogicValue(slot0) + slot0:getCardLogicValue(slot0)) % 10 == 0 then
								slot24 = 0

								for slot28 = 0, slot2 - 1, 1 do
									if slot28 ~= slot14 and slot28 ~= slot18 and slot28 ~= slot22 then
										slot8[slot24 + 1] = slot4[slot28 + 1]
										slot24 = slot24 + 1
									end
								end

								slot28 = slot8[1]
								slot29 = slot8[2]

								if slot7 <= (slot0.getCardLogicValue(slot26, slot0) + slot0:getCardLogicValue(slot0)) % 10 then
									slot28 = slot8[1]
									slot29 = slot8[2]
									slot6[1] = slot4[slot14 + 1]
									slot6[2] = slot4[slot18 + 1]
									slot6[3] = slot4[slot22 + 1]
									slot6[4] = slot8[1]
									slot6[5] = slot8[2]
									slot28 = slot3

									TableUtil.copyPropertyTo(slot0:getCardLogicValue(slot0) % 10, slot6)

									if slot0.getCardLogicValue(slot26, slot0) + slot0:getCardLogicValue() % 10 == 0 then
										return 10
									end
								end
							end
						end
					end
				end
			end
		end

		if slot7 ~= 0 then
			return (slot7 % 10 == 0 and 10) or slot7 % 10
		else
			return 0
		end
	end

	return 0
end

LrnnController.getTimes = function (slot0, slot1, slot2)
	if slot2 ~= LRNN_CONST.LRNN_CONST.MAX_COUNT then
		return 0
	end

	slot7 = slot2
	slot7 = slot0.getCardType(slot4, slot0, slot1)

	return slot0:getTimesByCardType(slot0)
end

LrnnController.getTimesByCardType = function (slot0, slot1)
	if slot1 < 10 then
		return 1
	elseif slot1 == 10 then
		return 2
	end

	return 0
end

LrnnController.getOxCard = function (slot0, slot1, slot2)
	if slot2 ~= LRNN_CONST.MAX_COUNT then
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

			if slot0:getCardLogicValue(slot0) < slot0.getCardLogicValue(slot16, slot0) then
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

LrnnController.isIntValue = function (slot0, slot1)
	return
end

LrnnController.sortCardList = function (slot0, slot1, slot2)
	if slot2 == 0 then
		return
	end

	function slot6(slot0, slot1)
		slot5 = slot0
		slot6 = slot1
		slot7 = slot0
		slot4 = slot0:getCardColor(slot0)
		slot8 = slot1
		slot5 = slot0:getCardColor(slot0)

		if slot0.getCardNewValue(slot3, slot0) == slot0:getCardNewValue(slot0) then
			return slot5 < slot4
		else
			return slot3 < slot2
		end
	end

	table.sort(slot4, slot1)
end

LrnnController.randCardList = function (slot0, slot1, slot2)
	return
end

LrnnController.compareCard = function (slot0, slot1, slot2, slot3, slot4, slot5)
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

	if slot0.getCardNewValue(slot2, slot0) ~= slot0:getCardNewValue(slot0) then
		slot15 = slot8[0]

		if slot0.getCardColor(slot13, slot0) == 4 then
			slot15 = slot9[0]

			if slot0.getCardColor(slot13, slot0) == 4 then
				return slot10 < slot11
			end
		else
			slot15 = slot8[0]

			if slot0.getCardColor(slot13, slot0) ~= 4 then
				slot15 = slot9[0]

				if slot0.getCardColor(slot13, slot0) == 4 then
					return slot11 < slot10
				end
			end
		end

		return slot10 < slot11
	end

	slot15 = slot8[0]
	slot16 = slot9[0]

	return slot0:getCardColor(slot0) < slot0.getCardColor(slot13, slot0)
end

LrnnController.getCardLogicValue = function (slot0, slot1)
	slot5 = slot1
	slot2 = slot0.getCardValue(slot3, slot0)
	slot6 = slot1

	if slot0:getCardColor(slot0) == 4 then
		return 11
	end

	return (slot2 > 10 and 10) or slot2
end

LrnnController.getCardNewValue = function (slot0, slot1)
	slot5 = slot1
	slot2 = slot0.getCardValue(slot3, slot0)
	slot6 = slot1

	if slot0:getCardColor(slot0) == 4 then
		return slot2 + 13 + 2
	end

	return slot2
end

LrnnController.getCardValue = function (slot0, slot1)
	slot5 = LOGIC_MASK_VALUE

	return bit.band(slot3, slot1)
end

LrnnController.getCardColor = function (slot0, slot1)
	slot7 = LOGIC_MASK_COLOR
	slot5 = 4

	return bit.rshift(slot3, bit.band(slot5, slot1))
end

return
