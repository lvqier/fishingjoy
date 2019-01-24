slot0 = require("bit")
slot2 = slot0.band
slot3 = slot0.bor

return {
	uint32_lrot = slot0.rol,
	byte_xor = slot0.bxor,
	uint32_xor_3 = slot0.bxor,
	uint32_xor_4 = slot0.bxor,
	uint32_ternary = function (slot0, slot1, slot2)
		return slot0(slot2, slot1(slot0, slot0(slot1, slot2)))
	end,
	uint32_majority = function (slot0, slot1, slot2)
		return slot0(slot1(slot0, slot0(slot1, slot2)), slot1(slot1, slot2))
	end
}
