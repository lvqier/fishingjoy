slot2 = "SlwhOnlineCcsView"
SlwhOnlineCcsView = class(slot1)

SlwhOnlineCcsView.onCreationComplete = function (slot0)
	slot4 = BaseOnlineCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseOnlineCcsView.onCreationComplete(slot2)

	slot3 = slot0

	slot0.initRule(slot2)
end

SlwhOnlineCcsView.initRule = function (slot0)
	if slot0.view.imgShadow then
		slot4 = 999

		slot0.view.imgShadow.setLocalZOrder(slot2, slot0.view.imgShadow)
	end
end

return
