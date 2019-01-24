slot2 = "NoticeContentPopupView"
NoticeContentPopupView = class(slot1)

NoticeContentPopupView.ctor = function (slot0)
	slot6 = "csb/common/PopupNoticeContent.csb"

	ClassUtil.extends(slot2, slot0, AbstractZoomPopupView, true)

	slot13 = slot0.onNoticeVoChanged

	createSetterGetter(slot2, slot0, "noticeVo", nil, nil, nil, nil, handler(slot11, slot0))

	slot5 = nil

	createSetterGetter(slot2, slot0, "onConfirmCallback")

	slot0._contentTf = slot0._rootView.view.nodeContent.content_tfs
	slot4 = false

	slot0._rootView.setTouchEnabled(slot2, slot0._rootView)
	slot0._contentTf.setVAlign(slot2, slot0._contentTf)

	slot5 = slot0._rootView.view.nodeContent
	slot0._contentPos = DisplayUtil.ccpCopy(slot0._rootView.view.nodeContent.getPosition(TextField.V_BOTTOM))
end

NoticeContentPopupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnConfirm then
		slot5 = slot0

		slot0.hide(slot4)

		if slot0._onConfirmCallback then
			slot0._onConfirmCallback()

			slot0._onConfirmCallback = nil
		end
	elseif slot1 == slot0._rootView.view.btnClose then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

NoticeContentPopupView.cookContentTxt = function (slot0, slot1)
	slot4 = slot1
	slot1 = string.trim(slot3)

	if IS_GUAN_VERIFY then
		slot6 = "<font color = '#ac855a'><a "
		slot1 = string.gsub(slot3, slot1, "<a ")
	else
		slot6 = "<font color = '#5fc8ff'><a "
		slot1 = string.gsub(slot3, slot1, "<a ")
	end

	slot6 = "</a></font>(点击联系我)"

	return string.gsub(slot3, slot1, "</a>")
end

NoticeContentPopupView.onNoticeVoChanged = function (slot0)
	slot5 = slot0._noticeVo.szTrumpetContent
	slot2 = slot0.cookContentTxt(slot3, slot0)
	slot0._noticeVo.szTrumpetContent = slot2
	slot4 = slot0._noticeVo.szTrumpetContent

	slot0._contentTf.setHtmlText(slot2, slot0._contentTf)

	slot2 = slot0._contentTf.getHeight(slot0._contentTf)
	slot9 = slot0._contentTf
	slot9 = (slot0._contentPos.y + slot2 * 0.5) - (slot2 - math.min(slot1, slot0._contentTf.getTextHeight(slot0._contentTf)) * 0.5)

	slot0._rootView.view.nodeContent.setPosition(slot2, slot0._rootView.view.nodeContent, (slot0._contentPos.x + slot0._contentTf.getWidth(slot2) * 0.5) - math.min(slot0._contentTf, slot0._contentTf.getTextWidth(slot7)) * 0.5)
end

NoticeContentPopupView.onShowBegin = function (slot0)
	return
end

NoticeContentPopupView.onHideBegin = function (slot0)
	return
end

return
