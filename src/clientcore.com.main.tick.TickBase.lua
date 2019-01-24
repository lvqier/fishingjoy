TickBase = class("TickBase")

TickBase.ctor = function (slot0, slot1)
	slot0.isTicking = false
	slot0.tickCate = slot1 or 0
	slot0._fps = nil
end

TickBase.startTick = function (slot0, slot1, slot2)
	if (not slot1 or slot1 == 0) and (not slot2 or slot2 == 0) then
		slot0._fps = 60
	else
		slot0._fps = slot1 or math.round(1000 / slot2)
	end

	if slot0.isTicking then
		slot0:stopTick()
	end

	tickMgr:addCustomTick(slot0, slot1, slot2, slot0.tickCate)

	slot0.isTicking = true
end

TickBase.stopTick = function (slot0)
	if slot0.isTicking then
		tickMgr:removeTick(slot0)

		slot0.isTicking = false
	end
end

TickBase.getIsTicking = function (slot0)
	return slot0.isTicking
end

TickBase.tick = function (slot0, slot1, slot2)
	print("you should implement tick function in className:" .. slot0.__cname .. "  " .. tostring(slot0))
end

TickBase.destroy = function (slot0)
	if slot0.stopTick then
		slot0:stopTick()
	end
end

return TickBase
