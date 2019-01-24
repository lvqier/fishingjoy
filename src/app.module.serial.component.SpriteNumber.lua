slot0 = class("SpriteNumber", function ()
	return cc.Node:create()
end)

slot0.ctor = function (slot0, slot1, slot2, slot3, slot4)
	slot0._texturePaths = slot2
	slot0._number = slot1
	slot0._interval = slot3 or 0
	slot0._preferredSize = {
		width = 0,
		height = 0
	}
	slot0._anchorPoint = {
		x = slot4.x,
		y = slot4.y
	}
	slot0._sprites = {}

	slot0:shuffle()
end

slot0.setNumber = function (slot0, slot1)
	if slot1 ~= slot0._number then
		slot0._number = slot1

		slot0:shuffle()
	end
end

slot0.reset = function (slot0)
	slot1 = slot0._preferredSize.width * slot0._anchorPoint.x
	slot2 = slot0._preferredSize.height * slot0._anchorPoint.y

	for slot6 = 1, #slot0._sprites, 1 do
		slot0._sprites[slot6]:setPosition((slot6 - 0.5) * slot0._interval - slot1, slot0._preferredSize.height * 0.5 - slot2)
	end
end

slot0.setAnchorPoint = function (slot0, slot1)
	if slot0._anchorPoint.x ~= slot1.x or slot0._anchorPoint.y ~= slot1.y then
		slot0._anchorPoint.x = slot1.x
		slot0._anchorPoint.y = slot1.y

		slot0:reset()
	end
end

slot0.setInterval = function (slot0, slot1)
	if slot1 ~= slot0._interval then
		slot0._interval = slot1
		slot0._preferredSize.width = #slot0._sprites * slot1

		slot0:reset()
	end
end

slot0.getPreferredSize = function (slot0)
	return slot0._preferredSize
end

slot0.shuffle = function (slot0)
	slot0:removeAllChildren()

	slot0._sprites = {}
	slot1 = {}
	slot2 = slot0._number

	while true do
		table.insert(slot1, slot2 % 10)

		if math.floor(slot2 / 10) <= 0 then
			break
		end
	end

	slot4 = 0
	slot5 = -(#slot1 * slot0._interval) * slot0._anchorPoint.x
	slot6 = -1

	for slot10 = #slot1, 1, -1 do
		slot13 = cc.Sprite:create(slot0._texturePaths[slot1[slot10]])

		slot13:setTag(slot12)
		slot0:addChild(slot13)

		if slot4 == 0 then
			slot6 = -slot13:getContentSize().height * slot0._anchorPoint.y
		end

		slot13:setPosition((slot12 - 0.5) * slot0._interval + slot5, slot4 * 0.5 + slot6)
		table.insert(slot0._sprites, slot13)
	end

	slot0._preferredSize.width = slot3
	slot0._preferredSize.height = slot4
end

return slot0
