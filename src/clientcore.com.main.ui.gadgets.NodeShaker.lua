NodeShaker = class("NodeShaker")

NodeShaker.ctor = function (slot0, slot1, slot2, slot3)
	slot0._target = slot1

	if not slot2 or not slot3 then
		slot2, slot3 = slot1:getPosition()
	end

	slot0._initX = slot2
	slot0._initY = slot3
	slot0._shakeTime = 0
	slot0._fps = 20
	slot0._frameTimeMs = 0
	slot0._shakeDelta = 5
	slot0._shakeDurationMs = 0
	slot0._elapsedMs = 0

	ClassUtil.extends(slot0, TickBase)
end

NodeShaker.tick = function (slot0, slot1, slot2)
	slot0._elapsedMs = slot0._elapsedMs + slot1

	if slot0._shakeDurationMs <= slot0._elapsedMs then
		slot0:stopShake()
	else
		slot0._frameTimeMs = slot0._frameTimeMs + slot1

		if slot0._frameTimeMs > 1000 / slot0._fps then
			slot0._frameTimeMs = 0

			slot0._target:setPosition(slot0._initX + slot0._shakeDelta * (-1 + (2 * math.random(100)) / 100), slot0._initY + slot0._shakeDelta * (-1 + (2 * math.random(100)) / 100))
		end
	end
end

NodeShaker.startShake = function (slot0, slot1)
	slot0:stopShake()

	slot0._shakeDurationMs = slot1
	slot0._elapsedMs = 0

	slot0:startTick()
end

NodeShaker.stopShake = function (slot0)
	slot0._elapsedMs = 0

	slot0._target:setPosition(slot0._initX, slot0._initY)
	slot0:stopTick()
end

NodeShaker.destroy = function (slot0)
	slot0:stopShake()
	TickBase.destroy(slot0)
end

return
