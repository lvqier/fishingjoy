slot2 = "PopUpNoticeDetailView"
PopUpNoticeDetailView = class(slot1)

PopUpNoticeDetailView.ctor = function (slot0)
	slot6 = "csb/common/PopUpNoticeDetail.csb"

	ClassUtil.extends(slot2, slot0, AbstractZoomPopupView, true)

	slot13 = slot0.onNoticeVoChanged

	createSetterGetter(slot2, slot0, "noticeVo", nil, nil, nil, nil, handler(slot11, slot0))

	slot0._contentTf = slot0._rootView.view.nodeContent.content_tfs
	slot4 = false

	slot0._rootView.setTouchEnabled(slot2, slot0._rootView)
	slot0._contentTf.setVAlign(slot2, slot0._contentTf)

	slot5 = slot0._rootView.view.nodeContent
	slot0._contentPos = DisplayUtil.ccpCopy(slot0._rootView.view.nodeContent.getPosition(TextField.V_BOTTOM))
end

PopUpNoticeDetailView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnConfirm or slot1 == slot0._rootView.view.btnClose then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

PopUpNoticeDetailView.onNoticeVoChanged = function (slot0)
	slot4 = slot0._noticeVo

	slot0._contentTf.setHtmlText(slot2, slot0._contentTf)

	slot2 = slot0._contentTf.getHeight(slot0._contentTf)
	slot9 = slot0._contentTf
	slot9 = (slot0._contentPos.y + slot2 * 0.5) - (slot2 - math.min(slot1, slot0._contentTf.getTextHeight(slot0._contentTf)) * 0.5)

	slot0._rootView.view.nodeContent.setPosition(slot2, slot0._rootView.view.nodeContent, (slot0._contentPos.x + slot0._contentTf.getWidth(slot2) * 0.5) - math.min(slot0._contentTf, slot0._contentTf.getTextWidth(slot7)) * 0.5)
end

PopUpNoticeDetailView.hide = function (slot0)
	slot3 = slot0

	AbstractZoomPopupView.hide(slot2)

	slot4 = POPUP_ID_NOTICE_DETAIL

	popupMgr.pop(slot2, popupMgr)
end

PopUpNoticeDetailView.onShowBegin = function (slot0)
	return
end

PopUpNoticeDetailView.onHideBegin = function (slot0)
	return
end

return
