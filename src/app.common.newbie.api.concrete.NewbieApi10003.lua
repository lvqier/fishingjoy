slot2 = "NewbieApi10003"
NewbieApi10003 = class(slot1)

NewbieApi10003.ctor = function (slot0)
	slot4 = BaseNewbieApi

	ClassUtil.extends(slot2, slot0)

	slot0._ddzKindBtnArea = {
		w = 388,
		h = 406
	}
	slot5 = slot0.onGameRoomShowComplete

	slot0.registerAndCacheEvent(slot2, slot0, GameEvent.GAME_ROOM_BOTTOM_SHOW_COMPLETE)
end

NewbieApi10003.start = function (slot0)
	return
end

NewbieApi10003.onGameRoomShowComplete = function (slot0, slot1)
	slot0._toGameKind = slot1

	if slot1 == GameKind_DDZ_VIRTUAL then
		slot4 = gameMgr

		if NewbieUI.ddzKindBtn[gameMgr.getRealGameKind(slot3)] then
			slot14 = -180

			slot0._maskView.show(slot4, slot0._maskView, NewbieUI.ddzKindBtn[slot2], nil, slot0._ddzKindBtnArea.w, slot0._ddzKindBtnArea.h, nil, 14, 0, nil)

			slot7 = slot0.onDdzKindViewBeginHide

			slot0.registerAndCacheEvent(slot4, slot0, GameEvent.DDZ_KIND_HIDE_BEGIN)
		else
			slot5 = slot0

			slot0.finishNewbie(slot4)

			return true
		end
	else
		slot4 = slot0

		slot0.finish(slot3)
	end
end

NewbieApi10003.onDdzKindViewBeginHide = function (slot0)
	slot3 = slot0

	slot0.finish(slot2)
end

NewbieApi10003.destroy = function (slot0)
	slot3 = slot0

	BaseNewbieApi.destroy(slot2)
end

return
