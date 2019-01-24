PlazaRedPacketAwardCcsView = class("PlazaRedPacketAwardCcsView")

PlazaRedPacketAwardCcsView.ctor = function (slot0)
	ClassUtil.extends(slot0, AbstractZoomPopupView, true, "csb/layer/RedPacketReward.csb")
	createSetterGetter(slot0, "numOfHuanLeDou", nil)
	createSetterGetter(slot0, "onConfirmCallback", nil)

	slot0._isZoom2PopUp = false
	slot0._awardBgSpine = nil
end

PlazaRedPacketAwardCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnConfirm or slot1 == slot0._rootView.view.btnClose then
		slot0:hide()

		if slot0._onConfirmCallback then
			slot0._onConfirmCallback()

			slot0._onConfirmCallback = nil
		end
	end
end

PlazaRedPacketAwardCcsView.onShowBegin = function (slot0)
	audioMgr:playGameEffect("effect/GET_REWARD.mp3")

	if not slot0._awardBgSpine then
		slot0._awardBgSpine = spPoolMgr:get("tjcs_gxhd_hld")
	end

	slot2 = slot0._numOfHuanLeDou or 0

	slot0._rootView.view.layerHld.txt_tf:setHtmlText(HtmlUtil.createArtNumDotSign)
	DisplayUtil.setAddOrRemoveChild(slot0._awardBgSpine, slot0._rootView.view.layerSpine, true)
	slot0._awardBgSpine:setAnimation(0, "start", false)
	slot0._awardBgSpine:addAnimation(0, "idle", true)
	DisplayUtil.setVisible(slot0._rootView.view.layerHld, false)
	DisplayUtil.setVisible(slot0._rootView.view.btnConfirm, false)
	slot0._rootView.view.layerHld:setScale(0.5)
	TweenLite.to(slot0._rootView.view.btnConfirm, 0.5, {
		autoAlpha = 1,
		delay = 0.1
	})
	TweenLite.to(slot0._rootView.view.layerHld, 0.5, {
		autoAlpha = 1,
		scale = 1,
		ease = Back.easeOut
	})
end

PlazaRedPacketAwardCcsView.onHideBegin = function (slot0)
	slot0._onConfirmCallback = nil

	if slot0._awardBgSpine then
		spPoolMgr:put(slot0._awardBgSpine)

		slot0._awardBgSpine = nil
	end
end

return
