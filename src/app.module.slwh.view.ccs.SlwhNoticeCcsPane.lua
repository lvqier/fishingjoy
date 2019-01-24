slot2 = "SlwhNoticeCcsPane"
SlwhNoticeCcsPane = class(slot1)

SlwhNoticeCcsPane.onCreationComplete = function (slot0)
	slot0._msg = {}
	slot0._msgGap = 100
	slot0._curShowingTfs = {}
	slot4 = true

	slot0.contentClipLayer.setClippingEnabled(slot2, slot0.contentClipLayer)

	slot4 = 102

	slot0.contentClipLayer.setLocalZOrder(slot2, slot0.contentClipLayer)

	slot0._readyToAdd = false
	slot0._showCounter = 0
	slot3 = slot0
	slot8 = Tree.root .. "notice/jxlw_firetioskuangeffecta.atlas"
	slot4 = sp.SkeletonAnimation.createWithJsonFile(slot5, sp.SkeletonAnimation, Tree.root .. "notice/jxlw_firetioskuangeffecta.json")
	slot7 = slot4
	slot11 = slot0.getContentSize(slot2).height / 2

	slot4.setPosition(sp.SkeletonAnimation, cc.p("notice/jxlw_firetioskuangeffecta.atlas", slot2))

	slot8 = true

	slot4.setVisible(sp.SkeletonAnimation, slot4)

	slot8 = true

	slot4.setCascadeOpacityEnabled(sp.SkeletonAnimation, slot4)

	slot10 = false

	slot4.setAnimation(sp.SkeletonAnimation, slot4, 0, "end")

	slot9 = 103

	slot0.addChild(sp.SkeletonAnimation, slot0, slot4)

	slot0.fire = slot4
	slot9 = Tree.root .. "notice/jxlw_firetioskuangeffectb.atlas"
	slot5 = sp.SkeletonAnimation.createWithJsonFile(sp.SkeletonAnimation, sp.SkeletonAnimation, Tree.root .. "notice/jxlw_firetioskuangeffectb.json")
	slot8 = slot5
	slot12 = slot0.getContentSize(slot2).height / 2

	slot5.setPosition(sp.SkeletonAnimation, cc.p("notice/jxlw_firetioskuangeffectb.atlas", slot2))

	slot9 = true

	slot5.setVisible(sp.SkeletonAnimation, slot5)

	slot9 = true

	slot5.setCascadeOpacityEnabled(sp.SkeletonAnimation, slot5)
	slot5.setAnimation(sp.SkeletonAnimation, slot5, 0, "end")

	slot10 = 101

	slot0.addChild(sp.SkeletonAnimation, slot0, slot5)

	slot0.bg = slot5
	slot9 = Tree.root .. "notice/serial_firetipskuanglizi.plist"
	slot6 = cc.ParticleSystemQuad.create(sp.SkeletonAnimation, cc.ParticleSystemQuad)
	slot9 = slot6
	slot13 = slot0.getContentSize(slot2).height / 2 - 20

	slot6.setPosition(cc.ParticleSystemQuad, cc.p(false, slot2))

	slot10 = true

	slot6.setCascadeOpacityEnabled(cc.ParticleSystemQuad, slot6)

	slot9 = slot6

	slot6.stopSystem(cc.ParticleSystemQuad)
	slot0.addChild(cc.ParticleSystemQuad, slot0, slot6)

	slot0.effect = slot6
	slot9 = slot0
	slot13 = slot0.onEnterExit

	slot0.registerScriptHandler(cc.ParticleSystemQuad, handler(104, slot0))

	slot10 = true

	slot0.setCascadeOpacityEnabled(cc.ParticleSystemQuad, slot0)

	slot10 = false

	slot0.setVisible(cc.ParticleSystemQuad, slot0)
end

SlwhNoticeCcsPane.onEnterExit = function (slot0, slot1)
	if slot1 == "enter" then
		slot4 = slot0

		slot0.reset(slot3)

		slot6 = 1

		slot0.scheduleUpdateWithPriorityLua(slot3, slot0, function (slot0)
			slot4 = slot0

			slot0.update(slot2, slot0)
		end)
	elseif slot1 == "exit" then
		slot4 = slot0

		slot0.unscheduleUpdate(slot3)
	end
end

SlwhNoticeCcsPane.reset = function (slot0)
	slot4 = false

	slot0.setVisible(slot2, slot0)

	slot3 = slot0

	slot0.stopAllActions(slot2)

	slot0._msg = {}
	slot0._state = "hided"
	slot0._readyToAdd = false
	slot0._showCounter = 0
	slot3 = slot0.contentClipLayer

	slot0.contentClipLayer.removeAllChildren(slot2)

	slot6 = false

	slot0.bg.setAnimation(slot2, slot0.bg, 0, "end")

	slot6 = false

	slot0.fire.setAnimation(slot2, slot0.fire, 0, "end")
end

SlwhNoticeCcsPane.addMessage = function (slot0, slot1)
	slot0._msg[#slot0._msg + 1] = slot1
end

SlwhNoticeCcsPane.getMessageNumber = function (slot0)
	return #slot0._msg
end

SlwhNoticeCcsPane.update = function (slot0, slot1)
	if slot0._state == "hided" and #slot0._msg > 0 then
		slot4 = slot0

		slot0.start(slot3)
	end

	if slot0._state == "showing" then
		if #slot0._msg > 0 and slot0._readyToAdd then
			slot4 = slot0

			slot0.showText(slot3)
		end

		if #slot0._msg == 0 and slot0._showCounter == 0 then
			slot4 = slot0

			slot0.hide(slot3)
		end
	end
end

SlwhNoticeCcsPane.start = function (slot0)
	if slot0._state == "hided" then
		slot0._state = "showing"
		slot4 = true

		slot0.setVisible(slot2, slot0)

		slot4 = 255

		slot0.setOpacity(slot2, slot0)

		slot6 = false

		slot0.bg.setAnimation(slot2, slot0.bg, 0, "start")

		slot6 = true

		slot0.bg.addAnimation(slot2, slot0.bg, 0, "idle")

		slot6 = false

		slot0.fire.setAnimation(slot2, slot0.fire, 0, "start")

		slot6 = true

		slot0.fire.addAnimation(slot2, slot0.fire, 0, "idle")

		slot3 = slot0.effect

		slot0.effect.resetSystem(slot2)

		slot3 = slot0
		slot10 = 1.5
		slot7 = cc.DelayTime.create(slot8, cc.DelayTime)

		function slot11()
			slot0._readyToAdd = true
		end

		slot0.runAction(slot2, cc.Sequence.create("idle", cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
	end
end

SlwhNoticeCcsPane.hide = function (slot0)
	slot0._state = "hiding"
	slot6 = false

	slot0.bg.setAnimation(slot2, slot0.bg, 0, "end")

	slot6 = false

	slot0.fire.setAnimation(slot2, slot0.fire, 0, "end")

	slot3 = slot0
	slot11 = 0
	slot7 = cc.FadeTo.create(slot8, cc.FadeTo, 0.5)

	function slot11()
		slot0._state = "hided"
		slot0._readyToAdd = false
		slot3 = false

		slot0.setVisible(false, slot0)
	end

	slot0.runAction(slot2, cc.Sequence.create("end", cc.Sequence, cc.CallFunc.create(cc.FadeTo, cc.CallFunc)))

	slot3 = slot0.effect

	slot0.effect.stopSystem(slot2)
end

SlwhNoticeCcsPane.check = function (slot0)
	if #slot0._msg > 0 then
		start()
	else
		stop()
	end
end

SlwhNoticeCcsPane.stop = function (slot0)
	slot0._state = "hided"
	slot4 = false

	slot0.setVisible(slot2, slot0)
end

SlwhNoticeCcsPane.showText = function (slot0)
	slot4 = 1
	slot2 = table.remove(slot2, slot0._msg).lJackpot
	slot3 = ""
	slot4 = ""

	if table.remove(slot2, slot0._msg).lWinScore > 0 then
		slot9 = "#e9d265"
		slot9 = "#ef5cab"
		slot9 = "#e9d265"
		slot9 = "#ef5cab"
		slot9 = "#e9d265"
		slot13 = -5
		slot16 = nil
		slot9 = "#e9d265"
		slot4 = slot4 .. HtmlUtil.createColorTxt(slot7, "发大财啦！ ") .. HtmlUtil.createColorTxt(slot7, slot1.szNickName .. " ") .. HtmlUtil.createColorTxt(slot7, "在连环夺宝 ") .. HtmlUtil.createColorTxt(slot7, slot1.szServerName .. " ") .. HtmlUtil.createColorTxt(slot7, "中一举赢得") .. HtmlUtil.createArtNumDot(slot7, slot1.lWinScore, "#serial_notice_%s.png", nil, nil, nil) .. HtmlUtil.createImg(slot7, Tree.root .. "notice/image_coin.png", nil, nil, nil, 2, nil, nil, 15) .. HtmlUtil.createColorTxt(slot7, "!大家快来围观啊!")
	else
		slot9 = "#e9d265"
		slot9 = "#ef5cab"
		slot9 = "#e9d265"
		slot9 = "#ef5cab"
		slot9 = "#e9d265"
		slot13 = -5
		slot16 = nil
		slot9 = "#e9d265"
		slot4 = slot4 .. HtmlUtil.createColorTxt(slot7, "天降横财！") .. HtmlUtil.createColorTxt(slot7, slot1.szNickName .. " ") .. HtmlUtil.createColorTxt(slot7, "在连环夺宝 ") .. HtmlUtil.createColorTxt(slot7, slot1.szServerName .. " ") .. HtmlUtil.createColorTxt(slot7, "中赢得累积奖") .. HtmlUtil.createArtNumDot(slot7, slot1.lJackpot, "#serial_notice_%s.png", nil, nil, nil) .. HtmlUtil.createImg(slot7, Tree.root .. "notice/image_coin.png", nil, nil, nil, 2, nil, nil, 15) .. HtmlUtil.createColorTxt(slot7, "，一举暴富！")
	end

	slot12 = TextField.H_LEFT
	slot5 = TextField.new(slot6, CCSKitchen.defaultFontFamily, 30, nil, 20000, nil)
	slot9 = slot4

	slot5.setHtmlText(CCSKitchen.defaultFontFamily, slot5)

	slot10 = 0.5

	slot5.setAnchorPoint(CCSKitchen.defaultFontFamily, slot5, 0.5)

	slot8 = slot5
	slot10 = slot0.contentClipLayer
	slot14 = slot5
	slot18 = 23

	slot5.setPosition(slot13, cc.p(slot16, slot8))

	slot15 = slot5

	slot0.contentClipLayer.addChild(slot13, slot0.contentClipLayer)

	slot0._readyToAdd = false
	slot0._showCounter = slot0._showCounter + 1
	slot14 = slot5
	slot21 = (slot5.getTextWidth(CCSKitchen.defaultFontFamily) + slot0._msgGap) / 200

	function slot22()
		slot0._readyToAdd = true
	end

	slot23 = (slot0.contentClipLayer.getContentSize(0.5).width - slot0._msgGap) / 200
	slot27 = 23

	function slot24()
		slot0._showCounter = slot0._showCounter - 1
	end

	slot21 = cc.CallFunc.create(cc.MoveTo, cc.CallFunc)
	slot24 = cc.RemoveSelf

	slot5.runAction(slot13, cc.Sequence.create(slot16, cc.Sequence, cc.MoveTo.create(slot19, cc.MoveTo, cc.p(slot23, slot0.contentClipLayer.getContentSize(0.5).width - (slot5.getTextWidth(CCSKitchen.defaultFontFamily) + slot0._msgGap))), cc.CallFunc.create(cc.MoveTo, cc.CallFunc), cc.MoveTo.create(cc.CallFunc, cc.MoveTo, cc.p(23, -slot5.getTextWidth(CCSKitchen.defaultFontFamily))), cc.RemoveSelf.create(cc.CallFunc)))
end

return
