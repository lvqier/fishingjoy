function slot0(slot0)
	return string.gsub(string.gsub(string.gsub(string.format("%q", slot0), "\\\n", "\\n"), "\r", "\\r"), string.char(26), "\"..string.char(26)..\"")
end

table.save = function (slot0, slot1)
	slot2 = "   "
	slot3 = "\n"
	slot4, slot5 = nil

	if not slot1 then
		slot4 = {
			str = "",
			write = function (slot0, slot1)
				slot0.str = slot0.str .. slot1
			end
		}
		slot3 = ""
		slot2 = ""
	elseif slot1 == true or slot1 == 1 then
		slot4 = io.tmpfile()
		slot3 = ""
		slot2 = ""
	else
		slot4, slot5 = io.open(slot1, "w")

		if slot7 then
			return _, slot5
		end
	end

	slot7 = {
		[slot0] = 1
	}

	slot4:write("return {" .. slot3)

	for slot11, slot12 in ipairs(slot6) do
		if slot1 and slot1 ~= true and slot1 ~= 1 then
			slot4:write("-- Table: {" .. slot11 .. "}" .. slot3)
		end

		slot4:write("{" .. slot3)

		slot13 = {}

		for slot17, slot18 in ipairs(slot12) do
			slot13[slot17] = true

			if type(slot18) ~= "userdata" then
				if type(slot18) == "table" then
					if not slot7[slot18] then
						table.insert(slot6, slot18)

						slot7[slot18] = #slot6
					end

					slot4:write(slot2 .. "{" .. slot7[slot18] .. "}," .. slot3)
				elseif type(slot18) == "function" then
					slot4:write(slot2 .. "loadstring(" .. slot0(string.dump(slot18)) .. ")," .. slot3)
				else
					slot4:write(slot2 .. ((type(slot18) == "string" and slot0(slot18)) or tostring(slot18)) .. "," .. slot3)
				end
			end
		end

		for slot17, slot18 in pairs(slot12) do
			if not slot13[slot17] and type(slot18) ~= "userdata" then
				if type(slot17) == "table" then
					if not slot7[slot17] then
						table.insert(slot6, slot17)

						slot7[slot17] = #slot6
					end

					slot4:write(slot2 .. "[{" .. slot7[slot17] .. "}]=")
				else
					slot4:write(slot2 .. ((type(slot17) == "string" and "[" .. slot0(slot17) .. "]") or string.format("[%d]", slot17)) .. "=")
				end

				if type(slot18) == "table" then
					if not slot7[slot18] then
						table.insert(slot6, slot18)

						slot7[slot18] = #slot6
					end

					slot4:write("{" .. slot7[slot18] .. "}," .. slot3)
				elseif type(slot18) == "function" then
					slot4:write("loadstring(" .. slot0(string.dump(slot18)) .. ")," .. slot3)
				else
					slot4:write(((type(slot18) == "string" and slot0(slot18)) or tostring(slot18)) .. "," .. slot3)
				end
			end
		end

		slot4:write("}," .. slot3)
	end

	slot4:write("}")

	if not slot1 then
		return slot4.str .. "--|"
	elseif slot1 == true or slot1 == 1 then
		slot4:seek("set")

		return slot4:read("*a") .. "--|"
	else
		slot4:close()

		return 1
	end
end

table.load = function (slot0)
	slot1, slot2 = nil

	if string.sub(slot0, -3, -1) == "--|" then
		slot1, slot2 = loadstring(slot0)
	else
		return
	end

	if slot2 then
		return _, slot2
	end

	for slot6 = 1, #slot1(), 1 do
		slot7 = {}
		slot8 = {}

		for slot12, slot13 in pairs(slot1[slot6]) do
			if type(slot13) == "table" and slot1[slot13[1]] then
				table.insert(slot7, {
					slot12,
					slot1[slot13[1]]
				})
			end

			if type(slot12) == "table" and slot1[slot12[1]] then
				table.insert(slot8, {
					slot12,
					slot1[slot12[1]]
				})
			end
		end

		for slot12, slot13 in ipairs(slot7) do
			slot1[slot6][slot13[1]] = slot13[2]
		end

		for slot12, slot13 in ipairs(slot8) do
			slot1[slot6][slot13[1]] = nil
			slot1[slot6][slot13[2]] = slot1[slot6][slot13[1]]
		end
	end

	return slot1[1]
end

table.loadEx = function (slot0)
	slot1, slot2 = nil

	if string.sub(slot0, -3, -1) == "--|" then
		slot1, slot2 = loadstring(slot0)
	else
		if not CCString:createWithContentsOfFile(cc.FileUtils:sharedFileUtils():fullPathFromRelativePath(slot0)) then
			return
		end

		slot1, slot2 = loadstring(slot4:getCString())
	end

	if slot2 then
		return _, slot2
	end

	for slot6 = 1, #slot1(), 1 do
		slot7 = {}
		slot8 = {}

		for slot12, slot13 in pairs(slot1[slot6]) do
			if type(slot13) == "table" and slot1[slot13[1]] then
				table.insert(slot7, {
					slot12,
					slot1[slot13[1]]
				})
			end

			if type(slot12) == "table" and slot1[slot12[1]] then
				table.insert(slot8, {
					slot12,
					slot1[slot12[1]]
				})
			end
		end

		for slot12, slot13 in ipairs(slot7) do
			slot1[slot6][slot13[1]] = slot13[2]
		end

		for slot12, slot13 in ipairs(slot8) do
			slot1[slot6][slot13[1]] = nil
			slot1[slot6][slot13[2]] = slot1[slot6][slot13[1]]
		end
	end

	return slot1[1]
end

table.dup = function (slot0)
	if type(slot0) ~= "table" then
		return nil
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		if type(slot6) == "table" then
			slot1[slot5] = table.dup(slot6)
		elseif slot7 == "thread" then
			slot1[slot5] = slot6
		elseif slot7 == "userdata" then
			slot1[slot5] = slot6
		else
			slot1[slot5] = slot6
		end
	end

	return slot1
end

table.simpleDup = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		slot1[slot5] = true
	end

	return slot1
end

table.isEmpty = function (slot0)
	return _G.next(slot0) == nil
end

return
