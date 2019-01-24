slot0 = class_C("TransformSpawn", ClassLoader:aquireClass("TransformAction"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("targetAction")
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
end

slot0.update = function (slot0, slot1)
	for slot6, slot7 in ipairs(slot2) do
		slot7:update(slot1)
	end
end

slot0.on_targetAction_changed = function (slot0)
	for slot5, slot6 in ipairs(slot1) do
		slot0:setValue("duration", (slot6:getValue("duration") < slot0:getValue("duration") and slot7) or slot8)
		slot6:bindSameName("actionTarget", slot0)
		slot6:setValue("actionTarget", slot0:getValue("actionTarget"))
	end
end

return slot0
