CcsListView = class("CcsListView", function ()
	return ccui.Layout:create()
end)

requireClientCoreMain("ccs.component.list.imp.AbstractCcsListViewStrategy")
requireClientCoreMain("ccs.component.list.imp.lite.BaseCcsListViewStrategyLite")
requireClientCoreMain("ccs.component.list.imp.lite.CcsListViewHorizontalStrategyLite")
requireClientCoreMain("ccs.component.list.imp.lite.CcsListViewVerticalStrategyLite")
requireClientCoreMain("ccs.component.list.imp.vary.BaseCcsListViewStrategyVary")
requireClientCoreMain("ccs.component.list.imp.vary.CcsListViewVerticalStrategyVary")

CcsListView.SCROLL_TYPE_LITE = 1
CcsListView.SCROLL_TYPE_VARY = 2

CcsListView.ctor = function (slot0)
	ClassUtil.extends(slot0, CcsScrollView)
	createSetterGetter(slot0, "itemResCcsFileName", nil)
	createSetterGetter(slot0, "isItemUpdateSpeedMode", true)
	createSetterGetter(slot0, "scrollType", CcsListView.SCROLL_TYPE_LITE, false, true)
	createSetterGetter(slot0, "forceUpdateItem", true)

	slot0.setScrollPolicy = CcsListView.setScrollPolicy
	slot0._strategy = nil
	slot0._scrollPolicy = nil

	slot0:setScrollPolicy(CcsScrollView.SCROLL_V)
end

CcsListView.setItemScale = function (slot0, slot1)
	slot0._strategy:setItemScale(slot1)
end

CcsListView.getItemByData = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._scrollItems) do
		if slot6:getData() == slot1 then
			return slot6
		end
	end

	return nil, nil
end

CcsListView.getItemScale = function (slot0)
	return slot0._strategy:getItemScale()
end

CcsListView.setGap = function (slot0, slot1)
	slot0._strategy:setGap(slot1)
end

CcsListView.getGap = function (slot0)
	return slot0._strategy:getGap()
end

CcsListView.setScrollPolicy = function (slot0, slot1)
	if slot0._scrollPolicy ~= slot1 then
		slot0._scrollPolicy = slot1

		slot0:checkStrategy()
	end
end

CcsListView.setScrollType = function (slot0, slot1)
	if slot0._scrollType ~= slot1 then
		slot0._scrollType = slot1

		slot0:checkStrategy()
	end
end

CcsListView.checkStrategy = function (slot0)
	slot1 = nil

	if slot0._strategy then
		slot1 = slot0._strategy:getGap()

		slot0._strategy:destroy()

		slot0._strategy = nil
	end

	if slot0._scrollPolicy == CcsScrollView.SCROLL_H then
		if slot0._scrollType == CcsListView.SCROLL_TYPE_LITE then
			slot0._strategy = CcsListViewHorizontalStrategyLite.new(slot0)
		elseif slot0._scrollType == CcsListView.SCROLL_TYPE_VARY then
		end
	elseif slot0._scrollPolicy == CcsScrollView.SCROLL_V then
		if slot0._scrollType == CcsListView.SCROLL_TYPE_LITE then
			slot0._strategy = CcsListViewVerticalStrategyLite.new(slot0)
		elseif slot0._scrollType == CcsListView.SCROLL_TYPE_VARY then
			slot0._strategy = CcsListViewVerticalStrategyVary.new(slot0)
		end
	end

	if not slot0._strategy then
		errorMgr:throw("scrollpolicy or scrolltype is wrong:" .. tostring(slot0._scrollPolicy) .. ":" .. tostring(slot0._scrollType))
	end

	if slot1 then
		slot0._strategy:setGap(slot1)
	end
end

CcsListView.getDatas = function (slot0)
	if slot0._strategy then
		return slot0._strategy:getDatas()
	end

	return nil
end

CcsListView.setDatas = function (slot0, slot1, slot2)
	slot0._strategy:setDatas(slot1, slot2)
end

CcsListView.jumpToItemIndex = function (slot0, slot1, slot2)
	slot0._strategy:jumpToItemIndex(slot1, slot2)
end

CcsListView.onPositionChanged = function (slot0)
	CcsScrollView.onPositionChanged(slot0)
	slot0._strategy:onPositionChanged()
end

CcsListView.getStrategy = function (slot0)
	return slot0._strategy
end

CcsListView.destroy = function (slot0)
	if slot0._strategy then
		slot0._strategy:destroy()

		slot0._strategy = nil
	end

	CcsScrollView.destroy(slot0)

	slot0._itemResCcsFileName = nil
end

return
