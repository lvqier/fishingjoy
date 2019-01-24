PlazaKFQnAListCcsItem = class("PlazaKFQnAListCcsItem")

PlazaKFQnAListCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
	slot0.layerContent.txtContent_tf:setIsWrapPrecise(true)
	slot0.model.curSelectedKfQnADataChangedSignal:add(slot0.onCurSelectedChanged, slot0)
	slot0:onCurSelectedChanged()

	slot0._itemSize = slot0:getContentSize()
	slot0._heightExtra = 0
end

PlazaKFQnAListCcsItem.onCurSelectedChanged = function (slot0)
	slot0.layerContent:setVisible(slot0._data ~= nil and slot0._data == slot0.model:getCurSelectedKfQnAData())
	slot0.layerTitle.iconDown:setVisible(not (slot0._data ~= nil and slot0._data == slot0.model.getCurSelectedKfQnAData()))
	slot0.layerTitle.iconUp:setVisible(slot0._data ~= nil and slot0._data == slot0.model.getCurSelectedKfQnAData())

	if slot0._data ~= nil and slot0._data == slot0.model.getCurSelectedKfQnAData() then
		slot0.layerContent.txtContent_tf:setHtmlText(slot0._data.content)

		slot0._heightExtra = 90 + math.max(0, slot0.layerContent.txtContent_tf:getTextHeight() - 34)

		slot0.layerContent.imgBg:setContentSize(cc.size(920, 106 + math.max(0, slot0.layerContent.txtContent_tf.getTextHeight() - 34)))
	else
		slot0._heightExtra = 0
	end
end

PlazaKFQnAListCcsItem.getEndGap = function (slot0)
	return slot0._heightExtra
end

PlazaKFQnAListCcsItem.onClick = function (slot0, slot1)
	if slot0._data ~= slot0.model:getCurSelectedKfQnAData() then
		slot0.model:setCurSelectedKfQnAData(slot0._data)
	else
		slot0.model:setCurSelectedKfQnAData(nil)
	end

	slot0.model:getUpdateKfListViewSignal():emit()
end

PlazaKFQnAListCcsItem.updateView = function (slot0)
	if slot0._data then
		slot0.layerTitle.txtTitle_tf:setHtmlText(slot0._data.title)
	end
end

PlazaKFQnAListCcsItem.destroy = function (slot0)
	slot0.model.curSelectedKfQnADataChangedSignal:remove(slot0.onCurSelectedChanged, slot0)
	slot0.layerContent.txtContent_tf:destroy()
	slot0.layerTitle.txtTitle_tf:destroy()
	CcsListViewItem.destroy(slot0)
end

return
