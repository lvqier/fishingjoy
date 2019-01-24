slot2 = "DzpkMatchBuyCcsView"
DzpkMatchBuyCcsView = class(slot1)

DzpkMatchBuyCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)
end

DzpkMatchBuyCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingMatchBuyInfo(slot2, slot0.model)
end

DzpkMatchBuyCcsView.onShow = function (slot0)
	slot3 = slot0.model
	slot2 = ""

	if slot0.model.getBuyModel(slot2) == 1 then
		slot5 = slot0.model

		if slot0.model.getMatchInfo(slot4) ~= nil then
			slot9 = "E6AE17"
			slot11 = slot0.model
			slot10 = "E6AE17"
			slot7 = slot0.model
			slot2 = string.format(slot4, "是否花费%s购买%s筹码", HtmlUtil.createColorTxt(slot0.model.getMatchInfo(slot9).wRebuyFee, slot0.model.getMatchInfo(slot0.model).wRebuyCount)) .. "\n\n允许重购的次数：" .. slot0.model.getLRemainTimes(HtmlUtil.createColorTxt(slot7, slot0.model.getMatchInfo(slot9).wRebuyFee)) .. "次"
		end
	elseif slot1 == 2 then
		slot5 = slot0.model

		if slot0.model.getMatchInfo(slot4) ~= nil then
			slot5 = slot0.model

			if slot0.model.getZengGouInfo(slot4) == nil then
				slot9 = "E6AE17"
				slot11 = slot0.model
				slot10 = "E6AE17"
				slot2 = string.format(slot4, "是否花费%s购买%s筹码", HtmlUtil.createColorTxt(slot0.model.getMatchInfo(slot9).wAddOnFee, slot0.model.getMatchInfo(slot0.model).wAddOnCount)) .. "\n\n允许增购的次数：" .. slot0.model.getMatchInfo(HtmlUtil.createColorTxt(slot7, slot0.model.getMatchInfo(slot9).wAddOnFee)).wAddonTimes .. "次"
				slot8 = slot0.model
				slot6 = slot0.model.getMatchInfo(slot0.model).wAddonTimes

				slot0.model.setLRemainTimes("\n\n允许增购的次数：", slot0.model)
			else
				slot9 = "E6AE17"
				slot11 = slot0.model
				slot10 = "E6AE17"
				slot7 = slot0.model
				slot2 = string.format(slot4, "是否花费%s购买%s筹码", HtmlUtil.createColorTxt(slot0.model.getMatchInfo(slot9).wAddOnFee, slot0.model.getMatchInfo(slot0.model).wAddOnCount)) .. "\n\n允许增购的次数：" .. slot0.model.getLRemainTimes(HtmlUtil.createColorTxt(slot7, slot0.model.getMatchInfo(slot9).wAddOnFee)) .. "次"
			end
		end
	end

	slot5 = slot0.model

	if slot0.model.getNeedToBuy(slot4) then
		slot2 = "您的筹码不足，\n" .. slot2
	end

	slot6 = slot2

	slot0.view.des_tf.setHtmlText(slot4, slot0.view.des_tf)
end

DzpkMatchBuyCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnBuy then
		slot6 = false

		slot0.model.setIsShowingMatchBuyInfo(slot4, slot0.model)

		slot5 = slot0.model

		if slot0.model.getMatchInfo(slot4) ~= nil then
			slot5 = slot0.model

			if slot0.model.getBuyModel(slot4) == 1 then
				slot5 = slot0.model

				if slot0.model.getLRemainTimes(slot4) <= 0 then
					slot6 = "您的重购次数已经用完!"

					tweenMsgMgr.showGreenMsg(slot4, tweenMsgMgr)

					return
				end

				slot8 = slot0.model
				slot6 = slot0.model.getMatchInfo(slot7).wRebuyCount

				slot0.controller.requestBuyScore(slot4, slot0.controller)
			else
				slot5 = slot0.model

				if slot0.model.getBuyModel(slot4) == 2 then
					slot5 = slot0.model

					if slot0.model.getLRemainTimes(slot4) <= 0 then
						slot6 = "您的增购次数已经用完!"

						tweenMsgMgr.showGreenMsg(slot4, tweenMsgMgr)

						return
					end

					slot8 = slot0.model
					slot6 = slot0.model.getMatchInfo(slot7).wAddOnCount

					slot0.controller.requestBuyAddScore(slot4, slot0.controller)
				end
			end
		end
	elseif slot1 == slot0.view.btnNoBuy then
		slot6 = false

		slot0.model.setIsShowingMatchBuyInfo(slot4, slot0.model)

		slot5 = slot0.model

		if slot0.model.getBuyModel(slot4) == 1 then
			slot6 = 0

			slot0.controller.requestBuyScore(slot4, slot0.controller)
		else
			slot5 = slot0.model

			if slot0.model.getBuyModel(slot4) == 2 then
				slot6 = 0

				slot0.controller.requestBuyAddScore(slot4, slot0.controller)
			end
		end
	end
end

DzpkMatchBuyCcsView.destroy = function (slot0)
	slot3 = slot0.view.btnBuy

	destroySomeObj(slot2)

	slot3 = slot0.view.btnNoBuy

	destroySomeObj(slot2)

	slot3 = slot0.view.des_tf

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
