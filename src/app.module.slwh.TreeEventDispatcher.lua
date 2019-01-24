TreeEventDispatcher = TreeEventDispatcher or {}
slot0 = print

TreeEventDispatcher.init = function (slot0)
	slot0._eventListenerArr = {}
	slot0._objectEvent = {}
end

TreeEventDispatcher.addEventListener = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot5 = slot5 or false
	slot4 = slot4 or 0

	if not slot1 then
		slot8 = "注册的是空事件"

		slot0(slot7)

		return
	end

	if not slot0._eventListenerArr[slot1] then
		slot0._eventListenerArr[slot1] = {}
	end

	if not slot3 then
		slot8 = "没有注入对象"

		slot0(slot7)

		return
	end

	if not slot2 then
		slot8 = "没有注入函数"

		slot0(slot7)

		return
	end

	slot7 = 1

	for slot11 = 1, #slot0._eventListenerArr[slot1], 1 do
		if slot6[slot11][1] == slot2 and slot6[slot11][2] == slot3 then
			return
		end

		if slot6[slot11][3] <= slot4 then
			slot7 = slot11
		end
	end

	slot12 = {
		slot2,
		slot3,
		slot4,
		slot5
	}

	table.insert(slot9, slot6, slot7)

	if not slot0._objectEvent[slot3] then
		slot0._objectEvent[slot3] = {}
	end

	slot0._objectEvent[slot3][slot1] = true
end

TreeEventDispatcher.dispatchEvent = function (slot0, slot1, slot2)
	if not slot0._eventListenerArr[slot1] or #slot3 == 0 then
		return
	end

	slot4 = nil

	for slot8 = #slot3, 1, -1 do
		if slot3[slot8] then
			slot11 = slot4[2]

			if type(slot10) == "userdata" then
				slot11 = slot4[2]

				if tolua.isnull(slot10) then
					slot12 = slot1

					echo(slot10, "target is null so clear Event,uiname:")

					slot12 = slot8

					table.remove(slot10, slot3)
				end
			else
				slot13 = slot1

				slot4[1](slot10, slot4[2], slot2)
			end

			if slot4[4] == true then
				break
			end
		end
	end
end

TreeEventDispatcher.removeEventListener = function (slot0, slot1, slot2, slot3)
	if not slot0._objectEvent[slot3] or not slot0._objectEvent[slot3][slot1] then
		return
	end

	if not slot0._eventListenerArr[slot1] or #slot4 == 0 then
		return
	end

	slot5 = nil

	for slot9 = #slot4, 1, -1 do
		if slot4[slot9][2] == slot3 and slot5[1] == slot2 then
			slot13 = slot9

			table.remove(slot11, slot4)
		end
	end

	if #slot4 <= 0 then
		slot0._eventListenerArr[slot1] = nil
	end
end

TreeEventDispatcher.clearOneObjEvent = function (slot0, slot1)
	if not slot0._objectEvent[slot1] then
		return
	end

	slot5 = slot2

	for slot6, slot7 in pairs(slot4) do
		if slot0._eventListenerArr[slot6] then
			for slot12 = #slot8, 1, -1 do
				if slot8[slot12][2] == slot1 then
					slot17 = slot12

					table.remove(slot15, slot8)
				end
			end
		end

		if slot8 and #slot8 <= 0 then
			slot0._eventListenerArr[slot6] = nil
		end
	end

	slot0._objectEvent[slot1] = nil
end

TreeEventDispatcher.clearEvent = function (slot0, slot1)
	slot0._eventListenerArr[slot1] = nil
end

TreeEventDispatcher.initEvent = function (slot0)
	slot0._eventListenerArr = {}
end

TreeEventDispatcher.clearAllEvent = function (slot0)
	slot0._eventListenerArr = {}
end

return
