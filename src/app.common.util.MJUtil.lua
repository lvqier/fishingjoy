MJUtil = {}

MJUtil.cookMJDatasByIds = function (slot0)
	slot1 = {}
	slot2 = {}
	slot5 = slot0

	for slot6, slot7 in ipairs(slot4) do
		slot12 = MJUtil.cookCardVoById(slot9)

		table.insert(slot7, slot1)

		slot12 = MJUtil.cookCardVoById(slot9)

		table.insert(slot7, slot2)
	end

	slot6 = MJUtil.mjDataSorter

	table.sort(slot4, slot1)

	return slot1, slot2
end

MJUtil.isHuaPai = function (slot0)
	slot1 = slot0
	slot4 = slot0

	if type(slot3) ~= "number" then
		slot4 = slot0

		if type(slot3) == "string" then
			slot6 = slot0
			slot1 = MJUtil.cookCardVoById(parseInt(slot5))
		end
	end

	if slot1 then
		return slot1.type >= 60 and slot1.type < 70
	else
		return false
	end
end

MJUtil.cookCardVoById = function (slot0)
	slot4 = slot0 % 100 / 10
	slot4 = slot0 % 1000 / 100
	slot4 = slot0 / 1000
	slot6 = ({
		index = math.floor(slot3),
		value = math.floor(slot3),
		type = math.floor(slot3),
		isGui = battleMgr.isGui(slot3, battleMgr, ()["type"]),
		guiState = slot0 % 10
	})["value"]

	return 
end

MJUtil.cookCardIdByVo = function (slot0)
	if slot0 then
		return slot0.type * 1000 + slot0.value * 100 + slot0.index * 10 + slot0.guiState
	else
		return nil
	end
end

MJUtil.mjDataSorterNoGui = function (slot0, slot1)
	if slot0.type ~= slot1.type then
		return slot1.type < slot0.type
	elseif slot0.value ~= slot1.value then
		return slot1.value < slot0.value
	elseif slot0.index ~= slot1.index then
		return slot1.index < slot0.index
	else
		return false
	end
end

MJUtil.mjDataSorter = function (slot0, slot1)
	if slot0.isGui ~= slot1.isGui then
		return slot1.isGui
	else
		slot5 = slot1

		return MJUtil.mjDataSorterNoGui(slot3, slot0)
	end
end

MJUtil.isMjDataSame = function (slot0, slot1)
	if slot0 == slot1 then
		return true
	elseif slot0 and slot1 then
		return slot0.type == slot1.type and slot0.value == slot1.value and slot0.index == slot1.index
	else
		return false
	end
end

MJUtil.calTingPais = function (slot0)
	table.sort(slot2, slot0)

	slot1 = {}
	slot2 = {}
	slot5 = slot0

	for slot6, slot7 in ipairs(MJUtil.mjDataSorter) do
		if slot7.isGui then
			slot11 = slot1

			table.insert(slot9, slot7)
		else
			slot11 = slot2

			table.insert(slot9, slot7)
		end
	end

	slot3 = {
		checkIndex = 1,
		groups = {},
		remainGuiNum = #slot1
	}
end

MJUtil.checkNext = function (slot0, slot1, slot2)
	slot3 = slot0[slot1]

	if slot0[slot1 + 1] then
		slot8 = slot4

		if MJUtil.isLian(slot6, slot3) then
		end

		slot8 = vo2

		if MJUtil.isSame(slot6, vo1) then
		end

		if slot2.remainGuiNum > 0 then
		end
	end
end

MJUtil.isLian = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	slot4 = slot0.value - slot1.value

	return math.abs(slot3) == 1
end

MJUtil.isSame = function (slot0, slot1)
	return slot0.type == slot1.type and slot0.value == slot1.value
end

MJUtil.findGroups = function (slot0, slot1, slot2)
	slot3 = 0
	slot4 = #normalMjs

	function slot5(slot0, slot1, slot2, slot3)
		slot7 = slot1

		if isLian(slot5, slot0) then
		end
	end

	slot6 = 1

	while slot4 >= slot6 do
	end
end

return
