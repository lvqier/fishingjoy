slot4 = import(slot1)
slot1 = class(".Effect", "EffectAddBuffer")

slot1.ctor = function (slot0)
	slot3 = slot0

	slot0.super.ctor(slot2)

	slot4 = DNTGTEST_EFFECT_TYPE.ADDBUFFER

	slot0.SetEffectType(slot2, slot0)

	slot0.m_nParamCount = 5
end

slot1.GetParamSize = function (slot0)
	return slot0.m_nParamCount
end

slot1.Execute = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == nil or slot4 then
		return 0, slot3
	end

	slot6 = nil

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot9 = fishgame.FishObjectManager
		slot9 = fishgame.FishObjectManager.GetInstance(slot8)
		slot6 = fishgame.FishObjectManager.GetInstance(slot8).GetAllFishes(slot8)
	else
		slot9 = slot1
		slot9 = slot1.GetFishObjectManager(slot8)
		slot6 = slot1.GetFishObjectManager(slot8).GetAllFishes(slot8)
	end

	slot7 = slot1.GetId(slot8)
	slot11 = 0
	slot8 = slot0.GetParam(slot1, slot0)
	slot12 = 1
	slot9 = slot0:GetParam(slot0)
	slot13 = 2
	slot10 = slot0:GetParam(slot0)
	slot14 = 3
	slot11 = slot0:GetParam(slot0)
	slot15 = 4
	slot12 = slot0:GetParam(slot0)
	slot13 = slot1.GetPosition(slot0).x
	slot14 = slot1:GetPosition().y
	slot17 = slot6

	for slot18, slot19 in pairs(slot1) do
		slot22 = slot19

		if slot19.GetId(slot21) ~= slot7 then
			if slot8 == 0 then
				slot25 = slot12

				slot19.AddBuff(slot21, slot19, slot10, slot11)
			elseif slot8 == 1 then
				slot23 = slot19

				if (slot13 - slot19.GetPosition(slot21).x) * (slot13 - slot19.GetPosition(slot21).x) + (slot14 - slot19:GetPosition().y) * (slot14 - slot19.GetPosition().y) <= slot9 * slot9 then
					slot29 = slot12

					slot19.AddBuff(slot25, slot19, slot10, slot11)
				end
			elseif slot8 == 2 then
				slot22 = slot19

				if slot19.GetTypeID(slot21) == slot9 then
					slot25 = slot12

					slot19.AddBuff(slot21, slot19, slot10, slot11)
				end
			end
		end
	end

	slot18 = "dingpingXueHua"

	eventMgr.dispatch(slot16, eventMgr)

	return 0, slot3
end

return slot1
