slot0 = class_C("EffectFactory")

slot0.ctor = function (slot0)
	return
end

slot0.createEffectByConfig = function (slot0, slot1)
	slot2 = nil

	if slot1.nTypeID == EffectType.EffectType_Money then
		ClassLoader:aquireInstance("EffectMoney").setValue(slot2, "effectType", effectType)
		ClassLoader.aquireInstance("EffectMoney"):setValue("effectParam", {
			slot1.nTypeID,
			slot1.nParam[1],
			slot1.nParam[2]
		})
	elseif slot1.nTypeID == EffectType.EffectType_Kill then
		ClassLoader:aquireInstance("EffectKill").setValue(slot2, "effectType", effectType)
		ClassLoader.aquireInstance("EffectKill"):setValue("effectParam", {
			slot1.nTypeID,
			slot1.nParam[1],
			slot1.nParam[3]
		})
	end

	return slot2
end

return slot0
