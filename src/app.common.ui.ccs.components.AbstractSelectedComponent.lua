slot2 = "AbstractSelectedComponent"
AbstractSelectedComponent = class(slot1)

AbstractSelectedComponent.ctor = function (slot0)
	slot6 = slot0

	ClassUtil.extends(slot2, slot0, ZoomCcsBtn, true)

	slot13 = slot0.onIsSelectedChanged

	createSetterGetter(slot2, slot0, "isSelected", false, false, nil, nil, handler(slot11, slot0))

	slot14 = slot0.onKeyChanged

	createSetterGetter(slot2, slot0, "key", nil, false, nil, nil, nil, handler(slot0, slot0))

	slot3 = "#f55334"
	slot0._colorSelected = DisplayUtil.rgb2ccc3(slot2)
	slot3 = "#8e6c59"
	slot0._colorNormal = DisplayUtil.rgb2ccc3(slot2)
	slot3 = "#7F7F7F"
	slot0._colorDisable = DisplayUtil.rgb2ccc3(slot2)
	slot4 = false

	slot0.setIsClickZoom(slot2, slot0)

	slot3 = slot0

	slot0.onIsSelectedChanged(slot2)
end

AbstractSelectedComponent.onCanTouchChanged = function (slot0)
	slot3 = slot0

	slot0.updateTxtColor(slot2)
end

AbstractSelectedComponent.onKeyChanged = function (slot0)
	return
end

AbstractSelectedComponent.updateTxtColor = function (slot0)
	if slot0.txt then
		if not slot0._canTouch then
			slot4 = slot0._colorDisable

			slot0.txt.setTextColor(slot2, slot0.txt)
		elseif slot0._isSelected then
			slot4 = slot0._colorSelected

			slot0.txt.setTextColor(slot2, slot0.txt)
		else
			slot4 = slot0._colorNormal

			slot0.txt.setTextColor(slot2, slot0.txt)
		end
	end
end

AbstractSelectedComponent.onIsSelectedChanged = function (slot0)
	slot3 = slot0

	slot0.updateTxtColor(slot2)
end

AbstractSelectedComponent.destroy = function (slot0)
	slot3 = slot0

	ZoomCcsBtn.destroy(slot2)
end

return
