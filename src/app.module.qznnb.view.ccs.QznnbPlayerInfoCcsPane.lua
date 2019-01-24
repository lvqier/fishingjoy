QznnbPlayerInfoCcsPane = class("QznnbPlayerInfoCcsPane")

QznnbPlayerInfoCcsPane.onCreationComplete = function (slot0)
	createSetterGetter(slot0, "data", nil, nil, nil, nil, nil, handler(slot0, slot0.onData))
	slot0.spProgress:deploy(slot0.controller:getParticlePath("touxianglizi.plist"), 124, 171, 14, 2, 1, true)
	slot0.model.isShowingCdChangedSignal:add(slot0.onIsShowingCd, slot0)
	slot0.model.playerCdsDicChangedSignal:add(slot0.onPlayerCdChanged, slot0)
	slot0:onPlayerCdChanged()
	slot0.spBankerEffect:setVisible(false)
	slot0:setProgressPlaying(true, 15)
end

QznnbPlayerInfoCcsPane.onIsShowingCd = function (slot0)
	DisplayUtil.setVisible(slot0.spProgress, slot0.model:getIsShowingCd())
end

QznnbPlayerInfoCcsPane.onPlayerCdChanged = function (slot0)
	if slot0._data and slot0.model:getPlayerCdsDic()[slot0._data.wChairID] then
		if not slot1.hasStart then
			slot1.hasStart = true

			slot0:setProgressPlaying(true, slot1.durationS)
		end

		return
	end

	slot0:setProgressPlaying(false)
end

QznnbPlayerInfoCcsPane.setProgressPlaying = function (slot0, slot1, slot2)
	slot0.spProgress:setProgressPlaying(slot1 and slot0.model:getIsShowingCd(), slot2)
end

QznnbPlayerInfoCcsPane.onData = function (slot0)
	slot0:setVisible(slot0._data ~= nil and slot0._data.cbUserStatus ~= US_FREE)

	if slot0._data ~= nil and slot0._data.cbUserStatus ~= US_FREE then
		slot0.txtName_tf:setHtmlText(HtmlUtil.createWhiteTxt(slot2, 22))
		slot0.txtName_tf:setPositionY(37)
		slot0.head:setUserData(slot0._data, true)
		slot0:onUserScore()
	else
		slot0:resetEffect()
	end

	slot0:onPlayerCdChanged()
end

QznnbPlayerInfoCcsPane.onUserScore = function (slot0)
	if slot0._data then
		slot1 = gameMgr:getUserData(slot0._data.dwUserID)
		slot0.lScore = slot0.lScore or 0

		if slot1 and slot1.lScore and slot0.lScore ~= slot1.lScore then
			slot3 = (slot1.lScore > 0 and slot1.lScore) or 0

			slot0.txtMoney_tf:setHtmlText(HtmlUtil.createColorTxt(MathUtil.cookNumWithHansUnits, "#E5EC8D", 22))

			slot0.lScore = slot1.lScore

			slot0.controller:setHeadBg(slot0.head, GAME_STATE.BATTLE, slot1.wGender)
			slot0.head:setUserData(slot1, true)
		end
	end
end

QznnbPlayerInfoCcsPane.createRepeatAction = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot3 >= 1 then
		slot9 = 0.8

		return cc.Sequence:create(cc.DelayTime:create((slot3 > 1 and (slot2 + 1) * 0.07 * slot5 * 0.9 - slot1 * 0.07 * slot5 * 0.9) or 0), cc.CallFunc:create(function (slot0)
			if slot0 == 0 and slot1 then
				slot2:getParent():getParent().layerMask:setVisible(false)
				slot2.getParent().getParent().layerMask:playBankerEffect(slot0)
			end
		end), cc.Sequence:create(cc.FadeIn:create(0.01 * 0.07 * slot5), cc.EaseSineIn:create(cc.FadeOut:create(0.99 * 0.07 * slot5 * 2))), cc.DelayTime:create((slot3 > 1 and slot1 * 0.07 * slot5 * 0.9) or 0), cc.CallFunc:create(function (slot0)
			if slot0 == 0 and slot1 then
				DisplayUtil.switchParentTo(slot2.spineBanker, )
				applyFunction(slot2.spineBanker)
			end
		end))
	else
		return cc.FadeOut:create(0)
	end
end

QznnbPlayerInfoCcsPane.playBankerRandomEffect = function (slot0, slot1, slot2, slot3, slot4)
	slot0.spBankerEffect:setTexture(slot5)
	slot0.spBankerEffect:setOpacity(255)
	slot0.spBankerEffect:setVisible(true)

	slot6 = math.random(1, 2)

	DisplayUtil.switchParentTo2(slot0.spBankerEffect, slot0:getParent():getParent().layerWinSpine)
	slot0.spBankerEffect:stopAllActions()
	slot0.spBankerEffect:runAction(cc.Sequence:create(cc.FadeOut:create(0), slot0:createRepeatAction(slot1, slot2, slot3, slot4, 1.6), slot0:createRepeatAction(slot1, slot2, slot3, slot4, 1.8), slot0:createRepeatAction(slot1, slot2, slot3, slot4, 3.5, true), cc.CallFunc:create(function (slot0)
		return
	end), cc.DelayTime:create(1.5), cc.CallFunc:create(function (slot0)
		slot0:stopBankerEffect(slot0.stopBankerEffect)
	end)))
end

QznnbPlayerInfoCcsPane.playBankerEffect = function (slot0, slot1)
	if slot0:isVisible() and slot1 == 0 then
		slot2, slot3 = slot0.bg:getPosition()

		spPoolMgr:put(slot0.spineBanker)

		slot0.spineBanker = slot0.controller:createSpineByPool("qznnb_kuangeffect")

		slot0.spineBanker:setPosition(slot4)
		slot0.spineBanker:setAnimation(0, "animation", true)
		slot0:addChild(slot0.spineBanker, 15)
		DisplayUtil.switchParentTo(slot0.spineBanker, slot0:getParent():getParent().layerWinSpine)
	end
end

QznnbPlayerInfoCcsPane.stopBankerEffect = function (slot0, slot1)
	if slot1 == 0 then
		spPoolMgr:put(slot0.spineBanker)
	end
end

QznnbPlayerInfoCcsPane.resetBankerEffect = function (slot0)
	slot0.spBankerEffect:stopAllActions()
	spPoolMgr:put(slot0.spineBanker)
	slot0.spBankerEffect:setVisible(false)
	DisplayUtil.switchParentTo2(slot0.spBankerEffect, slot0)
end

QznnbPlayerInfoCcsPane.resetEffect = function (slot0)
	if slot0.spine then
		spPoolMgr:put(slot0.spine)

		slot0.spine = nil
	end

	if slot0.animation and not tolua.isnull(spine) then
		slot0.animation:removeFromParent()

		slot0.animation = nil
	end

	slot0:resetBankerEffect()
end

QznnbPlayerInfoCcsPane.playWinEffect = function (slot0)
	if slot0:isVisible() then
		slot0.spine = slot0.controller:createSpineWithEvent("renx", __emptyFunction)

		slot0.spine:setPosition(slot1)
		slot0:addChild(slot0.spine, 5)
		DisplayUtil.switchParentTo(slot0.spine, slot0:getParent():getParent().layerWinSpine)
	end
end

QznnbPlayerInfoCcsPane.playMoneyEffect = function (slot0)
	if slot0:isVisible() then
		slot0.animation = AnimationUtil.createWithSpriteSheet("gameres/module/qznnb/spritesheet/", "spritesheet_anim_gold.plist", 30, 1, __emptyFunction)

		slot0.animation:setPosition(cc.p(cc.p(slot0.bg:getPosition()).x, cc.p(slot0.bg.getPosition()).y + 40))
		slot0:addChild(slot0.animation, 10)
	end
end

QznnbPlayerInfoCcsPane.destroy = function (slot0)
	slot0.model.isShowingCdChangedSignal:remove(slot0.onIsShowingCd, slot0)
	slot0.model.playerCdsDicChangedSignal:remove(slot0.onPlayerCdChanged, slot0)
	slot0:resetEffect()
	destroySomeObj(slot0.txtMoney_tf)
	destroySomeObj(slot0.txtName_tf)
	destroySomeObj(slot0.head)
	destroySomeObj(slot0.spProgress)
end

return
