HlssmJettonCcsView = class("HlssmJettonCcsView")

HlssmJettonCcsView.onCreationComplete = function (slot0)
	slot0._spRes = {
		[slot0.model.jettons[5]] = "common/Hlssm_Battle_cmX1.png",
		[slot0.model.jettons[4]] = "common/Hlssm_Battle_cmX2.png",
		[slot0.model.jettons[3]] = "common/Hlssm_Battle_cmX3.png",
		[slot0.model.jettons[2]] = "common/Hlssm_Battle_cmX4.png",
		[slot0.model.jettons[1]] = "common/Hlssm_Battle_cmX5.png"
	}
	slot0._startPosX = {
		[slot0.model.jettons[5]] = 632,
		[slot0.model.jettons[4]] = 757,
		[slot0.model.jettons[3]] = 880,
		[slot0.model.jettons[2]] = 1004,
		[slot0.model.jettons[1]] = 1122
	}
	slot0._startPosY = 67.5
	slot0._endPos = {
		[0] = cc.p(350, 380),
		cc.p(666, 444),
		cc.p(967, 380),
		cc.p(526, 300),
		cc.p(800, 300),
		cc.p(666, 300),
		cc.p(376, 526),
		cc.p(944, 526)
	}
	slot0._range = {
		[0] = cc.p(80, 30),
		cc.p(50, 25),
		cc.p(80, 30),
		cc.p(35, 30),
		cc.p(35, 30),
		cc.p(35, 30),
		cc.p(50, 25),
		cc.p(50, 25)
	}
	slot0._startPos = cc.p(214, 174)
	slot0._randomStartPos = {
		cc.p(-100, 0),
		cc.p(-100, 325),
		cc.p(-100, 750),
		cc.p(1434, 0),
		cc.p(1434, 325),
		cc.p(1434, 750)
	}
	slot0._bankerPos = cc.p(587, 670)
	slot0._userPos = cc.p(700, 351)
	slot0._myPos = cc.p(55, 80)
	slot0._jettonShowActionNum = 0
	slot0._jettonTbl = {}
	slot0._effectTimer = TimerBase.new(handler(slot0, slot0.tick), 50, -1, "HlssmJettonCcsView:_effectTimer")
	slot0._effectTimer.autoDispose = false

	slot0._effectTimer:reset()

	slot0.m_desktopBets = {}
	slot0.m_timers = {}
end

HlssmJettonCcsView.reset = function (slot0)
	slot0._jettonTbl = {}

	slot0._effectTimer:reset()
	slot0:removeAllChildren()

	for slot4 = 0, 7, 1 do
		slot0.m_desktopBets[slot4] = {}
	end

	for slot4, slot5 in ipairs(slot0.m_timers) do
		slot5:stop()
		slot5:destroy()

		slot5 = nil
	end

	slot0.m_timers = {}
end

HlssmJettonCcsView.setTableGoldMove = function (slot0, slot1, slot2)
	if slot0._spRes[slot2] then
		table.insert(slot0._jettonTbl, {
			areaIndex = slot1,
			score = slot2
		})
	else
		for slot7, slot8 in ipairs(slot3) do
			if slot8 <= slot2 then
				for slot13 = 1, math.floor(slot2 / slot8), 1 do
					table.insert(slot0._jettonTbl, {
						areaIndex = slot1,
						score = slot8
					})
				end

				slot2 = slot2 % slot8
			end
		end
	end

	if slot0.model:getGameStatus() == HLSSM_GAME_SCENE_BET then
		slot0._effectTimer:start()
	else
		slot0._effectTimer:reset()

		for slot7 = 1, #slot0._jettonTbl, 1 do
			slot0:tick(nil, nil, true)
		end
	end
end

HlssmJettonCcsView.tick = function (slot0, slot1, slot2, slot3)
	slot4 = slot0.model:getGameStatus()

	if not slot3 and slot4 ~= HLSSM_GAME_SCENE_BET then
		slot0._effectTimer:reset()

		for slot8 = 1, #slot0._jettonTbl, 1 do
			slot0:tick(nil, nil, true)
		end

		return
	end

	if not slot0._jettonTbl[1] then
		slot0._effectTimer:reset()

		return
	end

	slot6 = slot0._jettonTbl[1].score

	table.remove(slot0._jettonTbl, 1)

	if slot0._jettonTbl[1].areaIndex < 0 or slot5 > 8 then
		print("error setTableGoldMove", slot5)

		return
	end

	slot10 = slot0.controller
	slot10 = display.newSprite(slot0.controller.getUIPath)

	slot10:setPosition(slot0._startPos)
	slot0:addChild(slot10)

	slot15 = cc.p(slot0._endPos[slot5].x + math.random(-slot0._range[slot5].x, slot0._spRes[slot6] or slot0._spRes[1000]), slot0._endPos[slot5].y + math.random(-slot0._range[slot5].y, slot12))
	slot16 = math.random(1, 300) / 1000

	if not slot3 then
		if slot0.model.jettons[2] <= slot6 then
			slot0.controller:playGameEffect(Hlssm_sound_Bet)
		else
			slot0.controller:playGameEffect(Hlssm_sound_Bet)
		end

		slot10:runAction(cc.Sequence:create(cc.DelayTime:create(slot16), cc.EaseSineIn:create(cc.MoveTo:create(0.5, slot15))))
	else
		slot10:setPosition(slot15)
	end

	slot0.m_desktopBets[slot5] = slot0.m_desktopBets[slot5] or {}

	table.insert(slot0.m_desktopBets[slot8], slot10)

	slot17 = #slot0._jettonTbl

	if slot1 and slot17 > 20 then
		for slot21 = 1, math.floor(slot17 / 20) * 5, 1 do
			slot0:tick()
		end
	end
end

HlssmJettonCcsView.setMyGoldMove = function (slot0, slot1, slot2)
	slot0.controller:playGameEffect(Hlssm_sound_Bet)

	slot4 = slot1

	if slot0._spRes[slot2] then
		slot6 = display.newSprite(slot5)

		slot6:setPosition(slot7)
		slot0:addChild(slot6, slot3)
		slot6:runAction(slot13)
		table.insert(slot0.m_desktopBets[slot1], slot6)
	end
end

HlssmJettonCcsView.endGoldMove = function (slot0)
	if slot0.controller:getAeraResult() == nil then
		return
	end

	slot2 = slot0.model:getLAllJettonScore()
	slot3 = slot0.model.jettons

	for slot7 = 0, 7, 1 do
		if slot1[slot7] then
			table.insert(slot0.m_timers, tickMgr:delayedCall(function ()
				slot1 = slot2.controller:computeScore2Bet(slot0[slot1] or 0)
				slot2 = false

				for slot6 = 1, 5, 1 do
					for slot10 = 1, slot1[slot6], 1 do
						if slot10 > 4 then
							break
						end

						slot12 = nil

						if slot2._spRes[slot3[slot6]] == nil then
							return
						end

						if display.newSprite(slot2.controller:getUIPath(slot2._spRes[slot11])) == nil then
							return
						end

						slot12:setPosition(cc.p(588, 669))
						slot12:setVisible(false)
						slot12:runAction(cc.Sequence:create(cc.DelayTime:create(slot16), cc.Show:create(), cc.EaseSineOut:create(cc.MoveTo:create(0.2, cc.p(slot2._endPos[slot1].x + math.random(-50, 50), slot2._endPos[slot1].y + math.random(-25, 25))))))
						slot2:addChild(slot12)
						table.insert(slot2.m_desktopBets[slot1], slot12)
					end
				end

				if slot2 then
					slot2.controller:playGameEffect(Hlssm_sound_Bet)
				end
			end, 1100))
		else
			table.insert(slot0.m_timers, tickMgr:delayedCall(function ()
				slot2 = false
				slot3 = false

				for slot7, slot8 in ipairs(slot1) do
					if slot8 ~= nil then
						slot3 = true

						slot8:runAction(cc.Sequence:create(cc.DelayTime:create(slot9), cc.MoveTo:create(0.2, cc.p(588, 669)), cc.CallFunc:create(function ()
							if not slot0 then
								if slot1.particle1 == nil then
									slot0 = cc.ParticleSystemQuad:create(ResConfig.getPartilePlist("duorenshourulizi.plist"))

									slot0:setPosition(slot2._bankerPos)
									slot0.setPosition:addChild(slot0)
									slot0:setLocalZOrder(100)
									slot0:setScale(0.1)

									slot0.setScale.particle1 = slot0
								end

								slot1.particle1:resetSystem()
								slot1.particle1:setVisible(true)
							end
						end), cc.Hide:create()))
					end
				end

				if slot3 then
					slot0.controller:playGameEffect(Hlssm_sound_Bet)
				end

				slot0.m_desktopBets[slot1] = {}
			end, 300))
		end
	end

	table.insert(slot0.m_timers, tickMgr:delayedCall(function ()
		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7 > 0 and slot1[slot6] then
				print("######## 玩家赢钱：", slot8)
				print_r(slot9)

				slot10 = false

				for slot14 = 1, 5, 1 do
					for slot18 = 1, slot9[slot14], 1 do
						slot10 = true
						slot20 = nil

						if slot0._spRes[slot2[slot14]] == nil then
							return
						end

						if display.newSprite(slot0.controller:getUIPath(slot0._spRes[slot19])) == nil then
							return
						end

						slot20:setPosition(slot23)
						slot20:runAction(cc.Sequence:create(cc.DelayTime:create(slot24), cc.EaseSineOut:create(cc.MoveTo:create(0.2, slot0._myPos)), cc.CallFunc:create(function ()
							if slot0.particle2 == nil then
								slot0 = cc.ParticleSystemQuad:create(ResConfig.getPartilePlist("duorenshourulizi.plist"))

								slot0:setPosition(slot1._myPos)
								slot0:addChild(slot0)
								slot0:setLocalZOrder(100)
								slot0:setScale(0.1)

								slot0.particle2 = slot0
							end

							slot0.particle2:resetSystem()
							slot0.particle2.resetSystem.particle2:setVisible(true)
						end), cc.Hide:create()))
						slot0:addChild(slot20)
					end
				end

				if slot10 then
					slot0.controller:playGameEffect(Hlssm_sound_Bet)
				end
			end
		end

		slot3 = 0
		slot4 = false

		for slot8 = 0, 7, 1 do
			slot10 = false

			for slot14, slot15 in ipairs(slot9) do
				if slot15 ~= nil then
					slot10 = true

					slot15:runAction(cc.Sequence:create(cc.DelayTime:create(slot16), cc.MoveTo:create(0.2, cc.p(216, 173)), cc.CallFunc:create(function ()
						slot0 = slot0:getParent().btnOnline

						if not slot0 and slot0.particle then
							slot0.particle:resetSystem()
							slot0.particle:setVisible(true)
						end
					end), cc.Hide:create()))
				end
			end

			if slot10 then
				slot0.controller:playGameEffect(Hlssm_sound_Bet)
			end

			if slot1[slot8] then
				slot11 = slot3[slot8] or 0
				slot11 = slot11 * slot0.controller:getAreaRate(slot8)
				slot12 = (slot8 == HLSSM_AREA_ZHUANG and 0.02) or 0

				if IS_HL_VERSION then
					slot12 = 0.05
				end

				slot3 = slot3 + slot11 * (1 - slot12)
			end
		end

		table.insert(slot0.m_timers, tickMgr:delayedCall(function ()
			slot0:playBetEnterParticle(slot0)
		end, 100))
	end, 1300))
end

HlssmJettonCcsView.playBetEnterParticle = function (slot0, slot1)
	if slot1 ~= nil and slot1 > 0 then
		if slot0:getParent().btnOnline.particle == nil then
			slot3 = cc.ParticleSystemQuad:create(ResConfig.getPartilePlist("duorenshourulizi.plist"))

			slot3:setPosition(slot2:getContentSize().width * 0.5, slot2:getContentSize().height * 0.5)
			slot2:addChild(slot3)
			slot3:setScale(0.1)

			slot2.particle = slot3
		end

		slot2.particle:resetSystem()
		slot2.particle:setVisible(true)

		slot3 = nil

		slot2.text_tf:setHtmlText((not IS_HL_VERSION or HtmlUtil.createArtNumDP(slot1 / 100, "#hlssm_xian_win_%s.png")) and HtmlUtil.createArtNumDotSign(slot1, "#hlssm_xian_win_%s.png"), true)

		if not slot2.text_tf._initPos then
			slot2.text_tf._initPos = cc.p(slot2.text_tf:getPosition())
		end

		slot2.text_tf:setPosition(slot2.text_tf._initPos)
		slot2.text_tf:setOpacity(255)
		slot2.text_tf:runAction(cc.Sequence:create(cc.DelayTime:create(0.01), cc.Show:create(), cc.MoveBy:create(0.1, cc.p(0, 20)), cc.CallFunc:create(function ()
			slot0.controller:playGameEffect(Hlssm_sound_XianWin)

			if slot1.spine == nil then
				slot0 = spPoolMgr:get("duorenjsshanguang")

				slot0:setPosition(38, 105)
				slot0.setPosition:addChild(slot0)

				slot0.setPosition.addChild.spine = slot0
			end

			slot1.spine:setAnimation(0, "animation", false)
		end), cc.DelayTime:create(0.5), cc.Spawn:create(cc.MoveBy:create(0.1, cc.p(0, 10)), cc.FadeTo:create(0.1, 0))))
	end
end

return
