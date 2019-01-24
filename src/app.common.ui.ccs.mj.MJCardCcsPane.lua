slot2 = "MJCardCcsPane"
MJCardCcsPane = class(slot1)

MJCardCcsPane.onCreationComplete = function (slot0, slot1)
	slot10 = false
	slot14 = slot0.onDataIntChanged

	createSetterGetter(slot3, slot0, "dataInt", nil, false, false, false, handler(slot12, slot0))

	slot10 = false
	slot14 = slot0.onDataChanged

	createSetterGetter(slot3, slot0, "data", nil, false, false, false, handler(slot12, slot0))

	slot10 = false
	slot14 = slot0.onIsHuChanged

	createSetterGetter(slot3, slot0, "isHu", false, false, false, false, handler(slot12, slot0))

	slot10 = false
	slot14 = slot0.onIsGrayChanged

	createSetterGetter(slot3, slot0, "isGray", false, false, false, false, handler(slot12, slot0))

	slot6 = false

	createSetterGetter(slot3, slot0, "isForbidSelectCheck")

	slot6 = false

	createSetterGetter(slot3, slot0, "isSkipGlobalCanShowGuiSign")

	slot14 = slot0.onHintShowChanged

	createSetterGetter(slot3, slot0, "isCardHintShow", false, nil, nil, nil, handler(slot12, slot0))

	slot14 = slot0.onCanShowGuiSignChanged

	createSetterGetter(slot3, slot0, "canShowGui", true, nil, nil, nil, handler(slot12, slot0))

	slot0._smallStr = "_small"
	slot5 = false

	DisplayUtil.setVisible(slot3, slot0.imgHint)

	slot4 = slot0

	slot0.onIsHuChanged(slot3)

	slot4 = slot0

	slot0.onIsGrayChanged(slot3)
end

MJCardCcsPane.onCanShowGuiSignChanged = function (slot0)
	if slot0._data ~= nil then
		if slot0._data.isGui and slot0._canShowGui and not slot0._isSkipGlobalCanShowGuiSign then
			slot3 = battleMgr
			slot1 = battleMgr.getCanShowGuiSign(slot2)
		end
	else
		slot1 = false

		if false then
			slot1 = true
		end
	end

	slot5 = slot1

	slot0.spGui.setVisible(slot3, slot0.spGui)
end

MJCardCcsPane.onCurSeleteCardData = function (slot0)
	slot3 = battleMgr
	slot1 = battleMgr.getCurSeleteCardData(slot2)

	if not slot0._isForbidSelectCheck and slot1 and slot0._data then
		if slot1.type == slot0._data.type and slot1.value == slot0._data.value then
			slot5 = true

			slot0.setIsCardHintShow(slot3, slot0)
		else
			slot5 = false

			slot0.setIsCardHintShow(slot3, slot0)
		end
	else
		slot5 = false

		slot0.setIsCardHintShow(slot3, slot0)
	end
end

MJCardCcsPane.onHintShowChanged = function (slot0)
	slot4 = slot0.imgHint

	TweenLite.killTweensOf(slot3)

	if slot0._isCardHintShow then
		slot6 = {
			autoAlpha = 1
		}

		TweenMax.to(slot3, slot0.imgHint, 0.1)
	else
		slot6 = {
			autoAlpha = 0
		}

		TweenMax.to(slot3, slot0.imgHint, 0.1)
	end
end

MJCardCcsPane.resetInPool = function (slot0)
	slot4 = true

	slot0.setCanShowGui(slot2, slot0)

	slot4 = false

	slot0.setIsHu(slot2, slot0)

	slot4 = false

	slot0.setIsGray(slot2, slot0)

	slot4 = false

	slot0.setIsSkipGlobalCanShowGuiSign(slot2, slot0)

	slot5 = true

	slot0.setData(slot2, slot0, nil)

	slot4 = false

	slot0.spGui.setVisible(slot2, slot0.spGui)
end

MJCardCcsPane.onIsGrayChanged = function (slot0)
	if slot0.imgGray then
		slot4 = slot0._isGray

		slot0.imgGray.setVisible(slot2, slot0.imgGray)
	end
end

MJCardCcsPane.onIsHuChanged = function (slot0)
	if slot0.spHu then
		slot4 = slot0._isHu

		slot0.spHu.setVisible(slot2, slot0.spHu)
	end
end

MJCardCcsPane.onDataIntChanged = function (slot0)
	if slot0._dataInt and slot0._dataInt > 0 then
		slot5 = MJUtil.cookCardVoById(slot2)

		if not slot0.isDataSame(slot0._dataInt, slot0) then
			slot5 = slot1

			slot0.setData(slot3, slot0)
		end
	else
		slot0._dataInt = nil
		slot4 = nil

		slot0.setData(slot2, slot0)
	end
end

MJCardCcsPane.onDataChanged = function (slot0)
	if slot0._data then
		slot0._dataInt = slot0._data.type * 1000 + slot0._data.value * 100 + slot0._data.index * 10 + slot0._data.guiState
		slot6 = slot0._data.value
		slot2 = battleMgr.isGui(slot3, battleMgr, slot0._data.type)
		slot0._data.isGui = slot2
		slot4 = "plist_mj_sign_" .. slot0._data.type .. "_" .. slot0._data.value .. slot0._smallStr .. ".png"

		slot0.spSign.setSpriteFrame(slot2, slot0.spSign)

		slot5 = slot0

		battleMgr.canShowGuiSignChangedSignal.add(slot2, battleMgr.canShowGuiSignChangedSignal, slot0.onCanShowGuiSignChanged)

		slot5 = slot0

		battleMgr.curSeleteCardDataChangedSignal.add(slot2, battleMgr.curSeleteCardDataChangedSignal, slot0.onCurSeleteCardData)
	else
		slot0._dataInt = nil
		slot5 = slot0

		battleMgr.canShowGuiSignChangedSignal.remove(slot2, battleMgr.canShowGuiSignChangedSignal, slot0.onCanShowGuiSignChanged)

		slot5 = slot0

		battleMgr.curSeleteCardDataChangedSignal.remove(slot2, battleMgr.curSeleteCardDataChangedSignal, slot0.onCurSeleteCardData)
	end

	slot3 = slot0

	slot0.onIsHuChanged(slot2)

	slot3 = slot0

	slot0.onCurSeleteCardData(slot2)

	slot3 = slot0

	slot0.onCanShowGuiSignChanged(slot2)
end

MJCardCcsPane.isDataSame = function (slot0, slot1)
	if slot0._data == slot1 then
		return true
	elseif slot1 and slot0._data then
		return slot0._data.type == slot1.type and slot0._data.value == slot1.value and slot0._data.index == slot1.index and slot0._data.isGui == slot1.isGui
	else
		return false
	end
end

MJCardCcsPane.destroy = function (slot0)
	return
end

return
