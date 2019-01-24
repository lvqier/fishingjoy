HlssmLogResultCcsItem = class("HlssmLogResultCcsItem")

HlssmLogResultCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
end

HlssmLogResultCcsItem.updateView = function (slot0)
	if slot0._data then
		slot0.spWin1:setVisible(slot0._data.cbBankerCount < slot0._data.cbPlayerCount)
		slot0.spWin2:setVisible(slot0._data.cbPlayerCount == slot0._data.cbBankerCount)
		slot0.spWin3:setVisible(slot0._data.cbPlayerCount < slot0._data.cbBankerCount)
	end
end

return
