YydbResultCcsItem = class("YydbResultCcsItem")

YydbResultCcsItem.onCreationComplete = function (slot0)
	slot0._pos = {
		[0] = cc.p(75, -6.5),
		cc.p(75, 93.5),
		cc.p(75, 193.5),
		cc.p(75, 293.5)
	}
	slot0._offset = {
		[0] = -1,
		0,
		1,
		2
	}
	slot0._height = 100
	slot0._rollTimes = 0
	slot0._totalTimes = 30
	slot0._basicTotalTimes = 220

	createSetterGetter(slot0, "idx", nil)
	createSetterGetter(slot0, "num", 0, false, false, false, false, handler(slot0, slot0.onNumChanged))
	slot0.model.yydbWinningNumberChangedSignal:add(slot0.onNumber, slot0)
end

YydbResultCcsItem.onNumber = function (slot0)
	if slot0._idx then
		if slot0.model:getYydbWinningNumber() > 0 then
			slot0:showNumEffect(math.floor(math.floor(slot1 % 10^slot0._idx) / 10^(slot0._idx - 1)))
		else
			slot0:reset(0)
		end
	end
end

YydbResultCcsItem.getImagePathByNum = function (slot0, slot1)
	slot2 = nil

	return (slot0._isRolling and "plist_yydb_result_action_num_" .. tostring(slot1) .. ".png") or "plist_yydb_result_num_" .. tostring(slot1) .. ".png"
end

YydbResultCcsItem.onNumChanged = function (slot0)
	for slot4 = 0, 3, 1 do
		slot0["spNum" .. slot4].setSpriteFrame(slot5, slot0:getImagePathByNum(math.floor((slot0._num + slot0._offset[slot4] + 10) % 10)))
		slot0["spNum" .. slot4]:setPosition(slot0._pos[slot4])
	end
end

YydbResultCcsItem.reset = function (slot0, slot1)
	slot0._isRolling = false

	for slot5 = 0, 3, 1 do
		TweenLite.killTweensOf(slot0["spNum" .. slot5])
	end

	if slot0._tlline then
		slot0._tlline:kill()

		slot0._tlline = nil
	end

	slot0._rollTimes = 0
	slot0._totalTimes = slot0._basicTotalTimes - 30 * slot0._idx

	slot0:setNum(slot1, true)
	TweenLite.killTweensOf(slot0.spNum)
	slot0.spNum:setVisible(false)
	slot0.spNum:setScale(1)
	slot0.spNum:setOpacity(255)
end

YydbResultCcsItem.rollItem = function (slot0, slot1)
	function slot2()
		slot0._rollTimes = slot0._rollTimes + 1

		slot0:setNum(math.floor((slot0._num + 1) % 10))

		if slot0.setNum._rollTimes < slot0._totalTimes then
			slot0:rollItem(slot0)
		else
			slot0.spNum:setVisible(true)
			TweenLite.to(slot0.spNum, 0.2, {
				autoAlpha = 0,
				scale = 1.5,
				onComplete = function ()
					if slot0._idx == 1 then
						slot0.model._yydbEffectEndSignal:emit()
					end
				end
			})
			audioMgr:playGameEffect("effect/BT_GET.mp3")
		end
	end

	slot3 = 0.01
	slot4 = Linear.easeNone

	if math.floor(slot0._totalTimes / 2) - math.floor(math.abs(slot0._totalTimes / 2 - slot0._rollTimes)) <= 1 then
		slot3 = 0.18 - 0.02 * slot5
		slot4 = (slot0._totalTimes / 2 - slot0._rollTimes <= 0 or Sine.easeIn) and Back.easeOut
		slot0._isRolling = false
	else
		slot0._isRolling = true
	end

	slot0._tlline = TimelineLite.new({
		onComplete = slot2
	})

	for slot9 = 0, 3, 1 do
		slot0._tlline:insert(TweenLite.to(slot0["spNum" .. slot9], slot3, {
			delay = 0,
			y = tostring(-slot0._height),
			ease = slot4
		}))
	end

	slot0._soundCount = slot0._soundCount or 0

	if slot0._idx == 1 then
		if slot0._soundCount == 0 then
			audioMgr:playGameEffect("effect/TURN.mp3")
		end

		slot0._soundCount = slot0._soundCount + 1

		if slot0._soundCount >= 5 then
			slot0._soundCount = 0
		end
	end
end

YydbResultCcsItem.showNumEffect = function (slot0, slot1)
	slot0:reset(0)

	slot0._totalTimes = slot0._totalTimes + slot1

	slot0.spNum:setSpriteFrame(slot0:getImagePathByNum(slot1))
	slot0:rollItem(slot1)
end

YydbResultCcsItem.destroy = function (slot0)
	slot0.model.yydbWinningNumberChangedSignal:add(slot0.onNumber, slot0)

	for slot4 = 0, 3, 1 do
		TweenLite.killTweensOf(slot0["spNum" .. slot4])
	end

	if slot0._tlline then
		slot0._tlline:kill()

		slot0._tlline = nil
	end
end

return
