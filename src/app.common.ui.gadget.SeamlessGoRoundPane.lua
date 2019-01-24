slot2 = "SeamlessGoRoundPane"
SeamlessGoRoundPane = class(slot1)

SeamlessGoRoundPane.ctor = function (slot0, slot1, slot2)
	slot0._units = {}
	slot0._isVorH = slot2
	slot0._minY = nil
	slot0._minY = nil
	slot0._maxX = nil
	slot0._maxY = nil
	slot0._gapX = nil
	slot0._gapY = nil
	slot0._v = 0
	slot5 = slot1

	for slot6, slot7 in ipairs(slot4) do
		slot0._units[slot6] = slot7
		slot10 = slot7
		slot7.__orgX = slot7.getPositionX(slot9)
		slot10 = slot7
		slot7.__orgY = slot7.getPositionY(slot9)
		slot11 = slot7.__orgX
		slot0._minX = MathUtil.getMin(slot9, slot0._minX)
		slot11 = slot7.__orgX
		slot0._maxX = MathUtil.getMax(slot9, slot0._maxX)
		slot11 = slot7.__orgY
		slot0._minY = MathUtil.getMin(slot9, slot0._minY)
		slot11 = slot7.__orgY
		slot0._maxY = MathUtil.getMax(slot9, slot0._maxY)
	end

	slot0._gapX = (slot0._maxX - slot0._minX) / #slot0._units
	slot0._gapY = (slot0._maxY - slot0._minY) / #slot0._units
	slot6 = TickBase

	ClassUtil.extends(#slot0._units, slot0)

	function slot7(slot0, slot1)
		if slot0._isVorH then
			return slot0.__orgY < slot1.__orgY
		else
			return slot0.__orgX < slot1.__orgX
		end
	end

	table.sort(slot0, slot0._units)
end

SeamlessGoRoundPane.stop = function (slot0)
	slot3 = slot0

	slot0.stopTick(slot2)
end

SeamlessGoRoundPane.play = function (slot0, slot1, slot2)
	slot2 = slot2 or 24
	slot0._v = slot1 or 0

	if slot0._v ~= 0 then
		slot5 = slot0

		if not slot0.getIsTicking(slot4) then
			slot6 = slot2

			slot0.startTick(slot4, slot0)
		end
	else
		slot5 = slot0

		slot0.stopTick(slot4)
	end
end

SeamlessGoRoundPane.getNextPane = function (slot0, slot1)
	slot2 = 0

	if slot0._v > 0 then
		if #slot0._units < slot1 + 1 then
			slot2 = 1
		end
	elseif slot1 - 1 < 1 then
		slot2 = #slot0._units
	end

	return slot0._units[slot2]
end

SeamlessGoRoundPane.tick = function (slot0)
	slot3 = slot0._units

	for slot4, slot5 in ipairs(slot2) do
		if not slot0._isVorH then
			slot8 = slot5
			slot5.__curPosX = slot5.getPositionX(slot7)
			slot5.__curPosY = nil
		else
			slot5.__curPosX = nil
			slot8 = slot5
			slot5.__curPosY = slot5.getPositionY(slot7)
		end
	end

	slot3 = slot0._units

	for slot4, slot5 in ipairs(slot2) do
		if not slot0._isVorH then
			if slot0._maxX < slot5.__curPosX + slot0._v or slot6 < slot0._minX then
				slot10 = slot4
				slot10 = slot0._v
				slot6 = slot0.getNextPane(slot8, slot0).__curPosX - slot0._v - MathUtil.getValueDiretion(slot0) * slot0._gapX
			end

			slot10 = slot6

			slot5.setPositionX(slot8, slot5)
		else
			if slot0._maxY < slot5.__curPosY + slot0._v or slot6 < slot0._minY then
				slot10 = slot4
				slot10 = slot0._v
				slot6 = slot0.getNextPane(slot8, slot0).__curPosY - slot0._v - MathUtil.getValueDiretion(slot0) * slot0._gapY
			end

			slot10 = slot6

			slot5.setPositionY(slot8, slot5)
		end
	end
end

SeamlessGoRoundPane.destroy = function (slot0)
	slot3 = slot0

	TickBase.destroy(slot2)
end

return
