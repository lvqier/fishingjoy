TickTimer = class("TickTimer")

TickTimer.ctor = function (slot0)
	slot0.timerScaleFactor = 1
	slot0.elapsedTime = 0
	slot0.curFrameTimeReal = 0
	slot0.curFrameTime = 0
	slot0.distanceTime = 0
end

TickTimer.isNextTime = function (slot0, slot1)
	slot0.elapsedTime = slot0.elapsedTime + slot1.frameTime * slot0.timerScaleFactor
	slot0.curFrameTimeReal = slot0.curFrameTimeReal + slot1.frameTime
	slot0.curFrameTime = slot0.curFrameTime + slot1.frameTime * slot0.timerScaleFactor

	if slot0.distanceTime <= slot0.elapsedTime and slot0.distanceTime ~= 0 then
		slot0.elapsedTime = slot0.elapsedTime % slot0.distanceTime

		return true
	end

	return false
end

TickTimer.reset = function (slot0)
	slot0.timerScaleFactor = 1
	slot0.elapsedTime = 0
	slot0.curFrameTimeReal = 0
	slot0.curFrameTime = 0
	slot0.distanceTime = 0
end

TickTimer.resetSomeData = function (slot0)
	slot0.curFrameTimeReal = 0
	slot0.curFrameTime = 0
end

return TickTimer
