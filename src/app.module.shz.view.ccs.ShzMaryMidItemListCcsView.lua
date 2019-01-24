ShzMaryMidItemListCcsView = class("ShzMaryMidItemListCcsView")

ShzMaryMidItemListCcsView.onCreationComplete = function (slot0)
	slot0._iconData = 0
	slot0.listTab = {}

	for slot4 = 1, 2, 1 do
		table.insert(slot0.listTab, {
			item = slot0["FileNode_" .. slot4],
			PosY = slot0["FileNode_" .. slot4].getPositionY(slot5)
		})
	end

	slot0.rollSpeed = 40
	slot0.bStopRolling = false
end

ShzMaryMidItemListCcsView.appIconDatas = function (slot0, slot1)
	if slot1 then
		slot0.listTab[1].item.root:setIconIndex(slot0._iconData)
		slot0.listTab[2].item.root:setIconIndex(0)
	else
		slot0.listTab[1].item.root:setIconIndex(0)
		slot0.listTab[2].item.root:setIconIndex(slot0._iconData)
	end
end

ShzMaryMidItemListCcsView.doSpine = function (slot0, slot1)
	slot0.listTab[2].item.root:doSpine(2834)
end

ShzMaryMidItemListCcsView.doGrayOrNo = function (slot0, slot1)
	slot0.listTab[2].item.root:doGrayOrNo(slot1)
end

ShzMaryMidItemListCcsView.checkRemoveToFirst = function (slot0)
	if slot0.listTab[2].PosY <= -160 then
		slot1.item.root:setIconIndex(slot2)
		slot1.item:setPositionY(160)

		slot1.PosY = 160

		table.remove(slot0.listTab, 2)
		table.insert(slot0.listTab, 1, slot1)

		return true
	end

	return false
end

ShzMaryMidItemListCcsView.RollList = function (slot0)
	for slot4, slot5 in ipairs(slot0.listTab) do
		slot5.item:setPosition(0, slot5.PosY - slot0.rollSpeed)

		slot5.PosY = slot5.PosY - slot0.rollSpeed
	end

	return slot0:checkRemoveToFirst()
end

ShzMaryMidItemListCcsView.tweenToStartRoll = function (slot0)
	if slot0.bStopRolling then
		return
	end

	slot0:checkRemoveToFirst()

	slot0.bStopRolling = true

	slot0:doGrayOrNo(false)

	slot1 = 0
	slot2 = slot0

	for slot6, slot7 in ipairs(slot0.listTab) do
		slot8 = slot7.PosY

		slot7.item:stopAllActions()
		slot7.item:runAction(cc.Sequence:create(cc.EaseIn:create(slot9, 2), cc.CallFunc:create(function ()
			slot0 = slot0 + 1
			slot1.PosY = slot1.PosY - 160

			if slot1 >= 2 then
				slot2:startRoll()
			end
		end)))
	end
end

ShzMaryMidItemListCcsView.tweenToStopRoll = function (slot0)
	slot1 = 0
	slot2 = slot0

	for slot6, slot7 in ipairs(slot0.listTab) do
		slot8 = slot7.PosY
		slot13 = slot0

		slot7.item:stopAllActions()
		slot7.item:runAction(cc.Sequence:create(cc.EaseSineOut:create(slot9), cc.EaseSineInOut:create(slot11), cc.CallFunc:create(function ()
			slot0 = slot0 + 1
			slot1.PosY = slot1.PosY - 160

			if slot1 >= 2 then
				slot2.bStopRolling = false

				slot3:checkRemoveToFirst()
			end
		end)))
	end
end

ShzMaryMidItemListCcsView.startRoll = function (slot0)
	if slot0.rollTimer then
		return
	end

	slot0:checkRemoveToFirst()

	slot0.bStopRoll = false
	slot1 = slot0
	slot0.rollTimer = tickMgr:delayedCall(function ()
		if slot0.bStopRoll and slot0 then
			if slot0.rollTimer then
				slot0.rollTimer:stop()

				slot0.rollTimer = nil
			end

			slot0:appIconDatas(true)
			slot0:tweenToStopRoll()
		end
	end, 20, -1)
end

ShzMaryMidItemListCcsView.stopRoll = function (slot0)
	slot0.bStopRoll = true
end

ShzMaryMidItemListCcsView.stopRollQuickEndSetPos = function (slot0)
	for slot4, slot5 in ipairs(slot0.listTab) do
		slot5.item:stopAllActions()
		slot5.item:setPosition(0, 160 - slot4 * 160)

		slot5.PosY = 160 - slot4 * 160
	end

	slot0:appIconDatas(true)

	return slot0:checkRemoveToFirst()
end

ShzMaryMidItemListCcsView.stopRollQuick = function (slot0)
	slot0.bStopRoll = true
	slot0.bStopRolling = false

	if slot0.rollTimer then
		slot0.rollTimer:stop()

		slot0.rollTimer = nil
	end

	slot0:stopRollQuickEndSetPos()
end

ShzMaryMidItemListCcsView.onHide = function (slot0)
	slot0.bStopRoll = true
	slot0.bStopRolling = false

	if slot0.rollTimer then
		slot0.rollTimer:stop()

		slot0.rollTimer = nil
	end
end

ShzMaryMidItemListCcsView.destroy = function (slot0)
	if slot0.rollTimer then
		slot0.rollTimer:stop()

		slot0.rollTimer = nil
	end
end

return
