slot2 = requireClientCoreMain("sha1.common").bytes_to_uint32
slot3 = requireClientCoreMain("sha1.common").uint32_to_bytes
slot5 = slot4(function (slot0, slot1)
	return slot0 * slot1
end, 8)
slot6 = slot4(function (slot0, slot1)
	return (slot0 == slot1 and 0) or 1
end, 8)

return {
	uint32_lrot = function (slot0, slot1)
		return slot0 % (4294967296.0 / 2^slot1) * 2^slot1 + (slot0 - slot0 % (4294967296.0 / 2^slot1)) / (4294967296.0 / 2^slot1)
	end,
	byte_xor = function (slot0, slot1)
		return slot0[slot0 * 256 + slot1]
	end,
	uint32_xor_3 = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6 = slot0(slot0)
		slot7, slot8, slot9, slot10 = slot0(slot1)
		slot11, slot12, slot13, slot14 = slot0(slot2)

		return slot1(slot2[slot3 * 256 + slot2[slot7 * 256 + slot11]], slot2[slot4 * 256 + slot2[slot8 * 256 + slot12]], slot2[slot5 * 256 + slot2[slot9 * 256 + slot13]], slot2[slot6 * 256 + slot2[slot10 * 256 + slot14]])
	end,
	uint32_xor_4 = function (slot0, slot1, slot2, slot3)
		slot4, slot5, slot6, slot7 = slot0(slot0)
		slot8, slot9, slot10, slot11 = slot0(slot1)
		slot12, slot13, slot14, slot15 = slot0(slot2)
		slot16, slot17, slot18, slot19 = slot0(slot3)

		return slot1(slot2[slot4 * 256 + slot2[slot8 * 256 + slot2[slot12 * 256 + slot16]]], slot2[slot5 * 256 + slot2[slot9 * 256 + slot2[slot13 * 256 + slot17]]], slot2[slot6 * 256 + slot2[slot10 * 256 + slot2[slot14 * 256 + slot18]]], slot2[slot7 * 256 + slot2[slot11 * 256 + slot2[slot15 * 256 + slot19]]])
	end,
	uint32_ternary = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6 = slot0(slot0)
		slot7, slot8, slot9, slot10 = slot0(slot1)
		slot11, slot12, slot13, slot14 = slot0(slot2)

		return slot1(slot2[slot7 * 256 + slot3] + slot2[(slot11 * 256 + 255) - slot3], slot2[slot8 * 256 + slot4] + slot2[(slot12 * 256 + 255) - slot4], slot2[slot9 * 256 + slot5] + slot2[(slot13 * 256 + 255) - slot5], slot2[slot10 * 256 + slot6] + slot2[(slot14 * 256 + 255) - slot6])
	end,
	uint32_majority = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6 = slot0(slot0)
		slot7, slot8, slot9, slot10 = slot0(slot1)
		slot11, slot12, slot13, slot14 = slot0(slot2)

		return slot1(slot2[slot3 * 256 + slot7] + slot2[slot11 * 256 + slot3[slot3 * 256 + slot7]], slot2[slot4 * 256 + slot8] + slot2[slot12 * 256 + slot3[slot4 * 256 + slot8]], slot2[slot5 * 256 + slot9] + slot2[slot13 * 256 + slot3[slot5 * 256 + slot9]], slot2[slot6 * 256 + slot10] + slot2[slot14 * 256 + slot3[slot6 * 256 + slot10]])
	end
}
