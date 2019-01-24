PlazaSubGameGroupCcsPane = class("PlazaSubGameGroupCcsPane")

PlazaSubGameGroupCcsPane.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomCcsBtn, true, slot0, slot0)
	createSetterGetter(slot0, "groupType", nil)
end

PlazaSubGameGroupCcsPane.onClick = function (slot0)
	slot0.controller:gotoView(slot0._groupType, false)
end

return
