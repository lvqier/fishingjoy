ComplaintModel = class("ComplaintModel")

ComplaintModel.ctor = function (slot0)
	createSetterGetter(slot0, "curTabIndex", nil, true)
	createSetterGetter(slot0, "complaintList", {}, true)
	createSetterGetter(slot0, "notReadedList", {}, true)
end

ComplaintModel.destroy = function (slot0)
	SignalAs3.clearAllSignal(slot0)
end

return
