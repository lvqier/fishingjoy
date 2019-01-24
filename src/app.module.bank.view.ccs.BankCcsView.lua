slot2 = "BankCcsView"
BankCcsView = class(slot1)

BankCcsView.onCreationComplete = function (slot0)
	slot0._bankTitleSpine = nil
	slot4 = 208

	slot0.nodeTop.layerScore.setStrBaseWidth(slot2, slot0.nodeTop.layerScore)

	slot3 = slot0

	slot0.init(slot2)

	slot3 = slot0

	slot0.initSignal(slot2)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)
end

BankCcsView.init = function (slot0)
	slot5 = "csb/common/BankTypeListItem.csb"

	slot0.nodeLeft.list_lv.setItemResCcsFileName("bank", slot0.nodeLeft.list_lv)

	slot5 = true

	slot0.nodeLeft.list_lv.setIsScrollableOnlyInNeed("bank", slot0.nodeLeft.list_lv)

	slot5 = 12

	slot0.nodeLeft.list_lv.setGap("bank", slot0.nodeLeft.list_lv)

	slot5 = getCSVField(slot2)

	slot0.nodeLeft.list_lv.setDatas("bank", slot0.nodeLeft.list_lv)

	slot8 = ResConfig.getSpinePath("banktitle/banktitle.json")
	slot0._bankTitleSpine = sp.SkeletonAnimation.create("banktitle/banktitle.atlas", sp.SkeletonAnimation, slot2)
	slot9 = true

	slot0._bankTitleSpine.setAnimation("banktitle/banktitle.atlas", slot0._bankTitleSpine, 0, "animation")

	slot8 = 669

	slot0._bankTitleSpine.setPosition("banktitle/banktitle.atlas", slot0._bankTitleSpine, 688)

	slot7 = slot0._bankTitleSpine

	slot0.nodeTop.addChild("banktitle/banktitle.atlas", slot0.nodeTop)

	slot9 = 58

	uiMgr.adjustSlimWidth("banktitle/banktitle.atlas", uiMgr, slot0.nodeTop.btnBack, UIConfig.ALIGN_LEFT)

	slot8 = UIConfig.ALIGN_RIGHT

	uiMgr.adjustSlimWidth("banktitle/banktitle.atlas", uiMgr, slot0.nodeTop.layerScore)

	slot8 = UIConfig.ALIGN_RIGHT

	uiMgr.adjustSlimWidth("banktitle/banktitle.atlas", uiMgr, slot0.nodeTop.btnAdd)
end

BankCcsView.initSignal = function (slot0)
	slot5 = slot0

	slot0.model.curTabIndexChangedSignal.add(slot2, slot0.model.curTabIndexChangedSignal, slot0.onCurTabIndex)

	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)
end

BankCcsView.onUserScoreChanged = function (slot0)
	slot4 = slot0.nodeTop.layerScore
	slot8 = "#plist_font_yellow_2_%s.png"

	slot0.nodeTop.layerScore.setStrTxt(Hero, HtmlUtil.createArtNumDot(slot6, Hero.getUserScore(slot2)))
end

BankCcsView.onCurTabIndex = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCurTabIndex(slot2) == 3 then
		slot4 = slot0.controller

		slot0.controller.requestGetRecord(slot3)
	elseif slot1 == 2 then
		slot4 = slot0.controller

		if slot0.controller.checkYybVerify(slot3) then
			return
		end
	end

	slot2 = {
		[1.0] = true
	}

	if slot1 and slot2[slot1] then
		slot6 = true

		slot0.nodeTop.btnAdd.setVisible(slot4, slot0.nodeTop.btnAdd)
	else
		slot6 = false

		slot0.nodeTop.btnAdd.setVisible(slot4, slot0.nodeTop.btnAdd)
	end
end

BankCcsView.onRootViewShow = function (slot0)
	slot3 = slot0.controller

	slot0.controller.canceledListeners(slot2)

	slot3 = slot0.controller

	slot0.controller.registerListeners(slot2)

	slot4 = 1

	slot0.model.setCurTabIndex(slot2, slot0.model)

	slot4 = NEWBIE_TRIGGER_OPEN_BANK

	newbieMgr.checkBeginNewbieNextFrame(slot2, newbieMgr)
end

BankCcsView.onRootViewHide = function (slot0)
	slot3 = slot0.controller

	slot0.controller.canceledListeners(slot2)
end

BankCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.nodeTop.btnBack then
		slot5 = ProxyBank

		ProxyBank.hide(slot4)
	elseif slot1 == slot0.nodeTop.btnAdd then
		slot5 = "ChargeModule"

		requireModule(slot4)

		slot5 = ProxyCharge

		ProxyCharge.show(slot4)
	end
end

BankCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.curTabIndexChangedSignal.remove(slot2, slot0.model.curTabIndexChangedSignal, slot0.onCurTabIndex)

	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	if slot0._bankTitleSpine then
		slot3 = slot0._bankTitleSpine

		slot0._bankTitleSpine.removeFromParent(slot2)

		slot0._bankTitleSpine = nil
	end

	slot3 = slot0.nodeTop.btnBack

	destroySomeObj(slot2)

	slot3 = slot0.nodeTop.btnAdd

	destroySomeObj(slot2)

	slot3 = slot0.nodeLeft.list_lv

	slot0.nodeLeft.list_lv.destroy(slot2)
end

return
