slot0 = math.floor
slot1 = math.sin
slot2 = math.cos
slot3 = math.pow
slot4 = math.abs
slot7 = "MyFishObjectManager"
MyFishObjectManager = class(slot6)

MyFishObjectManager.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot10 = slot2

	slot0.SetFishLayer(slot8, slot0)

	slot10 = slot1

	slot0.SetController(slot8, slot0)

	slot0.m_bLoaded = false
	slot0.m_bSwitchingScene = false
	slot0.m_MapFish = {}
	slot0.m_MapBullet = {}
	slot13 = slot6

	slot0.Init(slot8, slot0, slot3, slot4, slot5)
end

MyFishObjectManager.SetController = function (slot0, slot1)
	slot0.controller = slot1
end

MyFishObjectManager.GetController = function (slot0)
	return slot0.controller
end

MyFishObjectManager.GetFishLayer = function (slot0)
	return slot0._fishLayer
end

MyFishObjectManager.SetFishLayer = function (slot0, slot1)
	slot0._fishLayer = slot1
end

MyFishObjectManager.Init = function (slot0, slot1, slot2, slot3, slot4)
	slot0.m_nServerWidth = slot3
	slot0.m_nServerHeight = slot4
	slot0.m_nClientWidth = slot1
	slot0.m_nClientHeight = slot2
	slot0.X_COUNT = 8
	slot0.Y_COUNT = 4
	slot0.ONE_X_INTERVAL = slot0.X_COUNT / slot0.m_nServerWidth
	slot0.ONE_Y_INTERVAL = slot0.Y_COUNT / slot0.m_nServerHeight
end

MyFishObjectManager.SetGameLoaded = function (slot0, slot1)
	slot0.m_bLoaded = slot1
end

MyFishObjectManager.GetGameLoaded = function (slot0)
	return slot0.m_bLoaded
end

MyFishObjectManager.SetSwitchingScene = function (slot0, slot1)
	slot0.m_bSwitchingScene = slot1
end

MyFishObjectManager.GetSwitchingScene = function (slot0)
	return slot0.m_bSwitchingScene
end

MyFishObjectManager.AddBullet = function (slot0, slot1)
	if slot1 == nil then
		return false
	end

	slot4 = slot1

	if slot0.m_MapBullet[slot1.GetId(slot3)] == nil then
		slot0.m_MapBullet[slot2] = slot1
		slot6 = slot0

		slot1.SetFishObjectManager(slot4, slot1)

		return true
	end

	return false
end

MyFishObjectManager.FindBullet = function (slot0, slot1)
	return slot0.m_MapBullet[slot1]
end

MyFishObjectManager.RemoveAllBullets = function (slot0, slot1)
	slot2 = pairs
	slot4 = slot0.m_MapBullet or {}

	for slot5, slot6 in slot2(slot3) do
		slot11 = slot1

		slot6.Clear(slot8, slot6, true)
	end

	slot0.m_MapBullet = {}

	return true
end

MyFishObjectManager.AddFish = function (slot0, slot1)
	if slot1 == nil then
		return false
	end

	slot4 = slot1

	if slot0.m_MapFish[slot1.GetId(slot3)] == nil then
		slot0.m_MapFish[slot2] = slot1
		slot6 = DNTGTEST_OBJ_STATE.EOS_LIVE

		slot1.SetState(slot4, slot1)

		slot6 = slot0

		slot1.SetFishObjectManager(slot4, slot1)

		return true
	end

	return false
end

MyFishObjectManager.FindFish = function (slot0, slot1)
	return slot0.m_MapFish[slot1]
end

MyFishObjectManager.FindLockFish = function (slot0, slot1)
	return slot0.m_MapFish[slot1]
end

MyFishObjectManager.GetAllFishes = function (slot0)
	return slot0.m_MapFish or {}
end

MyFishObjectManager.RemoveAllFishes = function (slot0, slot1)
	slot4 = slot0.m_MapFish

	for slot5, slot6 in pairs(slot3) do
		slot11 = slot1

		slot6.Clear(slot8, slot6, true)
	end

	slot0.m_MapFish = {}

	return true
end

MyFishObjectManager.OnUpdate = function (slot0, slot1)
	slot2 = {}
	slot3 = 0
	slot4 = pairs
	slot6 = slot0.m_MapFish or {}

	for slot7, slot8 in slot4(slot5) do
		slot12 = slot1

		slot8.OnUpdate(slot10, slot8)

		slot11 = slot8

		if slot8.GetState(slot10) < DNTGTEST_OBJ_STATE.EOS_DEAD then
			slot9 = slot8.GetPosition(slot10)
			slot10 = slot8:GetMaxRadio()
			slot13 = slot0((slot9.x + slot10) * slot0.ONE_X_INTERVAL)
			slot16 = (slot9.y + slot10) * slot0.ONE_Y_INTERVAL
			slot14 = slot0((slot9.y - slot10) * slot0.ONE_Y_INTERVAL)

			for slot18 = slot0(slot8), slot0((slot9.x - slot10) * slot0.ONE_X_INTERVAL), 1 do
				for slot22 = slot13, slot14, 1 do
					if slot22 >= 0 and slot22 < slot0.Y_COUNT and slot18 >= 0 and slot18 < slot0.X_COUNT then
						if slot2[slot22] == nil then
							slot2[slot22] = {}
						end

						if slot2[slot22][slot18] == nil then
							slot2[slot22][slot18] = {}
						end

						slot2[slot22][slot18][#slot2[slot22][slot18] + 1] = slot8
					end
				end
			end
		end

		if slot3 == DNTGTEST_OBJ_STATE.EOS_DEAD then
			slot14 = DNTGTEST_OBJ_TYPE.EOT_FISH

			slot8.Clear(slot10, slot8, false, nil)

			slot0.m_MapFish[slot7] = nil
		elseif DNTGTEST_OBJ_STATE.EOS_DEAD < slot3 then
			slot14 = DNTGTEST_OBJ_TYPE.EOT_FISH

			slot8.Clear(slot10, slot8, true, nil)

			slot0.m_MapFish[slot7] = nil
		end
	end

	slot4 = pairs
	slot6 = slot0.m_MapBullet or {}

	for slot7, slot8 in slot4(slot5) do
		slot12 = slot1

		slot8.OnUpdate(slot10, slot8)

		slot11 = slot8
		slot3 = slot8.GetState(slot10)

		if slot0.m_bSwitchingScene == false and slot3 < DNTGTEST_OBJ_STATE.EOS_DEAD then
			slot11 = slot8

			if slot8.GetTarget(slot10) == 0 then
				slot11 = slot0(slot8)
				slot14 = slot8.GetPosition(slot11).y * slot0.ONE_Y_INTERVAL

				if slot2[slot0(slot8.GetPosition(slot11).x * slot0.ONE_X_INTERVAL)] ~= nil and slot2[slot12][slot11] ~= nil then
					slot15 = slot2[slot12][slot11]

					for slot16, slot17 in pairs(slot14) do
						slot23 = false

						if slot0.BBulletHitFish(slot19, slot0, slot8, slot17) then
							slot22 = slot17

							slot0.onActionBulletHitFish(slot19, slot0, slot8)

							break
						end
					end
				end
			elseif slot0.m_MapFish[slot9] == nil then
				slot14 = 0

				slot8.SetTarget(slot12, slot8)
			else
				slot16 = true

				if slot0.BBulletHitFish(slot12, slot0, slot8, slot10) then
					slot15 = slot10

					slot0.onActionBulletHitFish(slot12, slot0, slot8)
				end
			end
		end

		if slot3 == DNTGTEST_OBJ_STATE.EOS_DEAD then
			slot14 = DNTGTEST_OBJ_TYPE.EOT_BULLET

			slot8.Clear(slot10, slot8, false, nil)

			slot0.m_MapBullet[slot7] = nil
		elseif DNTGTEST_OBJ_STATE.EOS_DEAD < slot3 then
			slot14 = DNTGTEST_OBJ_TYPE.EOT_BULLET

			slot8.Clear(slot10, slot8, true, nil)

			slot0.m_MapBullet[slot7] = nil
		end
	end
end

MyFishObjectManager.BBulletHitFish = function (slot0, slot1, slot2, slot3)
	slot4 = slot2.GetMaxRadio(slot5)
	slot5 = slot1.GetPosition(slot2)
	slot8 = slot2
	slot6 = slot2.GetPosition(slot1)

	if slot3 == true then
		slot10 = slot6.y - slot5.y
		slot8 = slot0(slot6.x - slot5.x)

		if slot0(slot8) < 20 and slot8 < 20 then
			return true
		else
			return false
		end
	end

	if slot5.x < slot6.x - slot4 or slot5.y < slot6.y - slot4 or slot5.x > slot6.x + slot4 or slot5.y > slot6.y + slot4 then
		return false
	end

	slot9 = slot2

	if #slot2.GetBoundingBox(slot8) == 1 then
		return true
	end

	slot9 = slot1(slot2)
	slot10 = slot2(slot8)
	slot13 = slot7

	for slot14, slot15 in pairs(slot8) do
		slot22 = (slot15.offsetX * slot9 + slot15.offsetY * slot10 + slot6.y) - slot5.y
		slot20 = slot0((slot15.offsetX * slot10 - slot15.offsetY * slot9 + slot6.x) - slot5.x)

		if slot0(slot20) <= slot15.rad and slot20 < slot18 then
			return true
		end
	end

	return false
end

MyFishObjectManager.onActionBulletHitFish = function (slot0, slot1, slot2)
	slot6 = DNTGTEST_OBJ_STATE.EOS_DEAD

	slot1.SetState(slot4, slot1)

	slot5 = slot2

	slot2.OnHit(slot4)

	slot7 = slot2

	slot0.controller.onActionBulletHitFish(slot4, slot0.controller, slot1)
end

MyFishObjectManager.AddFishBuff = function (slot0, slot1, slot2, slot3, slot4)
	if slot4 ~= nil then
		slot7 = "对特定fishID对鱼加Buff,未实现 ... "

		print(slot6)
	else
		slot7 = slot0.m_MapFish

		for slot8, slot9 in pairs(slot6) do
			slot15 = slot3

			slot9.AddBuff(slot11, slot9, slot1, slot2)
		end
	end
end

return
