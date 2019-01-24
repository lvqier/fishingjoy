slot2 = "PdkReportOutPukeAnimateCcsView"
PdkReportOutPukeAnimateCcsView = class(slot1)

PdkReportOutPukeAnimateCcsView.onCreationComplete = function (slot0)
	slot5 = slot0

	slot0.model.curIdxChangedSignal.add(slot2, slot0.model.curIdxChangedSignal, slot0.onCurIdxChanged)

	slot0._spineTbl = {}
	slot3 = slot0

	slot0.callFeijiParticle(slot2)
end

PdkReportOutPukeAnimateCcsView.onCurIdxChanged = function (slot0)
	slot1 = pairs
	slot3 = slot0._spineTbl or {}

	for slot4, slot5 in slot1(slot2) do
		slot9 = slot5

		spPoolMgr.put(slot7, spPoolMgr)
	end

	slot0._spineTbl = {}
	slot3 = slot0.model

	if not slot0.model.getStartReplay(slot2) then
		return
	end

	slot3 = slot0.controller

	if not slot0.controller.curIdxInBattle(slot2) then
		return
	end

	slot3 = slot0.controller
	slot1, slot2, slot3 = slot0.controller.getCurIdxOutCardInfo(slot2)

	if slot1 == nil then
		slot12 = (slot3 == 0 and {
			"effect/0/effect_0_guo.mp3",
			"effect/0/effect_0_guo2.mp3",
			"effect/0/effect_0_pass.mp3",
			"effect/0/effect_0_buyao1.mp3",
			"effect/0/effect_0_buyao2.mp3",
			"effect/0/effect_0_yaobuqi1.mp3",
			"effect/0/effect_0_yaobuqi2.mp3"
		}) or {
			"effect/1/effect_1_guo.mp3",
			"effect/1/effect_1_pass.mp3",
			"effect/1/effect_1_buyao.mp3",
			"effect/1/effect_1_yaobuqi.mp3"
		}
		slot11 = (slot3 == 0 and ) or [math.random(slot8, table.nums(slot11))]

		slot0.controller.playGameEffect(1, slot0.controller)

		return
	end

	if slot1.ct == PDK_CT_ERROR then
		return
	end

	slot4 = nil

	if slot1.ct < 4 then
		slot11 = slot1.dot
		slot4 = string.format(slot6, "effect/%d/effect_%d_%d_%d.mp3", slot3, slot3, slot1.ct)
	elseif slot1.ct < 13 then
		slot10 = slot1.ct
		slot4 = string.format(slot6, "effect/%d/effect_%d_%d.mp3", slot3, slot3)
	elseif slot1.ct < 15 then
		slot9 = slot3
		slot4 = string.format(slot6, "effect/%d/effect_%d_6.mp3", slot3)
	end

	slot8 = slot4

	slot0.controller.playGameEffect(slot6, slot0.controller)

	if PDK_SPECIALCT_TXT[slot1.ct] then
		function slot10()
			return
		end

		slot6 = slot0.controller.createSpineWithEvent(slot7, slot0.controller, PDK_SPECIALCT_TXT[slot5])
		slot9 = slot6
		slot14 = slot0["pos" .. slot2]

		slot6.setPosition(slot0.controller, cc.p(slot0["pos" .. slot2].getPosition(slot2)))

		slot11 = 10

		slot0.addChild(slot0.controller, slot0, slot6)

		slot0._spineTbl[PDK_SPECIALCT_TXT[slot5]] = slot6
	end

	if PDK_SPECIALCT_EFFECT[slot5] then
		function slot10()
			return
		end

		slot6 = slot0.controller.createSpineWithEvent(slot7, slot0.controller, PDK_SPECIALCT_EFFECT[slot5])
		slot9 = slot6
		slot14 = slot0.pos0

		slot6.setPosition(slot0.controller, cc.p(slot0.pos0.getPosition(slot13)))

		slot11 = 10

		slot0.addChild(slot0.controller, slot0, slot6)

		slot0._spineTbl[PDK_SPECIALCT_EFFECT[slot5]] = slot6

		if PDK_SPECIALCT_EFFECT[slot5] == "pdkfeiji" then
			slot9 = slot0

			slot0.startFeijiCallTick(slot8)
		elseif PDK_SPECIALCT_EFFECT[slot5] == "pdkzhadan" then
			slot9 = slot6
			slot12 = slot2

			slot6.setSkin(slot8, tostring(slot11))
		end
	end
end

PdkReportOutPukeAnimateCcsView.stopFeijiCallTick = function (slot0)
	if slot0._callFeijiTick then
		slot3 = slot0._callFeijiTick

		slot0._callFeijiTick.destroy(slot2)

		slot0._callFeijiTick = nil
	end
end

PdkReportOutPukeAnimateCcsView.startFeijiCallTick = function (slot0)
	slot3 = slot0

	slot0.stopFeijiCallTick(slot2)

	slot7 = slot0.callFeijiParticle
	slot6 = -1
	slot0._callFeijiTick = tickMgr.delayedCall(slot2, tickMgr, handler(slot5, slot0), 40)
	slot3 = slot0._callFeijiTick

	slot0._callFeijiTick.start(slot2)

	slot3 = slot0

	slot0.callFeijiParticle(slot2)
end

PdkReportOutPukeAnimateCcsView.callFeijiParticle = function (slot0)
	if slot0._spineTbl.pdkfeiji then
		slot4 = slot1

		if not tolua.isnull(slot3) and slot1.getBoneData then
			slot5 = "pdkfeijipenqiwei"
			slot7 = slot1.getBoneData(slot3, slot1).y + 375

			slot0.particle.setPosition(slot1, slot0.particle, slot1.getBoneData(slot3, slot1).x + 667)

			slot5 = slot0.particle

			if not slot0.particle.isVisible(slot1) then
				slot6 = true

				slot0.particle.setVisible(slot4, slot0.particle)

				slot6 = cc.POSITION_TYPE_FREE

				slot0.particle.p1.setPositionType(slot4, slot0.particle.p1)

				slot6 = cc.POSITION_TYPE_FREE

				slot0.particle.p2.setPositionType(slot4, slot0.particle.p2)

				slot5 = slot0.particle.p1

				slot0.particle.p1.resetSystem(slot4)

				slot5 = slot0.particle.p2

				slot0.particle.p2.resetSystem(slot4)
			end
		end
	else
		slot5 = false

		slot0.particle.setVisible(slot3, slot0.particle)

		slot5 = cc.POSITION_TYPE_RELATIVE

		slot0.particle.p1.setPositionType(slot3, slot0.particle.p1)

		slot5 = cc.POSITION_TYPE_RELATIVE

		slot0.particle.p2.setPositionType(slot3, slot0.particle.p2)

		slot4 = slot0.particle.p1

		slot0.particle.p1.stopSystem(slot3)

		slot4 = slot0.particle.p2

		slot0.particle.p2.stopSystem(slot3)
	end
end

return
