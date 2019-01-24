SerialNoticeCcsPane = class("SerialNoticeCcsPane")

SerialNoticeCcsPane.onCreationComplete = function (slot0)
	slot0._msg = {}
	slot0._msgGap = 100
	slot0._curShowingTfs = {}

	slot0.contentClipLayer:setClippingEnabled(true)
	slot0.contentClipLayer:setLocalZOrder(102)

	slot0._readyToAdd = false
	slot0._showCounter = 0
	slot4 = sp.SkeletonAnimation:createWithJsonFile(Serial.Serial_Root .. "notice/jxlw_firetioskuangeffecta.json", Serial.Serial_Root .. "notice/jxlw_firetioskuangeffecta.atlas")

	slot4:setPosition(cc.p(slot2, slot3))
	slot4:setVisible(true)
	slot4:setCascadeOpacityEnabled(true)
	slot4:setAnimation(0, "end", false)
	slot0:addChild(slot4, 103)

	slot0.fire = slot4
	slot5 = sp.SkeletonAnimation:createWithJsonFile(Serial.Serial_Root .. "notice/jxlw_firetioskuangeffectb.json", Serial.Serial_Root .. "notice/jxlw_firetioskuangeffectb.atlas")

	slot5:setPosition(cc.p(slot2, slot3))
	slot5:setVisible(true)
	slot5:setCascadeOpacityEnabled(true)
	slot5:setAnimation(0, "end", false)
	slot0:addChild(slot5, 101)

	slot0.bg = slot5
	slot6 = cc.ParticleSystemQuad:create(Serial.Serial_Root .. "notice/serial_firetipskuanglizi.plist")

	slot6:setPosition(cc.p(slot2, slot0:getContentSize().height / 2 - 20))
	slot6:setCascadeOpacityEnabled(true)
	slot6:stopSystem()
	slot0:addChild(slot6, 104)

	slot0.effect = slot6

	slot0:registerScriptHandler(handler(slot0, slot0.onEnterExit))
	slot0:setCascadeOpacityEnabled(true)
	slot0:setVisible(false)
end

SerialNoticeCcsPane.onEnterExit = function (slot0, slot1)
	if slot1 == "enter" then
		slot0:reset()
		slot0:scheduleUpdateWithPriorityLua(function (slot0)
			slot0:update(slot0)
		end, 1)
	elseif slot1 == "exit" then
		slot0:unscheduleUpdate()
	end
end

SerialNoticeCcsPane.reset = function (slot0)
	slot0:setVisible(false)
	slot0:stopAllActions()

	slot0._msg = {}
	slot0._state = "hided"
	slot0._readyToAdd = false
	slot0._showCounter = 0

	slot0.contentClipLayer:removeAllChildren()
	slot0.bg:setAnimation(0, "end", false)
	slot0.fire:setAnimation(0, "end", false)
end

SerialNoticeCcsPane.addMessage = function (slot0, slot1)
	slot0._msg[#slot0._msg + 1] = slot1
end

SerialNoticeCcsPane.getMessageNumber = function (slot0)
	return #slot0._msg
end

SerialNoticeCcsPane.update = function (slot0, slot1)
	if slot0._state == "hided" and #slot0._msg > 0 then
		slot0:start()
	end

	if slot0._state == "showing" then
		if #slot0._msg > 0 and slot0._readyToAdd then
			slot0:showText()
		end

		if #slot0._msg == 0 and slot0._showCounter == 0 then
			slot0:hide()
		end
	end
end

SerialNoticeCcsPane.start = function (slot0)
	if slot0._state == "hided" then
		slot0._state = "showing"

		slot0:setVisible(true)
		slot0:setOpacity(255)
		slot0.bg:setAnimation(0, "start", false)
		slot0.bg:addAnimation(0, "idle", true)
		slot0.fire:setAnimation(0, "start", false)
		slot0.fire:addAnimation(0, "idle", true)
		slot0.effect:resetSystem()
		slot0:runAction(cc.Sequence:create(cc.DelayTime:create(1.5), cc.CallFunc:create(function ()
			slot0._readyToAdd = true
		end)))
	end
end

SerialNoticeCcsPane.hide = function (slot0)
	slot0._state = "hiding"

	slot0.bg:setAnimation(0, "end", false)
	slot0.fire:setAnimation(0, "end", false)
	slot0:runAction(cc.Sequence:create(cc.FadeTo:create(0.5, 0), cc.CallFunc:create(function ()
		slot0._state = "hided"
		slot0._readyToAdd = false

		slot0:setVisible(false)
	end)))
	slot0.effect:stopSystem()
end

SerialNoticeCcsPane.check = function (slot0)
	if #slot0._msg > 0 then
		start()
	else
		stop()
	end
end

SerialNoticeCcsPane.stop = function (slot0)
	slot0._state = "hided"

	slot0:setVisible(false)
end

SerialNoticeCcsPane.showText = function (slot0)
	slot2 = table.remove(slot0._msg, 1).lJackpot
	slot3 = ""
	slot5 = TextField.new(CCSKitchen.defaultFontFamily, 30, nil, 20000, nil, TextField.H_LEFT)

	slot5:setHtmlText((table.remove(slot0._msg, 1).lWinScore > 0 and "" .. HtmlUtil.createColorTxt("发大财啦！ ", "#e9d265") .. HtmlUtil.createColorTxt(slot1.szNickName .. " ", "#ef5cab") .. HtmlUtil.createColorTxt("在连环夺宝 ", "#e9d265") .. HtmlUtil.createColorTxt(slot1.szServerName .. " ", "#ef5cab") .. HtmlUtil.createColorTxt("中一举赢得", "#e9d265") .. HtmlUtil.createArtNumDot(slot1.lWinScore, "#serial_notice_%s.png", nil, nil, nil, -5) .. HtmlUtil.createImg(Serial.Serial_Root .. "notice/image_coin.png", nil, nil, nil, 2, nil, nil, 15, nil) .. HtmlUtil.createColorTxt("!大家快来围观啊!", "#e9d265")) or "" .. HtmlUtil.createColorTxt("天降横财！", "#e9d265") .. HtmlUtil.createColorTxt(slot1.szNickName .. " ", "#ef5cab") .. HtmlUtil.createColorTxt("在连环夺宝 ", "#e9d265") .. HtmlUtil.createColorTxt(slot1.szServerName .. " ", "#ef5cab") .. HtmlUtil.createColorTxt("中赢得累积奖", "#e9d265") .. HtmlUtil.createArtNumDot(slot1.lJackpot, "#serial_notice_%s.png", nil, nil, nil, -5) .. HtmlUtil.createImg(Serial.Serial_Root .. "notice/image_coin.png", nil, nil, nil, 2, nil, nil, 15, nil) .. HtmlUtil.createColorTxt("，一举暴富！", "#e9d265"))
	slot5:setAnchorPoint(0.5, 0.5)
	slot5:setPosition(cc.p(slot8, 23))
	slot0.contentClipLayer:addChild(slot5)

	slot0._readyToAdd = false
	slot0._showCounter = slot0._showCounter + 1

	slot5:runAction(cc.Sequence:create(cc.MoveTo:create(slot11, cc.p(slot0.contentClipLayer:getContentSize().width - (slot5:getTextWidth() + slot0._msgGap), 23)), cc.CallFunc:create(function ()
		slot0._readyToAdd = true
	end), cc.MoveTo:create(slot10, cc.p(-slot5.getTextWidth(), 23)), cc.CallFunc:create(function ()
		slot0._showCounter = slot0._showCounter - 1
	end), cc.RemoveSelf:create()))
end

return
