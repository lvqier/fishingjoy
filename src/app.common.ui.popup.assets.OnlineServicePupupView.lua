slot2 = "OnlineServicePupupView"
OnlineServicePupupView = class(slot1)

OnlineServicePupupView.ctor = function (slot0)
	slot6 = "csb/common/PopUpOnlineService.csb"

	ClassUtil.extends(slot2, slot0, AbstractZoomPopupView, true)

	slot0._isZoom2PopUp = false
	slot0._isTween2Show = false

	if isMobile then
		slot1 = ccexp.WebView.create(slot2)
		slot5 = false

		slot1.setScalesPageToFit(ccexp.WebView, slot1)

		slot4 = slot1
		slot8 = 662

		slot1.setContentSize(ccexp.WebView, cc.size(slot6, 1334))
		slot1.setPosition(ccexp.WebView, slot1, 667)

		slot5 = false

		slot1.setVisible(ccexp.WebView, slot1)

		slot4 = slot1
		slot8 = slot0.onDidFinishLoading

		slot1.setOnDidFinishLoading(ccexp.WebView, handler(331, slot0))

		slot5 = slot1

		slot0._rootView.view.layerWebview.addChild(ccexp.WebView, slot0._rootView.view.layerWebview)

		slot0._webView = slot1
	end
end

OnlineServicePupupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnBack then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

OnlineServicePupupView.onDidFinishLoading = function (slot0, slot1, slot2)
	if not isAndroid then
		slot6 = "document.getElementById('uploadFile').style.display='none'"

		slot0._webView.evaluateJS(slot4, slot0._webView)
	end
end

OnlineServicePupupView.show = function (slot0, slot1)
	if slot0._webView then
		slot5 = slot1

		trace(slot3, "打开客服webview")

		slot5 = slot1

		slot0._webView.loadURL(slot3, slot0._webView)

		slot5 = true

		slot0._webView.setVisible(slot3, slot0._webView)
	end

	slot4 = slot0

	AbstractZoomPopupView.show(slot3)
end

OnlineServicePupupView.hide = function (slot0)
	if slot0._webView then
		slot4 = false

		slot0._webView.setVisible(slot2, slot0._webView)
	end

	slot3 = slot0

	AbstractZoomPopupView.hide(slot2)
end

OnlineServicePupupView.destroy = function (slot0)
	slot3 = slot0._rootView.view.btnBack

	destroySomeObj(slot2)

	slot3 = slot0

	AbstractZoomPopupView.destroy(slot2)
end

return
