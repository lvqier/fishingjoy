slot2 = "LrnnController"
LrnnController = class(slot1)

LrnnController.ctor = function (slot0, slot1)
	slot0.model = slot1
	slot5 = BaseGameController

	ClassUtil.extends(slot3, slot0)

	slot5 = TickBase

	ClassUtil.extends(slot3, slot0)

	slot5 = {
		onX = 159.15,
		offX = 83
	}

	slot0.model.setSwitchStatePos(slot3, slot0.model)

	slot4 = slot0

	slot0.loadTexture(slot3)
end

LrnnController.registerListeners = function (slot0)
	slot3 = slot0

	BaseGameController.registerListeners(slot2)

	slot4 = 3

	slot0.startTick(slot2, slot0)
end

LrnnController.canceledListeners = function (slot0)
	slot3 = slot0

	BaseGameController.canceledListeners(slot2)

	slot3 = slot0

	slot0.stopTick(slot2)
end

LrnnController.loadTexture = function (slot0)
	slot7 = "plist_lrnn_font.plist"
	slot5 = true

	resMgr.loadTextureAtlas(slot2, resMgr, slot0.getSpriteSheetPath(slot5, slot0))
end

LrnnController.resetBattle = function (slot0)
	slot3 = slot0

	slot0.hideAllBattleChildrenViews(slot2)

	slot4 = {}

	slot0.model.setMyTableUserData(slot2, slot0.model)

	slot4 = LRNN_GAME_SCENE_FREE

	slot0.model.setGameState(slot2, slot0.model)
end

LrnnController.tick = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMyUserData(slot2) then
		slot4 = slot0.model

		if slot0.model.getPlayerCdsDic(slot3)[slot1.wChairID] then
			slot7 = slot3.endT

			if tickMgr.getDeltaToServerTime(slot5, tickMgr) <= 0 then
				slot7 = slot0.model

				if slot0.model.getGameState(slot6) == LRNN_GAME_SCENE_FREE or slot5 == LRNN_GAME_SCENE_END then
					slot8 = slot0

					slot0.requestExitBattle(slot7)
				elseif slot5 == LRNN_GAME_SCENE_BANK then
					slot9 = true

					slot0.requestCallBankState(slot7, slot0)
				elseif slot5 == LRNN_GAME_SCENE_BET then
					slot9 = 1

					slot0.reqquestBet(slot7, slot0)
				elseif slot5 == LRNN_GAME_STATE_SENDCARD or slot5 == LRNN_GAME_STATE_OPENCARD then
					slot8 = slot0

					slot0.requestOpenCard(slot7)
				end

				slot10 = nil

				slot0.setCd(slot7, slot0, slot1.wChairID)
			elseif slot4 <= 2 then
				slot7 = slot4
				slot4 = math.ceil(slot6)

				if slot3 and slot4 ~= slot3.restT then
					slot3.restT = slot4
					slot8 = "effect/effect_warning.mp3"

					slot0.playGameEffect(slot6, slot0)
				end
			end
		end
	end
end

LrnnController.hideAllBattleChildrenViews = function (slot0, slot1)
	if not slot1 then
		slot5 = false

		slot0.model.setIsShowingMenu(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowingRule(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowingSetting(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowingBank(slot3, slot0.model)
	end

	slot5 = false

	slot0.model.setIsShowingWin(slot3, slot0.model)

	slot5 = false

	slot0.model.setIsShowingBattle(slot3, slot0.model)

	slot5 = false

	slot0.model.setIsShowingReady(slot3, slot0.model)

	slot5 = false

	slot0.model.setCanShowTanPai(slot3, slot0.model)

	slot5 = false

	slot0.model.setCanShowStart(slot3, slot0.model)
end

LrnnController.setCd = function (slot0, slot1, slot2, slot3)
	if not slot3 or not {} then
		slot6 = slot0.model
		slot4 = slot0.model.getPlayerCdsDic(slot5)
	end

	if slot1 then
		if not slot2 or slot2 <= 0 then
			slot4[slot1] = nil
		else
			slot8 = tickMgr
			slot4[slot1] = {
				hasStart = false,
				endT = tickMgr.getServerTime(slot7) + slot2,
				durationS = slot2
			}
		end
	end

	slot9 = true

	slot0.model.setPlayerCdsDic(slot6, slot0.model, slot4)
end

LrnnController.playGameMusic = function (slot0)
	slot4 = "bgm/bgm_bg.mp3"

	slot0.playMusic(slot2, slot0)
end

LrnnController.destroy = function (slot0)
	slot0.model = nil
end

return
