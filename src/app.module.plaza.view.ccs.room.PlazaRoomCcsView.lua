PlazaRoomCcsView = class("PlazaRoomCcsView")

PlazaRoomCcsView.onCreationComplete = function (slot0)
	slot0._roomPosDic = {
		{
			cc.p(647, 424)
		},
		{
			cc.p(414, 424),
			cc.p(880, 424)
		},
		{
			cc.p(423, 518),
			cc.p(848, 518),
			cc.p(634, 267)
		},
		{
			cc.p(502, 518),
			cc.p(928, 518),
			cc.p(381, 267),
			cc.p(808, 267)
		},
		{
			cc.p(259, 518),
			cc.p(665, 518),
			cc.p(1071, 518),
			cc.p(461, 267),
			cc.p(868, 267)
		}
	}
	slot0._gameTotalTabs = {
		{
			btn = slot0.layerTabs.btn1
		},
		{
			btn = slot0.layerTabs.btn2
		},
		{
			btn = slot0.layerTabs.btn3
		},
		{
			btn = slot0.layerTabs.btn4
		},
		{
			btn = slot0.layerTabs.btn5
		}
	}
	slot0._dizhu = {
		0,
		1000,
		5000,
		25000,
		100000
	}

	for slot4, slot5 in ipairs(slot0._gameTotalTabs) do
		slot5.btn._roomKind = slot4
	end

	ClassUtil.extends(slot0, BasePlazaSubView, true, TableUtil.concat(slot0._gameTotalTabs))
	ClassUtil.extends(slot0, BaseGameRoomView, true, nil)
	slot0.model.curGameKindChangedSignal:add(slot0.onCurGameKindChanged, slot0)
	slot0:onCurGameKindChanged()
	slot0:initDizhu()
end

PlazaRoomCcsView.initDizhu = function (slot0)
	for slot4 = 1, #slot0._gameTotalTabs, 1 do
		if slot0._gameTotalTabs[slot4].btn and slot0._gameTotalTabs[slot4].btn.dizhu_tf then
			slot0._gameTotalTabs[slot4].btn.dizhu_tf:setHtmlText(((slot0._dizhu[slot4] >= 10000 and HtmlUtil.createArtNumDot(parseInt(slot5 / 10000), "#plist_white_xie_%s.png") .. HtmlUtil.createImg(ResConfig.getAssetPath("ui/txt/txt_white_xie_wan.png"), nil, nil, nil, 0)) or (slot5 >= 1000 and HtmlUtil.createArtNumDot(parseInt(slot5 / 1000), "#plist_white_xie_%s.png") .. HtmlUtil.createImg(ResConfig.getAssetPath("ui/txt/txt_white_xie_qian.png"), nil, nil, nil, 0)) or (slot5 >= 100 and HtmlUtil.createArtNumDot(parseInt(slot5 / 100), "#plist_white_xie_%s.png") .. HtmlUtil.createImg(ResConfig.getAssetPath("ui/txt/txt_white_xie_bai.png"), nil, nil, nil, 0)) or HtmlUtil.createArtNumDot(tonumber(slot5), "#plist_white_xie_%s.png")) .. HtmlUtil.createImg(ResConfig.getAssetPath("ui/txt/txt_zhunru.png")))
		end
	end
end

PlazaRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2)
	slot1.txtOnline_tf:setHtmlText(HtmlUtil.createArtNumDot(tonumber(slot2._totalOnline), "#plist_font_white_1_%s.png"))
	slot1.txtOnline_tf:setOpacity(153)

	slot1._roomVos = slot2

	if slot1.txtMini_tf then
		slot1.txtMini_tf:setHtmlText((slot2._miniNeed >= 10000 and HtmlUtil.createArtNumDot(parseInt(slot3 / 10000), "#plist_yellow_xie_%s.png") .. HtmlUtil.createImg(ResConfig.getAssetPath("ui/txt/txt_yellow_xie_wan.png"), nil, nil, nil, 0)) or (slot3 >= 1000 and HtmlUtil.createArtNumDot(parseInt(slot3 / 1000), "#plist_yellow_xie_%s.png") .. HtmlUtil.createImg(ResConfig.getAssetPath("ui/txt/txt_yellow_xie_qian.png"), nil, nil, nil, 0)) or (slot3 >= 100 and HtmlUtil.createArtNumDot(parseInt(slot3 / 100), "#plist_yellow_xie_%s.png") .. HtmlUtil.createImg(ResConfig.getAssetPath("ui/txt/txt_yellow_xie_bai.png"), nil, nil, nil, 0)) or HtmlUtil.createArtNumDot(tonumber(slot3), "#plist_yellow_xie_%s.png"))
	end
end

PlazaRoomCcsView.updateRoomList = function (slot0)
	slot0:onCurGameKindChanged(nil, true)
end

PlazaRoomCcsView.onCurGameKindChanged = function (slot0, slot1, slot2)
	if slot0.model:getCurGameKind() then
		slot4 = gameMgr:getServerVosDicEx()[slot3] or {}
		slot5 = 1
		slot6 = #slot0._gameTotalTabs
		slot7 = 0
		slot8 = {}

		while slot5 <= slot6 do
			slot10 = slot0._gameTotalTabs[slot5]

			if slot4[slot5] then
				slot8[slot7 + 1] = slot10

				slot0:updateRoomBtn(slot10.btn, slot9)
			end

			slot5 = slot5 + 1
		end

		slot0:setShowingTabs(slot8, slot0._roomPosDic[#slot8], slot2)
	end
end

PlazaRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot0.controller:gotoView(slot0.model:getPreShowingViewType(), true)
	else
		slot0.controller:try2EnterRoomByVos(slot1._roomVos, slot1._roomKind)
	end
end

return
