slot3 = {}
slot0 = class(slot1, "FishingJoyEffectBase")

slot0.ctor = function (slot0)
	slot0.effectParam = {}
	slot0.effectParamCount = 2
	slot0.effectType = FISHINGJOY_EFFECT_TYPE.NONE
end

slot0.setEffectType = function (slot0, slot1)
	slot0.effectType = slot1
end

slot0.getEffectParam = function (slot0, slot1)
	return slot0.effectParam[slot1 + 1] or 0
end

slot0.setEffectParam = function (slot0, slot1, slot2)
	slot0.effectParam[slot1 + 1] = slot2
end

slot0.executeEffect = function (slot0)
	return
end

return slot0
