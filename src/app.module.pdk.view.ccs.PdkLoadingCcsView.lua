slot2 = "PdkLoadingCcsView"
PdkLoadingCcsView = class(slot1)

PdkLoadingCcsView.onCreationComplete = function (slot0)
	slot4 = BaseGameLoadingCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseGameLoadingCcsView.onCreationComplete(slot2)
end

PdkLoadingCcsView.onShow = function (slot0)
	slot3 = slot0

	BaseGameLoadingCcsView.onShow(slot2)

	if not slot0._spineFigure then
		slot4 = "pdkqidong"
		slot0._spineFigure = slot0.controller.createSpine(slot2, slot0.controller)
		slot3 = slot0._spineFigure

		slot0._spineFigure.retain(slot2)

		slot6 = false

		slot0._spineFigure.setAnimation(slot2, slot0._spineFigure, 0, "animation")

		slot6 = true

		slot0._spineFigure.addAnimation(slot2, slot0._spineFigure, 0, "idle")

		slot5 = true

		DisplayUtil.setAddOrRemoveChild(slot2, slot0._spineFigure, slot0.layerFigure)
	end

	if slot0._spineLogo then
		slot6 = true

		slot0._spineLogo.setAnimation(slot2, slot0._spineLogo, 0, "animation")
	end
end

return
