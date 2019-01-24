module("CsvKitchen", package.seeall)
requireClientCoreMain("csv.CsvPropertyVo")

slot0 = {
	",",
	";"
}

CsvKitchen.loadCsvFile = function (slot0)
	assert(io.readfile(slot0) ~= nil, "csv file not exits:" .. slot0)

	slot3 = {}
	slot4 = nil
	slot5 = 0
	slot6 = TableUtil.shift(assert)

	for slot10, slot11 in ipairs(slot0) do
		if slot5 < StringUtil.numOfPattern(slot6, slot11) then
			slot4 = slot11
			slot5 = slot12
		end
	end

	slot8 = {}

	for slot12, slot13 in ipairs(slot7) do
		if not CsvPropertyVo.new(slot13).isSkip then
			slot7[slot12] = slot14

			if slot14.isKey then
				TableUtil.push(slot8, slot14)
			end
		end
	end

	for slot12, slot13 in ipairs(slot2) do
		slot14 = {}
		slot15 = {}
		slot16 = CsvUtil.parseCSVLine(slot13, slot4)

		for slot20, slot21 in ipairs(slot7) do
			slot14[slot21.propertyName] = slot21:cookValue(slot16[slot20])

			if slot21.isKey then
				TableUtil.push(slot15, slot22)
			end
		end

		TableUtil.putObjByKeys(slot3, slot14, slot15)
	end

	slot10 = "#00FF00"

	if tickMgr:getTimer() - timer > 0.8 then
		slot10 = "#FF0000"
	end

	traceLog("load csv cost:<font color =‘" .. slot10 .. "’>" .. tostring(slot9) .. "</font> second: " .. slot0)

	return slot3
end

function slot1(slot0, slot1)
	if slot0.__csvSuper._keyOrderDic[slot1] then
		return slot0[slot2]
	else
		return nil
	end
end

slot2 = "[\"']?([^_,\"']+)(_?)([kKcC]?)([^kKcC\"',]?)([kKcC]?)[\"']?,?"

CsvKitchen.trimFirstIntroLine = function (slot0)
	slot1 = 0
	slot2 = 0

	for slot6, slot7 in string.gmatch(slot0, "()([\"\n])") do
		if slot7 == "\"" then
			slot1 = slot1 + 1
		elseif slot1 % 2 == 0 then
			slot2 = slot6 + 1

			break
		end
	end

	if slot2 == 0 then
		return slot0
	else
		return string.sub(slot0, slot2)
	end
end

CsvKitchen.loadCsvFile2 = function (slot0)
	slot1 = os.clock()

	assert(cc.FileUtils:getInstance():getStringFromFile(slot0) ~= nil, "csv file not exits:" .. slot0)

	slot4 = {}
	slot5 = ","
	slot6 = {}
	slot7 = {}
	slot8 = {}
	slot9 = {}
	slot9 = {
		_keyOrderDic = {},
		__index = slot0
	}
	slot10 = 1
	slot11 = 1

	for slot16, slot17, slot18, slot19, slot20 in string.gmatch(string.split(slot2, "\n")[1], slot1) do
		if string.lower(slot19) == "" then
			slot19 = "n"
		end

		if slot18 == "" then
			slot18 = slot20
		end

		slot21 = slot16 == "" or string.lower(slot18) == "c"

		if slot21 then
			slot6[slot11] = true
		else
			if slot18 == "k" then
				table.insert(slot7, slot10)
			end

			slot9._keyOrderDic[slot16] = slot10
			slot8[slot10] = slot19
			slot10 = slot10 + 1
		end

		slot11 = slot11 + 1
	end

	slot13 = #slot7

	for slot17 = slot12 + 2, #slot3, 1 do
		if slot3[slot17] ~= "" then
			slot19 = {}
			slot10 = 1

			for slot24, slot25 in ipairs(slot20) do
				if not slot6[slot24] then
					slot19[slot10] = CsvUtil.cookValueByTypeStr(slot8[slot10], StringUtil.trimQuoter(slot25))
					slot10 = slot10 + 1
				end
			end

			slot21 = slot4

			for slot25, slot26 in ipairs(slot7) do
				if slot25 == slot13 then
					slot21[slot19[slot26]] = slot19
				else
					if not slot21[slot19[slot26]] then
						slot21[slot19[slot26]] = {}
					end

					slot21 = slot27
				end
			end

			setmetatable(slot19, slot9)

			slot19.__csvSuper = slot9
		end
	end

	print("加载csv:", slot0, "耗时:", os.clock() - slot1)

	return slot4
end

return
