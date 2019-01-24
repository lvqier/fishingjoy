slot1 = class("EffectKill", import(".Effect"))

slot1.ctor = function (slot0)
	slot0.super.ctor(slot0)
	slot0:SetEffectType(DNTG_EffectType.ETP_KILL)

	slot0.m_nParamCount = 3
end

slot1.Execute = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		return 0, slot3
	end

	slot5 = 0
	slot7 = slot0:GetParam(0)
	slot8 = slot0:GetParam(1)
	slot9 = slot1:GetId()
	slot10 = slot1:GetPosition()
	slot11 = slot1:GetRefershID()

	for slot15, slot16 in ipairs(slot6) do
		if slot16:GetId() ~= slot9 and slot16:GetState() < DNTG_EOS_OBJ.EOS_DEAD then
			if slot7 == 0 and slot16:InSideScreen() and slot16:GetMoveCompent():HasBeginMove() then
				slot17, slot3 = slot16:ExecuteEffects(slot2, slot3, slot4)
				slot5 = slot5 + slot17

				eventMgr:dispatch("EffectKillFish", {
					beginPos = slot10,
					endPos = slot16:GetPosition(),
					lightType = {
						animation = "move",
						image = "fish_42"
					}
				})
			elseif slot7 == 1 and slot16:InSideScreen() and slot16:GetMoveCompent():HasBeginMove() then
				if math.sqrt((slot10.x - slot16:GetPosition().x) * () + (slot10.y - slot16:GetPosition().y) * ()) < slot8 then
					slot21, slot3 = slot16:ExecuteEffects(slot2, slot3, slot4)
					slot5 = slot5 + slot21

					eventMgr:dispatch("EffectKillFish", {
						beginPos = slot10,
						endPos = slot16:GetPosition(),
						lightType = {
							animation = "move",
							image = "fish_42"
						}
					})
				end
			elseif slot7 == 2 and slot16:InSideScreen() and slot16:GetMoveCompent():HasBeginMove() then
				if slot8 == slot16:GetTypeID() and slot16:GetFishType() == DNTG_SpecialFishType.ESFT_NORMAL then
					slot17, slot3 = slot16:ExecuteEffects(slot2, slot3, slot4)
					slot5 = slot5 + slot17

					eventMgr:dispatch("EffectKillFish", {
						beginPos = slot10,
						endPos = slot16:GetPosition(),
						lightType = {
							animation = "move",
							image = "fish_41"
						}
					})
				end
			elseif slot7 == 3 and slot16:GetRefershID() == slot11 then
				if slot16:InSideScreen() and slot16:GetMoveCompent():HasBeginMove() then
					slot17, slot3 = slot16:ExecuteEffects(slot2, slot3, slot4)
					slot5 = slot5 + slot17

					eventMgr:dispatch("EffectKillFish", {
						beginPos = slot10,
						endPos = slot16:GetPosition(),
						lightType = {
							animation = "move",
							image = "fish_40"
						}
					})
				else
					slot16:SetState(DNTG_EOS_OBJ.EOS_DEAD)
				end
			end
		end
	end

	if slot0:GetParam(2) < slot5 / slot2:GetScore() then
		slot5 = slot2:GetScore() * slot0:GetParam(2)
	end

	return slot5, slot3
end

return slot1
