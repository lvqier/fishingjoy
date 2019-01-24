slot0 = require
slot1 = setmetatable
slot2 = string.char
slot3 = table.concat
slot4, slot5, slot6 = nil

if jit and jit.version_num > 20000 then
	slot4 = true
	slot5 = bit.bxor
	slot6 = bit.band
elseif _VERSION == "Lua 5.2" then
	slot5 = bit32.bxor
	slot6 = bit32.band
elseif _VERSION == "Lua 5.3" and bit32 then
	slot5 = bit32.bxor
	slot6 = bit32.band
else
	error("unsupported Lua version")
end

slot7, slot8 = nil

if slot4 then
	slot9 = slot0("ffi")
	slot10 = slot9.string
	slot11 = slot9.copy

	slot9.cdef("\t\ttypedef struct { uint8_t v; } idx_t;\n\t")

	slot12 = slot9.typeof("uint8_t[256]")
	slot13 = slot9.typeof("idx_t")
	slot14 = slot9.typeof("uint8_t[?]")

	function slot7(slot0)
		slot1 = slot0()

		for slot5 = 0, 255, 1 do
			slot1[slot5] = slot5
		end

		slot2(slot3, slot0, slot2)

		slot4 = slot3()

		for slot8 = 0, 255, 1 do
			slot4.v = slot4.v + slot1[slot8] + slot3[slot8 % slot2]
			slot1[slot4.v] = slot1[slot8]
			slot1[slot8] = slot1[slot4.v]
		end

		return {
			x = slot3(),
			y = slot3(),
			st = slot1
		}
	end

	function slot8(slot0, slot1)
		slot2 = slot0.x
		slot3 = slot0.y
		slot4 = slot0.st

		slot1(slot6, slot1, slot5)

		for slot10 = 0, #slot1 - 1, 1 do
			slot2.v = slot2.v + 1
			slot3.v = slot3.v + slot4[slot2.v]
			slot4[slot3.v] = slot4[slot2.v]
			slot4[slot2.v] = slot4[slot3.v]
			slot6[slot10] = slot2(slot6[slot10], slot4[(slot4[slot2.v] + slot4[slot3.v]) % 256])
		end

		return slot3(slot6, slot5)
	end
else
	function slot7(slot0)
		slot1 = {}

		for slot5 = 0, 255, 1 do
			slot1[slot5] = slot5
		end

		slot2 = #slot0
		slot3 = 0

		for slot7 = 0, 255, 1 do
			slot1[(slot3 + slot1[slot7] + slot0:byte(slot7 % slot2 + 1)) % 256] = slot1[slot7]
			slot1[slot7] = slot1[(slot3 + slot1[slot7] + slot0.byte(slot7 % slot2 + 1)) % 256]
		end

		return {
			x = 0,
			y = 0,
			st = slot1
		}
	end

	function slot8(slot0, slot1)
		slot2 = slot0.x
		slot3 = slot0.y
		slot4 = slot0.st
		slot5 = {}

		for slot9 = 1, #slot1, 1 do
			slot4[(slot3 + slot4[(slot2 + 1) % 256]) % 256] = slot4[(slot2 + 1) % 256]
			slot4[(slot2 + 1) % 256] = slot4[(slot3 + slot4[(slot2 + 1) % 256]) % 256]
			slot5[slot9] = slot0(slot1(slot1:byte(slot9), slot4[(slot4[(slot2 + 1) % 256] + slot4[(slot3 + slot4[(slot2 + 1) % 256]) % 256]) % 256]))
		end

		slot0.y = slot3
		slot0.x = slot2

		return slot2(slot5)
	end
end

function slot9(slot0, slot1)
	return slot1(slot0(slot1), {
		__metatable = false,
		__call = slot0(slot1)
	})
end

if arg then
	function slot11(slot0, ...)
		io.write(string.format(slot0, ...), "\n")
	end

	slot12 = tonumber(arg[1]) or 100000
	slot13 = "Z@\\xdeG\\xe9\\x9a\\xec"
	slot14 = nil
	slot14 = os.clock()

	for slot18 = 1, slot12, 1 do
		slot19 = slot9(nil, slot13)
	end

	slot11("%-16s %8.3f sec (%d times, #key %d)", "RC4 keygen test", slot10() - slot14, slot12, #slot13)
	collectgarbage()

	slot15 = slot9(nil, slot13)
	slot16 = slot9(nil, slot13)
	slot17 = "bS1hjNeePwaj6dY293F7rzmcTFjZVS9O9vAq5l69onIiZTOwZ3LrtuiWLT0Jpr3lZ0XJ11Ajw6RoyLP6Xf66lbFu68edKJK8oyGJLu9xFTQRaFXrsMu9nX4Q5qufETjU0nsN6JZxGXQZfAAcgFyvlik2tJEyovhHsEINhtXnYuj7VpUEZl8ZXAVf2Aa5cbSYVcb1wY3D2ts2kHHXVqUhKpYQ60LKGbWOB1CKkSDFR8JfL9tBmpezS9MWCh1yTUXjfFxSbEq3KV7c8qtwxKGjINoDAMWDQLO0qBGC8IitKyc1zbBUbHBPTvx9TPiGpYObQeX5Ktu7ZtiRpak2o5h9AfEXHCd4tL1F2OsQfpMZghGWnRAez32JeWksXis6X1uJAZgA6mB5Fc7CErLJCiSJVl1TbG4Z7KhypNN0MOfeVV7RY5shwQtYixzA86LNa4w8It2XyjYe6qrcYX3Eq3cKEFFfBPJXZnqwoO3W6MJ52KUrTWcOtqnnfOtWhm9FsLZM"
	slot14 = slot10()

	for slot21 = 1, slot12, 1 do
		assert(slot17 == slot16(slot22))
	end

	slot11("%-16s %8.3f sec (%d times, #key %d, #input %d)", "RC4 crypt test", slot10() - slot14, slot12, #slot13, #slot17)
end

return slot1({}, {
	__metatable = false,
	__call = slot9
})
