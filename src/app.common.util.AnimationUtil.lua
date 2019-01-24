AnimationUtil = {
	createWithSpriteFrames = function (slot0, slot1, slot2, slot3, slot4, slot5)
		slot12 = slot4
		slot6 = AnimationPlayer.new(slot7, slot0, slot1, slot2, slot3)

		if not slot5 then
			slot9 = slot6

			slot6.playAnimation(slot8)
		end

		return slot6
	end
}

AnimationUtil.createWithSpriteSheetInSprite = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot10 = slot5
	slot10 = "resMgr doesn't cotntain resKey :" .. slot1

	assert(resMgr, slot6)

	slot13 = slot4
	AnimationUtil.createWithSpriteFrames(resMgr, slot0, resMgr.getTpFrames(slot7, resMgr, slot1), slot2, slot3).animationFramesPlist = plistUrl

	return AnimationUtil.createWithSpriteFrames(resMgr, slot0, resMgr.getTpFrames(slot7, resMgr, slot1), slot2, slot3)
end

AnimationUtil.createWithSpriteSheet = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot11 = ".png"
	slot13 = true

	resMgr.loadTextureAtlas(slot0 .. slot1, resMgr, slot8)

	slot13 = slot5
	slot13 = "resMgr doesn't cotntain resKey :" .. slot7

	assert(resMgr, slot9)

	slot16 = slot4
	AnimationUtil.createWithSpriteFrames(resMgr, slot6, resMgr.getTpFrames(slot0 .. slot1, resMgr, slot7), slot2, slot3).animationFramesPlist = ResConfig.getResPath(slot1)

	return AnimationUtil.createWithSpriteFrames(resMgr, slot6, resMgr.getTpFrames(slot0 .. slot1, resMgr, slot7), slot2, slot3)
end

AnimationUtil.findAnimations = function (slot0, slot1)
	slot1 = slot1 or {}

	if slot0.ccsChildren then
		slot4 = slot0.ccsChildren

		for slot5, slot6 in ipairs(slot3) do
			if slot6.__cname == "AnimationPlayer" then
				slot10 = slot6

				table.insert(slot8, slot1)
			else
				slot10 = slot1

				AnimationUtil.findAnimations(slot8, slot6)
			end
		end
	end

	return slot1
end

AnimationUtil.playEffectFromSpriteFrame = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot2 < slot1 then
		return nil
	end

	slot7 = {}
	slot9 = slot0 .. "%0" .. string.len(tostring(slot11)) .. "d.png"
	slot10 = 1 / (slot3 or 30)
	slot13 = cc.Animation
	slot11 = cc.Animation.create(slot2)

	for slot15 = slot1, slot2, 1 do
		slot19 = slot15
		slot19 = cc.SpriteFrameCache
		slot20 = string.format(slot17, slot9)

		if cc.SpriteFrameCache.getInstance(slot9).getSpriteFrame(slot9, cc.SpriteFrameCache.getInstance(slot9)) then
			slot21 = slot17

			slot11.addSpriteFrame(slot19, slot11)
		end
	end

	slot15 = slot10

	slot11.setDelayPerUnit(slot13, slot11)

	slot15 = false

	slot11.setRestoreOriginalFrame(slot13, slot11)

	slot15 = slot4 or 1

	slot11.setLoops(slot13, slot11)

	slot15 = slot11
	slot12 = cc.Animate.create(slot13, cc.Animate)
	slot15 = cc.Sprite
	slot13 = cc.Sprite.create(cc.Animate)

	if slot5 then
		slot16 = slot13
		slot24 = slot6 or 1
		slot21 = cc.DelayTime.create(slot22, cc.DelayTime)

		function slot25()
			if slot0 ~= nil then
				slot2 = slot0

				slot0.removeFromParent(slot1)

				slot0 = nil
			end
		end

		slot13.runAction(slot15, cc.Sequence.create(slot18, cc.Sequence, slot12, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
	else
		slot17 = slot12

		slot13.runAction(slot15, slot13)
	end

	return slot13
end

return
