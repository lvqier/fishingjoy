AbstractCcsListViewStrategy = class("AbstractCcsListViewStrategy")

AbstractCcsListViewStrategy.ctor = function (slot0, slot1)
	createSetterGetter(slot0, "datas", {}, false, true)
	createSetterGetter(slot0, "gap", 5)
	createSetterGetter(slot0, "itemScale", 1, false, true)

	slot0._dataLen = 0
	slot0._view = slot1
end

AbstractCcsListViewStrategy.onData = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()
end

AbstractCcsListViewStrategy.onScale = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()
end

AbstractCcsListViewStrategy.onPositionChanged = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()
end

AbstractCcsListViewStrategy.jumpToItemIndex = function (slot0, slot1, slot2)
	errorMgr:throwMethodShouldBeOverwritten()
end

AbstractCcsListViewStrategy.createItem = function (slot0)
	slot1 = nil

	if type(slot0._view._itemResCcsFileName) == "string" then
		slot1 = ResConfig.loadCsLayout(slot0._view._itemResCcsFileName, slot0._view)
	elseif type(slot0._view._itemResCcsFileName) == "table" then
		slot0._view._itemResCcsFileName.new(true).model = slot0._view.model
		slot0._view._itemResCcsFileName.new(true).controller = slot0._view.controller

		if slot0._view._itemResCcsFileName.new(true).onCreationComplete then
			slot1:onCreationComplete()
		end
	end

	return slot1
end

AbstractCcsListViewStrategy.setDatas = function (slot0, slot1, slot2)
	if slot0._datas ~= slot1 or slot2 then
		slot0._datas = slot1 or {}
		slot0._dataLen = #slot0._datas

		slot0:onData()
	end
end

AbstractCcsListViewStrategy.setItemScale = function (slot0, slot1)
	if slot0._itemScale ~= slot1 then
		slot0._itemScale = slot1

		slot0:onScale()
	end
end

AbstractCcsListViewStrategy.destroy = function (slot0)
	slot0._data = nil
	slot0._view = nil
	slot0._gap = nil
	slot0._dataLen = nil
	slot0._itemScale = nil
end

return
