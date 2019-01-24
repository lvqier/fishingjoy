PlazaRedPacketMainCcsView = class("PlazaRedPacketMainCcsView")

PlazaRedPacketMainCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._spineErrorTime = 0.06666666666666667
end

PlazaRedPacketMainCcsView.show = function (slot0, slot1, slot2)
	ZoomPopUpChildView.show(slot0, true, slot2)
	slot0:addSignal()
end

PlazaRedPacketMainCcsView.onClickWhenCantTouchSignal = function (slot0)
	tweenMsgMgr:showWhiteMsg("您还没有获得红包，请继续游戏哟！祝您好运！", nil, 680)
end

PlazaRedPacketMainCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.show(slot0)
	slot0:addSpine()
	slot0:onRedPacketDesInfoChanged()
	slot0:onRedPacketInfoChanged()
	slot0:playAnimate()
end

PlazaRedPacketMainCcsView.addSignal = function (slot0)
	Hero.redPacketDesInfoChangedSignal:add(slot0.onRedPacketDesInfoChanged, slot0)
	slot0.model.redPacketInfoChangedSignal:add(slot0.onRedPacketInfoChanged, slot0)
	slot0.model.redPacketRewardScoreChangedSignal:add(slot0.onRedPacketRewardScoreChanged, slot0)
	slot0.view.main.btnOpen:getClickWhenCantTouchSignal():add(slot0.onClickWhenCantTouchSignal, slot0)
	slot0.view.main.btnYjlq:getClickWhenCantTouchSignal():add(slot0.onClickWhenCantTouchSignal, slot0)
end

PlazaRedPacketMainCcsView.addSpine = function (slot0)
	if not slot0._bgSpine then
		slot0._bgSpine = sp.SkeletonAnimation:create(slot1, ResConfig.getSpinePath("tjcs_hbhd_hld/tjcs_hbhd_hld.atlas"))

		slot0.view.bgSpine:addChild(slot0._bgSpine)
	end

	if not slot0._openSpine then
		slot0._openSpine = sp.SkeletonAnimation:create(slot1, slot2)

		slot0._openSpine:setPosition(60, 60)
		slot0._openSpine:setAnimation(0, "idle", true)
		slot0.view.main.btnOpen:addChild(slot0._openSpine)
	end

	slot0._bgSpine:setAnimation(0, "start", false)
	slot0._bgSpine:addAnimation(0, "idle", true)
end

PlazaRedPacketMainCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
	slot0:removeSignal()
	slot0:removeSpine()
end

PlazaRedPacketMainCcsView.playAnimate = function (slot0)
	slot0.view.main:setOpacity(0)
	slot0.view.main:setScale(0.6)
	slot0.view.startDate:setOpacity(0)
	slot0.view.endDate:setOpacity(0)
	TweenLite.killTweensOf(slot0.view.main)
	TweenLite.killTweensOf(slot0.view.startDate)
	TweenLite.killTweensOf(slot0.view.endDate)

	slot2 = TimelineLite.new()

	TimelineLite.new().insert(slot1, TweenLite.to(slot0.view.main, 0.23333333333333334, {
		autoAlpha = 1,
		delay = 0.16666666666666666 - slot0._spineErrorTime
	}))
	slot2:append(TweenLite.to(slot0.view.main, 0.23333333333333334, {
		scale = 1.05,
		delay = 0.16666666666666666 - slot0._spineErrorTime
	}))
	slot2:append(TweenLite.to(slot0.view.main, 0.3, {
		scale = 0.98
	}))
	slot2:append(TweenLite.to(slot0.view.main, 0.4, {
		scale = 1
	}))

	slot3 = TimelineLite.new()

	slot3:insert(TweenLite.to(slot0.view.startDate, 0.23333333333333334, {
		delay = 0.4,
		autoAlpha = 1
	}))
	slot3:insert(TweenLite.to(slot0.view.endDate, 0.23333333333333334, {
		delay = 0.5333333333333333,
		autoAlpha = 1
	}))

	slot0._spineErrorTime = 0
end

PlazaRedPacketMainCcsView.gotNumberTable = function (slot0, slot1)
	slot3 = {}

	for slot7 = 1, #tostring(slot1), 1 do
		table.insert(slot3, string.sub(slot2, slot7, slot7))
	end

	if table.nums(slot3) == 1 then
		table.insert(slot3, 1, 0)
	end

	return slot3
end

PlazaRedPacketMainCcsView.gotDateTable = function (slot0, slot1)
	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		table.insert(slot3, parseInt(string.split(slot8, ",")[1]))
		table.insert(slot3, parseInt(string.split(slot8, ",")[2]))
	end

	return slot3
end

PlazaRedPacketMainCcsView.onRedPacketCountChanged = function (slot0, slot1)
	slot0.view.main.packetCount2:setVisible(table.nums(slot0:gotNumberTable(slot1)) == 2)
	slot0.view.main.packetCount3:setVisible(table.nums(slot2) == 3)

	if table.nums(slot2) == 2 then
		slot0.view.main.packetCount2.num1:setSpriteFrame("redpacket_panelcount_" .. slot2[1] .. ".png")
		slot0.view.main.packetCount2.num2:setSpriteFrame("redpacket_panelcount_" .. slot2[2] .. ".png")
	elseif table.nums(slot2) == 3 then
		slot0.view.main.packetCount3.num1:setSpriteFrame("redpacket_panelcount_" .. slot2[1] .. ".png")
		slot0.view.main.packetCount3.num2:setSpriteFrame("redpacket_panelcount_" .. slot2[2] .. ".png")
		slot0.view.main.packetCount3.num3:setSpriteFrame("redpacket_panelcount_" .. slot2[3] .. ".png")
	end

	slot1 = parseInt(slot1)

	if slot0._openSpine then
		slot0._openSpine:setVisible(slot1 > 0)
	end

	slot0.view.main.btnOpen.lock:setVisible(slot1 == 0)
	slot0.view.main.btnYjlq:setCanTouch(slot1 > 0)
	slot0.view.main.btnOpen:setCanTouch(slot1 > 0)
end

PlazaRedPacketMainCcsView.onRedPacketDesInfoChanged = function (slot0)
	if Hero:getRedPacketDesInfo() and slot1.date then
		slot0.view.startDate.s1_tf:setHtmlText(HtmlUtil.createArtNum(slot0:gotDateTable(slot1.date)[1] or 0, "#redpacket_date_%d.png"))
		slot0.view.startDate.s2_tf:setHtmlText(HtmlUtil.createArtNum(slot2[2] or 0, "#redpacket_date_%d.png"))
		slot0.view.endDate.s1_tf:setHtmlText(HtmlUtil.createArtNum(slot2[3] or 0, "#redpacket_date_%d.png"))
		slot0.view.endDate.s2_tf:setHtmlText(HtmlUtil.createArtNum(slot2[4] or 0, "#redpacket_date_%d.png"))
	end
end

PlazaRedPacketMainCcsView.onRedPacketRewardScoreChanged = function (slot0)
	slot1 = slot0.model:getRedPacketRewardScore()

	slot0._openSpine:setAnimation(0, "start", false)
	slot0._openSpine:addAnimation(0, "idle", true)
	slot0.view.main.btnOpen:setTouchEnabled(false)
	tickMgr:delayedCall(function ()
		popupMgr.view.main.btnOpen:setTouchEnabled(true)
		popupMgr:showRedPacketAwardPopup(tonumber(popupMgr.showRedPacketAwardPopup))._rootView.view.coinRain:removeAllChildren()
		popupMgr:showMoneyEffect(popupMgr.showRedPacketAwardPopup(tonumber(popupMgr.showRedPacketAwardPopup))._rootView.view.coinRain)
	end, 400)
end

PlazaRedPacketMainCcsView.onRedPacketInfoChanged = function (slot0)
	if slot0.model:getRedPacketInfo() then
		slot0:onRedPacketCountChanged(slot1.Quantity)
	end
end

PlazaRedPacketMainCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.main.btnClose then
		slot0.model:setIsShowingRedPacketMain(false)
	elseif slot1 == slot0.view.main.btnHdxq then
		slot0.model:setIsShowingRedPacketHdxq(true)
	elseif slot1 == slot0.view.main.btnYjlq then
		slot0.controller:requestOpenAllRedPacket()
	elseif slot1 == slot0.view.main.btnOpen then
		slot0.controller:requestOpenOneRedPacket()
	end
end

PlazaRedPacketMainCcsView.removeSpine = function (slot0)
	if slot0._bgSpine then
		slot0._bgSpine:removeFromParent()

		slot0._bgSpine = nil
	end

	if slot0._openSpine then
		slot0._openSpine:removeFromParent()

		slot0._openSpine = nil
	end
end

PlazaRedPacketMainCcsView.removeSignal = function (slot0)
	Hero.redPacketDesInfoChangedSignal:remove(slot0.onRedPacketDesInfoChanged, slot0)
	slot0.model.redPacketInfoChangedSignal:remove(slot0.onRedPacketInfoChanged, slot0)
	slot0.model.redPacketRewardScoreChangedSignal:remove(slot0.onRedPacketRewardScoreChanged, slot0)
	slot0.view.main.btnOpen:getClickWhenCantTouchSignal():remove(slot0.onClickWhenCantTouchSignal, slot0)
	slot0.view.main.btnYjlq:getClickWhenCantTouchSignal():remove(slot0.onClickWhenCantTouchSignal, slot0)
end

PlazaRedPacketMainCcsView.destroy = function (slot0)
	slot0.view.main.btnClose:destroy(slot0)
	slot0.view.main.btnHdxq:destroy(slot0)
	slot0.view.main.btnYjlq:destroy(slot0)
	slot0.view.main.btnOpen:destroy(slot0)
	slot0:removeSpine()
	slot0:removeSignal()
	ZoomPopUpChildView.destroy(slot0)
end

return
