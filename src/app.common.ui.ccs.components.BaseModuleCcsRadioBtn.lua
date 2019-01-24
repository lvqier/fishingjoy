slot2 = "BaseModuleCcsRadioBtn"
BaseModuleCcsRadioBtn = class(slot1)

BaseModuleCcsRadioBtn.onCreationComplete = function (slot0)
	slot3 = "pic_quan.png"
	slot0._radioNormal = ResConfig.getUICommonPath(slot2)
	slot3 = "pic_lvquan.png"
	slot0._radioSelected = ResConfig.getUICommonPath(slot2)
	slot4 = AbstractSelectedComponent

	ClassUtil.extends(slot2, slot0)

	slot0._modelGroupKey = nil
end

BaseModuleCcsRadioBtn.setup = function (slot0, slot1, slot2)
	slot6 = slot1

	slot0.setKey(slot4, slot0)

	slot6 = slot2

	slot0.changeGroup(slot4, slot0)
end

BaseModuleCcsRadioBtn.changeGroup = function (slot0, slot1)
	if slot0._modelGroupKey ~= slot1 then
		slot5 = slot0._modelGroupKey

		slot0.releaseGroup(slot3, slot0)

		if slot0.model[slot1 .. "ChangedSignal"] then
			slot0._modelGroupKey = slot1
			slot7 = slot0

			slot2.add(slot4, slot2, slot0.onModelGroupKeyChanged)

			slot5 = slot0

			slot0.onModelGroupKeyChanged(slot4)
		end
	end
end

BaseModuleCcsRadioBtn.onClick = function (slot0)
	if slot0._modelGroupKey and slot0._key then
		slot4 = slot0._modelGroupKey

		if slot0.model["set" .. StringUtil.upperFirstChar(slot3)] then
			slot6 = slot0._key

			slot2(slot4, slot0.model)
		end
	end
end

BaseModuleCcsRadioBtn.releaseGroup = function (slot0, slot1)
	if slot1 and slot0.model[slot1 .. "ChangedSignal"] then
		slot7 = slot0

		slot2.remove(slot4, slot2, slot0.onModelGroupKeyChanged)
	end
end

BaseModuleCcsRadioBtn.onModelGroupKeyChanged = function (slot0)
	if slot0._modelGroupKey then
		slot4 = slot0._modelGroupKey
		slot6 = slot0.model["get" .. StringUtil.upperFirstChar(slot0.setIsSelected)](slot0.setIsSelected) == slot0._key

		slot0.setIsSelected(slot0.model, slot0)
	end
end

BaseModuleCcsRadioBtn.onIsSelectedChanged = function (slot0)
	if slot0._isSelected then
		slot4 = slot0._radioSelected

		slot0.spRadio.setTexture(slot2, slot0.spRadio)
	else
		slot4 = slot0._radioNormal

		slot0.spRadio.setTexture(slot2, slot0.spRadio)
	end

	slot3 = slot0

	AbstractSelectedComponent.onIsSelectedChanged(slot2)
end

return
