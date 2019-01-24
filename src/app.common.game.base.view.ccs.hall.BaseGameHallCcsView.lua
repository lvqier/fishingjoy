slot2 = "BaseGameHallCcsView"
BaseGameHallCcsView = class(slot1)

BaseGameHallCcsView.onCreationComplete = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot9 = slot0.controller
	slot10 = "module/" .. slot0.controller.getModuleName(slot8) .. "/csb/" .. slot1

	slot0.layerList.list_lv.setItemResCcsFileName("/csb/", slot0.layerList.list_lv)

	if false then
		slot11 = CcsListView.SCROLL_TYPE_VARY

		slot0.layerList.list_lv.setScrollType(slot9, slot0.layerList.list_lv)
	end

	if slot2 then
		slot11 = slot2

		slot0.layerList.list_lv.setGap(slot9, slot0.layerList.list_lv)
	end

	if slot3 then
		slot11 = slot3

		slot0.layerList.list_lv.setTopMargin(slot9, slot0.layerList.list_lv)
	end

	if slot4 then
		slot11 = slot4

		slot0.layerList.list_lv.setBottomMargin(slot9, slot0.layerList.list_lv)
	end

	if slot5 then
		slot11 = slot5

		slot0.layerList.list_lv.setLeftMargin(slot9, slot0.layerList.list_lv)
	end

	if slot0.layerList and slot0.layerList.list_lv and slot0.bg then
		slot10 = slot0.layerList.list_lv
		slot12 = slot0

		slot0.layerList.list_lv.getOnPosChangedSignal(slot9).add(slot9, slot0.layerList.list_lv.getOnPosChangedSignal(slot9), slot0.onSvPosChanged)

		slot10 = slot0.bg
		slot0._bgStartY = slot0.bg.getPositionY(slot9)
		slot10 = slot0.bg
		slot0._bgMaxYOffset = slot0.bg.getContentSize(slot9).height - CONFIG_DESIGN_HEIGHT
	end
end

BaseGameHallCcsView.onSvPosChanged = function (slot0)
	slot1 = slot0.layerList.list_lv.getInnerContainer(slot2)
	slot5 = slot1
	slot5 = slot0.layerList.list_lv
	slot7 = slot0._bgMaxYOffset
	slot7 = slot0._bgStartY + MathUtil.getValueBetween(slot1, (slot1.getContentSize(slot0.layerList.list_lv).height + slot1:getPositionY()) - CONFIG_DESIGN_HEIGHT + slot0.layerList.list_lv.getTopMargin(slot1), 0)

	slot0.bg.setPositionY((slot1.getContentSize(slot0.layerList.list_lv).height + slot1.getPositionY()) - CONFIG_DESIGN_HEIGHT + slot0.layerList.list_lv.getTopMargin(slot1), slot0.bg)
end

BaseGameHallCcsView.onTableChanged = function (slot0, slot1, slot2)
	slot5 = slot0.layerList.list_lv
	slot8 = slot0.model

	slot0.layerList.list_lv.setDatas(slot4, slot0.model.getTableDatas(slot7))
end

BaseGameHallCcsView.onShow = function (slot0)
	slot5 = slot0

	slot0.model.tableDatasChangedSignal.add(slot2, slot0.model.tableDatasChangedSignal, slot0.onTableChanged)

	slot3 = slot0

	slot0.onTableChanged(slot2)

	slot6 = nil

	slot0.layerList.list_lv.jumpToPercent(slot2, slot0.layerList.list_lv, nil, 0)
end

BaseGameHallCcsView.onHide = function (slot0)
	slot5 = slot0

	slot0.model.tableDatasChangedSignal.remove(slot2, slot0.model.tableDatasChangedSignal, slot0.onTableChanged)
end

BaseGameHallCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.tableDatasChangedSignal.remove(slot2, slot0.model.tableDatasChangedSignal, slot0.onTableChanged)

	slot3 = slot0.layerList.list_lv

	slot0.layerList.list_lv.destroy(slot2)
end

return
