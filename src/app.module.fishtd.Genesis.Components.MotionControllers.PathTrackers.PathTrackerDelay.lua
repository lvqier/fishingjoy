slot0 = class_C("PathTrackerDelay", ClassLoader:aquireClass("PathTracker"))

slot0.onCreate = function (slot0, slot1)
	slot0.super.onCreate(slot0, slot1)

	slot0._duration = slot1.delay
end

slot0.updateProperty = function (slot0, slot1, slot2)
	return
end

return slot0
