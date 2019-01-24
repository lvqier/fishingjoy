slot0 = class(slot1)
slot3 = "charge.model.ChargeModel"

requireLuaFromModule("ChargeModule")

slot3 = "charge.controller.ChargeController"

requireLuaFromModule("ChargeModule")

slot3 = "charge.view.ChargeView"

requireLuaFromModule("ChargeModule")

slot0.ctor = function (slot0, ...)
	slot8 = ChargeController

	ClassUtil.extends(slot2, slot0, BaseUIModule, true, ChargeModel, ChargeView)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4)
	slot7 = slot0

	slot0.initMvc(slot6)

	slot8 = slot1

	slot0.view.setTriggerTarget(slot6, slot0.view)

	slot8 = slot2

	slot0.model.setOnRechargeBankCall(slot6, slot0.model)

	slot8 = slot3 or 0

	slot0.model.setOrderType(slot6, slot0.model)

	slot8 = slot4 or 0

	slot0.model.setOrderPrice(slot6, slot0.model)

	if IS_IOS_VERIFY and not isAndroid then
		slot7 = slot0.view

		slot0.view.show(slot6)
	else
		slot6 = 0
		slot7 = nil
		slot0._isShowingModule = true

		function slot12(slot0)
			slot3 = slot0

			if type(slot2) == "string" then
				slot3 = slot0 + 1

				print(slot2)

				if slot0 + 1 >= 3 then
					function slot6()
						slot0._isShowingModule = nil
					end

					popupMgr.showAlert(slot2, popupMgr, (slot0 or "请求支付配置失败") .. ",是否重试?", function ()
						slot4 = slot0.controller

						slot0.controller.requestPayConfig(slot1, slot0.controller, slot1)
					end)
				else
					slot5 = slot1.controller

					slot1.controller.requestPayConfig(slot2, slot1.controller, slot2)
				end
			else
				slot3 = slot0

				if type(slot2) == "table" and slot0.disabled then
					slot1._isShowingModule = nil
					slot4 = slot0.tipmsg

					tweenMsgMgr.showRedMsg(nil, tweenMsgMgr)
				end
			end
		end

		slot0.controller.requestPayConfig(slot9, slot0.controller, function ()
			slot0._isShowingModule = nil
			slot0 = nil

			if nil == CHARGE_ORDER_TYPE_SCORE then
				slot3 = slot0.controller
				slot0 = slot0.controller.getPayOpenList(slot2)
			else
				slot4 = {
					CHARGE_PAY_TYPE_NAME_APPLE
				}
				slot0 = slot0.controller.getPayOpenList(slot2, slot0.controller)
			end

			slot1 = true
			slot4 = slot0

			for slot5, slot6 in ipairs(slot3) do
				if slot6 then
					slot1 = false

					break
				end
			end

			if slot1 then
				if slot1 == CHARGE_ORDER_TYPE_MONTH_CARD then
					slot5 = "抱歉，月卡充值功能暂时维护，敬请期待！"

					popupMgr.showAlert(slot3, popupMgr)
				elseif slot1 == CHARGE_ORDER_TYPE_FIRST_PAY then
					slot5 = "抱歉，首充充值功能暂时维护，敬请期待！"

					popupMgr.showAlert(slot3, popupMgr)
				else
					slot4 = ProxyPlaza

					ProxyPlaza.getoRank(slot3)
				end
			else
				slot4 = slot0.view

				slot0.view.show(slot3)
			end
		end)
	end
end

ProxyCharge = slot0.new()

return ProxyCharge
