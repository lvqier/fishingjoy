SerialLjRuleCcsView = class("SerialLjRuleCcsView")

SerialLjRuleCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0:initValue()
end

SerialLjRuleCcsView.onShow = function (slot0)
	if slot0.view and slot0.view.rule_sv then
		slot0.view.rule_sv:jumpToPercent(0, 0, nil)
	end
end

SerialLjRuleCcsView.initValue = function (slot0)
	slot1 = slot0.view.rule_sv:getContentSize().width

	if slot0.view.ruleView:getContentSize().height < slot0.view.rule_sv:getContentSize().height then
		slot2 = slot3
	end

	slot0.view.rule_sv:setInnerContainerSize(cc.size(slot1, slot2))
	slot0.view.rule_sv:addContentChild(slot0.view.ruleView)
	slot0.view.ruleView:setAnchorPoint(cc.p(0, 1))
	slot0.view.ruleView:setPosition(cc.p(0, slot2))

	if slot0.view.shadow then
		slot0.view.shadow:setLocalZOrder(888)
	end

	if slot0.view.titleSp then
		slot0.view.titleSp:setLocalZOrder(999)
	end
end

SerialLjRuleCcsView.onTouchOperation = function (slot0, slot1, slot2)
	if slot2 ~= ccs.TOUCH_EVENT_CANCELED then
		if slot2 == ccs.TOUCH_EVENT_MOVED then
			slot0.view.shadow:setVisible(true)
		elseif slot2 == ccs.TOUCH_EVENT_ENDED then
			slot0.view.shadow:setVisible(false)
		end
	end

	slot0.view.rule_sv:onTouchOperation(slot1, slot2)
end

SerialLjRuleCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingLjRule(false)
	end
end

SerialLjRuleCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.rule_sv)
	ZoomPopUpChildView.destroy(slot0)
end

return
