ShzGameItemListCcsView = class("ShzGameItemListCcsView")

ShzGameItemListCcsView.onCreationComplete = function (slot0)
	slot0._iconDatas = {}
	slot0.listTab = {}

	for slot4 = 1, 4, 1 do
		table.insert(slot0.listTab, {
			item = slot0["FileNode_" .. slot4],
			PosY = slot0["FileNode_" .. slot4].getPositionY(slot5)
		})
	end

	slot0.rollSpeed = 40
	slot0.bStopRolling = false
	slot0.bStopRoll = true
end

ShzGameItemListCcsView.appIconDatas = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0.listTab) do
		if slot1 then
			if slot5 <= 3 then
				slot6.item.root:setIconIndex(slot0._iconDatas[slot5])
			end
		elseif slot5 > 1 then
			slot6.item.root:setIconIndex(slot0._iconDatas[slot5 - 1])
		end
	end
end

ShzGameItemListCcsView.doAllSpine = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0.listTab) do
		slot6.item.root:doSpine(2834)
	end
end

ShzGameItemListCcsView.doSpineByIndex = function (slot0, slot1)
	slot0.listTab[slot1 + 1].item.root:doSpine(2834)
end

ShzGameItemListCcsView.doAllGrayOrNo = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0.listTab) do
		slot6.item.root:doGrayOrNo(slot1)
	end
end

ShzGameItemListCcsView.doGrayOrNoByIndex = function (slot0, slot1, slot2)
	slot0.listTab[slot1 + 1].item.root:doGrayOrNo(slot2)
end

ShzGameItemListCcsView.checkRemoveToFirst = function (slot0)
	if slot0.listTab[4].PosY <= -160 then
		slot1.item.root:setIconIndex(slot2)
		slot1.item:setPositionY(480)

		slot1.PosY = 480

		table.remove(slot0.listTab, 4)
		table.insert(slot0.listTab, 1, slot1)

		return true
	end

	return false
end

ShzGameItemListCcsView.RollList = function (slot0)
	for slot4, slot5 in ipairs(slot0.listTab) do
		slot5.item:setPosition(0, slot5.PosY - slot0.rollSpeed)

		slot5.PosY = slot5.PosY - slot0.rollSpeed
	end

	return slot0:checkRemoveToFirst()
end

ShzGameItemListCcsView.tweenToStartRoll = function (slot0)
	if slot0.bStopRolling then
		return
	end

	slot0.bStopRoll = true

	slot0:checkRemoveToFirst()

	slot0.bStopRolling = true

	slot0:doAllGrayOrNo(false)

	slot1 = 0
	slot2 = slot0

	for slot6, slot7 in ipairs(slot0.listTab) do
		slot8 = slot7.PosY

		slot7.item:stopAllActions()
		slot7.item:runAction(cc.Sequence:create(cc.EaseIn:create(slot9, 2), cc.CallFunc:create(function ()
			slot0 = slot0 + 1
			slot1.PosY = slot1.PosY - 160

			if slot1 >= 4 then
				slot2:startRoll()
			end
		end)))
	end
end

ShzGameItemListCcsView.tweenToStopRoll = function (slot0)
	slot1 = 0
	slot2 = slot0

	for slot6, slot7 in ipairs(slot0.listTab) do
		slot8 = slot7.PosY
		slot13 = slot0

		slot7.item:stopAllActions()
		slot7.item:runAction(cc.Sequence:create(cc.EaseSineOut:create(slot9), cc.EaseSineInOut:create(slot11), cc.CallFunc:create(function ()
			slot0 = slot0 + 1
			slot1.PosY = slot1.PosY - 160

			if slot1 >= 4 then
				slot2.bStopRolling = false

				slot2:checkRemoveToFirst()
			end
		end)))
	end
end

ShzGameItemListCcsView.startRoll = function (slot0)
	if slot0.rollTimer then
		return
	end

	slot0:stopRollQuick()
	slot0:checkRemoveToFirst()

	slot0.bStopRoll = false
	slot1 = slot0
	slot0.rollTimer = tickMgr:delayedCall(function ()
		if slot0:RollList() and slot0.bStopRoll then
			if slot0.rollTimer then
				slot0.rollTimer:stop()

				slot0.rollTimer = nil
			end

			slot0:appIconDatas(true)
			slot0:tweenToStopRoll()
		end
	end, 20, -1)
end

ShzGameItemListCcsView.stopRollQuickEndSetPos = function (slot0)
	for slot4, slot5 in ipairs(slot0.listTab) do
		slot5.item:stopAllActions()
		slot5.item:setPosition(0, 480 - slot4 * 160)

		slot5.PosY = 480 - slot4 * 160
	end

	slot0:appIconDatas(true)

	return slot0:checkRemoveToFirst()
end

ShzGameItemListCcsView.stopRoll = function (slot0)
	slot0.bStopRoll = true
end

ShzGameItemListCcsView.stopRollQuick = function (slot0)
	slot0.bStopRoll = true
	slot0.bStopRolling = false

	if slot0.rollTimer then
		slot0.rollTimer:stop()

		slot0.rollTimer = nil
	end

	slot0:stopRollQuickEndSetPos()
end

ShzGameItemListCcsView.onHide = function (slot0)
	slot0.bStopRoll = true
	slot0.bStopRolling = false

	if slot0.rollTimer then
		slot0.rollTimer:stop()

		slot0.rollTimer = nil
	end
end

ShzGameItemListCcsView.destroy = function (slot0)
	if slot0.rollTimer then
		slot0.rollTimer:stop()

		slot0.rollTimer = nil
	end
end

return
