slot3 = {}
slot0 = class(slot1, "FishingJoyEffectFactory")

slot0.ctor = function (slot0)
	slot0.effectFactory = {}
end

slot0.createEffect = function (slot0, slot1)
	if slot0.effectFactory[slot1 + 10] then
		return slot2.new()
	end
end

slot0.registerEffectClass = function (slot0, slot1, slot2)
	slot0.effectFactory[slot1 + 10] = slot2
end

return slot0
