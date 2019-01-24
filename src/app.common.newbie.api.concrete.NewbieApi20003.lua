slot2 = "NewbieApi20003"
NewbieApi20003 = class(slot1)

NewbieApi20003.ctor = function (slot0)
	slot4 = BaseNewbieApi

	ClassUtil.extends(slot2, slot0)

	slot0._rankTabSize = {
		w = 320,
		h = 60
	}
	slot5 = slot0.onRankShowComplete

	slot0.registerAndCacheEvent(slot2, slot0, GameEvent.PLAZA_RANK_SHOW_COMPLETE)
end

NewbieApi20003.start = function (slot0)
	return
end

NewbieApi20003.onRankShowComplete = function (slot0)
	if NewbieUI.rankViewTab1 then
		slot12 = -20

		slot0._maskView.show(slot2, slot0._maskView, NewbieUI.rankViewTab1, nil, slot0._rankTabSize.w, slot0._rankTabSize.h, nil, nil, 0, 0)

		slot5 = slot0.onRankChangeTab

		slot0.registerAndCacheEvent(slot2, slot0, GameEvent.PLAZA_RANK_CHANGE_TAB)
	else
		slot3 = slot0

		slot0.finishNewbie(slot2)

		return true
	end
end

NewbieApi20003.onRankChangeTab = function (slot0)
	slot3 = slot0

	slot0.finish(slot2)
end

NewbieApi20003.destroy = function (slot0)
	slot3 = slot0

	BaseNewbieApi.destroy(slot2)
end

return
