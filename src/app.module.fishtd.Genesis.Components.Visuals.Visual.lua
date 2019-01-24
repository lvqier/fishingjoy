slot0 = class_C("Visual", ClassLoader:aquireClass("Component"))

slot0.onCreate = function (slot0, slot1)
	slot0.super.onCreate(slot0)
	slot0:addProperty("position", slot1)
	slot0:addProperty("direction", slot1)
	slot0:addProperty("roll", slot1)
	slot0:addProperty("rotation", slot1)
	slot0:addProperty("scale", slot1)

	slot0._visualNode = cc.Node:create()

	slot0._visualNode:retain()
	slot0._visualNode:setCascadeOpacityEnabled(true)
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("position", {
		z = 0,
		x = 0,
		y = 0
	})
	slot0:setValue("rotation", 0)
	slot0:setValue("direction", {
		w = 1,
		z = 0,
		x = 1,
		y = 0
	})
	slot0:setValue("scale", 1)
	slot0:setValue("roll", 0)
end

slot0.onLoad = function (slot0)
	slot1 = slot0:getValue("owner")

	slot0:bindSameName("position", slot1, "TWO_WAY")
	slot0:bindSameName("direction", slot1, "TWO_WAY")
	slot0:bindSameName("rotation", slot1, "TWO_WAY")
	slot0:bindSameName("roll", slot1, "TWO_WAY")
end

slot0.onUnload = function (slot0)
	slot0.super:onUnload(slot0)
	slot0:unBindAll()
end

slot0.onDestroy = function (slot0)
	slot0.super.onDestroy(slot0)
	slot0._visualNode:release()

	slot0._visualNode = nil
end

return slot0
