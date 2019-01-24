slot2 = "SignalAs3"
SignalAs3 = class(slot1)

SignalAs3.ctor = function (slot0)
	slot0._listenersDic = {}
	slot0._oneTimeListenersDic = {}
	slot0._emitListenersArr = nil
	slot0._numListeners = 0
	slot0._numOneTimeListeners = 0
	slot0._newIndex = 0
end

SignalAs3.isEmpty = function (slot0)
	return slot0._numListeners <= 0
end

SignalAs3.getListener = function (slot0, slot1, slot2)
	slot6 = slot2
	slot5 = false

	if not slot0._listenersDic[SignalAs3.getKey(slot4, slot1)] then
		slot0._newIndex = slot0._newIndex + 1
		slot5 = true
		slot4 = {
			func = slot1,
			scope = slot2,
			key = slot3,
			index = slot0._newIndex
		}
	end

	return slot4, slot5
end

SignalAs3.add = function (slot0, slot1, slot2)
	if slot1 == nil then
		slot5 = "Function passed to signal:add() must not non-nil."

		error(slot4)
	end

	slot7 = slot2
	slot3, slot4 = slot0.getListener(slot4, slot0, slot1)

	if slot4 then
		slot0._listenersDic[slot3.key] = slot3
		slot0._numListeners = slot0._numListeners + 1

		if slot0._emitListenersArr then
			slot8 = slot3

			table.insert(slot6, slot0._emitListenersArr)
		end
	else
		slot3 = nil
	end

	return slot3
end

SignalAs3.addOnce = function (slot0, slot1, slot2)
	slot7 = slot2

	if slot0.add(slot4, slot0, slot1) then
		slot0._oneTimeListenersDic[slot3.key] = slot3
		slot0._numOneTimeListeners = slot0._numOneTimeListeners + 1
	end

	return slot3
end

SignalAs3.emit = function (slot0, ...)
	if slot0._numListeners <= 0 then
		return
	elseif slot0._numListeners == 1 then
		slot3 = slot0._listenersDic

		if SignalAs3.getOne(slot2).scope then
			slot4 = slot1.scope

			slot1.func(slot3, ...)
		else
			slot1.func(...)
		end
	else
		if not slot0._emitListenersArr then
			slot3 = slot0._listenersDic
			slot0._emitListenersArr = SignalAs3.toArray(slot2)
			slot4 = SignalAs3.listenerSorter

			table.sort(slot2, slot0._emitListenersArr)
		end

		slot3 = slot0._emitListenersArr

		for slot4, slot5 in ipairs(slot2) do
			if slot5.scope then
				slot8 = slot5.scope

				slot5.func(slot7, ...)
			else
				slot5.func(...)
			end
		end
	end

	if slot0._numOneTimeListeners > 0 then
		slot3 = slot0._oneTimeListenersDic

		for slot4, slot5 in pairs(slot2) do
			slot9 = slot5

			slot0.remove(slot7, slot0)
		end
	end
end

SignalAs3.remove = function (slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot3 = nil
	slot6 = slot1

	if type(slot5) == "function" then
		slot8 = slot2
		slot3 = slot0.getListener(slot5, slot0, slot1)
	else
		slot3 = slot1
	end

	if slot0._listenersDic[slot3.key] ~= nil then
		slot0._listenersDic[slot3.key] = nil
		slot0._numListeners = slot0._numListeners - 1
		slot0._listenersDic[slot3.key] = nil

		if slot0._oneTimeListenersDic[slot3.key] then
			slot0._oneTimeListenersDic[slot3.key] = nil
			slot0._numOneTimeListeners = slot0._numOneTimeListeners - 1
		end

		slot0._emitListenersArr = nil
	end
end

SignalAs3.removeAll = function (slot0)
	slot0._listenersDic = {}
	slot0._oneTimeListenersDic = {}
	slot0._numListeners = 0
	slot0._numOneTimeListeners = 0
	slot0._emitListenersArr = nil
	slot0._newIndex = 0
end

SignalAs3.clearAllSignal = function (slot0)
	slot3 = slot0

	for slot4, slot5 in pairs(slot2) do
		slot8 = slot5

		if type(slot7) == "table" and slot5.__cname == "SignalAs3" then
			if _enableClearLog then
				slot9 = slot4

				print(slot7, "清空signal")
			end

			slot8 = slot5

			slot5.removeAll(slot7)
		end
	end
end

SignalAs3.toArray = function (slot0)
	slot1 = {}
	slot2 = 1
	slot5 = slot0

	for slot6, slot7 in pairs(slot4) do
		slot1[slot2] = slot7
		slot2 = slot2 + 1
	end

	return slot1
end

SignalAs3.getOne = function (slot0)
	slot3 = slot0

	for slot4, slot5 in pairs(slot2) do
		return slot5
	end

	return nil
end

SignalAs3.listenerSorter = function (slot0, slot1)
	return slot0.index < slot1.index
end

SignalAs3.getKey = function (slot0, slot1)
	slot4 = slot0
	slot6 = slot1

	return tostring(slot3) .. "|" .. tostring(slot5)
end

return
