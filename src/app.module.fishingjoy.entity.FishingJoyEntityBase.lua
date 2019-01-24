slot2 = "FishingJoyEntityBase"
FishingJoyEntityBase = class(slot1)
slot0 = math.cos
slot1 = math.sin
slot2 = math.acos
slot3 = math.sqrt
slot4 = math.abs
slot5 = math.deg

FishingJoyEntityBase.ctor = function (slot0)
	slot0.entityRenderContainer = {}
	slot0.entityBuffContainer = {}
	slot0.entityPosition = {
		x = 0,
		y = 0
	}
	slot0.entityPositionDirty = false
	slot0.entityRotationDirty = false
	slot0.entityActiveDirty = false
	slot0.entitySpecial = false
	slot0.renderedLive = false
	slot0.renderedDeath = false
end

FishingJoyEntityBase.getEntityActiving = function (slot0)
	return slot0.entityPosition.x > 10 and slot0.entityPosition.x < 1430 and slot0.entityPosition.y > 10 and slot0.entityPosition.y < 890
end

FishingJoyEntityBase.clearEntityBySwimingOut = function (slot0, slot1)
	slot2 = pairs
	slot4 = slot0.entityRenderContainer or {}

	for slot5, slot6 in slot2(slot3) do
		if slot6.cocosTarget then
			if FISHINGJOY_ENTITY_TYPE_OBJ.BULLET == slot1 and slot6.deadStatus == false then
				if slot6.cocosTarget then
					slot10 = false

					slot6.cocosTarget.setVisible(slot8, slot6.cocosTarget)

					slot9 = "component.entityPool.EntityPoolMgr"
					slot9 = FishingJoyRequireLua(slot8)
					slot11 = slot6.entityFlagInPool

					FishingJoyRequireLua(slot8).getInstance(slot8).addBulletRenderPool(slot8, FishingJoyRequireLua(slot8).getInstance(slot8), slot6)
				end
			elseif FISHINGJOY_ENTITY_TYPE_OBJ.BULLET == slot1 and slot6.deadStatus == true then
				if slot6.cocosTarget then
					slot10 = false

					slot6.cocosTarget.setVisible(slot8, slot6.cocosTarget)

					slot9 = "component.entityPool.EntityPoolMgr"
					slot9 = FishingJoyRequireLua(slot8)
					slot11 = slot6.entityFlagInPool

					FishingJoyRequireLua(slot8).getInstance(slot8).addNetRenderPool(slot8, FishingJoyRequireLua(slot8).getInstance(slot8), slot6)
				end
			elseif FISHINGJOY_ENTITY_TYPE_OBJ.FISH == slot1 and slot6.entityShadow == false then
				if slot6.cocosTarget then
					slot7 = pairs
					slot11 = slot6.cocosTarget
					slot9 = slot6.cocosTarget.getChildren(slot10) or {}

					for slot10, slot11 in slot7(slot8) do
						if slot11 then
							slot14 = slot11

							slot11.pause(slot13)
						end
					end

					slot10 = false

					slot6.cocosTarget.setVisible(slot8, slot6.cocosTarget)

					slot9 = "component.entityPool.EntityPoolMgr"
					slot9 = FishingJoyRequireLua(slot8)
					slot11 = slot6.entityFlagInPool

					FishingJoyRequireLua(slot8).getInstance(slot8).addFishRenderPool(slot8, FishingJoyRequireLua(slot8).getInstance(slot8), slot6)
				end
			elseif slot6.cocosTarget then
				slot10 = true

				slot6.cocosTarget.removeFromParent(slot8, slot6.cocosTarget)

				slot6.cocosTarget = nil
			end
		end
	end

	slot0.entityRenderContainer = {}
end

FishingJoyEntityBase.clearEntityByDeath = function (slot0, slot1)
	slot2 = pairs
	slot4 = slot0.entityRenderContainer or {}

	for slot5, slot6 in slot2(slot3) do
		if slot6.cocosTarget then
			if FISHINGJOY_ENTITY_TYPE_OBJ.BULLET == slot1 and slot6.deadStatus == false then
				if slot6.cocosTarget then
					slot10 = false

					slot6.cocosTarget.setVisible(slot8, slot6.cocosTarget)

					slot9 = "component.entityPool.EntityPoolMgr"
					slot9 = FishingJoyRequireLua(slot8)
					slot11 = slot6.entityFlagInPool

					FishingJoyRequireLua(slot8).getInstance(slot8).addBulletRenderPool(slot8, FishingJoyRequireLua(slot8).getInstance(slot8), slot6)
				end
			elseif FISHINGJOY_ENTITY_TYPE_OBJ.BULLET == slot1 and slot6.deadStatus == true then
				if slot6.cocosTarget then
					slot7 = slot6
					slot10 = slot6.cocosTarget
					slot17 = 1
					slot14 = cc.DelayTime.create(slot15, cc.DelayTime)

					function slot18(slot0)
						slot4 = false

						slot0.setVisible(slot2, slot0)

						slot3 = "component.entityPool.EntityPoolMgr"
						slot3 = FishingJoyRequireLua(slot2)
						slot5 = slot0.entityFlagInPool

						FishingJoyRequireLua(slot2).getInstance(slot2).addNetRenderPool(slot2, FishingJoyRequireLua(slot2).getInstance(slot2), slot0)
					end

					slot6.cocosTarget.runAction(slot9, cc.Sequence.create(slot12, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
				end
			elseif FISHINGJOY_ENTITY_TYPE_OBJ.FISH == slot1 and slot6.entityShadow == false then
				if slot6.cocosTarget then
					slot7 = slot6
					slot10 = slot6.cocosTarget
					slot17 = 2
					slot14 = cc.DelayTime.create(slot15, cc.DelayTime)

					function slot18(slot0)
						slot1 = pairs
						slot5 = slot0.cocosTarget
						slot3 = slot0.cocosTarget.getChildren(slot4) or {}

						for slot4, slot5 in slot1(slot2) do
							if slot5 then
								slot8 = slot5

								slot5.pause(slot7)
							end
						end

						slot4 = false

						slot0.setVisible(slot2, slot0)

						slot3 = "component.entityPool.EntityPoolMgr"
						slot3 = FishingJoyRequireLua(slot2)
						slot5 = slot1.entityFlagInPool

						FishingJoyRequireLua(slot2).getInstance(slot2).addFishRenderPool(slot2, FishingJoyRequireLua(slot2).getInstance(slot2), FishingJoyRequireLua(slot2).getInstance(slot2).addFishRenderPool)
					end

					slot6.cocosTarget.runAction(slot9, cc.Sequence.create(slot12, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
				end
			elseif slot6.cocosTarget then
				slot9 = slot6.cocosTarget
				slot16 = 0.8
				slot13 = cc.DelayTime.create(slot14, cc.DelayTime)

				function slot17(slot0)
					slot4 = true

					slot0.removeFromParent(slot2, slot0)
				end

				slot6.cocosTarget.runAction(slot8, cc.Sequence.create(slot11, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))

				slot6.cocosTarget = nil
			end
		end
	end

	slot0.entityRenderContainer = {}
end

FishingJoyEntityBase.clearEntity = function (slot0, slot1, slot2)
	if slot1 == true then
		slot6 = slot2

		slot0.clearEntityBySwimingOut(slot4, slot0)
	else
		slot6 = slot2

		slot0.clearEntityByDeath(slot4, slot0)
	end
end

FishingJoyEntityBase.getEntityType = function (slot0)
	return "FishingJoyEntityBase"
end

FishingJoyEntityBase.positionDirty = function (slot0)
	slot3 = slot0

	if slot0.getFishingJoyEntityLogic(slot2) and slot1.controller then
		slot6 = slot0.entityPosition.y

		return slot1.controller.convertCoord2World(slot3, slot1.controller, slot0.entityPosition.x)
	end

	return nil, nil
end

FishingJoyEntityBase.rotationDirty = function (slot0)
	slot1 = slot0.getEntityDirection(slot2)
	slot2 = slot0(slot0)
	slot3 = slot1(-slot1)
	slot6 = slot0

	if slot0.getFishingJoyEntityLogic(-slot1) then
		slot7 = slot4

		if slot4.getGameController(slot6) ~= nil then
			slot9 = slot1
			slot1 = slot5.convertDirection(slot7, slot5)
		end
	end

	return slot1, slot2, slot3
end

FishingJoyEntityBase.onUpdate = function (slot0, slot1)
	if slot0.moveComponent ~= nil then
		slot5 = slot1

		slot0.moveComponent.onUpdate(slot3, slot0.moveComponent)
	end

	slot2 = pairs
	slot4 = slot0.entityBuffContainer or {}

	for slot5, slot6 in slot2(slot3) do
		slot10 = slot1

		if slot6.onUpdate(slot8, slot6) == false then
			slot0.entityBuffContainer[slot5] = nil
		end
	end

	if slot0.entityActive == true and slot0.entityDirtyStatus == true then
		slot4 = "mainLogic.FishingJoyGameMgr"
		slot4 = FishingJoyRequireLua(slot3)
		slot4 = FishingJoyRequireLua(slot3).getInstance(slot3)

		if FishingJoyRequireLua(slot3).getInstance(slot3).checkGameFinishLoad(slot3) == true then
			slot0.entityDirtyStatus = false
			slot5 = true

			slot0.clearEntity(slot3, slot0)

			slot4 = "mainLogic.FishingJoyGameMgr"
			slot4 = FishingJoyRequireLua(slot3)
			slot4 = FishingJoyRequireLua(slot3).getInstance(slot3)

			if FishingJoyRequireLua(slot3).getInstance(slot3).getEntityLayer(slot3) ~= nil then
				slot5 = slot0

				if slot0.getEntityStatus(slot4) == FISHINGJOY_ENTITY_STATUS.DEAD then
					if slot0.renderedDeath == false then
						slot0.renderedDeath = true
						slot7 = slot0.entityRenderContainer

						slot2.newEntity(slot4, slot2, slot0)
					end
				elseif slot0.renderedLive == false then
					slot0.renderedLive = true
					slot7 = slot0.entityRenderContainer

					slot2.newEntity(slot4, slot2, slot0)
				end
			end

			slot0.entityPositionDirty = true
			slot0.entityRotationDirty = true
			slot0.entityActiveDirty = true
		end
	end

	if slot0.entityPositionDirty == true or slot0.entityRotationDirty == true or slot0.entityActiveDirty == true then
		slot2 = 0
		slot3 = 0
		slot4 = 0
		slot5 = 0
		slot6 = 0

		if slot0.entityPositionDirty == true then
			slot9 = slot0
			slot2, slot3 = slot0.positionDirty(slot8)
		end

		if slot0.entityRotationDirty == true then
			slot9 = slot0
			slot6, slot4, slot5 = slot0.rotationDirty(slot8)
		end

		slot9 = slot0.entityRenderContainer

		for slot10, slot11 in pairs(slot8) do
			if slot0.entityPositionDirty == true then
				slot14 = slot0

				if slot0.getFishingJoyEntityLogic(slot13) then
					slot15 = slot12

					if slot12.getGameController(slot14) then
						if not slot11.tempOffset_1 then
							slot17 = 0
							slot14 = cc.p(slot15, 0)
						end

						slot11.tempOffset_1 = slot14

						if not slot11.tempOffset_2 then
							slot17 = 0
							slot14 = cc.p(slot15, 0)
						end

						slot11.tempOffset_2 = slot14
						slot16 = slot13

						if slot13.getNeedMirror(slot15) == true then
							if slot11.cocosTarget then
								if slot0.entityRotationDirty then
									if slot11.entityOffset.x == 0 and slot11.entityOffset.y == 0 then
										slot11.tempOffset_2.x = 0
										slot11.tempOffset_2.y = 0
									else
										slot11.tempOffset_2.x = -slot11.entityOffset.x * slot5 + slot11.entityOffset.y * slot4
										slot11.tempOffset_2.y = -slot11.entityOffset.x * slot4 - slot11.entityOffset.y * slot5
									end

									slot11.tempOffset_1.x = slot5 + slot4
									slot11.tempOffset_1.y = slot4 - slot5
								end

								slot14 = slot11.tempOffset_2.x + slot2
								slot15 = slot11.tempOffset_2.y + slot3
								slot16 = slot11.tempOffset_1.x + slot2
								slot17 = slot11.tempOffset_1.y + slot3

								if slot11.entityShadow == true then
									slot22 = slot15 - 40

									slot11.cocosTarget.setPosition(slot19, slot11.cocosTarget, slot14)
								else
									slot22 = slot15

									slot11.cocosTarget.setPosition(slot19, slot11.cocosTarget, slot14)
								end

								slot21 = slot17
								slot11.entityRenderPositionNoOffset = cc.p(slot19, slot16)
							end
						elseif slot11.cocosTarget then
							if slot0.entityRotationDirty then
								if slot11.entityOffset.x == 0 and slot11.entityOffset.y == 0 then
									slot11.tempOffset_2.x = 0
									slot11.tempOffset_2.y = 0
								else
									slot11.tempOffset_2.x = slot11.entityOffset.x * slot5 - slot11.entityOffset.y * slot4
									slot11.tempOffset_2.y = slot11.entityOffset.x * slot4 + slot11.entityOffset.y * slot5
								end

								slot11.tempOffset_1.x = slot5 - slot4
								slot11.tempOffset_1.y = slot4 + slot5
							end

							slot14 = slot11.tempOffset_2.x + slot2
							slot15 = slot11.tempOffset_2.y + slot3
							slot16 = slot11.tempOffset_1.x + slot2
							slot17 = slot11.tempOffset_1.y + slot3

							if slot11.entityShadow == true then
								slot22 = slot15 + 40

								slot11.cocosTarget.setPosition(slot19, slot11.cocosTarget, slot14)
							else
								slot22 = slot15

								slot11.cocosTarget.setPosition(slot19, slot11.cocosTarget, slot14)
							end

							slot21 = slot17
							slot11.entityRenderPositionNoOffset = cc.p(slot19, slot16)
						end
					end
				end
			end

			if slot0.entityRotationDirty then
				if slot11.cocosTarget and slot11.entityNeedAlwayUp ~= true then
					slot17 = slot6
					slot15 = slot0(slot16) + slot11.entityDirection

					slot11.cocosTarget.setRotation(slot13, slot11.cocosTarget)
				elseif slot11.entityNeedAlwayUp == true then
					slot16 = 1 * ((math.cos(slot13) > 0 and 1) or -1)

					slot11.cocosTarget.setScaleX(slot6, slot11.cocosTarget)
				end
			end

			if slot0.entityActiveDirty and slot11.cocosTarget then
				slot15 = slot0.entityActive

				slot11.cocosTarget.setVisible(slot13, slot11.cocosTarget)
			end
		end

		slot0.entityPositionDirty = false
		slot0.entityRotationDirty = false
		slot0.entityActiveDirty = false
	end
end

FishingJoyEntityBase.entityFinishMove = function (slot0)
	slot4 = FISHINGJOY_ENTITY_STATUS.DESTORY

	slot0.setEntityStatus(slot2, slot0)
end

FishingJoyEntityBase.getEntityPosition = function (slot0)
	if not slot0.entityPosition then
		slot4 = 0
		slot1 = cc.p(slot2, 0)
	end

	return slot1
end

FishingJoyEntityBase.getEntityRenderPositionNoOffset = function (slot0)
	slot1 = pairs
	slot3 = slot0.entityRenderContainer or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5.entityNode == slot0 then
			return slot5.entityRenderPositionNoOffset.x, slot5.entityRenderPositionNoOffset.y
		end
	end

	return FISHINGJOY_INVALID_VALUE, FISHINGJOY_INVALID_VALUE
end

FishingJoyEntityBase.setEntityPosition = function (slot0, slot1, slot2)
	if slot0.entityPosition.x == slot1 and slot0.entityPosition.y == slot2 then
		return
	end

	slot0.entityPosition.x = slot1
	slot0.entityPosition.y = slot2
	slot0.entityPositionDirty = true

	if slot1 < -100 or slot2 < -100 or slot1 > 1540 or slot2 > 1000 then
		if slot0.entityActive == true then
			slot5 = slot0

			slot0.entityFinishMove(slot4)
		end

		slot0.entityActive = false
	else
		slot0.entityActive = true
	end
end

FishingJoyEntityBase.getEntityDirection = function (slot0)
	return slot0.entityDirection or 0
end

FishingJoyEntityBase.setComponentDirection = function (slot0, slot1)
	if slot0.entityDirection ~= slot1 and slot0.entityDirection then
		slot4 = slot0.entityDirection - slot1

		if slot0(slot3) < FISHINGJOY_PI_720 then
			return
		end
	end

	slot0.entityDirection = slot1
	slot0.entityRotationDirty = true
end

FishingJoyEntityBase.getEntityStatus = function (slot0)
	return slot0.entityStatus
end

FishingJoyEntityBase.setEntityStatus = function (slot0, slot1)
	if slot1 == slot0.entityStatus then
		return
	end

	if (slot1 == FISHINGJOY_ENTITY_STATUS.LIVE or slot1 == FISHINGJOY_ENTITY_STATUS.HIT) and (slot0.entityStatus == FISHINGJOY_ENTITY_STATUS.LIVE or slot0.entityStatus == FISHINGJOY_ENTITY_STATUS.HIT) then
		return
	end

	slot0.entityStatus = slot1
	slot0.entityDirtyStatus = true
end

FishingJoyEntityBase.appendEntityBuff = function (slot0, slot1, slot2, slot3)
	slot8 = slot3

	if FishingJoyBuffBase.new(slot5, slot1, slot2) then
		slot0.entityBuffContainer[#slot0.entityBuffContainer + 1] = slot4
	end
end

FishingJoyEntityBase.getEntityAppendBuffs = function (slot0)
	return slot0.entityBuffContainer or {}
end

FishingJoyEntityBase.getEntityMoveComponent = function (slot0)
	return slot0.moveComponent
end

FishingJoyEntityBase.setEntityMoveComponent = function (slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.moveComponent = slot1
	slot5 = slot0

	slot0.moveComponent.setComponentExecutor(slot3, slot0.moveComponent)

	slot4 = slot0.moveComponent

	slot0.moveComponent.attach(slot3)
end

FishingJoyEntityBase.setEntityTargetId = function (slot0, slot1)
	slot0.cocosTargetId = slot1
end

FishingJoyEntityBase.getEntityTargetId = function (slot0)
	return slot0.cocosTargetId
end

FishingJoyEntityBase.getEntityId = function (slot0)
	return slot0.entityId
end

FishingJoyEntityBase.setEntityId = function (slot0, slot1)
	slot0.entityId = slot1
end

FishingJoyEntityBase.getFishingJoyEntityLogic = function (slot0)
	slot3 = "mainLogic.FishingJoyGameMgr"
	slot3 = FishingJoyRequireLua(slot2)
	slot3 = FishingJoyRequireLua(slot2).getInstance(slot2)

	return FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2)
end

FishingJoyEntityBase.setEntitySpecial = function (slot0)
	slot0.entitySpecial = true
end

FishingJoyEntityBase.getEntitySpecial = function (slot0)
	return slot0.entitySpecial or false
end

return FishingJoyEntityBase
