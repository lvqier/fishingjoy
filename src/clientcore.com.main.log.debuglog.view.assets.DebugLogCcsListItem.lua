DebugLogCcsListItem = class("DebugLogCcsListItem", function ()
	slot0 = ccui.Layout:create()

	slot0:setTouchEnabled(false)

	return slot0
end)

DebugLogCcsListItem.ctor = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)

	slot0._tf = nil
	slot0._itemWidth = math.max(display.width, display.height) - 40

	slot0:initView()
end

DebugLogCcsListItem.initView = function (slot0)
	if not slot0._tf then
		slot0._tf = TextField.new(nil, 22, "#00ff00", slot0._itemWidth, nil, TextField.H_LEFT)

		slot0._tf:setVAlign(TextField.V_BOTTOM)
		slot0._tf:setIsWrapPrecise(false)
		slot0:addChild(slot0._tf)
	end
end

DebugLogCcsListItem.getItemSize = function (slot0)
	return cc.size(slot0._itemWidth, slot0._tf:getTextHeight())
end

DebugLogCcsListItem.onClick = function (slot0)
	tweenMsgMgr:showWhiteMsg("已拷贝log消息")
	bridgeMgr:copy2ClipBoard(slot0._tf:getText())
end

DebugLogCcsListItem.updateView = function (slot0)
	if slot0._data then
		if string.find(slot0._data, "LUA ERROR:") ~= nil then
			slot0._tf:setIsWrapPrecise(true)
		else
			slot0._tf:setIsWrapPrecise(false)
		end

		slot0._tf:setText(slot0._data)
	else
		slot0._tf:setText("")
	end

	slot0:setContentSize(cc.size(slot0._itemWidth, slot0._tf:getTextHeight()))
end

return
