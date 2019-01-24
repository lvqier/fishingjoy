slot0 = class_C("Component", ClassLoader:aquireClass("Entity"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("owner")
end

slot0.onLoad = function (slot0)
	return
end

slot0.onUnload = function (slot0)
	return
end

slot0.onReset = function (slot0)
	return
end

return slot0
