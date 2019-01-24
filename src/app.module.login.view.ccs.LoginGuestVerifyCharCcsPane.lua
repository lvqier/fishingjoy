LoginGuestVerifyCharCcsPane = class("LoginGuestVerifyCharCcsPane")

LoginGuestVerifyCharCcsPane.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomCcsBtn, true, slot0)
	createSetterGetter(slot0, "index", nil)
	slot0:setIsClickZoom(false)
	DisplayUtil.setVisible(slot0.spSelected, false)
	slot0.model.selectedVerifyDicsChangedSignal:add(slot0.onSelectedChanged, slot0)
end

LoginGuestVerifyCharCcsPane.onClick = function (slot0)
	slot0.controller:clickVerifyChar(slot0._index)
end

LoginGuestVerifyCharCcsPane.onSelectedChanged = function (slot0)
	TweenLite.to(slot0.spSelected, 0.1, {
		autoAlpha = (slot0._index ~= nil and slot0.model:getSelectedVerifyDics() ~= nil and slot0.model.getSelectedVerifyDics()[slot0._index] ~= nil and 1) or 0
	})
end

LoginGuestVerifyCharCcsPane.destroy = function (slot0)
	slot0.model.selectedVerifyDicsChangedSignal:remove(slot0.onSelectedChanged, slot0)
	TweenLite.killTweensOf(slot0.spSelected)
	ZoomCcsBtn.destroy(slot0)
end

return
