CcsTwoBtnTab = class("CcsTwoBtnTab")

CcsTwoBtnTab.ctor = function (slot0)
	createSetterGetter(slot0, "enable", true, false, false, false, false, handler(slot0, slot0.onEnableChanged))
	createSetterGetter(slot0, "isSelected", false, false, false, false, false, handler(slot0, slot0.onSelectedChanged))
	createSetterGetter(slot0, "tabIndex", nil)

	slot0.clickSignal = SignalAs3.new("CcsTwoBtnTab:clickSignal")

	slot0.btnNormal:getClickSignal():removeAll()
	slot0.btnSelected:getClickSignal():removeAll()
	slot0.btnNormal:getClickSignal():add(slot0.onBtnClick, slot0)
	slot0:onSelectedChanged()
end

CcsTwoBtnTab.onEnableChanged = function (slot0)
	CCSUtil.setBtnEnable(slot0.btnNormal, slot0._enable)
	CCSUtil.setBtnEnable(slot0.btnSelected, slot0._enable)
	DisplayUtil.setAllCascadeOpacityEnabled(slot0.btnNormal)
	DisplayUtil.setAllCascadeOpacityEnabled(slot0.btnSelected)
end

CcsTwoBtnTab.onSelectedChanged = function (slot0)
	slot0.btnNormal:setVisible(not slot0._isSelected)
	slot0.btnSelected:setVisible(slot0._isSelected)
end

CcsTwoBtnTab.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnNormal then
		slot0.clickSignal:emit(slot0._tabIndex)
	end
end

CcsTwoBtnTab.destroy = function (slot0)
	slot0.clickSignal:removeAll()
	slot0.btnNormal:destroy()
	slot0.btnSelected:destroy()
	slot0:removeFromParent()
end

return
