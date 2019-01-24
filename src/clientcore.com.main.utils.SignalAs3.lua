SignalAs3 = class("SignalAs3")
slot0 = false
slot1 = {}

SignalAs3.ctor = function (slot0, slot1)
	slot0._traceName = slot1 or " noNameSignal"
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
	slot5 = false

	if not slot0._listenersDic[SignalAs3.getKey(slot1, slot2)] then
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
		error("Function passed to signal:add() must not non-nil.")
	end

	slot3, slot4 = slot0:getListener(slot1, slot2)

	if slot4 then
		slot0._listenersDic[slot3.key] = slot3
		slot0._numListeners = slot0._numListeners + 1

		if slot0._emitListenersArr then
			table.insert(slot0._emitListenersArr, slot3)
		end
	else
		slot3 = nil
	end

	return slot3
end

SignalAs3.addOnce = function (slot0, slot1, slot2)
	if slot0:add(slot1, slot2) then
		slot0._oneTimeListenersDic[slot3.key] = slot3
		slot0._numOneTimeListeners = slot0._numOneTimeListeners + 1
	end

	return slot3
end

SignalAs3.emit = function (slot0, ...)
	if slot0._numListeners <= 0 then
		return
	end

	slot1, slot2 = nil

	if slot0 then
		slot1 = os.clock()
		slot2 = slot0._numListeners
	end

	if slot0._numListeners == 1 then
		if SignalAs3.getOne(slot0._listenersDic).scope then
			slot3.func(slot3.scope, ...)
		else
			slot3.func(...)
		end
	else
		if not slot0._emitListenersArr then
			slot0._emitListenersArr = SignalAs3.toArray(slot0._listenersDic)

			table.sort(slot0._emitListenersArr, SignalAs3.listenerSorter)
		end

		for slot6, slot7 in ipairs(slot0._emitListenersArr) do
			if slot7.scope then
				slot7.func(slot7.scope, ...)
			else
				slot7.func(...)
			end
		end
	end

	if slot0._numOneTimeListeners > 0 then
		for slot6, slot7 in pairs(slot0._oneTimeListenersDic) do
			slot0:remove(slot7)
		end
	end

	if slot0 then
		slot3 = os.clock() - slot1

		if not slot1[slot0._traceName] then
			slot1[slot0._traceName] = {
				key = slot0._traceName
			}
		end

		slot4.callTotal = (slot4.callTotal or 0) + 1
		slot4.costTotal = (slot4.costTotal or 0) + slot3
		slot4.maxCost = math.max(slot4.maxCost or 0, slot3)
		slot4.minCost = math.min(slot4.minCost or 1000000000, slot3)
		slot4.emitNumTotal = (slot4.emitNumTotal or 0) + slot2
		slot4.maxEmitNum = math.max(slot4.maxEmitNum or 0, slot2)
		slot4.minEmitNum = math.min(slot4.minEmitNum or 1000000000, slot2)
	end
end

SignalAs3.remove = function (slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot3 = nil

	if slot0._listenersDic[(type(slot1) ~= "function" or slot0:getListener(slot1, slot2)) and slot1.key] ~= nil then
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
	for slot4, slot5 in pairs(slot0) do
		if type(slot5) == "table" and slot5.__cname == "SignalAs3" then
			if _enableClearLog then
				print("清空signal", slot4)
			end

			slot5:removeAll()
		end
	end
end

SignalAs3.toArray = function (slot0)
	slot1 = {}
	slot2 = 1

	for slot6, slot7 in pairs(slot0) do
		slot1[slot2] = slot7
		slot2 = slot2 + 1
	end

	return slot1
end

SignalAs3.getOne = function (slot0)
	for slot4, slot5 in pairs(slot0) do
		return slot5
	end

	return nil
end

SignalAs3.listenerSorter = function (slot0, slot1)
	return slot0.index < slot1.index
end

SignalAs3.getKey = function (slot0, slot1)
	return tostring(slot0) .. "|" .. tostring(slot1)
end

SignalAs3.getIsDebug = function ()
	return slot0
end

SignalAs3.setIsDebug = function (slot0)
	if slot0 ~= slot0 then
		slot0 = slot0
		slot1 = {}
	end
end

SignalAs3.printDebugInfo = function ()
	if slot0 and traceLog then
		slot0 = 7

		function slot2(slot0)
			return "<font color = \"#FFA500\">" .. slot0 .. "</font>"
		end

		function slot3(slot0)
			return "<font color = \"#FFFFFF\">" .. slot0 .. "</font>"
		end

		function slot4(slot0, slot1, slot2)
			slot1 = math.pow(10, slot1 or 2)

			if slot2 == 1 then
				return math.round(slot0 * slot1) / slot1
			elseif slot2 == 2 then
				return math.ceil(slot0 * slot1) / slot1
			else
				return math.floor(slot0 * slot1) / slot1
			end
		end

		function slot5(slot0, slot1)
			return slot0.key < slot1.key
		end

		slot6 = ""
		slot7 = 0
		slot8 = {}

		for slot12, slot13 in pairs(slot1) do
			if type(slot13) == "table" and slot13.costTotal then
				table.insert(slot8, slot13)
			end
		end

		table.sort(slot8, slot5)

		for slot12, slot13 in ipairs(slot8) do
			slot6 = slot6 .. "\n" .. slot13.key .. slot3(slot1("\navg:") .. slot14 .. slot1(", max:") .. slot4(slot13.maxCost, slot0) .. slot1(", min:") .. slot4(slot13.minCost, slot0) .. slot1(", eAvg:") .. slot4(slot13.emitNumTotal / slot13.callTotal, slot0) .. slot1(", eMax:") .. slot4(slot13.maxEmitNum, slot0) .. slot1(", eMin:") .. slot4(slot13.minEmitNum, slot0) .. slot1(", call:") .. slot13.callTotal .. slot1(", cost:") .. slot4(slot13.costTotal, slot0))
			slot7 = slot7 + 1
		end

		if slot6 ~= "" then
			traceLog("SgianlAs3调试：" .. slot2(slot6) .. "\n")
		end

		slot1 = {}
	end
end

return
