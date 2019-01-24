FishingJoyController.resetTimeService = function (slot0)
	slot0.maxDiffTimer = 2000
	slot0.syncTimer = 3
	slot0.startTimer = socket.gettime()
	slot3 = slot0
	slot0.serverTick = slot0.getClientTick(slot2)
	slot0.diffTick = 0
	slot0.trade = 0
	slot0.ready = false
	slot0.syncTime = 0
end

FishingJoyController.getMaxDiffrence = function (slot0)
	return slot0.maxDiffTimer
end

FishingJoyController.getSyncTime = function (slot0)
	return slot0.syncTimer
end

FishingJoyController.executeTimerSync = function (slot0, slot1, slot2)
	slot5 = slot0
	slot0.trade = (slot0.getClientTick(slot4) - slot1) / 2
	slot0.serverTick = slot2 + slot0.trade
	slot0.diffTick = slot0.serverTick - slot0.getClientTick(slot4)
	slot0.ready = true
end

FishingJoyController.getDelayTick = function (slot0, slot1)
	if not slot0.ready then
		return 0
	end

	slot4 = slot0

	return slot0.getServerTick(slot3) - slot1
end

FishingJoyController.getClientTick = function (slot0)
	slot3 = (socket.gettime() - slot0.startTimer) * 1000

	return math.floor(slot2)
end

FishingJoyController.getServerTick = function (slot0)
	slot3 = slot0

	return slot0.getClientTick(slot2) + slot0.diffTick
end

FishingJoyController.setSyncTime = function (slot0, slot1)
	slot0.syncTime = slot1 + slot0.syncTimer
end

FishingJoyController.getMoveDelay = function (slot0)
	return slot0.trade
end

FishingJoyController.checkReady = function (slot0)
	return slot0.ready
end

return
