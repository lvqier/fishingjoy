slot2 = "SlwhRuleCcsView"
SlwhRuleCcsView = class(slot1)

SlwhRuleCcsView.onCreationComplete = function (slot0)
	slot4 = BaseRulePopupCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseRulePopupCcsView.onCreationComplete(slot2)

	slot3 = slot0

	slot0.initRule(slot2)
end

SlwhRuleCcsView.initRule = function (slot0)
	if slot0.view.slwh_rule_shadow then
		slot4 = 999

		slot0.view.slwh_rule_shadow.setLocalZOrder(slot2, slot0.view.slwh_rule_shadow)
	end
end

return
