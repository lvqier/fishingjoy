slot2 = "SlwhJettonCcsView"
SlwhJettonCcsView = class(slot1)

SlwhJettonCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot0._layerView = slot0.view
	slot0._layerJetton = slot0.view.layer_jetton
	slot0.layerAnimal = slot0.view.layer_animal
	slot0._baseBetButtonIndex = 100
	slot0._upperBetButtonIndex = 106
	slot0._baseAreaButtonIndex = 0
	slot0._upperAreaButtonIndex = 16
	slot0._areaComponent = {}

	for slot4 = 1, 15, 1 do
		slot8 = {
			playerBet = -1,
			totalBet = -1,
			rewardTimes = -1
		}

		table.insert(slot6, slot0._areaComponent)
	end

	slot0._buttonComponent = {}

	for slot4 = 1, 5, 1 do
		slot8 = -1

		table.insert(slot6, slot0._buttonComponent)
	end

	slot0._currentSelectButton = -1
	slot0._layerJettonChild = {
		slot0._layerJetton.btnJetton_1,
		slot0._layerJetton.btnJetton_2,
		slot0._layerJetton.btnJetton_3,
		slot0._layerJetton.btnJetton_4,
		slot0._layerJetton.btnJetton_5
	}
	slot1 = pairs
	slot3 = slot0._layerJettonChild or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5 then
			if not slot5.betBtnSpine then
				slot10 = Tree.root .. "effect/slwh_xzgd.atlas"
				slot5.betBtnSpine = sp.SkeletonAnimation.create(slot7, sp.SkeletonAnimation, Tree.root .. "effect/slwh_xzgd.json")
				slot11 = true

				slot5.betBtnSpine.setAnimation(slot7, slot5.betBtnSpine, 0, "animation")

				slot10 = 16

				slot5.betBtnSpine.setPosition(slot7, slot5.betBtnSpine, 0)

				slot9 = slot5.betBtnSpine

				slot0._layerJetton["betBtnEffect_" .. slot4].addChild("betBtnEffect_" .. slot4, slot0._layerJetton["betBtnEffect_" .. slot4])

				slot9 = false

				slot5.betBtnSpine.setVisible("betBtnEffect_" .. slot4, slot5.betBtnSpine)
			end

			if not slot5.betBtnParticle then
				slot9 = Tree.root .. "particle/slwh_cmlightlizi.plist"
				slot5.betBtnParticle = cc.ParticleSystemQuad.create(slot7, cc.ParticleSystemQuad)
				slot10 = 16

				slot5.betBtnParticle.setPosition(slot7, slot5.betBtnParticle, 0)

				slot9 = slot5.betBtnParticle

				slot0._layerJetton["betBtnEffect_" .. slot4].addChild("betBtnEffect_" .. slot4, slot0._layerJetton["betBtnEffect_" .. slot4])

				slot9 = false

				slot5.betBtnParticle.setVisible("betBtnEffect_" .. slot4, slot5.betBtnParticle)
			end
		end
	end

	slot4 = slot0._layerJetton.btnJetton_1
	slot4 = slot0._layerJetton.btnJetton_2
	slot4 = slot0._layerJetton.btnJetton_3
	slot4 = slot0._layerJetton.btnJetton_4
	slot4 = slot0._layerJetton.btnJetton_5
	slot2 = slot0._layerJetton.btnJetton_5.getPositionY(slot3)
	slot0._layerJettonChildPositionY = {
		slot0._layerJetton.btnJetton_1.getPositionY(slot3),
		slot0._layerJetton.btnJetton_2.getPositionY(slot3),
		slot0._layerJetton.btnJetton_3.getPositionY(slot3),
		slot0._layerJetton.btnJetton_4.getPositionY(slot3),
		slot2
	}
	slot6 = slot0

	TreeEventDispatcher.addEventListener(slot2, TreeEventDispatcher, Tree.Event.gameOver, slot0.notifyGameOver)

	slot6 = slot0

	TreeEventDispatcher.addEventListener(slot2, TreeEventDispatcher, Tree.Event.gameBet, slot0.notifyJetton)

	slot6 = slot0

	TreeEventDispatcher.addEventListener(slot2, TreeEventDispatcher, Tree.Event.gameBetContinue, slot0.notifyJettonContinue)

	slot6 = slot0

	TreeEventDispatcher.addEventListener(slot2, TreeEventDispatcher, Tree.Event.closeJettonView, slot0.notifyCloseView)

	slot6 = slot0

	TreeEventDispatcher.addEventListener(slot2, TreeEventDispatcher, Tree.Event.cancelAllBets, slot0.onCancelAllBets)

	slot6 = slot0

	TreeEventDispatcher.addEventListener(slot2, TreeEventDispatcher, Tree.Event.closeGame, slot0.exitGame)
end

SlwhJettonCcsView.replaceJettonPanel = function (slot0)
	for slot4 = 1, 5, 1 do
		slot8 = slot4
		slot10 = 1

		slot0._layerView.layer_jetton["btnJetton_" .. slot4].loadTexture("btnJetton_" .. slot4, slot0._layerView.layer_jetton["btnJetton_" .. slot4], string.format(slot6, "slwh_jetton_%d_n.png"))
	end

	slot5 = 1

	slot0._layerView.btnCancel.loadTexture(slot2, slot0._layerView.btnCancel, "button_cancel.png")

	slot5 = 1

	slot0._layerView.btnContinue.loadTexture(slot2, slot0._layerView.btnContinue, "button_continue.png")

	slot5 = 1

	slot0._layerView.btnClose.loadTexture(slot2, slot0._layerView.btnClose, "button_close.png")

	slot1 = slot0._layerView.layer_animal

	for slot5 = 1, 15, 1 do
		slot9 = slot5
		slot11 = 1

		slot1["btnBet_" .. slot5].loadTexture(slot5, slot1["btnBet_" .. slot5], string.format(slot7, "slwh_bet_frame_%d.png"))
	end
end

SlwhJettonCcsView.onCancelAllBets = function (slot0)
	slot3 = slot0

	slot0.updateView(slot2)
end

SlwhJettonCcsView.notifyButtonStatus = function (slot0, slot1, slot2)
	slot8 = state_f
	slot4 = string.format(slot1, "slwh_jetton_%d_%s.png", slot1.getTag(slot4) - slot0._baseBetButtonIndex)
end

SlwhJettonCcsView.updateJettonButton = function (slot0)
	slot5 = Hero
	slot1 = parseInt(Hero.getUserScore(slot4))
	slot4 = slot0.model
	slot2 = slot0.model.getCellScoreArray(Hero.getUserScore)

	for slot6 = 1, 5, 1 do
		slot8 = slot0._layerJettonChild[slot6]
		slot9 = "n"

		if slot1 < slot2[slot6] then
			slot9 = "d"
		end

		slot14 = slot9
		slot15 = 1

		slot8.loadTexture("slwh_jetton_%d_%s.png", slot8, string.format(slot11, "slwh_jetton_%d_%s.png", slot6))
	end

	if slot0._currentSelectButton > 0 and slot1 < slot2[slot0._currentSelectButton] then
		slot3 = slot0._currentSelectButton

		for slot7 = slot0._currentSelectButton - 1, 0, 1 do
			if slot2[slot7] < slot1 then
				slot0._currentSelectButton = slot7

				break
			end
		end

		if slot3 == slot0._currentSelectButton then
			slot0._currentSelectButton = -1
		end
	end

	if slot0._currentSelectButton > 0 then
		slot9 = 1

		slot0._layerJettonChild[slot0._currentSelectButton].loadTexture(slot0._currentSelectButton, slot0._layerJettonChild[slot0._currentSelectButton], string.format(slot4, "slwh_jetton_%d_s.png"))
	end

	slot5 = slot0._jettonMap

	if TreeFunc.checkSumary(slot4) > 0 then
		slot8 = Hero

		if slot3 <= parseInt(Hero.getUserScore(slot7)) then
			slot6 = slot0.model

			if slot0.model.getCanJettonContinue(slot5) == true then
				slot7 = true

				slot0._layerView.btnContinue.setEnabled(slot5, slot0._layerView.btnContinue)

				slot8 = 1

				slot0._layerView.btnContinue.loadTexture(slot5, slot0._layerView.btnContinue, "button_continue.png")
			end
		end
	else
		slot7 = false

		slot0._layerView.btnContinue.setEnabled(slot5, slot0._layerView.btnContinue)

		slot8 = 1

		slot0._layerView.btnContinue.loadTexture(slot5, slot0._layerView.btnContinue, "button_continue_d.png")
	end
end

SlwhJettonCcsView.updateBetBtnPosition = function (slot0)
	if slot0._currentSelectButton == -1 then
		slot1 = pairs
		slot3 = slot0._layerJettonChild or {}

		for slot4, slot5 in slot1(slot2) do
			if slot5 then
				slot9 = slot0._layerJettonChildPositionY[slot4]

				slot5.setPositionY(slot7, slot5)

				slot9 = false

				slot5.betBtnParticle.setVisible(slot7, slot5.betBtnParticle)

				slot9 = false

				slot5.betBtnSpine.setVisible(slot7, slot5.betBtnSpine)
			end
		end
	else
		for slot4 = 1, 5, 1 do
			if slot0._currentSelectButton == slot4 then
				slot7 = slot0._layerJettonChild[slot4]

				if slot0._layerJettonChild[slot4].getPositionY(slot6) == slot0._layerJettonChildPositionY[slot4] then
					slot7 = slot0._layerJettonChild[slot4]

					slot0._layerJettonChild[slot4].stopAllActions(slot6)

					slot7 = slot0._layerJettonChild[slot4]
					slot11 = 0.1
					slot16 = slot0._layerJettonChild[slot4]
					slot15 = slot0._layerJettonChildPositionY[slot4] + 10

					slot0._layerJettonChild[slot4].runAction(slot6, cc.MoveTo.create(slot9, cc.MoveTo, cc.p(slot13, slot0._layerJettonChild[slot4].getPositionX(slot15))))

					slot7 = slot0._layerJettonChild[slot4].betBtnParticle

					slot0._layerJettonChild[slot4].betBtnParticle.resetSystem(slot6)

					slot8 = true

					slot0._layerJettonChild[slot4].betBtnParticle.setVisible(slot6, slot0._layerJettonChild[slot4].betBtnParticle)

					slot8 = true

					slot0._layerJettonChild[slot4].betBtnSpine.setVisible(slot6, slot0._layerJettonChild[slot4].betBtnSpine)
				end
			else
				slot7 = slot0._layerJettonChild[slot4]

				if slot0._layerJettonChild[slot4].getPositionY(slot6) ~= slot0._layerJettonChildPositionY[slot4] then
					slot7 = slot0._layerJettonChild[slot4]

					slot0._layerJettonChild[slot4].stopAllActions(slot6)

					slot7 = slot0._layerJettonChild[slot4]
					slot11 = 0.1
					slot16 = slot0._layerJettonChild[slot4]
					slot15 = slot0._layerJettonChildPositionY[slot4]

					slot0._layerJettonChild[slot4].runAction(slot6, cc.MoveTo.create(slot9, cc.MoveTo, cc.p(slot13, slot0._layerJettonChild[slot4].getPositionX(slot15))))

					slot8 = false

					slot0._layerJettonChild[slot4].betBtnParticle.setVisible(slot6, slot0._layerJettonChild[slot4].betBtnParticle)

					slot8 = false

					slot0._layerJettonChild[slot4].betBtnSpine.setVisible(slot6, slot0._layerJettonChild[slot4].betBtnSpine)
				end
			end
		end
	end
end

SlwhJettonCcsView.updateView = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getCellScoreArray(slot2)

	for slot5 = 1, 5, 1 do
		slot6 = slot0._layerJettonChild[slot5]

		if slot0._buttonComponent[slot5] ~= slot1[slot5] then
			slot0._buttonComponent[slot5] = slot7
			slot10 = slot6.node_jetton

			TreeFunc.extractCacheWithNode(slot9)

			slot11 = slot5
			slot16 = true

			TreeFunc.createSpriteNumberWithShort("jetton_%d_money_%%s", slot7, string.format(slot9, "jetton_%d_money_%%s"), nil, {
				x = 0.5,
				y = 0.5
			}, slot6.node_jetton)
		end
	end

	slot7 = slot0.model
	slot5 = slot0.controller.getOrCreateJettonMap(slot3, slot0.model.getRoomKind(slot6))

	if TreeFunc.checkSumary(slot0.controller) > 0 then
		slot8 = Hero

		if slot3 <= parseInt(Hero.getUserScore(slot7)) then
			slot6 = slot0.model

			if slot0.model.getCanJettonContinue(slot5) == true then
				slot7 = true

				slot0._layerView.btnContinue.setEnabled(slot5, slot0._layerView.btnContinue)

				slot8 = 1

				slot0._layerView.btnContinue.loadTexture(slot5, slot0._layerView.btnContinue, "button_continue.png")
			end
		end
	else
		slot7 = false

		slot0._layerView.btnContinue.setEnabled(slot5, slot0._layerView.btnContinue)

		slot8 = 1

		slot0._layerView.btnContinue.loadTexture(slot5, slot0._layerView.btnContinue, "button_continue_d.png")
	end

	slot0._jettonMap = slot2
	slot4 = slot0._layerView.layer_animal
	slot5 = slot0.model.getAreaUserBetArray(slot6)
	slot6 = slot0.model.getAreaTotalBetArray(slot0.model)
	slot9 = slot0.model
	slot7 = slot0.model.getAreaBetMultiplyArray(slot0.model)

	for slot11 = 1, 15, 1 do
		slot13 = slot4["btnBet_" .. slot11]
		slot14 = Tree.JettonNumbers[slot11]

		if slot0._areaComponent[slot11].rewardTimes ~= slot7[slot11] then
			slot12.rewardTimes = slot7[slot11]

			TreeFunc.extractCacheWithNode(slot16)

			slot24 = true

			TreeFunc.createSpriteNumber(slot13.node_multiplier, slot12.rewardTimes, slot14[2], nil, {
				x = 0.5,
				y = 0.5
			}, 0, slot13.node_multiplier)
		end

		if slot12.playerBet ~= slot5[slot11] then
			slot12.playerBet = slot5[slot11]

			TreeFunc.extractCacheWithNode(slot16)

			slot23 = true

			TreeFunc.createSpriteNumberWithShortW(slot13.node_self, slot12.playerBet, slot14[1], nil, nil, slot13.node_self)
		end

		if slot12.totalBet ~= slot6[slot11] then
			slot12.totalBet = slot6[slot11]

			TreeFunc.extractCacheWithNode(slot16)

			slot23 = true

			TreeFunc.createSpriteNumberWithShortW(slot13.node_total, slot12.totalBet, slot14[3], nil, nil, slot13.node_total)
		end
	end
end

SlwhJettonCcsView.hide = function (slot0, slot1, slot2)
	slot7 = slot2

	ZoomPopUpChildView.hide(slot4, slot0, slot1)
end

SlwhJettonCcsView.show = function (slot0, slot1, slot2)
	slot7 = slot2

	ZoomPopUpChildView.show(slot4, slot0, slot1)

	slot0._currentSelectButton = -1
	slot5 = slot0

	slot0.updateBetBtnPosition(slot4)

	slot5 = slot0

	slot0.updateView(slot4)

	slot6 = false

	slot0._layerView.btnCancel.setEnabled(slot4, slot0._layerView.btnCancel)

	slot7 = 1

	slot0._layerView.btnCancel.loadTexture(slot4, slot0._layerView.btnCancel, "button_cancel_d.png")
end

SlwhJettonCcsView.notifyCloseView = function (slot0)
	slot4 = false

	slot0.model.setIsShowingJetton(slot2, slot0.model)
end

SlwhJettonCcsView.onBtnClick = function (slot0, slot1, slot2)
	slot5 = slot1
	slot3 = slot1.getTag(slot4)

	if slot1 == slot0._layerView.btnCancel then
		slot7 = false

		slot0._layerView.btnCancel.setEnabled(slot5, slot0._layerView.btnCancel)
		reqSlwhCancelJetton()

		slot8 = 1

		slot0._layerView.btnCancel.loadTexture(slot5, slot0._layerView.btnCancel, "button_cancel_d.png")
	elseif slot1 == slot0._layerView.btnContinue then
		slot7 = false

		slot0._layerView.btnContinue.setEnabled(slot5, slot0._layerView.btnContinue)

		slot8 = 1

		slot0._layerView.btnContinue.loadTexture(slot5, slot0._layerView.btnContinue, "button_continue_d.png")

		slot6 = slot0

		slot0.jettonContinue(slot5)

		slot7 = false

		slot0.model.setCanJettonContinue(slot5, slot0.model)
	elseif slot3 < slot0._upperAreaButtonIndex then
		slot7 = slot1

		slot0.putJettonAnimal(slot5, slot0)
	elseif slot3 < slot0._upperBetButtonIndex then
		slot0._currentSelectButton = slot3 - slot0._baseBetButtonIndex
		slot7 = slot0

		slot0.updateBetBtnPosition(slot6)

		slot7 = slot0

		slot0.updateJettonButton(slot6)
	elseif slot1 == slot0._layerView.btnClose then
		slot6 = slot0

		slot0.notifyCloseView(slot5)
	end
end

SlwhJettonCcsView.putJettonAnimal = function (slot0, slot1)
	slot5 = slot0._baseAreaButtonIndex < slot1.getTag(assert) and slot2 < slot0._upperAreaButtonIndex

	assert(slot1)

	slot2 = slot2 - slot0._baseAreaButtonIndex

	if slot0._currentSelectButton > 0 then
		slot5 = slot0.model
		slot9 = slot0.model.getCellScoreArray(slot4)[slot0._currentSelectButton]

		slot0.requestJetton(slot6, slot0, slot2)
	end
end

SlwhJettonCcsView.requestJetton = function (slot0, slot1, slot2)
	slot7 = slot2

	slot0.model.setCurSelectdGold(slot5, slot0.model)

	slot9 = slot2

	print(slot5, "area->", slot1 - 1, "bet->")

	slot6 = {
		nJettonArea = slot1 - 1,
		lBet = slot2
	}

	reqSlwhJetton(slot5)
end

SlwhJettonCcsView.notifyJetton = function (slot0, slot1)
	slot4 = Hero
	slot2 = Hero.getWChairID(slot3)

	if slot1.cbRet == Tree.JettonRetType.RetType_Success then
		slot4 = slot0._areaComponent[slot1.nArea + 1]
		slot5 = slot0._layerView.layer_animal["btnBet_" .. slot3]
		slot6 = Tree.JettonNumbers[slot1.nArea + 1]

		if slot2 == slot1.wChairID then
			if slot4.playerBet ~= slot1.lJetton then
				slot4.playerBet = slot1.lJetton

				TreeFunc.extractCacheWithNode(slot8)

				slot16 = true

				TreeFunc.createSpriteNumber(slot5.node_self, slot4.playerBet, slot6[1], nil, nil, 0, slot5.node_self)
			end

			slot11 = Hero
			slot11 = parseInt(Hero.getUserScore(slot10)) - slot1.lScore

			Hero.setUserScore(Hero.getUserScore, Hero)

			slot13 = slot0.model
			slot11 = slot0.model.getUserTotalJetton(slot12) + slot1.lScore

			slot0.model.setUserTotalJetton(Hero.getUserScore, slot0.model)

			slot10 = slot0

			slot0.updateJettonButton(Hero.getUserScore)

			slot11 = true

			slot0._layerView.btnCancel.setEnabled(Hero.getUserScore, slot0._layerView.btnCancel)

			slot12 = 1

			slot0._layerView.btnCancel.loadTexture(Hero.getUserScore, slot0._layerView.btnCancel, "button_cancel.png")
		end

		if slot4.totalBet ~= slot1.lTotalJetton then
			slot4.totalBet = slot1.lTotalJetton

			TreeFunc.extractCacheWithNode(slot8)

			slot15 = true

			TreeFunc.createSpriteNumberWithShortW(slot5.node_total, slot4.totalBet, slot6[3], nil, nil, slot5.node_total)
		end
	elseif slot1.cbRet == Tree.JettonRetType.RetType_ReachAreaLimit then
		slot6 = "下注失败,已达区域投注上限"

		tweenMsgMgr.showRedMsg(slot4, tweenMsgMgr)
	elseif slot1.cbRet == Tree.JettonRetType.RetType_ReachPersonalLimit then
		slot6 = "下注失败,已达个人区域投注上限"

		tweenMsgMgr.showRedMsg(slot4, tweenMsgMgr)
	elseif slot1.cbRet == Tree.JettonRetType.RetType_ZhuangXianOnlyOne then
		slot6 = "您不能同时下注庄、闲"

		tweenMsgMgr.showRedMsg(slot4, tweenMsgMgr)
	end
end

SlwhJettonCcsView.notifyJettonContinue = function (slot0, slot1)
	slot4 = slot1

	dump(slot3)

	slot4 = Hero
	slot2 = Hero.getWChairID(slot3)

	if slot1.cbRet == Tree.JettonRetType.RetType_Success then
		for slot6 = 1, 15, 1 do
			slot8 = slot0._areaComponent[slot6]
			slot9 = slot0._layerView.layer_animal["btnBet_" .. slot7]
			slot10 = Tree.JettonNumbers[slot6]

			if slot2 == slot1.wChairID then
				if slot8.playerBet ~= slot1.lBet[slot6] then
					slot8.playerBet = slot1.lBet[slot6]

					TreeFunc.extractCacheWithNode(slot12)

					slot20 = true

					TreeFunc.createSpriteNumber(slot9.node_self, slot8.playerBet, slot10[1], nil, nil, 0, slot9.node_self)
				end

				slot15 = Hero
				slot15 = parseInt(Hero.getUserScore(slot14)) - slot1.lBet[slot6]

				Hero.setUserScore(Hero.getUserScore, Hero)

				slot17 = slot0.model
				slot15 = slot0.model.getUserTotalJetton(slot16) + slot1.lBet[slot6]

				slot0.model.setUserTotalJetton(Hero.getUserScore, slot0.model)

				slot14 = slot0

				slot0.updateJettonButton(Hero.getUserScore)

				slot15 = true

				slot0._layerView.btnCancel.setEnabled(Hero.getUserScore, slot0._layerView.btnCancel)

				slot16 = 1

				slot0._layerView.btnCancel.loadTexture(Hero.getUserScore, slot0._layerView.btnCancel, "button_cancel.png")
			end

			if slot8.totalBet ~= slot1.lTotalJetton[slot6] then
				slot8.totalBet = slot1.lTotalJetton[slot6]

				TreeFunc.extractCacheWithNode(slot12)

				slot19 = true

				TreeFunc.createSpriteNumberWithShortW(slot9.node_total, slot8.totalBet, slot10[3], nil, nil, slot9.node_total)
			end
		end

		slot6 = slot1.lBet

		slot0.model.setCurAreaUserBetOrder(slot4, slot0.model)
	elseif slot1.cbRet == Tree.JettonRetType.RetType_ReachAreaLimit then
		slot6 = "下注失败,已达区域投注上限"

		tweenMsgMgr.showRedMsg(slot4, tweenMsgMgr)
	elseif slot1.cbRet == Tree.JettonRetType.RetType_ReachPersonalLimit then
		slot6 = "下注失败,已达个人区域投注上限"

		tweenMsgMgr.showRedMsg(slot4, tweenMsgMgr)
	elseif slot1.cbRet == Tree.JettonRetType.RetType_ZhuangXianOnlyOne then
		slot6 = "您不能同时下注庄、闲"

		tweenMsgMgr.showRedMsg(slot4, tweenMsgMgr)
	end
end

SlwhJettonCcsView.jettonContinue = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getPreAreaUserBetOrder(slot2)

	for slot5 = 1, 15, 1 do
		if slot1[slot5] == nil then
			slot1[slot5] = 0
		end
	end

	slot4 = slot1

	reqSlwhJettonContinue(slot3)
end

SlwhJettonCcsView.notifyGameOver = function (slot0, slot1)
	slot4 = slot0.controller

	slot0.controller.savePreJettonMap(slot3)
end

SlwhJettonCcsView.exitGame = function (slot0)
	for slot4 = 1, 15, 1 do
		slot0._areaComponent[slot4].rewardTimes = -1
		slot0._areaComponent[slot4].playerBet = -1
		slot0._areaComponent[slot4].totalBet = -1
	end

	for slot4 = 1, 5, 1 do
		slot0._buttonComponent[slot4] = -1
	end
end

SlwhJettonCcsView.destroy = function (slot0)
	slot4 = slot0

	TreeEventDispatcher.clearOneObjEvent(slot2, TreeEventDispatcher)
end

return
