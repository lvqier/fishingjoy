slot2 = "BankTypeListCcsItem"
BankTypeListCcsItem = class(slot1)

BankTypeListCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot5 = slot0

	slot0.model.curTabIndexChangedSignal.add(slot2, slot0.model.curTabIndexChangedSignal, slot0.onTabIndexChanged)
end

BankTypeListCcsItem.updateView = function (slot0)
	if slot0._data then
		slot3 = slot0.normal
		slot6 = slot0._data.normalImage

		slot0.normal.setTexture(slot2, ResConfig.getUITxtPath(slot5))

		slot3 = slot0.selected
		slot6 = slot0._data.selectedImage

		slot0.selected.setTexture(slot2, ResConfig.getUITxtPath(slot5))
	end

	slot3 = slot0

	slot0.onTabIndexChanged(slot2)
end

BankTypeListCcsItem.onClick = function (slot0)
	slot4 = slot0._itemIndex

	slot0.controller.changeCurTabIndex(slot2, slot0.controller)
end

BankTypeListCcsItem.onTabIndexChanged = function (slot0)
	slot3 = slot0.model
	slot6 = not (slot0.model.getCurTabIndex(slot2) == slot0._itemIndex)

	slot0.normal.setVisible(slot4, slot0.normal)

	slot6 = slot0.model.getCurTabIndex(slot2) == slot0._itemIndex

	slot0.selected.setVisible(slot4, slot0.selected)
end

BankTypeListCcsItem.destroy = function (slot0)
	slot5 = slot0

	slot0.model.curTabIndexChangedSignal.remove(slot2, slot0.model.curTabIndexChangedSignal, slot0.onTabIndexChanged)

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
