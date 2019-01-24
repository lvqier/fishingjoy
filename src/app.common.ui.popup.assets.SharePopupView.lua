slot2 = "SharePopupView"
SharePopupView = class(slot1)

SharePopupView.ctor = function (slot0)
	slot6 = "csb/layer/PopUpShare.csb"

	ClassUtil.extends(slot2, slot0, AbstractZoomPopupView, true)

	slot0._zorder = ZORDER_LOADING_ACTIVITY + 1
	slot3 = uiMgr
	slot0._popupParent = uiMgr.getTopLayerInAllScene(slot2)
	slot9 = false
	slot13 = slot0.onShareFuncChanged

	createSetterGetter(slot2, slot0, "shareFunc", nil, false, false, false, handler(slot11, slot0))

	slot9 = false
	slot13 = slot0.onNodePositionChanged

	createSetterGetter(slot2, slot0, "nodePosition", nil, false, false, false, handler(slot11, slot0))

	slot4 = false

	slot0._rootView.btnClose.setSwallowTouches(slot2, slot0._rootView.btnClose)

	slot0._shareFuncMaxCount = 2
end

SharePopupView.onNodePositionChanged = function (slot0)
	slot0._viewLayoutX = slot0._nodePosition.x - (display.width - CONFIG_DESIGN_WIDTH) * 0.5
	slot0._viewLayoutY = slot0._nodePosition.y + (display.height - CONFIG_DESIGN_HEIGHT) * 0.5
	slot5 = slot0._rootView.view
	slot9 = slot0._viewLayoutY

	slot0._rootView.view.setPosition(slot4, cc.p(slot7, slot0._viewLayoutX))
end

SharePopupView.onShareFuncChanged = function (slot0)
	return
end

SharePopupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.btnClose then
		slot5 = slot0

		slot0.hide(slot4)
	else
		for slot6 = 1, slot0._shareFuncMaxCount, 1 do
			if slot1 == slot0._rootView.view["btnShare" .. slot6] then
				slot9 = slot0._shareFunc[slot6]

				applyFunction(slot8)

				break
			end
		end
	end
end

SharePopupView.show = function (slot0)
	slot3 = slot0

	AbstractZoomPopupView.show(slot2)
end

SharePopupView.hide = function (slot0)
	slot3 = slot0

	AbstractZoomPopupView.hide(slot2)
end

SharePopupView.destroy = function (slot0)
	slot3 = slot0._rootView.btnClose

	destroySomeObj(slot2)

	for slot4 = 1, slot0._shareFuncMaxCount, 1 do
		slot7 = slot0._rootView.view["btnShare" .. slot4]

		destroySomeObj(slot6)
	end

	slot3 = slot0

	AbstractZoomPopupView.destroy(slot2)
end

return
