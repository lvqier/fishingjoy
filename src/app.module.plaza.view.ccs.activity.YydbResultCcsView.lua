YydbResultCcsView = class("YydbResultCcsView")

YydbResultCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	for slot4 = 1, 3, 1 do
		slot0.view["num" .. slot4].root:setIdx(slot4)
	end

	DisplayUtil.setAllCascadeOpacityEnabled(slot0.view.layerWin)

	slot3 = sp.SkeletonAnimation:create(slot1, slot2)

	slot3:setAnimation(0, "animation", true)
	slot0.view.spineFrame:addChild(slot3)
	sp.SkeletonAnimation:create(slot4, slot5).setAnimation(slot3, 0, "animation", true)
	sp.SkeletonAnimation.create(slot4, slot5).setSkin(slot3, "yi_yuan_duo_bao_1_0")
	slot0.view.spineLogo:addChild(slot3)

	slot0._beanRes = ResConfig.getUICommonPath("pane/yydb_icon_bean_effect.png")

	slot0.model._yydbEffectEndSignal:add(slot0.onEffectEnd, slot0)
end

YydbResultCcsView.onShow = function (slot0)
	slot0.view.layerWin:setVisible(false)
	slot0.view.layerLose:setVisible(false)

	slot0._info = nil
	slot2 = Hero:getYydbLastPeriod()

	for slot6, slot7 in pairs(slot1) do
		if slot7.Period == slot2 and slot7.WinnerID and slot7.WinnerID > 0 then
			slot0._info = slot7
		end
	end

	if slot0._info then
		slot0.view.txt_title:setString(slot3)
		slot0.model:setYydbWinningNumber(tonumber(slot0._info.WinningNumber), true)
	elseif gameMgr:getYydbTempInfo() and slot3.wState == 3 then
		slot0._info = {
			Reward = slot3.lReward,
			Period = slot3.dwPeriod,
			WinnerID = slot3.dwWinnerID,
			WinningNumber = slot3.dwWinningNumber
		}

		slot0.view.txt_title:setString(slot4)
		slot0.model:setYydbWinningNumber(tonumber(slot0._info.WinningNumber), true)
	end

	slot0.view.spLine:stopAllActions()
	slot0.view.spLine:setPositionY(-15.68)
	slot0.view.spLine:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveBy:create(0.1, cc.p(0, -2)), cc.MoveBy:create(0.1, cc.p(0, 2)))))
end

YydbResultCcsView.onEffectEnd = function (slot0)
	slot0.view.spLine:stopAllActions()
	slot0.view.spLine:setPositionY(-15.68)

	if not slot0._info then
		slot0:showWinEffect()

		return
	end

	if slot0._info.WinnerID == Hero:getDwUserID() then
		slot0:showWinEffect()
	else
		slot0:showLoseEffect()
	end
end

YydbResultCcsView.showBeanEffect = function (slot0)
	slot1 = slot0._beanRes

	for slot5 = 1, 80, 1 do
		slot6 = display.newSprite(slot1)

		slot0.view.bean:addChild(slot6)
		slot6:setPosition(slot8, slot9)
		slot6:setScale(slot10)
		slot6:setRotation(slot11)

		slot14 = math.random(-100, 100)
		slot15 = math.random(50, 100) / 1000
		slot16 = math.random(180, 270)

		slot6:setFlippedX(math.random(0, 1) == 1)
		slot6:setOpacity(50)
		slot6:runAction(cc.Sequence:create(cc.Spawn:create(cc.EaseSineIn:create(cc.FadeIn:create((1 * 0.6 * (slot9 + slot14)) / 800)), cc.EaseSineIn:create(cc.MoveTo:create((1 * 0.6 * (slot9 + slot14)) / 800, cc.p(slot8 + slot14, -100))), cc.EaseSineIn:create(cc.RotateBy:create((1 * 0.6 * (slot9 + slot14)) / 800, slot16 / 3))), cc.Spawn:create(cc.EaseSineOut:create(cc.MoveTo:create(0.8 * 0.6, cc.p(slot8 + 3 * slot14, math.random(250, 350) - ((math.random(0, 1) > 0 and 1) or 0) * 20000))), cc.EaseSineOut:create(cc.RotateBy:create(0.8 * 0.6, slot16))), cc.Spawn:create(cc.EaseSineIn:create(cc.MoveTo:create(0.8 * 0.6, cc.p(slot8 + 4 * slot14, -100 - ((math.random(0, 1) > 0 and 1) or 0) * 20000))), cc.EaseSineOut:create(cc.RotateBy:create(0.8 * 0.6, slot16 / 5))), cc.CallFunc:create(function ()
			slot0:removeFromParent()
		end)))
	end

	audioMgr:playGameEffect("effect/effect_coins.mp3")
end

YydbResultCcsView.showWinEffect = function (slot0)
	DisplayUtil.setAllCascadeOpacityEnabled(slot0.view.layerWin.nodeTxt)
	slot0.view.layerWin.nodeTxt:setVisible(false)
	slot0.view.layerWin.btnGoToBank:setVisible(false)
	slot0.view.layerWin.txtTip:setVisible(false)
	slot0.view.layerWin.nodeTxt:setOpacity(0)
	slot0.view.layerWin.btnGoToBank:setOpacity(0)
	slot0.view.layerWin.txtTip:setOpacity(0)
	slot0.view.layerWin:setVisible(true)
	slot0.view.layerWin.nodeTxt:setScale(0.5)

	if not slot0._spineEffect then
		slot0._spineEffect = sp.SkeletonAnimation:create(ResConfig.getSpinePath("yi_yuan_duo_bao_2/yi_yuan_duo_bao_2.json"), ResConfig.getSpinePath("yi_yuan_duo_bao_2/yi_yuan_duo_bao_2.atlas"))
	else
		slot0._spineEffect:clearTracks()
	end

	slot0._spineEffect:registerSpineEventHandler(slot1, SP_ANIMATION_END)
	slot0._spineEffect:setAnimation(0, "animation", false)
	slot0.view.layerWin.spineEffect:addChild(slot0._spineEffect)

	if slot0._info and slot0._info.Reward then
		slot0.view.layerWin.nodeTxt.txt_itemName:setString(MathUtil.cookNumWithHansUnits(slot0._info.Reward, 0) .. "欢乐豆")
	end

	if slot0.tlline then
		slot0.tlline:kill()
	end

	slot0.tlline = TimelineLite.new()

	slot0.tlline:insert(TweenLite.to(slot0.view.layerWin.nodeTxt, 0.3, {
		autoAlpha = 1,
		scale = 1
	}), 0.1)
	slot0.tlline:insert(TweenLite.to(slot0.view.layerWin.btnGoToBank, 0.5, {
		autoAlpha = 1
	}), 0.7)
	slot0.tlline:insert(TweenMax.to(slot0.view.layerWin.txtTip, 2, {
		autoAlpha = 1,
		yoyo = true,
		repeatCount = -1
	}), 0.8)
	audioMgr:playGameEffect("effect/effect_win.mp3")
end

YydbResultCcsView.showLoseEffect = function (slot0)
	slot0.view.layerLose:setVisible(true)
	audioMgr:playGameEffect("effect/effect_lose.mp3")
end

YydbResultCcsView.onHide = function (slot0)
	if slot0.tlline then
		slot0.tlline:kill()

		slot0.tlline = nil
	end

	if slot0._spineEffect then
		slot0._spineEffect:removeFromParent()

		slot0._spineEffect = nil
	end

	for slot4 = 1, 3, 1 do
		slot0.view["num" .. slot4].root:reset(0)
	end

	slot0.view.spLine:stopAllActions()
	slot0.view.spLine:setPositionY(-15.68)
	slot0.view.bean:removeAllChildren()
end

YydbResultCcsView.onRootClick = function (slot0)
	return
end

YydbResultCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingYydbResult(false)
		popupMgr:pop(POPUP_ID_YYDB_RESULT)
	elseif slot1 == slot0.view.layerWin.btnGoToBank then
		slot0.controller:openBankModule()
		slot0.model:setIsShowingYydbResult(false)
		popupMgr:pop(POPUP_ID_YYDB_RESULT)
	end
end

YydbResultCcsView.destroy = function (slot0)
	slot0.model._yydbEffectEndSignal:remove(slot0.onEffectEnd, slot0)

	if slot0.tlline then
		slot0.tlline:kill()

		slot0.tlline = nil
	end

	for slot4 = 1, 3, 1 do
		slot0.view["num" .. slot4].root:destroy()
	end

	slot0.view.bean:removeAllChildren()
	ZoomPopUpChildView.destroy(slot0)
end

return
