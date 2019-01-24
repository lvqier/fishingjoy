MonthCardCcsView = class("MonthCardCcsView")

MonthCardCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.layerMain)

	slot0._imgs = {
		"ui/common/monthcard/n555.png",
		"ui/common/monthcard/n44444.png",
		"ui/common/monthcard/n333.png",
		"ui/common/monthcard/n22222.png"
	}

	slot0.layerMain.payNode.btnPay:removeAllChildren()
	slot0.layerMain.payMoreNode.btnPayMore:removeAllChildren()

	slot0._paySpine = spPoolMgr:get("zsb_yuekamenu")
	slot0._payMoreSpine = spPoolMgr:get("zsb_yuekamenu2")

	slot0.layerMain.payNode.btnPay:addChild(slot0._paySpine)
	slot0.layerMain.payMoreNode.btnPayMore:addChild(slot0._payMoreSpine)
	slot0._paySpine:setAnimation(0, "animation", true)
	slot0._payMoreSpine:setAnimation(0, "animation", true)
	slot0._paySpine:setPosition(cc.p(152, 41))
	slot0._payMoreSpine:setPosition(cc.p(152, 41))

	slot0.layerMain.btnClose._pushZoomScale = 1.2
end

MonthCardCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
end

MonthCardCcsView.show = function (slot0, slot1, slot2)
	ZoomPopUpChildView.show(slot0, slot1, slot2)

	if not slot0._titleSpine then
		slot0._titleSpine = spPoolMgr:get("zsb_yueka")

		slot0.layerMain.layerTitle:addChild(slot0._titleSpine)
	end

	slot0._titleSpine:setAnimation(0, "start", false)
	slot0._titleSpine:addAnimation(0, "idle", true)

	if not slot0._manSpine then
		slot0._manSpine = spPoolMgr:get("zsb_yuekaddz")

		slot0.layerMain.spine_node:addChild(slot0._manSpine)
	end

	slot0._manSpine:setAnimation(0, "start", false)
	slot0._manSpine:addAnimation(0, "idle", true)
	slot0:refreshView()
end

MonthCardCcsView.refreshView = function (slot0)
	if slot0.model:getMonthCardData()[1] then
		slot0.layerMain.payNode:setVisible(slot1.IsMC ~= 1)
		slot0.layerMain.payMoreNode:setVisible(slot1.IsMC == 1)
		slot0.layerMain.payMoreNode.lasttime_tf:setHtmlText(slot0.layerMain.payMoreNode.setVisible)
		slot0.layerMain.money_tf:setHtmlText(slot0.layerMain.payMoreNode)
		slot0.layerMain.gold_tf:setHtmlText(HtmlUtil.createArtNumWithHansUnits(slot1.RewardGlod, "#plist_font_mc_gold_%s.png", 0, nil, nil, 0, -2))
	end
end

MonthCardCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
end

MonthCardCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerMain.btnClose then
		slot0.model:setIsShowingMonthCard(false)
	elseif slot1 == slot0.layerMain.payNode.btnPay then
		slot0.model:setIsShowingMonthCard(false)
		requireModule("ChargeModule")
		ProxyCharge:show(nil, nil, CHARGE_ORDER_TYPE_MONTH_CARD, slot0.model:getMonthCardData()[1].UnitPrice)
	elseif slot1 == slot0.layerMain.payMoreNode.btnPayMore then
		slot0.model:setIsShowingMonthCard(false)
		requireModule("ChargeModule")
		ProxyCharge:show(nil, nil, CHARGE_ORDER_TYPE_MONTH_CARD, slot0.model:getMonthCardData()[1].UnitPrice)
	end
end

MonthCardCcsView.destroy = function (slot0)
	destroySomeObj(slot0.layerMain.btnClose)
	destroySomeObj(slot0.layerMain.payNode.btnPay)
	destroySomeObj(slot0.layerMain.payMoreNode.btnPayMore)

	if slot0._titleSpine then
		spPoolMgr:put(slot0._titleSpine)

		slot0._titleSpine = nil
	end

	if slot0._manSpine then
		spPoolMgr:put(slot0._manSpine)

		slot0._manSpine = nil
	end

	if slot0._paySpine then
		spPoolMgr:put(slot0._paySpine)

		slot0._paySpine = nil
	end

	if slot0._payMoreSpine then
		spPoolMgr:put(slot0._payMoreSpine)

		slot0._payMoreSpine = nil
	end

	ZoomPopUpChildView.destroy(slot0)
end

return
