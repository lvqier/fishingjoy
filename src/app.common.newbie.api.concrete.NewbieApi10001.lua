slot2 = "NewbieApi10001"
NewbieApi10001 = class(slot1)

NewbieApi10001.ctor = function (slot0)
	slot4 = BaseNewbieApi

	ClassUtil.extends(slot2, slot0)

	slot0._gameTypeBtnAreas = {
		{
			w = 301,
			handOffsetX = 0,
			h = 521,
			handOffsetY = -200
		},
		{
			w = 303,
			handOffsetX = 0,
			h = 241,
			handOffsetY = -80
		},
		{
			w = 306,
			handOffsetX = 0,
			h = 249,
			handOffsetY = -100
		},
		{
			w = 416,
			handOffsetX = 0,
			h = 521,
			handOffsetY = -200
		}
	}
	slot0._toSubGameType = nil
	slot0._toGameKind = nil
	slot0._isPlazaMainShowComplete = false
	slot5 = slot0.onPlazaMainShowComplete

	slot0.registerAndCacheEvent(, slot0, GameEvent.PLAZA_MAIN_LEFT_SHOW_COMPLETE)

	slot5 = slot0.onPlazaMainHideBegin

	slot0.registerAndCacheEvent(, slot0, GameEvent.PLAZA_MAIN_LEFT_HIDE_BEGIN)
end

NewbieApi10001.start = function (slot0)
	CcsScrollView.CAN_ALL_SCROLL = false
	slot4 = false

	uiMgr.setIsWorldTouchable(false, uiMgr)
end

NewbieApi10001.onPlazaMainShowComplete = function (slot0)
	slot4 = true

	uiMgr.setIsWorldTouchable(slot2, uiMgr)

	slot1 = nil
	slot4 = Hero
	slot0._toGameKind = Hero.getNewbie2GameKind(uiMgr)
	slot4 = "c_gameconfig"

	if getCSVField(uiMgr)[slot0._toGameKind] then
		slot0._toSubGameType = slot2.gameType
		slot15 = slot0._gameTypeBtnAreas[slot0._toSubGameType].handOffsetY

		slot0._maskView.show(slot5, slot0._maskView, NewbieUI.plazaGameTypeBtns[slot0._toSubGameType], nil, slot0._gameTypeBtnAreas[slot0._toSubGameType].w, slot0._gameTypeBtnAreas[slot0._toSubGameType].h, nil, nil, 0, slot0._gameTypeBtnAreas[slot0._toSubGameType].handOffsetX)
	else
		slot5 = slot0

		slot0.finishNewbie(slot4)

		return true
	end
end

NewbieApi10001.onPlazaMainHideBegin = function (slot0)
	slot3 = slot0

	slot0.finish(slot2)
end

NewbieApi10001.destroy = function (slot0)
	CcsScrollView.CAN_ALL_SCROLL = true
	slot3 = slot0

	BaseNewbieApi.destroy(true)
end

return
