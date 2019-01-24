QznnbController = class("QznnbController")

QznnbController.ctor = function (slot0, slot1)
	slot0.model = slot1

	ClassUtil.extends(slot0, BaseGameController)
	ClassUtil.extends(slot0, TickBase)
	slot0.model:setSwitchStatePos({
		onX = 159.15,
		offX = 83
	})
	slot0:loadTexture()
end

QznnbController.registerListeners = function (slot0)
	BaseGameController.registerListeners(slot0)
	slot0:startTick(3)
end

QznnbController.canceledListeners = function (slot0)
	BaseGameController.canceledListeners(slot0)
	slot0:stopTick()
end

QznnbController.loadTexture = function (slot0)
	resMgr:loadTextureAtlas(slot0:getSpriteSheetPath("plist_qznnb_font.plist"), true)
end

QznnbController.onEnterBackground = function (slot0)
	BaseGameController.onEnterBackground(slot0)

	if slot0.model:getCurShowingViewType() == VIEW_TYPE_BATTLE then
		if slot0.model:getMyUserData() and (slot1.cbUserStatus == US_READY or slot1.cbUserStatus == US_SIT) then
			reqStandUp(true)
		else
			slot0.needStandUpForEnterBg = true
		end
	end
end

QznnbController.onEnterForeground = function (slot0)
	BaseGameController.onEnterForeground(slot0)

	if slot0._enterForeground and slot0.needStandUpForEnterBg and socketMgr:isConnected(SOCKET_TYPE_ROOM) then
		slot0:reqStandUpForEnterBg()
	end
end

QznnbController.reqStandUpForEnterBg = function (slot0)
	if slot0.needStandUpForEnterBg then
		slot1 = slot0.model:getMyUserData()

		if slot0.model:getCurShowingViewType() == VIEW_TYPE_BATTLE and slot1.cbUserStatus == US_SIT then
			reqStandUp(true)
		end

		slot0.needStandUpForEnterBg = false
	end
end

QznnbController.resetBattle = function (slot0, slot1)
	slot0:hideAllBattleChildrenViews()
	slot0.model:setMyTableUserData({})
	slot0.model:setGameState(QZNNB_GAME_SCENE_FREE)
end

QznnbController.tick = function (slot0)
	if slot0.model:getMyUserData() and slot0.model:getPlayerCdsDic()[slot1.wChairID] then
		slot5 = slot0.model:getGameState()

		if tickMgr:getDeltaToServerTime(slot3.endT) <= 0 then
			if slot5 == QZNNB_GAME_SCENE_FREE or slot5 == QZNNB_GAME_SCENE_END then
				slot0:requestReady()
			elseif slot5 == QZNNB_GAME_SCENE_BANK then
				slot0:requestCallBankState(0)
			elseif slot5 == QZNNB_GAME_SCENE_BET then
				slot0:reqquestBet(1)
			elseif slot5 == QZNNB_GAME_STATE_SENDCARD or slot5 == QZNNB_GAME_STATE_OPENCARD then
				slot0:requestOpenCard()
			end

			slot0:setCd(slot1.wChairID, nil)
		elseif slot4 <= 2 then
			if slot5 == QZNNB_GAME_SCENE_FREE or slot5 == QZNNB_GAME_SCENE_END then
				return
			end

			slot4 = math.ceil(slot4)

			if slot3 and slot4 ~= slot3.restT then
				slot3.restT = slot4

				slot0:playGameEffect("effect/effect_warning.mp3")
			end
		end
	end
end

QznnbController.hideAllBattleChildrenViews = function (slot0, slot1)
	if not slot1 then
		slot0.model:setIsShowingBank(false)
		slot0.model:setIsShowingSetting(false)
		slot0.model:setIsShowingMenu(false)
		slot0.model:setIsShowingRule(false)
	end

	slot0.model:setIsShowingBanker(false)
	slot0.model:setIsShowingWin(false)
	slot0.model:setIsShowingBattle(false)
	slot0.model:setIsShowingCallBanker(false)
	slot0.model:setIsShowingReady(false)
	slot0.model:setIsShowingBetMoney(false)
	slot0.model:setIsShowingBet(false)
	slot0.model:setCanShowTanPai(false)
	slot0.model:setCanShowStart(false)
end

QznnbController.setCd = function (slot0, slot1, slot2, slot3)
	slot4 = (slot3 and {}) or slot0.model:getPlayerCdsDic()

	if slot1 then
		if not slot2 or slot2 <= 0 then
			slot4[slot1] = nil
		else
			slot4[slot1] = {
				hasStart = false,
				endT = tickMgr:getServerTime() + slot2,
				durationS = slot2
			}
		end

		slot5 = slot0.model:getMyTableUserData()

		if slot1 == Hero:getWChairID() and slot5[1] and slot5[1].cbUserStatus == US_SIT then
			slot0.model:setTipType(1, true)
			slot0.model:setIsShowingCd(false)
		end
	end

	slot0.model:setPlayerCdsDic(slot4, true)
end

QznnbController.playGameMusic = function (slot0)
	slot0:playMusic("bgm/bgm_bg.mp3")
end

QznnbController.destroy = function (slot0)
	slot0.model = nil
end

return
