slot2 = "FishingJoyLoadingCcsView"
slot0 = class(slot1)

slot0.onCreationComplete = function (slot0)
	slot5 = nil

	ClassUtil.extends(slot2, slot0, BaseGameLoadingCcsView)

	slot3 = slot0

	BaseGameLoadingCcsView.onCreationComplete(slot2)
end

slot0.onShow = function (slot0)
	if slot0.loadingSpine == nil then
		slot6 = slot1 .. ".atlas"
		slot0.loadingSpine = sp.SkeletonAnimation.create(slot3, sp.SkeletonAnimation, slot1 .. ".json")
		slot5 = slot0.loadingSpine

		slot0.spineNd.addChild(slot3, slot0.spineNd)

		slot6 = 0

		slot0.loadingSpine.setPosition(slot3, slot0.loadingSpine, 0)

		slot7 = false

		slot0.loadingSpine.setAnimation(slot3, slot0.loadingSpine, 0, "start")

		slot7 = true

		slot0.loadingSpine.addAnimation(slot3, slot0.loadingSpine, 0, "idle")
	else
		slot4 = true

		slot0.loadingSpine.setVisible(slot2, slot0.loadingSpine)

		slot6 = false

		slot0.loadingSpine.setAnimation(slot2, slot0.loadingSpine, 0, "start")

		slot6 = true

		slot0.loadingSpine.addAnimation(slot2, slot0.loadingSpine, 0, "idle")
	end
end

slot0.checkLoadingTxt = function (slot0)
	slot3 = slot0

	BaseGameLoadingCcsView.checkLoadingTxt(slot2)

	if slot0.txtInfo and slot0.bgLoadingTxt then
		slot7 = slot0.bgLoadingTxt
		slot5 = slot0.bgLoadingTxt.getContentSize(slot0.txtInfo).height

		slot0.bgLoadingTxt.setContentSize(slot2, slot0.bgLoadingTxt, slot0.txtInfo.getContentSize(slot5).width + 50)
	end
end

return slot0
