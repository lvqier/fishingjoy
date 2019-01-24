module("DepthUtil", package.seeall)

function checkDisplayObjectDepth(slot0, slot1, slot2, slot3)
	if slot3 == nil then
		slot3 = 1
	end

	if slot3 == 1 and slot0.checkDepth then
		slot0:checkDepth(slot2 or 0)
	else
		slot1 = slot1 or slot0:getChildren()
		slot4 = {}

		for slot8, slot9 in ipairs(slot1) do
			slot4[tostring(slot9)] = true
		end

		slot2 = slot2 or 0

		if slot3 == 1 then
			table.sort(slot1, function (slot0, slot1)
				if slot0 and slot1 then
					if not numberEqual(slot0._posCached or DisplayUtil.ccpCopy(slot0:getPosition()).y, slot1._posCached or DisplayUtil.ccpCopy(slot1:getPosition()).y) then
						return slot3.y < slot2.y
					elseif not numberEqual(slot2.x, slot3.x) then
						return slot3.x < slot2.x
					else
						return (slot0.__specialZorder or 0) > (slot1.__specialZorder or 0)
					end
				end

				return slot0 == nil
			end)
		elseif slot3 == 2 then
			table.sort(slot1, function (slot0, slot1)
				return slot1:getPositionX() < slot0:getPositionX()
			end)
		elseif slot3 == 3 then
			table.sort(slot1, function (slot0, slot1)
				return slot1:getPositionY() < slot0:getPositionY()
			end)
		end

		for slot8, slot9 in ipairs(slot1) do
			if slot9:getParent() == slot0 then
				slot0:reorderChild(slot9, slot8 + slot2 + (slot9.__specialOffsetZorder or 0))
			end
		end
	end
end

return
