slot0 = class_C("TransformAction", ClassLoader:aquireClass("Entity"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("actionTarget")
	slot0:addProperty("duration")
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("duration", 0)
	slot0:setValue("actionTarget", {
		roll = 0,
		scale = 1,
		position = {
			z = 0,
			x = 0,
			y = 0
		},
		direction = {
			z = 0,
			x = 1,
			y = 0
		}
	})
end

slot0.update = function (slot0, slot1)
	return
end

return slot0
