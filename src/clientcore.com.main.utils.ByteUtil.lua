module("ByteUtil", package.seeall)

function bytes2Int(slot0, slot1, slot2)
	slot3 = {
		slot0:byte(1, -1)
	}

	if not slot1 then
		slot4 = {}

		for slot8 = 1, #slot3, 1 do
			slot4[#slot3 - slot8 + 1] = slot3[slot8]
		end

		slot3 = slot4
	end

	slot4 = 0

	for slot8 = 1, #slot3, 1 do
		slot4 = slot4 + slot3[slot8] * 2^((slot8 - 1) * 8)
	end

	if slot2 and slot4 > 2^(#slot3 - 1) - 1 then
		return slot4 - 2^(#slot3) or slot4
	end
end

function int2Bytes(slot0, slot1, slot2, slot3)
	if slot0 < 0 and not slot2 then
		slot0 = -slot0

		print("warning, dropping sign from number converting to unsigned")
	end

	slot4 = {}
	slot5 = slot3 or math.ceil(select(2, math.frexp(slot0)) / 8)

	if slot2 and slot0 < 0 then
		slot0 = slot0 + 2^slot5
	end

	for slot9 = slot5, 1, -1 do
		slot4[slot9] = math.floor(slot0 / 2^(8 * (slot9 - 1)))
		slot0 = slot0 - slot4[slot9] * 2^(8 * (slot9 - 1))
	end

	assert(slot0 == 0)

	if not slot1 then
		slot6 = {}

		for slot10 = 1, slot5, 1 do
			slot6[slot10] = slot4[slot5 - slot10 + 1]
		end

		slot4 = slot6
	end

	return string.char(unpack(slot4))
end

function float2Byte(slot0, slot1)
	slot2 = 0

	if slot0 < 0 then
		slot2 = 1
		slot0 = -slot0
	end

	slot3, slot4 = math.frexp(slot0)

	if slot0 == 0 then
		slot3 = 0
		slot4 = 0
	else
		slot3 = (slot3 * 2 - 1) * math.ldexp(0.5, 24)
		slot4 = slot4 + 126
	end

	slot6 = nil
	slot0, slot6 = grab_byte(slot3)
	slot0, slot6 = grab_byte(slot0)
	slot0, slot6 = grab_byte(slot4 * 128 + slot7)
	slot0, slot6 = grab_byte(slot2 * 128 + slot7)
	slot5 = "" .. slot6 .. slot6 .. slot6 .. slot8

	if not slot1 then
		slot5 = string.reverse(slot5)
	end

	return slot5
end

function bytes2Float(slot0, slot1)
	if not slot1 then
		slot0 = string.reverse(slot0)
	end

	slot2 = 1
	slot3 = string.byte(slot0, 3) % 128

	for slot7 = 2, 1, -1 do
		slot3 = slot3 * 256 + string.byte(slot0, slot7)
	end

	if string.byte(slot0, 4) > 127 then
		slot2 = -1
	end

	if string.byte(slot0, 4) % 128 * 2 + math.floor(string.byte(slot0, 3) / 128) == 0 then
		return 0
	end

	return math.ldexp((math.ldexp(slot3, -23) + 1) * slot2, slot4 - 127)
end

function bytes2Double(slot0, slot1)
	if not slot1 then
		slot0 = string.reverse(slot0)
	end

	slot2 = 1
	slot3 = string.byte(slot0, 7) % 16

	for slot7 = 6, 1, -1 do
		slot3 = slot3 * 256 + string.byte(slot0, slot7)
	end

	if string.byte(slot0, 8) > 127 then
		slot2 = -1
	end

	if string.byte(slot0, 8) % 128 * 16 + math.floor(string.byte(slot0, 7) / 16) == 0 then
		return 0
	end

	return math.ldexp((math.ldexp(slot3, -52) + 1) * slot2, slot4 - 1023)
end

function double2Bytes(slot0, slot1)
	slot2 = 0

	if slot0 < 0 then
		slot2 = 1
		slot0 = -slot0
	end

	slot3, slot4 = math.frexp(slot0)

	if slot0 == 0 then
		slot4 = 0
		slot3 = 0
	else
		slot3 = (slot3 * 2 - 1) * math.ldexp(0.5, 53)
		slot4 = slot4 + 1022
	end

	slot5 = ""
	slot6 = nil
	slot0 = slot3

	for slot10 = 1, 6, 1 do
		slot0, slot6 = grab_byte(slot0)
		slot5 = slot5 .. slot12
	end

	slot0, slot6 = grab_byte(slot4 * 16 + slot0)
	slot0, slot6 = grab_byte(slot2 * 128 + slot7)
	slot5 = slot5 .. slot6 .. slot8

	if not slot1 then
		slot5 = string.reverse(slot5)
	end

	return slot5
end

function grab_byte(slot0)
	return math.floor(slot0 / 256), string.char(math.floor(slot0) % 256)
end

return
