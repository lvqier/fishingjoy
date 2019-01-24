PlazaRedPacketHdxqCcsView = class("PlazaRedPacketHdxqCcsView")

PlazaRedPacketHdxqCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	Hero.redPacketDesInfoChangedSignal:add(slot0.onRedPacketDesInfoChanged, slot0)
	slot0:onRedPacketDesInfoChanged()
end

PlazaRedPacketHdxqCcsView.onRedPacketDesInfoChanged = function (slot0)
	if Hero:getRedPacketDesInfo() and slot1.rule then
		slot0.view.nodeContent.t_tfs:setHtmlText(slot1.rule)
	end
end

PlazaRedPacketHdxqCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingRedPacketHdxq(false)
	end
end

PlazaRedPacketHdxqCcsView.destroy = function (slot0)
	Hero.redPacketDesInfoChangedSignal:remove(slot0.onRedPacketDesInfoChanged, slot0)
	slot0.view.nodeContent.t_tfs:destroy()
	slot0.view.btnClose:destroy()
	ZoomPopUpChildView.destroy(slot0)
end

return
