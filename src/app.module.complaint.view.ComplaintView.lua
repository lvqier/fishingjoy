ComplaintView = class("ComplaintView")

requireLuaFromModule("complaint.view.ccs.ComplaintCcsView")
requireLuaFromModule("complaint.view.ccs.ComplaintCcsItem")

ccs.ComplaintCcsView = ComplaintCcsView
ccs.ComplaintCcsItem = ComplaintCcsItem

ComplaintView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2

	ClassUtil.extends(slot0, TweenToTargetModuleView, true, "csb/layer/Complaint.csb", nil, UIConfig.ALIGN_CENTER, false)
end

ComplaintView.onRootClick = function (slot0)
	return
end

ComplaintView.bindChildrenViews = function (slot0)
	slot1 = slot0:getRootView().layerMain.layerContent
	slot2 = "curTabIndex"
end

ComplaintView.destroy = function (slot0)
	TweenToTargetModuleView.destroy(slot0)

	slot0.model = nil
	slot0.controller = nil
end

return
