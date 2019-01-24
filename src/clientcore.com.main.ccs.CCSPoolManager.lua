CCSPoolManager = class("CCSPoolManager")

CCSPoolManager.ctor = function (slot0)
	slot0._pool = {}
end

CCSPoolManager.get = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = true
	slot6 = nil
	slot7 = slot0._pool[slot1]

	if not slot4 and slot7 then
		slot6 = TableUtil.pop(slot7)
	end

	if not slot6 then
		slot5 = false

		if slot2 then
			slot6 = ResConfig.loadCsNode(slot1, slot3)
		else
			ResConfig.loadCsLayout(slot1, slot3):setPosition(0, 0)
		end

		slot6.__ccsPoolCacheKey = slot1

		slot6:retain()
	end

	if slot5 then
		if slot3 then
			slot6.model = slot3.model
			slot6.controller = slot3.controller
		end

		slot6:setVisible(true)
		slot6:setOpacity(255)
		slot6:setScaleX(1)
		slot6:setScaleY(1)
	end

	return slot6, slot5
end

CCSPoolManager.put = function (slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = false

	if slot1.__ccsPoolCacheKey then
		slot2 = true

		if not slot0._pool[slot1.__ccsPoolCacheKey] then
			slot0._pool[slot1.__ccsPoolCacheKey] = {}
		end

		if slot1.resetInPool then
			slot1:resetInPool()
		elseif slot1.root and slot1.root.resetInPool then
			slot1.root:resetInPool()
		end

		slot1:removeFromParent()
		TableUtil.push(slot3, slot1, true)
	end

	return slot2
end

CCSPoolManager.clearCache = function (slot0)
	slot0._pool = {}

	for slot5, slot6 in pairs(slot1) do
		for slot10, slot11 in ipairs(slot6) do
			if slot11.destroy then
				slot11:destroy()
			elseif slot11.root and slot11.root.destroy then
				slot11.root:destroy()
				slot11:removeFromParent()
			elseif slot11.view and slot11.view.destroy then
				slot11.view:destroy()
				slot11:removeFromParent()
			else
				slot11:removeFromParent()
			end

			slot11:release()
		end
	end
end

ccsPoolMgr = CCSPoolManager.new()

return
