HlssmResultWinCcsView = class("HlssmResultWinCcsView")

HlssmResultWinCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._typeRes = {
		[0] = "txt/hlssm_txt_js_0.png",
		"txt/hlssm_txt_js_1.png",
		"txt/hlssm_txt_js_2.png",
		"txt/hlssm_txt_js_3.png",
		"txt/hlssm_txt_js_4.png",
		"txt/hlssm_txt_js_5.png",
		"txt/hlssm_txt_js_6.png",
		"txt/hlssm_txt_js_7.png",
		"txt/hlssm_txt_js_8.png",
		"txt/hlssm_txt_js_9.png"
	}

	slot0.model.endDataChangedSignal:add(slot0.updateView, slot0)
	slot0.model.bankerChangedSignal:add(slot0.onChangeBanker, slot0)
	slot0:updateView()
end

HlssmResultWinCcsView.onChangeBanker = function (slot0)
	if slot0:getIsShowing() then
		slot1 = slot0.controller:createSpineWithEvent("hlssm_xiazhutip", __emptyFunction)

		slot1:setSkin("4")
		slot1:setPosition(cc.p(667, 375))
		slot0:addChild(slot1)
	end
end

HlssmResultWinCcsView.updateView = function (slot0)
	if not slot0.model:getEndData() or not slot1.cbTableCardArray then
		return
	end

	slot2 = {
		slot0.view.xian,
		slot0.view.zhuang
	}
	slot3 = slot0.model:getCardArray()
	slot4 = {
		slot0.controller:getCardListPip(slot3[1], #slot3[1]),
		slot0.controller:getCardListPip(slot3[2], #slot3[2])
	}

	for slot8 = 1, 2, 1 do
		slot9 = slot2[slot8]

		for slot13 = 1, 3, 1 do
			slot9["puke" .. slot13].root:setDataInt(slot3[slot8][slot13])
			slot9["puke" .. slot13]:setVisible(slot3[slot8][slot13] ~= nil)
		end

		slot9.dian:setVisible(true)
		slot9.dian:setTexture(slot0.controller:getUIPath(slot0._typeRes[slot4[slot8]]))
	end

	slot0.view.xian.lose:setVisible(slot4[1] < slot4[2])
	slot0.view.zhuang.lose:setVisible(slot4[2] < slot4[1])
	slot0.view.bankerName_tf:setHtmlText(slot0.model:getCurBankerUser() or {}.szNickName or "")
	slot0.view.myName_tf:setHtmlText(Hero:getPNickName())

	slot7 = slot1.lBankerScore

	if IS_HL_VERSION then
		slot7 = slot7 / 100
	end

	if slot7 >= 0 then
		if IS_HL_VERSION then
			slot0.view.bankerScore_tf:setHtmlText(HtmlUtil.createArtNumDPSign(slot7, "#hlssm_win_%s.png"))
		else
			slot0.view.bankerScore_tf:setHtmlText(HtmlUtil.createArtNumDotSign(slot7, "#hlssm_win_%s.png"))
		end
	elseif IS_HL_VERSION then
		slot0.view.bankerScore_tf:setHtmlText(HtmlUtil.createArtNumDPSign(slot7, "#hlssm_lose_%s.png"))
	else
		slot0.view.bankerScore_tf:setHtmlText(HtmlUtil.createArtNumDotSign(slot7, "#hlssm_lose_%s.png"))
	end

	slot7 = slot1.lPlayAllScore

	if IS_HL_VERSION then
		slot7 = slot7 / 100
	end

	if slot0.model:getIsBet() then
		if slot7 >= 0 then
			if IS_HL_VERSION then
				slot0.view.myScore_tf:setHtmlText(HtmlUtil.createArtNumDPSign(slot7, "#hlssm_win_%s.png"))
			else
				slot0.view.myScore_tf:setHtmlText(HtmlUtil.createArtNumDotSign(slot7, "#hlssm_win_%s.png"))
			end
		elseif IS_HL_VERSION then
			slot0.view.myScore_tf:setHtmlText(HtmlUtil.createArtNumDPSign(slot7, "#hlssm_lose_%s.png"))
		else
			slot0.view.myScore_tf:setHtmlText(HtmlUtil.createArtNumDotSign(slot7, "#hlssm_lose_%s.png"))
		end
	else
		slot0.view.myScore_tf:setHtmlText("")
	end

	slot0.view.spWxz:setVisible(not slot0.model:getIsBet())

	if slot1.cbRankCount == 0 then
		slot0.view.list:setVisible(false)
		slot0.view.spZts:setVisible(true)
	else
		slot0.view.list:setVisible(true)
		slot0.view.spZts:setVisible(false)

		for slot11 = 1, 5, 1 do
			slot12 = slot0.view.list["name_" .. slot11 .. "_tf"]
			slot13 = slot0.view.list["score_" .. slot11 .. "_tf"]

			if slot11 <= slot1.cbRankCount then
				slot12:setHtmlText(StringUtil.truncate(slot1.RankUser[slot11].szUserName, 16, nil, 2))

				slot15 = nil

				slot13:setHtmlText((not IS_HL_VERSION or HtmlUtil.createArtNumDPSign(slot14.lWinScore / 100, "#hlssm_rank_win_%s.png")) and HtmlUtil.createArtNumDotSign(slot14.lWinScore, "#hlssm_rank_win_%s.png"))
				slot0.view.list["hlssm_h" .. slot11]:setVisible(true)
			else
				slot0.view.list["hlssm_h" .. slot11]:setVisible(false)
				slot12:setHtmlText("")
				slot13:setHtmlText("")
			end
		end
	end
end

HlssmResultWinCcsView.onZoomShowTweenComplete = function (slot0)
	return
end

HlssmResultWinCcsView.resetAction = function (slot0)
	slot0.view.star:stopAllActions()
	slot0.view.light:stopAllActions()
end

HlssmResultWinCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.controller:playGameEffect(Bcbm_BT_CLOSE_SOUNDRES)
		slot0.model:setIsShowingWin(false)
		slot0.model:setIsShowingFailed(false)
	end
end

HlssmResultWinCcsView.destroy = function (slot0)
	slot0.model.endDataChangedSignal:remove(slot0.updateView, slot0)
	slot0.model.bankerChangedSignal:remove(slot0.onChangeBanker, slot0)

	slot1 = {
		slot0.view.btnClose,
		slot0.view.bankerScore_tf,
		slot0.view.myScore_tf,
		slot0.view.bankerName_tf,
		slot0.view.myName_tf
	}

	for slot5 = 1, 5, 1 do
		table.insert(slot1, slot0.view.list["name_" .. slot5 .. "_tf"])
		table.insert(slot1, slot0.view.list["score_" .. slot5 .. "_tf"])
	end

	for slot5, slot6 in ipairs(slot1) do
		destroySomeObj(slot6)
	end

	ZoomPopUpChildView.destroy(slot0)
end

return
