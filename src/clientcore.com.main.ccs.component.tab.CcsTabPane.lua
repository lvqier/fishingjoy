CcsTabPane = class("CcsTabPane")

CcsTabPane.ctor = function (slot0)
	createSetterGetter(slot0, "tabs", {}, nil, true)
	createSetterGetter(slot0, "selectedTabIndex", 0, false, true)
	createSetterGetter(slot0, "tabCanSelectChecker", nil)

	slot0.tabClickSignal = SignalAs3.new("CcsTabPane:tabClickSignal")
end

CcsTabPane.pushTabs = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot0:pushTab(slot6)
	end
end

CcsTabPane.pushTab = function (slot0, slot1)
	if not ClassUtil.is(slot1, CcsTwoBtnTab) then
		ClassUtil.extends(slot1, CcsTwoBtnTab)
	end

	table.insert(slot0._tabs, slot1)
	slot1:setTabIndex(#slot0._tabs)
	slot1.clickSignal:add(slot0.onTabClick, slot0)
end

CcsTabPane.popTabs = function (slot0)
	for slot4, slot5 in ipairs(slot0._tabs) do
		if slot5 and slot5.clickSignal then
			slot5.clickSignal:remove(slot0.onTabClick, slot0)
		end
	end

	slot0._selectedTabIndex = 0
	slot0._tabCanSelectChecker = nil
	slot0._tabs = {}
end

CcsTabPane.onTabClick = function (slot0, slot1)
	if slot1 ~= slot0._selectedTabIndex and slot0:setSelectedTabIndex(slot1) then
		slot0.tabClickSignal:emit(slot1)
	end
end

CcsTabPane.setSelectedTabIndex = function (slot0, slot1, slot2)
	slot3 = false

	if slot0._selectedTabIndex ~= slot1 and (not slot0._tabCanSelectChecker or slot0._tabCanSelectChecker(slot1)) and true then
		slot0._selectedTabIndex = slot1

		for slot7, slot8 in ipairs(slot0._tabs) do
			slot8:setIsSelected(slot8:getTabIndex() == slot1)
		end
	end

	return slot3
end

CcsTabPane.destroy = function (slot0)
	for slot4, slot5 in ipairs(slot0._tabs) do
		slot5:destroy()
	end

	slot0.tabClickSignal:removeAll()

	slot0.tabClickSignal = nil
	slot0._tabs = nil
end

return
