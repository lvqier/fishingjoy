slot2 = "DzpkEffectCcsView"
DzpkEffectCcsView = class(slot1)

DzpkEffectCcsView.onCreationComplete = function (slot0)
	slot3 = slot0

	slot0.init(slot2)

	slot3 = slot0

	slot0.reset(slot2)
end

DzpkEffectCcsView.init = function (slot0)
	slot0.spineEffectPath = {
		"dzpk_hjtonghuashun/dzpk_hjtonghuashun",
		"dzpk_tonghuashun/dzpk_tonghuashun",
		"dzpk_jingang/dzpk_jingang",
		"dzpk_hulu/dzpk_hulu"
	}
	slot0.spineEffect = {}
	slot0.sound = {
		Dzpk_SOUND_BARDTYPE_HJ,
		Dzpk_SOUND_BARDTYPE_TONGHUA,
		Dzpk_SOUND_BARDTYPE_JINGANG,
		Dzpk_SOUND_BARDTYPE_HULU
	}
	slot5 = slot0

	slot0.model.isShowEffectWinChangedSignal.add(Dzpk_SOUND_BARDTYPE_HULU, slot0.model.isShowEffectWinChangedSignal, slot0.onShowWin)

	slot5 = slot0

	slot0.model.isShowEffectXPChangedSignal.add(Dzpk_SOUND_BARDTYPE_HULU, slot0.model.isShowEffectXPChangedSignal, slot0.onShowXP)

	slot5 = slot0

	slot0.model.gameEndCardTypeChangedSignal.add(Dzpk_SOUND_BARDTYPE_HULU, slot0.model.gameEndCardTypeChangedSignal, slot0.doCardTypeEffect)
end

DzpkEffectCcsView.doCardTypeEffect = function (slot0)
	slot3 = slot0.model

	if slot0.model.getGameEndCardType(slot2) == 0 then
		return
	end

	slot3 = slot0.model

	if slot0.spineEffect[slot0.model.getGameEndCardType(slot2)] == nil then
		slot5 = slot0.spineEffectPath[slot1] .. ".json"
		slot6 = slot0.spineEffectPath[slot1] .. ".atlas"
		slot8 = slot0.controller.getSpinePath(slot0.controller, slot0.controller)
		slot4 = sp.SkeletonAnimation.create(slot0.controller, sp.SkeletonAnimation, slot2)
		slot11 = slot0
		slot9 = slot0:getContentSize().height / 2

		slot4.setPosition(sp.SkeletonAnimation, slot4, slot0.getContentSize(slot9).width / 2)

		slot8 = slot4

		slot0.addChild(sp.SkeletonAnimation, slot0)

		slot0.spineEffect[slot1] = slot4
	end

	slot5 = slot0.sound[slot1]

	slot0.controller.playGameEffect(slot3, slot0.controller)

	slot5 = true

	slot0.spineEffect[slot1].setVisible(slot3, slot0.spineEffect[slot1])

	slot7 = false

	slot0.spineEffect[slot1].setAnimation(slot3, slot0.spineEffect[slot1], 0, "animation")

	slot5 = true

	slot0.setVisible(slot3, slot0)
end

DzpkEffectCcsView.onShowXP = function (slot0)
	slot3 = slot0.model

	if slot0.model.getIsShowEffectXP(slot2) then
		slot5 = true

		slot0.setVisible(slot3, slot0)

		slot4 = slot0

		slot0.doXPAction(slot3)
	else
		slot4 = slot0

		slot0.afterXPAction(slot3)
	end
end

DzpkEffectCcsView.onShowWin = function (slot0)
	slot3 = slot0.model

	if slot0.model.getIsShowEffectWin(slot2) then
		slot5 = true

		slot0.setVisible(slot3, slot0)

		slot4 = slot0

		slot0.doWinAction(slot3)
	else
		slot4 = slot0

		slot0.afterWinAction(slot3)
	end
end

DzpkEffectCcsView.doXPAction = function (slot0)
	if slot0.xpSpine == nil then
		slot4 = "dzpk_biankuangeffect/yszbiankuangfireeffect.json"
		slot5 = "dzpk_biankuangeffect/yszbiankuangfireeffect.atlas"
		slot0.xpSpine = sp.SkeletonAnimation.create(slot0.controller, sp.SkeletonAnimation, slot1)
		slot9 = slot0
		slot7 = slot0:getContentSize().height / 2

		slot0.xpSpine.setPosition(slot0.controller, slot0.xpSpine, slot0.getContentSize(slot2).width / 2)

		slot5 = slot0.model

		if slot0.model.getIsAdjustSlimWidth(slot0.controller) then
			slot9 = slot0
			slot6 = display.width / slot0.getContentSize(slot8).width

			slot0.xpSpine.setScaleY(slot4, slot0.xpSpine)
		end

		slot6 = 90

		slot0.xpSpine.setRotation(slot4, slot0.xpSpine)

		slot6 = slot0.xpSpine

		slot0.xplayer.addChild(slot4, slot0.xplayer)
	end

	slot6 = true

	slot0.xpSpine.setAnimation(slot2, slot0.xpSpine, 0, "animation")

	slot4 = true

	slot0.xpSpine.setVisible(slot2, slot0.xpSpine)

	slot4 = true

	slot0.xplayer.setVisible(slot2, slot0.xplayer)

	slot3 = slot0.xplayer

	slot0.xplayer.stopAllActions(slot2)

	slot3 = slot0.xplayer
	slot10 = 2

	function slot11()
		slot2 = slot0

		slot0.afterXPAction(slot1)
	end

	slot9 = nil

	slot0.xplayer.runAction(slot2, cc.Sequence.create("animation", cc.Sequence, cc.DelayTime.create(slot8, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))

	slot4 = 0

	audioMgr.holdVolume(slot2, audioMgr)

	slot5 = false

	slot0.controller.playGameEffect(slot2, slot0.controller, Dzpk_ALLIN_BG_SOUNDRES)
end

DzpkEffectCcsView.afterXPAction = function (slot0)
	if slot0.allInBg ~= nil then
		slot4 = slot0.allInBg

		slot0.controller.stopGameEffect(slot2, slot0.controller)

		slot0.allInBg = nil
	end

	slot4 = false

	slot0.xplayer.setVisible(slot2, slot0.xplayer)

	slot3 = slot0.xplayer

	slot0.xplayer.stopAllActions(slot2)

	slot3 = audioMgr

	audioMgr.resetVolume(slot2)
end

DzpkEffectCcsView.doWinAction = function (slot0)
	if slot0.winSpine == nil then
		slot4 = "dzpk_youwin/dzpk_youwin.json"
		slot5 = "dzpk_youwin/dzpk_youwin.atlas"
		slot0.winSpine = sp.SkeletonAnimation.create(slot0.controller, sp.SkeletonAnimation, slot1)
		slot9 = slot0
		slot7 = slot0:getContentSize().height / 2 + 320

		slot0.winSpine.setPosition(slot0.controller, slot0.winSpine, slot0.getContentSize(slot2).width / 2)

		slot6 = slot0.winSpine

		slot0.addChild(slot0.controller, slot0)
	end

	slot6 = false

	slot0.winSpine.setAnimation(slot2, slot0.winSpine, 0, "animation")

	slot4 = true

	slot0.winSpine.setVisible(slot2, slot0.winSpine)
end

DzpkEffectCcsView.afterWinAction = function (slot0)
	if slot0.winSpine ~= nil then
		slot4 = false

		slot0.winSpine.setVisible(slot2, slot0.winSpine)
	end

	slot4 = false

	slot0.setVisible(slot2, slot0)
end

DzpkEffectCcsView.reset = function (slot0)
	slot3 = slot0

	slot0.onShowWin(slot2)

	slot3 = slot0

	slot0.onShowXP(slot2)

	slot4 = false

	slot0.setVisible(slot2, slot0)

	slot3 = slot0.spineEffect

	for slot4, slot5 in pairs(slot2) do
		if slot5 ~= nil then
			slot9 = false

			slot5.setVisible(slot7, slot5)
		end
	end

	slot4 = false

	slot0.xplayer.setVisible(slot2, slot0.xplayer)

	slot3 = slot0.xplayer

	slot0.xplayer.stopAllActions(slot2)
end

DzpkEffectCcsView.destroy = function (slot0)
	slot3 = "=========YszEffectCcsView:destroy==========="

	print(slot2)

	if slot0.winSpine ~= nil then
		slot4 = false

		slot0.winSpine.setVisible(slot2, slot0.winSpine)
	end
end

return
