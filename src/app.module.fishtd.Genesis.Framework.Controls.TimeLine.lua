slot0 = ClassLoader:aquireClass("BaseNode")
slot1 = ClassLoader:aquireClass("Tools")
slot2 = ClassLoader:aquireClass("Timer")
slot3 = class_C("TimeLine", function ()
	return slot0:create()
end)

slot3.ctor = function (slot0)
	slot0._timer = slot0:create()

	slot0._timer:addScheme(slot1:thisCall(slot2.scheduler, slot0), 0, slot0.REPEAT_FOREVER, "TIMELINE_SCHEDULER")
	slot0._timer:start()
	slot0:addChild(slot0._timer)

	slot0._usingExteriorTimer = false
	slot0._running = false
	slot0._actions = {}
end

slot3.onEnter = function (slot0)
	slot0._running = true

	if slot0._usingExteriorTimer then
		slot0._timer:addScheme(slot0:thisCall(slot1.scheduler, slot0), 0, slot2.REPEAT_FOREVER, "TIMELINE_SCHEDULER")
	end
end

slot3.onExit = function (slot0)
	slot0._running = false

	if slot0._usingExteriorTimer then
		slot0._timer:removeSchemeByName("TIMELINE_SCHEDULER")
	end
end

slot3.pushAction = function (slot0, slot1, slot2, slot3)
	return
end

slot3.stopCategory = function (slot0, slot1)
	return
end

slot3.pauseCategory = function (slot0, slot1)
	return
end

slot3.resetCategory = function (slot0, slot1)
	return
end

slot3.removeActionByName = function (slot0, slot1, slot2)
	return
end

slot3.scheduler = function (slot0)
	return
end

slot3.useExteriorTimer = function (slot0, slot1)
	if not slot0._usingExteriorTimer then
		slot0._timer:removeFromParent()
	end

	slot0._timer = slot1

	if slot0._running then
		slot0._timer:addScheme(slot0:thisCall(slot1.scheduler, slot0), 0, slot2.REPEAT_FOREVER, "TIMELINE_SCHEDULER")
	end
end

return slot3
