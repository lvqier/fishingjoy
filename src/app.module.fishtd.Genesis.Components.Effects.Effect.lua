slot0 = class_C("Effect", ClassLoader:aquireClass("Component"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("effectType")
	slot0:addProperty("effectParam")
	slot0:addProperty("isDead")
end

slot0.onLoad = function (slot0)
	slot0.super.onLoad(slot0)
	slot0:bindSameName("isDead", slot0:getValue("owner"), "TWO_WAY")
end

slot0.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
end

slot0.on_isDead_changed = function (slot0)
	if slot0:getValue("isDead") then
		slot0:execute()
	end
end

slot0.execute = function (slot0)
	return
end

return slot0
