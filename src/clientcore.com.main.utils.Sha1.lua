slot0 = string.len
slot1 = string.char
slot2 = string.byte
slot3 = string.sub
slot4 = math.floor
slot5 = bit.bnot
slot6 = bit.band
slot7 = bit.bor
slot8 = bit.bxor
slot9 = bit.lshift
slot10 = bit.rshift
slot11, slot12, slot13, slot14, slot15 = nil
Sha1 = {}

function slot16(slot0, slot1)
	return slot0(slot0, slot1) + slot1(slot0, 32 - slot1)
end

function slot17(slot0)
	slot1, slot2 = nil
	slot3 = ""

	for slot7 = 1, 8, 1 do
		slot3 = (slot0(slot0, 15) < 10 and slot1(slot2 + 48) .. slot3) or slot1(slot2 + 87) .. slot3
		slot0 = slot2(slot0 / 16)
	end

	return slot3
end

function slot18(slot0)
	slot1, slot4 = nil
	slot3 = ""

	if 56 - slot2(slot0(slot0), 63) < 0 then
		slot2 = slot2 + 64
	end

	for slot7 = 1, slot2, 1 do
		slot0 = slot0 .. slot1(0)
	end

	for slot7 = 1, 8, 1 do
		slot1 = slot3(slot1 / 256)
	end

	return slot0 .. slot3
end

function slot19(slot0)
	slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10 = nil
	slot11 = {}

	while slot0 ~= "" do
		for slot15 = 0, 15, 1 do
			slot11[slot15] = 0

			for slot19 = 1, 4, 1 do
				slot11[slot15] = slot11[slot15] * 256 + slot0(slot0, slot15 * 4 + slot19)
			end
		end

		for slot15 = 16, 79, 1 do
			slot11[slot15] = slot1(slot2(slot2(slot11[slot15 - 3], slot11[slot15 - 8]), slot2(slot11[slot15 - 14], slot11[slot15 - 16])), 1)
		end

		slot1 = slot3
		slot2 = slot4
		slot3 = slot5
		slot4 = slot6
		slot5 = slot7

		for slot15 = 0, 79, 1 do
			if slot15 < 20 then
				slot6 = slot8(slot9(slot2, slot3), slot9(slot10(slot2), slot4))
				slot7 = 1518500249
			elseif slot15 < 40 then
				slot6 = slot2(slot2(slot2, slot3), slot4)
				slot7 = 1859775393
			elseif slot15 < 60 then
				slot6 = slot8(slot8(slot9(slot2, slot3), slot9(slot2, slot4)), slot9(slot3, slot4))
				slot7 = 2400959708.0
			else
				slot6 = slot2(slot2(slot2, slot3), slot4)
				slot7 = 3395469782.0
			end

			slot5 = slot4
			slot4 = slot3
			slot3 = slot1(slot2, 30)
			slot2 = slot1
			slot1 = slot1(slot1, 5) + slot6 + slot5 + slot7 + slot11[slot15]
		end

		slot6 = slot9(slot6 + slot9(slot4 + slot2, 4294967295.0), 4294967295.0)
		slot7 = slot9(slot7 + slot9(slot5 + slot9(slot3 + slot1, 4294967295.0), 4294967295.0), 4294967295.0)
		slot0 = slot11(slot0, 65)
	end
end

function Sha1(slot0)
	slot1 = 1732584193
	slot2 = 4023233417.0
	slot3 = 2562383102.0
	slot4 = 271733878
	slot5 = 3285377520.0

	slot6(slot0)

	return slot7(slot7) .. slot7(slot7) .. slot7(slot7) .. slot7(slot7) .. slot7(slot7)
end

return Sha1
