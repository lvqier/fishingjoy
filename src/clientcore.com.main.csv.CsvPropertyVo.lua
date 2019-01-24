CsvPropertyVo = class("CsvPropertyVo")
CsvPropertyVo.TYPE_STRING = 1
CsvPropertyVo.TYPE_NUM = 2
CsvPropertyVo.TYPE_STRING_ARRAY = 3
CsvPropertyVo.TYPE_NUM_ARRAY = 4
CsvPropertyVo.TYPE_LUA_TABLE = 5

CsvPropertyVo.ctor = function (slot0, slot1)
	slot0.isKey = false
	slot0.type = CsvPropertyVo.TYPE_NUM
	slot0.propertyName = ""

	slot0:init(slot1)
end

CsvPropertyVo.init = function (slot0, slot1)
	slot0.isKey = string.find(string.lower(string.split(slot1, "_")[2] or "n"), "k") ~= nil
	slot0.isSkip = string.find(string.split(slot1, "_")[2] or "n", "c") ~= nil

	if not slot0.isSkip then
		if slot0.isKey then
			slot3 = string.gsub(slot3, "k", "")
		end

		if slot3 == "n" then
			slot0.type = CsvPropertyVo.TYPE_NUM
		elseif slot3 == "s" then
			slot0.type = CsvPropertyVo.TYPE_STRING
		elseif slot3 == "as" then
			slot0.type = CsvPropertyVo.TYPE_STRING_ARRAY
		elseif slot3 == "t" then
			slot0.type = CsvPropertyVo.TYPE_LUA_TABLE
		elseif slot3 == "an" then
			slot0.type = CsvPropertyVo.TYPE_NUM_ARRAY
		end
	end

	slot0.propertyName = slot2[1]
end

CsvPropertyVo.cookValue = function (slot0, slot1)
	if slot0.type == CsvPropertyVo.TYPE_NUM then
		return checknumber(slot1)
	elseif slot0.type == CsvPropertyVo.TYPE_STRING then
		return tostring(slot1)
	elseif slot0.type == CsvPropertyVo.TYPE_STRING_ARRAY then
		return string.split(tostring(slot1), ",")
	elseif slot0.type == CsvPropertyVo.TYPE_LUA_TABLE then
		return loadstring(tostring(slot1))
	elseif slot0.type == CsvPropertyVo.TYPE_NUM_ARRAY then
		return TableUtil.toNumberArray(string.split(tostring(slot1), ","))
	end

	return nil
end

return
