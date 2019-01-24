PdkController.clickTips = function (slot0)
	slot3 = slot0.model
	slot3 = slot0.model.getOutCardInfo(slot2).st

	if slot0.model.getOutCardInfo(slot2).ct == PDK_CT_SINGLE then
		slot8 = 1

		slot0.promptCommonAndStep(slot5, slot0, 1)
	elseif slot2 == PDK_CT_DOUBLE then
		slot8 = 1

		slot0.promptCommonAndStep(slot5, slot0, 2)
	elseif slot2 == PDK_CT_SINGLE_LINE then
		slot8 = slot3

		slot0.promptCommonAndStep(slot5, slot0, 1)
	elseif slot2 == PDK_CT_DOUBLE_LINE then
		slot8 = slot3

		slot0.promptCommonAndStep(slot5, slot0, 2)
	elseif slot2 == PDK_CT_THREE_TAKE_TWO then
		slot10 = 2

		slot0.promptAATakeBB(slot5, slot0, 3, 1, 2)
	elseif slot2 == PDK_CT_PLANE_TAKE_PAIR_WING then
		slot10 = slot3 * 2

		slot0.promptAATakeBB(slot5, slot0, 3, slot3, 2)
	elseif slot2 == PDK_CT_BOMB_CARD then
		slot8 = 1

		slot0.promptCommonAndStep(slot5, slot0, 4)
	end
end

PdkController.resetTipsInfo = function (slot0, slot1, slot2)
	slot7 = slot0.model
	slot6 = slot0.model.getCanOutDataArrValue(slot0.model.getCanOutDataDicValue(slot0.model)).bbColorArr
	slot2 = slot2 or 1

	if slot6 then
		slot7 = {}
		slot10 = slot6
		slot8 = table.nums(slot9)

		for slot12 = slot3.beginI, slot3.endI, 1 do
			slot14 = slot5.ctDic[slot4.ctArr[slot12]]

			for slot18 = 1, 3, 1 do
				slot7[slot14[slot18]] = true
			end
		end

		slot12 = slot6

		for slot12 = slot3.wingBeginI, table.nums(slot11), 1 do
			if not slot7[slot6[slot12]] then
				slot16 = slot6[slot12]

				table.insert(slot14, slot3.wingArr)

				slot15 = slot3.wingArr

				if table.nums(slot14) == slot2 then
					break
				end
			end
		end

		if slot3.wingBeginI > slot8 - slot2 then
			slot3.wingIsEnd = true
		end
	end

	slot10 = slot3

	slot0.model.setTipsInfo(slot8, slot0.model)
end

PdkController.promptCommonAndStep = function (slot0, slot1, slot2)
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

PdkController.promptAATakeBB = function (slot0, slot1, slot2, slot3, slot4)
	slot7 = slot0.model

	if not slot0.model.getTipsInfo(slot6) then
		slot10 = slot4

		slot0.resetTipsInfo(slot7, slot0, slot2)
	else
		if not slot5.isShowCt or (slot5.isShowCt and slot5.wingIsEnd) then
			slot10 = slot2

			slot0.findCommonAndStepIndex(slot7, slot0, slot1)
		end

		slot8 = slot0.model

		if slot0.model.getTipsInfo(slot7).isShowCt then
			slot10 = slot4

			slot0.findAATakeBBIndex(slot7, slot0, slot2)
		end
	end

	slot10 = slot3

	slot0.promptCards(slot7, slot0, slot1)
end

PdkController.findCommonAndStepIndex = function (slot0, slot1, slot2)
	slot5 = slot0.model
	slot4 = slot0.model.getCanOutDataArrValue(slot4).ctArr
	slot5 = slot0.model.getCanOutDataArrValue(slot4).boomArr
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

			if not slot0.model.getTipsInfo(slot9).nonCt then
				slot6.isShowCt = true
				slot6.isShowBoom = false
			end
		else
			slot6.boomI = slot6.boomI + 1
		end
	end

	slot10 = slot6

	slot0.model.setTipsInfo(slot8, slot0.model)
end

PdkController.findAATakeBBIndex = function (slot0, slot1, slot2)
	slot7 = slot0.model
	slot7 = slot0.model.getCanOutDataArrValue(slot0.model).ctArr
	slot8 = slot0.model.getCanOutDataDicValue(slot0.model).ctDic
	slot11 = slot0.model.getCanOutDataArrValue(slot0.model).bbColorArr
	slot9 = table.nums(slot10)
	slot10 = {}

	for slot14 = slot0.model.getTipsInfo(slot4).beginI, slot0.model.getTipsInfo(slot4).endI, 1 do
		slot19 = slot8[slot7[slot14]]

		for slot20, slot21 in pairs(slot18) do
			slot10[slot21] = true
		end
	end

	if slot3.wingBeginI > slot9 - slot2 then
		slot3.wingIsEnd = true
		slot3.wingBeginI = 1
	else
		slot3.wingIsEnd = false
		slot3.wingBeginI = slot3.wingBeginI + 1
	end

	while slot10[slot6[slot3.wingBeginI]] do
		slot3.wingBeginI = slot3.wingBeginI + 1
	end

	slot3.wingArr = {}

	for slot14 = slot3.wingBeginI, slot9, 1 do
		if not slot10[slot6[slot14]] then
			slot18 = slot6[slot14]

			table.insert(slot16, slot3.wingArr)

			slot17 = slot3.wingArr

			if table.nums(slot16) == slot2 then
				break
			end
		end
	end

	slot13 = slot3.wingArr

	if table.nums(slot12) < slot2 then
		for slot14 = 1, slot3.wingBeginI - 1, 1 do
			if not slot10[slot6[slot14]] then
				slot18 = slot6[slot14]

				table.insert(slot16, slot3.wingArr)
			end
		end
	end

	slot14 = slot3

	slot0.model.setTipsInfo(slot12, slot0.model)
end

PdkController.promptCards = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if slot0.model.getTipsInfo(slot4).isShowBoom then
		slot6 = slot0

		slot0.promptBoom(slot5)
	elseif slot3.isShowCt then
		slot8 = slot2

		slot0.promptCt(slot5, slot0, slot1)
	end
end

PdkController.promptCt = function (slot0, slot1, slot2)
	slot7 = slot0.model
	slot7 = slot0.model.getCanOutDataDicValue(slot0.model).ctDic
	slot10 = slot0.model.getCanOutDataArrValue(slot4).ctArr
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

PdkController.promptBoom = function (slot0)
	slot5 = slot0.model
	slot8 = {}
	slot11 = slot0.model.getCanOutDataDicValue(slot0.model).boomDic[slot0.model.getCanOutDataArrValue(slot0.model).boomArr[slot0.model.getTipsInfo(slot2).boomI]]

	for slot12, slot13 in pairs(slot10) do
		slot8[slot13] = true
	end

	slot12 = slot8

	slot0.model.setSelectedOutCardsDic(slot10, slot0.model)

	slot12 = slot1

	slot0.model.setTipsInfo(slot10, slot0.model)
end

return
