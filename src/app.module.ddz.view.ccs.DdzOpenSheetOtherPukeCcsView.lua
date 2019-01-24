slot2 = "DdzOpenSheetOtherPukeCcsView"
DdzOpenSheetOtherPukeCcsView = class(slot1)

DdzOpenSheetOtherPukeCcsView.onCreationComplete = function (slot0)
	slot5 = slot0

	slot0.model.openCardsChangedSignal.add(slot2, slot0.model.openCardsChangedSignal, slot0.onOpenCardsChanged)

	slot5 = slot0

	slot0.model.isShowOpenSheetChangedSignal.add(slot2, slot0.model.isShowOpenSheetChangedSignal, slot0.onIsShowOpenSheetChanged)

	slot3 = slot0

	if slot0.getName(slot2) == "leftOpenPukeSheet" then
		slot0._chairId = DDZ_VIEW_CHAIRID_LEFT
	else
		slot3 = slot0

		if slot0.getName(slot2) == "rightOpenPukeSheet" then
			slot0._chairId = DDZ_VIEW_CHAIRID_RIGHT
		end
	end

	slot5 = 1
	slot2 = slot0["puke" .. tostring(slot4)]
	slot0._pukesArray = {}

	while slot2 do
		slot6 = slot2

		table.insert(slot4, slot0._pukesArray)

		slot6 = slot1 + 1
		slot2 = slot0["puke" .. tostring(slot0._pukesArray)]
	end

	slot5 = slot0

	slot0.onOpenCardsChanged(slot4)

	slot5 = slot0

	slot0.onIsShowOpenSheetChanged(slot4)
end

DdzOpenSheetOtherPukeCcsView.onIsShowOpenSheetChanged = function (slot0)
	slot3 = slot0
	slot1 = slot0.setVisible
	slot6 = slot0.model

	if slot0.model.getIsShowOpenSheet(slot5) then
		slot7 = slot0.model
		slot4 = slot0._chairId == slot0.model.getOpenUser(slot6)

		slot1(slot2, slot3)

		return
	end
end

DdzOpenSheetOtherPukeCcsView.onOpenCardsChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getOpenCards(slot2) then
		slot4 = slot0.model

		if slot0.model.getOpenUser(slot3) == slot0._chairId then
			slot4 = slot0._pukesArray

			for slot5, slot6 in ipairs(slot3) do
				slot11 = slot1[slot5] ~= nil

				slot6.setVisible(slot9, slot6)

				if slot1[slot5] ~= nil then
					slot11 = slot1[slot5]

					slot6.root.setDataInt(slot9, slot6.root)
				end
			end
		end
	end
end

DdzOpenSheetOtherPukeCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.openCardsChangedSignal.remove(slot2, slot0.model.openCardsChangedSignal, slot0.onOpenCardsChanged)

	slot5 = slot0

	slot0.model.isShowOpenSheetChangedSignal.remove(slot2, slot0.model.isShowOpenSheetChangedSignal, slot0.onIsShowOpenSheetChanged)
end

return
