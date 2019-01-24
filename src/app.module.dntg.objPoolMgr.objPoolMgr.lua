slot0 = nil
slot1 = class("objPoolMgr")

slot1.getInstance = function (slot0)
	if slot0 == nil then
		slot0 = slot1.new()
	end

	return slot0
end

slot1.initCacheList = function (slot0)
	slot0.tFishRenderPool = {}
	slot0.tBulletRenderPool = {}
	slot0.tNetRenderPool = {}
	slot0.oBingoNode = {}
	slot0.oFishGold = {}
	slot0.oIconNode = {}
	slot0.oGoldLabelNode = {}

	slot0:reset()
end

slot1.reset = function (slot0)
	slot0.bFishClean_1 = false
	slot0.bFishClean_2 = true
	slot0.bBulletClean = true
	slot0.bNetClean = true
	slot0.fCleanDt = 0
end

slot1.clearPoolMgr = function (slot0)
	slot0:clearFishRenderPool()
	slot0:clearBulletRenderPool()
	slot0:clearNetRenderPool()
	slot0:clearEffect()
	slot0:reset()
end

slot1.addBingoNode = function (slot0, slot1)
	if #slot0.oBingoNode > 15 then
		if slot1 then
			slot1:removeSelf()

			slot1 = nil
		end
	else
		slot0.oBingoNode[#slot0.oBingoNode + 1] = slot1
	end
end

slot1.addFishGold = function (slot0, slot1)
	if #slot0.oFishGold > 50 then
		if slot1 then
			slot1:removeSelf()

			slot1 = nil
		end
	else
		slot0.oFishGold[#slot0.oFishGold + 1] = slot1
	end
end

slot1.getFishGoldPoolSize = function (slot0)
	return #slot0.oFishGold
end

slot1.addIconNode = function (slot0, slot1)
	if #slot0.oIconNode > 30 then
		if slot1 then
			slot1:removeSelf()

			slot1 = nil
		end
	else
		slot0.oIconNode[#slot0.oIconNode + 1] = slot1
	end
end

slot1.addGoldLabelNode = function (slot0, slot1)
	if #slot0.oGoldLabelNode > 30 then
		if slot1 then
			slot1:removeSelf()

			slot1 = nil
		end
	else
		slot0.oGoldLabelNode[#slot0.oGoldLabelNode + 1] = slot1
	end
end

slot1.addFishRenderPool = function (slot0, slot1, slot2)
	if slot0.tFishRenderPool[slot2] == nil then
		slot0.tFishRenderPool[slot2] = {}
	end

	if #slot0.tFishRenderPool[slot2] > 15 then
		if slot1 and slot1.target then
			slot1.target:removeSelf()

			slot1.target = nil
		end
	else
		slot0.tFishRenderPool[slot2][#slot0.tFishRenderPool[slot2] + 1] = slot1
	end
end

slot1.addBulletRenderPool = function (slot0, slot1, slot2)
	if slot0.tBulletRenderPool[slot2] == nil then
		slot0.tBulletRenderPool[slot2] = {}
	end

	if #slot0.tBulletRenderPool[slot2] > 100 then
		if slot1 and slot1.target then
			slot1.target:removeSelf()

			slot1.target = nil
		end
	else
		slot0.tBulletRenderPool[slot2][#slot0.tBulletRenderPool[slot2] + 1] = slot1
	end
end

slot1.addNetRenderPool = function (slot0, slot1, slot2)
	if slot0.tNetRenderPool[slot2] == nil then
		slot0.tNetRenderPool[slot2] = {}
	end

	if #slot0.tNetRenderPool[slot2] > 100 then
		if slot1 and slot1.target then
			slot1.target:removeSelf()

			slot1.target = nil
		end
	else
		slot0.tNetRenderPool[slot2][#slot0.tNetRenderPool[slot2] + 1] = slot1
	end
end

slot1.getOneFishRender = function (slot0, slot1)
	if slot0.tFishRenderPool[slot1] then
		return table.remove(slot0.tFishRenderPool[slot1], #slot0.tFishRenderPool[slot1])
	end

	return nil
end

slot1.getOneBulletRenderPool = function (slot0, slot1)
	if slot0.tBulletRenderPool[slot1] then
		return table.remove(slot0.tBulletRenderPool[slot1], #slot0.tBulletRenderPool[slot1])
	end

	return nil
end

slot1.getOneNetRender = function (slot0, slot1)
	if slot0.tNetRenderPool[slot1] then
		return table.remove(slot0.tNetRenderPool[slot1], #slot0.tNetRenderPool[slot1])
	end

	return nil
end

slot1.getOneBingoNode = function (slot0)
	return table.remove(slot0.oBingoNode, #slot0.oBingoNode)
end

slot1.getOneFishGold = function (slot0)
	return table.remove(slot0.oFishGold, #slot0.oFishGold)
end

slot1.getOneIconNode = function (slot0)
	return table.remove(slot0.oIconNode, #slot0.oIconNode)
end

slot1.getOneGoldLabelNode = function (slot0)
	return table.remove(slot0.oGoldLabelNode, #slot0.oGoldLabelNode)
end

slot1.clearEffect = function (slot0)
	slot0.oBingoNode = {}
	slot0.oFishGold = {}
	slot0.oIconNode = {}
	slot0.oGoldLabelNode = {}
end

slot1.clearFishRenderPool = function (slot0)
	slot0.tFishRenderPool = {}
end

slot1.clearBulletRenderPool = function (slot0)
	slot0.tBulletRenderPool = {}
end

slot1.clearNetRenderPool = function (slot0)
	slot0.tNetRenderPool = {}
end

return slot1
