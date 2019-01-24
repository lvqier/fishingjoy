slot2 = "ComponentsGroup"
ComponentsGroup = class(slot1)

ComponentsGroup.ctor = function (slot0, slot1, slot2)
	slot0._isHorV = slot2
	slot0._displayObjs = slot1
	slot0._posMin = 0
	slot0._posMax = 0
	slot0._gap = 0
	slot0._curShowNum = nil
	slot7 = true

	createSetterGetter(slot4, slot0, "isAlignMid")

	slot7 = true

	createSetterGetter(slot4, slot0, "isUp2DownWhileV")

	slot5 = slot0

	slot0.checkPositions(slot4)
end

ComponentsGroup.showThese = function (slot0, slot1, slot2)
	slot3 = {}
	slot4 = {}
	slot5 = 0
	slot8 = slot1

	for slot9, slot10 in ipairs(slot7) do
		slot14 = slot10

		if table.indexof(slot12, slot0._displayObjs) then
			slot5 = slot5 + 1
			slot14 = slot10

			table.insert(slot12, slot3)

			slot4[slot10] = true
		end
	end

	slot8 = slot0._displayObjs

	for slot9, slot10 in ipairs(slot7) do
		if not slot4[slot10] then
			slot14 = slot10

			table.insert(slot12, slot3)
		end
	end

	slot0._displayObjs = slot3
	slot11 = true

	slot0.arrange(slot7, slot0, slot5, slot2)
end

ComponentsGroup.arrange = function (slot0, slot1, slot2, slot3, slot4)
	slot4 = slot4 or 0

	if slot0._curShowNum == slot1 and not slot3 then
		return
	end

	slot0._curShowNum = slot1
	slot2 = slot2 or 0
	slot5 = 0

	if slot0._isAlignMid then
		slot5 = (#slot0._displayObjs - slot1) * slot0._gap * 0.5 - slot4
	end

	slot6 = ""
	slot6 = (slot0._isHorV and "setPositionX") or "setPositionY"
	slot9 = slot0._displayObjs

	for slot10, slot11 in ipairs(slot8) do
		slot16 = slot10 <= slot1

		slot11.setVisible(slot14, slot11)

		if slot10 <= slot1 then
			if slot0._isHorV then
				slot16 = slot0._posMin + slot5 + (slot10 - 1) * (slot0._gap + slot4) + slot2

				slot11[slot6](slot14, slot11)
			elseif slot0._isUp2DownWhileV then
				slot16 = slot0._posMax - slot5 - (slot10 - 1) * (slot0._gap + slot4) + slot2

				slot11[slot6](slot14, slot11)
			else
				slot16 = slot0._posMin + slot5 + (slot10 - 1) * (slot0._gap + slot4) + slot2

				slot11[slot6](slot14, slot11)
			end
		end
	end
end

ComponentsGroup.checkPositions = function (slot0)
	slot3 = slot0._displayObjs

	for slot4, slot5 in ipairs(slot2) do
		slot6 = 0

		if slot0._isHorV then
			slot9 = slot5
			slot6 = slot5.getPositionX(slot8)
		else
			slot9 = slot5
			slot6 = slot5.getPositionY(slot8)
		end

		if slot4 == 1 then
			slot0._posMin = slot6
			slot0._posMax = slot6
		else
			slot10 = slot6
			slot0._posMin = math.min(slot8, slot0._posMin)
			slot10 = slot6
			slot0._posMax = math.max(slot8, slot0._posMax)
		end
	end

	slot0._gap = (slot0._posMax - slot0._posMin) / (#slot0._displayObjs - 1)
end

ComponentsGroup.destroy = function (slot0)
	return
end

return
