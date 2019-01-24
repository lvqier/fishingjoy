slot2 = "DntgtestLoadingCcsView"
DntgtestLoadingCcsView = class(slot1)

DntgtestLoadingCcsView.onCreationComplete = function (slot0)
	slot5 = nil

	ClassUtil.extends(slot2, slot0, BaseGameLoadingCcsView)

	slot3 = slot0

	BaseGameLoadingCcsView.onCreationComplete(slot2)
end

DntgtestLoadingCcsView.checkLoadingTxt = function (slot0)
	slot3 = slot0

	BaseGameLoadingCcsView.checkLoadingTxt(slot2)

	if slot0.txtInfo and slot0.bgLoadingTxt then
		slot8 = slot0.bgLoadingTxt
		slot6 = slot0.bgLoadingTxt.getContentSize(slot7).height

		slot0.bgLoadingTxt.setContentSize(slot0.txtInfo, slot0.bgLoadingTxt, slot0.txtInfo.getContentSize(slot2).width + 50)
	end
end

return
