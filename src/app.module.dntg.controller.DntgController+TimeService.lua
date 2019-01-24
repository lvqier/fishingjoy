DntgController.resetTimeService = function (slot0)
	slot0.MAX_DIFFRENCE = 2000
	slot0.SYNC_TIME = 3
	slot0.m_startTime = socket.gettime()
	slot0.m_dwServerTick = slot0:GetClientTick()
	slot0.m_lDiffrenceTick = 0
	slot0.m_dwTrade = 0
	slot0.m_bReady = false
	slot0.m_nSyncTime = 0
end

DntgController.getMaxDiffrence = function (slot0)
	return slot0.MAX_DIFFRENCE
end

DntgController.getSyncTime = function (slot0)
	return slot0.SYNC_TIME
end

DntgController.TimerSync = function (slot0, slot1, slot2)
	slot0.m_dwTrade = (slot0:GetClientTick() - slot1) / 2
	slot0.m_dwServerTick = slot2 + slot0.m_dwTrade
	slot0.m_lDiffrenceTick = slot0.m_dwServerTick - slot0.GetClientTick()
	slot0.m_bReady = true
end

DntgController.GetDelayTick = function (slot0, slot1)
	if not slot0.m_bReady then
		return 0
	end

	return slot0:GetServerTick() - slot1
end

DntgController.GetClientTick = function (slot0)
	return math.floor((socket.gettime() - slot0.m_startTime) * 1000)
end

DntgController.GetServerTick = function (slot0)
	return slot0:GetClientTick() + slot0.m_lDiffrenceTick
end

DntgController.SetSyncTime = function (slot0, slot1)
	slot0.m_nSyncTime = slot1 + slot0.SYNC_TIME
end

DntgController.GetSyncTime = function (slot0, slot1)
	return slot0.m_nSyncTime
end

DntgController.GetDiffrence = function (slot0)
	return slot0.m_lDiffrenceTick
end

DntgController.GetDelay = function (slot0)
	return slot0.m_dwTrade
end

DntgController.BeReady = function (slot0)
	return slot0.m_bReady
end

return
