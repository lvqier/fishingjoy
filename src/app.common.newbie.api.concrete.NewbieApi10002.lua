slot2 = "NewbieApi10002"
NewbieApi10002 = class(slot1)

NewbieApi10002.ctor = function (slot0)
	slot4 = BaseNewbieApi

	ClassUtil.extends(slot2, slot0)

	slot0._toSubGameType = nil
	slot0._toGameKind = nil
	slot5 = slot0.onSubGameBtnShowComplete

	slot0.registerAndCacheEvent(slot2, slot0, GameEvent.PLAZA_SUB_GAME_BTN_SHOW_COMPLETE)

	slot5 = slot0.onBegin2ShowGame

	slot0.registerAndCacheEvent(slot2, slot0, GameEvent.BEGIN_2_SHOW_GAME_MODULE)
end

NewbieApi10002.start = function (slot0)
	CcsScrollView.CAN_ALL_SCROLL = false
	slot3 = Hero
	slot0._toGameKind = Hero.getNewbie2GameKind(false)
	slot3 = "c_gameconfig"

	if getCSVField(false)[slot0._toGameKind] then
		slot0._toSubGameType = slot1.gameType
	else
		slot4 = slot0

		slot0.finishNewbie(slot3)
	end
end

NewbieApi10002.onSubGameBtnShowComplete = function (slot0, slot1, slot2)
	if slot0._toSubGameType == slot2 and slot1.getGameKind then
		slot5 = slot1

		if slot1.getGameKind(slot4) == slot0._toGameKind then
			slot3 = -45

			if slot2 == 4 then
				slot3 = 30
			end

			slot15 = -57

			slot0._maskView.show(slot5, slot0._maskView, slot1, nil, 262, 146, -8, -8, slot3, nil)
		end
	end
end

NewbieApi10002.onBegin2ShowGame = function (slot0, slot1)
	slot4 = slot0

	slot0.finish(slot3)
end

NewbieApi10002.destroy = function (slot0)
	CcsScrollView.CAN_ALL_SCROLL = true
	slot3 = slot0

	BaseNewbieApi.destroy(true)
end

return
