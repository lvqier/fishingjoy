slot2 = "dntgtest.fishConfig.Dntgtest_RenderOrder"

requireLuaFromModule(slot1)

function slot3()
	return display.newLayer()
end

slot0 = class(slot1, "FishLayer")
slot3 = "dntgtest.objPoolMgr.objPoolMgr"
slot3 = requireLuaFromModule("FishLayer")
slot1 = requireLuaFromModule("FishLayer").getInstance("FishLayer")

slot0.ctor = function (slot0)
	return
end

slot0.AddFish = function (slot0, slot1, slot2)
	if slot0.m_pLayerFish == nil then
		slot0.m_pLayerFish = display.newLayer()
		slot6 = "m_pLayerFish"

		slot0.m_pLayerFish.setName(slot4, slot0.m_pLayerFish)

		slot7 = 1

		slot0.addChild(slot4, slot0, slot0.m_pLayerFish)
	end

	if slot0.m_pLayerFishyy == nil then
		slot0.m_pLayerFishyy = display.newLayer()
		slot6 = "m_pLayerFishyy"

		slot0.m_pLayerFishyy.setName(slot4, slot0.m_pLayerFishyy)

		slot7 = 0

		slot0.addChild(slot4, slot0, slot0.m_pLayerFishyy)
	end

	slot3 = false
	slot4 = slot1.bSpecialShow
	slot7 = slot1

	if slot1.GetState(slot6) == DNTGTEST_OBJ_STATE.EOS_LIVE or slot5 == DNTGTEST_OBJ_STATE.EOS_HIT then
		slot3 = false
	elseif slot5 == DNTGTEST_OBJ_STATE.EOS_DEAD then
		slot3 = true
	end

	slot8 = slot1

	if slot1.GetVisualData(slot7) ~= nil then
		slot8 = ipairs
		slot10 = (slot3 and slot6.Die) or slot6.Live or {}

		for slot11, slot12 in slot8(slot9) do
			if slot12.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_FRAME then
				slot13 = {}
				slot14 = nil
				slot18 = slot12.Image .. slot12.Name .. slot12.AniType

				if slot0.getOneFishRender(slot16, slot0) == nil or slot15.target == nil then
					slot19 = ccs.ArmatureDataManager
					slot20 = slot16 .. ".ExportJson"

					ccs.ArmatureDataManager.getInstance("/").addArmatureFileInfo("/", ccs.ArmatureDataManager.getInstance("/"))

					slot20 = slot12.Image
					slot20 = display.CENTER

					ccs.Armature.create("/", ccs.Armature).setAnchorPoint("/", slot14)

					slot20 = slot12.Scale

					ccs.Armature.create("/", ccs.Armature).setScale("/", ccs.Armature.create("/", ccs.Armature))

					if DNTGTEST_SAME_ZORDER_FISH == true then
						slot21 = Dntgtest_RenderOrder[slot12.Image] + slot11

						slot0.m_pLayerFish.addChild(slot18, slot0.m_pLayerFish, slot14)
					else
						slot21 = slot6.Id + slot11

						slot0.m_pLayerFish.addChild(slot18, slot0.m_pLayerFish, slot14)
					end
				else
					slot19 = slot12.Scale

					slot15.target.setScale(slot17, slot14)

					slot19 = true

					slot15.target.setVisible(slot17, slot15.target)

					if DNTGTEST_SAME_ZORDER_FISH == true then
						slot19 = Dntgtest_RenderOrder[slot12.Image] + slot11

						slot14.setLocalZOrder(slot17, slot14)
					else
						slot19 = slot6.Id + slot11

						slot14.setLocalZOrder(slot17, slot14)
					end
				end

				if slot14 ~= nil then
					slot18 = slot14
					slot21 = (slot3 and {
						0
					}) or {
						-1
					}[1]

					slot14.getAnimation(slot17).play(slot17, slot14.getAnimation(slot17), slot12.Name, -1)

					if slot3 == true then
						slot19 = slot14

						function slot20(slot0, slot1, slot2)
							if slot1 == ccs.MovementEventType.complete then
								slot6 = false

								slot0.setVisible(slot4, slot0)
							end
						end

						slot14.getAnimation(slot18).setMovementEventCallFunc(slot18, slot14.getAnimation(slot18))
					end

					if slot4 then
						slot18 = slot14
						slot23 = 0

						slot14.setColor(slot17, cc.c3b(slot20, 255, 0))

						slot13.bSpecialShow = true
					else
						slot18 = slot14
						slot23 = 255

						slot14.setColor(slot17, cc.c3b(slot20, 255, 255))

						slot13.bSpecialShow = false
					end

					slot13.direction = slot12.Direction
					slot13.offsetX = slot12.OffestX
					slot13.offsetY = slot12.OffestY
					slot13.scale = slot12.Scale
					slot13.target = slot14
					slot13.logicNode = slot1
					slot13.id = slot6.Id
					slot13.yinying = false
					slot13.poolFlag = slot12.Image .. slot12.Name .. slot12.AniType
					slot2[#slot2 + 1] = slot13
				end
			elseif slot12.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_SKELETON then
				slot13 = {}
				slot14 = nil
				slot18 = slot12.Image .. slot12.Name .. slot12.AniType

				if slot0.getOneFishRender(slot16, slot0) == nil or slot15.target == nil then
					slot22 = 1
					slot20 = slot12.Scale

					sp.SkeletonAnimation.create("/", sp.SkeletonAnimation, slot16 .. ".json", slot16 .. ".atlas").setScale("/", slot14)

					slot20 = display.CENTER

					sp.SkeletonAnimation.create("/", sp.SkeletonAnimation, slot16 .. ".json", slot16 .. ".atlas").setAnchorPoint("/", sp.SkeletonAnimation.create("/", sp.SkeletonAnimation, slot16 .. ".json", slot16 .. ".atlas"))

					if DNTGTEST_SAME_ZORDER_FISH == true then
						slot21 = Dntgtest_RenderOrder[slot12.Image] + slot11

						slot0.m_pLayerFish.addChild(slot18, slot0.m_pLayerFish, slot14)
					else
						slot21 = slot6.Id + slot11

						slot0.m_pLayerFish.addChild(slot18, slot0.m_pLayerFish, slot14)
					end
				else
					slot19 = slot12.Scale

					slot15.target.setScale(slot17, slot14)

					slot19 = true

					slot15.target.setVisible(slot17, slot15.target)

					if DNTGTEST_SAME_ZORDER_FISH == true then
						slot19 = Dntgtest_RenderOrder[slot12.Image] + slot11

						slot14.setLocalZOrder(slot17, slot14)
					else
						slot19 = slot6.Id + slot11

						slot14.setLocalZOrder(slot17, slot14)
					end
				end

				if slot14 ~= nil then
					slot21 = (slot3 and {
						false
					}) or {
						true
					}[1]

					slot14.setAnimation(slot17, slot14, 0, slot12.Name)

					if slot4 then
						slot18 = slot14
						slot23 = 0

						slot14.setColor(slot17, cc.c3b(slot20, 255, 0))

						slot13.bSpecialShow = true
					else
						slot18 = slot14
						slot23 = 255

						slot14.setColor(slot17, cc.c3b(slot20, 255, 255))

						slot13.bSpecialShow = false
					end

					slot13.direction = slot12.Direction
					slot13.offsetX = slot12.OffestX
					slot13.offsetY = slot12.OffestY
					slot13.scale = slot12.Scale
					slot13.target = slot14
					slot13.logicNode = slot1
					slot13.yinying = false
					slot13.poolFlag = slot12.Image .. slot12.Name .. slot12.AniType
					slot2[#slot2 + 1] = slot13
				end
			elseif slot12.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_SKELETON_BINARY then
				slot13 = {}
				slot14 = nil
				slot18 = slot12.Image .. slot12.Name .. slot12.AniType

				if slot0.getOneFishRender(slot16, slot0) == nil or slot15.target == nil then
					slot22 = 1
					slot20 = slot12.Scale

					sp.SkeletonAnimation.createWithBinaryFile("/", sp.SkeletonAnimation, slot16 .. ".skel", slot16 .. ".atlas").setScale("/", slot14)

					slot20 = display.CENTER

					sp.SkeletonAnimation.createWithBinaryFile("/", sp.SkeletonAnimation, slot16 .. ".skel", slot16 .. ".atlas").setAnchorPoint("/", sp.SkeletonAnimation.createWithBinaryFile("/", sp.SkeletonAnimation, slot16 .. ".skel", slot16 .. ".atlas"))

					if DNTGTEST_SAME_ZORDER_FISH == true then
						slot21 = Dntgtest_RenderOrder[slot12.Image] + slot11

						slot0.m_pLayerFish.addChild(slot18, slot0.m_pLayerFish, slot14)
					else
						slot21 = slot6.Id + slot11

						slot0.m_pLayerFish.addChild(slot18, slot0.m_pLayerFish, slot14)
					end
				else
					slot19 = slot12.Scale

					slot15.target.setScale(slot17, slot14)

					slot19 = true

					slot15.target.setVisible(slot17, slot15.target)

					if DNTGTEST_SAME_ZORDER_FISH == true then
						slot19 = Dntgtest_RenderOrder[slot12.Image] + slot11

						slot14.setLocalZOrder(slot17, slot14)
					else
						slot19 = slot6.Id + slot11

						slot14.setLocalZOrder(slot17, slot14)
					end
				end

				if slot14 ~= nil then
					slot21 = (slot3 and {
						false
					}) or {
						true
					}[1]

					slot14.setAnimation(slot17, slot14, 0, slot12.Name)

					if slot4 then
						slot18 = slot14
						slot23 = 0

						slot14.setColor(slot17, cc.c3b(slot20, 255, 0))

						slot13.bSpecialShow = true
					else
						slot18 = slot14
						slot23 = 255

						slot14.setColor(slot17, cc.c3b(slot20, 255, 255))

						slot13.bSpecialShow = false
					end

					slot13.direction = slot12.Direction
					slot13.offsetX = slot12.OffestX
					slot13.offsetY = slot12.OffestY
					slot13.scale = slot12.Scale
					slot13.target = slot14
					slot13.logicNode = slot1
					slot13.yinying = false
					slot13.poolFlag = slot12.Image .. slot12.Name .. slot12.AniType
					slot2[#slot2 + 1] = slot13
				end
			elseif slot12.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_PARTICLE then
				slot13 = {}
				slot14 = nil
				slot18 = slot12.Image .. slot12.Name .. slot12.AniType

				if slot0.getOneFishRender(slot16, slot0) == nil or slot15.target == nil then
					slot20 = slot16 .. ".plist"
					slot20 = slot12.Scale

					cc.ParticleSystemQuad.create("/", cc.ParticleSystemQuad).setScale("/", cc.ParticleSystemQuad.create("/", cc.ParticleSystemQuad))

					if DNTGTEST_SAME_ZORDER_FISH == true then
						slot21 = Dntgtest_RenderOrder[slot12.Image] + slot11

						slot0.m_pLayerFish.addChild(slot18, slot0.m_pLayerFish, slot14)
					else
						slot21 = slot6.Id + slot11

						slot0.m_pLayerFish.addChild(slot18, slot0.m_pLayerFish, slot14)
					end
				else
					slot19 = true

					slot15.target.setVisible(slot17, slot14)

					slot19 = slot12.Scale

					slot15.target.setScale(slot17, slot15.target)
				end

				slot13.direction = slot12.Direction
				slot13.offsetX = slot12.OffestX
				slot13.offsetY = slot12.OffestY
				slot13.scale = slot12.Scale
				slot13.target = slot14
				slot13.logicNode = slot1
				slot13.yinying = false
				slot13.poolFlag = slot12.Image .. slot12.Name .. slot12.AniType
				slot2[#slot2 + 1] = slot13
			end
		end

		if DNTGTEST_IS_ANDROID_PLATFORM then
			return slot2
		end

		if slot6.yinying ~= nil then
			slot9 = ipairs
			slot11 = (slot3 and slot6.yinying.Die) or slot6.yinying.Live or {}

			for slot12, slot13 in slot9(slot10) do
				if slot13.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_FRAME then
					slot14 = {}
					slot18 = ccs.ArmatureDataManager
					slot19 = slot15 .. ".ExportJson"

					ccs.ArmatureDataManager.getInstance("/").addArmatureFileInfo("/", ccs.ArmatureDataManager.getInstance("/"))

					slot19 = slot13.Image

					if ccs.Armature.create("/", ccs.Armature) ~= nil then
						slot19 = slot16

						if slot16.getAnimation(slot18) ~= nil then
							slot19 = slot16
							slot22 = (slot3 and {
								0
							}) or {
								-1
							}[1]

							slot16.getAnimation(slot18).play(slot18, slot16.getAnimation(slot18), slot13.Name, -1)

							if slot3 == true then
								slot20 = slot16

								function slot21(slot0, slot1, slot2)
									if slot1 == ccs.MovementEventType.complete then
										slot6 = false

										slot0.setVisible(slot4, slot0)
									end
								end

								slot16.getAnimation(slot19).setMovementEventCallFunc(slot19, slot16.getAnimation(slot19))
							end
						end

						slot20 = display.CENTER

						slot16.setAnchorPoint(slot18, slot16)

						slot20 = slot13.Scale

						slot16.setScale(slot18, slot16)

						if DNTGTEST_SAME_ZORDER_YINYING == false then
							slot21 = slot6.Id

							slot0.m_pLayerFishyy.addChild(slot18, slot0.m_pLayerFishyy, slot16)
						else
							slot21 = 0

							slot0.m_pLayerFishyy.addChild(slot18, slot0.m_pLayerFishyy, slot16)
						end

						slot14.direction = slot13.Direction
						slot14.yinying = true
						slot14.offsetX = slot13.OffestX
						slot14.offsetY = slot13.OffestY
						slot14.scale = slot13.Scale
						slot14.target = slot16
						slot2[#slot2 + 1] = slot14
					end
				elseif slot13.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_SKELETON then
					slot14 = nil
					slot21 = 1

					if sp.SkeletonAnimation.create("/", sp.SkeletonAnimation, slot15 .. ".json", slot15 .. ".atlas") ~= nil then
						slot21 = (slot3 and {
							false
						}) or {
							true
						}[1]

						slot14.setAnimation(slot17, slot14, 0, slot13.Name)

						slot19 = slot13.Scale

						slot14.setScale(slot17, slot14)

						slot19 = display.CENTER

						slot14.setAnchorPoint(slot17, slot14)

						if DNTGTEST_SAME_ZORDER_YINYING == false then
							slot20 = slot6.Id

							slot0.m_pLayerFishyy.addChild(slot17, slot0.m_pLayerFishyy, slot14)
						else
							slot20 = 0

							slot0.m_pLayerFishyy.addChild(slot17, slot0.m_pLayerFishyy, slot14)
						end

						slot2[#slot2 + 1] = {
							direction = slot13.Direction,
							yinying = true,
							offsetX = slot13.OffestX,
							offsetY = slot13.OffestY,
							scale = slot13.Scale,
							target = slot14
						}
					end
				elseif slot13.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_SKELETON_BINARY then
					slot14 = nil
					slot21 = 1

					if sp.SkeletonAnimation.createWithBinaryFile("/", sp.SkeletonAnimation, slot15 .. ".skel", slot15 .. ".atlas") ~= nil then
						slot21 = (slot3 and {
							false
						}) or {
							true
						}[1]

						slot14.setAnimation(slot17, slot14, 0, slot13.Name)

						slot19 = slot13.Scale

						slot14.setScale(slot17, slot14)

						slot19 = display.CENTER

						slot14.setAnchorPoint(slot17, slot14)

						if DNTGTEST_SAME_ZORDER_YINYING == false then
							slot20 = slot6.Id

							slot0.m_pLayerFishyy.addChild(slot17, slot0.m_pLayerFishyy, slot14)
						else
							slot20 = 0

							slot0.m_pLayerFishyy.addChild(slot17, slot0.m_pLayerFishyy, slot14)
						end

						slot2[#slot2 + 1] = {
							direction = slot13.Direction,
							yinying = true,
							offsetX = slot13.OffestX,
							offsetY = slot13.OffestY,
							scale = slot13.Scale,
							target = slot14
						}
					end
				elseif slot13.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_PARTICLE then
					slot18 = slot14 .. ".plist"
					slot19 = slot13.Scale

					cc.ParticleSystemQuad.create("/", cc.ParticleSystemQuad).setScale(cc.ParticleSystemQuad, cc.ParticleSystemQuad.create("/", cc.ParticleSystemQuad))

					if DNTGTEST_SAME_ZORDER_YINYING == false then
						slot20 = slot6.Id

						slot0.m_pLayerFishyy.addChild(slot17, slot0.m_pLayerFishyy, slot15)
					else
						slot20 = 0

						slot0.m_pLayerFishyy.addChild(slot17, slot0.m_pLayerFishyy, slot15)
					end

					slot2[#slot2 + 1] = {
						direction = slot13.Direction,
						yinying = true,
						offsetX = slot13.OffestX,
						offsetY = slot13.OffestY,
						scale = slot13.Scale,
						target = slot15
					}
				end
			end
		end
	end

	return slot2
end

slot0.AddBullet = function (slot0, slot1, slot2)
	if slot0.m_pLayerBullet == nil then
		slot0.m_pLayerBullet = display.newLayer()
		slot6 = "m_pLayerBullet"

		slot0.m_pLayerBullet.setName(slot4, slot0.m_pLayerBullet)

		slot7 = 7

		slot0.addChild(slot4, slot0, slot0.m_pLayerBullet)
	end

	if slot0.m_pLayerBulletDie == nil then
		slot0.m_pLayerBulletDie = display.newLayer()
		slot6 = "self.m_pLayerBulletDie"

		slot0.m_pLayerBulletDie.setName(slot4, slot0.m_pLayerBulletDie)

		slot7 = 8

		slot0.addChild(slot4, slot0, slot0.m_pLayerBulletDie)
	end

	slot3 = false
	slot6 = slot1

	if slot1.GetState(slot5) == DNTGTEST_OBJ_STATE.EOS_LIVE or slot4 == DNTGTEST_OBJ_STATE.EOS_HIT then
		slot3 = false
	elseif slot4 == DNTGTEST_OBJ_STATE.EOS_DEAD then
		slot3 = true
	end

	slot7 = slot1
	slot6 = (slot3 == false and slot1.GetCannonConfig(slot6).Bullet) or slot1.GetCannonConfig(slot6).Net

	if slot6 ~= nil then
		slot9 = slot6

		for slot10, slot11 in pairs(slot8) do
			if slot11.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_FRAME then
				slot12 = {}
				slot13, slot14 = nil

				if slot3 == true then
					slot18 = slot11.Image
					slot14 = slot0.getOneNetRender(slot16, slot0)
				elseif slot3 == false then
					slot18 = slot11.Image
					slot14 = slot0.getOneBulletRenderPool(slot16, slot0)
				end

				if slot14 == nil or slot14.target == nil then
					slot17 = ccs.ArmatureDataManager
					slot18 = slot11.ResPath .. ".ExportJson"

					ccs.ArmatureDataManager.getInstance(slot16).addArmatureFileInfo(slot16, ccs.ArmatureDataManager.getInstance(slot16))

					slot18 = slot11.Image

					if ccs.Armature.create(slot16, ccs.Armature) ~= nil then
						slot18 = slot11.Scale

						slot13.setScale(slot16, slot13)

						slot17 = slot13
						slot20 = (slot3 and {
							0
						}) or {
							-1
						}[1]

						slot13.getAnimation(slot16).play(slot16, slot13.getAnimation(slot16), slot11.Name, -1)

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

					if slot3 == true then
						slot19 = slot11.nZOrder

						slot0.m_pLayerBulletDie.addChild(slot16, slot0.m_pLayerBulletDie, slot13)
					else
						slot19 = slot11.nZOrder

						slot0.m_pLayerBullet.addChild(slot16, slot0.m_pLayerBullet, slot13)
					end
				else
					slot17 = slot14.target
					slot20 = (slot3 and {
						0
					}) or {
						-1
					}[1]

					slot14.target.getAnimation(slot16).play(slot16, slot14.target.getAnimation(slot16), slot11.Name, -1)

					slot18 = true

					slot13.setVisible(slot16, slot13)

					slot18 = slot11.nZOrder

					slot13.setLocalZOrder(slot16, slot13)
				end

				slot12.direction = 0
				slot12.offsetX = 0
				slot12.offsetY = 0
				slot12.scale = slot11.Scale
				slot12.target = slot13
				slot12.bDead = slot3
				slot12.poolFlag = slot11.Image
				slot2[#slot2 + 1] = slot12
			elseif slot11.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_SKELETON then
				slot12 = {}
				slot13, slot14 = nil

				if slot3 == true then
					slot18 = slot11.Image
					slot14 = slot0.getOneNetRender(slot16, slot0)
				elseif slot3 == false then
					slot18 = slot11.Image
					slot14 = slot0.getOneBulletRenderPool(slot16, slot0)
				end

				if slot14 == nil or slot14.target == nil then
					slot20 = 1
					slot18 = slot11.Scale

					sp.SkeletonAnimation.create(slot16, sp.SkeletonAnimation, slot11.ResPath .. ".json", slot11.ResPath .. ".atlas").setScale(slot16, slot13)

					slot18 = display.CENTER

					sp.SkeletonAnimation.create(slot16, sp.SkeletonAnimation, slot11.ResPath .. ".json", slot11.ResPath .. ".atlas").setAnchorPoint(slot16, sp.SkeletonAnimation.create(slot16, sp.SkeletonAnimation, slot11.ResPath .. ".json", slot11.ResPath .. ".atlas"))

					if slot3 == true then
						slot19 = slot11.nZOrder

						slot0.m_pLayerBulletDie.addChild(slot16, slot0.m_pLayerBulletDie, slot13)
					else
						slot19 = slot11.nZOrder

						slot0.m_pLayerBullet.addChild(slot16, slot0.m_pLayerBullet, slot13)
					end
				else
					slot18 = slot11.nZOrder

					slot14.target.setLocalZOrder(slot16, slot14.target)
				end

				if slot13 ~= nil then
					slot20 = (slot3 == true and {
						false
					}) or {
						true
					}[1]

					slot13.setAnimation(slot16, slot13, 0, slot11.Name)

					slot12.direction = 0
					slot12.offsetX = 0
					slot12.offsetY = 0
					slot12.scale = slot11.Scale
					slot12.target = slot13
					slot12.bDead = slot3
					slot12.poolFlag = slot11.Image
					slot2[#slot2 + 1] = slot12
				end
			elseif slot11.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_SKELETON_BINARY then
				slot12 = {}
				slot13, slot14 = nil

				if slot3 == true then
					slot18 = slot11.Image
					slot14 = slot0.getOneNetRender(slot16, slot0)
				elseif slot3 == false then
					slot18 = slot11.Image
					slot14 = slot0.getOneBulletRenderPool(slot16, slot0)
				end

				if slot14 == nil or slot14.target == nil then
					slot20 = 1
					slot18 = slot11.Scale

					sp.SkeletonAnimation.createWithBinaryFile(slot16, sp.SkeletonAnimation, slot11.ResPath .. ".skel", slot11.ResPath .. ".atlas").setScale(slot16, slot13)

					slot18 = display.CENTER

					sp.SkeletonAnimation.createWithBinaryFile(slot16, sp.SkeletonAnimation, slot11.ResPath .. ".skel", slot11.ResPath .. ".atlas").setAnchorPoint(slot16, sp.SkeletonAnimation.createWithBinaryFile(slot16, sp.SkeletonAnimation, slot11.ResPath .. ".skel", slot11.ResPath .. ".atlas"))

					if slot3 == true then
						slot19 = slot11.nZOrder

						slot0.m_pLayerBulletDie.addChild(slot16, slot0.m_pLayerBulletDie, slot13)
					else
						slot19 = slot11.nZOrder

						slot0.m_pLayerBullet.addChild(slot16, slot0.m_pLayerBullet, slot13)
					end
				else
					slot18 = slot11.nZOrder

					slot14.target.setLocalZOrder(slot16, slot14.target)
				end

				if slot13 ~= nil then
					slot20 = (slot3 == true and {
						false
					}) or {
						true
					}[1]

					slot13.setAnimation(slot16, slot13, 0, slot11.Name)

					slot12.direction = 0
					slot12.offsetX = 0
					slot12.offsetY = 0
					slot12.scale = slot11.Scale
					slot12.target = slot13
					slot12.bDead = slot3
					slot12.poolFlag = slot11.Image
					slot2[#slot2 + 1] = slot12
				end
			elseif slot11.AniType == DNTGTEST_FISH_FILE_TYPE.VAT_PARTICLE then
				slot12 = {}
				slot13 = nil
				slot17 = slot11.Image

				if slot0.getOneBulletRenderPool(slot15, slot0) == nil or slot3 == true or slot14.target == nil then
					slot18 = slot11.ResPath .. ".plist"
					slot18 = slot11.Scale

					cc.ParticleSystemQuad.create(slot16, cc.ParticleSystemQuad).setScale(slot16, cc.ParticleSystemQuad.create(slot16, cc.ParticleSystemQuad))

					if slot3 == true then
						slot19 = 106

						slot0.m_pLayerBulletDie.addChild(slot16, slot0.m_pLayerBulletDie, slot13)
					else
						slot19 = 105

						slot0.m_pLayerBullet.addChild(slot16, slot0.m_pLayerBullet, slot13)
					end
				else
					slot13 = slot14.target
				end

				slot12.direction = 0
				slot12.offsetX = 0
				slot12.offsetY = 0
				slot12.scale = slot11.Scale
				slot12.target = slot13
				slot12.bDead = slot3
				slot12.poolFlag = slot11.Image
				slot2[#slot2 + 1] = slot12
			end
		end
	end

	return slot2
end

slot0.AddMyObject = function (slot0, slot1, slot2)
	if slot1 == nil then
		return false
	end

	slot5 = slot1

	if slot1.GetType(slot4) == DNTGTEST_OBJ_TYPE.EOT_FISH then
		slot8 = slot2

		return slot0.AddFish(slot5, slot0, slot1)
	elseif slot3 == DNTGTEST_OBJ_TYPE.EOT_BULLET then
		slot8 = slot2

		return slot0.AddBullet(slot5, slot0, slot1)
	end

	return true
end

return slot0
