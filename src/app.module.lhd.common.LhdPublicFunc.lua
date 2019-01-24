function LhdPrint(...)
	if LHD_DEBUG_MODEL == false then
		return
	end

	print(...)
end

function LhdPrintAndPrintTable(...)
	slot3, slot3 = unpack({
		...
	})

	LhdPrint(slot0)
	LhdPrintTable(slot1)
end

function LhdPrintTable(slot0, slot1, slot2)
	if LHD_DEBUG_MODEL == false then
		return
	end

	print("\n\n")
	print("================================================================")
	print(slot1 or "")

	if type(slot0) == "table" then
		_LhdPrintTable(slot0, slot2)
	else
		print(tostring(slot0))
	end

	print("================================================================")
	print("\n\n")
end

function _LhdPrintTable(slot0, slot1)
	slot1 = slot1 or 0

	for slot5, slot6 in pairs(slot0) do
		if type(slot5) == "string" then
			slot5 = string.format("%q", slot5)
		end

		slot7 = ""

		if type(slot6) == "table" then
			slot7 = "{"
		end

		formatting = slot8 .. "[" .. slot5 .. "]" .. " = " .. slot7

		if type(slot6) == "table" then
			print(formatting)
			_LhdPrintTable(slot6, slot1 + 1)
			print(slot8 .. "},")
		else
			slot9 = ""

			print(formatting .. ((type(slot6) ~= "string" or string.format("%q", slot6)) and tostring(slot6)) .. ",")
		end
	end
end

return
