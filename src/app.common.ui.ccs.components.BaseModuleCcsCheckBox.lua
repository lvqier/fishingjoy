slot2 = "BaseModuleCcsCheckBox"
BaseModuleCcsCheckBox = class(slot1)

BaseModuleCcsCheckBox.onCreationComplete = function (slot0)
	slot4 = AbstractSelectedComponent

	ClassUtil.extends(slot2, slot0)

	slot0._modelPropertySetter = nil
	slot0._modelPropertyGetter = nil
	slot0._modelPropertySignal = nil
end

BaseModuleCcsCheckBox.bindModelBoolProperty = function (slot0, slot1)
	slot4 = slot0

	slot0.unbindModelBoolProperty(slot3)

	if slot1 then
		slot0._modelPropertySignal = slot0.model[slot1 .. "ChangedSignal"]
		slot6 = slot1
		slot0._modelPropertySetter = slot0.model["set" .. StringUtil.upperFirstChar("ChangedSignal")]
		slot0._modelPropertyGetter = slot0.model["get" .. StringUtil.upperFirstChar(slot1)]

		if slot0._modelPropertySignal then
			slot8 = slot0

			slot0._modelPropertySignal.add(slot5, slot0._modelPropertySignal, slot0.onModelPropertyChanged)

			slot6 = slot0

			slot0.onModelPropertyChanged(slot5)
		end
	end
end

BaseModuleCcsCheckBox.onClick = function (slot0)
	if slot0._modelPropertyGetter then
		slot6 = slot0.model
		slot4 = not slot0._modelPropertyGetter(slot5)

		slot0._modelPropertySetter(slot2, slot0.model)
	end
end

BaseModuleCcsCheckBox.unbindModelBoolProperty = function (slot0)
	if slot0._modelPropertySignal then
		slot5 = slot0

		slot0._modelPropertySignal.remove(slot2, slot0._modelPropertySignal, slot0.onModelPropertyChanged)

		slot0._modelPropertySetter = nil
		slot0._modelPropertyGetter = nil
		slot0._modelPropertySignal = nil
	end
end

BaseModuleCcsCheckBox.onModelPropertyChanged = function (slot0)
	slot3 = slot0
	slot6 = slot0.model

	slot0.setIsSelected(slot2, slot0._modelPropertyGetter(slot5))
end

BaseModuleCcsCheckBox.onCanTouchChanged = function (slot0)
	if slot0._canTouch then
		slot3 = slot0.bgCheckBox

		ShaderUtil.resetShader(slot2)
	else
		slot4 = "GRAY"

		ShaderUtil.setShaderByName(slot2, slot0.bgCheckBox)
	end

	slot3 = slot0

	AbstractSelectedComponent.onCanTouchChanged(slot2)
end

BaseModuleCcsCheckBox.onIsSelectedChanged = function (slot0)
	slot5 = {
		autoAlpha = (slot0._isSelected and 1) or 0
	}

	TweenLite.to(slot2, slot0.bgCheckBox.spGou, 0.05)

	slot3 = slot0

	AbstractSelectedComponent.onIsSelectedChanged(slot2)
end

BaseModuleCcsCheckBox.destroy = function (slot0)
	slot3 = slot0

	slot0.unbindModelBoolProperty(slot2)

	slot3 = slot0.bgCheckBox.spGou

	TweenLite.killTweensOf(slot2)

	slot3 = slot0

	AbstractSelectedComponent.destroy(slot2)
end

return
