slot0 = class_C("TransformDirection", ClassLoader:aquireClass("TransformAction"))

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

	slot0:getValue("actionTarget").direction.x = slot2.x * (1 - slot4) + slot3.x * slot4
	slot0.getValue("actionTarget").direction.y = slot2.y * (1 - slot4) + slot3.y * slot4
	slot0.getValue("actionTarget").direction.z = slot2.z * (1 - slot4) + slot3.z * slot4
end

return slot0
