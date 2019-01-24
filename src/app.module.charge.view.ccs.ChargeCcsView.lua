slot2 = "ChargeCcsView"
ChargeCcsView = class(slot1)

ChargeCcsView.onCreationComplete = function (slot0)
	slot0.btnBack = slot0.layWebview.btnBack
	slot5 = slot0

	slot0.model.isShowLoadingChangedSignal.add(slot2, slot0.model.isShowLoadingChangedSignal, slot0.onLoadingChanged)

	slot5 = slot0

	slot0.model.loadingCheckChangedSignal.add(slot2, slot0.model.loadingCheckChangedSignal, slot0.onLoadingChanged)

	slot5 = slot0

	slot0.model.isShowWebViewChangedSignal.add(slot2, slot0.model.isShowWebViewChangedSignal, slot0.onIsShowWebViewChanged)

	slot5 = slot0

	slot0.model.webViewConfigChangedSignal.add(slot2, slot0.model.webViewConfigChangedSignal, slot0.onWebViewConfigChanged)

	slot5 = slot0

	slot0.model.orderTypeChangedSignal.add(slot2, slot0.model.orderTypeChangedSignal, slot0.onOrderTypeChanged)

	slot3 = slot0

	slot0.onOrderTypeChanged(slot2)

	slot3 = slot0

	slot0.onLoadingChanged(slot2)

	slot3 = slot0

	slot0.onWebViewConfigChanged(slot2)

	slot3 = slot0

	slot0.onIsShowWebViewChanged(slot2)
end

ChargeCcsView.onRootViewShow = function (slot0)
	slot3 = slot0.model

	if slot0.model.getOrderType(slot2) == CHARGE_ORDER_TYPE_SCORE then
		slot4 = slot0.layerScore

		slot0.layerScore.onShow(slot3)
	else
		slot4 = slot0.layerMonthCard

		slot0.layerMonthCard.onShow(slot3)
	end

	slot5 = false

	slot0.model.setIsShowWebView(slot3, slot0.model)
end

ChargeCcsView.onOrderTypeChanged = function (slot0)
	slot5 = slot0.model.getOrderType(slot0.layerScore.setVisible) == CHARGE_ORDER_TYPE_SCORE

	slot0.layerScore.setVisible(slot0.model, slot0.layerScore)

	slot5 = slot1 == CHARGE_ORDER_TYPE_MONTH_CARD or slot1 == CHARGE_ORDER_TYPE_FIRST_PAY

	slot0.layerMonthCard.setVisible(slot0.model, slot0.layerMonthCard)
end

ChargeCcsView.onIsShowWebViewChanged = function (slot0)
	slot1 = slot0.model.getIsShowWebView(slot2)
	slot4 = uiMgr
	slot3 = slot0.layWebview or uiMgr.getTopLayerInAllScene(slot0.model).layWebview

	if slot3 == nil then
		slot6 = "支付webview层找不到"

		error(slot5)

		return
	end

	slot7 = slot1

	slot3.setVisible(slot5, slot3)

	if slot1 then
		slot7 = slot2

		DisplayUtil.switchParentTo(slot5, slot3)

		slot6 = slot3

		slot3.retain(slot5)

		slot6 = slot3

		slot3.removeFromParent(slot5)

		slot7 = slot3

		slot2.addChild(slot5, slot2)

		slot0.layWebview = nil
		slot2.layWebview = slot3
		slot7 = ZORDER_WEBVIEW

		slot3.setLocalZOrder(slot5, slot3)

		slot6 = slot3

		slot3.release(slot5)
	else
		slot7 = slot0

		DisplayUtil.switchParentTo(slot5, slot3)

		slot6 = slot3

		slot3.retain(slot5)

		slot6 = slot3

		slot3.removeFromParent(slot5)

		slot7 = slot3

		slot0.addChild(slot5, slot0)

		slot0.layWebview = slot3
		slot2.layWebview = nil
		slot6 = slot3

		slot3.release(slot5)
	end

	if slot3.chargewebview110.webview then
		slot7 = slot1

		slot3.chargewebview110.webview.setVisible(slot5, slot3.chargewebview110.webview)
	end
end

ChargeCcsView.onWebViewConfigChanged = function (slot0)
	slot1 = slot0.model.getWebViewConfig(slot2)
	slot4 = uiMgr
	slot3 = slot0.layWebview or uiMgr.getTopLayerInAllScene(slot0.model).layWebview

	if slot3 == nil then
		slot6 = "支付webview层找不到"

		error(slot5)

		return
	end

	slot4 = slot3.chargewebview110.webview

	if slot1 == nil then
		if slot4 then
			slot7 = slot4

			slot4.stopLoading(slot6)

			slot7 = slot4

			slot4.removeFromParent(slot6)

			slot3.chargewebview110.webview = nil
		end
	else
		if slot4 == nil then
			slot7 = ccexp.WebView
			slot8 = false

			ccexp.WebView.create(slot6).setScalesPageToFit(slot6, slot4)

			slot7 = ccexp.WebView.create(slot6)
			slot11 = 662

			ccexp.WebView.create(slot6).setContentSize(slot6, cc.size(slot9, 1334))

			slot9 = 331

			ccexp.WebView.create(slot6).setPosition(slot6, ccexp.WebView.create(slot6), 667)

			if isMobile and not isAndroid then
				slot8 = slot1.onShouldStartLoading

				slot4.setOnShouldStartLoading(slot6, slot4)
			end

			slot8 = slot4

			slot3.chargewebview110.addChild(slot6, slot3.chargewebview110)

			slot3.chargewebview110.webview = slot4
			slot8 = slot1.onDidFinishLoading

			slot4.setOnDidFinishLoading(slot6, slot4)

			slot8 = slot1.onDidFailLoading

			slot4.setOnDidFailLoading(slot6, slot4)
		end

		slot8 = slot1.url

		slot4.loadURL(slot6, slot4)
	end
end

ChargeCcsView.onLoadingChanged = function (slot0)
	slot1 = slot0.model.getIsShowLoading(slot2)
	slot5 = slot0.model
	slot3 = slot0.model.getCurChannelConfig(slot0.model)

	if slot0.model.getLoadingCheck(slot0.model) then
		slot4 = "正在检测支付状态..."
	else
		slot7 = slot3.Title
		slot4 = string.format(slot5, "正在启动%s支付...")
	end

	if not slot1 then
		slot7 = slot0.loading.quan

		slot0.loading.quan.stopAllActions(slot6)

		slot8 = false

		slot0.loading.setVisible(slot6, slot0.loading)

		return
	end

	slot8 = true

	slot0.loading.setVisible(slot6, slot0.loading)

	if slot2 or slot3.AppClientName ~= CHARGE_APP_NAME_ALI then
		slot8 = true

		slot0.loading.text.setVisible(slot6, slot0.loading.text)

		slot8 = false

		slot0.loading.text_tf.setVisible(slot6, slot0.loading.text_tf)

		slot8 = slot4

		slot0.loading.text.setString(slot6, slot0.loading.text)
	else
		slot8 = false

		slot0.loading.text.setVisible(slot6, slot0.loading.text)

		slot8 = true

		slot0.loading.text_tf.setVisible(slot6, slot0.loading.text_tf)

		slot10 = slot0.model.getOrderPrice(slot6)
		slot9 = string.format(slot0.model, "您要充值<font color = '#ffe57c'>%d</font>元\n在支付宝中输入<font color = '#ffe57c'>%d</font>元并确认转账\n即将打开支付宝...", slot5)

		slot0.loading.text_tf.setHtmlText(slot0.model, slot0.loading.text_tf)
	end

	slot9 = ResConfig.getAssetPath(string.format(slot8, "ui/common/pane/charge_loading_%s.png"))

	slot0.loading.icon.setTexture(string.format, slot0.loading.icon)

	slot8 = slot0.loading.quan

	slot0.loading.quan.stopAllActions(string.format)

	slot8 = slot0.loading.quan
	slot11 = cc.RepeatForever
	slot16 = -360

	slot0.loading.quan.runAction(string.format, cc.RepeatForever.create(slot3.Ico, cc.RotateBy.create(slot13, cc.RotateBy, 2)))
end

ChargeCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnBack then
		slot6 = false

		slot0.model.setIsShowWebView(slot4, slot0.model)

		slot5 = slot0.controller

		slot0.controller.onWebViewClose(slot4)
	end
end

ChargeCcsView.destroy = function (slot0)
	slot3 = slot0.layerScore

	slot0.layerScore.destroy(slot2)

	slot3 = slot0.layerMonthCard

	slot0.layerMonthCard.destroy(slot2)

	slot3 = uiMgr
	slot2 = slot0.layWebview or uiMgr.getTopLayerInAllScene(slot2).layWebview

	if slot2 and slot2.chargewebview110.webview then
		slot6 = slot3

		slot3.stopLoading(slot5)

		slot6 = slot3

		slot3.removeFromParent(slot5)

		slot2.chargewebview110.webview = nil
	end

	slot5 = slot0.btnBack

	destroySomeObj(slot4)

	slot7 = slot0

	slot0.model.isShowLoadingChangedSignal.remove(slot4, slot0.model.isShowLoadingChangedSignal, slot0.onLoadingChanged)

	slot7 = slot0

	slot0.model.loadingCheckChangedSignal.remove(slot4, slot0.model.loadingCheckChangedSignal, slot0.onLoadingChanged)

	slot7 = slot0

	slot0.model.isShowWebViewChangedSignal.remove(slot4, slot0.model.isShowWebViewChangedSignal, slot0.onIsShowWebViewChanged)

	slot7 = slot0

	slot0.model.webViewConfigChangedSignal.remove(slot4, slot0.model.webViewConfigChangedSignal, slot0.onWebViewConfigChanged)

	slot7 = slot0

	slot0.model.orderTypeChangedSignal.remove(slot4, slot0.model.orderTypeChangedSignal, slot0.onOrderTypeChanged)
end

return
