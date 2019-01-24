ArmaturePoolManager = class("ArmaturePoolManager")

ArmaturePoolManager.ctor = function (slot0)
	slot0._pool = {}
end

ArmaturePoolManager.get = function (slot0, slot1, slot2)
	slot4 = true
	slot5 = nil

	if slot0._pool[slot2 or ResConfig.getArmaturePath(slot1 .. "/" .. slot1 .. ".ExportJson")] then
		slot5 = TableUtil.pop(slot6)
	end

	if not slot5 then
		slot4 = false

		ccs.ArmatureDataManager:getInstance():addArmatureFileInfo(slot3)
		assert(StringUtil.isStringValid(slot1), "armature名字不能为nil，否则会找不到动作")

		ccs.Armature:create(slot1).__armPoolCacheUrl = slot3

		ccs.Armature.create(slot1):retain()
	end

	if slot4 then
		slot5:setVisible(true)
		slot5:setOpacity(255)
		slot5:setScaleX(1)
		slot5:setScaleY(1)
	end

	return slot5, slot4
end

ArmaturePoolManager.put = function (slot0, slot1)
	slot2 = false

	if not slot1 or tolua.isnull(slot1) then
		return slot2
	end

	if slot1.__armPoolCacheUrl then
		DisplayUtil.setSpecialOffsetZorder(slot1, 0)

		slot2 = true

		if not slot0._pool[slot1.__armPoolCacheUrl] then
			slot0._pool[slot1.__armPoolCacheUrl] = {}
		end

		if slot1:getAnimation().gotoAndPause then
			slot4:gotoAndPause(0)
		end

		slot1:removeFromParent()
		TableUtil.push(slot3, slot1, true)
	end

	return slot2
end

ArmaturePoolManager.clearCache = function (slot0)
	slot0._pool = {}

	for slot5, slot6 in pairs(slot1) do
		for slot10, slot11 in ipairs(slot6) do
			slot11:removeFromParent()
			slot11:release()
		end
	end
end

armPoolMgr = ArmaturePoolManager.new()

return
