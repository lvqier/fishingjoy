slot2 = "ChargeWaitPayCcsView"
ChargeWaitPayCcsView = class(slot1)

ChargeWaitPayCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)
end

ChargeWaitPayCcsView.startTick = function (slot0)
	slot4 = true

	slot0.view.txt_time.setVisible(slot2, slot0.view.txt_time)

	if not slot0._tick then
		slot7 = slot0.tick
		slot6 = 1830
		slot0._tick = tickMgr.delayedCall(slot2, tickMgr, handler(slot5, slot0), 1000)
		slot3 = slot0

		slot0.tick(slot2)
	end
end

ChargeWaitPayCcsView.stopTick = function (slot0)
	if slot0._tick then
		slot3 = slot0._tick

		slot0._tick.destroy(slot2)

		slot0._tick = nil
	end
end

ChargeWaitPayCcsView.tick = function (slot0)
	slot4 = tickMgr

	if slot0._doTime - tickMgr.getTime(slot3) > 0 then
		slot5 = true

		slot0.view.txt_time.setVisible(slot3, slot0.view.txt_time)

		slot5 = slot1
		slot6 = slot1
		slot7 = slot2 .. ":" .. os.date("%M", "%S")

		slot0.view.txt_time.setString("%S", slot0.view.txt_time)
	else
		slot5 = "00:00"

		slot0.view.txt_time.setString(slot3, slot0.view.txt_time)

		slot5 = false

		slot0.view.txt_time.setVisible(slot3, slot0.view.txt_time)

		slot4 = slot0

		slot0.stopTick(slot3)
	end
end

ChargeWaitPayCcsView.onShow = function (slot0)
	slot3 = slot0.model

	if slot0.model.getWaitPayInfoData(slot2) then
		slot4 = slot1

		if next(slot3) == nil then
			return
		end
	end

	slot5 = false

	slot0.view.txt_time.setVisible(slot3, slot0.view.txt_time)

	slot0._doTime = slot1.TimeStamp + 1800
	slot4 = slot0

	slot0.startTick(slot3)

	slot5 = slot1.TransUserName

	slot0.view.txt_my_zzr_v.setString(slot3, slot0.view.txt_my_zzr_v)

	if slot1.TransType == CHARGE_BANK_CARD_TRANSFER_BNAK then
		slot5 = "银行卡"

		slot0.view.txt_my_zzfs_v.setString(slot3, slot0.view.txt_my_zzfs_v)

		slot5 = "转账银行："

		slot0.view.txt_my_zh.setString(slot3, slot0.view.txt_my_zh)
	elseif slot1.TransType == CHARGE_BANK_CARD_TRANSFER_ALI then
		slot5 = "支付宝"

		slot0.view.txt_my_zzfs_v.setString(slot3, slot0.view.txt_my_zzfs_v)

		slot5 = "转账账号："

		slot0.view.txt_my_zh.setString(slot3, slot0.view.txt_my_zh)
	elseif slot1.TransType == CHARGE_BANK_CARD_TRANSFER_WECHAT then
		slot5 = "微信"

		slot0.view.txt_my_zzfs_v.setString(slot3, slot0.view.txt_my_zzfs_v)

		slot5 = "转账账号："

		slot0.view.txt_my_zh.setString(slot3, slot0.view.txt_my_zh)
	end

	if slot1.TransOrderAmount then
		slot5 = slot1.TransOrderAmount

		slot0.view.txt_my_je_v.setString(slot3, slot0.view.txt_my_je_v)
	else
		slot5 = slot1.OrderAmount

		slot0.view.txt_my_je_v.setString(slot3, slot0.view.txt_my_je_v)
	end

	slot5 = slot1.TransBankName

	slot0.view.txt_my_zh_v.setString(slot3, slot0.view.txt_my_zh_v)

	slot5 = slot1.Payee

	slot0.view.txt_other_skr_v.setString(slot3, slot0.view.txt_other_skr_v)

	slot5 = slot1.BankName

	slot0.view.txt_other_skyh_v.setString(slot3, slot0.view.txt_other_skyh_v)

	slot5 = slot1.BankSubBranch

	slot0.view.txt_other_yhzh_v.setString(slot3, slot0.view.txt_other_yhzh_v)

	slot5 = slot1.BankNum

	slot0.view.txt_other_kh_v.setString(slot3, slot0.view.txt_other_kh_v)
end

ChargeWaitPayCcsView.onHide = function (slot0)
	slot3 = slot0

	slot0.stopTick(slot2)
end

ChargeWaitPayCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingChargeWaitPay(slot2, slot0.model)
end

ChargeWaitPayCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose or slot1 == slot0.view.btnWZDL then
		slot6 = false

		slot0.model.setIsShowingChargeWaitPay(slot4, slot0.model)
	elseif slot1 == slot0.view.btn_copyName then
		slot7 = slot0.view.txt_other_skr_v.getString(slot4)

		bridgeMgr.copy2ClipBoard(slot0.view.txt_other_skr_v, bridgeMgr)

		slot7 = "收款人姓名复制成功！"

		tweenMsgMgr.showGreenMsg(slot0.view.txt_other_skr_v, tweenMsgMgr)
	elseif slot1 == slot0.view.btn_copyCard then
		slot7 = slot0.view.txt_other_kh_v.getString(slot4)

		bridgeMgr.copy2ClipBoard(slot0.view.txt_other_kh_v, bridgeMgr)

		slot7 = "银行卡号复制成功！"

		tweenMsgMgr.showGreenMsg(slot0.view.txt_other_kh_v, tweenMsgMgr)
	elseif slot1 == slot0.view.btnZZYD then
		slot6 = false

		slot0.model.setIsShowingChargeWaitPay(slot4, slot0.model)

		slot6 = true

		slot0.model.setIsShowingTransferGuide(slot4, slot0.model)
	end
end

ChargeWaitPayCcsView.destroy = function (slot0)
	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.btn_copyName

	destroySomeObj(slot2)

	slot3 = slot0.view.btn_copyCard

	destroySomeObj(slot2)

	slot3 = slot0.view.btnZZYD

	destroySomeObj(slot2)

	slot3 = slot0.view.btnWZDL

	destroySomeObj(slot2)
end

return
