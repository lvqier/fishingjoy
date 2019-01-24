slot0 = class_C("TransformSwing", ClassLoader:aquireClass("TransformAction"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("targetAction")
	slot0:addProperty("count")
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("count", 1)
end

slot0.update = function (slot0, slot1)
	slot5 = slot0:getValue("targetAction").getValue(slot2, "duration") * 2

	if slot4 > (slot3 or slot1) - slot5 * math.floor((slot3 or slot1) / slot5) then
		slot2:update(slot1)
	else
		slot2:update(slot5 - slot1)
	end
end

slot0.on_targetAction_changed = function (slot0)
	slot1 = slot0:getValue("targetAction")

	slot0:setValue("duration", slot1:getValue("duration") * 2 * slot0:getValue("count"))
	slot1:bindSameName("actionTarget", slot0)
	slot1:setValue("actionTarget", slot0:getValue("actionTarget"))
end

return slot0
