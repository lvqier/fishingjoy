ShzGameItemCcsView = class("ShzGameItemCcsView")

ShzGameItemCcsView.onCreationComplete = function (slot0)
	slot0.Spr_front:setVisible(false)
	slot0.Spine:setVisible(false)
	slot0.Spr_liang:setPosition(125, 80)
	slot0.Spr_liang:stopAllActions()
	createSetterGetter(slot0, "iconIndex", nil, nil, nil, nil, nil, handler(slot0, slot0.onIconIndex))
	slot0:onIconIndex()

	slot0._tShowBorderWhenPlayAni = {
		nil,
		nil,
		true,
		true,
		true,
		[9.0] = true
	}
end

ShzGameItemCcsView.onIconIndex = function (slot0)
	slot0._iconIndex = ((slot0._iconIndex == 0 or not slot0._iconIndex) and 9) or slot0._iconIndex

	if slot0._iconIndex then
		slot0.Spr_ang:setSpriteFrame(slot1)
		slot0.Spr_liang:setSpriteFrame(string.format("shz_icon_%d.png", slot0._iconIndex))
	end

	slot0.Spr_liang:setPosition(125, 80)
	slot0.Spr_liang:stopAllActions()
	slot0:doGrayOrNo(false)
end

ShzGameItemCcsView.doGrayOrNo = function (slot0, slot1)
	slot0.Spr_front:setVisible(false)
	slot0.Spr_liang:setPosition(125, 80)
	slot0.Spr_liang:stopAllActions()
	slot0.Spr_ang:setVisible(slot1)
	slot0.Spr_liang:setVisible(not slot1)
	slot0.Spine:setVisible(false)
end

ShzGameItemCcsView.doSpine = function (slot0, slot1)
	slot0.Spr_front:setVisible(false)
	slot0.Spr_liang:setPosition(125, 80)
	slot0.Spr_liang:stopAllActions()
	slot0.Spr_ang:setVisible(false)
	slot0.Spr_liang:setVisible(false)

	if slot0._spineEndTimer then
		slot0._spineEndTimer:stop()

		slot0._spineEndTimer = nil
	end

	if slot0.SpineFile then
		spPoolMgr:put(slot0.SpineFile)

		slot0.SpineFile = nil
	end

	slot0.SpineFile = slot0:setSpineBy(slot0.Spine, "shz_spine_" .. tostring(slot0._iconIndex), 0, 0)

	slot0.Spine:setVisible(true)
end

ShzGameItemCcsView.setSpineBy = function (slot0, slot1, slot2, slot3, slot4)
	if slot0.controller:createSpineWithEvent(slot2, nil, true, true) then
		slot5:setPositionX(slot3)
		slot5:setPositionY(slot4)
		slot1:addChild(slot5)
	end

	if slot0._iconIndex and slot0.Spr_front then
		if slot0._tShowBorderWhenPlayAni[slot0._iconIndex] == true then
			slot0.Spr_front:setVisible(true)
		else
			slot0.Spr_front:setVisible(false)
		end
	end

	return slot5
end

ShzGameItemCcsView.destroy = function (slot0)
	if slot0._spineEndTimer then
		slot0._spineEndTimer:stop()

		slot0._spineEndTimer = nil
	end

	spPoolMgr:put(slot0.SpineFile)
end

return
