utf8 = {
	charbytes = function (slot0, slot1)
		if string.byte(slot0, slot1 or 1) > 0 and slot2 <= 127 then
			return 1
		elseif slot2 >= 194 and slot2 <= 223 then
			slot3 = string.byte(slot0, slot1 + 1)

			return 2
		elseif slot2 >= 224 and slot2 <= 239 then
			slot3 = slot0:byte(slot1 + 1)
			slot4 = slot0:byte(slot1 + 2)

			return 3
		elseif slot2 >= 240 and slot2 <= 244 then
			slot3 = slot0:byte(slot1 + 1)
			slot4 = slot0:byte(slot1 + 2)
			slot5 = slot0:byte(slot1 + 3)

			return 4
		end
	end
}

utf8.len = function (slot0)
	slot1 = 1
	slot2 = string.len(slot0)
	slot3 = 0

	while slot1 <= slot2 and slot3 ~= chars do
		slot4 = string.byte(slot0, slot1)
		slot3 = slot3 + 1
		slot1 = slot1 + utf8.charbytes(slot0, slot1)
	end

	if chars ~= nil then
		return slot1 - 1
	end

	return slot3
end

utf8.sub = function (slot0, slot1, slot2)
	slot2 = slot2 or -1

	if slot1 == nil then
		return ""
	end

	slot3 = 1
	slot4 = string.len(slot0)
	slot5 = 0
	slot6 = (slot1 >= 0 and slot2 >= 0) or utf8.len(slot0)

	if ((slot1 >= 0 and slot1) or slot6 + slot1 + 1) > ((slot2 >= 0 and slot2) or slot6 + slot2 + 1) then
		return ""
	end

	slot9 = 1
	slot10 = slot4

	while slot3 <= slot4 do
		if slot5 + 1 == slot7 then
			slot9 = slot3
		end

		slot3 = slot3 + utf8.charbytes(slot0, slot3)

		if slot5 == slot8 then
			slot10 = slot3 - 1

			break
		end
	end

	return string.sub(slot0, slot9, slot10)
end

utf8.replace = function (slot0, slot1)
	slot2 = 1
	slot3 = string.len(slot0)
	slot4 = nil
	slot5 = ""

	while slot2 <= slot3 do
		slot5 = slot5 .. (slot1[string.sub(slot0, slot2, (slot2 + utf8.charbytes(slot0, slot2)) - 1)] or slot6)
		slot2 = slot2 + slot4
	end

	return slot5
end

return utf8
