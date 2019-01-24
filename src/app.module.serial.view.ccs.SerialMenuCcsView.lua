SerialMenuCcsView = class("SerialMenuCcsView")

SerialMenuCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseMenuCcsView)
	BaseMenuCcsView.onCreationComplete(slot0)
end

SerialMenuCcsView.onBtnClick = function (slot0, slot1, slot2)
	slot0.model:setIsShowingMenu(false)

	if slot1 == slot0.btnBack then
		slot0.model:setIsShowingExit(true)
	elseif slot1 == slot0.btnSetting then
		slot0.model:setIsShowingSetting(true)
	else
		BaseMenuCcsView.onBtnClick(slot0, slot1, slot2)
	end
end

return
