EventDispatcher = EventDispatcher or {}
EventDispatcher.eventListenerArr = {}
EventDispatcher._objectEvent = {}
slot0 = print

EventDispatcher.addEventListener = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot5 = slot5 or false
	slot4 = slot4 or 0

	if not slot1 then
		slot0("注册的是空事件")

		return
	end

	if not slot0.eventListenerArr[slot1] then
		slot0.eventListenerArr[slot1] = {}
	end

	if not slot3 then
		slot0("没有注入对象")

		return
	end

	if not slot2 then
		slot0("没有注入函数")

		return
	end

	for slot10 = 1, #slot0.eventListenerArr[slot1], 1 do
		if slot6[slot10][1] == slot2 and slot6[slot10][2] == slot3 then
			return
		end
	end

	table.insert(slot6, {
		slot2,
		slot3,
		slot4,
		slot5
	})

	if not slot0._objectEvent[slot3] then
		slot0._objectEvent[slot3] = {}
	end

	slot0._objectEvent[slot3][slot1] = true
end

EventDispatcher.dispatchEvent = function (slot0, slot1, slot2)
	if not slot0.eventListenerArr[slot1] or #slot3 == 0 then
		return
	end

	slot4 = {
		event = slot1,
		target = slot0,
		param = slot2
	}

	function sortFunc(slot0, slot1)
		return slot0[3] < slot1[3]
	end

	table.sort(slot3, sortFunc)

	slot5 = nil

	for slot9 = #slot3, 1, -1 do
		if slot3[slot9] then
			if type(slot5[2]) == "userdata" and tolua.isnull(slot5[2]) then
				echo("target is null so clear Event,uiname:", slot1)
				table.remove(slot3, slot9)
			else
				slot5[1](slot5[2], slot4)
			end

			if slot5[4] == true then
				break
			end
		end
	end

	slot4.target = nil
	slot4.params = nil
end

EventDispatcher.removeEventListener = function (slot0, slot1, slot2, slot3)
	if not slot0._objectEvent[slot3] or not slot0._objectEvent[slot3][slot1] then
		return
	end

	if not slot0.eventListenerArr[slot1] or #slot4 == 0 then
		return
	end

	slot5 = nil

	for slot9 = #slot4, 1, -1 do
		if slot4[slot9][2] == slot3 and slot5[1] == slot2 then
			table.remove(slot4, slot9)
		end
	end

	if #slot4 <= 0 then
		slot0.eventListenerArr[slot1] = nil
	end
end

EventDispatcher.clearOneObjEvent = function (slot0, slot1)
	if not slot0._objectEvent[slot1] then
		return
	end

	for slot6, slot7 in pairs(slot2) do
		if slot0.eventListenerArr[slot6] then
			for slot12 = #slot8, 1, -1 do
				if slot8[slot12][2] == slot1 then
					table.remove(slot8, slot12)
				end
			end
		end

		if slot8 and #slot8 <= 0 then
			slot0.eventListenerArr[slot6] = nil
		end
	end

	slot0._objectEvent[slot1] = nil
end

EventDispatcher.clearEvent = function (slot0, slot1)
	slot0.eventListenerArr[slot1] = nil
end

EventDispatcher.initEvent = function (slot0)
	slot0.eventListenerArr = {}
end

EventDispatcher.clearAllEvent = function (slot0)
	slot0.eventListenerArr = {}
end

return
