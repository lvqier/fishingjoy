slot2 = "FishingJoyEffectCreate"
slot5 = "component.effect.FishingJoyEffectBase"
slot0 = class(slot1, FishingJoyRequireLua(slot4))

slot0.ctor = function (slot0)
	slot3 = slot0

	slot0.super.ctor(slot2)

	slot4 = FISHINGJOY_EFFECT_TYPE.CREATE

	slot0.setEffectType(slot2, slot0)

	slot0.effectParamCount = 4
end

slot0.getEffectParamSize = function (slot0)
	return slot0.effectParamCount
end

slot0.executeEffect = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil or slot4 then
		return 0, slot3
	end

	return 0, slot3
end

return slot0
