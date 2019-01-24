slot2 = "ChargeGuidePopUpCcsView"
ChargeGuidePopUpCcsView = class(slot1)

ChargeGuidePopUpCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot0._tabPane = CcsTabPane.new()
	slot5 = {
		slot0.view.tab1,
		slot0.view.tab2,
		slot0.view.tab3
	}

	slot0._tabPane.pushTabs(slot0, slot0._tabPane)

	slot6 = slot0

	slot0._tabPane.tabClickSignal.add(slot0, slot0._tabPane.tabClickSignal, slot0.onTabSelected)

	slot0._yhkTabInfo = {
		count = 1,
		des = {
			"可通过 [手机银行 / ATM机 / 银行柜台] 进行转账"
		}
	}
	slot0._zfbTabInfo = {
		count = 4,
		des = {
			"第一步：登录手机支付宝，点击【转账】",
			"第二步：选择【转到银行卡】",
			"第三步：填写基本信息，并点击【下一步】",
			"第四步：填写金额，并点击【确认转账】"
		}
	}
	slot0._wxTabInfo = {
		count = 3,
		des = {
			"第一步：登录微信，右上角“+”，点击【收付款】选项",
			"第二步：选择【转账到银行卡】选项",
			"第三步：填写基本信息，并点击【下一步】"
		}
	}
	slot6 = 1
	slot10 = slot0.onCurTabIndexChanged

	createSetterGetterHandler(, slot0, "curTabIndex", handler(slot0.view, slot0))

	slot6 = 1
	slot10 = slot0.onCurWxStepChanged

	createSetterGetterHandler(, slot0, "curWxStep", handler(slot0.view, slot0))

	slot10 = slot0.onCurZfbStepChanged

	createSetterGetterHandler(, slot0, "curZfbStep", handler(slot0.view, slot0))

	slot4 = slot0.view.zfbPage
	slot8 = slot0.pageViewEvent

	slot0.view.zfbPage.addEventListener(, handler(1, slot0))

	slot4 = slot0.view.wxPage
	slot8 = slot0.pageViewEvent

	slot0.view.wxPage.addEventListener(, handler(1, slot0))

	slot6 = true

	slot0.onTabSelected(, slot0, 1)
end

ChargeGuidePopUpCcsView.onTabSelected = function (slot0, slot1, slot2)
	slot7 = slot2

	slot0.setCurTabIndex(slot4, slot0, slot1)
end

ChargeGuidePopUpCcsView.onCurTabIndexChanged = function (slot0)
	slot5 = slot0._curTabIndex

	slot0._tabPane.setSelectedTabIndex(slot3, slot0._tabPane)

	slot5 = slot0._curTabIndex == 2

	slot0.view.zfbCircle.setVisible(slot3, slot0.view.zfbCircle)

	slot5 = slot1 == 3

	slot0.view.wxCircle.setVisible(slot3, slot0.view.wxCircle)

	slot5 = slot1 == 1

	slot0.view.yhPage.setVisible(slot3, slot0.view.yhPage)

	slot5 = slot1 == 2

	slot0.view.zfbPage.setVisible(slot3, slot0.view.zfbPage)

	slot5 = slot1 == 3

	slot0.view.wxPage.setVisible(slot3, slot0.view.wxPage)

	if slot1 == 1 then
		slot0._curPageView = slot0.view.yhPage
		slot0._curTabInfo = slot0._yhkTabInfo
		slot0._curCircle = nil
	elseif slot1 == 2 then
		slot0._curPageView = slot0.view.zfbPage
		slot0._curTabInfo = slot0._zfbTabInfo
		slot0._curCircle = slot0.view.zfbCircle
	elseif slot1 == 3 then
		slot0._curPageView = slot0.view.wxPage
		slot0._curTabInfo = slot0._wxTabInfo
		slot0._curCircle = slot0.view.wxCircle
	end

	if slot0._curCircle then
		for slot5 = 1, slot0._curTabInfo.count, 1 do
			slot9 = slot5 == 1

			slot0._curCircle["c" .. slot5].l.setVisible(slot7, slot0._curCircle["c" .. slot5].l)
		end
	end

	if slot1 == 1 then
		slot5 = 1

		slot0.onCurStepChanged(slot3, slot0)
	elseif slot1 == 2 then
		slot4 = slot0

		slot0.onCurZfbStepChanged(slot3)
	elseif slot1 == 3 then
		slot4 = slot0

		slot0.onCurWxStepChanged(slot3)
	end
end

ChargeGuidePopUpCcsView.onCurWxStepChanged = function (slot0)
	slot4 = slot0._curWxStep

	slot0.onCurStepChanged(slot2, slot0)
end

ChargeGuidePopUpCcsView.onCurZfbStepChanged = function (slot0)
	slot4 = slot0._curZfbStep

	slot0.onCurStepChanged(slot2, slot0)
end

ChargeGuidePopUpCcsView.onCurStepChanged = function (slot0, slot1)
	slot5 = slot1 ~= 1

	slot0.view.btnLeft.setVisible(slot3, slot0.view.btnLeft)

	slot5 = slot1 ~= slot0._curTabInfo.count

	slot0.view.btnRight.setVisible(slot3, slot0.view.btnRight)

	if slot0._curCircle then
		for slot5 = 1, slot0._curTabInfo.count, 1 do
			slot9 = slot5 == slot1

			slot0._curCircle["c" .. slot5].l.setVisible(slot7, slot0._curCircle["c" .. slot5].l)
		end
	end

	slot5 = slot0._curTabInfo.des[slot1]

	slot0.view.tipsTxt.setString(slot3, slot0.view.tipsTxt)
end

ChargeGuidePopUpCcsView.pageViewEvent = function (slot0, slot1, slot2)
	if slot0._curTabIndex == 2 then
		slot8 = slot1
		slot7 = true

		slot0.setCurZfbStep(slot4, slot0, slot1.getCurrentPageIndex(slot7) + 1)
	elseif slot0._curTabIndex == 3 then
		slot8 = slot1
		slot7 = true

		slot0.setCurWxStep(slot4, slot0, slot1.getCurrentPageIndex(slot7) + 1)
	end
end

ChargeGuidePopUpCcsView.addCurStep = function (slot0, slot1)
	slot2 = nil

	if slot0._curTabIndex == 2 then
		slot2 = slot0._curZfbStep + slot1
	elseif slot0._curTabIndex == 3 then
		slot2 = slot0._curWxStep + slot1
	end

	if slot2 >= 1 and slot2 <= slot0._curTabInfo.count then
		slot6 = slot2 - 1

		slot0._curPageView.setCurrentPageIndex(slot4, slot0._curPageView)

		if slot0._curTabIndex == 2 then
			slot7 = true

			slot0.setCurZfbStep(slot4, slot0, slot2)
		elseif slot0._curTabIndex == 3 then
			slot7 = true

			slot0.setCurWxStep(slot4, slot0, slot2)
		end
	end
end

ChargeGuidePopUpCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.btnClose then
		slot5 = false

		slot0.model.setIsShowingTransferGuide(slot3, slot0.model)
	elseif slot1 == slot0.view.btnLeft then
		slot5 = -1

		slot0.addCurStep(slot3, slot0)
	elseif slot1 == slot0.view.btnRight then
		slot5 = 1

		slot0.addCurStep(slot3, slot0)
	end
end

ChargeGuidePopUpCcsView.destroy = function (slot0)
	slot3 = slot0.view.btnClose

	slot0.view.btnClose.destroy(slot2)

	slot3 = slot0.view.btnLeft

	slot0.view.btnLeft.destroy(slot2)

	slot3 = slot0.view.btnRight

	slot0.view.btnRight.destroy(slot2)

	slot3 = slot0._tabPane

	slot0._tabPane.destroy(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
