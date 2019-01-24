slot0 = class("ComplaintModule")

requireLuaFromModule("complaint.model.ComplaintModel")
requireLuaFromModule("complaint.controller.ComplaintController")
requireLuaFromModule("complaint.view.ComplaintView")

slot0.ctor = function (slot0, ...)
	ClassUtil.extends(slot0, BaseUIModule, true, ComplaintModel, ComplaintView, ComplaintController)
end

slot0.show = function (slot0, slot1)
	slot0:initMvc()
	slot0.view:setTriggerTarget(slot1)
	slot0.view:show()

	if not slot0.model:getCurTabIndex() then
		slot0.model:setCurTabIndex(1)
	end
end

ProxyComplaint = slot0.new()

return ProxyComplaint
