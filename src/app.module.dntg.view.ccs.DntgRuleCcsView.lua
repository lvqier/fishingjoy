DntgRuleCcsView = class("DntgRuleCcsView")

DntgRuleCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0:initValue()
end

DntgRuleCcsView.onShow = function (slot0)
	if slot0.view and slot0.view.rule_sv then
		slot0.view.rule_sv:jumpToPercent(0, 0, nil)
	end
end

DntgRuleCcsView.initValue = function (slot0)
	slot0.tShowItem = {
		normal = {
			target = slot0.view.ruleView_Normal,
			height = slot0.view.ruleView_Normal:getContentSize().height,
			btn = slot0.view.imgNormalFish
		},
		boss = {
			target = slot0.view.ruleView_Boss,
			height = slot0.view.ruleView_Boss:getContentSize().height,
			btn = slot0.view.imgBossFish
		},
		buff = {
			target = slot0.view.ruleView_Buff,
			height = slot0.view.ruleView_Buff:getContentSize().height,
			btn = slot0.view.imgBuffFish
		}
	}
	slot0.iRuleViewWidth = -1
	slot0.iRuleViewHeight = -1

	if slot0.view.rule_sv then
		slot0.iRuleViewWidth = slot0.view.rule_sv:getContentSize().width
		slot0.iRuleViewHeight = slot0.view.rule_sv:getContentSize().height
	end

	slot0.eCurrIdx = "normal"

	slot0:initView(slot0.eCurrIdx)
end

DntgRuleCcsView.initView = function (slot0, slot1)
	if not slot0.view.rule_sv then
		return
	end

	if slot0.tShowItem[slot1] == nil then
		return
	end

	slot2 = -1
	slot3 = pairs
	slot4 = slot0.tShowItem or {}

	for slot6, slot7 in slot3(slot4) do
		if slot6 == slot1 then
			slot7.target:setVisible(true)
			slot7.btn:setVisible(true)

			if slot7.height <= slot0.iRuleViewHeight then
				slot0.view.rule_sv:setInnerContainerSize(cc.size(slot0.iRuleViewWidth, slot0.iRuleViewHeight + 1))

				slot2 = slot0.iRuleViewHeight + 1
			else
				slot0.view.rule_sv:setInnerContainerSize(cc.size(slot0.iRuleViewWidth, slot7.height + 1))

				slot2 = slot7.height + 1
			end

			slot0.view.rule_sv:addContentChild(slot7.target)
			slot7.target:setAnchorPoint(cc.p(0, 1))
			slot7.target:setPosition(cc.p(0, slot2))
		else
			slot7.target:setVisible(false)
			slot7.btn:setVisible(false)
		end
	end
end

DntgRuleCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnNormalFish then
		slot0.eCurrIdx = "normal"

		slot0:initView(slot0.eCurrIdx)
	elseif slot1 == slot0.view.btnBossFish then
		slot0.eCurrIdx = "boss"

		slot0:initView(slot0.eCurrIdx)
	elseif slot1 == slot0.view.btnBuffFish then
		slot0.eCurrIdx = "buff"

		slot0:initView(slot0.eCurrIdx)
	elseif slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingRule(false)
	end
end

DntgRuleCcsView.destroy = function (slot0)
	ZoomPopUpChildView.destroy(slot0)
end

return
