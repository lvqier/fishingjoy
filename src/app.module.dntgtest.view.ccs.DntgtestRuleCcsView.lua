slot2 = "DntgtestRuleCcsView"
DntgtestRuleCcsView = class(slot1)

DntgtestRuleCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot3 = slot0

	slot0.initValue(slot2)
end

DntgtestRuleCcsView.onShow = function (slot0)
	if slot0.view and slot0.view.rule_sv then
		slot6 = nil

		slot0.view.rule_sv.jumpToPercent(slot2, slot0.view.rule_sv, 0, 0)
	end
end

DntgtestRuleCcsView.initValue = function (slot0)
	slot5 = slot0.view.ruleView_Normal
	slot5 = slot0.view.ruleView_Boss
	slot5 = slot0.view.ruleView_Buff
	slot0.tShowItem = {
		normal = {
			target = slot0.view.ruleView_Normal,
			height = slot0.view.ruleView_Normal.getContentSize(slot4).height,
			btn = slot0.view.imgNormalFish
		},
		boss = {
			target = slot0.view.ruleView_Boss,
			height = slot0.view.ruleView_Boss.getContentSize(slot4).height,
			btn = slot0.view.imgBossFish
		},
		buff = {
			target = slot0.view.ruleView_Buff,
			height = slot0.view.ruleView_Buff.getContentSize(slot4).height,
			btn = slot0.view.imgBuffFish
		}
	}
	slot0.iRuleViewWidth = -1
	slot0.iRuleViewHeight = -1

	if slot0.view.rule_sv then
		slot3 = slot0.view.rule_sv
		slot0.iRuleViewWidth = slot0.view.rule_sv.getContentSize(slot2).width
		slot3 = slot0.view.rule_sv
		slot0.iRuleViewHeight = slot0.view.rule_sv.getContentSize(slot2).height
	end

	slot0.eCurrIdx = "normal"
	slot4 = slot0.eCurrIdx

	slot0.initView(slot2, slot0)
end

DntgtestRuleCcsView.initView = function (slot0, slot1)
	if not slot0.view.rule_sv then
		return
	end

	if slot0.tShowItem[slot1] == nil then
		return
	end

	slot2 = -1
	slot3 = pairs
	slot5 = slot0.tShowItem or {}

	for slot6, slot7 in slot3(slot4) do
		if slot6 == slot1 then
			slot11 = true

			slot7.target.setVisible(slot9, slot7.target)

			slot11 = true

			slot7.btn.setVisible(slot9, slot7.btn)

			if slot7.height <= slot0.iRuleViewHeight then
				slot10 = slot0.view.rule_sv
				slot14 = slot0.iRuleViewHeight + 1

				slot0.view.rule_sv.setInnerContainerSize(slot9, cc.size(slot12, slot0.iRuleViewWidth))

				slot2 = slot0.iRuleViewHeight + 1
			else
				slot10 = slot0.view.rule_sv
				slot14 = slot7.height + 1

				slot0.view.rule_sv.setInnerContainerSize(slot9, cc.size(slot12, slot0.iRuleViewWidth))

				slot2 = slot7.height + 1
			end

			slot11 = slot7.target

			slot0.view.rule_sv.addContentChild(slot9, slot0.view.rule_sv)

			slot10 = slot7.target
			slot14 = 1

			slot7.target.setAnchorPoint(slot9, cc.p(slot12, 0))

			slot10 = slot7.target
			slot14 = slot2

			slot7.target.setPosition(slot9, cc.p(slot12, 0))
		else
			slot11 = false

			slot7.target.setVisible(slot9, slot7.target)

			slot11 = false

			slot7.btn.setVisible(slot9, slot7.btn)
		end
	end
end

DntgtestRuleCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnNormalFish then
		slot0.eCurrIdx = "normal"
		slot6 = slot0.eCurrIdx

		slot0.initView(slot4, slot0)
	elseif slot1 == slot0.view.btnBossFish then
		slot0.eCurrIdx = "boss"
		slot6 = slot0.eCurrIdx

		slot0.initView(slot4, slot0)
	elseif slot1 == slot0.view.btnBuffFish then
		slot0.eCurrIdx = "buff"
		slot6 = slot0.eCurrIdx

		slot0.initView(slot4, slot0)
	elseif slot1 == slot0.view.btnClose then
		slot6 = false

		slot0.model.setIsShowingRule(slot4, slot0.model)
	end
end

DntgtestRuleCcsView.destroy = function (slot0)
	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
