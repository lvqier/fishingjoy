slot2 = "dntglk.fishConfig.Dntglk_RenderOrder"

requireLuaFromModule(slot1)

function slot3()
	return display.newLayer()
end

slot0 = class(slot1, "FishLayer")
slot3 = "dntglk.dntgLogic.RenderObjectPool"
slot1 = requireLuaFromModule("FishLayer")
slot0.startTime = TimeApi.getSystemTime()

slot0.ctor = function (slot0)
	slot0.m_pLayerFish = display.newLayer()
	slot4 = "m_pLayerFish"

	slot0.m_pLayerFish.setName(slot2, slot0.m_pLayerFish)

	slot5 = 1

	slot0.addChild(slot2, slot0, slot0.m_pLayerFish)

	slot0.m_pLayerFishyy = display.newLayer()
	slot4 = "m_pLayerFishyy"

	slot0.m_pLayerFishyy.setName(slot2, slot0.m_pLayerFishyy)

	slot5 = 0

	slot0.addChild(slot2, slot0, slot0.m_pLayerFishyy)

	slot0.m_pLayerBullet = display.newLayer()
	slot4 = "m_pLayerBullet"

	slot0.m_pLayerBullet.setName(slot2, slot0.m_pLayerBullet)

	slot5 = 7

	slot0.addChild(slot2, slot0, slot0.m_pLayerBullet)

	slot0._pool = slot0._instance
end

slot0.genArmature = function (slot0)
	slot1, slot2 = nil

	if slot0.AniType == DNTGLK_FISH_FILE_TYPE.VAT_SKELETON or slot0.AniType == nil then
		slot8 = 1
		sp.SkeletonAnimation.create(slot0.Image, sp.SkeletonAnimation, slot2 .. ".json", slot2 .. ".atlas").textureEnlargeRate = 1
	elseif slot0.AniType == DNTGLK_FISH_FILE_TYPE.VAT_3D then
		slot6 = "res/gameres/module/dntglk/fishAnimations/3D/" .. slot0.Image .. "/" .. slot0.Image .. ".c3b"
		slot6 = true

		cc.Sprite3D.create(slot0.Image, cc.Sprite3D).setForce2DQueue(slot0.Image, slot1)

		slot6 = 3

		cc.Sprite3D.create(slot0.Image, cc.Sprite3D).setScale(slot0.Image, slot1)

		slot6 = {
			w = 1,
			z = 0,
			x = 0,
			y = 0
		}

		cc.Sprite3D.create(slot0.Image, cc.Sprite3D).setRotationQuat(slot0.Image, slot1)

		cc.Sprite3D.create(slot0.Image, cc.Sprite3D).registerSpineEventHandler = slot0.dummyFunc
		cc.Sprite3D.create(slot0.Image, cc.Sprite3D).textureEnlargeRate = 1
		slot6 = slot0.Normal
		cc.Sprite3D.create(slot0.Image, cc.Sprite3D).actionNormal = slot0.createAnimate3D(slot0.Image, slot2)
		slot6 = slot0.Special
		cc.Sprite3D.create(slot0.Image, cc.Sprite3D).actionSpecial = slot0.createAnimate3D(slot0.Image, slot2)
		slot6 = slot0.Turn
		cc.Sprite3D.create(slot0.Image, cc.Sprite3D).actionTurn = slot0.createAnimate3D(slot0.Image, slot2)
		slot6 = slot0.Die
		slot11 = 0
		cc.Sprite3D.create(slot0.Image, cc.Sprite3D).actionDie = slot0.createAnimate3D(slot0.Image, "res/gameres/module/dntglk/fishAnimations/3D/" .. slot0.Image .. "/" .. slot0.Image .. ".c3b", cc.FadeTo.create(slot8, cc.FadeTo, 0.3))

		if slot0.Attack then
			slot1.actionAttack = {}

			for slot6 = 1, #slot0.Attack, 1 do
				slot12 = slot0.Attack[slot6]
				slot1.actionAttack[#slot1.actionAttack + 1] = slot0.createAnimate3D(slot10, slot2)
			end
		end
	elseif slot0.AniType == DNTGLK_FISH_FILE_TYPE.VAT_FRAME then
		slot5 = cc.Sprite
		cc.Sprite.create(slot4).textureEnlargeRate = 1.3333333333333333
		slot6 = slot0.Normal
		cc.Sprite.create(slot4).actionNormal = slot0.createFrameAction(slot4, slot0.Image)
		slot6 = slot0.Special
		cc.Sprite.create(slot4).actionSpecial = slot0.createFrameAction(slot4, slot0.Image)
		slot6 = slot0.Turn
		cc.Sprite.create(slot4).actionTurn = slot0.createFrameAction(slot4, slot0.Image)
		slot6 = slot0.Die
		slot11 = 0
		cc.Sprite.create(slot4).actionDie = slot0.createFrameAction(slot4, slot0.Image, cc.FadeTo.create(slot8, cc.FadeTo, 0.3))
	elseif slot0.AniType == DNTGLK_FISH_FILE_TYPE.VAT_SPRITE then
		slot5 = cc.Sprite
		cc.Sprite.create(slot4).textureEnlargeRate = 1
		slot5 = cc.SpriteFrameCache
		slot6 = slot0.Normal[1] .. ".png"
		cc.Sprite.create(slot4).frameNormal = cc.SpriteFrameCache.getInstance(slot4).getSpriteFrame(slot4, cc.SpriteFrameCache.getInstance(slot4))
		slot5 = cc.SpriteFrameCache
		slot6 = slot0.Die[1] .. ".png"
		cc.Sprite.create(slot4).frameDie = cc.SpriteFrameCache.getInstance(slot4).getSpriteFrame(slot4, cc.SpriteFrameCache.getInstance(slot4))
		slot13 = 1.1
		slot17 = 0
		slot13 = cc.FadeTo.create(slot14, cc.FadeTo, 0.216)
		slot18 = 1
		slot7 = cc.EaseExponentialOut.create(cc.EaseExponentialOut, cc.Spawn.create(cc.ScaleTo, cc.Spawn, cc.ScaleTo.create(cc.FadeTo, cc.ScaleTo, 0.216)))

		function slot11()
			if slot0.finishCallback then
				slot2 = slot0.finishCallback

				slot0.finishCallback(slot1)
			end
		end

		cc.Sprite.create(slot4).actionDie = cc.Sequence.create(slot4, cc.Sequence, cc.EaseExponentialOut.create(".png", cc.ScaleTo.create(slot10, cc.ScaleTo, 0.168)), cc.CallFunc.create(cc.EaseExponentialOut, cc.CallFunc))
		slot5 = cc.Sprite.create(slot4).actionDie

		cc.Sprite.create(slot4).actionDie.retain(slot4)
	end

	if slot1 then
		slot5 = slot1

		slot1.retain(slot4)

		slot1.resKey = slot0.Image
		slot1.texture = slot2
		slot1.type = slot0.AniType or DNTGLK_FISH_FILE_TYPE.VAT_SKELETON
		slot1.needFlip = slot0.NeedFlip
		slot1.special = slot0.Special
		slot1.normal = slot0.Normal
		slot1.die = slot0.Die
		slot1.attack = slot0.Attack
		slot1.turn = slot0.Turn
		slot1.needFlipY = slot0.NeedFlipY
		slot1.initRotLeft = slot0.InitRotLeft
		slot1.initRotRight = slot0.InitRotRight
		slot1._setAnimation = slot0.setAnimation
		slot1.setPosition = slot1.setPosition
		slot1.setRotation = slot1.setRotation
		slot7 = 255
		slot1.appearAction = cc.FadeTo.create(slot4, cc.FadeTo, 0.3)
		slot5 = slot1.appearAction

		slot1.appearAction.retain(slot4)

		slot1._destroy = slot0.destroyArmature
	end

	return slot1
end

slot0.destroyArmature = function (slot0)
	if slot0.type == DNTGLK_FISH_FILE_TYPE.VAT_SKELETON then
	elseif slot0.type == DNTGLK_FISH_FILE_TYPE.VAT_3D then
		if slot0.actionNormal then
			slot3 = slot0.actionNormal

			slot0.actionNormal.release(slot2)
		end

		if slot0.actionSpecial then
			slot3 = slot0.actionSpecial

			slot0.actionSpecial.release(slot2)
		end

		if slot0.actionTurn then
			slot3 = slot0.actionTurn

			slot0.actionTurn.release(slot2)
		end

		if slot0.actionDie then
			slot3 = slot0.actionDie

			slot0.actionDie.release(slot2)
		end

		if slot0.actionAttack then
			for slot4 = 1, #slot0.actionAttack, 1 do
				slot7 = slot0.actionAttack[slot4]

				slot0.actionAttack[slot4].release(slot6)
			end
		end
	elseif slot0.type == DNTGLK_FISH_FILE_TYPE.VAT_FRAME then
		if slot0.actionNormal then
			slot3 = slot0.actionNormal

			slot0.actionNormal.release(slot2)
		end

		if slot0.actionSpecial then
			slot3 = slot0.actionSpecial

			slot0.actionSpecial.release(slot2)
		end

		if slot0.actionTurn then
			slot3 = slot0.actionTurn

			slot0.actionTurn.release(slot2)
		end

		if slot0.actionDie then
			slot3 = slot0.actionDie

			slot0.actionDie.release(slot2)
		end
	elseif slot0.type == DNTGLK_FISH_FILE_TYPE.VAT_SPRITE and slot0.actionDie then
		slot3 = slot0.actionDie

		slot0.actionDie.release(slot2)
	end

	slot3 = slot0.appearAction

	slot0.appearAction.release(slot2)

	slot3 = slot0

	slot0.release(slot2)
end

slot0.createFrameAction = function (slot0, slot1, slot2)
	slot3 = {}
	slot4, slot5 = nil

	if slot1 then
		slot9 = cc.AnimationCache
		slot10 = slot0 .. slot1[1]

		if not cc.AnimationCache.getInstance(slot8).getAnimation(slot8, cc.AnimationCache.getInstance(slot8)) then
			slot8 = {}

			for slot12 = slot1[2], slot1[3], 1 do
				slot15 = cc.SpriteFrameCache
				slot15 = cc.SpriteFrameCache.getInstance(slot14)
				slot20 = slot12
				slot8[#slot8 + 1] = cc.SpriteFrameCache.getInstance(slot14).getSpriteFrame(slot14, string.format(slot17, "%s_%d.png", slot0))
			end

			slot12 = slot8
			slot12 = 1

			cc.Animation.createWithSpriteFrames(slot10, cc.Animation).setLoops(slot10, slot7)

			slot12 = slot1[4] or 0.033

			cc.Animation.createWithSpriteFrames(slot10, cc.Animation).setDelayPerUnit(slot10, cc.Animation.createWithSpriteFrames(slot10, cc.Animation))

			slot12 = false

			slot7.setRestoreOriginalFrame(slot10, slot7)

			slot11 = cc.AnimationCache
			slot13 = slot6

			cc.AnimationCache.getInstance(slot10).addAnimation(slot10, cc.AnimationCache.getInstance(slot10), slot7)
		end

		slot11 = slot7
		slot4 = cc.Animate.create(slot9, cc.Animate)

		if slot1[5] then
			slot12 = slot1[5]
			slot4 = cc.Repeat.create(slot9, cc.Repeat, slot4)
		end
	end

	if slot4 then
		slot3[#slot3 + 1] = slot4
	end

	if slot2 then
		slot3[#slot3 + 1] = slot2
	end

	if #slot3 > 0 then
		function slot10(slot0)
			if slot0.finishCallback then
				slot3 = slot0

				slot0.finishCallback(slot2)
			end
		end

		slot7 = cc.CallFunc.create(slot8, cc.CallFunc)
		slot3[#slot3 + 1] = slot7
		slot9 = slot3
		slot9 = 7161

		cc.Sequence.create(slot7, cc.Sequence).setTag(slot7, slot5)

		slot8 = cc.Sequence.create(slot7, cc.Sequence)

		cc.Sequence.create(slot7, cc.Sequence).retain(slot7)
	end

	return slot5
end

slot0.createAnimate3D = function (slot0, slot1, slot2)
	slot3 = {}
	slot4, slot5 = nil

	if slot1 then
		slot12 = slot0
		slot12 = 30
		slot9 = slot1[4] or 1

		cc.Animate3D.createWithFrames(slot7, cc.Animate3D, cc.Animation3D.create(slot10, cc.Animation3D), slot1[1], slot1[2]).setSpeed(slot7, cc.Animate3D.createWithFrames(slot7, cc.Animate3D, cc.Animation3D.create(slot10, cc.Animation3D), slot1[1], slot1[2]))
	end

	if slot1 and slot1[3] then
		slot9 = slot4
		slot9 = 7161

		cc.RepeatForever.create(slot7, cc.RepeatForever).setTag(slot7, slot5)

		slot8 = cc.RepeatForever.create(slot7, cc.RepeatForever)

		cc.RepeatForever.create(slot7, cc.RepeatForever).retain(slot7)
	else
		if slot4 then
			slot3[#slot3 + 1] = slot4
		end

		if slot2 then
			slot3[#slot3 + 1] = slot2
		end

		if #slot3 > 0 then
			slot9 = slot3
			slot6 = cc.Sequence.create(slot7, cc.Sequence)
			slot15 = slot6
			slot13 = slot6.getDuration(slot14) - 0.036
			slot10 = cc.DelayTime.create(slot11, cc.DelayTime)

			function slot14(slot0)
				if slot0.finishCallback then
					slot3 = slot0

					slot0.finishCallback(slot2)
				end
			end

			slot12 = cc.Sequence.create(cc.Sequence, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc))
			slot11 = 7161

			cc.Spawn.create(cc.Sequence, cc.Spawn, slot6).setTag(cc.Sequence, slot5)

			slot10 = cc.Spawn.create(cc.Sequence, cc.Spawn, slot6)

			cc.Spawn.create(cc.Sequence, cc.Spawn, slot6).retain(cc.Sequence)
		end
	end

	return slot5
end

slot0.dummyFunc = function ()
	return
end

slot0.setAnimation = function (slot0, slot1, slot2, slot3, slot4)
	if slot0.type == DNTGLK_FISH_FILE_TYPE.VAT_SKELETON then
		if not slot2 and slot3 then
			slot9 = sp.EventType.ANIMATION_COMPLETE

			slot0.registerSpineEventHandler(slot6, slot0, slot3)
		end

		if slot1 == "special" then
			slot10 = slot2

			slot0.setAnimation(slot6, slot0, 0, slot0.special[1])

			slot8 = 1

			slot0.setTimeScale(slot6, slot0)
		elseif slot1 == "normal" then
			slot10 = true

			slot0.setAnimation(slot6, slot0, 0, slot0.normal[1])

			slot8 = slot0.normal[3] or 1

			slot0.setTimeScale(slot6, slot0)
		elseif slot1 == "turn" then
			slot10 = slot2

			slot0.setAnimation(slot6, slot0, 0, slot0.turn[1])

			slot8 = 1

			slot0.setTimeScale(slot6, slot0)
		elseif slot1 == "die" then
			slot5 = slot0.die and slot0.die[1]
			slot6 = slot0.getScaleX(slot7) * ((slot0.die and slot0.die[3] and slot0.die[3]) or 1)
			slot9 = slot0
			slot7 = slot0:getScaleY() * ((slot0.die and slot0.die[3] and slot0.die[3]) or 1)

			if not slot0._shadow then
				slot10 = slot0
				slot15 = 255

				slot0.setColor(slot9, cc.c3b(slot12, 255, 255))

				slot11 = 999

				slot0.setLocalZOrder(slot9, slot0)
			end

			slot11 = slot6

			slot0.setScaleX(slot9, slot0)

			slot11 = slot7

			slot0.setScaleY(slot9, slot0)

			if slot0.die then
				slot13 = slot2

				slot0.setAnimation(slot9, slot0, 0, slot5)

				slot11 = 1

				slot0.setTimeScale(slot9, slot0)
			else
				slot10 = slot0
				slot15 = 0

				slot0.runAction(slot9, cc.FadeTo.create(slot12, cc.FadeTo, 0.3))
			end
		end
	elseif slot0.type == DNTGLK_FISH_FILE_TYPE.VAT_3D then
		slot8 = 7161

		slot0.stopActionByTag(slot6, slot0)

		slot5 = nil

		if slot1 == "special" then
			slot5 = slot0.actionSpecial
			slot0.finishCallback = slot3
		elseif slot1 == "normal" then
			slot5 = slot0.actionNormal
			slot0.finishCallback = slot0.normalRepeat
		elseif slot1 == "die" then
			slot9 = 0

			slot0.actionDie.setTag(slot7, slot0.actionDie)

			slot0.finishCallback = slot3

			if not slot0._shadow then
				slot8 = slot0
				slot13 = 255

				slot0.setColor(slot7, cc.c3b(slot10, 255, 255))

				slot9 = 999

				slot0.setLocalZOrder(slot7, slot0)
			end
		elseif slot1 == "attack" then
			slot0.finishCallback = slot3

			if slot0.actionAttack then
				if not slot4 or not slot4 then
					slot9 = #slot0.actionAttack
					slot6 = math.random(slot7, 1)
				end

				slot5 = slot0.actionAttack[slot6]
			end
		end

		slot9 = slot5

		slot0.runAction(slot7, slot0)

		slot9 = 0

		slot5.step(slot7, slot5)
	elseif slot0.type == DNTGLK_FISH_FILE_TYPE.VAT_FRAME then
		slot8 = 7161

		slot0.stopActionByTag(slot6, slot0)

		slot5 = nil

		if slot1 == "special" then
			if slot0.actionSpecial then
				slot0.finishCallback = slot3
				slot5 = slot0.actionSpecial
			end
		elseif slot1 == "normal" then
			if slot0.actionNormal then
				slot0.finishCallback = slot0.normalRepeat
				slot5 = slot0.actionNormal
			end
		elseif slot1 == "turn" then
			if slot0.actionTurn then
				slot0.finishCallback = slot3
				slot5 = slot0.actionTurn
			end
		elseif slot1 == "die" and slot0.actionDie then
			slot6 = slot0.getScaleX(slot7) * ((slot0.die and slot0.die[6] and slot0.die[6]) or 1)
			slot9 = slot0
			slot7 = slot0:getScaleY() * ((slot0.die and slot0.die[6] and slot0.die[6]) or 1)

			if not slot0._shadow then
				slot10 = slot0
				slot15 = 255

				slot0.setColor(slot9, cc.c3b(slot12, 255, 255))

				slot11 = 999

				slot0.setLocalZOrder(slot9, slot0)
			end

			slot11 = slot6

			slot0.setScaleX(slot9, slot0)

			slot11 = slot7

			slot0.setScaleY(slot9, slot0)

			slot0.finishCallback = slot3
			slot5 = slot0.actionDie
		end

		slot9 = slot5

		slot0.runAction(slot7, slot0)
	elseif slot0.type == DNTGLK_FISH_FILE_TYPE.VAT_SPRITE then
		if slot1 == "normal" then
			slot8 = slot0.frameNormal

			slot0.setSpriteFrame(slot6, slot0)
		elseif slot1 == "die" then
			slot8 = slot0.frameDie

			slot0.setSpriteFrame(slot6, slot0)

			slot8 = 0.95

			slot0.setScale(slot6, slot0)

			slot8 = slot0.actionDie

			slot0.runAction(slot6, slot0)

			slot0.finishCallback = slot3
		end
	end
end

slot0.normalRepeat = function (slot0)
	slot4 = 7161

	slot0.stopActionByTag(slot2, slot0)

	slot4 = slot0.actionNormal

	slot0.runAction(slot2, slot0)
end

slot0.initArmature = function (slot0, slot1, slot2, slot3)
	slot7 = (slot1.Scale or 1) * slot0.textureEnlargeRate

	slot0.setScale(slot5, slot0)

	slot7 = true

	slot0.setVisible(slot5, slot0)

	slot7 = 255

	slot0.setOpacity(slot5, slot0)

	slot7 = 0

	slot0.setSkewX(slot5, slot0)

	slot0.lastDirection = 0
	slot0.flip = false
	slot0.direction = slot1.Direction or 0
	slot0.offsetX = slot1.OffestX or 0
	slot0.offsetY = slot1.OffestY or 0
	slot0._postOffsetX = slot1.PostOffestX or 0
	slot0._postOffsetY = slot1.PostOffestY or 0
	slot0.scale = slot1.Scale or 1
	slot0.target = slot0
	slot0.zOrder = slot1.ZOrder
	slot0.offsetBuffX = 0
	slot0.offsetBuffY = 0
	slot0.normal = slot1.Normal
	slot0.die = slot1.Die
	slot0.inTurn = false
	slot0.positionZ = slot1.PositionZ
	slot6 = slot0
	slot0.originalScaleY = slot0.getScale(slot5)

	if slot0.registerSpineEventHandler then
		slot8 = sp.EventType.ANIMATION_COMPLETE

		slot0.registerSpineEventHandler(slot5, slot0, slot0.dummyFunc)
	end

	if slot3 then
		slot6 = slot0
		slot11 = 30

		slot0.setColor(slot5, cc.c3b(slot8, 0, 0))

		slot7 = 107.1

		slot0.setOpacity(slot5, slot0)

		slot0._shadow = true

		if slot0.type == DNTGLK_FISH_FILE_TYPE.VAT_3D then
			slot7 = slot0.positionZ - 300

			slot0.setPositionZ(slot5, slot0)
		end
	else
		slot6 = slot0
		slot11 = 255

		slot0.setColor(slot5, cc.c3b(slot8, 255, 255))

		slot7 = 255

		slot0.setOpacity(slot5, slot0)

		slot0._shadow = false

		if slot0.type == DNTGLK_FISH_FILE_TYPE.VAT_3D then
			slot7 = slot0.positionZ

			slot0.setPositionZ(slot5, slot0)
		end
	end

	slot8 = true

	slot0.setAnimation(slot5, slot0, "normal")

	if slot2 then
		slot9 = (TimeApi.getSystemTime() - slot0.startTime) % (slot0.normal[2] * 33) / 1000

		slot0.update(slot7, slot0)
	end
end

slot0.renderObjectBuilder = function (slot0, slot1, slot2, slot3)
	slot4 = slot3 or {}
	slot7 = slot1

	if slot1.GetVisualData(slot6) then
		slot1.noRotation = slot5.NoRotation
		slot8 = slot5.Live

		for slot9, slot10 in ipairs(slot7) do
			slot16 = slot10

			if slot0._pool.getObject(slot12, slot0._pool, slot10.Image, slot0.genArmature) then
				slot16 = slot1.bTroop

				slot0.initArmature(slot13, slot11, slot10)

				slot11.zOrder = slot11.zOrder or slot5.Id + slot9
				slot4[#slot4 + 1] = slot11
			end
		end

		if not slot5.NoShadow and not slot2 then
			slot12 = slot5.Live[1]

			if slot0._pool.getObject(slot8, slot0._pool, slot5.Live[1].Image, slot0.genArmature) then
				slot13 = true

				slot0.initArmature(slot9, slot7, slot6, slot1.bTroop)

				slot7._postOffsetY = slot5.ShadowOffsetY or 20
				slot7._postOffsetX = slot5.ShadowOffsetX or -20
				slot11 = slot5.ShadowSkewX or 0

				slot7.setSkewX(slot9, slot7)

				slot10 = slot7
				slot8 = slot7.setScaleY

				if not slot5.ShadowScaleY or not (slot5.ShadowScaleY * slot7.textureEnlargeRate) then
					slot13 = slot7
					slot11 = slot7.getScaleY(slot12)
				end

				slot8(slot9, slot10)

				slot4[#slot4 + 1] = slot7
			end
		end
	end

	return slot4
end

slot0.removeCallback = function (slot0, slot1, slot2)
	if slot1 == ccs.MovementEventType.complete then
		slot5 = slot0

		slot0.removeFromParent(slot4)
	end
end

slot0.updateAction = function (slot0, slot1)
	if slot0.currentAction then
		slot5 = slot1

		slot0.currentAction.step(slot3, slot0.currentAction)
	end

	slot5 = slot1

	slot0.update(slot3, slot0)
end

slot0.generateRenderObjects = function (slot0, slot1)
	slot2 = slot1.GetType(slot3)
	slot8 = slot1.m_pVisualNodeList
	slot6 = slot0.renderObjectBuilder(slot1, slot0, slot1, DntglkController.lowQuality == "ON")

	for slot7, slot8 in pairs(slot5) do
		if slot8._shadow then
			slot9 = (slot8.type == DNTGLK_FISH_FILE_TYPE.VAT_3D and slot0.m_pLayerFish) or slot0.m_pLayerFishyy
			slot12 = slot8

			if slot8.getParent(slot11) then
				slot12 = slot8.resKey

				dump(slot11)
			end

			slot14 = 0

			slot9.addChild(slot11, slot9, slot8)

			if slot2 == DNTGLK_OBJ_TYPE.EOT_FISH then
				slot13 = 0

				slot8.setOpacity(slot11, slot8)

				slot14 = 107.1

				slot8.appearAction.initWithDuration(slot11, slot8.appearAction, 0.4)

				slot13 = slot8.appearAction

				slot8.runAction(slot11, slot8)
			end
		else
			slot11 = slot1
			slot9 = (slot1.GetType(slot10) == DNTGLK_OBJ_TYPE.EOT_FISH and slot0.m_pLayerFish) or slot0.m_pLayerBullet
			slot12 = slot8

			if slot8.getParent(slot11) then
				slot12 = slot8.resKey

				dump(slot11)
			end

			slot14 = slot8.zOrder

			slot9.addChild(slot11, slot9, slot8)

			if slot2 == DNTGLK_OBJ_TYPE.EOT_FISH then
				slot13 = 0

				slot8.setOpacity(slot11, slot8)

				slot14 = 255

				slot8.appearAction.initWithDuration(slot11, slot8.appearAction, 0.4)

				slot13 = slot8.appearAction

				slot8.runAction(slot11, slot8)
			end
		end
	end

	return slot3
end

return slot0
