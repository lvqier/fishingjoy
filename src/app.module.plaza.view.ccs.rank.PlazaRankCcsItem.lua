slot0 = {
	"pane/b87dt_phb_pm1.png",
	"pane/b88dt_phb_pm2.png",
	"pane/b89dt_phb_pm3.png"
}
PlazaRankCcsItem = class("PlazaRankCcsItem")

PlazaRankCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)

	slot0._moneyFt = ResFontTxt.new("plist_font_yellow_2_", 0, 0, 1)

	slot0._moneyFt:setParent(slot0)
	slot0._moneyFt:setPositionXY(725.08, 40)
	slot0._moneyFt:pushFontResWithChar(",", "douhao")

	slot0._moneyFt.resExtention = ".png"
end

PlazaRankCcsItem.updateView = function (slot0)
	if slot0._data then
		if slot0._data.place <= 3 then
			slot0.spPlace:setVisible(true)
			slot0.spPlace:setTexture(slot1)
			slot0.txtPlace_tf:setText("")
		else
			slot0.spPlace:setVisible(false)
			slot0.txtPlace_tf:setHtmlText(HtmlUtil.createArtNumDot(slot0._data.place, "#plist_font_rank_%s.png"))
		end

		slot0.txtName_tf:setText(StringUtil.truncate(slot0._data.NickName, 20, nil, 1.5))
		slot0.txtID_tf:setText("ID:" .. slot0._data.GameID)

		slot1 = ""

		if slot0._data.type == 1 then
			slot1 = "日赚"
		elseif slot0._data.type == 2 then
			slot1 = "财富"
		end

		slot0.txtTip_tf:setText(slot1)
		slot0._moneyFt:setTxt(MathUtil.cookNumWithComma(slot0._data.Score))
		slot0.bgMoney:setContentSize(cc.size(math.max(0, slot0._moneyFt:getTextWidth() + 72), slot0.bgMoney:getContentSize().height))
	end
end

PlazaRankCcsItem.getPushZoomView = function (slot0)
	return nil
end

PlazaRankCcsItem.onClick = function (slot0)
	if slot0._data then
		popupMgr:showUserInfoPopup(slot0._data)
	end
end

PlazaRankCcsItem.destroy = function (slot0)
	slot0.txtPlace_tf:destroy()
	slot0.txtName_tf:destroy()
	slot0.txtID_tf:destroy()
	slot0.txtTip_tf:destroy()
	slot0._moneyFt:destroy()
	CcsListViewItem.destroy(slot0)
end

return
