slot2 = "ChargeTabCcsItem"
ChargeTabCcsItem = class(slot1)

ChargeTabCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot5 = slot0

	slot0.model.curTabIndexChangedSignal.add(slot2, slot0.model.curTabIndexChangedSignal, slot0.onTabIndexChanged)
end

ChargeTabCcsItem.updateView = function (slot0)
	if slot0._data then
		slot4 = slot0._data.config.Title

		slot0.normal.txt.setString(slot2, slot0.normal.txt)

		slot4 = slot0._data.config.Title

		slot0.selected.txt.setString(slot2, slot0.selected.txt)
	end

	slot3 = slot0

	slot0.onTabIndexChanged(slot2)
end

ChargeTabCcsItem.onClick = function (slot0)
	slot5 = slot0._data.config

	slot0.controller.changeTab(slot2, slot0.controller, slot0._data.uiIndex)
end

ChargeTabCcsItem.onTabIndexChanged = function (slot0)
	if not slot0._data then
		return
	end

	slot3 = slot0.model
	slot6 = not (slot0.model.getCurTabIndex(slot2) == slot0._data.uiIndex)

	slot0.normal.setVisible(slot4, slot0.normal)

	slot6 = slot0.model.getCurTabIndex(slot2) == slot0._data.uiIndex

	slot0.selected.setVisible(slot4, slot0.selected)
end

ChargeTabCcsItem.destroy = function (slot0)
	slot5 = slot0

	slot0.model.curTabIndexChangedSignal.remove(slot2, slot0.model.curTabIndexChangedSignal, slot0.onTabIndexChanged)

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
