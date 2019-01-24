slot0 = nil
slot3 = "EntityPoolMgr"
EntityPoolMgr = class(slot2)

EntityPoolMgr.getInstance = function (slot0)
	if slot0 == nil then
		slot0 = EntityPoolMgr.new()
	end

	return slot0
end

EntityPoolMgr.initCacheList = function (slot0)
	slot0.tFishRenderPool = {}
	slot0.tBulletRenderPool = {}
	slot0.tNetRenderPool = {}
	slot0.oBingoNode = {}
	slot0.oFishGold = {}
	slot0.oIconNode = {}
	slot0.oGoldLabelNode = {}
	slot0.oOtherPlayerGoldLabelNode = {}
	slot0.oOtherPlayerGoldNode = {}
	slot0.oOtherPlayerGaoFenNode = {}
	slot0._fishGoldExNode = {
		{},
		{},
		{},
		{},
		{},
		{},
		{}
	}
	slot3 = slot0

	slot0.reset()
end

EntityPoolMgr.reset = function (slot0)
	slot0.bFishClean_1 = false
	slot0.bFishClean_2 = true
	slot0.bBulletClean = true
	slot0.bNetClean = true
	slot0.fCleanDt = 0
end

EntityPoolMgr.clearPoolMgr = function (slot0)
	slot3 = slot0

	slot0.clearFishRenderPool(slot2)

	slot3 = slot0

	slot0.clearBulletRenderPool(slot2)

	slot3 = slot0

	slot0.clearNetRenderPool(slot2)

	slot3 = slot0

	slot0.clearEffect(slot2)

	slot3 = slot0

	slot0.reset(slot2)

	slot3 = slot0

	slot0.clearFishGoldExNode(slot2)
end

EntityPoolMgr.addFishGoldExNode = function (slot0, slot1, slot2)
	if #slot0._fishGoldExNode < 20 then
		slot0._fishGoldExNode[slot1][#slot0._fishGoldExNode[slot1] + 1] = slot2
	else
		slot6 = slot2

		slot0.removeOneNode(slot4, slot0)
	end
end

EntityPoolMgr.getFishGoldExNode = function (slot0, slot1)
	slot2 = nil
	slot5 = slot0._fishGoldExNode[slot1]

	if next(slot4) ~= nil then
		slot2 = slot0._fishGoldExNode[slot1][#slot0._fishGoldExNode[slot1]]
		slot0._fishGoldExNode[slot1][#slot0._fishGoldExNode[slot1]] = nil
	end

	return slot2
end

EntityPoolMgr.removeOneNode = function (slot0, slot1)
	for slot5 = 1, slot1.goldNumber, 1 do
		slot9 = slot1.coinNodeContainer[slot5].collectAction

		slot1.coinNodeContainer[slot5].collectAction.release(slot8)

		slot9 = slot1.coinNodeContainer[slot5].spreadAction

		slot1.coinNodeContainer[slot5].spreadAction.release(slot8)

		slot9 = slot1.coinNodeContainer[slot5].goldenAnimate

		slot1.coinNodeContainer[slot5].goldenAnimate.release(slot8)

		slot9 = slot1.coinNodeContainer[slot5].silverAnimate

		slot1.coinNodeContainer[slot5].silverAnimate.release(slot8)

		slot9 = slot1.coinNodeContainer[slot5]

		slot1.coinNodeContainer[slot5].removeFromParent(slot8)
	end

	if slot1.labelAction then
		slot4 = slot1.labelAction

		slot1.labelAction.release(slot3)
	end

	if slot1.startAction then
		slot4 = slot1.startAction

		slot1.startAction.release(slot3)
	end

	if slot1.coinNumberAction then
		slot4 = slot1.coinNumberAction

		slot1.coinNumberAction.release(slot3)
	end

	slot4 = slot1

	slot1.release(slot3)
end

EntityPoolMgr.clearFishGoldExNode = function (slot0)
	slot3 = slot0._fishGoldExNode

	for slot4, slot5 in ipairs(slot2) do
		slot6 = pairs
		slot8 = slot5 or {}

		for slot9, slot10 in slot6(slot7) do
			slot14 = slot10

			slot0.removeOneNode(slot12, slot0)
		end
	end

	slot0._fishGoldExNode = {
		{},
		{},
		{},
		{},
		{},
		{},
		{}
	}
end

EntityPoolMgr.addBingoNode = function (slot0, slot1)
	if #slot0.oBingoNode > 15 then
		if slot1 then
			slot4 = slot1

			slot1.removeSelf(slot3)

			slot1 = nil
		end
	else
		slot0.oBingoNode[#slot0.oBingoNode + 1] = slot1
	end
end

EntityPoolMgr.addFishGold = function (slot0, slot1)
	if #slot0.oFishGold > 50 then
		if slot1 then
			slot4 = slot1

			slot1.removeSelf(slot3)

			slot1 = nil
		end
	else
		slot0.oFishGold[#slot0.oFishGold + 1] = slot1
	end
end

EntityPoolMgr.getFishGoldPoolSize = function (slot0)
	return #slot0.oFishGold
end

EntityPoolMgr.addIconNode = function (slot0, slot1)
	if #slot0.oIconNode > 30 then
		if slot1 then
			slot4 = slot1

			slot1.removeSelf(slot3)

			slot1 = nil
		end
	else
		slot0.oIconNode[#slot0.oIconNode + 1] = slot1
	end
end

EntityPoolMgr.addGoldLabelNode = function (slot0, slot1)
	if #slot0.oGoldLabelNode > 30 then
		if slot1 then
			slot4 = slot1

			slot1.removeSelf(slot3)

			slot1 = nil
		end
	else
		slot0.oGoldLabelNode[#slot0.oGoldLabelNode + 1] = slot1
	end
end

EntityPoolMgr.addFishRenderPool = function (slot0, slot1, slot2)
	if slot0.tFishRenderPool[slot2] == nil then
		slot0.tFishRenderPool[slot2] = {}
	end

	if #slot0.tFishRenderPool[slot2] > 15 then
		if slot1 and slot1.cocosTarget then
			slot5 = slot1.cocosTarget

			slot1.cocosTarget.removeSelf(slot4)

			slot1.cocosTarget = nil
		end
	else
		slot0.tFishRenderPool[slot2][#slot0.tFishRenderPool[slot2] + 1] = slot1
	end
end

EntityPoolMgr.addBulletRenderPool = function (slot0, slot1, slot2)
	if slot0.tBulletRenderPool[slot2] == nil then
		slot0.tBulletRenderPool[slot2] = {}
	end

	if #slot0.tBulletRenderPool[slot2] > 100 then
		if slot1 and slot1.cocosTarget then
			slot5 = slot1.cocosTarget

			slot1.cocosTarget.removeSelf(slot4)

			slot1.cocosTarget = nil
		end
	else
		slot0.tBulletRenderPool[slot2][#slot0.tBulletRenderPool[slot2] + 1] = slot1
	end
end

EntityPoolMgr.addNetRenderPool = function (slot0, slot1, slot2)
	if slot0.tNetRenderPool[slot2] == nil then
		slot0.tNetRenderPool[slot2] = {}
	end

	if #slot0.tNetRenderPool[slot2] > 100 then
		if slot1 and slot1.cocosTarget then
			slot5 = slot1.cocosTarget

			slot1.cocosTarget.removeSelf(slot4)

			slot1.cocosTarget = nil
		end
	else
		slot0.tNetRenderPool[slot2][#slot0.tNetRenderPool[slot2] + 1] = slot1
	end
end

EntityPoolMgr.getFishCocosTarget = function (slot0, slot1)
	if slot0.tFishRenderPool[slot1] then
		slot5 = #slot0.tFishRenderPool[slot1]

		return table.remove(slot3, slot0.tFishRenderPool[slot1])
	end

	return nil
end

EntityPoolMgr.getBulletCocosTarget = function (slot0, slot1)
	if slot0.tBulletRenderPool[slot1] then
		slot5 = #slot0.tBulletRenderPool[slot1]

		return table.remove(slot3, slot0.tBulletRenderPool[slot1])
	end

	return nil
end

EntityPoolMgr.getFishingNetCocosTarget = function (slot0, slot1)
	if slot0.tNetRenderPool[slot1] then
		slot5 = #slot0.tNetRenderPool[slot1]

		return table.remove(slot3, slot0.tNetRenderPool[slot1])
	end

	return nil
end

EntityPoolMgr.getOneBingoNode = function (slot0)
	slot4 = #slot0.oBingoNode

	return table.remove(slot2, slot0.oBingoNode)
end

EntityPoolMgr.getOneFishGold = function (slot0)
	slot4 = #slot0.oFishGold

	return table.remove(slot2, slot0.oFishGold)
end

EntityPoolMgr.getOneIconNode = function (slot0)
	slot4 = #slot0.oIconNode

	return table.remove(slot2, slot0.oIconNode)
end

EntityPoolMgr.getOneGoldLabelNode = function (slot0)
	slot4 = #slot0.oGoldLabelNode

	return table.remove(slot2, slot0.oGoldLabelNode)
end

EntityPoolMgr.getOneGoldOtherPlayerLabelNode = function (slot0)
	slot4 = #slot0.oOtherPlayerGoldLabelNode

	return table.remove(slot2, slot0.oOtherPlayerGoldLabelNode)
end

EntityPoolMgr.addGoldOtherPlayerLabelNode = function (slot0, slot1)
	if #slot0.oOtherPlayerGoldLabelNode > 10 then
		if slot1 then
			slot4 = slot1

			slot1.removeSelf(slot3)

			slot1 = nil
		end
	else
		slot0.oOtherPlayerGoldLabelNode[#slot0.oOtherPlayerGoldLabelNode + 1] = slot1
	end
end

EntityPoolMgr.getOneOtherPlayerGoldNode = function (slot0)
	slot4 = #slot0.oOtherPlayerGoldNode

	return table.remove(slot2, slot0.oOtherPlayerGoldNode)
end

EntityPoolMgr.addOtherPlayerGoldNode = function (slot0, slot1)
	if #slot0.oOtherPlayerGoldNode > 50 then
		if slot1 then
			slot4 = slot1

			slot1.removeSelf(slot3)

			slot1 = nil
		end
	else
		slot0.oOtherPlayerGoldNode[#slot0.oOtherPlayerGoldNode + 1] = slot1
	end
end

EntityPoolMgr.addOtherPlayerGaofenTextNode = function (slot0, slot1)
	if #slot0.oOtherPlayerGaoFenNode > 10 then
		if slot1 then
			slot4 = slot1

			slot1.removeSelf(slot3)

			slot1 = nil
		end
	else
		slot0.oOtherPlayerGaoFenNode[#slot0.oOtherPlayerGaoFenNode + 1] = slot1
	end
end

EntityPoolMgr.getOneOtherPlayerGaofenNode = function (slot0)
	slot3 = slot0.oOtherPlayerGaoFenNode

	if next(slot2) ~= nil then
		slot4 = #slot0.oOtherPlayerGaoFenNode

		return table.remove(slot2, slot0.oOtherPlayerGaoFenNode)
	end

	return nil
end

EntityPoolMgr.clearEffect = function (slot0, slot1)
	slot0.oBingoNode = {}
	slot0.oFishGold = {}
	slot0.oIconNode = {}
	slot0.oGoldLabelNode = {}
end

EntityPoolMgr.clearFishRenderPool = function (slot0, slot1)
	slot0.tFishRenderPool = {}
end

EntityPoolMgr.clearBulletRenderPool = function (slot0, slot1)
	slot0.tBulletRenderPool = {}
end

EntityPoolMgr.clearNetRenderPool = function (slot0, slot1)
	slot0.tNetRenderPool = {}
end

return EntityPoolMgr
