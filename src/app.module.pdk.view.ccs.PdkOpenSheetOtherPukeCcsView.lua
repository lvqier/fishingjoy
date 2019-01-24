slot2 = "PdkOpenSheetOtherPukeCcsView"
PdkOpenSheetOtherPukeCcsView = class(slot1)

PdkOpenSheetOtherPukeCcsView.onCreationComplete = function (slot0)
	slot5 = slot0

	slot0.model.androidCardsChangedSignal.add(slot2, slot0.model.androidCardsChangedSignal, slot0.onAndroidCardsChanged)

	slot3 = slot0

	if slot0.getName(slot2) == "leftOpenPukeSheet" then
		slot0._chairId = PDK_VIEW_CHAIRID_LEFT
	else
		slot3 = slot0

		if slot0.getName(slot2) == "rightOpenPukeSheet" then
			slot0._chairId = PDK_VIEW_CHAIRID_RIGHT
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

	slot0.onAndroidCardsChanged(slot4)
end

PdkOpenSheetOtherPukeCcsView.onAndroidCardsChanged = function (slot0)
	slot3 = slot0.model
	slot2 = false

	if slot0.model.getAndroidCards(slot2) then
		if slot1[slot0._chairId] then
			slot6 = slot3

			if table.nums(slot5) == 0 then
				return
			end
		end

		slot2 = true
		slot6 = slot0._pukesArray

		for slot7, slot8 in ipairs(slot5) do
			slot13 = slot3[slot7] ~= nil

			slot8.setVisible(slot11, slot8)

			if slot3[slot7] ~= nil then
				slot13 = slot3[slot7]

				slot8.root.setDataInt(slot11, slot8.root)
			end
		end
	end

	slot6 = slot2

	slot0.setVisible(slot4, slot0)
end

return
