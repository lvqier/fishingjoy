function slot3()
	return display.newLayer()
end

slot0 = class(slot1, "FishingJoyCreateEntity")

slot0.ctor = function (slot0)
	slot0.fishLayer = display.newLayer()
	slot4 = "fishLayer"

	slot0.fishLayer.setName(slot2, slot0.fishLayer)

	slot5 = 1

	slot0.addChild(slot2, slot0, slot0.fishLayer)

	slot0.fishShadowLayer = display.newLayer()
	slot4 = "fishShadowLayer"

	slot0.fishShadowLayer.setName(slot2, slot0.fishShadowLayer)

	slot5 = 0

	slot0.addChild(slot2, slot0, slot0.fishShadowLayer)

	slot0.bulletLayer = display.newLayer()
	slot4 = "bulletLayer"

	slot0.bulletLayer.setName(slot2, slot0.bulletLayer)

	slot5 = 7

	slot0.addChild(slot2, slot0, slot0.bulletLayer)

	slot0.fishingNetLayer = display.newLayer()
	slot4 = "fishingNetLayer"

	slot0.fishingNetLayer.setName(slot2, slot0.fishingNetLayer)

	slot5 = 8

	slot0.addChild(slot2, slot0, slot0.fishingNetLayer)
end

slot0.newFish = function (slot0, slot1, slot2)
	slot3 = false
	slot4 = ""
	slot5 = slot1.entitySpecial
	slot9 = slot1
	slot7 = slot1:getEntityRenderId()

	if slot1.getEntityStatus(slot7) == FISHINGJOY_ENTITY_STATUS.LIVE or slot6 == FISHINGJOY_ENTITY_STATUS.HIT then
		slot3 = false
		slot4 = "living"
	elseif slot6 == FISHINGJOY_ENTITY_STATUS.DEAD then
		slot3 = true
		slot4 = "death"
	end

	slot10 = slot1

	if slot1.getFishRenderData(slot9) ~= nil then
		slot9 = (slot3 and slot8.entityLiveData) or slot8.entityLiveData
		slot10 = nil
		slot11 = {}
		slot14 = "component.entityPool.EntityPoolMgr"
		slot14 = FishingJoyRequireLua(slot13)
		slot15 = slot7 .. slot4

		if FishingJoyRequireLua(slot13).getInstance(slot13).getFishCocosTarget(slot13, FishingJoyRequireLua(slot13).getInstance(slot13)) == nil or slot12.cocosTarget == nil then
			slot15 = cc.Node
			slot10 = cc.Node.create(slot14)
			slot13 = ipairs
			slot15 = slot9 or {}

			for slot16, slot17 in slot13(slot14) do
				slot18 = nil

				if slot17.entityAniType == FISHINGJOY_ENTITY_TYPE.PLIST then
					slot22 = cc.SpriteFrameCache
					slot23 = slot19 .. ".plist"

					cc.SpriteFrameCache.getInstance("/").addSpriteFrames("/", cc.SpriteFrameCache.getInstance("/"))

					if slot17.onlySpriteShow ~= true then
						slot22 = cc.Sprite
						slot26 = "01"
						slot18 = cc.Sprite.createWithSpriteFrameName(slot21, string.format(slot24, slot17.entityFrameName))

						if slot3 then
							slot23 = slot17.entityScale * 2

							slot18.setScale(slot21, slot18)

							slot27 = 30
							slot28 = 0
							slot29 = -30
							slot25 = cc.RotateTo.create(cc.RotateTo, cc.RotateTo, 0.05)
							slot30 = 0
							slot24 = cc.Sequence.create(slot21, cc.Sequence, cc.RotateTo.create(slot24, cc.RotateTo, 0.05), cc.RotateTo.create(cc.RotateTo, cc.RotateTo, 0.05), cc.RotateTo.create(cc.RotateTo, cc.RotateTo, 0.05))
							slot25 = cc.RepeatForever.create(cc.Sequence, cc.RepeatForever)

							slot18.runAction(cc.RepeatForever, slot18)
						else
							slot22 = cc.AnimationCache
							slot23 = slot17.entityName

							if cc.AnimationCache.getInstance(slot21).animationByName(slot21, cc.AnimationCache.getInstance(slot21)) == nil then
								slot21 = {}

								for slot25 = 1, slot17.entityFrameCount, 1 do
									slot28 = cc.SpriteFrameCache
									slot28 = cc.SpriteFrameCache.getInstance(slot27)
									slot31 = slot17.entityFrameName
									slot35 = 2
									slot21[slot25] = cc.SpriteFrameCache.getInstance(slot27).spriteFrameByName(slot27, string.format(slot30, StringUtil.int2StringKeepBits(slot33, slot25)))
								end

								slot26 = slot17.entityFrameDelay
								slot24 = cc.AnimationCache
								slot26 = slot17.entityName

								cc.AnimationCache.getInstance(slot23).addAnimation(slot23, cc.AnimationCache.getInstance(slot23), cc.Animation.createWithSpriteFrames(slot23, cc.Animation, slot21))
							end

							slot24 = slot20
							slot25 = slot17.entityScale

							slot18.setScale(cc.Animate, slot18)

							slot24 = slot18
							slot28 = cc.Animate.create(slot22, cc.Animate)

							slot18.runAction(cc.Animate, cc.RepeatForever.create(slot26, cc.RepeatForever))
						end
					else
						slot23 = slot17.entityFrameName
						slot22 = cc.Sprite.createWithSpriteFrameName(slot21, cc.Sprite)
						slot25 = cc.RepeatForever
						slot28 = cc.Sequence
						slot33 = 20

						cc.Sprite.createWithSpriteFrameName(slot21, cc.Sprite).runAction(slot21, cc.RepeatForever.create(slot24, cc.Sequence.create(slot27, cc.RotateBy.create(slot30, cc.RotateBy, 0.2))))
					end
				end

				slot22 = display.CENTER

				slot18.setAnchorPoint(slot20, slot18)

				slot21 = slot18
				slot25 = slot17.entityOffsetY

				slot18.setPosition(slot20, cc.p(slot23, slot17.entityOffsetX))

				slot22 = slot17.entityDirection

				slot18.setRotation(slot20, slot18)

				slot22 = slot18

				slot10.addChild(slot20, slot10)
			end

			if FISHINGJOY_ENTITY_SAME_ZORDER == true then
				slot17 = FishingJoy_FishRender[renderValue.entityName]

				slot0.fishLayer.addChild(slot14, slot0.fishLayer, slot10)
			else
				slot17 = slot7

				slot0.fishLayer.addChild(slot14, slot0.fishLayer, slot10)
			end
		else
			slot12.cocosTarget.setVisible(slot14, slot10)

			slot13 = pairs
			slot17 = slot12.cocosTarget
			slot15 = slot12.cocosTarget.getChildren(true) or {}

			for slot16, slot17 in slot13(slot14) do
				if slot17 then
					slot20 = slot17

					slot17.resume(slot19)
				end
			end

			if FISHINGJOY_ENTITY_SAME_ZORDER == true then
				slot16 = FishingJoy_FishRender[renderValue.entityName]

				slot10.setLocalZOrder(slot14, slot10)
			else
				slot16 = slot7

				slot10.setLocalZOrder(slot14, slot10)
			end
		end

		if slot5 then
			slot13 = pairs
			slot17 = slot10
			slot15 = slot10.getChildren(slot16) or {}

			for slot16, slot17 in slot13(slot14) do
				if slot17 then
					slot20 = slot17
					slot25 = 0

					slot17.setColor(slot19, cc.c3b(slot22, 255, 0))
				end
			end

			slot11.entitySpecial = true
		else
			slot13 = pairs
			slot17 = slot10
			slot15 = slot10.getChildren(slot16) or {}

			for slot16, slot17 in slot13(slot14) do
				if slot17 then
					slot20 = slot17
					slot25 = 255

					slot17.setColor(slot19, cc.c3b(slot22, 255, 255))
				end
			end

			slot11.entitySpecial = false
		end

		slot11.cocosTarget = slot10
		slot11.entityId = slot7
		slot11.entityNode = slot1
		slot11.entityScale = 1
		slot11.entityShadow = false
		slot16 = 0
		slot11.entityOffset = cc.p(slot14, 0)
		slot11.entityDirection = 0
		slot11.entityFlagInPool = slot7 .. slot4
		slot11.entityNeedAlwayUp = slot8.entityNeedAlwayUp
		slot2[#slot2 + 1] = slot11

		if FISHINGJOY_ANDROID_PLATFORM then
			return slot2
		end

		if slot8.entityShadow ~= nil then
			slot14 = ipairs
			slot16 = (slot3 and slot8.entityShadow.entityDieData) or slot8.entityShadow.entityLiveData or {}

			for slot17, slot18 in slot14(slot15) do
				slot19 = {}
				slot20 = nil

				if slot18.entityAniType == FISHINGJOY_ENTITY_TYPE.FRAME then
					slot24 = ccs.ArmatureDataManager
					slot25 = slot21 .. ".ExportJson"

					ccs.ArmatureDataManager.getInstance("/").addArmatureFileInfo("/", ccs.ArmatureDataManager.getInstance("/"))

					slot25 = slot18.entityName

					if ccs.Armature.create("/", ccs.Armature) ~= nil then
						slot24 = slot20

						if slot20.getAnimation(slot23) ~= nil then
							slot24 = slot20
							slot27 = (slot3 and {
								0
							}) or {
								-1
							}[1]

							slot20.getAnimation(slot23).play(slot23, slot20.getAnimation(slot23), slot18.entityAniName, -1)

							if slot3 == true then
								slot25 = slot20

								function slot26(slot0, slot1, slot2)
									if slot1 == ccs.MovementEventType.complete then
										slot6 = false

										slot0.setVisible(slot4, slot0)
									end
								end

								slot20.getAnimation(slot24).setMovementEventCallFunc(slot24, slot20.getAnimation(slot24))
							end
						end
					end
				elseif slot18.entityAniType == FISHINGJOY_ENTITY_TYPE.SKELETON then
					slot27 = 1

					if sp.SkeletonAnimation.create("/", sp.SkeletonAnimation, slot21 .. ".json", slot21 .. ".atlas") ~= nil then
						slot27 = (slot3 and {
							false
						}) or {
							true
						}[1]

						slot20.setAnimation(slot23, slot20, 0, slot18.entityAniName)
					end
				elseif slot18.entityAniType == FISHINGJOY_ENTITY_TYPE.SKELETON_BINARY then
					slot27 = 1

					if sp.SkeletonAnimation.createWithBinaryFile("/", sp.SkeletonAnimation, slot21 .. ".skel", slot21 .. ".atlas") ~= nil then
						slot27 = (slot3 and {
							false
						}) or {
							true
						}[1]

						slot20.setAnimation(slot23, slot20, 0, slot18.entityAniName)
					end
				end

				slot24 = slot18.entityScale

				slot20.setScale(slot22, slot20)

				slot24 = display.CENTER

				slot20.setAnchorPoint(slot22, slot20)

				if FISHINGJOY_SHADOW_SAME_ZORDER == false then
					slot25 = slot7

					slot0.fishShadowLayer.addChild(slot22, slot0.fishShadowLayer, slot20)
				else
					slot25 = 0

					slot0.fishShadowLayer.addChild(slot22, slot0.fishShadowLayer, slot20)
				end

				slot19.entityDirection = slot18.entityDirection
				slot19.entityShadow = true
				slot24 = slot18.entityOffsetY
				slot19.entityOffset = cc.p(slot22, slot18.entityOffsetX)
				slot19.entityScale = slot18.entityScale
				slot19.cocosTarget = slot20
				slot2[#slot2 + 1] = slot19
			end
		end
	end

	return slot2
end

slot0.newBullet = function (slot0, slot1, slot2)
	slot3 = false
	slot6 = slot1

	if slot1.getEntityStatus(slot5) == FISHINGJOY_ENTITY_STATUS.LIVE or slot4 == FISHINGJOY_ENTITY_STATUS.HIT then
		slot3 = false
	elseif slot4 == FISHINGJOY_ENTITY_STATUS.DEAD then
		slot3 = true
	end

	slot7 = slot1
	slot6 = (slot3 == false and slot1.getCannonConfig(slot6).bullet) or slot1.getCannonConfig(slot6).fishingNet

	if slot6 ~= nil then
		slot7 = pairs
		slot9 = slot6 or {}

		for slot10, slot11 in slot7(slot8) do
			slot12 = {}
			slot13, slot14 = nil

			if slot3 == true then
				slot17 = "component.entityPool.EntityPoolMgr"
				slot17 = FishingJoyRequireLua(slot16)
				slot18 = slot11.entityName
				slot14 = FishingJoyRequireLua(slot16).getInstance(slot16).getFishingNetCocosTarget(slot16, FishingJoyRequireLua(slot16).getInstance(slot16))
			elseif slot3 == false then
				slot17 = "component.entityPool.EntityPoolMgr"
				slot17 = FishingJoyRequireLua(slot16)
				slot18 = slot11.entityName
				slot14 = FishingJoyRequireLua(slot16).getInstance(slot16).getBulletCocosTarget(slot16, FishingJoyRequireLua(slot16).getInstance(slot16))
			end

			if slot14 == nil or slot14.cocosTarget == nil then
				if slot11.entityAniType == FISHINGJOY_ENTITY_TYPE.FRAME then
					slot17 = ccs.ArmatureDataManager
					slot18 = slot11.entityResPath .. ".ExportJson"

					ccs.ArmatureDataManager.getInstance(slot16).addArmatureFileInfo(slot16, ccs.ArmatureDataManager.getInstance(slot16))

					slot18 = slot11.entityName

					if ccs.Armature.create(slot16, ccs.Armature) ~= nil then
						slot18 = slot11.entityScale

						slot13.setScale(slot16, slot13)

						slot17 = slot13
						slot20 = (slot3 and {
							0
						}) or {
							-1
						}[1]

						slot13.getAnimation(slot16).play(slot16, slot13.getAnimation(slot16), slot11.entityAniName, -1)

						if slot3 == true then
							slot18 = slot13

							function slot19(slot0, slot1, slot2)
								if slot1 == ccs.MovementEventType.complete then
									slot6 = false

									slot0.setVisible(slot4, slot0)
								end
							end

							slot13.getAnimation(slot17).setMovementEventCallFunc(slot17, slot13.getAnimation(slot17))
						end
					end
				elseif slot11.entityAniType == FISHINGJOY_ENTITY_TYPE.SKELETON then
					slot20 = 1

					if sp.SkeletonAnimation.create(slot16, sp.SkeletonAnimation, slot11.entityResPath .. ".json", slot11.entityResPath .. ".atlas") ~= nil then
						slot20 = (slot3 == true and {
							false
						}) or {
							true
						}[1]

						slot13.setAnimation(slot16, slot13, 0, slot11.entityAniName)
					end
				elseif slot11.entityAniType == FISHINGJOY_ENTITY_TYPE.SKELETON_BINARY then
					slot20 = 1

					if sp.SkeletonAnimation.createWithBinaryFile(slot16, sp.SkeletonAnimation, slot11.entityResPath .. ".skel", slot11.entityResPath .. ".atlas") ~= nil then
						slot20 = (slot3 == true and {
							false
						}) or {
							true
						}[1]

						slot13.setAnimation(slot16, slot13, 0, slot11.entityAniName)
					end
				end

				slot18 = slot11.entityScale

				slot13.setScale(slot16, slot13)

				slot18 = display.CENTER

				slot13.setAnchorPoint(slot16, slot13)

				if slot3 == true then
					slot19 = slot11.entityZOrder

					slot0.fishingNetLayer.addChild(slot16, slot0.fishingNetLayer, slot13)
				else
					slot19 = slot11.entityZOrder

					slot0.bulletLayer.addChild(slot16, slot0.bulletLayer, slot13)
				end
			else
				slot13 = slot14.cocosTarget

				if slot11.entityAniType == FISHINGJOY_ENTITY_TYPE.FRAME then
					slot17 = slot13
					slot20 = (slot3 and {
						0
					}) or {
						-1
					}[1]

					slot13.getAnimation(slot16).play(slot16, slot13.getAnimation(slot16), slot11.entityAniName, -1)
				else
					slot20 = (slot3 == true and {
						false
					}) or {
						true
					}[1]

					slot13.setAnimation(slot16, slot13, 0, slot11.entityAniName)
				end

				slot18 = true

				slot13.setVisible(slot16, slot13)

				slot18 = slot11.entityZOrder

				slot13.setLocalZOrder(slot16, slot13)
			end

			slot12.entityDirection = 0
			slot18 = 0
			slot12.entityOffset = cc.p(slot16, 0)
			slot12.entityScale = slot11.entityScale
			slot12.cocosTarget = slot13
			slot12.deadStatus = slot3
			slot12.entityFlagInPool = slot11.entityName
			slot2[#slot2 + 1] = slot12
		end
	end

	return slot2
end

slot0.newEntity = function (slot0, slot1, slot2)
	if slot1 == nil then
		return false
	end

	slot5 = slot1

	if slot1.getEntityType(slot4) == FISHINGJOY_ENTITY_TYPE_OBJ.FISH then
		slot8 = slot2

		return slot0.newFish(slot5, slot0, slot1)
	elseif slot3 == FISHINGJOY_ENTITY_TYPE_OBJ.BULLET then
		slot8 = slot2

		return slot0.newBullet(slot5, slot0, slot1)
	end

	return true
end

return slot0
