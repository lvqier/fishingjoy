DntgLoadingCcsView = class("DntgLoadingCcsView")

DntgLoadingCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseGameLoadingCcsView, nil)
	BaseGameLoadingCcsView.onCreationComplete(slot0)
end

DntgLoadingCcsView.checkLoadingTxt = function (slot0)
	BaseGameLoadingCcsView.checkLoadingTxt(slot0)

	if slot0.txtInfo and slot0.bgLoadingTxt then
		slot0.bgLoadingTxt:setContentSize(slot0.txtInfo:getContentSize().width + 50, slot0.bgLoadingTxt:getContentSize().height)
	end
end

return
