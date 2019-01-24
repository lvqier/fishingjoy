TimerBase = class("TimerBase")

TimerBase.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.callback = slot1
	slot0.delayInMs = slot2
	slot0.repeatCount = slot3 or 0
	slot0.tickCate = slot5 or 0
	slot0.curTickCount = 0
	slot0.traceName = slot4
	slot0.autoDispose = true
	slot0.elapsedTime = 0
	slot0.tickIntervalInMs = 0
	slot0.tickIntervalRealInMs = 0

	ClassUtil.extends(slot0, TickBase)
end

TimerBase.doTick = function (slot0, slot1, slot2)
	slot0.curTickCount = slot0.curTickCount + 1
	slot4 = slot0.repeatCount >= 0 and slot0.curTickCount >= slot0.repeatCount + 1 and slot0.autoDispose

	if slot3 then
		slot0:stop()
	end

	slot0.callback(slot1, slot2)

	if slot4 then
		slot0:destroy()
	end
end

TimerBase.tick = function (slot0, slot1, slot2)
	slot0.elapsedTime = slot0.elapsedTime + slot1
	slot0.tickIntervalInMs = slot0.tickIntervalInMs + slot1
	slot0.tickIntervalRealInMs = slot0.tickIntervalRealInMs + slot2

	if slot0.delayInMs < slot0.elapsedTime then
		slot0.elapsedTime = slot0.elapsedTime - slot0.delayInMs

		slot0:doTick(slot0.tickIntervalInMs, slot0.tickIntervalRealInMs)

		slot0.tickIntervalInMs = 0
		slot0.tickIntervalRealInMs = 0

		return true
	end

	return false
end

TimerBase.changeTraceName = function (slot0, slot1)
	slot0.traceName = slot1

	return slot0
end

TimerBase.reset = function (slot0)
	slot0.elapsedTime = 0
	slot0.curTickCount = 0
	slot0.tickIntervalInMs = 0
	slot0.tickIntervalRealInMs = 0

	slot0:stop()
end

TimerBase.setAutoDispose = function (slot0, slot1)
	slot0.autoDispose = slot1
end

TimerBase.stop = function (slot0)
	slot0:stopTick()
end

TimerBase.getIsRunning = function (slot0)
	return slot0:getIsTicking()
end

TimerBase.start = function (slot0)
	slot0:startTick()
end

TimerBase.destroy = function (slot0)
	TickBase.destroy(slot0)

	slot0.callback = nil
end

return TimerBase
