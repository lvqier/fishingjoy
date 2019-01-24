slot2 = "NewbieApi20002"
NewbieApi20002 = class(slot1)

NewbieApi20002.ctor = function (slot0)
	slot4 = BaseNewbieApi

	ClassUtil.extends(slot2, slot0)

	slot0._rankBtnSize = {
		w = 70,
		h = 70
	}
	slot5 = slot0.onPlazaMainRightShowComlete

	slot0.registerAndCacheEvent(slot2, slot0, GameEvent.PLAZA_MAIN_RIGHT_SHOW_COMPLETE)
end

NewbieApi20002.start = function (slot0)
	return
end

NewbieApi20002.onPlazaMainRightShowComlete = function (slot0)
	if NewbieUI.plazaLeftBtnRank then
		slot12 = 0

		slot0._maskView.show(slot2, slot0._maskView, NewbieUI.plazaLeftBtnRank, nil, slot0._rankBtnSize.w, slot0._rankBtnSize.h, nil, nil, 90, -20)

		slot3 = NewbieUI.plazaLeftBtnRank
		slot5 = slot0

		NewbieUI.plazaLeftBtnRank.getClickSignal(slot2).addOnce(slot2, NewbieUI.plazaLeftBtnRank.getClickSignal(slot2), slot0.onRankClick)
	else
		slot3 = slot0

		slot0.finishNewbie(slot2)

		return true
	end
end

NewbieApi20002.onRankClick = function (slot0)
	slot3 = slot0

	slot0.finish(slot2)
end

NewbieApi20002.destroy = function (slot0)
	if NewbieUI.plazaLeftBtnRank then
		slot3 = NewbieUI.plazaLeftBtnRank
		slot5 = slot0

		NewbieUI.plazaLeftBtnRank.getClickSignal(slot2).remove(slot2, NewbieUI.plazaLeftBtnRank.getClickSignal(slot2), slot0.onRankClick)
	end

	slot3 = slot0

	BaseNewbieApi.destroy(slot2)
end

return
