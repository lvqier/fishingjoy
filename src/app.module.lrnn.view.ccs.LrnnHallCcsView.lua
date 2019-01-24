slot2 = "LrnnHallCcsView"
LrnnHallCcsView = class(slot1)

LrnnHallCcsView.onCreationComplete = function (slot0)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameHallCcsView)

	slot8 = 160

	BaseGameHallCcsView.onCreationComplete(slot2, slot0, "common/LrnnHallItem.csb", 50, 100, 100)

	slot6 = -50
	slot7 = {
		{
			fromAlpha = 0,
			node = slot0.layerList,
			fromPos = cc.p("common/LrnnHallItem.csb", 0)
		}
	}

	ClassUtil.extends(cc.p("common/LrnnHallItem.csb", 0), slot0, BaseGameAniamtionView, true)
end

LrnnHallCcsView.onHide = function (slot0)
	slot3 = slot0

	BaseGameAniamtionView.onHide(slot2)

	slot3 = slot0

	BaseGameHallCcsView.onHide(slot2)
end

LrnnHallCcsView.onShow = function (slot0)
	slot4 = true

	slot0.model.setIsShowingRoomTxt(slot2, slot0.model)

	slot4 = true

	slot0.model.setIsShowingBtnBack(slot2, slot0.model)

	slot4 = true

	slot0.model.setIsShowingBtnHelp(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowingLogo(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowingPlayerInfo(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowingMainScore(slot2, slot0.model)

	slot4 = true

	slot0.model.setIsShowingQuickStart(slot2, slot0.model)

	slot6 = nil

	slot0.layerList.list_lv.jumpToPercent(slot2, slot0.layerList.list_lv, nil, 0)

	slot3 = slot0

	BaseGameAniamtionView.onShow(slot2)

	slot3 = slot0

	BaseGameHallCcsView.onShow(slot2)
end

LrnnHallCcsView.onBtnClick = function (slot0, slot1, slot2)
	return
end

LrnnHallCcsView.destroy = function (slot0)
	slot3 = slot0

	BaseGameAniamtionView.destroy(slot2)

	slot3 = slot0

	BaseGameHallCcsView.destroy(slot2)
end

return
