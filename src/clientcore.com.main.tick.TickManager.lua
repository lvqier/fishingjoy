requireClientCoreMain("tick.TickTimer")
requireClientCoreMain("tick.TickBase")
requireClientCoreMain("tick.TimerBase")

TickManager = class("TickManager")
slot0 = {}
slot1 = {}
slot2 = {}
slot3 = {}
slot4 = 0
slot5 = nil
slot6 = 1
slot7 = {
	totalTime = 0,
	frameTime = 0
}

TickManager.ctor = function (slot0)
	slot0._tickTimerInS = nil
	slot0._isDebug = false
	slot0._tickTimersPool = {}
	slot0.systemStartTime = nil

	slot0:initOsTime()
	slot0:startTick()
end

TickManager.startTick = function (slot0)
	if not slot0 then
		slot0 = cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(slot0, slot0.tick), 0, false)
	end
end

TickManager.stopTick = function (slot0)
	if slot0 then
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(slot0)

		slot0 = nil
	end
end

TickManager.tickHooker = function (slot0, slot1, slot2)
	return
end

TickManager.tick = function (slot0, slot1)
	if slot1 > 1 then
		_t = _t or 0

		trace(HtmlUtil.createYellowTxt(string.format("异常瞬间fps:%f  tickmgr dt:%f  cocos dt: %f", 1 / slot1, tickMgr:getTimer() - _t, slot1)))

		_t = tickMgr:getTimer()

		return
	end

	slot3 = nil
	slot0._tickTimerInS = slot0:getTime()

	slot0:tickHooker(slot1, (slot0._tickTimerInS and slot0.getTime() - slot0._tickTimerInS) or slot1)

	slot0.frameTime = slot1 * 1000
	slot0.totalTime = slot0.totalTime + slot0.frameTime
	slot1 = 1

	while slot1 <= slot2 do
		slot5 = slot4[slot1]
		slot6 = false

		if slot0._isDebug then
			slot6 = slot5.__cname == "TimerBase"
		end

		if slot5.isTicking and slot4:isNextTime(slot0) then
			slot0:markDebugInfo(slot5, true)

			slot7 = slot5:tick(slot4.curFrameTime, slot4.curFrameTimeReal)

			if slot6 then
				if slot7 then
					slot0:markDebugInfo(slot5, false)
				end
			else
				slot0:markDebugInfo(slot5, false)
			end

			slot4:resetSomeData()
		end

		slot1 = slot1 + 1
	end

	slot0:markMainTickDebug(slot2)
end

TickManager.addTick = function (slot0, slot1, slot2)
	slot0:addCustomTick(slot1, 0, 0, slot2)
end

TickManager.addCustomTick = function (slot0, slot1, slot2, slot3, slot4)
	if not slot1 or table.indexof(slot0, slot1) then
		return
	else
		slot0:createTickTimer().cate = slot4 or 0

		if (not slot2 or slot2 == 0) and (not slot3 or slot3 == 0) then
			slot3 = 1
		elseif slot2 ~= 0 and slot2 ~= nil then
			slot3 = 1000 / slot2
		end

		slot5.distanceTime = slot3

		if slot1[slot4] then
			slot5.timerScaleFactor = slot1[slot4]
		else
			slot1[slot4] = slot5.timerScaleFactor
		end

		table.insert(slot0, slot1)
		table.insert(slot2, slot5)

		slot3 = slot3 + 1
	end
end

TickManager.clearTickTimerPool = function (slot0)
	slot0._tickTimersPool = {}
end

TickManager.putTickTimer2Pool = function (slot0, slot1)
	if slot1 then
		slot1:reset()
		table.insert(slot0._tickTimersPool, slot1)
	end
end

TickManager.createTickTimer = function (slot0)
	return TableUtil.pop(slot0._tickTimersPool) or TickTimer.new()
end

TickManager.removeTick = function (slot0, slot1)
	if table.indexof(slot0, slot1) then
		table.remove(slot0, slot2)
		table.remove(slot1, slot2)

		slot2 = math.max(slot2 - 1, 1)

		slot0:putTickTimer2Pool(slot3 - 1)
	end
end

TickManager.setTicksTimeScaleByCate = function (slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0) do
		if slot7.cate == slot1 then
			slot7.timerScaleFactor = slot2
		end
	end

	slot1[slot1] = slot2
end

TickManager.delayedCall = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot6 = slot6 or 0

	if slot4 == nil then
		slot4 = true
	end

	slot7 = TimerBase.new(slot1, slot2, slot3 or 0, slot5, slot6)

	if slot4 then
		slot7:start()
	end

	return slot7
end

TickManager.initOsTime = function (slot0)
	if not slot0.socket then
		slot0.scoket = require("socket")
		slot0.systemStartTime = slot0:getTime()
	end
end

TickManager.getTime = function (slot0)
	return slot0.scoket:gettime()
end

TickManager.getTimer = function (slot0)
	return slot0:getTime() - slot0.systemStartTime
end

TickManager.getTimerMS = function (slot0)
	return math.floor((slot0:getTime() - slot0.systemStartTime) * 1000)
end

TickManager.getTodaySecond = function (slot0)
	slot1 = os.date("*t", slot0:getTime())

	return slot1.sec + (slot1.min + slot1.hour * 60) * 60
end

TickManager.nextFrameCall = function (slot0, slot1)
	slot2 = nil
	slot2 = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function ()
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(cc.Director.getInstance().getScheduler().unscheduleScriptEntry)
		applyFunction(cc.Director.getInstance().getScheduler())
	end, 0, false)
end

TickManager.getTodayZeroTimestamp = function (slot0)
	return slot0:getServerTime() - slot0:getTodaySecond()
end

TickManager.isToday = function (slot0, slot1)
	return slot0:getTodayZeroTimestamp() <= slot1 and slot1 < slot2 + 86400
end

TickManager.isDebug = function (slot0)
	return slot0._isDebug
end

TickManager.setDebug = function (slot0, slot1)
	if slot0._isDebug ~= slot1 then
		slot0._isDebug = slot1

		if slot1 then
			slot0._printT = tickMgr:getTimer()
		else
			slot0 = {}
		end
	end
end

TickManager.getDebugKey = function (slot0, slot1)
	return tostring(slot1.traceName or slot1.__cname) .. " - " .. tostring(slot1)
end

TickManager.markMainTickDebug = function (slot0, slot1)
	if slot0._isDebug then
		slot0._mainCostTotal = (slot0._mainCostTotal or 0) + slot0:getTime() - slot1
		slot0._mainCallTotal = (slot0._mainCallTotal or 0) + 1
		slot0._mainMinCost = math.min(slot0._mainMinCost or 1000000000, slot0.getTime() - slot1)
		slot0._mainMaxCost = math.max(slot0._mainMaxCost or 0, slot0.getTime() - slot1)
	end
end

TickManager.markDebugInfo = function (slot0, slot1, slot2)
	if slot0._isDebug then
		if not slot0[slot0:getDebugKey(slot1)] then
			slot4 = {
				key = slot3
			}
			slot5 = slot1._fps

			if slot1.delayInMs and slot1.delayInMs ~= 0 then
				slot5 = math.min(math.floor(1000 / math.max(slot1.delayInMs, 1) * 100000) / 100000, 60)
			end

			slot4.fps = slot5
			slot0[slot3] = slot4
		end

		if slot2 then
			slot4.t1 = slot0:getTimer()
		elseif slot4.t1 then
			slot4.callTotal = (slot4.callTotal or 0) + 1
			slot4.maxCost = math.max(slot4.maxCost or 0, tickMgr:getTimer() - slot4.t1)
			slot4.minCost = math.min(slot4.minCost or 1000000000, tickMgr.getTimer() - slot4.t1)
			slot4.costTotal = (slot4.costTotal or 0) + tickMgr.getTimer() - slot4.t1
			slot4.t1 = nil
		end
	end
end

TickManager.printDebugInfo = function (slot0, slot1)
	if slot0._isDebug and (tickMgr:getTimer() - slot0._printT > 10 or slot1) then
		slot7 = "\ntickMgr:\n" .. slot6
		slot8 = 0
		slot9 = {}

		for slot13, slot14 in pairs(slot0) do
			if type(slot14) == "table" and slot14.costTotal then
				table.insert(slot9, slot14)
			end
		end

		table.sort(slot9, slot10)

		for slot14, slot15 in ipairs(slot9) do
			slot7 = slot7 .. "\n" .. slot15.key .. HtmlUtil.createWhiteTxt(slot5(" fps:") .. slot15.fps .. slot5("\navg:") .. slot16 .. slot5(", max:") .. fixFloat(slot15.maxCost, slot3) .. slot5(", min:") .. fixFloat(slot15.minCost, slot3) .. slot5(", call:") .. slot15.callTotal .. slot5(", cost:") .. fixFloat(slot15.costTotal, slot3))
			slot8 = slot8 + 1
		end

		if slot7 ~= "" then
			traceLog("期间执行过tick()的详细列表 (" .. fixFloat(slot2, slot3) .. "s内, " .. slot8 .. "个)：" .. HtmlUtil.createOrangeTxt(slot7) .. "\n")
		end

		({})["_printT"] = tickMgr:getTimer()
	end
end

TickManager.printInfo = function (slot0, slot1)
	if slot1 then
		slot2 = ""

		for slot6, slot7 in ipairs(slot0) do
			slot2 = slot2 .. "\n" .. tostring(slot7.traceName or slot7.__cname)
			slot8 = slot7._fps

			if slot7.delayInMs and slot7.delayInMs ~= 0 then
				slot8 = math.min(math.floor(1000 / math.max(slot7.delayInMs, 1) * 100000) / 100000, 60)
			end

			slot2 = slot2 .. HtmlUtil.createWhiteTxt(" fps:" .. slot8)
		end

		if slot2 ~= "" then
			traceLog("tick有下列：" .. #slot0 .. HtmlUtil.createOrangeTxt(slot2))
		end
	end
end

TickManager.getUTCTime = function (slot0, slot1)
	slot2 = os.date("!*t", slot1)

	if math.floor(tonumber(os.date("%z", 0)) / 100) >= 0 then
		slot2.isdst = false
	elseif slot3 ~= -11 then
		slot2.isdst = true
	end

	return os.time(slot2)
end

TickManager.getChinaTime = function (slot0, slot1)
	return slot0:getUTCTime(slot1) + 28800
end

tickMgr = TickManager.new()

return tickMgr
