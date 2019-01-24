DntglkController.resetTimeService = function (slot0)
	slot0.MAX_DIFFRENCE = 2000
	slot0.SYNC_TIME = 3
	slot0.m_startTime = socket.gettime()
	slot3 = slot0
	slot0.m_dwServerTick = slot0.GetClientTick(slot2)
	slot0.m_lDiffrenceTick = 0
	slot0.m_dwTrade = 0
	slot0.m_bReady = false
	slot0.m_nSyncTime = 0
	slot0.lastClientTick = 0
	slot0.lastServerTick = 0
end

DntglkController.getMaxDiffrence = function (slot0)
	return slot0.MAX_DIFFRENCE
end

DntglkController.getSyncTime = function (slot0)
	return slot0.SYNC_TIME
end

DntglkController.TimerSync = function (slot0, slot1, slot2)
	slot0.m_dwTrade = (slot0.GetClientTick(slot4) - slot1) / 2
	slot0.m_dwServerTick = slot2
	slot0.m_lDiffrenceTick = slot0.m_dwServerTick - slot0.GetClientTick(slot4)
	slot0.tradeOffset = 0
	slot0.m_bReady = true
	slot0.currentServerTick = slot2
	slot0.currentConfirmed = slot2
	slot0.futureServerTick = slot2
	slot0.latestServerTick = slot2
	slot9 = slot2

	print(string.format(slot7, "========== [TIME SYNC] serverTick:%d"))

	slot6 = slot0.constraintedQueue

	slot0.constraintedQueue.reset(slot0)

	slot0.constraintedQueue.syncFlag = true
end

DntglkController.GetDelayTick = function (slot0, slot1)
	if not slot0.m_bReady then
		return 0
	end

	slot4 = slot0

	return slot0.GetServerTick(slot3) - slot1
end

DntglkController.GetClientTick = function (slot0)
	slot3 = (socket.gettime() - slot0.m_startTime) * 1000

	return math.floor(slot2)
end

DntglkController.GetServerTick = function (slot0)
	slot3 = slot0

	return slot0.GetClientTick(slot2) + slot0.m_lDiffrenceTick
end

DntglkController.SetSyncTime = function (slot0, slot1)
	slot0.m_nSyncTime = slot1 + slot0.SYNC_TIME
end

DntglkController.GetSyncTime = function (slot0, slot1)
	return slot0.m_nSyncTime
end

DntglkController.GetDiffrence = function (slot0)
	return slot0.m_lDiffrenceTick
end

DntglkController.GetDelay = function (slot0)
	return slot0.m_dwTrade
end

DntglkController.BeReady = function (slot0)
	return slot0.m_bReady
end

return
