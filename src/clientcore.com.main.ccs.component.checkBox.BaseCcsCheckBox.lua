BaseCcsCheckBox = class("BaseCcsCheckBox")

BaseCcsCheckBox.ctor = function (slot0)
	ClassUtil.extends(slot0, ZoomCcsBtn, true, slot0)

	slot0.parentHandler = nil

	createSetterGetter(slot0, "isSelected", false, false, nil, nil, nil, handler(slot0, slot0.onIsSelectedChanged))
end

BaseCcsCheckBox.onCreationComplete = function (slot0)
	slot0:onIsSelectedChanged()
end

BaseCcsCheckBox.onIsSelectedChanged = function (slot0)
	TweenLite.to(slot0.bgCheckBox.spGou, 0.05, {
		autoAlpha = (slot0._isSelected and 1) or 0
	})
end

BaseCcsCheckBox.bindBoolProperty = function (slot0, slot1, slot2, slot3)
	slot0:unbindBoolProperty()

	slot0._propertyGetter = slot1
	slot0._propertySetter = slot2
	slot0._propertySignal = slot3

	if slot0._propertySignal then
		slot0._propertySignal:add(slot0.onPropertyChanged, slot0)
	end

	slot0:onPropertyChanged()
end

BaseCcsCheckBox.bindBoolPropertyByName = function (slot0, slot1, slot2)
	slot0:bindBoolProperty(handler(slot1, slot1["get" .. StringUtil.upperFirstChar(slot2)]), handler(slot1, slot1["set" .. StringUtil.upperFirstChar(slot2)]), slot1[slot2 .. "ChangedSignal"])
end

BaseCcsCheckBox.onClick = function (slot0)
	if slot0._propertyGetter and slot0._propertySetter then
		slot0._propertySetter(not slot0._propertyGetter())
	else
		slot0:setIsSelected(not slot0:getIsSelected())
	end

	if slot0.parentHandler then
		slot0:parentHandler()
	end
end

BaseCcsCheckBox.unbindBoolProperty = function (slot0)
	if slot0._propertySignal then
		slot0._propertySignal:remove(slot0.onPropertyChanged, slot0)

		slot0._propertySignal = nil
	end

	slot0._propertySetter = nil
	slot0._propertyGetter = nil
end

BaseCcsCheckBox.setParetHandler = function (slot0, slot1)
	slot0.parentHandler = slot1
end

BaseCcsCheckBox.onPropertyChanged = function (slot0)
	if slot0._propertyGetter then
		slot0:setIsSelected(slot0._propertyGetter())
	end
end

return
