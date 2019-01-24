DebugLogModel = class("DebugLogModel")

DebugLogModel.ctor = function (slot0)
	createSetterGetter(slot0, "logs", {}, true)
	createSetterGetter(slot0, "errorLogs", {})
	createSetterGetter(slot0, "isLogShow", false, true)
	createSetterGetter(slot0, "isStick2Bottom", false, true)
	createSetterGetter(slot0, "isPauseNewMsg", false, true)
	createSetterGetter(slot0, "hasBug", false, true)
	createSetterGetter(slot0, "isShowingErrorMsgs", false, true)
	createSetterGetter(slot0, "isLogEntranceShow", not isOutServer or isOutServerTest or shengsPhone or not isMobile or PACKAGE_DEVICE_TYPE == 150 or PACKAGE_DEVICE_TYPE == 255 or PACKAGE_DEVICE_TYPE == 149 or PACKAGE_DEVICE_TYPE == 254, true)
	createSetterGetter(slot0, "canLogScroll", true, true)
	createSetterGetter(slot0, "logMax", 200)
	createSetterGetter(slot0, "logIndex", 0, false, false, false, true)
end

return
