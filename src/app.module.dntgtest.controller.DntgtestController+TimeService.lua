DntgtestController.resetTimeService = function (slot0)
	slot0.MAX_DIFFRENCE = 2000
	slot0.SYNC_TIME = 3
	slot0.m_startTime = socket.gettime()
	slot3 = slot0
	slot0.m_dwServerTick = slot0.GetClientTick(slot2)
	slot0.m_lDiffrenceTick = 0
	slot0.m_dwTrade = 0
	slot0.m_bReady = false
	slot0.m_nSyncTime = 0
end

DntgtestController.getMaxDiffrence = function (slot0)
	return slot0.MAX_DIFFRENCE
end

DntgtestController.getSyncTime = function (slot0)
	return slot0.SYNC_TIME
end

DntgtestController.TimerSync = function (slot0, slot1, slot2)
	slot5 = slot0
	slot0.m_dwTrade = (slot0.GetClientTick(slot4) - slot1) / 2
	slot0.m_dwServerTick = slot2 + slot0.m_dwTrade
	slot0.m_lDiffrenceTick = slot0.m_dwServerTick - slot0.GetClientTick(slot4)
	slot0.m_bReady = true
end

DntgtestController.GetDelayTick = function (slot0, slot1)
	if not slot0.m_bReady then
		return 0
	end

	slot4 = slot0

	return slot0.GetServerTick(slot3) - slot1
end

DntgtestController.GetClientTick = function (slot0)
	slot3 = (socket.gettime() - slot0.m_startTime) * 1000

	return math.floor(slot2)
end

DntgtestController.GetServerTick = function (slot0)
	slot3 = slot0

	return slot0.GetClientTick(slot2) + slot0.m_lDiffrenceTick
end

DntgtestController.SetSyncTime = function (slot0, slot1)
	slot0.m_nSyncTime = slot1 + slot0.SYNC_TIME
end

DntgtestController.GetSyncTime = function (slot0, slot1)
	return slot0.m_nSyncTime
end

DntgtestController.GetDiffrence = function (slot0)
	return slot0.m_lDiffrenceTick
end

DntgtestController.GetDelay = function (slot0)
	return slot0.m_dwTrade
end

DntgtestController.BeReady = function (slot0)
	return slot0.m_bReady
end

return
