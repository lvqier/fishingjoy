echo = print

function traceLog_r(slot0)
	DebugUtil.print_r(slot0, traceLog)
end

function traceErrorLog(slot0)
	if ProxyDebugLog then
		ProxyDebugLog:pushLog(slot0, true)
	end

	print("[TRACE]" .. slot0)
end

function traceLog(...)
	slot1 = ""

	for slot5, slot6 in ipairs(slot0) do
		slot1 = slot1 .. tostring(slot6) .. "   "
	end

	if ProxyDebugLog then
		ProxyDebugLog:pushLog(slot1)
	end

	print("[TRACE]" .. slot1)
end

trace = traceLog
trace_r = traceLog_r

function print_r(slot0, slot1)
	slot1 = slot1 or print
	slot2 = ""

	function slot3(...)
		if slot0 ~= "" then
			slot0 = slot0 .. "\n"
		end

		for slot5 = 1, #{
			...
		}, 1 do
			slot0 = slot0 .. tostring(slot0[slot5])

			if slot5 ~= slot1 then
				slot0 = slot0 .. "   "
			end
		end
	end

	if type(slot0) ~= "table" then
		slot3(slot0)
		slot1(slot2)

		return
	end

	slot4 = {
		[slot0] = "<self>"
	}
	slot5 = string.rep(" ", 2)
	slot6 = 0

	slot3(string.format("{"))
	slot7("<self>", slot0)
	slot3(string.format("}"))
	slot1(slot2)
end

DebugUtil = {
	printAllKVs = function (slot0)
		slot2 = slot0.__cname or "no cname"

		print("-------kvs of-> ")

		if type(slot0) ~= "userdata" then
			for slot5, slot6 in pairs(slot0) do
				print(tostring(slot5) .. " --- " .. tostring(slot6))
			end
		end

		print(string.rep("-", #slot1))
	end,
	enableMark = false
}
slot0 = {}
slot1 = {}

DebugUtil.beginMark = function (slot0)
	if DebugUtil.enableMark then
		slot0[slot0] = os.clock()
	end
end

DebugUtil.try2PrintMark = function (slot0)
	if DebugUtil.enableMark then
		slot1 = os.clock()

		if not slot0.printTime and not slot0 then
			slot0.printTime = slot1
		elseif slot0 or slot1 - slot0.printTime > 5 then
			slot2 = ""
			slot3 = {}

			for slot7, slot8 in pairs(slot0) do
				if type(slot8) == "table" and slot8.count then
					slot8.__key = slot7

					table.insert(slot3, slot8)
				end
			end

			table.sort(slot3, slot4)

			function slot5(slot0, slot1)
				if slot1 and slot1 < slot0 then
					return HtmlUtil.createOrangeTxt(slot0)
				else
					return HtmlUtil.createWhiteTxt(slot0)
				end
			end

			for slot9, slot10 in ipairs(slot3) do
				slot10.cost = nil
				slot10.count = nil
				slot2 = slot2 .. "\n" .. "avg:" .. slot5(fixFloat(slot10.cost / slot10.count, 7), 0.016) .. " max:" .. slot5(fixFloat(slot10.maxCost, 7), 0.016) .. " min:" .. slot5(fixFloat(slot10.minCost, 7), 0.016) .. " count:" .. slot5(slot10.count) .. " costT:" .. slot5(fixFloat(slot10.cost, 7)) .. " key:" .. HtmlUtil.createYellowTxt(slot10.__key)
			end

			if slot2 ~= "" then
				slot6 = "api调用次数统计:"

				if slot0.printTime then
					slot6 = slot6 .. "，统计间隔:" .. fixFloat(slot1 - slot0.printTime, 7)
				end

				traceLog(slot6 .. slot2)
			end

			slot0.printTime = slot1
		end
	end
end

DebugUtil.traceStack = function ()
	return
end

DebugUtil.endMark = function (slot0)
	if DebugUtil.enableMark and slot0[slot0] then
		slot1[slot0] or {}.cost = (slot1[slot0] or .cost or 0) + slot1
		slot1[slot0] or .costTotal = (slot1[slot0] or .costTotal or 0) + slot1
		slot1[slot0] or .count = (slot1[slot0] or .count or 0) + 1
		slot1[slot0] or .countTotal = (slot1[slot0] or .countTotal or 0) + 1
		slot1[slot0] or .maxCost = math.max(slot1, slot1[slot0] or .maxCost or 0)
		slot1[slot0] or .minCost = math.min(slot1, slot1[slot0] or .minCost or 100000)
		slot1[slot0] = slot1[slot0] or 
		slot0[slot0] = nil
	end
end

DebugUtil.traceback = function (slot0)
	if slot0 then
		trace(debug.traceback())
	else
		print(debug.traceback())
	end
end

DebugUtil.print_r = print_r

return
