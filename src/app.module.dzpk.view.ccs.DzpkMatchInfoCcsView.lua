slot2 = "DzpkMatchInfoCcsView"
DzpkMatchInfoCcsView = class(slot1)

DzpkMatchInfoCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot0._tabPane = CcsTabPane.new()
	slot0.tabs = {}
	slot0.label = {
		{
			"概述",
			"赛况",
			"排名",
			"盲注",
			"奖励"
		},
		{
			"赛况",
			"排名",
			"盲注",
			"奖励"
		}
	}
	slot6 = 263.11
	slot6 = 263.11
	slot6 = 263.11
	slot6 = 263.11
	slot6 = 263.11
	slot6 = 263.11
	slot6 = 263.11
	slot6 = 263.11
	slot6 = 263.11
	slot0.pos = {
		{
			cc.p(ZoomPopUpChildView, -231.85),
			cc.p(ZoomPopUpChildView, -65.85),
			cc.p(ZoomPopUpChildView, 100.15),
			cc.p(ZoomPopUpChildView, 265),
			cc.p(ZoomPopUpChildView, 431)
		},
		{
			cc.p(ZoomPopUpChildView, -149.85),
			cc.p(ZoomPopUpChildView, 16.15),
			cc.p(ZoomPopUpChildView, 183),
			cc.p(ZoomPopUpChildView, 349)
		}
	}
	slot5 = slot0

	slot0._tabPane.tabClickSignal.add(, slot0._tabPane.tabClickSignal, slot0.onTabSelected)

	slot5 = slot0

	slot0.model.matchKuangInfoChangedSignal.add(, slot0.model.matchKuangInfoChangedSignal, slot0.updateNode2)

	slot5 = slot0

	slot0.model.selMatchStateChangedSignal.add(, slot0.model.selMatchStateChangedSignal, slot0.onMatchState)
end

DzpkMatchInfoCcsView.init = function (slot0)
	slot0.tabs = {}
	slot0.timer = {}
	slot4 = slot0._tabPane

	slot0._tabPane.popTabs(slot0.model)

	if slot0.model.getShowMatchInfoModel(slot2) then
		slot5 = slot0.view.tab1

		table.insert(slot3, slot0.tabs)

		slot5 = slot0.view.tab2

		table.insert(slot3, slot0.tabs)

		slot5 = slot0.view.tab4

		table.insert(slot3, slot0.tabs)

		slot5 = slot0.view.tab5

		table.insert(slot3, slot0.tabs)

		slot5 = false

		slot0.view.tab3.setVisible(slot3, slot0.view.tab3)

		for slot5 = 1, #slot0.tabs, 1 do
			slot9 = slot0.label[2][slot5]

			slot0.tabs[slot5].btnNormal.txt.setString(slot7, slot0.tabs[slot5].btnNormal.txt)

			slot9 = slot0.label[2][slot5]

			slot0.tabs[slot5].btnSelected.txt.setString(slot7, slot0.tabs[slot5].btnSelected.txt)

			slot9 = slot0.pos[2][slot5]

			slot0.tabs[slot5].setPosition(slot7, slot0.tabs[slot5])
		end
	else
		slot5 = true

		slot0.view.tab3.setVisible(slot3, slot0.view.tab3)

		slot5 = slot0.view.tab1

		table.insert(slot3, slot0.tabs)

		slot5 = slot0.view.tab2

		table.insert(slot3, slot0.tabs)

		slot5 = slot0.view.tab3

		table.insert(slot3, slot0.tabs)

		slot5 = slot0.view.tab4

		table.insert(slot3, slot0.tabs)

		slot5 = slot0.view.tab5

		table.insert(slot3, slot0.tabs)

		for slot5 = 1, #slot0.label[1], 1 do
			slot9 = slot0.label[1][slot5]

			slot0.view["tab" .. slot5].btnNormal.txt.setString("tab" .. slot5, slot0.view["tab" .. slot5].btnNormal.txt)

			slot9 = slot0.label[1][slot5]

			slot0.view["tab" .. slot5].btnSelected.txt.setString("tab" .. slot5, slot0.view["tab" .. slot5].btnSelected.txt)

			slot9 = slot0.pos[1][slot5]

			slot0.view["tab" .. slot5].setPosition("tab" .. slot5, slot0.view["tab" .. slot5])
		end
	end

	slot5 = slot0.tabs

	slot0._tabPane.pushTabs(slot3, slot0._tabPane)

	slot5 = "module/dzpk/csb/common/TexasHoldemMangzhuItem.csb"

	slot0.view.infoNode_4.mangzhu_lv.setItemResCcsFileName(slot3, slot0.view.infoNode_4.mangzhu_lv)

	slot5 = true

	slot0.view.infoNode_4.mangzhu_lv.setIsScrollableOnlyInNeed(slot3, slot0.view.infoNode_4.mangzhu_lv)

	slot5 = "module/dzpk/csb/common/TexasHoldemJiangliItem.csb"

	slot0.view.infoNode_5.jiangli_lv.setItemResCcsFileName(slot3, slot0.view.infoNode_5.jiangli_lv)

	slot5 = true

	slot0.view.infoNode_5.jiangli_lv.setIsScrollableOnlyInNeed(slot3, slot0.view.infoNode_5.jiangli_lv)
end

DzpkMatchInfoCcsView.onShow = function (slot0)
	slot3 = slot0

	slot0.init(slot2)

	slot4 = 1

	slot0._tabPane.setSelectedTabIndex(slot2, slot0._tabPane)

	slot4 = 1

	slot0.onTabSelected(slot2, slot0)

	slot3 = slot0.model

	if slot0.model.getSelMatchData(slot2) then
		slot5 = slot1.wMatchID

		slot0.controller.requestBlindMatchInfo(slot3, slot0.controller)

		slot5 = slot1.wMatchID

		slot0.controller.requestBonusInfo(slot3, slot0.controller)
	end

	slot4 = slot0.controller

	slot0.controller.requestMatchKuangInfo(slot3)
end

DzpkMatchInfoCcsView.onTabSelected = function (slot0, slot1)
	slot4 = slot0.model

	if slot0.model.getShowMatchInfoModel(slot3) then
		for slot6 = 1, 5, 1 do
			slot10 = slot6 == slot1 + 1

			slot0.view["infoNode_" .. slot6].setVisible(slot8, slot0.view["infoNode_" .. slot6])
		end

		if slot1 == 1 then
			slot5 = slot0

			slot0.updateNode2(slot4)
		elseif slot1 + 1 == 4 then
			slot5 = slot0

			slot0.updateNode4(slot4)
		elseif slot1 + 1 == 5 then
			slot5 = slot0

			slot0.updateNode5(slot4)
		end
	else
		for slot6 = 1, 5, 1 do
			slot10 = slot6 == slot1

			slot0.view["infoNode_" .. slot6].setVisible(slot8, slot0.view["infoNode_" .. slot6])
		end

		if slot1 == 1 then
			slot5 = slot0

			slot0.updateNode1(slot4)
		elseif slot1 == 2 then
			slot5 = slot0

			slot0.updateNode2(slot4)
		elseif slot1 == 3 then
			slot5 = slot0

			slot0.updateNode3(slot4)
		elseif slot1 == 4 then
			slot5 = slot0

			slot0.updateNode4(slot4)
		elseif slot1 == 5 then
			slot5 = slot0

			slot0.updateNode5(slot4)
		end
	end
end

DzpkMatchInfoCcsView.updateNode3 = function (slot0)
	slot4 = false

	slot0.view.infoNode_3.Node_HasData.setVisible(slot2, slot0.view.infoNode_3.Node_HasData)

	slot4 = true

	slot0.view.infoNode_3.Text_noData.setVisible(slot2, slot0.view.infoNode_3.Text_noData)

	return

	slot4 = false

	slot0.view.infoNode_3.Text_noData.setVisible(slot2, slot0.view.infoNode_3.Text_noData)

	slot4 = true

	slot0.view.infoNode_3.Node_HasData.setVisible(slot2, slot0.view.infoNode_3.Node_HasData)
end

DzpkMatchInfoCcsView.updateNode4 = function (slot0)
	slot5 = slot0.model.getBlindResponseTab(slot2)

	slot0.view.infoNode_4.mangzhu_lv.setDatas(slot0.model, slot0.view.infoNode_4.mangzhu_lv)

	slot4 = slot0.model

	if not slot0.model.getSelMatchData(slot0.model) then
		return
	end

	slot6 = slot2.szMatchName

	slot0.view.infoNode_4.Text_name.setString(slot4, slot0.view.infoNode_4.Text_name)
end

DzpkMatchInfoCcsView.updateNode5 = function (slot0)
	slot5 = slot0.model.getBonusResponseTab(slot2)

	slot0.view.infoNode_5.jiangli_lv.setDatas(slot0.model, slot0.view.infoNode_5.jiangli_lv)

	slot4 = slot0.model

	if not slot0.model.getSelMatchData(slot0.model) then
		return
	end

	slot6 = slot2.szMatchName

	slot0.view.infoNode_5.Text_name.setString(slot4, slot0.view.infoNode_5.Text_name)
end

DzpkMatchInfoCcsView.updateNode1 = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getSelMatchData(slot2) then
		return
	end

	slot6 = slot1.szMatchName

	slot0.view.infoNode_1.gaishu_scrollView.Text_name.setString(slot4, slot0.view.infoNode_1.gaishu_scrollView.Text_name)

	slot6 = slot1.lRegistrationFee .. "+" .. slot1.lServiceFee .. "(手续费)"

	slot0.view.infoNode_1.gaishu_scrollView.Text_needMoneyValue.setString(slot4, slot0.view.infoNode_1.gaishu_scrollView.Text_needMoneyValue)

	slot6 = 1
	slot7 = DateUtil.getDateString(slot4, slot1.StartTime)

	slot0.view.infoNode_1.gaishu_scrollView.Text_timeValue.setString(slot1.StartTime, slot0.view.infoNode_1.gaishu_scrollView.Text_timeValue)

	slot7 = 1
	slot8 = DateUtil.getDateString(slot1.StartTime, slot1.StartTime - slot1.dwRegistrationEndTime)

	slot0.view.infoNode_1.gaishu_scrollView.Text_enrollEndTimeValue.setString(slot1.StartTime - slot1.dwRegistrationEndTime, slot0.view.infoNode_1.gaishu_scrollView.Text_enrollEndTimeValue)

	slot8 = "" .. slot1.dwMinUserCount .. "人-" .. slot1.dwMaxUserCount .. "人"

	slot0.view.infoNode_1.gaishu_scrollView.Text_joinPersonValue.setString(slot1.StartTime - slot1.dwRegistrationEndTime, slot0.view.infoNode_1.gaishu_scrollView.Text_joinPersonValue)

	slot8 = "1000"

	slot0.view.infoNode_1.gaishu_scrollView.Text_cardNumValue.setString(slot1.StartTime - slot1.dwRegistrationEndTime, slot0.view.infoNode_1.gaishu_scrollView.Text_cardNumValue)

	slot11 = "E6AE17"
	slot12 = "E6AE17"
	slot9 = HtmlUtil.createColorTxt("" .. slot1.wAddOnMinLevel .. "-" .. slot1.wAddOnMaxLevel, slot1.wAddOnFee)
	slot13 = "E6AE17"
	slot9 = string.format(slot1.StartTime - slot1.dwRegistrationEndTime, "第%s个盲注级别可用%s兑换%s筹码", HtmlUtil.createColorTxt(slot1.dwMinUserCount, "" .. slot1.wAddOnMinLevel .. "-" .. slot1.wAddOnMaxLevel), HtmlUtil.createColorTxt(slot1.wAddOnFee, slot1.wAddOnCount))

	slot0.view.infoNode_1.gaishu_scrollView.Nodetf_all.addbuyBet_tf.setHtmlText("第%s个盲注级别可用%s兑换%s筹码", slot0.view.infoNode_1.gaishu_scrollView.Nodetf_all.addbuyBet_tf)

	slot8 = "可增购买比赛，次数：%s次"
	slot12 = "E6AE17"
	slot9 = string.format("第%s个盲注级别可用%s兑换%s筹码", HtmlUtil.createColorTxt(HtmlUtil.createColorTxt, slot1.wAddOnTimes))

	slot0.view.infoNode_1.gaishu_scrollView.Nodetf_all.addbuyTime_tf.setHtmlText("第%s个盲注级别可用%s兑换%s筹码", slot0.view.infoNode_1.gaishu_scrollView.Nodetf_all.addbuyTime_tf)

	slot12 = "E6AE17"
	slot13 = "E6AE17"
	slot14 = "E6AE17"
	slot9 = string.format("第%s个盲注级别可用%s兑换%s筹码", "第%s个盲注级别可用%s兑换%s筹码", HtmlUtil.createColorTxt(HtmlUtil.createColorTxt, "" .. slot1.wRebuyMinLevel .. "-" .. slot1.wRebuyMaxLevel), HtmlUtil.createColorTxt(slot1.wRebuyFee, slot1.wRebuyCount))

	slot0.view.infoNode_1.gaishu_scrollView.Nodetf_all.rebuyBet_tf.setHtmlText("第%s个盲注级别可用%s兑换%s筹码", slot0.view.infoNode_1.gaishu_scrollView.Nodetf_all.rebuyBet_tf)

	slot8 = "可重购买比赛，次数：%s次"
	slot12 = "E6AE17"
	slot9 = string.format("第%s个盲注级别可用%s兑换%s筹码", HtmlUtil.createColorTxt(HtmlUtil.createColorTxt("" .. slot1.wRebuyMinLevel .. "-" .. slot1.wRebuyMaxLevel, slot1.wRebuyFee), slot1.wRebuyTimes))

	slot0.view.infoNode_1.gaishu_scrollView.Nodetf_all.rebuyTime_tf.setHtmlText("第%s个盲注级别可用%s兑换%s筹码", slot0.view.infoNode_1.gaishu_scrollView.Nodetf_all.rebuyTime_tf)

	slot9 = true

	slot0.view.infoNode_1.btn_fenxian.setVisible("第%s个盲注级别可用%s兑换%s筹码", slot0.view.infoNode_1.btn_fenxian)

	slot8 = slot0

	slot0.onMatchState("第%s个盲注级别可用%s兑换%s筹码")
end

DzpkMatchInfoCcsView.onMatchState = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getSelMatchData(slot2) then
		return
	end

	slot4 = slot0.model

	if slot0.model.getSelMatchState(slot3) == 2 then
		if slot1.bJoin then
			slot6 = true

			slot0.view.infoNode_1.btn_enter.setVisible(slot4, slot0.view.infoNode_1.btn_enter)

			slot6 = false

			slot0.view.infoNode_1.btn_baoming.setVisible(slot4, slot0.view.infoNode_1.btn_baoming)

			slot6 = false

			slot0.view.infoNode_1.btn_tuisai.setVisible(slot4, slot0.view.infoNode_1.btn_tuisai)

			slot6 = false

			slot0.view.infoNode_1.btn_yijiezhi.setVisible(slot4, slot0.view.infoNode_1.btn_yijiezhi)
		else
			slot6 = false

			slot0.view.infoNode_1.btn_enter.setVisible(slot4, slot0.view.infoNode_1.btn_enter)

			slot6 = false

			slot0.view.infoNode_1.btn_baoming.setVisible(slot4, slot0.view.infoNode_1.btn_baoming)

			slot6 = false

			slot0.view.infoNode_1.btn_tuisai.setVisible(slot4, slot0.view.infoNode_1.btn_tuisai)

			slot6 = true

			slot0.view.infoNode_1.btn_yijiezhi.setVisible(slot4, slot0.view.infoNode_1.btn_yijiezhi)
		end
	else
		slot6 = false

		slot0.view.infoNode_1.btn_enter.setVisible(slot4, slot0.view.infoNode_1.btn_enter)

		slot6 = false

		slot0.view.infoNode_1.btn_yijiezhi.setVisible(slot4, slot0.view.infoNode_1.btn_yijiezhi)

		slot6 = slot2 ~= -1

		slot0.view.infoNode_1.btn_baoming.setEnabled(slot4, slot0.view.infoNode_1.btn_baoming)

		slot6 = not slot1.bJoin

		slot0.view.infoNode_1.btn_baoming.setVisible(slot4, slot0.view.infoNode_1.btn_baoming)

		slot6 = slot1.bJoin

		slot0.view.infoNode_1.btn_tuisai.setVisible(slot4, slot0.view.infoNode_1.btn_tuisai)
	end
end

DzpkMatchInfoCcsView.updateNode2 = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMatchKuangInfo(slot2) == nil then
		slot5 = false

		slot0.view.infoNode_2.Node_HasData.setVisible(slot3, slot0.view.infoNode_2.Node_HasData)

		slot5 = true

		slot0.view.infoNode_2.Text_noData.setVisible(slot3, slot0.view.infoNode_2.Text_noData)

		return
	end

	slot5 = false

	slot0.view.infoNode_2.Text_noData.setVisible(slot3, slot0.view.infoNode_2.Text_noData)

	slot5 = true

	slot0.view.infoNode_2.Node_HasData.setVisible(slot3, slot0.view.infoNode_2.Node_HasData)

	slot4 = slot0.timer

	for slot5, slot6 in ipairs(slot3) do
		slot9 = slot6

		slot6.stop(slot8)

		slot9 = slot6

		slot6.destroy(slot8)

		slot6 = nil
	end

	slot0.timer = {}

	function setf()
		if slot0 <= 0 then
			slot4 = DateUtil.getTimeString(slot1)

			slot1.view.infoNode_2.Node_HasData.timeTxt.setString(DateUtil.getTimeString, slot1.view.infoNode_2.Node_HasData.timeTxt)
		else
			slot0 = slot0 - 1
			slot4 = DateUtil.getTimeString(slot1)

			slot1.view.infoNode_2.Node_HasData.timeTxt.setString(DateUtil.getTimeString, slot1.view.infoNode_2.Node_HasData.timeTxt)
		end
	end

	if slot1.dwUpdateBlindTime > 0 then
		slot6 = slot0.timer
		slot12 = slot2

		table.insert(slot5, tickMgr.delayedCall(slot8, tickMgr, setf, 1000))

		slot8 = DateUtil.getTimeString(slot5)

		slot0.view.infoNode_2.Node_HasData.timeTxt.setString(slot3, slot0.view.infoNode_2.Node_HasData.timeTxt)
	end

	slot7 = "当前级别 " .. slot1.dwCurrentBlindLevel

	slot0.view.infoNode_2.Node_HasData.levelTxt.setString(slot5, slot0.view.infoNode_2.Node_HasData.levelTxt)

	slot7 = slot1.dwRank .. "/" .. slot1.dwTotalRank

	slot0.view.infoNode_2.Node_HasData.rankTxt.setString(slot5, slot0.view.infoNode_2.Node_HasData.rankTxt)

	slot7 = slot1.dwUserCount .. "/" .. slot1.dwTotalUserCount

	slot0.view.infoNode_2.Node_HasData.personTxt.setString(slot5, slot0.view.infoNode_2.Node_HasData.personTxt)

	slot7 = slot1.dwAwardCount .. "/" .. slot1.dwTotalAwardCount

	slot0.view.infoNode_2.Node_HasData.jlTxt.setString(slot5, slot0.view.infoNode_2.Node_HasData.jlTxt)

	slot12 = 0
	slot7 = MathUtil.cookNumWithHansUnits("/", slot1.lSmallBlind) .. "/" .. MathUtil.cookNumWithHansUnits(0, slot1.lBigBlind)

	slot0.view.infoNode_2.Node_HasData.mangzhuTxt.setString(slot5, slot0.view.infoNode_2.Node_HasData.mangzhuTxt)

	slot6 = slot0.view.infoNode_2.Node_HasData.qianzhuTxt
	slot10 = 0

	slot0.view.infoNode_2.Node_HasData.qianzhuTxt.setString(slot5, MathUtil.cookNumWithHansUnits("/", slot1.lAnte))

	slot12 = 0
	slot7 = MathUtil.cookNumWithHansUnits("/", slot1.lNextSmallBlind) .. "/" .. MathUtil.cookNumWithHansUnits(0, slot1.lNextBigBlind)

	slot0.view.infoNode_2.Node_HasData.nextLevelTxt.setString(slot5, slot0.view.infoNode_2.Node_HasData.nextLevelTxt)

	slot6 = slot0.view.infoNode_2.Node_HasData.nextLevelNumTxt
	slot9 = slot1.lNextAnte

	slot0.view.infoNode_2.Node_HasData.nextLevelNumTxt.setString(slot5, MathUtil.cookNumWithHansUnits("/"))

	slot6 = slot0.view.infoNode_2.Node_HasData.downTimeTxt
	slot9 = slot1.dwElapsedTime

	slot0.view.infoNode_2.Node_HasData.downTimeTxt.setString(slot5, DateUtil.getTimeString("/"))

	slot7 = slot1.lAverageChip

	slot0.view.infoNode_2.Node_HasData.pingjunchoumaTxt.setString(slot5, slot0.view.infoNode_2.Node_HasData.pingjunchoumaTxt)

	slot7 = slot1.lTotalChip

	slot0.view.infoNode_2.Node_HasData.zongchoumaTxt.setString(slot5, slot0.view.infoNode_2.Node_HasData.zongchoumaTxt)
end

DzpkMatchInfoCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingMatchInfo(slot2, slot0.model)

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

DzpkMatchInfoCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btn_close then
		slot5 = slot0.timer

		for slot6, slot7 in ipairs(slot4) do
			slot10 = slot7

			slot7.stop(slot9)

			slot10 = slot7

			slot7.destroy(slot9)

			slot7 = nil
		end

		slot0.timer = {}
		slot6 = false

		slot0.model.setShowMatchInfoModel(slot4, slot0.model)

		slot6 = false

		slot0.model.setIsShowingMatchInfo(slot4, slot0.model)

		slot7 = slot0

		slot0.model.matchKuangInfoChangedSignal.remove(slot4, slot0.model.matchKuangInfoChangedSignal, slot0.updateNode2)
	elseif slot1 == slot0.view.infoNode_1.btn_fenxian then
		slot6 = slot0.view.infoNode_1.btn_fenxian

		slot0.controller.matchInfoshareWechat(slot4, slot0.controller)
	elseif slot1 == slot0.view.infoNode_1.btn_baoming then
		slot8 = slot0.model.getSelMatchData(slot4).wServerID

		slot0.controller.requestJoinMatch(slot0.model, slot0.controller, slot0.model.getSelMatchData(slot4).wMatchID)

		slot7 = false

		slot0.model.setIsShowingMatchInfo(slot0.model, slot0.model)
	elseif slot1 == slot0.view.infoNode_1.btn_tuisai then
		slot11 = false
		slot4 = popupMgr.showConfirm(slot5, popupMgr, "退赛将只退还报名费（手续费不退），您确认退赛吗？", slot3, nil, "")
		slot8 = "确认"

		slot4.setConfirmTxt(popupMgr, slot4)

		slot8 = "取消"

		slot4.setCancelTxt(popupMgr, slot4)
	elseif slot1 == slot0.view.infoNode_1.btn_enter then
		slot7 = slot0.model.getSelMatchData(slot4).wSortID
		slot8 = gameMgr.getRoomTypeBySortID(slot0.model, gameMgr)

		slot0.model.setGameType(gameMgr, slot0.model)

		slot8 = gameMgr.getRoomTypeBySortID(slot0.model, gameMgr)

		slot0.controller.requestEnterRoom(gameMgr, slot0.controller)
	end
end

DzpkMatchInfoCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0._tabPane.tabClickSignal.remove(slot2, slot0._tabPane.tabClickSignal, slot0.onTabSelected)

	slot3 = slot0.timer

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.stop(slot7)

		slot8 = slot5

		slot5.destroy(slot7)

		slot5 = nil
	end

	slot0.timer = {}
	slot3 = slot0.view.btn_close

	destroySomeObj(slot2)

	slot3 = slot0.view.infoNode_1.btn_fenxian

	destroySomeObj(slot2)

	slot3 = slot0.view.infoNode_1.btn_baoming

	destroySomeObj(slot2)

	slot3 = slot0.view.infoNode_1.btn_tuisai

	destroySomeObj(slot2)

	slot5 = slot0

	slot0.model.matchKuangInfoChangedSignal.remove(slot2, slot0.model.matchKuangInfoChangedSignal, slot0.updateNode2)

	slot5 = slot0

	slot0.model.selMatchStateChangedSignal.remove(slot2, slot0.model.selMatchStateChangedSignal, slot0.onMatchState)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
