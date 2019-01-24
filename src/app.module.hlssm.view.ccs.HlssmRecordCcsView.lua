HlssmRecordCcsView = class("HlssmRecordCcsView")
HlssmRecordCcsView.VIEW_TYPE_DA_LU = 1
HlssmRecordCcsView.VIEW_TYPE_XIAO_LU = 2
HlssmRecordCcsView.VIEW_TYPE_DA_YAN_ZAI = 3
HlssmRecordCcsView.VIEW_TYPE_XIAO_QIANG_LU = 4
HlssmRecordCcsView.VIEW_TYPE_ZHU_PAN_LU = 5

HlssmRecordCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0.listsParent = slot0.view.layerResult.svParent.svContent.lists
	slot0._lists = {
		slot0.listsParent.dalu_lv,
		slot0.listsParent.dayanzai_lv,
		slot0.listsParent.xiaolu_lv,
		slot0.listsParent.xiaoqianglu_lv,
		slot0.view.layerResult.list.zhupan_lv
	}
	slot2 = {
		"module/hlssm/csb/common/HlssmRecordDLItem.csb",
		"module/hlssm/csb/common/HlssmRecordDYZItem.csb",
		"module/hlssm/csb/common/HlssmRecordXLItem.csb",
		"module/hlssm/csb/common/HlssmRecordXQLItem.csb",
		"module/hlssm/csb/common/HlssmRecordZPLItem.csb"
	}

	for slot6, slot7 in ipairs(slot0._lists) do
		slot7:setScrollPolicy(CcsScrollView.SCROLL_H)
		slot7:setIsItemClickable(false)
		slot7:setItemResCcsFileName(slot2[slot6])
		slot7:setGap(0)
	end

	for slot6, slot7 in pairs(slot0.listsParent:getChildren()) do
		slot7:getScrollAreaNode():setSwallowTouches(false)
		slot7:setIsItemClickable(false)
		slot7:setIsScrollableOnlyInNeed(true)
	end

	slot0.view.layerResult.svParent.xsl_sv.setContentChild(slot4, slot1)
	slot0.view.layerResult.svParent.xsl_sv.setInnerContainerSize(slot4, slot1:getContentSize())
	DisplayUtil.setAllCascadeOpacityEnabled(slot0.view.layerResult.svParent.xsl_sv)
end

HlssmRecordCcsView.doShowCustomPopupEffect = function (slot0, slot1)
	TweenLite.killTweensOf(slot0.view)
	DisplayUtil.setVisible(slot0.view, false)
	slot0.view:setPositionY(300)

	slot2 = TimelineLite.new({
		onComplete = slot1
	})

	slot2:insert(TweenLite.to(slot0.view, 0.2, {
		autoAlpha = 1,
		ease = Quad.easeInOut
	}))
	slot2:insert(TweenLite.to(slot0.view, 0.2, {
		y = 375,
		ease = Quad.easeInOut
	}))
end

HlssmRecordCcsView.doHideCustomPopupEffect = function (slot0, slot1)
	TweenLite.killTweensOf(slot0.view)

	slot2 = TimelineLite.new({
		onComplete = slot1
	})

	slot2:insert(TweenLite.to(slot0.view, 0.15, {
		autoAlpha = 0,
		ease = Quad.easeInOut
	}))
	slot2:insert(TweenLite.to(slot0.view, 0.15, {
		y = 300,
		ease = Quad.easeInOut
	}))
end

HlssmRecordCcsView.onShow = function (slot0)
	slot0.model.recordListChangedSignal:add(slot0.onRecordData, slot0)
	slot0:onRecordData()
end

HlssmRecordCcsView.onHide = function (slot0)
	slot0.model.recordListChangedSignal:remove(slot0.onRecordData, slot0)
end

HlssmRecordCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingRecord(false)
end

HlssmRecordCcsView.onRecordData = function (slot0)
	slot2 = slot0.controller:getRecordDaLuData()

	for slot7, slot8 in ipairs(slot3) do
		slot0:updateRecordList(slot8, slot0._lists[slot7], (slot7 == HlssmRecordCcsView.VIEW_TYPE_ZHU_PAN_LU and 11) or 32)
	end

	slot0:updateForecastView(slot0.controller:ForecastNextDownThreeLoadData(slot2, HLSSM_RESULT_ZHUANG), slot0.controller:ForecastNextDownThreeLoadData(slot2, HLSSM_RESULT_XIAN))
	slot0:updateBottomInfo()
end

HlssmRecordCcsView.updateRecordList = function (slot0, slot1, slot2, slot3)
	slot5 = 1

	if slot3 <= #TableUtil.copyDataDep(slot1) then
		table.insert(slot4, {})
	end

	while #slot4 < slot3 do
		table.insert(slot4, {})

		slot5 = 0
	end

	slot2:setDatas(slot4)
	slot2:jumpToPercent(slot5)
end

HlssmRecordCcsView.updateForecastView = function (slot0, slot1, slot2)
	slot3 = {
		HlssmRecordCcsView.VIEW_TYPE_DA_YAN_ZAI,
		HlssmRecordCcsView.VIEW_TYPE_XIAO_LU,
		HlssmRecordCcsView.VIEW_TYPE_XIAO_QIANG_LU
	}

	for slot7 = 1, 3, 1 do
		slot0.view.bottom["spZhuang" .. slot7]:setVisible(slot1[slot7] > 0)
		slot0.view.bottom["spXian" .. slot7]:setVisible(slot2[slot7] > 0)

		if slot1[slot7] > 0 then
			slot0.view.bottom["spZhuang" .. slot7]:setSpriteFrame(slot0.controller:getTextureName(slot3[slot7], slot1[slot7]))
		end

		if slot2[slot7] > 0 then
			slot0.view.bottom["spXian" .. slot7]:setSpriteFrame(slot0.controller:getTextureName(slot3[slot7], slot2[slot7]))
		end
	end
end

HlssmRecordCcsView.updateBottomInfo = function (slot0)
	slot1 = 0
	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot5 = 0
	slot6 = 0
	slot6 = #slot0.model:getRecordList()

	for slot11, slot12 in ipairs(slot7) do
		if slot0.controller:getResultVal(slot12) == HLSSM_RESULT_ZHUANG then
			slot1 = slot1 + 1
		elseif slot13 == HLSSM_RESULT_XIAN then
			slot2 = slot2 + 1
		elseif slot13 == HLSSM_RESULT_PING then
			slot3 = slot3 + 1
		end

		if slot12.bBankerTwoPair then
			slot4 = slot4 + 1
		end

		if slot12.bPlayerTwoPair then
			slot5 = slot5 + 1
		end
	end

	slot0.view.bottom.zhuang_tf:setHtmlText(HtmlUtil.createArtNum(slot1, "#hlssm_luzi_bottom_zhuang_%s.png"))
	slot0.view.bottom.xian_tf:setHtmlText(HtmlUtil.createArtNum(slot2, "#hlssm_luzi_bottom_xian_%s.png"))
	slot0.view.bottom.ping_tf:setHtmlText(HtmlUtil.createArtNum(slot3, "#hlssm_luzi_bottom_ping_%s.png"))
	slot0.view.bottom.zhuangdui_tf:setHtmlText(HtmlUtil.createArtNum(slot4, "#hlssm_luzi_bottom_zhuang_%s.png"))
	slot0.view.bottom.xiandui_tf:setHtmlText(HtmlUtil.createArtNum(slot5, "#hlssm_luzi_bottom_xian_%s.png"))
	slot0.view.bottom.zong_tf:setHtmlText(HtmlUtil.createArtNum(slot6, "#hlssm_luzi_bottom_zong_%s.png"))
end

HlssmRecordCcsView.onBtnClick = function (slot0, slot1, slot2)
	return
end

HlssmRecordCcsView.destroy = function (slot0)
	slot0.model.recordListChangedSignal:remove(slot0.onRecordData, slot0)

	slot1 = ipairs
	slot2 = slot0._lists or {}

	for slot4, slot5 in slot1(slot2) do
		destroySomeObj(slot5)
	end

	destroySomeObj(slot0.view.bottom.zhuang_tf)
	destroySomeObj(slot0.view.bottom.xian_tf)
	destroySomeObj(slot0.view.bottom.ping_tf)
	destroySomeObj(slot0.view.bottom.zhuangdui_tf)
	destroySomeObj(slot0.view.bottom.xiandui_tf)
	destroySomeObj(slot0.view.bottom.zong_tf)
	ZoomPopUpChildView.destroy(slot0)
end

return
