slot2 = "DropDownMenu"
DropDownMenu = class(slot1)

DropDownMenu.onCreationComplete = function (slot0)
	slot5 = nil

	createSetterGetter(slot2, slot0, "itemResCcsFileName")
	createSetterGetter(slot2, slot0, "gap")

	slot0._datas = nil
	slot0._isListView = false
	slot0._isInit = false
	slot0._cacheItems = {}
	slot0._itemHeight = 0
	slot3 = cc.EventListenerTouchOneByOne
	slot0.listener = cc.EventListenerTouchOneByOne.create(slot2)
	slot4 = false

	slot0.listener.setSwallowTouches(slot2, slot0.listener)

	slot7 = slot0.onClick2CloseMenu
	slot5 = cc.Handler.EVENT_TOUCH_BEGAN

	slot0.listener.registerScriptHandler(slot2, slot0.listener, handler(0, slot0))

	slot3 = slot0.listener

	slot0.listener.retain(slot2)

	slot3 = slot0

	slot0.hide(slot2)
end

DropDownMenu.onClick2CloseMenu = function (slot0, slot1, slot2)
	if slot0.bg then
		slot5 = slot0.bg
		slot8 = slot1

		if not DisplayUtil.hitTestNode(slot4, slot1.getLocation(slot7)) then
			slot5 = slot0

			slot0.hide(slot4)
		end
	else
		slot5 = slot0

		slot0.hide(slot4)
	end
end

DropDownMenu.setDatas = function (slot0, slot1)
	slot0._datas = slot1
	slot4 = slot0

	slot0.buildMenu(slot3)
end

DropDownMenu.buildMenu = function (slot0)
	if slot0._itemResCcsFileName == nil or slot0._datas == nil then
		return
	end

	if not slot0._isInit then
		if slot0.items_lv then
			slot4 = slot0._itemResCcsFileName

			slot0.items_lv.setItemResCcsFileName(slot2, slot0.items_lv)

			slot4 = slot0._gap

			slot0.items_lv.setGap(slot2, slot0.items_lv)

			slot0._isListView = true
		else
			slot0._isListView = false
		end

		slot0._isInit = true
	end

	if slot0._isListView then
		slot4 = slot0._datas

		slot0.items_lv.setDatas(slot2, slot0.items_lv)
	else
		for slot4 = 1, #slot0._datas, 1 do
			if #slot0._cacheItems < slot4 then
				slot8 = slot0
				slot9 = ResConfig.loadCsNode(slot6, slot0._itemResCcsFileName)

				slot0.addChild(slot0._itemResCcsFileName, slot0)

				slot9 = ResConfig.loadCsNode(slot6, slot0._itemResCcsFileName)

				table.insert(slot0._itemResCcsFileName, slot0._cacheItems)

				if slot0._itemHeight == 0 then
					slot8 = slot5
					slot0._itemHeight = slot5.getContentSize(slot7).height
				end
			end
		end

		slot1 = -slot0._itemHeight - slot0._gap

		for slot5 = 1, #slot0._datas, 1 do
			slot10 = slot1

			slot0._cacheItems[slot5].setPosition(slot7, slot0._cacheItems[slot5], 0)

			slot1 = slot1 - slot0._itemHeight - slot0._gap
			slot9 = slot0._datas[slot5]

			slot0._cacheItems[slot5].root.setData(slot0._gap, slot0._cacheItems[slot5].root)

			slot9 = true

			slot0._cacheItems[slot5].setVisible(slot0._gap, slot0._cacheItems[slot5])
		end

		for slot5 = #slot0._datas + 1, #slot0._cacheItems, 1 do
			slot9 = false

			slot0._cacheItems[slot5].setVisible(slot7, slot0._cacheItems[slot5])
		end

		if slot0.bg then
			slot8 = slot0.bg
			slot7 = slot0._itemHeight * #slot0._datas + (#slot0._datas + 1) * slot0._gap

			slot0.bg.setContentSize(slot0._gap, slot0.bg, slot0.bg.getContentSize(slot7).width)
		end
	end
end

DropDownMenu.show = function (slot0, slot1)
	slot5 = true

	slot0.setVisible(slot3, slot0)

	slot4 = slot0
	slot6 = -1

	slot0.getEventDispatcher(slot3).addEventListenerWithFixedPriority(slot3, slot0.getEventDispatcher(slot3), slot0.listener)

	if slot0._isListView and slot0._isInit then
		slot7 = nil

		slot0.items_lv.jumpToPercent(slot3, slot0.items_lv, nil, 0)
	end
end

DropDownMenu.hide = function (slot0)
	slot4 = false

	slot0.setVisible(slot2, slot0)

	slot3 = slot0
	slot4 = slot0.listener

	slot0.getEventDispatcher(slot2).removeEventListener(slot2, slot0.getEventDispatcher(slot2))
end

DropDownMenu.destroy = function (slot0)
	if slot0.listener then
		slot3 = slot0.listener

		slot0.listener.release(slot2)

		slot0.listener = nil
	end
end

return
