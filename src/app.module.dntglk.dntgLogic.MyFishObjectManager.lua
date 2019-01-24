slot0 = math.floor
slot1 = math.sin
slot2 = math.cos
slot3 = math.pow
slot4 = math.abs
slot5 = requireLuaFromModule(slot6)
slot8 = cc.Director
slot8 = cc.Director.getInstance("dntglk.dntgLogic.LuaObjectPool")
slot7 = 1440 / cc.Director.getInstance("dntglk.dntgLogic.LuaObjectPool").getVisibleSize("dntglk.dntgLogic.LuaObjectPool").width
slot8 = 900 / cc.Director.getInstance("dntglk.dntgLogic.LuaObjectPool").getVisibleSize("dntglk.dntgLogic.LuaObjectPool").height
slot11 = "MyFishObjectManager"
slot9 = class(slot10)

slot9.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot10 = slot2

	slot0.SetFishLayer(slot8, slot0)

	slot10 = slot1

	slot0.SetController(slot8, slot0)

	slot0.m_bLoaded = false
	slot0.m_bSwitchingScene = false
	slot0.m_MapFish = {}
	slot0.m_MapBullet = {}
	slot0._math_floor = math.floor
	slot0._math_abs = math.abs
	slot0._math_sin = math.sin
	slot0._math_cos = math.cos
	slot0.BBulletHitFish = slot0.BBulletHitFish
	slot0.onActionBulletHitFish = slot0.onActionBulletHitFish
	slot13 = slot6

	slot0.Init(slot8, slot0, slot3, slot4, slot5)

	slot0._tempPos = {
		x = 0,
		y = 0
	}
	slot0.OnUpdate = slot0.OnUpdate
end

slot9.SetController = function (slot0, slot1)
	slot0.controller = slot1
end

slot9.GetController = function (slot0)
	return slot0.controller
end

slot9.GetFishLayer = function (slot0)
	return slot0._fishLayer
end

slot9.SetFishLayer = function (slot0, slot1)
	slot0._fishLayer = slot1
end

slot9.Init = function (slot0, slot1, slot2, slot3, slot4)
	slot0.m_nServerWidth = slot3
	slot0.m_nServerHeight = slot4
	slot0.m_nClientWidth = slot1
	slot0.m_nClientHeight = slot2
	slot0.X_COUNT = 8
	slot0.Y_COUNT = 4
	slot0.ONE_X_INTERVAL = slot0.X_COUNT / slot0.m_nServerWidth
	slot0.ONE_Y_INTERVAL = slot0.Y_COUNT / slot0.m_nServerHeight
end

slot9.SetGameLoaded = function (slot0, slot1)
	slot0.m_bLoaded = slot1
end

slot9.GetGameLoaded = function (slot0)
	return slot0.m_bLoaded
end

slot9.SetSwitchingScene = function (slot0, slot1)
	slot0.m_bSwitchingScene = slot1

	if slot0.m_bSwitchingScene then
		slot4 = slot0.controller.model
		slot2 = slot0.controller.model.getFishPlayer(slot3)

		for slot6 = 1, 4, 1 do
			if slot2[slot6] then
				slot10 = 0

				slot2[slot6].SetLockFishID(slot8, slot2[slot6])

				slot2[slot6].__manualLockFish = false
			end
		end

		slot5 = slot0.m_MapBullet

		for slot6, slot7 in pairs(slot4) do
			slot7._pTarget = nil
		end
	end
end

slot9.GetSwitchingScene = function (slot0)
	return slot0.m_bSwitchingScene
end

slot9.AddBullet = function (slot0, slot1)
	if slot1 == nil then
		return false
	end

	slot4 = slot1

	if slot0.m_MapBullet[slot1.GetId(slot3)] == nil then
		slot0.m_MapBullet[slot2] = slot1
		slot6 = slot0

		slot1.SetFishObjectManager(slot4, slot1)

		slot5 = slot1

		slot1.initRenderObjects(slot4)

		slot6 = 0.016

		slot1.OnUpdate(slot4, slot1)

		return true
	end

	return false
end

slot9.FindBullet = function (slot0, slot1)
	return slot0.m_MapBullet[slot1]
end

slot9.RemoveAllBullets = function (slot0, slot1)
	slot2 = pairs
	slot4 = slot0.m_MapBullet or {}

	for slot5, slot6 in slot2(slot3) do
		slot11 = slot1

		slot6.Clear(slot8, slot6, true)
	end

	slot0.m_MapBullet = {}

	return true
end

slot9.AddFish = function (slot0, slot1)
	if slot1 == nil then
		return false
	end

	slot4 = slot1

	if slot0.m_MapFish[slot1.GetId(slot3)] == nil then
		slot0.m_MapFish[slot2] = slot1
		slot6 = DNTGLK_OBJ_STATE.EOS_LIVE

		slot1.SetState(slot4, slot1)

		slot6 = slot0

		slot1.SetFishObjectManager(slot4, slot1)

		slot5 = slot1

		slot1.initRenderObjects(slot4)

		slot6 = 0.016

		slot1.OnUpdate(slot4, slot1)

		return true
	end

	return false
end

slot9.FindFish = function (slot0, slot1)
	return slot0.m_MapFish[slot1]
end

slot9.FindLockFish = function (slot0, slot1)
	return slot0.m_MapFish[slot1]
end

slot9.GetAllFishes = function (slot0)
	return slot0.m_MapFish or {}
end

slot9.RemoveAllFishes = function (slot0, slot1)
	slot4 = slot0.m_MapFish

	for slot5, slot6 in pairs(slot3) do
		slot11 = slot1

		slot6.Clear(slot8, slot6, true)
	end

	slot0.m_MapFish = {}

	return true
end

slot9.OnUpdate = function (slot0, slot1, slot2)
	slot3 = {}
	slot4 = 0
	slot5 = pairs
	slot7 = slot0.m_MapFish or {}

	for slot8, slot9 in slot5(slot6) do
		if slot9.m_nState == DNTGLK_OBJ_STATE.EOS_DEAD then
			slot15 = DNTGLK_OBJ_TYPE.EOT_FISH

			slot9.Clear(slot11, slot9, false, nil)

			slot0.m_MapFish[slot8] = nil
			slot15 = slot9

			slot0.recycleObject(nil, slot0, "fish", "GENERAL")
		elseif slot4 == DNTGLK_OBJ_STATE.EOS_DESTORY then
			slot15 = DNTGLK_OBJ_TYPE.EOT_FISH

			slot9.Clear(slot11, slot9, true, nil)

			slot0.m_MapFish[slot8] = nil
			slot15 = slot9

			slot0.recycleObject(nil, slot0, "fish", "GENERAL")
		elseif slot4 == DNTGLK_OBJ_STATE.EOS_TIMEOUT then
			if slot9.dwServerTick <= slot0.controller.currentConfirmed then
				slot13 = DNTGLK_OBJ_STATE.EOS_DESTORY

				slot9.SetState(slot11, slot9)
			end
		else
			if slot9.dwServerTick <= slot0.controller.currentServerTick then
				slot14 = (slot0.controller.currentServerTick - slot9.dwServerTick) / 1000

				slot9.OnUpdate(slot12, slot9)

				slot9.dwServerTick = slot0.controller.currentServerTick
				slot9.damping = 1
			else
				slot9.damping = slot9.damping * 0.9
				slot14 = slot1 * slot9.damping

				slot9.OnUpdate(slot12, slot9)

				slot9.dwServerTick = slot9.dwServerTick + slot1 * slot9.damping * 1000
			end

			if slot9.m_nState < DNTGLK_OBJ_STATE.EOS_DYING then
				if slot9.useMultiPointsLocking then
					slot10 = slot9.m_pVisualNodeList[2]
					slot14 = slot9.bbList

					for slot15, slot16 in ipairs(slot13) do
						slot21 = slot16.binding
						slot16.offsetX = slot10.getBoneData(slot19, slot10).x
						slot16.offsetY = slot10.getBoneData(slot19, slot10).y
					end
				end

				slot14 = slot0._math_floor((slot9.m_pPosition.x + slot9.m_fMaxRadio) * slot0.ONE_X_INTERVAL)
				slot17 = (slot9.m_pPosition.y + slot9.m_fMaxRadio) * slot0.ONE_Y_INTERVAL
				slot15 = slot0._math_floor((slot9.m_pPosition.y - slot9.m_fMaxRadio) * slot0.ONE_Y_INTERVAL)

				for slot19 = slot0._math_floor(slot13), slot0._math_floor((slot9.m_pPosition.x - slot9.m_fMaxRadio) * slot0.ONE_X_INTERVAL), 1 do
					for slot23 = slot14, slot15, 1 do
						if slot23 >= 0 and slot23 < slot0.Y_COUNT and slot19 >= 0 and slot19 < slot0.X_COUNT then
							if slot3[slot23] == nil then
								slot3[slot23] = {}
							end

							if slot3[slot23][slot19] == nil then
								slot3[slot23][slot19] = {}
							end

							slot3[slot23][slot19][#slot3[slot23][slot19] + 1] = slot9
						end
					end
				end
			end
		end
	end

	slot5 = pairs
	slot7 = slot0.m_MapBullet or {}

	for slot8, slot9 in slot5(slot6) do
		slot13 = slot2 / 1000

		slot9.OnUpdate(slot11, slot9)

		slot4 = slot9.m_nState

		if slot0.m_bSwitchingScene == false and slot4 < DNTGLK_OBJ_STATE.EOS_DEAD then
			if slot9._pTarget then
				if slot10.m_nState < DNTGLK_OBJ_STATE.EOS_DEAD then
					slot15 = slot10

					if slot0.BulletHitLockingFish(slot12, slot0, slot9) then
						slot15 = slot10

						slot0.onActionBulletHitFish(slot12, slot0, slot9)
					end
				else
					slot9._pTarget = nil
				end
			else
				slot12 = slot0._math_floor(slot13)
				slot15 = slot9.m_pPosition.y * slot0.ONE_Y_INTERVAL

				if slot3[slot0._math_floor(slot9.m_pPosition.x * slot0.ONE_X_INTERVAL)] ~= nil and slot3[slot13][slot12] ~= nil then
					slot16 = slot3[slot13][slot12]

					for slot17, slot18 in pairs(slot15) do
						slot24 = false

						if slot0.BBulletHitFish(slot20, slot0, slot9, slot18) > 0 then
							slot25 = slot19

							slot0.onActionBulletHitFish(slot21, slot0, slot9, slot18)

							break
						end
					end
				end
			end
		end

		if slot4 == DNTGLK_OBJ_STATE.EOS_DEAD then
			slot15 = DNTGLK_OBJ_TYPE.EOT_BULLET

			slot9.Clear(slot11, slot9, false, nil)

			slot0.m_MapBullet[slot8] = nil
			slot15 = slot9

			slot0.recycleObject(nil, slot0, "bullet", "GENERAL")
		elseif DNTGLK_OBJ_STATE.EOS_DEAD < slot4 then
			slot15 = DNTGLK_OBJ_TYPE.EOT_BULLET

			slot9.Clear(slot11, slot9, true, nil)

			slot0.m_MapBullet[slot8] = nil
			slot15 = slot9

			slot0.recycleObject(nil, slot0, "bullet", "GENERAL")
		end
	end
end

slot9.BulletHitLockingFish = function (slot0, slot1, slot2)
	slot3 = slot1.m_pPosition
	slot0._tempPos.x = slot2.m_pPosition.x
	slot0._tempPos.y = slot2.m_pPosition.y

	if slot1.lockingIndex > 0 then
		slot5 = slot0._math_sin(slot6)
		slot8 = slot2.m_fDirection
		slot6 = slot0._math_cos(slot4)
		slot7 = slot2.bbList[slot1.lockingIndex]
		slot8 = 1

		if slot2.bbList.useBinding then
			slot11 = slot4

			if math.cos(slot10) < 0 then
				slot11 = ProxyDntglk.model

				if ProxyDntglk.model.getMirror(slot10) then
					slot8 = -1
				end
			end
		end

		if slot2.bbList.useBinding then
			slot11 = slot4

			if math.cos(slot10) > 0 then
				slot11 = ProxyDntglk.model

				if not ProxyDntglk.model.getMirror(slot10) then
					slot8 = -1
				end
			end
		end

		slot0._tempPos.x = (slot0._tempPos.x + slot7.offsetX * slot6 * slot0) - slot7.offsetY * slot5 * slot1 * slot8
		slot0._tempPos.y = slot0._tempPos.y + slot7.offsetX * slot5 * slot0 + slot7.offsetY * slot6 * slot1 * slot8
	end

	slot7 = slot0._tempPos.y - slot3.y
	slot5 = slot0._math_abs(slot0._tempPos.x - slot3.x)

	if slot0._math_abs(slot5) < 20 and slot5 < 20 then
		return true
	else
		return false
	end
end

slot9.BBulletHitFish = function (slot0, slot1, slot2)
	if slot1.m_pPosition.x < slot2.m_pPosition.x - slot2.m_fMaxRadio or slot4.y < slot5.y - slot3 or slot4.x > slot5.x + slot3 or slot4.y > slot5.y + slot3 then
		return 0
	end

	if slot2.bbList.size == 1 then
		return 1
	end

	slot8 = slot0._math_sin(slot9)
	slot11 = slot2.m_fDirection
	slot9 = slot0._math_cos(slot7)

	for slot13 = 1, slot6.size, 1 do
		slot14 = slot6[slot13]
		slot15 = 1

		if slot6.useBinding then
			slot18 = slot7

			if math.cos(slot17) < 0 then
				slot18 = ProxyDntglk.model

				if ProxyDntglk.model.getMirror(slot17) then
					slot15 = -1
				end
			end
		end

		if slot6.useBinding then
			slot18 = slot7

			if math.cos(slot17) > 0 then
				slot18 = ProxyDntglk.model

				if not ProxyDntglk.model.getMirror(slot17) then
					slot15 = -1
				end
			end
		end

		slot22 = (slot14.offsetX * slot8 * slot0 + slot14.offsetY * slot9 * slot1 * slot15 + slot5.y) - slot4.y
		slot20 = slot0._math_abs((slot14.offsetX * slot9 * slot0 - slot14.offsetY * slot8 * slot1 * slot15 + slot5.x) - slot4.x)

		if slot0._math_abs(slot20) <= slot14.rad and slot20 < slot18 then
			return slot13
		end
	end

	return 0
end

slot9.onActionBulletHitFish = function (slot0, slot1, slot2, slot3)
	slot7 = DNTGLK_OBJ_STATE.EOS_DEAD

	slot1.SetState(slot5, slot1)

	slot6 = slot2

	slot2.OnHit(slot5)

	slot9 = slot3

	slot0.controller.onActionBulletHitFish(slot5, slot0.controller, slot1, slot2)
end

slot9.AddFishBuff = function (slot0, slot1, slot2, slot3, slot4)
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

return slot9
