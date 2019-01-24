CCSTweenProgressBar = class("CCSTweenProgressBar")

CCSTweenProgressBar.onCreationComplete = function (slot0)
	slot0._progressTweenObj = {
		value = 0
	}
	slot0._isReverse = false

	createSetterGetterHandler(slot0, "updateHandler")
	slot0:reset()
end

CCSTweenProgressBar.reset = function (slot0, slot1)
	slot1 = slot1 or 0

	if slot0._tl then
		slot0._tl:kill()

		slot0._tl = nil
	end

	TweenLite.killTweensOf(slot0._progressTweenObj)

	slot0._progressTweenObj.value = slot1

	slot0:applyPercent(slot1)
end

CCSTweenProgressBar.setTweenPercent = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0._isReverse = slot7
	slot3 = slot3 or 0
	slot2 = slot2 or 0.5

	TweenLite.killTweensOf(slot0._progressTweenObj)

	slot0._progressTweenObj.value = slot0:getCurPercent()
	slot1 = MathUtil.getValueBetween(slot1, 0, 100)
	slot8 = handler(slot0, slot0.updateView)

	if slot0._tl then
		slot0._tl:kill()

		slot0._tl = nil
	end

	if slot3 <= 0 then
		TweenLite.to(slot0._progressTweenObj, slot2, {
			value = slot1,
			onUpdate = slot8,
			delay = slot4,
			onStart = slot5,
			onComplete = slot6,
			ease = Linear.easeNone
		})
	else
		slot9 = handler(slot0, slot0.reset)
		slot0._tl = TimelineLite.new({
			onComplete = slot6,
			onUpdate = slot8,
			delay = slot4,
			onStart = slot5
		})

		for slot13 = 1, slot3, 1 do
			slot0._tl:append(TweenLite.to(slot0._progressTweenObj, slot2 / (slot3 + 1), {
				value = 100,
				onComplete = slot9,
				ease = Linear.easeNone
			}))
		end

		slot0._tl:append(TweenLite.to(slot0._progressTweenObj, slot2 / (slot3 + 1), {
			value = slot1,
			ease = Linear.easeNone
		}))
	end

	if slot2 == 0 then
		applyFunction(slot5)
	end
end

CCSTweenProgressBar.getCurPercent = function (slot0)
	return slot0._progressTweenObj.value
end

CCSTweenProgressBar.applyPercent = function (slot0, slot1)
	if slot0._isReverse then
		slot1 = 100 - slot1
	end

	if slot0.setPercent then
		slot0:setPercent(slot1)
	elseif slot0.setPercentage then
		slot0:setPercentage(slot1)
	end
end

CCSTweenProgressBar.updateView = function (slot0)
	slot0:applyPercent(slot0._progressTweenObj.value)
	applyFunction(slot0._updateHandler)
end

CCSTweenProgressBar.destroy = function (slot0)
	if slot0._tl then
		slot0._tl:kill()

		slot0._tl = nil
	end

	TweenLite.killTweensOf(slot0._progressTweenObj)

	slot0._progressTweenObj = nil

	slot0:removeFromParent()
end

return
