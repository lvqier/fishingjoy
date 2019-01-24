slot2 = "MonthCardPayCcsView"
MonthCardPayCcsView = class(slot1)

MonthCardPayCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)
end

MonthCardPayCcsView.onZoomShowTweenComplete = function (slot0)
	slot3 = slot0

	ZoomPopUpChildView.onZoomShowTweenComplete(slot2)
end

MonthCardPayCcsView.hide = function (slot0, slot1, slot2)
	slot7 = slot2

	ZoomPopUpChildView.hide(slot4, slot0, slot1)
end

MonthCardPayCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot6 = false

		slot0.model.setIsShowingMonthCardPay(slot4, slot0.model)
	elseif slot1 == slot0.view.layerContent.btnWechat then
	elseif slot1 == slot0.view.layerContent.btnALi then
	elseif slot1 == slot0.view.layerContent.btnQQ then
	elseif slot1 == slot0.view.layerContent.btnUnion then
	elseif slot1 == slot0.view.layerContent.btnJd then
	elseif slot1 == slot0.view.layerContent.btnApple then
	end
end

MonthCardPayCcsView.destroy = function (slot0)
	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.layerContent.btnWechat

	destroySomeObj(slot2)

	slot3 = slot0.view.layerContent.btnALi

	destroySomeObj(slot2)

	slot3 = slot0.view.layerContent.btnQQ

	destroySomeObj(slot2)

	slot3 = slot0.view.layerContent.btnUnion

	destroySomeObj(slot2)

	slot3 = slot0.view.layerContent.btnJd

	destroySomeObj(slot2)

	slot3 = slot0.view.layerContent.btnApple

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
