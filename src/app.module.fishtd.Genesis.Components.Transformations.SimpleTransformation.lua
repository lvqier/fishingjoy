slot0 = class_C("SimpleTransformation", ClassLoader:aquireClass("Component"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("timeElapsed")
	slot0:addProperty("timeOverflow")
	slot0:addProperty("isDead")
	slot0:addProperty("isRemoved")
	slot0:addProperty("transformAction")
	slot0:addProperty("transformTarget")

	slot0._updateDelta = 0
	slot0._chasingCounter = 0
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("timeElapsed", 0)
	slot0:setValue("timeOverflow", 0)
	slot0:setValue("isDead", false)
	slot0:setValue("isRemoved", false)
	slot0:setValue("transformAction", nil)
	slot0:setValue("transformTarget", {
		scale = 1,
		roll = 0,
		position = {
			z = 0,
			x = 0,
			y = 0
		},
		direction = {
			z = 0,
			x = 0,
			y = 0
		}
	})
end

slot0.onLoad = function (slot0)
	slot1 = slot0:getValue("owner")

	slot0:bindSameName("timeOverflow", slot1, "TWO_WAY")
	slot0:bindSameName("isDead", slot1, "TWO_WAY")
	slot0:bindSameName("isRemoved", slot1, "TWO_WAY")
end

slot0.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
	slot0:unBindAll()
end

slot0.onUpdate = function (slot0, slot1)
	if slot0:getValue("isDead") then
		slot0._updateDelta = 0

		return
	end

	if slot0:getValue("timeOverflow") > 0 and math.abs(slot2 - slot0._chasingCounter) > 1e-05 then
		if slot2 < slot0._chasingCounter + slot1 * (0.2 + 2 * (1 - slot0._chasingCounter / slot2)) then
			slot5 = slot2 - slot0._chasingCounter
			slot0._chasingCounter = slot2
		else
			slot0._chasingCounter = slot6
		end

		slot0._updateDelta = slot1 + slot5
	else
		slot0._updateDelta = slot1
	end

	slot0:setValue("timeElapsed", slot0:getValue("timeElapsed") + slot0._updateDelta)

	slot4 = slot0:getValue("transformAction")

	slot4:setValue("actionTarget", slot3)
	slot4:update(slot0:getValue("timeElapsed"))
end

slot0.on_timeOverflow_changed = function (slot0)
	slot0._chasingCounter = 0
end

return slot0
