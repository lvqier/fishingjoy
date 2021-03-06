slot0 = class_C("TransformScale", ClassLoader:aquireClass("TransformAction"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("start")
	slot0:addProperty("finish")
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("targetAction", nil)
	slot0:setValue("count", 1)
	slot0:setValue("start", {
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("finish", {
		z = 0,
		x = 0,
		y = 0
	})
end

slot0.update = function (slot0, slot1)
	slot2 = slot0:getValue("start")
	slot3 = slot0:getValue("finish")

	if slot1 / slot0:getValue("duration") > 1 then
		slot4 = 1
	end

	slot0:getValue("actionTarget").scale = slot2 * (1 - slot4) + slot3 * slot4
end

return slot0
