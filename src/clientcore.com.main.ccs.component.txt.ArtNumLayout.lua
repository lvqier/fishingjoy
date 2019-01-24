ArtNumLayout = class("ArtNumLayout", function ()
	return ccui.Layout:create()
end)

ArtNumLayout.ctor = function (slot0)
	slot0._numArr = nil
	slot0._prefix = ""
	slot0._layout = ccui.Layout:create()
	slot0._isVisible = true

	slot0:addChild(slot0._layout)
	slot0:retain()
end

ArtNumLayout.setText = function (slot0, slot1, slot2, slot3, slot4)
	slot0._numArr = slot1
	slot0._prefix = slot2
	slot0._spaceWidth = slot4 or 0

	if not slot0:isVisible() then
		return
	end

	if slot3 then
		anlMgr:put(slot0)
	else
		slot0:render()
	end
end

ArtNumLayout.render = function (slot0)
	slot0._layout:removeAllChildren()

	if slot0._numArr == "" then
		return
	end

	slot1 = 0
	slot2 = 0
	slot3 = 0
	slot4 = 0

	for slot8 = 1, #slot0._numArr, 1 do
		slot11 = cc.Sprite:createWithSpriteFrameName(slot10)

		slot11:setPosition(cc.p(slot1, slot2))
		slot11:setAnchorPoint(cc.p(0, 0))
		slot0._layout:addChild(slot11)

		slot1 = slot1 + slot11:getContentSize().width + slot0._spaceWidth

		if slot4 < slot11:getContentSize().height then
			slot4 = slot11:getContentSize().height
		end
	end

	slot0:setContentSize(cc.size(slot3, slot4))
	slot0._layout:setContentSize(cc.size(slot1 - slot0._spaceWidth, slot4))
end

ArtNumLayout.isVisible = function (slot0)
	return slot0._isVisible
end

ArtNumLayout.setVisible = function (slot0, slot1)
	if slot1 ~= slot0:isVisible() and slot1 then
		slot0:render()
	end

	slot0._layout:setVisible(slot1)

	slot0._isVisible = slot1
end

ArtNumLayout.destroy = function (slot0)
	slot0._isVisible = true
	slot0._numArr = nil

	slot0._layout:removeAllChildren()
	slot0:removeFromParent()
	slot0:release()
end

return
