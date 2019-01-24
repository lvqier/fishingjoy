slot2 = "DdzReportSheetOtherPukeCcsView"
DdzReportSheetOtherPukeCcsView = class(slot1)

DdzReportSheetOtherPukeCcsView.onCreationComplete = function (slot0)
	slot6 = false

	createSetterGetter(slot2, slot0, "viewChairId", 0)

	slot5 = slot0

	slot0.model.curIdxChangedSignal.add(slot2, slot0.model.curIdxChangedSignal, slot0.onCurIdxChanged)

	slot0._pukeNodes = {}
	slot2 = slot0["puke" .. 1]

	while slot2 do
		slot6 = slot2

		table.insert(slot4, slot0._pukeNodes)

		slot2 = slot0["puke" .. slot1 + 1]
	end

	slot0._isHand = slot0.buchu == nil
end

DdzReportSheetOtherPukeCcsView.onCurIdxChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCurIdx(slot2) == -1 then
		slot5 = slot0._isHand

		slot0.setVisible(slot3, slot0)

		if slot0.buchu then
			slot5 = false

			slot0.buchu.setVisible(slot3, slot0.buchu)
		end

		if slot0._isHand then
			slot2 = slot0.model.getReportUsersInfoDic(slot3)[slot0._viewChairId]
			slot5 = slot0._pukeNodes

			for slot6, slot7 in ipairs(slot0.model) do
				slot11 = slot2.handcard[slot6] ~= nil

				slot7.setVisible(slot9, slot7)

				if slot2.handcard[slot6] ~= nil then
					slot11 = slot2.handcard[slot6]

					slot7.root.setDataInt(slot9, slot7.root)
				end
			end
		end
	elseif slot1 >= 0 then
		slot6 = slot0.model

		if slot1 < table.nums(slot0.model.getReportStepDatasDic(slot5)) then
			slot4 = slot0.model
			slot6 = slot0.model

			if slot0.model.getReportStepDatasDic(slot3)[slot0.model.getCurIdx(slot5)].chairid ~= slot0.model._viewChairIdDic[slot0._viewChairId] then
				if not slot0._isHand then
					slot7 = slot0.model

					if slot0.model.getWinnerDic(slot6)[slot1] then
						slot7 = slot0._pukeNodes

						for slot8, slot9 in ipairs(slot6) do
							slot13 = false

							slot9.setVisible(slot11, slot9)
						end

						slot8 = false

						slot0.buchu.setVisible(slot6, slot0.buchu)
					end
				end

				return
			end

			slot8 = true

			slot0.setVisible(slot6, slot0)

			slot5 = nil

			if slot0._isHand then
				slot5 = slot4.handcard
			else
				slot8 = slot4.outcard
				slot9 = TableUtil.copyDataDep(slot7)
				slot10 = slot0.controller.analyzeCardInfo(slot7, slot0.controller).ct

				if slot0.model.isAaTakeBb(slot0.controller, slot0.model) then
					slot10 = slot5
					slot5 = slot0.model.sortAaTakeBbCards(slot8, slot0.model)
				else
					slot9 = slot5
					slot13 = slot0.model.sortCardsUp

					table.sort(slot8, handler(slot11, slot0))
				end

				if slot0._viewChairId ~= DDZ_VIEW_CHAIRID_RIGHT then
					slot9 = slot5
					slot5 = TableUtil.reverse(slot8)
				end
			end

			if slot5 ~= nil then
				slot8 = slot5
				slot6 = table.nums(slot7) > 0

				if not slot0._isHand then
					slot10 = not slot6

					slot0.buchu.setVisible(slot8, slot0.buchu)
				end
			end

			slot9 = slot0._pukeNodes

			for slot10, slot11 in ipairs(slot8) do
				if slot6 then
					slot16 = slot5[slot10] ~= nil

					slot11.setVisible(slot14, slot11)

					if slot12 then
						slot16 = slot12

						slot11.root.setDataInt(slot14, slot11.root)
					end
				else
					slot15 = false

					slot11.setVisible(slot13, slot11)
				end
			end
		end
	end
end

return
