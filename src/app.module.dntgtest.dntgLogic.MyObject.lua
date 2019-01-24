slot0 = class(slot1)
slot1 = requireLuaFromModule("MyObject")
slot4 = "dntgtest.objPoolMgr.objPoolMgr"
slot4 = requireLuaFromModule("dntgtest.Buff.Buff")
slot2 = requireLuaFromModule("dntgtest.Buff.Buff").getInstance("dntgtest.Buff.Buff")

slot0.ctor = function (slot0)
	slot0.m_pVisualNodeList = {}
	slot0.m_pBuffList = {}
	slot0.m_pPosition = {
		x = 0,
		y = 0
	}
	slot0.m_bDirtyPos = false
	slot0.m_bDirtyDir = false
	slot0.m_bDirtyInScreen = false
	slot0.bSpecialShow = false
	slot0.bRenderNormal = false
	slot0.bRenderDie = false
end

slot0.InSideScreen = function (slot0)
	return slot0.m_pPosition.x > 10 and slot0.m_pPosition.x < 1430 and slot0.m_pPosition.y > 10 and slot0.m_pPosition.y < 890
end

slot0.Clear = function (slot0, slot1, slot2, slot3)
	if slot1 == true then
		slot6 = slot0.m_pVisualNodeList

		for slot7, slot8 in pairs(slot5) do
			if slot8.target then
				if DNTGTEST_OBJ_TYPE.EOT_BULLET == slot3 and slot8.bDead == false then
					if slot8.target then
						slot12 = false

						slot8.target.setVisible(slot10, slot8.target)

						slot13 = slot8.poolFlag

						slot0.addBulletRenderPool(slot10, slot0, slot8)
					end
				elseif DNTGTEST_OBJ_TYPE.EOT_BULLET == slot3 and slot8.bDead == true then
					if slot8.target then
						slot12 = false

						slot8.target.setVisible(slot10, slot8.target)

						slot13 = slot8.poolFlag

						slot0.addNetRenderPool(slot10, slot0, slot8)
					end
				elseif DNTGTEST_OBJ_TYPE.EOT_FISH == slot3 and slot8.yinying == false then
					if slot8.target then
						if slot8.target.getAnimation then
							slot11 = slot8.target
							slot12 = 0

							slot8.target.getAnimation(slot10).gotoAndPause(slot10, slot8.target.getAnimation(slot10))
						elseif slot8.target.clearTracks then
							slot11 = slot8.target

							slot8.target.clearTracks(slot10)
						end

						slot12 = false

						slot8.target.setVisible(slot10, slot8.target)

						slot13 = slot8.poolFlag

						slot0.addFishRenderPool(slot10, slot0, slot8)
					end
				elseif slot8.target then
					slot12 = true

					slot8.target.removeFromParent(slot10, slot8.target)

					slot8.target = nil
				end
			end
		end

		slot0.m_pVisualNodeList = {}
	else
		slot6 = slot0.m_pVisualNodeList

		for slot7, slot8 in pairs(slot5) do
			if slot8.target then
				if DNTGTEST_OBJ_TYPE.EOT_BULLET == slot3 and slot8.bDead == false then
					if slot8.target then
						slot12 = false

						slot8.target.setVisible(slot10, slot8.target)

						slot13 = slot8.poolFlag

						slot0.addBulletRenderPool(slot10, slot0, slot8)
					end
				elseif DNTGTEST_OBJ_TYPE.EOT_BULLET == slot3 and slot8.bDead == true then
					if slot8.target then
						slot9 = slot8
						slot12 = slot8.target
						slot19 = 1
						slot16 = cc.DelayTime.create(slot17, cc.DelayTime)

						function slot20(slot0)
							slot4 = false

							slot0.setVisible(slot2, slot0)

							slot5 = slot1.poolFlag

							slot0.addNetRenderPool(slot2, slot0, slot0.addNetRenderPool)
						end

						slot8.target.runAction(slot11, cc.Sequence.create(slot14, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
					end
				elseif DNTGTEST_OBJ_TYPE.EOT_FISH == slot3 and slot8.yinying == false then
					if slot8.target then
						slot9 = slot8
						slot12 = slot8.target
						slot19 = 0.8
						slot16 = cc.DelayTime.create(slot17, cc.DelayTime)

						function slot20(slot0)
							if slot0.getAnimation then
								slot3 = slot0
								slot4 = 0

								slot0.getAnimation(slot2).gotoAndPause(slot2, slot0.getAnimation(slot2))
							elseif slot0.clearTracks then
								slot3 = slot0

								slot0.clearTracks(slot2)
							end

							slot4 = false

							slot0.setVisible(slot2, slot0)

							slot5 = slot1.poolFlag

							slot0.addFishRenderPool(slot2, slot0, slot0.addFishRenderPool)
						end

						slot8.target.runAction(slot11, cc.Sequence.create(slot14, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
					end
				elseif slot8.target then
					slot11 = slot8.target
					slot18 = 0.8
					slot15 = cc.DelayTime.create(slot16, cc.DelayTime)

					function slot19(slot0)
						slot4 = true

						slot0.removeFromParent(slot2, slot0)
					end

					slot8.target.runAction(slot10, cc.Sequence.create(slot13, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))

					slot8.target = nil
				end
			end
		end

		slot0.m_pVisualNodeList = {}
	end
end

slot0.GetType = function (slot0)
	return "MyObject"
end

slot3 = math.cos
slot4 = math.sin
slot5 = math.acos
slot6 = math.sqrt
slot7 = math.abs
slot8 = math.deg

slot0.OnUpdate = function (slot0, slot1)
	if slot0.m_pMoveCompent ~= nil then
		slot5 = slot1

		slot0.m_pMoveCompent.OnUpdate(slot3, slot0.m_pMoveCompent)
	end

	slot4 = slot0.m_pBuffList

	for slot5, slot6 in pairs(slot3) do
		slot10 = slot1

		if slot6.OnUpdate(slot8, slot6) == false then
			slot0.m_pBuffList[slot5] = nil
		end
	end

	if slot0.m_bInScreen == true and slot0.m_bDirtyState == true then
		slot4 = slot0
		slot4 = slot0.GetFishObjectManager(slot3)

		if slot0.GetFishObjectManager(slot3).GetGameLoaded(slot3) == true then
			slot0.m_bDirtyState = false
			slot6 = true

			slot0.Clear(slot3, slot0, true)

			slot4 = slot0
			slot4 = slot0.GetFishObjectManager(slot3)

			if slot0.GetFishObjectManager(slot3).GetFishLayer(slot3) ~= nil then
				slot5 = slot0

				if slot0.GetState(slot4) == DNTGTEST_OBJ_STATE.EOS_DEAD then
					if slot0.bRenderDie == false then
						slot0.bRenderDie = true
						slot7 = slot0.m_pVisualNodeList

						slot2.AddMyObject(slot4, slot2, slot0)
					end
				elseif slot0.bRenderNormal == false then
					slot0.bRenderNormal = true
					slot7 = slot0.m_pVisualNodeList

					slot2.AddMyObject(slot4, slot2, slot0)
				end
			end

			slot0.m_bDirtyPos = true
			slot0.m_bDirtyDir = true
			slot0.m_bDirtyInScreen = true
		end
	end

	if slot0.m_bDirtyPos == true or slot0.m_bDirtyDir == true or slot0.m_bDirtyInScreen == true then
		slot2 = 0
		slot3 = 0
		slot4 = 0
		slot5 = 0
		slot6 = 0

		if slot0.m_bDirtyPos == true then
			slot2 = slot0.m_pPosition.x
			slot3 = slot0.m_pPosition.y
			slot9 = slot0

			if slot0.GetFishObjectManager(slot8) and slot7.controller then
				slot12 = slot3
				slot2, slot3 = slot7.controller.ConvertCoordWorld(slot9, slot7.controller, slot2)
			end
		end

		if slot0.m_bDirtyDir == true then
			slot9 = slot0
			slot9 = -slot0.GetDirection(slot8)
			slot5 = slot0(slot8)
			slot9 = -slot0.GetDirection(slot8)
			slot6 = slot1(slot8)
			slot9 = slot0

			if slot0.GetFishObjectManager(slot8) ~= nil then
				slot10 = slot7

				if slot7.GetController(slot9) ~= nil then
					slot12 = slot4
					slot4 = slot8.ConvertDirection(slot10, slot8)
				end
			end
		end

		slot9 = slot0.m_pVisualNodeList

		for slot10, slot11 in pairs(slot8) do
			if slot0.m_bDirtyPos == true then
				slot14 = slot0

				if slot0.GetFishObjectManager(slot13) ~= nil then
					slot15 = slot12

					if slot12.GetController(slot14) ~= nil then
						slot11._offsetBuffX = slot11._offsetBuffX or 0
						slot11._offsetBuffY = slot11._offsetBuffY or 0
						slot11.offsetBuffX = slot11.offsetBuffX or 0
						slot11.offsetBuffY = slot11.offsetBuffY or 0
						slot16 = slot13

						if slot13.GetMirrowShow(slot15) == true then
							if slot11.target then
								if slot0.m_bDirtyDir then
									if slot11.offsetX == 0 and slot11.offsetY == 0 then
										slot11.offsetBuffX = 0
										slot11.offsetBuffY = 0
									else
										slot11.offsetBuffX = -slot11.offsetX * slot6 + slot11.offsetY * slot5
										slot11.offsetBuffY = -slot11.offsetX * slot5 - slot11.offsetY * slot6
									end

									slot11._offsetBuffX = slot6 + slot5
									slot11._offsetBuffY = slot5 - slot6
								end

								slot14 = slot11.offsetBuffX + slot2
								slot15 = slot11.offsetBuffY + slot3
								slot16 = slot11._offsetBuffX + slot2
								slot17 = slot11._offsetBuffY + slot3

								if slot11.yinying == true then
									slot22 = slot15 - 40

									slot11.target.setPosition(slot19, slot11.target, slot14)
								else
									slot22 = slot15

									slot11.target.setPosition(slot19, slot11.target, slot14)
								end

								slot11.tRenderNoOffsetPos = {
									x = slot16,
									y = slot17
								}
							end
						elseif slot11.target then
							if slot0.m_bDirtyDir then
								if slot11.offsetX == 0 and slot11.offsetY == 0 then
									slot11.offsetBuffX = 0
									slot11.offsetBuffY = 0
								else
									slot11.offsetBuffX = slot11.offsetX * slot6 - slot11.offsetY * slot5
									slot11.offsetBuffY = slot11.offsetX * slot5 + slot11.offsetY * slot6
								end

								slot11._offsetBuffX = slot6 - slot5
								slot11._offsetBuffY = slot5 + slot6
							end

							slot14 = slot11.offsetBuffX + slot2
							slot15 = slot11.offsetBuffY + slot3
							slot16 = slot11._offsetBuffX + slot2
							slot17 = slot11._offsetBuffY + slot3

							if slot11.yinying == true then
								slot22 = slot15 + 40

								slot11.target.setPosition(slot19, slot11.target, slot14)
							else
								slot22 = slot15

								slot11.target.setPosition(slot19, slot11.target, slot14)
							end

							slot11.tRenderNoOffsetPos = {
								x = slot16,
								y = slot17
							}
						end
					end
				end
			end

			if slot0.m_bDirtyDir and slot11.target then
				slot14 = slot11.target
				slot17 = slot4 + slot11.direction

				slot11.target.setRotation(slot13, slot2(slot16))
			end

			if slot0.m_bDirtyInScreen and slot11.target then
				slot15 = slot0.m_bInScreen

				slot11.target.setVisible(slot13, slot11.target)
			end
		end

		slot0.m_bDirtyPos = false
		slot0.m_bDirtyDir = false
		slot0.m_bDirtyInScreen = false
	end
end

slot0.OnMoveEnd = function (slot0)
	slot4 = DNTGTEST_OBJ_STATE.EOS_DESTORY

	slot0.SetState(slot2, slot0)
end

slot0.GetPosition = function (slot0)
	return slot0.m_pPosition or {
		x = 0,
		y = 0
	}
end

slot0.GetRenderPosition = function (slot0)
	slot1 = pairs
	slot3 = slot0.m_pVisualNodeList or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5.logicNode == slot0 then
			return slot5.tRenderNoOffsetPos.x, slot5.tRenderNoOffsetPos.y
		end
	end

	return DNTGTEST_INVALID_VALUE, DNTGTEST_INVALID_VALUE
end

slot0.SetPosition = function (slot0, slot1, slot2)
	if slot0.m_pPosition.x == slot1 and slot0.m_pPosition.y == slot2 then
		return
	end

	slot0.m_pPosition.x = slot1
	slot0.m_pPosition.y = slot2
	slot0.m_bDirtyPos = true

	if slot1 < -100 or slot2 < -100 or slot1 > 1540 or slot2 > 1000 then
		if slot0.m_bInScreen == true then
			slot5 = slot0

			slot0.OnMoveEnd(slot4)
		end

		slot0.m_bInScreen = false
	else
		slot0.m_bInScreen = true
	end
end

slot0.GetDirection = function (slot0)
	return slot0.m_fDirection or 0
end

slot9 = (math.pi * 2) / 720

slot0.SetDirection = function (slot0, slot1)
	slot2 = slot0

	if slot0.m_fDirection ~= slot1 and slot0.m_fDirection then
		slot5 = slot0.m_fDirection - slot1

		if slot1(slot4) < slot2 then
			return
		end
	end

	slot0.m_fDirection = slot1
	slot0.m_bDirtyDir = true
end

slot0.GetState = function (slot0)
	return slot0.m_nState
end

slot0.SetState = function (slot0, slot1)
	if slot1 == slot0.m_nState then
		return
	end

	if (slot1 == DNTGTEST_OBJ_STATE.EOS_LIVE or slot1 == DNTGTEST_OBJ_STATE.EOS_HIT) and (slot0.m_nState == DNTGTEST_OBJ_STATE.EOS_LIVE or slot0.m_nState == DNTGTEST_OBJ_STATE.EOS_HIT) then
		return
	end

	slot0.m_nState = slot1
	slot0.m_bDirtyState = true
end

slot0.AddBuff = function (slot0, slot1, slot2, slot3)
	slot8 = slot3

	if slot0.new(slot5, slot1, slot2) ~= nil then
		slot0.m_pBuffList[#slot0.m_pBuffList + 1] = slot4
	end
end

slot0.GetBuffs = function (slot0)
	return slot0.m_pBuffList or {}
end

slot0.GetMoveCompent = function (slot0)
	return slot0.m_pMoveCompent
end

slot0.SetMoveCompent = function (slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.m_pMoveCompent = slot1
	slot5 = slot0

	slot0.m_pMoveCompent.SetOwner(slot3, slot0.m_pMoveCompent)

	slot4 = slot0.m_pMoveCompent

	slot0.m_pMoveCompent.OnAttach(slot3)
end

slot0.SetTarget = function (slot0, slot1)
	slot0.m_nTargetId = slot1
end

slot0.GetTarget = function (slot0)
	return slot0.m_nTargetId
end

slot0.GetId = function (slot0)
	return slot0.m_nId
end

slot0.SetId = function (slot0, slot1)
	slot0.m_nId = slot1
end

slot0.SetFishObjectManager = function (slot0, slot1)
	slot0._fishMgr = slot1
end

slot0.GetFishObjectManager = function (slot0)
	return slot0._fishMgr
end

slot0.SetSpecialShow = function (slot0)
	slot0.bSpecialShow = true
end

slot0.GetSpecialShow = function (slot0)
	return slot0.bSpecialShow or false
end

return slot0
