module("TableUtil", package.seeall)

function toNumberArray(slot0, slot1)
	slot2 = {}

	if slot1 then
		for slot6, slot7 in pairs(slot0) do
			push(slot2, checknumber(slot7))
		end
	else
		for slot6, slot7 in ipairs(slot0) do
			push(slot2, checknumber(slot7))
		end
	end

	return slot2
end

function removeElements(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		slot2[slot7] = true
	end

	slot3 = {}

	for slot7, slot8 in ipairs(slot0) do
		if not slot2[slot8] then
			table.insert(slot3, slot8)
		end
	end

	return slot3
end

function getKeys(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		push(slot1, slot5)
	end

	return slot1
end

function toArray(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		push(slot1, slot6)
	end

	return slot1
end

function concatDic(...)
	slot0 = {}

	for slot5 = 1, #{
		...
	}, 1 do
		for slot10, slot11 in pairs(slot6) do
			slot0[slot10] = slot11
		end
	end

	return slot0
end

function concat(...)
	slot0 = {}
	slot2 = 1

	for slot6 = 1, #{
		...
	}, 1 do
		for slot11 = 1, #slot1[slot6], 1 do
			slot0[slot2] = slot7[slot11]
			slot2 = slot2 + 1
		end
	end

	return slot0
end

function subTable(slot0, slot1, slot2)
	slot1 = slot1 or 1
	slot3 = {}
	slot2 = (not slot2 or math.min(#slot0, slot2)) and #slot0
	slot4 = 1

	for slot8 = slot1, slot2, 1 do
		slot3[slot4] = slot0[slot8]
		slot4 = slot4 + 1
	end

	return slot3
end

function array2Dic(slot0, slot1, slot2)
	slot0 = slot0 or {}

	if slot1 == nil then
		slot1 = true
	end

	slot3 = {}

	for slot7, slot8 in ipairs(slot0) do
		if slot8 ~= "" then
			if not slot2 then
				slot3[slot8] = slot1
			elseif slot2 == 1 then
				slot3[parseInt(slot8)] = slot1
			elseif slot2 == 2 then
				slot3[tostring(slot8)] = slot1
			end
		end
	end

	return slot3
end

function copyData(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		slot1[slot5] = slot6
	end

	return slot1
end

function copyDataDep(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0) do
		if type(slot7) ~= "table" then
			slot2[slot6] = slot7
		else
			slot2[slot6] = TableUtil.copyDataDep(slot7, slot1)
		end
	end

	if not slot1 and getmetatable(slot0) then
		setmetatable(slot2, slot3)
	end

	return slot2
end

function removeByLen(slot0, slot1, slot2)
	return removeByPos(slot0, slot1, (slot1 + (slot2 or #slot0)) - 1)
end

function removeByPos(slot0, slot1, slot2)
	slot3 = {}
	slot2 = (not slot2 and #slot0) or math.min(slot2, #slot0)
	slot5 = 1

	for slot9 = slot1, slot4, 1 do
		slot3[slot5] = slot0[slot9]

		if slot4 < (slot9 + slot2) - slot1 + 1 then
			slot0[slot9] = nil
		else
			slot0[slot9] = slot0[slot11]
		end

		slot5 = slot5 + 1
	end

	return slot3
end

function sortOn(slot0, slot1, slot2)
	table.sort(slot0, function (slot0, slot1)
		if slot0 then
			return slot1[slot1] <= slot0[slot1]
		else
			return slot0[slot1] <= slot1[slot1]
		end
	end)
end

function push(slot0, slot1, slot2)
	if slot2 and table.indexof(slot0, slot1) then
		return false
	end

	slot0[#slot0 + 1] = slot1

	return true
end

function pop(slot0)
	slot2 = nil

	if #slot0 > 0 and slot0[slot1] then
		table.remove(slot0, slot1)
	end

	return slot2
end

function unshift(slot0, slot1, slot2)
	if slot2 and table.indexof(slot0, slot1) then
		return
	end

	table.insert(slot0, 1, slot1)
end

function shift(slot0)
	slot1 = nil

	if slot0[1] then
		table.remove(slot0, 1)
	end

	return slot1
end

function clear(...)
	for slot4, slot5 in ipairs(slot0) do
		slot6 = #slot5

		while slot6 > 0 do
			table.remove(slot5, slot6)

			slot6 = slot6 - 1
		end

		for slot10, slot11 in pairs(slot5) do
			slot5[slot10] = nil
		end
	end
end

function randomSort(slot0)
	slot1 = {}

	table.sort(slot0, function (slot0, slot1)
		if not slot0[slot0] then
			slot0[slot0] = math.random()
		end

		if not slot0[slot1] then
			slot0[slot1] = math.random()
		end

		return slot2 < slot3
	end)

	return slot0
end

function createWeakTable(slot0)
	setmetatable({}, {
		__mode = slot0 or "k"
	})
end

function putObjByKeys(slot0, slot1, slot2, slot3)
	if not slot3 then
		slot2 = concat(slot2)
	end

	slot4 = shift(slot2)

	if #slot2 == 0 then
		if slot4 then
			slot0[slot4] = slot1
		else
			push(slot0, slot1)
		end
	else
		if not slot0[slot4] then
			slot0[slot4] = {}
		end

		putObjByKeys(slot5, slot1, slot2, true)
	end
end

function cookDataAs2Dimension(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}
	slot6 = {}
	slot7 = 1
	slot8 = slot4 or math.max(math.ceil(#slot0 / slot1) * slot1, (slot2 or 0) * slot1)

	for slot12 = 1, slot8, 1 do
		slot13 = slot0[slot12] or slot3

		if slot7 == 1 then
			TableUtil.push(slot5, {})
		end

		slot6[slot7] = slot13
		slot7 = (slot7 == slot1 and 1) or slot7 + 1
	end

	return slot5
end

function getOneFromHash(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		if not slot1 then
			slot0[slot5] = nil
		end

		return slot6
	end

	return nil
end

function getRandomElementFromDic(slot0)
	slot2 = math.random(1, slot1)
	slot3 = 1

	for slot7, slot8 in pairs(slot0) do
		if slot3 == slot2 then
			return slot8
		end

		slot3 = slot3 + 1
	end
end

function getRandomElement(slot0)
	if slot0 then
		if #slot0 > 0 then
			return slot0[math.random(1, slot1)]
		else
			return nil
		end
	else
		return nil
	end
end

function clearTableFrom(slot0, slot1)
	for slot5 = slot1, #slot0, 1 do
		slot0[slot5] = nil
	end
end

function copyPropertyTo(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		slot1[slot5] = slot6
	end

	return slot1
end

function copyOldPropertyTo(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		if not slot1[slot5] then
			slot1[slot5] = slot6
		end
	end

	return slot1
end

function getOne(slot0)
	for slot4, slot5 in pairs(slot0) do
		return slot5, slot4
	end

	return nil
end

function isEmpty(slot0)
	if slot0 then
		for slot4, slot5 in pairs(slot0) do
			return false
		end
	end

	return true
end

function reverse(slot0)
	slot1 = {}

	for slot5 = 1, #slot0, 1 do
		slot6 = #slot0
		slot1[slot5] = table.remove(slot0)
	end

	return slot1
end

function validateStringArray(slot0)
	slot1 = 1
	slot2 = #slot0

	while slot1 <= slot2 do
		if not StringUtil.isStringValid(slot0[slot1]) then
			table.remove(slot0, slot1)

			slot1 = slot1 - 1
			slot2 = slot2 - 1
		end

		slot1 = slot1 + 1
	end

	return slot0
end

function IsInTable(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		if slot6 == slot0 then
			return true
		end
	end

	return false
end

return
