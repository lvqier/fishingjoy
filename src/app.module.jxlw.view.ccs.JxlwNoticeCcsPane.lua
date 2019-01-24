slot2 = "JxlwNoticeCcsPane"
JxlwNoticeCcsPane = class(slot1)

JxlwNoticeCcsPane.onCreationComplete = function (slot0)
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
	slot10 = "battle/spines/jxlw_firetioskuangeffecta.json"
	slot7 = slot0.controller.getUIPath(slot8, slot0.controller)
	slot11 = "battle/spines/jxlw_firetioskuangeffecta.atlas"
	slot4 = sp.SkeletonAnimation.createWithJsonFile(slot5, sp.SkeletonAnimation, slot0.controller.getUIPath(slot0.controller, slot0.controller))
	slot7 = slot4
	slot11 = slot0.getContentSize(slot2).height / 2

	slot4.setPosition(sp.SkeletonAnimation, cc.p(slot0.controller, slot2))

	slot8 = true

	slot4.setVisible(sp.SkeletonAnimation, slot4)

	slot8 = true

	slot4.setCascadeOpacityEnabled(sp.SkeletonAnimation, slot4)

	slot10 = false

	slot4.setAnimation(sp.SkeletonAnimation, slot4, 0, "end")
	slot0.addChild(sp.SkeletonAnimation, slot0, slot4)

	slot0.fire = slot4
	slot11 = "battle/spines/jxlw_firetioskuangeffectb.json"
	slot8 = slot0.controller.getUIPath(103, slot0.controller)
	slot12 = "battle/spines/jxlw_firetioskuangeffectb.atlas"
	slot5 = sp.SkeletonAnimation.createWithJsonFile(sp.SkeletonAnimation, sp.SkeletonAnimation, slot0.controller.getUIPath(slot0.controller, slot0.controller))
	slot8 = slot5
	slot12 = slot0.getContentSize(slot2).height / 2

	slot5.setPosition(sp.SkeletonAnimation, cc.p(slot0.controller, slot2))

	slot9 = true

	slot5.setVisible(sp.SkeletonAnimation, slot5)

	slot9 = true

	slot5.setCascadeOpacityEnabled(sp.SkeletonAnimation, slot5)

	slot11 = false

	slot5.setAnimation(sp.SkeletonAnimation, slot5, 0, "end")
	slot0.addChild(sp.SkeletonAnimation, slot0, slot5)

	slot0.bg = slot5
	slot12 = "battle/particle/jxlw_firetipskuanglizi.plist"
	slot6 = cc.ParticleSystemQuad.create(sp.SkeletonAnimation, slot0.controller.getUIPath(101, slot0.controller))
	slot9 = slot6
	slot13 = slot0.getContentSize(slot2).height / 2 - 20

	slot6.setPosition(cc.ParticleSystemQuad, cc.p(slot0.controller, slot2))

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

JxlwNoticeCcsPane.onEnterExit = function (slot0, slot1)
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

JxlwNoticeCcsPane.reset = function (slot0)
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

JxlwNoticeCcsPane.addMessage = function (slot0, slot1)
	slot0._msg[#slot0._msg + 1] = slot1
end

JxlwNoticeCcsPane.update = function (slot0, slot1)
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

JxlwNoticeCcsPane.start = function (slot0)
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

JxlwNoticeCcsPane.hide = function (slot0)
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

JxlwNoticeCcsPane.check = function (slot0)
	if #slot0._msg > 0 then
		start()
	else
		stop()
	end
end

JxlwNoticeCcsPane.stop = function (slot0)
	slot0._state = "hided"
	slot4 = false

	slot0.setVisible(slot2, slot0)
end

JxlwNoticeCcsPane.showText = function (slot0)
	slot4 = 1
	slot7 = "#e9d265"
	slot7 = "#ef5cab"
	slot7 = "#e9d265"
	slot10 = TextField.H_LEFT
	slot3 = TextField.new(HtmlUtil.createArtNumDot(slot5, table.remove(slot2, slot0._msg).lJackpot, "#jxlw_notice_%s.png", nil, nil, nil), CCSKitchen.defaultFontFamily, 30, nil, 20000, nil)
	slot7 = "" .. HtmlUtil.createColorTxt(slot5, "恭喜 ") .. HtmlUtil.createColorTxt(slot5, table.remove(slot2, slot0._msg).szNickName .. " ") .. HtmlUtil.createColorTxt(slot5, "击中彩池，获得") .. HtmlUtil.createImg(slot5, "gameres/module/jxlw/ui/battle/image_coin.png", nil, nil, nil, 2, nil, nil, 15) .. HtmlUtil.createArtNumDot(slot5, table.remove(slot2, slot0._msg).lJackpot, "#jxlw_notice_%s.png", nil, nil, nil)

	slot3.setHtmlText(CCSKitchen.defaultFontFamily, slot3)

	slot8 = 0.5

	slot3.setAnchorPoint(CCSKitchen.defaultFontFamily, slot3, 0.5)

	slot6 = slot3
	slot8 = slot0.contentClipLayer
	slot12 = slot3
	slot16 = 23

	slot3.setPosition(-5, cc.p(nil, slot6))

	slot13 = slot3

	slot0.contentClipLayer.addChild(-5, slot0.contentClipLayer)

	slot0._readyToAdd = false
	slot0._showCounter = slot0._showCounter + 1
	slot12 = slot3
	slot19 = (slot3.getTextWidth(CCSKitchen.defaultFontFamily) + slot0._msgGap) / 200

	function slot20()
		slot0._readyToAdd = true
	end

	slot21 = (slot0.contentClipLayer.getContentSize(0.5).width - slot0._msgGap) / 200
	slot25 = 23

	function slot22()
		slot0._showCounter = slot0._showCounter - 1
	end

	slot19 = cc.CallFunc.create(cc.MoveTo, cc.CallFunc)
	slot22 = cc.RemoveSelf

	slot3.runAction(-5, cc.Sequence.create(nil, cc.Sequence, cc.MoveTo.create(slot17, cc.MoveTo, cc.p(slot21, slot0.contentClipLayer.getContentSize(0.5).width - (slot3.getTextWidth(CCSKitchen.defaultFontFamily) + slot0._msgGap))), cc.CallFunc.create(cc.MoveTo, cc.CallFunc), cc.MoveTo.create(cc.CallFunc, cc.MoveTo, cc.p(23, -slot3.getTextWidth(CCSKitchen.defaultFontFamily))), cc.RemoveSelf.create(cc.CallFunc)))
end

return
