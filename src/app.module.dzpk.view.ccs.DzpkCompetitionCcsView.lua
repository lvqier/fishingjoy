slot2 = "DzpkCompetitionCcsView"
DzpkCompetitionCcsView = class(slot1)

DzpkCompetitionCcsView.onCreationComplete = function (slot0)
	slot4 = TickBase

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0.option.btnTip.bg
	slot0.bg_h = slot0.option.btnTip.bg.getContentSize(slot2).height
	slot3 = slot0.option.btnTip.tip
	slot0.tip_W = slot0.option.btnTip.tip.getContentSize(slot2).width
	slot3 = slot0

	slot0.init(slot2)

	slot3 = slot0

	slot0.register(slot2)
end

DzpkCompetitionCcsView.register = function (slot0)
	slot5 = slot0

	slot0.model.gameModelChangedSignal.add(slot2, slot0.model.gameModelChangedSignal, slot0.onChangeGameModel)

	slot5 = slot0

	slot0.model.updateMatchInfoChangedSignal.add(slot2, slot0.model.updateMatchInfoChangedSignal, slot0.updateBtnTip)
end

DzpkCompetitionCcsView.init = function (slot0)
	slot0.timer = {}
end

DzpkCompetitionCcsView.onShow = function (slot0)
	return
end

DzpkCompetitionCcsView.onHide = function (slot0)
	slot3 = slot0.timer

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.stop(slot7)

		slot8 = slot5

		slot5.destroy(slot7)

		slot5 = nil
	end

	slot0.timer = {}
end

DzpkCompetitionCcsView.onChangeGameModel = function (slot0)
	slot3 = slot0.model

	if slot0.model.getGameModel(slot2) == GAMEMODEL_FREE then
		slot4 = slot0

		slot0.reset(slot3)

		slot5 = false

		slot0.setVisible(slot3, slot0)
	elseif slot1 == GAMEMODEL_COMPETITION then
		slot4 = slot0

		slot0.reset(slot3)

		slot5 = true

		slot0.setVisible(slot3, slot0)
	end
end

DzpkCompetitionCcsView.start = function (slot0)
	return
end

DzpkCompetitionCcsView.updateBtnTip = function (slot0)
	slot3 = slot0.model

	if slot0.model.getUpdateMatchInfo(slot2) ~= nil then
		slot4 = slot0.model

		if slot0.model.getMatchInfo(slot3) == nil then
			return
		end
	end

	slot12 = 0
	slot5 = slot1.dwUserCount .. "/" .. slot1.dwTotalUserCount .. " 均筹: " .. MathUtil.cookNumWithHansUnits(slot10, slot1.lAverageChip)

	slot0.option.btnTip.ranTxt.setString(slot3, slot0.option.btnTip.ranTxt)

	slot4 = slot0.option.btnTip.ranTxt

	if slot0.tip_W < slot0.option.btnTip.ranTxt.getContentSize(slot3).width then
		slot5 = slot0.option.btnTip.bg
		slot9 = slot0.bg_h

		slot0.option.btnTip.bg.setContentSize(slot4, cc.size(slot7, slot2 + 40))
	end

	slot6 = false

	slot0.option.btnAdd.setVisible(slot4, slot0.option.btnAdd)

	slot6 = false

	slot0.option.btnBuy.setVisible(slot4, slot0.option.btnBuy)

	slot5 = slot0

	slot0.update(slot4)

	slot6 = slot0.model

	if slot0.model.getUpdateMatchInfo(slot4).wLevel <= slot0.model.getMatchInfo(slot0.model).wRebuyMaxLevel then
		slot6 = slot0.model

		if slot0.model.getMatchInfo(slot0.model).wRebuyMinLevel <= slot0.model.getUpdateMatchInfo(slot4).wLevel then
			slot6 = true

			slot0.option.btnBuy.setVisible(slot4, slot0.option.btnBuy)
		end
	else
		slot6 = slot0.model

		if slot0.model.getUpdateMatchInfo(slot4).wLevel <= slot0.model.getMatchInfo(slot0.model).wAddonMaxLevel then
			slot6 = slot0.model

			if slot0.model.getMatchInfo(slot0.model).wAddonMinLevel <= slot0.model.getUpdateMatchInfo(slot4).wLevel then
				slot6 = true

				slot0.option.btnAdd.setVisible(slot4, slot0.option.btnAdd)
			end
		end
	end
end

DzpkCompetitionCcsView.update = function (slot0)
	slot3 = slot0.model

	if slot0.model.getUpdateMatchInfo(slot2) == nil then
		return
	end

	slot3 = slot0.timer

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.stop(slot7)

		slot8 = slot5

		slot5.destroy(slot7)

		slot5 = nil
	end

	slot0.timer = {}
	slot3 = slot0.model

	function slot3()
		if slot0 <= 0 then
			slot3 = true

			slot1.option.btnTip.tip.setVisible(slot1, slot1.option.btnTip.tip)

			slot3 = false

			slot1.option.btnTip.timeTxt.setVisible(slot1, slot1.option.btnTip.timeTxt)
		else
			slot0 = slot0 - 1
			slot7 = 6
			slot3 = "涨盲时间: " .. DateUtil.getTimeString(slot5, slot1.option.btnTip.timeTxt.setString)

			slot1.option.btnTip.timeTxt.setString(slot1, slot1.option.btnTip.timeTxt)
		end
	end

	if slot0.model.getUpdateMatchInfo(slot2).dwGrowthTime > 0 then
		slot7 = false

		slot0.option.btnTip.tip.setVisible(slot5, slot0.option.btnTip.tip)

		slot7 = true

		slot0.option.btnTip.timeTxt.setVisible(slot5, slot0.option.btnTip.timeTxt)

		slot6 = slot0.timer
		slot12 = slot1

		table.insert(slot5, tickMgr.delayedCall(slot8, tickMgr, slot3, 1000))
	end
end

DzpkCompetitionCcsView.onBtnClick = function (slot0, slot1)
	if slot0.option.btnTip == slot1 then
		slot5 = true

		slot0.model.setShowMatchInfoModel(slot3, slot0.model)

		slot5 = true

		slot0.model.setIsShowingMatchInfo(slot3, slot0.model)
	elseif slot0.option.btnBuy == slot1 then
		slot4 = slot0.model

		if slot0.model.getMatchInfo(slot3) ~= nil then
			slot4 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot3)[1] ~= nil then
				slot5 = slot0.model

				if slot0.model.getMatchInfo(slot0.model).lInitChip < slot0.model.getMyTablePlayingUserData(slot3)[1].lScore then
					slot5 = "您的筹码很充足，不需要补充!"

					tweenMsgMgr.showGreenMsg(slot3, tweenMsgMgr)

					return
				end
			end
		end

		slot5 = 1

		slot0.model.setBuyModel(slot3, slot0.model)

		slot5 = true

		slot0.model.setIsShowingMatchBuyInfo(slot3, slot0.model)
	elseif slot0.option.btnAdd == slot1 then
		slot5 = 2

		slot0.model.setBuyModel(slot3, slot0.model)

		slot5 = true

		slot0.model.setIsShowingMatchBuyInfo(slot3, slot0.model)
	end
end

DzpkCompetitionCcsView.reset = function (slot0)
	slot4 = ""

	slot0.option.btnTip.ranTxt.setString(slot2, slot0.option.btnTip.ranTxt)

	slot4 = ""

	slot0.option.btnTip.timeTxt.setString(slot2, slot0.option.btnTip.timeTxt)

	slot4 = false

	slot0.option.btnTip.tip.setVisible(slot2, slot0.option.btnTip.tip)

	slot4 = false

	slot0.option.btnAdd.setVisible(slot2, slot0.option.btnAdd)

	slot4 = false

	slot0.option.btnBuy.setVisible(slot2, slot0.option.btnBuy)

	slot3 = slot0.timer

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.stop(slot7)

		slot8 = slot5

		slot5.destroy(slot7)

		slot5 = nil
	end

	slot0.timer = {}
end

DzpkCompetitionCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.gameModelChangedSignal.remove(slot2, slot0.model.gameModelChangedSignal, slot0.onChangeGameModel)

	slot5 = slot0

	slot0.model.updateMatchInfoChangedSignal.remove(slot2, slot0.model.updateMatchInfoChangedSignal, slot0.updateBtnTip)

	slot3 = slot0

	slot0.reset(slot2)
end

return
