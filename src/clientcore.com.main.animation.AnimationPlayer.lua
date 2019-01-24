requireClientCoreMain("res.ResourceManager")
requireClientCoreMain("utils.ClassUtil")
requireClientCoreMain("tick.TickManager")

AnimationPlayer = class("AnimationPlayer")
slot0 = 12

AnimationPlayer.new = function (slot0, slot1, slot2, slot3, slot4)
	ClassUtil.extends(slot0 or display.newSprite(), AnimationPlayer, true, slot1, slot2, slot3, slot4)

	return slot0 or display.newSprite()
end

AnimationPlayer.ctor = function (slot0, slot1, slot2, slot3, slot4)
	ClassUtil.extends(slot0, TickBase)

	slot0.repeatFrame = 1
	slot0.curFrame = 1
	slot0.isReverse = false
	slot0.autoDestroy = true
	slot0.startDelayMs = 0
	slot0.repeatDelayMs = 0
	slot0.totalFrame = 0
	slot0.spriteFrames = nil
	slot0._startDelayTimer = nil
	slot0._repeatDelayTimer = nil
	slot0.autoRemoveFromParent = true

	slot0:setSpriteFrames(slot1)

	slot0.fps = slot2 or slot0
	slot0.repeatCount = slot3 or 0
	slot0.finishCallback = slot4
	slot0.animationFramesPlist = nil
	slot0.frameCallbacks = {}

	slot0:retain()
end

AnimationPlayer.gotoAndPlay = function (slot0, slot1)
	if slot0.curFrame ~= slot1 then
		slot0.curFrame = slot1

		slot0:tick(0, 0)
	end

	slot0:playAnimation()
end

AnimationPlayer.setSpriteFrames = function (slot0, slot1)
	slot0.spriteFrames = slot1

	if slot0.spriteFrames then
		slot0.totalFrame = #slot0.spriteFrames
	else
		slot0.totalFrame = 0
	end
end

AnimationPlayer.gotoAndStop = function (slot0, slot1)
	if slot0.curFrame ~= slot1 then
		slot0.curFrame = slot1

		slot0:tick(0, 0)
	end

	slot0:stopAnimation()
end

AnimationPlayer.tick = function (slot0, slot1, slot2)
	slot0:setSpriteFrame(slot0.spriteFrames[slot0.curFrame])

	if slot0.frameCallbacks[slot0.curFrame] then
		slot3()
	end

	if (not slot0.isReverse and slot0.curFrame == slot0.totalFrame) or (slot0.isReverse and slot0.curFrame == 1) then
		if slot0.repeatCount ~= 0 then
			if slot0.isReverse then
				if slot0.repeatFrame ~= 1 then
					slot0.curFrame = slot0.repeatFrame
				else
					slot0.curFrame = slot0.totalFrame
				end
			else
				slot0.curFrame = slot0.repeatFrame
			end

			if slot0.repeatCount > 0 then
				slot0.repeatCount = slot0.repeatCount - 1
			end

			if slot0.repeatDelayMs and slot0.repeatDelayMs > 0 then
				slot0:stopTick()

				if not slot0._repeatDelayTimer then
					slot0._repeatDelayTimer = TimerBase.new(handler(slot0, slot0.doPlayAnimation), slot0.repeatDelayMs, nil, "AnimationPlayer:_repeatDelayTimer")

					slot0._repeatDelayTimer:setAutoDispose(true)
				end

				slot0._repeatDelayTimer:reset()
				slot0._repeatDelayTimer:start()
			end
		else
			slot0:stopTick()

			if slot0.finishCallback ~= nil then
				slot0.finishCallback()
			end

			if slot0.autoRemoveFromParent then
				slot0:removeFromParent()
			end

			if slot0.autoDestroy then
				slot0:destroy()
			end
		end
	elseif slot0.isReverse then
		slot0.curFrame = slot0.curFrame - 1
	else
		slot0.curFrame = slot0.curFrame + 1
	end
end

AnimationPlayer.setAnimationPlaying = function (slot0, slot1)
	if slot1 then
		slot0:playAnimation()
	else
		slot0:stopAnimation()
	end
end

AnimationPlayer.doPlayAnimation = function (slot0)
	slot0._startDelayTimer = nil
	slot0._repeatDelayTimer = nil

	slot0:startTick(slot0.fps)
end

AnimationPlayer.playAnimation = function (slot0)
	if slot0._repeatDelayTimer then
		slot0._repeatDelayTimer:start()
	elseif slot0.curFrame == 1 and slot0.startDelayMs and slot0.startDelayMs > 0 then
		if not slot0._startDelayTimer then
			slot0._startDelayTimer = TimerBase.new(handler(slot0, slot0.doPlayAnimation), slot0.startDelayMs, nil, "AnimationPlayer:_startDelayTimer")

			slot0._startDelayTimer:setAutoDispose(true)
		end

		slot0._startDelayTimer:start()
	else
		slot0:doPlayAnimation()
	end
end

AnimationPlayer.stopAnimation = function (slot0)
	if slot0._repeatDelayTimer and slot0._repeatDelayTimer:getIsRunning() then
		slot0._repeatDelayTimer:stop()
	elseif slot0._startDelayTimer and slot0._startDelayTimer:getIsRunning() then
		slot0._startDelayTimer:stop()
	else
		slot0:stopTick()
	end
end

AnimationPlayer.addFrameCallback = function (slot0, slot1, slot2)
	slot0.frameCallbacks[MathUtil.getValueBetween(slot1, 1, slot0.totalFrame)] = slot2
end

AnimationPlayer.destroy = function (slot0)
	TickBase.destroy(slot0)

	if slot0._repeatDelayTimer then
		slot0._repeatDelayTimer:destroy()

		slot0._repeatDelayTimer = nil
	end

	if slot0._startDelayTimer then
		slot0._startDelayTimer:destroy()

		slot0._startDelayTimer = nil
	end

	if slot0.animationFramesPlist then
		resMgr:unloadTextureAtlas(slot0.animationFramesPlist)

		slot0.animationFramesPlist = nil
	end

	slot0.spriteFrames = nil
	slot0.finishCallback = nil
	slot0.frameCallbacks = nil

	slot0:removeFromParent(true)
	slot0:release()
end

return
