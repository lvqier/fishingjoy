QznnbHallCcsView = class("QznnbHallCcsView")

QznnbHallCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseGameHallCcsView, true)
	BaseGameHallCcsView.onCreationComplete(slot0, "common/QznnbHallItem.csb", 50, 100, 100, 50)
	ClassUtil.extends(slot0, BaseGameAniamtionView, true, {
		{
			fromAlpha = 0,
			node = slot0.layerList,
			fromPos = cc.p(0, -50)
		}
	})
end

QznnbHallCcsView.onHide = function (slot0)
	BaseGameAniamtionView.onHide(slot0)
	BaseGameHallCcsView.onHide(slot0)
end

QznnbHallCcsView.onShow = function (slot0)
	slot0.model:setIsShowingRoomTxt(true)
	slot0.model:setIsShowingBtnBack(true)
	slot0.model:setIsShowingBtnHelp(true)
	slot0.model:setIsShowingLogo(false)
	slot0.model:setIsShowingPlayerInfo(false)
	slot0.model:setIsShowingMainScore(false)
	slot0.model:setIsShowingQuickStart(true)
	BaseGameAniamtionView.onShow(slot0)
	BaseGameHallCcsView.onShow(slot0)
end

QznnbHallCcsView.onBtnClick = function (slot0, slot1, slot2)
	return
end

QznnbHallCcsView.destroy = function (slot0)
	BaseGameAniamtionView.destroy(slot0)
	BaseGameHallCcsView.destroy(slot0)
end

return
