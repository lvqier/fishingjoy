slot0 = class("DebugLogClient")

requireClientCoreMain("log.debuglog.model.DebugLogModel")
requireClientCoreMain("log.debuglog.controller.DebugLogController")
requireClientCoreMain("log.debuglog.view.DebugLogView")
requireClientCoreMain("log.debuglog.view.assets.DebugLogCcsListItem")

slot0.ctor = function (slot0)
	slot0.model = DebugLogModel.new()
	slot0.controller = DebugLogController.new(slot0.model)
	slot0.view = DebugLogView.new(slot0.model, slot0.controller)
end

slot0.pushLog = function (slot0, slot1, slot2)
	if StringUtil.isStringValid(slot1) then
		if slot2 and not string.find(slot1, "client version:") then
			slot1 = HtmlUtil.createYellowTxt("----------- client version:" .. tostring(CLIENT_VERSION) .. "-------------\n") .. slot1
		end

		if slot2 and not string.find(slot1, "device type:") then
			slot1 = HtmlUtil.createYellowTxt("\n----------- device type:" .. tostring(PACKAGE_DEVICE_TYPE) .. "-------------\n") .. slot1
		end
	end

	slot0.controller:pushLog(slot1, slot2)

	if slot2 then
		slot0.model:setHasBug(true)
	end
end

slot0.setEntranceShowing = function (slot0, slot1)
	if slot0.model then
		slot0.model:setIsLogEntranceShow(slot1)
	end
end

slot0.deployAtScene = function (slot0, slot1)
	if slot1 then
		slot0.view:deployAtScene(slot1)
	end
end

ProxyDebugLog = slot0.new()

return
