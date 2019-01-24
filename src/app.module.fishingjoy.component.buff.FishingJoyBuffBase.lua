slot3 = {}
FishingJoyBuffBase = class(slot1, "FishingJoyBuffBase")

FishingJoyBuffBase.ctor = function (slot0, slot1, slot2, slot3)
	slot0.buffType = slot1
	slot0.buffLife = slot3
	slot0.buffParam = slot2
	slot0.executor = nil
end

FishingJoyBuffBase.getBuffType = function (slot0)
	return slot0.buffType
end

FishingJoyBuffBase.setBuffType = function (slot0, slot1)
	slot0.buffType = slot1
end

FishingJoyBuffBase.onUpdate = function (slot0, slot1)
	if slot0.buffLife > 0 then
		slot0.buffLife = slot0.buffLife - slot1
	end

	return slot0.buffLife == -1 or slot0.buffLife > 0
end

FishingJoyBuffBase.getBuffParam = function (slot0)
	return slot0.buffParam
end

FishingJoyBuffBase.setBuffParam = function (slot0, slot1)
	slot0.buffParam = slot1
end

return FishingJoyBuffBase
