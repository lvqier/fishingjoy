LhdBalanceExCcsView = class("LhdBalanceExCcsView")
LhdBalanceExCcsView.VIEW_TYPE_DA_LU = 1
LhdBalanceExCcsView.VIEW_TYPE_XIAO_LU = 2
LhdBalanceExCcsView.VIEW_TYPE_DA_YAN_ZAI = 3
LhdBalanceExCcsView.VIEW_TYPE_XIAO_QIANG_LU = 4
LhdBalanceExCcsView.VIEW_TYPE_ZHU_PAN_LU = 5
LhdBalanceExCcsView.VIEW_TYPE_ZHI_XIAN = 6

LhdBalanceExCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0.curShowPoints = {}
	slot0.imgPointsCache = {}
	slot0.sp19 = {}

	for slot4 = 1, 19, 1 do
		table.insert(slot0.sp19, slot0.view.node19["s" .. slot4])
	end

	slot0.view.layerResult.zhupan_lv:setScrollPolicy(CcsScrollView.SCROLL_H)
	slot0.view.layerResult.zhupan_lv:setIsItemClickable(false)
	slot0.view.layerResult.zhupan_lv:setItemResCcsFileName("module/lhd/csb/common/LhdBalanceZPItem.csb")
	slot0.view.layerResult.zhupan_lv:setGap(0)
	slot0.view.layerResult.dalu_lv:setScrollPolicy(CcsScrollView.SCROLL_H)
	slot0.view.layerResult.dalu_lv:setIsItemClickable(false)
	slot0.view.layerResult.dalu_lv:setItemResCcsFileName("module/lhd/csb/common/LhdBalanceDLItem.csb")
	slot0.view.layerResult.dalu_lv:setGap(0)
	slot0.view.layerResult.dayanzai_lv:setScrollPolicy(CcsScrollView.SCROLL_H)
	slot0.view.layerResult.dayanzai_lv:setIsItemClickable(false)
	slot0.view.layerResult.dayanzai_lv:setItemResCcsFileName("module/lhd/csb/common/LhdBalanceDYZItem.csb")
	slot0.view.layerResult.dayanzai_lv:setGap(0)
	slot0.view.layerResult.xiaolu_lv:setScrollPolicy(CcsScrollView.SCROLL_H)
	slot0.view.layerResult.xiaolu_lv:setIsItemClickable(false)
	slot0.view.layerResult.xiaolu_lv:setItemResCcsFileName("module/lhd/csb/common/LhdBalanceXLItem.csb")
	slot0.view.layerResult.xiaolu_lv:setGap(0)
	slot0.view.layerResult.xiaoqianglu_lv:setScrollPolicy(CcsScrollView.SCROLL_H)
	slot0.view.layerResult.xiaoqianglu_lv:setIsItemClickable(false)
	slot0.view.layerResult.xiaoqianglu_lv:setItemResCcsFileName("module/lhd/csb/common/LhdBalanceXQLItem.csb")
	slot0.view.layerResult.xiaoqianglu_lv:setGap(0)
	slot0.view.noChangeNode.lhd_balance2_loong_bg_11:setVisible(false)
	slot0.view.noChangeNode.lhd_balance2_peace_bg_10:setVisible(false)
	slot0.view.noChangeNode.lhd_balance2_tiger_bg_9:setVisible(false)
	slot0.view.noChangeNode.Text_35_3_0:setVisible(false)
	slot0.view.noChangeNode.Text_35_3_0_0:setVisible(false)
	slot0.view.noChangeNode.Text_35_3_0_1:setVisible(false)
	slot0.view.drawCount:setVisible(false)
	slot0.view.dragonCount:setVisible(false)
	slot0.view.tigerCount:setVisible(false)
end

LhdBalanceExCcsView.onShow = function (slot0)
	slot0.model.balanceHistoryDataChangedSignal:add(slot0.evtBalanceHistoryData, slot0)
	slot0:evtBalanceHistoryData()
end

LhdBalanceExCcsView.onHide = function (slot0)
	slot0.model.balanceHistoryDataChangedSignal:remove(slot0.evtBalanceHistoryData, slot0)
end

LhdBalanceExCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingBalance(false)
end

LhdBalanceExCcsView.evtBalanceHistoryData = function (slot0)
	slot0:updateZhiXianView()
	slot0:updateZhuPanView()
	slot0:updateProportion()
	slot0:updateBalanceEachWin()

	slot1 = slot0.controller:getBalanceDaLuData()

	slot0:updateDaLuView(slot0.controller:recordData2View(slot1))
	slot0:updateDaYanZaiView(slot0.controller:getBalanceDownThreeLoadViewData(slot1, 0))
	slot0:updateXiaoLuView(slot0.controller:getBalanceDownThreeLoadViewData(slot1, 1))
	slot0:updateXiaoQiangLuView(slot0.controller:getBalanceDownThreeLoadViewData(slot1, 2))
	slot0:updateForecastView(slot0.controller:ForecastNextDownThreeLoadData(slot1, LHD_BALANCE_DRAGON), slot0.controller:ForecastNextDownThreeLoadData(slot1, LHD_BALANCE_TIGER))
end

LhdBalanceExCcsView.updateProportion = function (slot0)
	slot1 = slot0.model:getBalanceHistoryData()
	slot3 = 0
	slot4 = 0
	slot5 = 0

	for slot9 = 100, 101 - 20, -1 do
		if slot1[slot9] == LHD_BALANCE_DRAGON then
			slot3 = slot3 + 1
		elseif slot1[slot9] == LHD_BALANCE_TIGER then
			slot4 = slot4 + 1
		elseif slot1[slot9] == LHD_BALANCE_DRAW then
			slot5 = slot5 + 1
		end
	end

	slot7 = 0
	slot8 = 0

	if slot2 - slot5 <= 0 then
		slot7 = 0
		slot8 = 0
	else
		slot8 = 100 - math.floor(slot3 / slot6 * 100 + 0.5)
	end

	slot0.view.dragon_tf:setHtmlText(slot10)
	slot0.view.tiger_tf:setHtmlText(HtmlUtil.createArtNum(slot8, "#lhd_balance_%s.png", nil, nil, nil, -30) .. slot9)
end

LhdBalanceExCcsView.updateZhuPanView = function (slot0)
	slot0.view.layerResult.zhupan_lv:setDatas(TableUtil.cookDataAs2Dimension(slot1, 6))
	slot0.view.layerResult.zhupan_lv:jumpToPercent(1, nil, nil)
end

LhdBalanceExCcsView.updateZhiXianView = function (slot0)
	slot1 = slot0.model:getBalanceHistoryData()

	for slot6 = 100, 101 - 19, -1 do
		if slot1[slot6] ~= nil and slot1[slot6] ~= LHD_BALANCE_ERROR then
			slot0.sp19[100 - slot6 + 1]:loadTexture(LHD_BALANCE_POINTS[slot1[slot6]])
		end
	end
end

LhdBalanceExCcsView.updateDaLuView = function (slot0, slot1)
	slot2 = TableUtil.cookDataAs2Dimension(slot1, 2)

	while #slot1 < 26 do
		table.insert(slot2, {})
	end

	slot0.view.layerResult.dalu_lv:setDatas(slot1)
	slot0.view.layerResult.dalu_lv:jumpToPercent(1, nil, nil)
end

LhdBalanceExCcsView.updateDaYanZaiView = function (slot0, slot1)
	slot2 = TableUtil.cookDataAs2Dimension(slot1, 2)

	while #slot2 < 13 do
		table.insert(slot2, {})
	end

	slot0.view.layerResult.dayanzai_lv:setDatas(slot2)
	slot0.view.layerResult.dayanzai_lv:jumpToPercent(1, nil, nil)
end

LhdBalanceExCcsView.updateXiaoLuView = function (slot0, slot1)
	slot2 = TableUtil.cookDataAs2Dimension(slot1, 2)

	while #slot2 < 13 do
		table.insert(slot2, {})
	end

	slot0.view.layerResult.xiaolu_lv:setDatas(slot2)
	slot0.view.layerResult.xiaolu_lv:jumpToPercent(1, nil, nil)
end

LhdBalanceExCcsView.updateXiaoQiangLuView = function (slot0, slot1)
	slot2 = TableUtil.cookDataAs2Dimension(slot1, 2)

	while #slot2 < 13 do
		table.insert(slot2, {})
	end

	slot0.view.layerResult.xiaoqianglu_lv:setDatas(slot2)
	slot0.view.layerResult.xiaoqianglu_lv:jumpToPercent(1, nil, nil)
end

LhdBalanceExCcsView.updateForecastView = function (slot0, slot1, slot2)
	slot0.view.layerResult.spdragon1:setSpriteFrame(slot0:getForecastTextureName(LhdBalanceExCcsView.VIEW_TYPE_DA_YAN_ZAI, slot1[1]))
	slot0.view.layerResult.spdragon2:setSpriteFrame(slot0:getForecastTextureName(LhdBalanceExCcsView.VIEW_TYPE_XIAO_LU, slot1[2]))
	slot0.view.layerResult.spdragon3:setSpriteFrame(slot0:getForecastTextureName(LhdBalanceExCcsView.VIEW_TYPE_XIAO_QIANG_LU, slot1[3]))
	slot0.view.layerResult.sptiger1:setSpriteFrame(slot0:getForecastTextureName(LhdBalanceExCcsView.VIEW_TYPE_DA_YAN_ZAI, slot2[1]))
	slot0.view.layerResult.sptiger2:setSpriteFrame(slot0:getForecastTextureName(LhdBalanceExCcsView.VIEW_TYPE_XIAO_LU, slot2[2]))
	slot0.view.layerResult.sptiger3:setSpriteFrame(slot0:getForecastTextureName(LhdBalanceExCcsView.VIEW_TYPE_XIAO_QIANG_LU, slot2[3]))
end

LhdBalanceExCcsView.getForecastTextureName = function (slot0, slot1, slot2)
	slot3 = ""

	if slot2 == LHD_BALANCE_DRAGON then
		slot3 = "DRAGON"
	elseif slot2 == LHD_BALANCE_TIGER then
		slot3 = "TIGER"
	end

	return LHD_BALANCE_FORECAST[slot3 .. tostring(slot1)]
end

LhdBalanceExCcsView.removeAllResultView = function (slot0)
	for slot4 = #slot0.curShowPoints, 1, -1 do
		if slot0.curShowPoints[slot4] then
			slot0.curShowPoints[slot4]:setVisible(false)
			slot0.curShowPoints[slot4]:setScale(1)
			table.insert(slot0.imgPointsCache, table.remove(slot0.curShowPoints, slot4))
		end
	end

	slot0.curShowPoints = {}
end

LhdBalanceExCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingBalance(false)
	end
end

LhdBalanceExCcsView.updateBalanceEachWin = function (slot0)
	slot1 = slot0.model:getBalanceHistoryData()
	slot3 = 0
	slot4 = 0
	slot5 = 0

	for slot9 = 100, 101 - slot0.model:getBalanceHistoryCount(), -1 do
		if slot1[slot9] == LHD_BALANCE_DRAGON then
			slot3 = slot3 + 1
		elseif slot1[slot9] == LHD_BALANCE_TIGER then
			slot4 = slot4 + 1
		elseif slot1[slot9] == LHD_BALANCE_DRAW then
			slot5 = slot5 + 1
		end
	end

	slot0.view.dragonCount:setText(slot3)
	slot0.view.tigerCount:setText(slot4)
	slot0.view.drawCount:setText(slot5)
end

LhdBalanceExCcsView.destroy = function (slot0)
	slot0.model.balanceHistoryDataChangedSignal:remove(slot0.evtBalanceHistoryData, slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.layerResult.zhupan_lv)
	destroySomeObj(slot0.view.layerResult.dalu_lv)
	destroySomeObj(slot0.view.layerResult.dayanzai_lv)
	destroySomeObj(slot0.view.layerResult.xiaolu_lv)
	destroySomeObj(slot0.view.layerResult.xiaoqianglu_lv)
	ZoomPopUpChildView.destroy(slot0)
end

return
