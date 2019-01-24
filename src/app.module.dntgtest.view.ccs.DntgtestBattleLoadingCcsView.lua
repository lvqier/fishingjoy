slot2 = "DntgtestBattleLoadingCcsView"
DntgtestBattleLoadingCcsView = class(slot1)

DntgtestBattleLoadingCcsView.onCreationComplete = function (slot0)
	slot5 = nil

	ClassUtil.extends(slot2, slot0, BaseGameLoadingCcsView)

	slot3 = slot0

	BaseGameLoadingCcsView.onCreationComplete(slot2)
end

DntgtestBattleLoadingCcsView.onShow = function (slot0)
	slot4 = false

	slot0.icon.setVisible(slot2, slot0.icon)

	slot4 = false

	slot0.txtLoad.setVisible(slot2, slot0.txtLoad)

	slot4 = false

	slot0.bgLoading.setVisible(slot2, slot0.bgLoading)

	slot4 = false

	slot0.loadingBar.setVisible(slot2, slot0.loadingBar)

	slot4 = false

	slot0.bgLoadingTxt.setVisible(slot2, slot0.bgLoadingTxt)

	slot4 = false

	slot0.txtInfo.setVisible(slot2, slot0.txtInfo)
end

return
