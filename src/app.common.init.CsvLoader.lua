slot0 = {}

function getCSVField(slot0)
	if not slot0[slot0] then
		slot4 = ResConfig.getConfig(slot2)
		slot0[slot0] = CsvKitchen.loadCsvFile2("data/" .. slot0 .. ".csv")

		if onCsvLoaderComplete then
			slot6 = slot0[slot0]

			onCsvLoaderComplete(slot4, slot0)
		end
	end

	return slot0[slot0]
end

slot1 = {}

function clearCsvCache(slot0)
	slot1 = ""
	slot2 = {}
	slot5 = csv

	for slot6, slot7 in pairs(slot4) do
		if slot0[slot6] then
			slot2[slot6] = slot7
		elseif slot0 then
			if slot1 ~= "" and slot1 ~= nil then
				slot1 = slot1 .. "\n"
			end

			slot1 = slot1 .. slot6
		end
	end

	csv = slot2

	if slot1 ~= "" and slot1 ~= nil then
	end
end

return
