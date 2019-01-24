SerialRuleCcsView = class("SerialRuleCcsView")

SerialRuleCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseRulePopupCcsView)
	BaseRulePopupCcsView.onCreationComplete(slot0)
	slot0:initRule()
end

SerialRuleCcsView.initRule = function (slot0)
	if slot0.view.shadow_up then
		slot0.view.shadow_up:setLocalZOrder(999)
	end

	if slot0.view.shadow_down then
		slot0.view.shadow_down:setLocalZOrder(999)
	end
end

return
