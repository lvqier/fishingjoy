slot2 = "FishingJoyBuffSpeed"
slot5 = "entity.FishingJoyBuffBase"
FishingJoyBuffSpeed = class(slot1, FishingJoyRequireLua(slot4))

FishingJoyBuffSpeed.ctor = function (slot0)
	slot3 = slot0

	FishingJoyBuffSpeed.super.ctor(slot2)

	slot4 = FISHINGJOY_BUFF_TYPE.CHANGESPEED

	slot0.setBuffType(slot2, slot0)
end

FishingJoyBuffSpeed.getBuffParam = function (slot0)
	return slot0.buffParam
end

return FishingJoyBuffSpeed
