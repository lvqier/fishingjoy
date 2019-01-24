DntgBattleLoadingCcsView = class("DntgBattleLoadingCcsView")

DntgBattleLoadingCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseGameLoadingCcsView, nil)
	BaseGameLoadingCcsView.onCreationComplete(slot0)
end

DntgBattleLoadingCcsView.onShow = function (slot0)
	slot0.icon:setVisible(false)
	slot0.txtLoad:setVisible(false)
	slot0.bgLoading:setVisible(false)
	slot0.loadingBar:setVisible(false)
	slot0.bgLoadingTxt:setVisible(false)
	slot0.txtInfo:setVisible(false)
end

return
