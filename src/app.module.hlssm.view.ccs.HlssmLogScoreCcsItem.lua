HlssmLogScoreCcsItem = class("HlssmLogScoreCcsItem")

HlssmLogScoreCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
end

HlssmLogScoreCcsItem.updateView = function (slot0)
	if slot0._data then
		slot0.txtScore1_tf:setHtmlText((slot0._data.cbPlayerCount ~= slot0._data.cbBankerCount and slot0._data.cbPlayerCount) or "")
		slot0.txtScore2_tf:setHtmlText((slot0._data.cbPlayerCount == slot0._data.cbBankerCount and slot0._data.cbPlayerCount) or "")
		slot0.txtScore3_tf:setHtmlText((slot0._data.cbPlayerCount ~= slot0._data.cbBankerCount and slot0._data.cbBankerCount) or "")
	end
end

return
