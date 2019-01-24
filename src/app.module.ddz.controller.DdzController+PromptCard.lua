DdzController.clickTips = function (slot0)
	slot3 = slot0

	if not slot0.isFirstHand(slot2) then
		slot3 = slot0

		if slot0.isTurnWinner(slot2) then
			slot3 = slot0

			slot0.promptCanOutCard(slot2)
		else
			slot3 = slot0.model

			if slot0.model.getCanOutCard(slot2) then
				slot3 = slot0.model
				slot3 = slot0.model.getOutCardInfo(slot2).st

				if slot0.model.getOutCardInfo(slot2).ct == DDZ_CT_SINGLE then
					slot8 = 1

					slot0.promptCommonAndStep(slot5, slot0, 1)
				elseif slot2 == DDZ_CT_DOUBLE then
					slot8 = 1

					slot0.promptCommonAndStep(slot5, slot0, 2)
				elseif slot2 == DDZ_CT_THREE then
					slot8 = 1

					slot0.promptCommonAndStep(slot5, slot0, 3)
				elseif slot2 == DDZ_CT_SINGLE_LINE then
					slot8 = slot3

					slot0.promptCommonAndStep(slot5, slot0, 1)
				elseif slot2 == DDZ_CT_DOUBLE_LINE then
					slot8 = slot3

					slot0.promptCommonAndStep(slot5, slot0, 2)
				elseif slot2 == DDZ_CT_THREE_LINE then
					slot8 = slot3

					slot0.promptCommonAndStep(slot5, slot0, 3)
				elseif slot2 == DDZ_CT_THREE_TAKE_ONE then
					slot10 = 1

					slot0.promptAATakeBB(slot5, slot0, 3, 1, 1)
				elseif slot2 == DDZ_CT_THREE_TAKE_TWO then
					slot10 = 1

					slot0.promptAATakeBB(slot5, slot0, 3, 1, 2)
				elseif slot2 == DDZ_CT_FOUR_TAKE_ONE then
					slot10 = 1

					slot0.promptAATakeBB(slot5, slot0, 4, 1, 1)
				elseif slot2 == DDZ_CT_FOUR_TAKE_TWO then
					slot10 = 2

					slot0.promptAATakeBB(slot5, slot0, 4, 1, 2)
				elseif slot2 == DDZ_CT_PLANE_TAKE_SINGLE_WING then
					slot10 = slot3

					slot0.promptAATakeBB(slot5, slot0, 3, slot3, 1)
				elseif slot2 == DDZ_CT_PLANE_TAKE_PAIR_WING then
					slot10 = slot3

					slot0.promptAATakeBB(slot5, slot0, 3, slot3, 2)
				elseif slot2 == DDZ_CT_BOMB_CARD then
					slot8 = 1

					slot0.promptCommonAndStep(slot5, slot0, 4)
				end
			else
				reqDdzPassCard()
			end
		end
	end
end

DdzController.promptCanOutCard = function (slot0)
	slot5 = slot0.model.getMyCards(slot2)
	slot5 = slot0
	slot3 = slot0:findCanOutCard()
	slot4 = {}

	if slot0.analyzeCardInfo(slot0.model, slot0).ct ~= DDZ_CT_ERROR and slot3.rocketDic == nil then
		slot7 = slot1

		for slot8, slot9 in pairs(slot6) do
			slot4[slot9] = true
		end
	else
		slot5 = {}

		if slot3.ctDic ~= nil then
			slot9 = slot3.ctDic
			slot5 = slot0.filterMinValueDic(slot7, slot0)
		elseif slot3.boomDic ~= nil then
			slot9 = slot3.boomDic
			slot5 = slot0.filterMinValueDic(slot7, slot0)
		elseif slot3.rocketDic ~= nil then
			slot5 = {
				slot3.rocketDic[DDZ_CV_BIG_JOKER][1],
				slot3.rocketDic[DDZ_CV_LITTLE_JOKER][1]
			}
		end

		slot8 = slot5

		for slot9, slot10 in pairs(slot7) do
			slot4[slot10] = true
		end
	end

	slot8 = slot4

	slot0.model.setSelectedOutCardsDic(slot6, slot0.model)
end

DdzController.resetTipsInfo = function (slot0, slot1, slot2)
	slot4 = slot0.model.getCanOutDataArr(slot5)
	slot2 = slot2 or 1
	slot8 = {
		nonCt = slot4.ctArr == nil,
		nonBoom = slot4.boomArr == nil,
		nonRocket = slot4.rocketArr == nil,
		isShowCt = not ()["nonCt"],
		isShowBoom = not ()["nonBoom"] and ()["nonCt"],
		isShowRocket = not ()["nonRocket"] and ()["nonCt"] and ()["nonBoom"],
		boomI = 1,
		beginI = 1,
		endI = (()["beginI"] + slot1) - 1
	}

	slot0.model.setTipsInfo(slot0.model, slot0.model)

	if slot2 then
		slot8 = slot2

		slot0.findWingArr(slot6, slot0)
	end
end

DdzController.promptCommonAndStep = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if not slot0.model.getTipsInfo(slot4) then
		slot6 = slot2

		slot0.resetTipsInfo(slot4, slot0)
	else
		slot7 = slot2

		slot0.findCommonAndStepIndex(slot4, slot0, slot1)
	end

	slot6 = slot1

	slot0.promptCards(slot4, slot0)
end

DdzController.promptAATakeBB = function (slot0, slot1, slot2, slot3, slot4)
	slot7 = slot0.model

	if not slot0.model.getTipsInfo(slot6) then
		slot10 = slot4

		slot0.resetTipsInfo(slot7, slot0, slot2)
	else
		if slot5.isShowCt then
			slot9 = slot4

			slot0.findWingArr(slot7, slot0)
		end

		if not slot5.isShowCt or (slot5.isShowCt and slot5.wingIsEnd) then
			slot10 = slot2

			slot0.findCommonAndStepIndex(slot7, slot0, slot1)
		end
	end

	slot10 = slot3

	slot0.promptCards(slot7, slot0, slot1)
end

DdzController.findCommonAndStepIndex = function (slot0, slot1, slot2)
	slot5 = slot0.model
	slot4 = slot0.model.getCanOutDataArr(slot4).ctArr
	slot5 = slot0.model.getCanOutDataArr(slot4).boomArr
	slot8 = slot0.model

	if slot0.model.getTipsInfo(slot7).isShowCt then
		slot9 = slot4

		if table.nums(slot8) <= slot6.endI then
			slot11 = slot2

			slot0.resetTipsInfo(slot9, slot0)

			slot10 = slot0.model

			if not slot0.model.getTipsInfo(slot9).nonBoom then
				slot6.isShowBoom = true
				slot6.isShowCt = false
				slot6.isShowRocket = false
			elseif not slot6.nonRocket then
				slot6.isShowRocket = true
				slot6.isShowCt = false
				slot6.isShowBoom = false
			end
		else
			slot6.beginI = slot6.beginI + 1
			slot6.endI = (slot6.beginI + slot2) - 1

			if slot6.endI - slot6.beginI ~= slot4[slot6.endI] - slot4[slot6.beginI] then
				slot6.beginI = slot6.endI
				slot6.endI = (slot6.beginI + slot2) - 1
			end
		end
	elseif slot6.isShowBoom then
		slot9 = slot5

		if table.nums(slot8) <= slot6.boomI then
			slot11 = slot2

			slot0.resetTipsInfo(slot9, slot0)

			slot10 = slot0.model

			if not slot0.model.getTipsInfo(slot9).nonRocket then
				slot6.isShowRocket = true
				slot6.isShowBoom = false
				slot6.isShowCt = false
			elseif not slot6.nonCt then
				slot6.isShowCt = true
				slot6.isShowBoom = false
				slot6.isShowRocket = false
			end
		else
			slot6.boomI = slot6.boomI + 1
		end
	elseif slot6.isShowRocket then
		slot10 = slot2

		slot0.resetTipsInfo(slot8, slot0)

		slot9 = slot0.model

		if not slot0.model.getTipsInfo(slot8).nonCt then
			slot6.isShowCt = true
			slot6.isShowRocket = false
			slot6.isShowBoom = false
		elseif not slot6.nonBoom then
			slot6.isShowBoom = true
			slot6.isShowRocket = false
			slot6.isShowCt = false
		end
	end

	slot10 = slot6

	slot0.model.setTipsInfo(slot8, slot0.model)
end

DdzController.findWingArr = function (slot0, slot1)
	slot2 = slot0.model.getTipsInfo(slot3)
	slot5 = slot0.model

	if not slot0.model.getCanOutDataDic(slot0.model).bbDic then
		return
	end

	slot6 = slot0.model
	slot8 = slot0.model
	slot6 = slot0.model.getCanOutDataArr(slot7)
	slot7 = slot3.bbDic
	slot8 = slot6.bbColorArr
	slot9 = slot6.bbArr
	slot10 = slot6.ctArr
	slot11 = 0

	if slot0.model.getOutCardInfo(slot5).ct == DDZ_CT_THREE_TAKE_ONE or slot4.ct == DDZ_CT_PLANE_TAKE_SINGLE_WING then
		slot14 = slot8
		slot11 = table.nums(slot13)
	else
		slot14 = slot9
		slot11 = table.nums(slot13)
	end

	if not slot2.wingBeginI then
		slot2.wingBeginI = 1
		slot2.wingIsEnd = nil
	elseif slot11 < (slot2.wingBeginI + slot1) - 1 then
		slot2.wingBeginI = 1
		slot2.wingIsEnd = true
	else
		slot2.wingBeginI = slot2.wingBeginI + 1
		slot2.wingIsEnd = nil
	end

	slot12 = {}
	slot13 = {}
	slot14 = slot3.ctDic

	for slot18 = slot2.beginI, slot2.endI, 1 do
		slot23 = slot14[slot10[slot18]]

		for slot24, slot25 in pairs(slot22) do
			slot12[slot25] = true
		end

		slot13[slot19] = true
	end

	slot2.wingArr = {}

	if slot5 then
		while slot12[slot8[slot2.wingBeginI]] do
			slot2.wingBeginI = slot2.wingBeginI + 1
		end

		for slot18 = slot2.wingBeginI, slot11, 1 do
			if not slot12[slot8[slot18]] then
				slot22 = slot8[slot18]

				table.insert(slot20, slot2.wingArr)

				slot21 = slot2.wingArr

				if table.nums(slot20) == slot1 then
					break
				end
			end
		end

		slot17 = slot2.wingArr

		if table.nums(slot16) < slot1 then
			for slot18 = 1, slot2.wingBeginI - 1, 1 do
				if not slot12[slot8[slot18]] then
					slot22 = slot8[slot18]

					table.insert(slot20, slot2.wingArr)
				end

				slot21 = slot2.wingArr

				if table.nums(slot20) == slot1 then
					break
				end
			end
		end
	else
		while slot13[slot9[slot2.wingBeginI]] do
			slot2.wingBeginI = slot2.wingBeginI + 1
		end

		for slot18 = slot2.wingBeginI, slot11, 1 do
			if not slot13[slot9[slot18]] then
				slot24 = slot7[slot9[slot18]][1]

				table.insert(slot22, slot2.wingArr)

				slot24 = slot7[slot9[slot18]][2]

				table.insert(slot22, slot2.wingArr)

				slot23 = slot2.wingArr

				if table.nums(slot22) == slot1 * 2 then
					break
				end
			end
		end

		slot17 = slot2.wingArr

		if table.nums(slot16) < slot1 * 2 then
			for slot18 = 1, slot2.wingBeginI - 1, 1 do
				if not slot13[slot9[slot18]] then
					slot24 = slot7[slot9[slot18]][1]

					table.insert(slot22, slot2.wingArr)

					slot24 = slot7[slot9[slot18]][2]

					table.insert(slot22, slot2.wingArr)
				end

				slot21 = slot2.wingArr

				if table.nums(slot20) == slot1 * 2 then
					break
				end
			end
		end
	end

	slot18 = slot2

	slot0.model.setTipsInfo(slot16, slot0.model)
end

DdzController.promptCards = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if slot0.model.getTipsInfo(slot4).isShowBoom then
		slot6 = slot0

		slot0.promptBoom(slot5)
	elseif slot3.isShowCt then
		slot8 = slot2

		slot0.promptCt(slot5, slot0, slot1)
	elseif slot3.isShowRocket then
		slot6 = slot0

		slot0.promptRocket(slot5)
	end
end

DdzController.promptCt = function (slot0, slot1, slot2)
	slot7 = slot0.model
	slot7 = slot0.model.getCanOutDataDic(slot0.model).ctDic
	slot10 = slot0.model.getCanOutDataArr(slot4).ctArr
	slot8 = table.nums(slot9)
	slot9 = {}

	for slot13 = slot0.model.getTipsInfo(slot0.model).beginI, slot0.model.getTipsInfo(slot0.model).endI, 1 do
		slot15 = slot7[slot6[slot13]]

		for slot19 = 1, slot1, 1 do
			slot9[slot15[slot19]] = true
		end
	end

	if slot5.wingArr then
		slot12 = slot5.wingArr

		if table.nums(slot11) > 0 then
			slot12 = slot5.wingArr

			for slot13, slot14 in pairs(slot11) do
				slot9[slot14] = true
			end
		end
	end

	slot13 = slot9

	slot0.model.setSelectedOutCardsDic(slot11, slot0.model)

	slot13 = slot5

	slot0.model.setTipsInfo(slot11, slot0.model)
end

DdzController.promptBoom = function (slot0)
	slot5 = slot0.model
	slot8 = {}
	slot11 = slot0.model.getCanOutDataDic(slot0.model).boomDic[slot0.model.getCanOutDataArr(slot0.model).boomArr[slot0.model.getTipsInfo(slot2).boomI]]

	for slot12, slot13 in pairs(slot10) do
		slot8[slot13] = true
	end

	slot12 = slot8

	slot0.model.setSelectedOutCardsDic(slot10, slot0.model)

	slot12 = slot1

	slot0.model.setTipsInfo(slot10, slot0.model)
end

DdzController.promptRocket = function (slot0)
	slot3 = slot0.model
	slot8 = true

	slot0.model.setSelectedOutCardsDic(true, slot0.model, slot3)

	slot7 = tipsInfo

	slot0.model.setTipsInfo(true, slot0.model)
end

return
