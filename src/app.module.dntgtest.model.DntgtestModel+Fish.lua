slot0 = class(slot1)
slot3 = "dntgtest.dntgLogic.MyObject"
slot1 = requireLuaFromModule("Fish")

slot0.ctor = function (slot0)
	slot4 = slot0

	ClassUtil.extends(slot2, slot0)

	slot0.m_nRedTime = 0
	slot0.m_fMaxRadio = 0
	slot0.bbList = {}
	slot0.m_effects = {}
	slot0.m_pVisualData = {}
	slot0.vusualID = 0
end

slot0.GetType = function (slot0)
	return DNTGTEST_OBJ_TYPE.EOT_FISH
end

slot0.GetParticle = function (slot0)
	if slot0.m_fishConfigData ~= nil then
		if slot0.m_fishConfigData.Particle == nil then
			return ""
		end

		return slot0.m_fishConfigData.Particle
	end

	return ""
end

slot0.SetVisualData = function (slot0, slot1)
	slot0._VisualData = slot1
	slot0.vusualID = slot1.Id
end

slot0.GetVisualData = function (slot0)
	return slot0._VisualData
end

slot0.SetyyVisualData = function (slot0, slot1)
	slot0._yyVisualData = slot1
end

slot0.GetyyVisualData = function (slot0)
	return slot0._yyVisualData
end

slot0.SetVisualID = function (slot0, slot1)
	slot0.m_FishVisualID = slot1
end

slot0.GetVisualID = function (slot0)
	return slot0.m_FishVisualID or 0
end

slot0.SetBoundingBoxID = function (slot0, slot1)
	slot0.m_BoundingBoxID = slot1
end

slot0.GetBoundingBoxID = function (slot0)
	return slot0.m_BoundingBoxID
end

slot0.SetTypeID = function (slot0, slot1)
	slot0.m_nTypeId = slot1
end

slot0.GetTypeID = function (slot0)
	return slot0.m_nTypeId
end

slot0.SetFishType = function (slot0, slot1)
	slot0.m_FishType = slot1
end

slot0.GetFishType = function (slot0, slot1)
	return slot0.m_FishType
end

slot0.SetFishCofigData = function (slot0, slot1)
	slot0.m_fishConfigData = slot1
end

slot0.GetFishCofigData = function (slot0)
	return slot0.m_fishConfigData
end

slot0.SetRefershID = function (slot0, slot1)
	slot0.m_nRefershID = slot1
end

slot0.GetRefershID = function (slot0)
	return slot0.m_nRefershID
end

slot0.SetScore = function (slot0, slot1)
	slot0.m_nMul = slot1
end

slot0.GetScore = function (slot0)
	return slot0.m_nMul
end

slot0.SetCreateTick = function (slot0, slot1)
	slot0.m_nCreateTick = slot1
end

slot0.AddEffect = function (slot0, slot1)
	slot5 = slot1

	table.insert(slot3, slot0.m_effects)
end

slot0.ExecuteEffects = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = 0
	slot6 = slot0.GetId(slot7)
	slot9 = slot2

	for slot10, slot11 in ipairs(slot0) do
		slot14 = slot11

		if slot11.GetId(slot13) == slot6 then
			return slot5, slot2
		end
	end

	slot9 = slot0

	if slot0.GetState(slot8) < DNTGTEST_OBJ_STATE.EOS_DEAD then
		slot10 = slot0

		table.insert(slot8, slot2)

		slot9 = slot0.m_effects

		for slot10, slot11 in pairs(slot8) do
			slot19 = slot4
			slot5, slot2 = slot11.Execute(slot13, slot11, slot0, slot1, slot2, slot3)
		end
	end

	return slot5, slot2
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

slot0.AddBoundingBox = function (slot0, slot1, slot2, slot3)
	slot0.bbList[#slot0.bbList + 1] = {
		offsetX = slot1,
		offsetY = slot2,
		rad = slot3
	}
	slot10 = slot1
	slot8 = math.abs(slot9) + slot3
	slot0.m_fMaxRadio = math.max(#slot0.bbList + 1, slot0.m_fMaxRadio)
	slot10 = slot2
	slot8 = math.abs(slot9) + slot3
	slot0.m_fMaxRadio = math.max(#slot0.bbList + 1, slot0.m_fMaxRadio)
end

slot0.GetBoundingBox = function (slot0)
	return slot0.bbList
end

slot0.GetMaxRadio = function (slot0)
	return slot0.m_fMaxRadio or 0
end

slot0.OnUpdate = function (slot0, slot1)
	slot5 = slot1

	slot0.super.OnUpdate(slot3, slot0)

	if slot0.m_nRedTime > 0 then
		slot0.m_nRedTime = slot0.m_nRedTime - 1

		if slot0.m_nRedTime == 0 then
			slot2 = pairs
			slot4 = slot0.m_pVisualNodeList or {}

			for slot5, slot6 in slot2(slot3) do
				if slot6.target and slot6.yinying ~= true and slot6.bSpecialShow ~= true then
					slot9 = slot6.target
					slot14 = 255

					slot6.target.setColor(slot8, cc.c3b(slot11, 255, 255))
				end
			end
		end
	end
end

slot0.OnHit = function (slot0)
	slot1 = pairs
	slot3 = slot0.m_pVisualNodeList or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5.target and slot5.yinying ~= true and slot5.bSpecialShow ~= true then
			slot8 = slot5.target
			slot13 = 209

			slot5.target.setColor(slot7, cc.c3b(slot10, 255, 82))
		end
	end

	slot0.m_nRedTime = 5
end

return slot0
