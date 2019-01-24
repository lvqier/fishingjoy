return {
	bytes_to_uint32 = function (slot0, slot1, slot2, slot3)
		return slot0 * 16777216 + slot1 * 65536 + slot2 * 256 + slot3
	end,
	uint32_to_bytes = function (slot0)
		return (((slot0 - slot0 % 256) / 256 - ((slot0 - slot0 % 256) / 256) % 256) / 256 - (((slot0 - slot0 % 256) / 256 - ((slot0 - slot0 % 256) / 256) % 256) / 256) % 256) / 256, (((slot0 - slot0 % 256) / 256 - ((slot0 - slot0 % 256) / 256) % 256) / 256) % 256, ((slot0 - slot0 % 256) / 256) % 256, slot0 % 256
	end
}
