slot2 = "BaseRulePopupCcsView"
BaseRulePopupCcsView = class(slot1)

BaseRulePopupCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot3 = slot0

	slot0.init(slot2)
end

BaseRulePopupCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingRule(slot2, slot0.model)
end

BaseRulePopupCcsView.init = function (slot0)
	if slot0.view.rule_sv then
		slot1 = slot0.view.rule_sv.getContentSize(slot2).width
		slot5 = slot0.view.rule_sv

		if slot0.view.ruleView.getContentSize(slot0.view.rule_sv).height < slot0.view.rule_sv.getContentSize(slot0.view.ruleView).height then
			slot2 = slot3
		end

		slot6 = slot0.view.rule_sv
		slot10 = slot2

		slot0.view.rule_sv.setInnerContainerSize(slot5, cc.size(slot8, slot1))

		slot7 = slot0.view.ruleView

		slot0.view.rule_sv.addContentChild(slot5, slot0.view.rule_sv)

		slot6 = slot0.view.ruleView
		slot10 = 1

		slot0.view.ruleView.setAnchorPoint(slot5, cc.p(slot8, 0))

		slot6 = slot0.view.ruleView
		slot10 = slot2

		slot0.view.ruleView.setPosition(slot5, cc.p(slot8, 0))
	end
end

BaseRulePopupCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose or slot1 == slot0.view.btnSure then
		slot5 = slot0.model

		if slot0.model.getGameKind(slot4) == GameKind_DDZ_VIRTUAL then
			slot6 = false

			slot0.model.setIsShowBxpRule(slot4, slot0.model)

			slot6 = false

			slot0.model.setIsShowJdRule(slot4, slot0.model)
		else
			slot6 = false

			slot0.model.setIsShowingRule(slot4, slot0.model)
		end
	end
end

BaseRulePopupCcsView.destroy = function (slot0)
	slot3 = slot0.view.rule_sv

	destroySomeObj(slot2)

	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.btnSure

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
