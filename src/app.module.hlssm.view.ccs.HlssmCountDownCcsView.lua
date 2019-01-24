HlssmCountDownCcsView = class("HlssmCountDownCcsView")

HlssmCountDownCcsView.onCreationComplete = function (slot0)
	slot0.countDownTime = tickMgr:getServerTime()
	slot0._effectTimer = TimerBase.new(handler(slot0, slot0.tick), 10, -1, "HlssmCountDownCcsView:_effectTimer")
	slot0._effectTimer.autoDispose = false

	slot0._effectTimer:reset()
end

HlssmCountDownCcsView.resetTimer = function (slot0)
	slot0._effectTimer:reset()
end

HlssmCountDownCcsView.tick = function (slot0)
	if math.ceil(slot0.countDownTime - tickMgr:getServerTime()) < 0 then
		slot0._effectTimer:reset()
	end

	slot0.clock.countdown_tf:setHtmlText(HtmlUtil.createArtNum((slot1 >= 0 and math.abs(slot1)) or 0, "#hlssm_countdown_%s.png"))

	slot0.last = slot0.last or (slot1 >= 0 and math.abs(slot1)) or 0

	if slot0.last ~= slot1 then
		slot0.last = slot1

		if slot0.model:getGameStatus() == HLSSM_GAME_SCENE_BET then
			if slot1 <= 5 then
				slot0.controller:playGameEffect("TIME_WARIMG.mp3")
				slot0.clock:runAction(cc.Sequence:create(cc.RotateTo:create(0.05, -15), cc.RotateTo:create(0.1, 15), cc.RotateTo:create(0.05, 0)))
			end

			if slot1 == 5 then
				slot0:addTitle(2)
			elseif slot1 == 1 then
				slot0:addTitle(3)
				slot0.controller:playGameEffect(Hlssm_sound_EndBet)
			end
		end
	end
end

HlssmCountDownCcsView.addTitle = function (slot0, slot1)
	slot2 = slot0.controller:createSpineWithEvent("hlssm_xiazhutip", __emptyFunction)

	slot2:setSkin(tostring(slot1))
	slot2:setPosition(cc.p(0, 0))
	slot0.tip:addChild(slot2)
end

HlssmCountDownCcsView.beginCountDown = function (slot0, slot1)
	slot0.countDownTime = tickMgr:getServerTime() + slot1

	slot0._effectTimer:start()
end

return
