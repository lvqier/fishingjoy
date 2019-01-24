slot2 = "PdkGameCcsView"
PdkGameCcsView = class(slot1)

PdkGameCcsView.onCreationComplete = function (slot0)
	slot4 = BaseGameCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseGameCcsView.onCreationComplete(slot2)
end

PdkGameCcsView.onBtnClick = function (slot0, slot1, slot2)
	return
end

return
