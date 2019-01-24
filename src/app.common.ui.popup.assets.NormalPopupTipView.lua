slot2 = "NormalPopupTipView"
NormalPopupTipView = class(slot1)

NormalPopupTipView.ctor = function (slot0, slot1)
	slot7 = slot1 or "csb/common/PopUpNormalTip.csb"

	ClassUtil.extends(slot3, slot0, AbstractZoomPopupView, true)

	slot5 = TickBase

	ClassUtil.extends(slot3, slot0)

	slot6 = nil

	createSetterGetter(slot3, slot0, "cancelCallback")

	slot6 = nil

	createSetterGetter(slot3, slot0, "confirmCallback")

	slot6 = nil

	createSetterGetter(slot3, slot0, "closeCallback")

	slot6 = false

	createSetterGetter(slot3, slot0, "forbidCloseEvent")

	slot14 = slot0.onCancelTxtChagned

	createSetterGetter(slot3, slot0, "cancelTxt", nil, nil, nil, nil, handler(slot12, slot0))

	slot14 = slot0.onConfirmTxtChagned

	createSetterGetter(slot3, slot0, "confirmTxt", nil, nil, nil, nil, handler(slot12, slot0))

	slot14 = slot0.onIsConfirmBtnOnlyChagned

	createSetterGetter(slot3, slot0, "isConfirmBtnOnly", nil, nil, nil, nil, handler(slot12, slot0))

	slot14 = slot0.onIsHideCloseBtn

	createSetterGetter(slot3, slot0, "isHideCloseBtn", nil, nil, nil, nil, handler(slot12, slot0))

	slot4 = uiMgr
	slot0._popupParent = uiMgr.getTopLayerInAllScene(slot3)
	slot5 = TextField.V_BOTTOM

	slot0._rootView.view.txtContent_tf.setVAlign(slot3, slot0._rootView.view.txtContent_tf)

	slot5 = true

	slot0._rootView.view.txtContent_tf.setIsAssetVCenter(slot3, slot0._rootView.view.txtContent_tf)

	slot5 = true

	slot0._rootView.view.txtContent_tf.setIsWrapPrecise(slot3, slot0._rootView.view.txtContent_tf)

	slot0._contentFunc = nil
	slot5 = slot0._rootView.view.txtContent_tf
	slot0._tfCenterX = slot0._rootView.view.txtContent_tf.getPositionX(slot3) + slot0._rootView.view.txtContent_tf.getWidth(slot0._rootView.view.txtContent_tf) * 0.5
	slot4 = slot0._rootView.view.dttsqtkbg1
	slot0._bgOldHeight = slot0._rootView.view.dttsqtkbg1.getContentSize(slot0._rootView.view.txtContent_tf.getWidth(slot0._rootView.view.txtContent_tf) * 0.5).height
	slot4 = slot0._rootView.view.txtTitle_tf
	slot0._titleOldY = slot0._rootView.view.txtTitle_tf.getPositionY(slot0._rootView.view.txtContent_tf.getWidth(slot0._rootView.view.txtContent_tf) * 0.5)
	slot4 = slot0._rootView.view.btnClose
	slot0._btnCloseOldY = slot0._rootView.view.btnClose.getPositionY(slot0._rootView.view.txtContent_tf.getWidth(slot0._rootView.view.txtContent_tf) * 0.5)
	slot4 = slot0._rootView.view.btnConfirm
	slot0._btnConfirmOldY = slot0._rootView.view.btnConfirm.getPositionY(slot0._rootView.view.txtContent_tf.getWidth(slot0._rootView.view.txtContent_tf) * 0.5)
	slot4 = slot0._rootView.view.btnCancel
	slot0._btnCancelOldY = slot0._rootView.view.btnCancel.getPositionY(slot0._rootView.view.txtContent_tf.getWidth(slot0._rootView.view.txtContent_tf) * 0.5)
	slot4 = slot0._rootView.view.txtContent_tf
	slot0._tfOldY = slot0._rootView.view.txtContent_tf.getPositionY(slot0._rootView.view.txtContent_tf.getWidth(slot0._rootView.view.txtContent_tf) * 0.5)
end

NormalPopupTipView.changeConfirmBtnTextTexture = function (slot0, slot1)
	if slot0._rootView and not slot1 then
		slot4 = "txt_queding.png"
		slot1 = ResConfig.getTxtPath(slot3)
	end
end

NormalPopupTipView.changeTitleTxt = function (slot0, slot1)
	slot5 = slot1 or ""

	slot0._rootView.view.txtTitle_tf.setHtmlText(slot3, slot0._rootView.view.txtTitle_tf)
end

NormalPopupTipView.changeContentTxtOrFunc = function (slot0, slot1)
	if slot0._rootView then
		slot4 = slot1

		if type(slot3) == "string" then
			slot7 = slot1

			slot0._rootView.view.txtContent_tf.setHtmlText(slot5, slot3)

			slot6 = slot0

			slot0.checkContentTfPosition(slot5)

			slot6 = slot0

			slot0.stopTick(slot5)
		elseif slot2 == "function" then
			slot0._contentFunc = slot1
			slot6 = 3

			slot0.startTick(slot4, slot0)

			slot5 = slot0

			slot0.tick(slot4)
		end
	end
end

NormalPopupTipView.checkContentTfPosition = function (slot0)
	slot1 = 39

	if slot0._rootView.view.txtContent_tf then
		slot6 = slot2
		slot4 = slot2:getTextWidth()

		if slot1 < slot2.getTextHeight(slot4) then
			slot6 = (slot3 - slot1) * 0.5

			if slot0._rootView.view.dttsqtkbg1 then
				slot9 = slot0._rootView.view.dttsqtkbg1
				slot14 = slot0._rootView.view.dttsqtkbg1
				slot13 = slot0._bgOldHeight + slot5

				slot0._rootView.view.dttsqtkbg1.setContentSize(slot8, cc.size(slot11, slot0._rootView.view.dttsqtkbg1.getContentSize(slot13).width))
			end

			if slot0._rootView.view.txtTitle_tf then
				slot10 = slot0._titleOldY + slot6

				slot0._rootView.view.txtTitle_tf.setPositionY(slot8, slot0._rootView.view.txtTitle_tf)
			end

			if slot0._rootView.view.btnClose then
				slot10 = slot0._btnCloseOldY + slot6

				slot0._rootView.view.btnClose.setPositionY(slot8, slot0._rootView.view.btnClose)
			end

			if slot0._rootView.view.btnConfirm then
				slot10 = slot0._btnConfirmOldY - slot6

				slot0._rootView.view.btnConfirm.setPositionY(slot8, slot0._rootView.view.btnConfirm)
			end

			if slot0._rootView.view.btnCancel then
				slot10 = slot0._btnCancelOldY - slot6

				slot0._rootView.view.btnCancel.setPositionY(slot8, slot0._rootView.view.btnCancel)
			end

			slot10 = slot0._tfOldY - slot6

			slot2.setPositionY(slot8, slot2)
		else
			if slot0._rootView.view.dttsqtkbg1 then
				slot7 = slot0._rootView.view.dttsqtkbg1
				slot12 = slot0._rootView.view.dttsqtkbg1
				slot11 = slot0._bgOldHeight

				slot0._rootView.view.dttsqtkbg1.setContentSize(slot6, cc.size(slot9, slot0._rootView.view.dttsqtkbg1.getContentSize(slot11).width))
			end

			if slot0._rootView.view.txtTitle_tf then
				slot8 = slot0._titleOldY

				slot0._rootView.view.txtTitle_tf.setPositionY(slot6, slot0._rootView.view.txtTitle_tf)
			end

			if slot0._rootView.view.btnClose then
				slot8 = slot0._btnCloseOldY

				slot0._rootView.view.btnClose.setPositionY(slot6, slot0._rootView.view.btnClose)
			end

			if slot0._rootView.view.btnConfirm then
				slot8 = slot0._btnConfirmOldY

				slot0._rootView.view.btnConfirm.setPositionY(slot6, slot0._rootView.view.btnConfirm)
			end

			if slot0._rootView.view.btnCancel then
				slot8 = slot0._btnCancelOldY

				slot0._rootView.view.btnCancel.setPositionY(slot6, slot0._rootView.view.btnCancel)
			end

			slot8 = slot0._tfOldY

			slot2.setPositionY(slot6, slot2)
		end

		slot8 = slot0._tfCenterX - slot4 * 0.5

		slot2.setPositionX(slot6, slot2)
	end
end

NormalPopupTipView.tick = function (slot0)
	if slot0._contentFunc then
		slot4 = slot0._contentFunc()

		if StringUtil.isStringValid(slot3) then
			slot6 = slot1

			slot0._rootView.view.txtContent_tf.setHtmlText(slot4, slot2)

			slot5 = slot0

			slot0.checkContentTfPosition(slot4)
		else
			slot4 = slot0

			slot0.hide(slot3)

			slot4 = slot0

			slot0.stopTick(slot3)
		end
	else
		slot3 = slot0

		slot0.stopTick(slot2)
	end
end

NormalPopupTipView.onCancelTxtChagned = function (slot0)
	if slot0._rootView then
		slot3 = slot0._cancelTxt

		if StringUtil.isStringValid(slot2) then
			slot4 = slot0._cancelTxt

			slot0._rootView.view.btnCancel.txt_tf.setHtmlText(slot2, slot0._rootView.view.btnCancel.txt_tf)
		else
			slot4 = "否"

			slot0._rootView.view.btnCancel.txt_tf.setHtmlText(slot2, slot0._rootView.view.btnCancel.txt_tf)
		end
	end
end

NormalPopupTipView.onConfirmTxtChagned = function (slot0)
	if slot0._rootView then
		slot3 = slot0._confirmTxt

		if StringUtil.isStringValid(slot2) then
			slot4 = slot0._confirmTxt

			slot0._rootView.view.btnConfirm.txt_tf.setHtmlText(slot2, slot0._rootView.view.btnConfirm.txt_tf)
		else
			slot4 = "是"

			slot0._rootView.view.btnConfirm.txt_tf.setHtmlText(slot2, slot0._rootView.view.btnConfirm.txt_tf)
		end
	end
end

NormalPopupTipView.onIsConfirmBtnOnlyChagned = function (slot0)
	if slot0._isConfirmBtnOnly then
		slot4 = false

		slot0._rootView.view.btnCancel.setVisible(slot2, slot0._rootView.view.btnCancel)

		slot4 = 0

		slot0._rootView.view.btnConfirm.setPositionX(slot2, slot0._rootView.view.btnConfirm)
	else
		slot4 = true

		slot0._rootView.view.btnCancel.setVisible(slot2, slot0._rootView.view.btnCancel)

		slot4 = -105

		slot0._rootView.view.btnConfirm.setPositionX(slot2, slot0._rootView.view.btnConfirm)

		slot4 = 105

		slot0._rootView.view.btnCancel.setPositionX(slot2, slot0._rootView.view.btnCancel)
	end
end

NormalPopupTipView.onIsHideCloseBtn = function (slot0)
	slot4 = slot0._isHideCloseBtn ~= true

	slot0._rootView.view.btnClose.setVisible(slot2, slot0._rootView.view.btnClose)
end

NormalPopupTipView.show = function (slot0, slot1, slot2)
	if not slot0._isMeShowing then
		slot0._zorder = slot1 or ZORDER_NORMAL_POPUP
		slot6 = slot2

		AbstractZoomPopupView.show(slot4, slot0)

		slot5 = slot0

		slot0.onConfirmTxtChagned(slot4)

		slot5 = slot0

		slot0.onCancelTxtChagned(slot4)
	end
end

NormalPopupTipView.hide = function (slot0)
	if slot0._isMeShowing then
		slot3 = slot0

		slot0.stopTick(slot2)

		slot3 = slot0

		AbstractZoomPopupView.hide(slot2)
	end
end

NormalPopupTipView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnConfirm then
		if slot0._confirmCallback then
			slot0._confirmCallback()

			slot0._confirmCallback = nil
		end

		slot5 = slot0

		slot0.hide(slot4)
	elseif slot1 == slot0._rootView.view.btnCancel then
		if slot0._cancelCallback then
			slot0._cancelCallback()

			slot0._cancelCallback = nil
		end

		slot5 = slot0

		slot0.hide(slot4)
	elseif slot1 == slot0._rootView.view.btnClose then
		if slot0._forbidCloseEvent == false then
			if slot0._closeCallback then
				slot0._closeCallback()

				slot0._closeCallback = nil
			elseif slot0._cancelCallback then
				slot0._cancelCallback()

				slot0._cancelCallback = nil
			end
		end

		slot5 = slot0

		slot0.hide(slot4)
	end
end

NormalPopupTipView.try2Destroy = function (slot0)
	slot4 = slot0

	if not popupMgr.isCacheNormalPopUp(slot2, popupMgr) then
		slot3 = slot0

		slot0.destroy(slot2)
	end
end

NormalPopupTipView.destroy = function (slot0)
	slot0._contentFunc = nil
	slot3 = slot0._rootView.view.btnCancel.txt_tf

	slot0._rootView.view.btnCancel.txt_tf.destroy(slot2)

	slot3 = slot0._rootView.view.btnConfirm.txt_tf

	slot0._rootView.view.btnConfirm.txt_tf.destroy(slot2)

	slot3 = slot0._rootView.view.btnCancel

	slot0._rootView.view.btnCancel.destroy(slot2)

	slot3 = slot0._rootView.view.btnConfirm

	slot0._rootView.view.btnConfirm.destroy(slot2)

	slot3 = slot0._rootView.view.txtContent_tf

	slot0._rootView.view.txtContent_tf.destroy(slot2)

	slot3 = slot0._rootView.view.txtTitle_tf

	slot0._rootView.view.txtTitle_tf.destroy(slot2)

	slot0._cancelCallback = nil
	slot0._confirmCallback = nil
	slot0._closeCallback = nil
	slot3 = slot0

	TickBase.destroy(slot2)

	slot3 = slot0

	AbstractPopupView.destroy(slot2)
end

return
