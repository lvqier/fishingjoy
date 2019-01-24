slot2 = "DdzGameCcsView"
DdzGameCcsView = class(slot1)

DdzGameCcsView.onCreationComplete = function (slot0)
	slot4 = BaseGameCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseGameCcsView.onCreationComplete(slot2)

	slot4 = not IS_IOS_VERIFY

	slot0.layerNotice.setVisible(slot2, slot0.layerNotice)

	slot5 = slot0

	slot0.model.curShowingViewTypeChangedSignal.add(slot2, slot0.model.curShowingViewTypeChangedSignal, slot0.onViewTypeChanged)

	slot3 = slot0

	slot0.onViewTypeChanged(slot2)
end

DdzGameCcsView.onViewTypeChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCurShowingViewType(slot2) == VIEW_TYPE_DDZ_BATTLE_JD or slot1 == VIEW_TYPE_DDZ_BATTLE_BXP then
		slot5 = 1022

		slot0.layerNotice.setPositionX(slot3, slot0.layerNotice)
	else
		slot5 = 617

		slot0.layerNotice.setPositionX(slot3, slot0.layerNotice)
	end
end

DdzGameCcsView.onBtnClick = function (slot0, slot1, slot2)
	return
end

return
