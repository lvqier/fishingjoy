SerialReplayHeadItemCcsView = class("SerialReplayHeadItemCcsView")

SerialReplayHeadItemCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
	slot0:init()
end

SerialReplayHeadItemCcsView.init = function (slot0)
	slot0.selectSp:setVisible(false)
end

SerialReplayHeadItemCcsView.onClick = function (slot0)
	if slot0.model:getBReplayingAndShowing() == true then
		tweenMsgMgr:showRedMsg("此次观看还未结束")

		return
	end

	slot0.sprite_mask:setVisible(true)

	if slot0.model:getVideoSelectedItem() then
		slot1.sprite_mask:setVisible(false)
	end

	slot0.model:setVideoSelectedItem(slot0)
	slot0.controller:checkReplayBet(slot0._data.dwID)
end

SerialReplayHeadItemCcsView.updateView = function (slot0)
	if slot0._data then
		slot0.name_tf:setText(StringUtil.truncate(slot0._data.szNickName, 3))
		slot0.winScore_tf:setHtmlText(HtmlUtil.createArtNumWithHansUnits(slot0._data.lJackpot, "#wanjia_shuzi_%s.png"))
		slot0.winBet_tf:setHtmlText(HtmlUtil.createArtNumWithHansUnits(slot0._data.lJetton, "#wanjia_shuzi_%s.png"))
		slot0.winPopular_tf:setHtmlText(HtmlUtil.createArtNum(slot0._data.dwPopularity, "#wanjia_shuzi_%s.png"))
		slot0.winData_tf:setHtmlText(slot1)
		slot0.winScore_tf:setCascadeColorEnabled(true)
		slot0.winScore_tf:setColor(cc.c3b(255, 248, 160))
		slot0.sprite_mask:setVisible(false)
	end
end

SerialReplayHeadItemCcsView.destroy = function (slot0)
	CcsListViewItem.destroy(slot0)
end

return
