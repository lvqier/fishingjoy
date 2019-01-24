slot2 = "YszLoadingCcsView"
YszLoadingCcsView = class(slot1)

YszLoadingCcsView.onCreationComplete = function (slot0)
	slot4 = BaseGameLoadingCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseGameLoadingCcsView.onCreationComplete(slot2)
end

YszLoadingCcsView.createSpineLogo = function (slot0)
	if not slot0._spineLogo then
		slot4 = "yingsanzhang.json"
		slot5 = "yingsanzhang.atlas"
		slot7 = slot0.controller.getSpinePath(slot0.controller, slot0.controller)
		slot0._spineLogo = sp.SkeletonAnimation.create(slot0.controller, sp.SkeletonAnimation, slot0.controller.getSpinePath(slot2, slot0.controller))
		slot5 = slot0._spineLogo

		slot0._spineLogo.retain(slot0.controller)
	end
end

return
