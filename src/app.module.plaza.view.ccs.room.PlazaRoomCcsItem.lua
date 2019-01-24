PlazaRoomCcsItem = class("PlazaRoomCcsItem")

PlazaRoomCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomCcsBtn, true, slot0, slot0)
	createSetterGetter(slot0, "parentItem", nil)
	createSetterGetter(slot0, "data", nil, nil, nil, nil, nil, handler(slot0, slot0.onData))

	slot0._roomNumFt = ResFontTxt.new("plist_font_blue_3_", 0, -7, 1)

	slot0._roomNumFt:setParent(slot0)
	slot0._roomNumFt:setPositionXY(195, 58)

	slot0._roomNumFt.resExtention = ".png"
end

PlazaRoomCcsItem.onData = function (slot0)
	slot0:setVisible(slot0._data ~= nil)
	slot0:setHandleTouchBy(slot0._data ~= nil)

	if slot0._data then
		slot0._roomNumFt:setTxt(tostring(slot0._data))
	end
end

PlazaRoomCcsItem.setHandleTouchBy = function (slot0, slot1)
	if slot0.__isHandleBtnTouchByListView == nil then
		slot0.__isHandleBtnTouchByListView = false
	end

	if slot0.__isHandleBtnTouchByListView ~= slot1 then
		slot0.__isHandleBtnTouchByListView = slot1
		slot2 = slot0._parentItem:getScrollViewParent()

		if slot1 then
			slot2:addBtn2HandleTouchOperate(slot0)
		else
			slot2:removeBtnInHandleTouchOperate(slot0)
		end
	end
end

PlazaRoomCcsItem.onClick = function (slot0)
	requireModule("HallModule")
	ProxyHall:show()
end

return
