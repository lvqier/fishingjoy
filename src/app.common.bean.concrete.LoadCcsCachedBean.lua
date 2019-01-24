slot2 = "LoadCcsCachedBean"
LoadCcsCachedBean = class(slot1)

LoadCcsCachedBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)

	slot4 = TickBase

	ClassUtil.extends(slot2, slot0)

	slot0._ccsConfigs = {}
	slot0._tempCaches = {}
	slot0._curCcsIndex = 1
	slot0._curCcsNum = 0
end

LoadCcsCachedBean.tick = function (slot0)
	if not slot0._ccsConfigs[slot0._curCcsIndex] then
		slot4 = slot0._tempCaches

		for slot5, slot6 in ipairs(slot3) do
			slot10 = slot6

			ccsPoolMgr.put(slot8, ccsPoolMgr)
		end

		slot0._tempCaches = {}
	else
		slot5 = slot1.totalNum - slot0._curCcsNum
		slot5 = "正在缓存:" .. slot1.url .. ",数量:" .. math.min(slot3, slot1.numPerFrame)

		print(slot1.numPerFrame)

		for slot6 = 1, math.min(slot3, slot1.numPerFrame), 1 do
			slot12 = slot1.isNodeOrLayout
			slot14 = tickMgr
			slot11 = "耗时：" .. tickMgr.getTimer(slot13) - tickMgr.getTimer(slot8) .. ", url:" .. slot1.url

			print(ccsPoolMgr)

			slot12 = ccsPoolMgr.get(tickMgr, ccsPoolMgr, slot1.url)

			table.insert(ccsPoolMgr, slot0._tempCaches)
		end

		slot0._curCcsNum = slot0._curCcsNum + slot2

		if slot1.totalNum <= slot0._curCcsNum then
			slot0._curCcsIndex = slot0._curCcsIndex + 1
			slot0._curCcsNum = 0
		end
	end
end

LoadCcsCachedBean.destroy = function (slot0)
	slot3 = slot0

	TickBase.destroy(slot2)

	slot3 = slot0

	AbstractBean.destroy(slot2)
end

LoadCcsCachedBean.start = function (slot0)
	slot4 = 60

	slot0.startTick(slot2, slot0)

	slot3 = slot0

	slot0.tick(slot2)
end

return
