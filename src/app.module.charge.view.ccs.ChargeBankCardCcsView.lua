slot2 = "ChargeBankCardCcsView"
ChargeBankCardCcsView = class(slot1)

ChargeBankCardCcsView.onCreationComplete = function (slot0)
	slot0._curShowingView = nil
	slot0._tabViewConfigs = {
		{
			csb = "csb/layer/ChargeBankCardTabCreate.csb"
		},
		{
			csb = "csb/layer/ChargeBankCardTabMyOrder.csb"
		}
	}
	slot0._tabPane = CcsTabPane.new()
	slot5 = {
		slot0.tab1,
		slot0.tab2
	}

	slot0._tabPane.pushTabs(slot3, slot0._tabPane)

	slot6 = slot0

	slot0._tabPane.tabClickSignal.add(slot3, slot0._tabPane.tabClickSignal, slot0.onTabSelected)

	slot6 = slot0

	slot0.model.bankCardTabIndexChangedSignal.add(slot3, slot0.model.bankCardTabIndexChangedSignal, slot0.onTabIndex)
end

ChargeBankCardCcsView.onTabIndex = function (slot0)
	slot5 = slot0.model.getBankCardTabIndex(slot2)

	slot0._tabPane.setSelectedTabIndex(slot0.model, slot0._tabPane)

	if slot0.model.getBankCardTabIndex(slot2) and slot0._tabViewConfigs[slot1] then
		if not slot2.view then
			slot7 = slot0
			slot6 = ResConfig.loadCsLayout(slot5, slot2.csb)

			ResConfig.loadCsLayout(slot5, slot2.csb).retain(slot5)

			slot2.view = ResConfig.loadCsLayout(slot5, slot2.csb)
		end

		if slot0._curShowingView then
			slot7 = slot0._curShowingView

			applyFunction2(slot5, slot0._curShowingView.onHide)

			slot6 = slot0._curShowingView

			slot0._curShowingView.removeFromParent(slot5)
		end

		slot7 = slot3

		slot0.nodeTabParent.addChild(slot5, slot0.nodeTabParent)

		slot7 = slot3

		applyFunction2(slot5, slot3.onShow)

		slot0._curShowingView = slot3
	end
end

ChargeBankCardCcsView.onShow = function (slot0)
	slot3 = slot0

	slot0.onTabIndex(slot2)
end

ChargeBankCardCcsView.onTabSelected = function (slot0, slot1)
	slot5 = slot1

	slot0.model.setBankCardTabIndex(slot3, slot0.model)
end

ChargeBankCardCcsView.onHide = function (slot0)
	return
end

ChargeBankCardCcsView.destroy = function (slot0)
	return
end

return
