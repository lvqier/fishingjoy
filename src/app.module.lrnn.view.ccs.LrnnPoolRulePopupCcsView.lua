slot2 = "LrnnPoolRulePopupCcsView"
LrnnPoolRulePopupCcsView = class(slot1)

LrnnPoolRulePopupCcsView.onCreationComplete = function (slot0)
	slot4 = BaseRulePopupCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseRulePopupCcsView.onCreationComplete(slot2)
end

LrnnPoolRulePopupCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingPoolRule(slot2, slot0.model)
end

LrnnPoolRulePopupCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose or slot1 == slot0.view.btnSure then
		slot6 = false

		slot0.model.setIsShowingPoolRule(slot4, slot0.model)
	end
end

LrnnPoolRulePopupCcsView.destroy = function (slot0)
	slot3 = slot0

	BaseRulePopupCcsView.destroy(slot2)
end

return
