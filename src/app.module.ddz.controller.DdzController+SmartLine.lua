DdzController.initSmartLineSignal = function (slot0)
	slot5 = slot0

	slot0.model.selectedOutCardsDicChangedSignal.add(slot2, slot0.model.selectedOutCardsDicChangedSignal, slot0.onSelectedOutCardsDicChanged)
end

DdzController.onSelectedOutCardsDicChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getSelectedOutCardsDic(slot2) ~= nil then
		slot5 = slot0.model

		if table.nums(slot0.model.getSelectedOutCardsDic(slot4)) == 0 then
			slot3 = slot0

			slot0.resetLineInfo(slot2)
		end
	end
end

DdzController.smartLine = function (slot0)
	slot1, slot2 = nil
	slot3 = slot0.model.getOutCardInfo(slot4)
	slot6 = slot0

	if not slot0.isNonOutCard(slot0.model) then
		slot6 = slot0

		if not slot0.isTurnWinner(slot5) then
			slot7 = slot0.model

			if DDZ_VIEW_CHAIRID_ME == slot0.model.getCurrentUser(slot6) then
				slot2 = slot3.dot
				slot1 = slot3.ct
			end
		end
	end

	slot4 = {}
	slot5, slot6 = nil
	slot7 = slot3
	slot8 = slot0.model.getSelectedOutCardsDic(slot9)
	slot9 = slot0.model.getMyCards(slot0.model)
	slot12 = slot0
	slot10, slot13, slot14 = slot0.findIndexInSelectedCard(slot0.model)

	for slot16 = slot11, slot12, 1 do
		slot20 = slot9[slot16]

		table.insert(slot18, slot4)
	end

	slot15 = slot0.model
	slot13 = slot0.model.getMyCardsColorDic(slot14)

	if slot0.model._lineType == DDZ_LINE_SINGLE_CLICK then
		slot16 = slot0

		if not slot0.isNonOutCard(slot15) then
			slot16 = slot0

			if not slot0.isTurnWinner(slot15) then
				slot0.model._isOpenLine = false
				slot19, slot15 = gameMgr.calPukeInfo(false, gameMgr)
				slot16 = slot0.convertDetailToCv(slot9[slot11], slot0)

				if (slot9[slot11] == PUKE_JOKER_BIG or slot9[slot11] == PUKE_JOKER_SMALL) and slot9[PUKE_JOKER_BIG] ~= nil and slot9[PUKE_JOKER_SMALL] ~= nil then
					slot8[PUKE_JOKER_BIG] = true
					slot8[PUKE_JOKER_SMALL] = true
				elseif slot1 == DDZ_CT_THREE_TAKE_TWO or slot1 == DDZ_CT_THREE_TAKE_ONE then
					slot19 = slot13[slot14]

					if table.nums(slot18) == 3 and slot2 < slot16 then
						slot8 = {}
						slot19 = slot13[slot14]

						for slot20, slot21 in pairs(slot18) do
							slot8[slot21] = true
						end
					end
				elseif slot1 == DDZ_CT_DOUBLE then
					slot19 = slot13[slot14]

					if table.nums(slot18) >= 2 and slot2 < slot16 then
						slot8 = {}
						slot17 = false
						slot21 = slot13[slot14]

						for slot21 = 1, table.nums(slot20), 1 do
							slot26 = slot13[slot14][slot21]
							slot23, slot24 = gameMgr.calPukeInfo(slot24, gameMgr)

							if slot24 == slot15 then
								slot8[slot22] = true
							elseif not slot17 then
								slot8[slot22] = true
								slot17 = true
							end
						end
					end
				else
					slot0.model._isOpenLine = true
				end
			end
		end
	elseif slot0.model._lineType == DDZ_LINE_LINK_CLICK then
		slot0.model._isOpenLine = false
		slot16 = slot0

		if not slot0.isNonOutCard(false) then
			slot16 = slot0

			if not slot0.isTurnWinner(slot15) and (slot1 == DDZ_CT_SINGLE_LINE or slot1 == DDZ_CT_DOUBLE_LINE) then
				slot18 = slot3
				slot17 = slot0.findCanFollowCard(slot15, slot0, slot4)
				slot6 = slot0.model.onCanOutDataDicChanged(slot15, slot0.model)
			end
		end
	elseif slot0.model._lineType == DDZ_LINE_PADDLE then
		slot0.model._isOpenLine = false
		slot16 = slot0

		if not slot0.isNonOutCard(false) then
			slot16 = slot0

			if slot0.isTurnWinner(slot15) or slot0._currentUser ~= DDZ_VIEW_CHAIRID_ME then
				slot20 = {
					{
						dot = 0,
						st = 2,
						ct = DDZ_CT_THREE_LINE
					},
					{
						dot = 0,
						st = 3,
						ct = DDZ_CT_DOUBLE_LINE
					},
					{
						dot = 0,
						st = 5,
						ct = DDZ_CT_SINGLE_LINE
					}
				}

				for slot21, slot22 in pairs(slot19) do
					slot27 = slot22
					slot26 = slot0.findCanFollowCard(slot24, slot0, slot4)
					slot6 = slot0.model.onCanOutDataDicChanged(slot24, slot0.model)

					if slot0.findCanFollowCard(slot24, slot0, slot4) ~= nil and slot5.ctDic ~= nil then
						slot7 = slot22

						break
					end
				end
			elseif slot1 == DDZ_CT_SINGLE_LINE or slot1 == DDZ_CT_DOUBLE_LINE or slot1 == DDZ_CT_THREE_LINE or slot1 == DDZ_CT_PLANE_TAKE_SINGLE_WING or slot1 == DDZ_CT_THREE_TAKE_ONE then
				slot17 = slot4
				slot17 = slot0.findCanFollowCard(slot15, slot0)
				slot6 = slot0.model.onCanOutDataDicChanged(slot15, slot0.model)
			end
		end
	end

	function slot14()
		if slot0 == nil or slot0.ctDic == nil then
			return
		end

		slot2 = slot2

		if not slot2.isNonOutCard({}) then
			slot2 = slot2

			if slot2.isTurnWinner(slot1) or slot2._currentUser ~= DDZ_VIEW_CHAIRID_ME then
				slot0 = 0
				slot4 = slot3.ctArr

				for slot4 = 1, table.nums(slot3), 1 do
					slot5 = slot3.ctArr[slot4]

					if slot0 == 0 or slot5 == slot0 + 1 then
						slot6 = slot0.ctDic[slot5]

						for slot11 = 1, DDZ_AACOMMON_NUM[slot4.ct], 1 do
							slot1[slot6[slot11]] = true
						end

						slot0 = slot5
					else
						break
					end
				end
			else
				for slot3 = 1, slot4.st, 1 do
					slot5 = slot0.ctDic[slot3.ctArr[slot3]]

					for slot10 = 1, DDZ_AACOMMON_NUM[slot4.ct], 1 do
						slot1[slot5[slot10]] = true
					end
				end
			end
		end

		if slot3.bbColorArr == nil then
			return
		end

		for slot3 = 1, slot4.st * 2, 1 do
			slot5 = slot3.bbColorArr[slot3]

			while slot1[slot5] do
				slot5 = slot3.bbColorArr[slot4 + 1]
			end

			slot1[slot5] = true
		end
	end

	if slot0.model._lineType ~= DDZ_LINE_SINGLE_CLICK then
		slot14()
	end

	slot19 = true

	slot0.model.setSelectedOutCardsDic(slot16, slot0.model, slot8)
end

DdzController.resetLineInfo = function (slot0)
	slot0.model._lineType = DDZ_LINE_NON
	slot3 = slot0.model

	if slot0.model.getSelectedOutCardsDic(DDZ_LINE_NON) then
		slot5 = slot0.model

		if table.nums(slot0.model.getSelectedOutCardsDic(slot4)) == 0 then
			slot0.model._isOpenLine = true
		else
			slot0.model._isOpenLine = false
		end
	end
end

DdzController.findIndexInSelectedCard = function (slot0, slot1)
	slot2 = {}
	slot3 = slot0.model.getMyCardsIndexDic(slot4)
	slot7 = slot0.model.getSelectedOutCardsDic(slot0.model)

	for slot8, slot9 in pairs(slot0.model) do
		slot14 = slot3[slot8]

		table.insert(slot12, slot2)
	end

	table.sort(slot6, slot2)

	slot9 = slot2

	return slot2, slot2[1], slot2[table.nums(function (slot0, slot1)
		return slot0 < slot1
	end)]
end

return
