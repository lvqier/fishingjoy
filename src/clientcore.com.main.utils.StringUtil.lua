module("StringUtil", package.seeall)
require("md5")

function int2StringKeepBits(slot0, slot1, slot2)
	if math.modf(slot1) <= #tostring(slot0) then
		if not slot2 then
			slot3 = string.sub(slot3, slot4 - slot1 + 1)
		end
	else
		slot3 = string.rep("0", slot1 - slot4) .. slot3
	end

	return slot3
end

function join(slot0, slot1)
	slot1 = slot1 or ","
	slot2 = ""

	for slot6, slot7 in ipairs(slot0) do
		slot2 = slot2 .. slot1 .. tostring(slot7)
	end

	if #slot2 > 0 then
		slot2 = string.sub(slot2, 2)
	end

	return slot2
end

function isStringValid(slot0)
	return slot0 ~= nil and slot0 ~= ""
end

function numOfPattern(slot0, slot1)
	slot2 = 0

	for slot6, slot7, slot8 in string.gmatch(slot0, slot1) do
		slot2 = slot2 + 1
	end

	return slot2
end

function md5sum(slot0, slot1)
	slot0 = string.gsub(md5.sum(slot0), ".", function (slot0)
		return string.format("%02x", string.byte(slot0))
	end)

	if slot1 then
		slot0 = string.upper(slot0)
	end

	return slot0
end

function upperFirstChar(slot0)
	return string.upper(string.sub(slot0, 1, 1)) .. string.sub(slot0, 2)
end

function lowerFirstChar(slot0)
	return string.lower(string.sub(slot0, 1, 1)) .. string.sub(slot0, 2)
end

function numberStr2FormatNumberStr(slot0)
	slot2 = parseInt(slot0) < 0
	slot4 = ""
	slot5 = string.len(slot0)

	while slot5 >= 1 do
		slot7 = ","

		if slot5 - 2 <= 1 then
			slot6 = 1
		end

		slot4 = string.sub(slot0, slot6, slot5) .. slot7 .. slot4
		slot5 = slot5 - 3
	end

	slot4 = string.gsub(slot4, ",$", "")

	if slot2 then
		slot4 = "-" .. slot4
	end

	return slot4
end

function formatEx(slot0, ...)
	if StringUtil.isStringValid(slot0) then
		slot1 = {
			...
		}
		slot0 = string.gsub(slot0, "%$(%d+)%$", function (slot0)
			return tonumber(slot0, nil) or 0[]
		end)
	end
end

function numberStr2ZhHant(slot0)
	slot1 = {
		"零",
		"壹",
		"贰",
		"叁",
		"肆",
		"伍",
		"陆",
		"柒",
		"捌",
		"玖"
	}
	slot2 = {
		"",
		"拾",
		"佰",
		"仟"
	}
	slot3 = {
		"",
		"万",
		"亿"
	}
	slot4 = ""

	if not tonumber(slot0) or slot5 <= 0 then
		return slot1[1] .. slot4
	end

	slot6 = ""
	slot7 = 0
	slot8 = string.len(slot0)
	slot9, slot10, slot11, slot12 = nil

	if string.format("%d", slot0) == "0" then
		slot6 = slot1[1]
	else
		for slot16 = 1, slot8, 1 do
			slot11 = math.floor((slot8 - slot16) / 4)
			slot12 = (slot8 - slot16) % 4

			if string.sub(slot0, slot16, slot16) == "0" then
				slot7 = slot7 + 1
			else
				if slot7 > 0 then
					slot6 = slot6 .. slot1[1]
				end

				slot7 = 0
				slot6 = slot6 .. slot1[tonumber(slot10) + 1] .. slot2[slot12 + 1]
			end

			if slot12 == 0 and slot7 < 4 then
				if slot11 + 1 > 3 then
					slot11 = 2 + slot11 % 2
				end

				slot6 = slot6 .. slot3[slot11]
			end
		end
	end

	return slot6 .. slot4
end

function number2ABC(slot0, slot1)
	return string.char((string.byte(slot1 or "A") + slot0) - 1)
end

function getFileName(slot0)
	return string.match(slot0, ".+/([^/]*%.%w+)$")
end

function isAsciiChar(slot0)
	return string.byte(slot0) <= 127 and slot1 >= 0
end

function getStringLen(slot0, slot1)
	slot2 = #(slot0 or "")
	slot3 = 0
	slot4 = 1
	slot5 = slot1 or 2

	for slot9 = 1, slot2, 1 do
		if slot4 <= slot9 then
			slot11 = 1

			if string.byte(slot0, slot9) > 0 and slot10 <= 127 then
				slot11 = 1
			elseif slot10 >= 192 and slot10 <= 223 then
				slot11 = 2
			elseif slot10 >= 224 and slot10 <= 239 then
				slot11 = 3
			elseif slot10 >= 240 and slot10 <= 247 then
				slot11 = 4
			end

			slot12 = string.sub(slot0, slot9, (slot9 + slot11) - 1)
			slot4 = slot4 + slot11
			slot3 = (slot11 == 1 and slot3 + 1) or slot3 + slot5
		end
	end

	return slot3
end

function setLabelWithSizeLimit(slot0, slot1, slot2)
	slot0:setString(slot1)

	while slot2 < slot0:getContentSize().width do
		slot0:setString(slot1 .. "...")
	end
end

function trimQuoter(slot0)
	slot3 = string.sub(slot0, #slot0, )

	if (string.sub(slot0, 1, 1) == "'" and slot3 == "'") or (slot2 == "\"" and slot3 == "\"") then
		slot0 = string.sub(slot0, 2, slot1 - 1)
	end

	return slot0
end

function isStringLenOver(slot0, slot1)
	return (slot1 or 0) < StringUtil.getStringLen(slot0)
end

function isStringContainsEmoji(slot0)
	slot0 = slot0 or ""
	slot1 = false
	slot3 = 1

	function slot4(slot0, slot1)
		slot2 = {
			0,
			0,
			0,
			0
		}

		for slot6 = 1, slot1, 1 do
			slot2[slot6] = string.byte(slot0, slot6, slot6)
		end

		if slot2[1] == 240 and slot2[2] == 159 and slot2[3] >= 128 and slot2[3] <= 155 and slot2[4] >= 128 then
			slot0 = true
		elseif slot2[1] >= 226 and slot2[1] <= 227 and slot2[2] >= 128 and slot2[2] <= 158 and slot2[3] >= 128 then
			slot0 = true
		end

		if slot2[1] == 194 and slot2[2] >= 169 and slot2[2] <= 174 then
			slot0 = true
		end
	end

	for slot8 = 1, #slot0, 1 do
		if slot3 <= slot8 then
			slot10 = 1

			if string.byte(slot0, slot8) > 0 and slot9 <= 127 then
				slot10 = 1
			elseif slot9 >= 192 and slot9 <= 223 then
				slot10 = 2
			elseif slot9 >= 224 and slot9 <= 239 then
				slot10 = 3
			elseif slot9 >= 240 and slot9 <= 247 then
				slot10 = 4
			end

			slot11 = string.sub(slot0, slot8, (slot8 + slot10) - 1)
			slot3 = slot3 + slot10

			if slot10 ~= 1 then
				slot4(slot11, slot10)
			end

			if slot1 then
				return slot1
			end
		end
	end

	return slot1
end

function truncateZeroTerminated(slot0)
	return string.gsub(slot0, "%z", "")
end

function truncate(slot0, slot1, slot2, slot3)
	slot3 = slot3 or 1
	slot0 = slot0 or ""
	slot1 = slot1 or 0
	slot2 = slot2 or "..."
	slot5 = 0
	slot6 = 1
	slot7 = ""

	for slot11 = 1, #slot0, 1 do
		if slot6 <= slot11 then
			slot12 = slot3
			slot14 = 1

			if string.byte(slot0, slot11) > 0 and slot13 <= 127 then
				slot14 = 1
				slot12 = 1
			elseif slot13 >= 192 and slot13 <= 223 then
				slot14 = 2
			elseif slot13 >= 224 and slot13 <= 239 then
				slot14 = 3
			elseif slot13 >= 240 and slot13 <= 247 then
				slot14 = 4
			end

			slot6 = slot6 + slot14
			slot7 = slot7 .. string.sub(slot0, slot11, (slot11 + slot14) - 1)

			if slot1 <= slot5 + slot12 then
				break
			end
		end
	end

	if #slot7 < slot4 then
		slot7 = slot7 .. slot2
	end

	return slot7
end

function truncateEx(slot0, slot1, slot2)
	slot3 = ""
	slot6 = 0
	slot7, slot8 = readCharFromString(slot0, #slot0, 1)

	while slot7 and slot6 <= slot1 do
		slot6 = slot6 + 1
		slot3 = slot3 .. slot7
		slot7, slot8 = readCharFromString(slot0, slot4, slot5 + slot8)
	end

	if slot5 < slot4 and slot2 then
		slot3 = slot3 .. "..."
	end

	return slot3
end

function readCharFromString(slot0, slot1, slot2)
	if string.byte(slot0, slot2) then
		slot4 = 0

		if slot3 >= 192 and slot3 <= 223 then
			slot4 = 1
		elseif slot3 >= 224 and slot3 <= 239 then
			slot4 = 2
		elseif slot3 >= 240 and slot3 <= 247 then
			slot4 = 3
		end

		if slot2 + slot4 <= strlen then
			return string.sub(slot0, slot2, slot2 + slot4), slot4 + 1
		else
			return nil, 0
		end
	else
		return nil, 0
	end
end

function trim(slot0)
	return string.gsub(slot0, "^%s*(.-)%s*$", "%1")
end

function decodeURI(slot0)
	return string.gsub(slot0, "%%(%x%x)", function (slot0)
		return string.char(tonumber(slot0, 16))
	end)
end

slot0 = "([^a-zA-Z0-9%;%/%?%:%@%&%=%+%$%,%#%-%_%.%!%~%*%'%(%)])"

function encodeURI(slot0)
	return string.gsub(string.gsub(slot0, slot0, function (slot0)
		return string.format("%%%02X", string.byte(slot0))
	end), " ", "+")
end

function lastIndexOf(slot0, slot1)
	if slot0 == nil then
		return nil
	end

	slot2 = nil
	slot3 = string.find(slot0, slot1, index)

	while slot3 ~= nil do
		slot2 = slot3
		slot3 = string.find(slot0, slot1, slot3 + 1)
	end

	return slot2
end

MAX_NUMBER_VALUE = 1.8014398509481984e+16

function splitNum(slot0, slot1, slot2, slot3, slot4, slot5)
	slot3 = slot3 or 1
	slot4 = slot4 or 0
	slot6 = {}

	if not slot0 then
		return slot6, 0
	end

	slot7 = ""

	if slot0 ~= 0 then
		slot7 = (slot0 > 0 and "p") or "s"
	end

	if MAX_NUMBER_VALUE < math.abs(slot0) then
		traceLog("数值溢出", slot0)

		return {}, 0
	end

	slot10 = string.split(slot8, ".")[1] or ""
	slot12 = nil
	slot14 = string.len(slot9[2] or "")

	if string.len(slot10) < slot3 then
		slot10 = string.format("%0" .. slot3 .. "d", slot10)
		slot13 = slot3
	end

	for slot18 = 1, slot13, 1 do
		table.insert(slot6, string.sub(slot10, slot18, slot18))

		if slot1 and slot18 < slot13 - 2 and (slot13 - slot18 + 1) % 3 == 1 then
			table.insert(slot6, "d")
		end
	end

	slot15 = #slot6 + 1
	slot16 = false

	for slot20 = slot14, 1, -1 do
		slot12 = string.sub(slot11, slot20, slot20)

		if slot5 or slot16 or slot12 ~= "0" then
			table.insert(slot6, slot15, slot12)

			slot16 = true
		end
	end

	if slot16 then
		table.insert(slot6, slot15, "f")
	end

	if slot2 and slot7 ~= "" then
		table.insert(slot6, 1, slot7)
	end

	return slot6, #slot6
end

if 1 ~= 4 and slot1 ~= 5 and slot1 ~= 6 and slot1 ~= 7 then
end

string.getfirstchar = function (slot0)
	return string.char(slot0 + 2)
end

function splitNumWithHansUnits(slot0, slot1, slot2)
	slot1 = slot1 or 2
	slot3 = slot0
	slot4 = {}
	slot5 = {}
	slot6 = 10000

	if IS_HL_VERSION then
		slot6 = 100000
	end

	if slot0 < slot6 then
		slot4 = splitNum(slot0)
	elseif slot0 < 100000000 then
		slot4 = splitNum(slot0)

		table.insert(slot5, "w")
	elseif slot0 < 1000000000000.0 then
		slot4 = splitNum(slot0)

		table.insert(slot5, "y")
	else
		slot4 = splitNum(slot0)

		table.insert(slot5, "w")
		table.insert(slot5, "y")
	end

	if slot1 > 0 and slot6 <= slot3 then
		slot7 = #slot4 - slot1

		if not slot2 then
			slot8 = true

			for slot12 = slot1, 1, -1 do
				if slot4[slot7 + slot12] == 0 or slot4[slot7 + slot12] == "0" then
					table.remove(slot4, slot7 + slot12)
				else
					slot8 = false

					break
				end
			end

			if not slot8 then
				table.insert(slot4, slot7 + 1, "f")
			end
		else
			table.insert(slot4, slot7 + 1, "f")
		end
	end

	for slot10, slot11 in ipairs(slot5) do
		table.insert(slot4, slot11)
	end

	return slot4
end

function splitNumWithString(slot0, slot1, slot2)
	slot3 = {}
	slot4 = ""

	if slot1 then
		slot4 = (slot0 >= 0 and "j") or "f"
		slot5 = {}
	end

	if not math.abs(slot0) then
		return slot5, 0
	end

	if slot0 >= 100000000 then
		if slot0 % 100000000 ~= 0 then
			slot4 = slot4 .. string.format("%.2f", HtmlUtil.getPreciseDecimal(slot0 / 100000000, 2))
		else
			if slot0 / 100000000 >= 1000 then
				slot0 = slot0 / 1000

				table.insert(slot3, "q")
			elseif slot0 >= 100 then
				slot0 = slot0 / 100

				table.insert(slot3, "b")
			end

			slot4 = slot4 .. string.format("%.0f", slot0)
		end

		table.insert(slot3, "y")
	elseif slot0 >= 10000000 then
		table.insert(slot3, "q")
		table.insert(slot3, "w")

		if slot0 % 10000000 ~= 0 then
			slot4 = slot4 .. string.format("%.2f", HtmlUtil.getPreciseDecimal(slot0 / 10000000, 2))
		else
			slot4 = slot4 .. string.format("%.0f", slot0 / 10000000)
		end
	elseif slot0 >= 1000000 then
		table.insert(slot3, "b")
		table.insert(slot3, "w")

		if slot0 % 1000000 ~= 0 then
			slot4 = slot4 .. string.format("%.2f", HtmlUtil.getPreciseDecimal(slot0 / 1000000, 2))
		else
			slot4 = slot4 .. string.format("%.0f", slot0 / 1000000)
		end
	elseif slot0 >= 10000 then
		table.insert(slot3, "w")

		if slot0 % 10000 ~= 0 then
			slot4 = slot4 .. string.format("%.2f", HtmlUtil.getPreciseDecimal(slot0 / 10000, 2))
		else
			slot4 = slot4 .. string.format("%.0f", slot0 / 10000)
		end
	else
		table.insert(slot3, "q")

		slot4 = (slot0 % 1000 ~= 0 and slot4 .. string.format("%.2f", HtmlUtil.getPreciseDecimal(slot0 / 1000, 2))) or slot4 .. string.format("%.0f", slot0 / 1000) or slot4 .. string.format("%.0f", slot0) or slot4 .. string.format("%.0f", slot0)
	end

	for slot9 = 1, #slot4, 1 do

		-- Decompilation error in this vicinity:
		if string.sub(slot4, slot9, slot9) == "." then
			slot5[slot9] = "d"
		else
			slot5[slot9] = string.sub(slot4, slot9, slot9)
		end
	end

	for slot9 = 1, #slot3, 1 do
		table.insert(slot5, slot3[slot9])
	end

	return slot5, #slot4 + #slot3
end

function splitNumWithStringOnlyWY(slot0, slot1)
	slot2 = {}
	slot3 = ""

	if slot1 then
		slot3 = (slot0 >= 0 and "j") or "f"
		slot4 = {}
	end

	if not math.abs(slot0) then
		return slot4, 0
	end

	if slot0 >= 100000000 then

		-- Decompilation error in this vicinity:
		slot3 = (slot0 % 100000000 ~= 0 and slot3 .. string.format("%.2f", HtmlUtil.getPreciseDecimal(slot0 / 100000000, 2))) or slot3 .. string.format("%.0f", slot0 / 100000000)

		table.insert(slot2, "y")
		table.insert(slot2, "w")

		slot3 = (slot0 % 10000 ~= 0 and slot3 .. string.format("%.2f", HtmlUtil.getPreciseDecimal(slot0 / 10000, 2))) or slot3 .. string.format("%.0f", slot0 / 10000) or slot3 .. string.format("%.0f", slot0)

		for slot8 = 1, #slot3, 1 do
			if string.sub(slot3, slot8, slot8) == "." then
				slot4[slot8] = "d"
			else
				slot4[slot8] = string.sub(slot3, slot8, slot8)
			end
		end

		for slot8 = 1, #slot2, 1 do
			table.insert(slot4, slot2[slot8])
		end
	end

	return slot4, #slot3 + #slot2
end

slot2 = 1

function rc4Str(slot0, slot1, slot2)
	slot3 = ""

	return (not CryptoSwManager_arc4String or not slot2 or CryptoSwManager_arc4String(slot0 + 1, "testj" .. slot0, slot1)) and slot5(slot0)
end

function subStringUTF8(slot0, slot1, slot2)
	if slot1 < 0 then
		slot1 = subStringGetTotalIndex(slot0) + slot1 + 1
	end

	if slot2 ~= nil and slot2 < 0 then
		slot2 = subStringGetTotalIndex(slot0) + slot2 + 1
	end

	if slot2 == nil then
		return string.sub(slot0, subStringGetTrueIndex(slot0, slot1))
	else
		return string.sub(slot0, subStringGetTrueIndex(slot0, slot1), subStringGetTrueIndex(slot0, slot2 + 1) - 1)
	end
end

function subStringGetTotalIndex(slot0)
	slot1 = 0
	slot2 = 1
	slot3 = 1

	repeat
		slot2 = slot2 + subStringGetByteCount(slot0, slot2)
		slot1 = slot1 + 1
	until subStringGetByteCount(slot0, slot2) == 0

	return slot1 - 1
end

function subStringGetTrueIndex(slot0, slot1)
	slot2 = 0
	slot3 = 1
	slot4 = 1

	repeat
		slot3 = slot3 + subStringGetByteCount(slot0, slot3)
	until slot1 <= slot2 + 1

	return slot3 - slot4
end

function subStringGetByteCount(slot0, slot1)
	slot3 = 1

	if string.byte(slot0, slot1) == nil then
		slot3 = 0
	elseif slot2 > 0 and slot2 <= 127 then
		slot3 = 1
	elseif slot2 >= 192 and slot2 <= 223 then
		slot3 = 2
	elseif slot2 >= 224 and slot2 <= 239 then
		slot3 = 3
	elseif slot2 >= 240 and slot2 <= 247 then
		slot3 = 4
	end

	return slot3
end

return
