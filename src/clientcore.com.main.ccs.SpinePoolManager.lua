SpinePoolManager = class("SpinePoolManager")

SpinePoolManager.ctor = function (slot0)
	slot0._pool = {}
end

SpinePoolManager.get = function (slot0, slot1, slot2, slot3)
	if not slot2 or not slot3 then
		slot2 = ResConfig.getSpinePath(string.format("%s/%s.json", slot1, slot1))
		slot3 = ResConfig.getSpinePath(string.format("%s/%s.atlas", slot1, slot1))
	end

	slot5 = true
	slot6 = nil

	if slot0._pool[slot2] then
		slot6 = TableUtil.pop(slot7)
	end

	if not slot6 then
		slot5 = false
		sp.SkeletonAnimation:create(slot2, slot3).__spPoolCacheUrl = slot4

		sp.SkeletonAnimation.create(slot2, slot3):retain()
	end

	if slot5 then
		slot6:setVisible(true)
		slot6:setOpacity(255)
		slot6:setScaleX(1)
		slot6:setScaleY(1)
		slot6:setPosition(cc.p(0, 0))
		slot6:clearTracks()
	end

	return slot6, slot5
end

SpinePoolManager.put = function (slot0, slot1)
	slot2 = false

	if not slot1 or tolua.isnull(slot1) then
		return slot2
	end

	if slot1.__spPoolCacheUrl then
		DisplayUtil.setSpecialOffsetZorder(slot1, 0)

		slot2 = true

		if not slot0._pool[slot1.__spPoolCacheUrl] then
			slot0._pool[slot1.__spPoolCacheUrl] = {}
		end

		for slot7 = SP_ANIMATION_START, SP_ANIMATION_EVENT, 1 do
			slot1:unregisterSpineEventHandler(slot7)
			slot1:registerSpineEventHandler(__emptyFunction, slot7)
		end

		slot1:removeFromParent()
		TableUtil.push(slot3, slot1, true)
	end

	return slot2
end

SpinePoolManager.clearCache = function (slot0)
	slot0._pool = {}

	for slot5, slot6 in pairs(slot1) do
		for slot10, slot11 in ipairs(slot6) do
			slot11:removeFromParent()
			slot11:release()
		end
	end
end

spPoolMgr = SpinePoolManager.new()

return
