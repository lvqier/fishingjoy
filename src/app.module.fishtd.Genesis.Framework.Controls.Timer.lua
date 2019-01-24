slot0 = ClassLoader:aquireClass("BaseNode")
slot1 = ClassLoader:aquireClass("Tools")
slot2 = class_C("Timer", function ()
	return slot0:create()
end)
slot2.REPEAT_FOREVER = -1

slot2.ctor = function (slot0)
	slot0._paused = true
	slot0._counter = 0
	slot0._schemeSize = 0
	slot0._schemes = {}
	slot0._namedMaps = {}
end

slot2.onEnter = function (slot0)
	slot0._entry = cc.Director:getInstance():getScheduler():scheduleScriptFunc(slot0:thisCall(slot1.scheduler, slot0), 0, false)
end

slot2.onExit = function (slot0)
	cc.Director:getInstance():getScheduler():unscheduleScriptEntry(slot0._entry)
end

slot2.scheduler = function (slot0, slot1)
	if not slot0._paused then
		slot0._counter = slot0._counter + slot1
		slot2 = slot0._schemeSize
		slot3 = 1

		for slot7 = 1, slot0._schemeSize, 1 do
			slot0:processScheme(slot0._schemes[slot7], slot1)

			if slot0._schemes[slot7] then
				if slot3 ~= slot7 then
					slot0._schemes[slot7].id = slot3
					slot0._schemes[slot3] = slot0._schemes[slot7]
					slot0._schemes[slot7] = nil
				end

				slot3 = slot3 + 1
			end
		end

		for slot7 = slot2, slot0._schemeSize, 1 do
			if slot0._schemes[slot7] then
				if slot3 ~= slot7 then
					slot0._schemes[slot3] = slot0._schemes[slot7]
					slot0._schemes[slot7] = nil
				end

				slot3 = slot3 + 1
			end
		end

		slot0._schemeSize = slot3 - 1
	end
end

slot2.addScheme = function (slot0, slot1, slot2, slot3, slot4)
	if slot4 and slot0._namedMaps[slot4] then
		return
	end

	slot0._schemeSize = slot0._schemeSize + 1
	slot0._schemes[slot0._schemeSize] = {
		paused = false,
		counter = 0,
		removed = false,
		task = slot1 or function ()
			return
		end,
		interval = slot2 or 0,
		repeat_times = slot3 or slot0.REPEAT_FOREVER,
		name = slot4,
		id = slot0._schemeSize
	}

	if slot4 then
		slot0._namedMaps[slot4] = slot5
	end

	return slot5
end

slot2.processScheme = function (slot0, slot1, slot2)
	if slot1 and not slot1.paused and slot1.repeat_times ~= 0 then
		if slot1.interval == 0 then
			slot1.task()

			slot1.repeat_times = slot1.repeat_times - 1
		else
			slot1.counter = slot1.counter + slot2

			while slot1.interval <= slot1.counter and slot1.repeat_times ~= 0 do
				slot1.counter = slot1.counter - slot1.interval

				slot1.task()

				slot1.repeat_times = slot1.repeat_times - 1
			end
		end

		if slot1.repeat_times == 0 then
			slot0:removeScheme(slot1)
		end
	end
end

slot2.removeScheme = function (slot0, slot1)
	if slot1 and not slot1.removed then
		slot1.removed = true
		slot0._schemes[slot1.id] = nil

		if slot1.name then
			slot0._namedMaps[slot1.name] = nil
		end
	end
end

slot2.resetScheme = function (slot0, slot1)
	if slot1 and not slot1.removed then
		slot1.counter = 0
	end
end

slot2.pauseScheme = function (slot0, slot1)
	if slot1 and not slot1.removed then
		slot1.pause = true
	end
end

slot2.startScheme = function (slot0, slot1)
	if slot1 and not slot1.removed then
		slot1.pause = false
	end
end

slot2.removeSchemeByName = function (slot0, slot1)
	slot0:removeScheme(slot0._namedMaps[slot1])
end

slot2.resetSchemeByName = function (slot0, slot1)
	slot0:resetScheme(slot0._namedMaps[slot1])
end

slot2.pauseSchemeByName = function (slot0, slot1)
	slot0:removeScheme(slot0._namedMaps[slot1])
end

slot2.startSchemeByName = function (slot0, slot1)
	slot0:pauseScheme(slot0._namedMaps[slot1])
end

slot2.start = function (slot0)
	slot0._paused = false
end

slot2.reset = function (slot0)
	slot0._counter = 0

	for slot4 = 1, slot0._schemeSize, 1 do
		slot0:resetScheme(slot0._schemes[slot4])
	end
end

slot2.pause = function (slot0)
	slot0._paused = true
end

slot2.stop = function (slot0)
	slot0._counter = 0
	slot0._paused = true

	for slot4 = 1, slot0._schemeSize, 1 do
		slot0:removeScheme(slot0._schemes[slot4])
	end
end

return slot2
