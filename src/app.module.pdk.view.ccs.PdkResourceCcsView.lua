slot2 = "PdkResourceCcsView"
PdkResourceCcsView = class(slot1)

PdkResourceCcsView.onCreationComplete = function (slot0)
	slot0._animationConfig = {
		[PDK_CT_SINGLE_LINE] = {
			sound = "effect/SHUNZI.mp3",
			txt = "pdkshunzi"
		},
		[PDK_CT_DOUBLE_LINE] = {
			sound = "effect/LIANDUI.mp3",
			txt = "pdkliandui"
		},
		[PDK_CT_PLANE_TAKE_SINGLE_WING] = {
			txt = "pdkfeijipaixingtext",
			effect = "pdkfeiji",
			sound = "effect/PLANE.mp3"
		},
		[PDK_CT_BOMB_CARD] = {
			sound = "effect/BOMB.mp3",
			effect = "pdkzhadan"
		}
	}
	slot0._animationConfig[PDK_CT_THREE_LINE] = slot0._animationConfig[PDK_CT_PLANE_TAKE_SINGLE_WING]
	slot0._animationConfig[PDK_CT_PLANE_TAKE_PAIR_WING] = slot0._animationConfig[PDK_CT_PLANE_TAKE_SINGLE_WING]
	slot0._spineTbl = {}
	slot0._followEffect = {
		"effect/%d/effect_dani.mp3",
		"effect/%d/effect_guanshang.mp3",
		"effect/%d/effect_yasi.mp3"
	}
	slot0._leaveEffect = {
		"effect/%d/effect_wojiuyi.mp3",
		"effect/%d/effect_zuihouyi.mp3"
	}
	slot0._warningEffect = "effect/TISHICHUPAI-2.mp3"
	slot5 = slot0

	slot0.model.outCardInfoChangedSignal.add(PDK_CT_PLANE_TAKE_PAIR_WING, slot0.model.outCardInfoChangedSignal, slot0.onOutCardInfoChanged)

	slot5 = slot0

	slot0.model.curResultInfoDicChangedSignal.add(PDK_CT_PLANE_TAKE_PAIR_WING, slot0.model.curResultInfoDicChangedSignal, slot0.onCurResultInfoDicChanged)

	slot5 = slot0

	slot0.model.isShowWarningSpineDicChangedSignal.add(PDK_CT_PLANE_TAKE_PAIR_WING, slot0.model.isShowWarningSpineDicChangedSignal, slot0.onIsShowWarningSpineDicChanged)

	slot5 = slot0

	slot0.model.warningEffectDicChangedSignal.add(PDK_CT_PLANE_TAKE_PAIR_WING, slot0.model.warningEffectDicChangedSignal, slot0.onWarningEffectDicChanged)

	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getExitGameSignal(PDK_CT_PLANE_TAKE_PAIR_WING).add(PDK_CT_PLANE_TAKE_PAIR_WING, slot0.model.getExitGameSignal(PDK_CT_PLANE_TAKE_PAIR_WING), slot0.onExitGameSignalChanged)

	slot6 = slot0.onFeijiTimer
	slot6 = "PdkResourceCcsView:_effectTimer"
	slot0._feiJiTimer = TimerBase.new(PDK_CT_PLANE_TAKE_PAIR_WING, handler(slot0.onExitGameSignalChanged, slot0), 40, -1)
	slot0._feiJiTimer.autoDispose = false
	slot3 = slot0._feiJiTimer

	slot0._feiJiTimer.reset(false)

	slot4 = cc.POSITION_TYPE_RELATIVE

	slot0.feiJiParticle.p1.setPositionType(false, slot0.feiJiParticle.p1)

	slot4 = cc.POSITION_TYPE_RELATIVE

	slot0.feiJiParticle.p2.setPositionType(false, slot0.feiJiParticle.p2)

	slot3 = slot0.feiJiParticle.p1

	slot0.feiJiParticle.p1.stopSystem(false)

	slot3 = slot0.feiJiParticle.p2

	slot0.feiJiParticle.p2.stopSystem(false)

	slot4 = false

	slot0.feiJiParticle.setVisible(false, slot0.feiJiParticle)

	slot4 = -1

	slot0.feiJiParticle.setLocalZOrder(false, slot0.feiJiParticle)
end

PdkResourceCcsView.onWarningEffectDicChanged = function (slot0)
	slot1 = slot0.model.getMyTableUserDatasDic(slot2)
	slot4 = slot0.model
	slot2 = slot0.model.getWarningEffectDic(slot0.model)

	for slot6 = PDK_VIEW_CHAIRID_ME, PDK_VIEW_CHAIRID_LEFT, 1 do
		if slot2 and slot2[slot6] then
			slot12 = 1
			slot15 = slot0._leaveEffect
			slot13 = (slot1[slot6] and slot7.wGender) or 0
			slot13 = string.format(slot11, slot0._leaveEffect[math.random(slot11, table.nums(slot14))])

			slot0.controller.playGameEffect(slot11, slot0.controller)

			slot13 = slot0._warningEffect

			slot0.controller.playGameEffect(slot11, slot0.controller)
		end
	end
end

PdkResourceCcsView.onIsShowWarningSpineDicChanged = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getIsShowWarningSpineDic(slot2) or {}
	slot0._spineWarning = slot0._spineWarning or {}

	for slot5 = PDK_VIEW_CHAIRID_RIGHT, PDK_VIEW_CHAIRID_LEFT, 1 do
		if slot1[slot5] then
			if not slot0._spineWarning[slot5] then
				slot9 = "pdkwarning"
				slot6 = slot0.controller.createSpineByPool(slot7, slot0.controller)
				slot12 = true

				slot6.setAnimation(slot0.controller, slot6, 0, "animation")

				slot9 = slot6
				slot7 = slot6.setPosition

				if slot5 == PDK_VIEW_CHAIRID_LEFT then
					slot13 = 445

					if not cc.p(slot11, 211) then
						slot13 = 445
						slot10 = cc.p(slot11, 1122)
					end
				end

				slot7(slot8, slot9)

				slot10 = slot6

				slot0.addChild(slot8, slot0)

				slot0._spineWarning[slot5] = slot6
			end
		elseif slot0._spineWarning[slot5] then
			slot9 = slot0._spineWarning[slot5]

			spPoolMgr.put(slot7, spPoolMgr)

			slot0._spineWarning[slot5] = nil
		end
	end
end

PdkResourceCcsView.onOutCardInfoChanged = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getOutCardInfo(slot2) or not slot1.ct or not slot0.model._recentOutCardUser or slot0.model._isFromReconnect then
		return
	end

	slot4 = slot0.model
	slot3 = (slot0.model.getMyTableUserDatasDic(slot3)[slot0.model._recentTurnUser] and slot2.wGender) or 0
	slot5 = slot1.dot
	slot6 = ""

	if slot1.ct and slot5 then
		if slot4 == PDK_CT_THREE or slot4 == PDK_CT_DOUBLE or slot4 == PDK_CT_SINGLE then
			slot12 = slot5
			slot6 = string.format(slot8, "effect/%d/effect_%d_%d.mp3", slot3, slot4)
		else
			slot11 = slot4
			slot6 = string.format(slot8, "effect/%d/effect_%d.mp3", slot3)
		end

		if slot0.model._isFollowCard then
			if slot4 == PDK_CT_PLANE_TAKE_SINGLE_WING or slot4 == PDK_CT_PLANE_TAKE_PAIR_WING or slot4 == PDK_CT_SINGLE_LINE or slot4 == PDK_CT_DOUBLE_LINE then
				slot12 = slot0._followEffect
				slot12 = slot3
				slot6 = string.format(1, slot0._followEffect[math.random(slot8, table.nums(slot11))], slot3)
			elseif slot4 == PDK_CT_BOMB_CARD and slot0.model._followCt == PDK_CT_BOMB_CARD then
				slot11 = slot4
				slot15 = 2
				slot6 = string.format(slot8, "effect/%d/effect_%d_samefollow%d.mp3", slot3, math.random(slot13, 1))
			end
		end

		slot10 = slot6

		slot0.controller.playGameEffect(slot8, slot0.controller)
	end

	if not (slot1 and slot0._animationConfig[slot1.ct]) then
		slot11 = "effect/CHUPAI.mp3"

		slot0.controller.playGameEffect(slot9, slot0.controller)

		return
	else
		slot11 = slot7.sound

		slot0.controller.playGameEffect(slot9, slot0.controller)
	end

	slot11 = slot1.ct

	print(slot9, "PdkResourceCcsView:onOutCardInfoChanged==========================")

	if slot7.txt then
		slot12 = __emptyFunction
		slot8 = slot0.controller.createSpineWithEvent(slot9, slot0.controller, slot7.txt)
		slot11 = slot8
		slot16 = slot0["pos_" .. slot0.model._recentTurnUser]

		slot8.setPosition(slot0.controller, cc.p(slot0["pos_" .. slot0.model._recentTurnUser].getPosition(slot0.model._recentTurnUser)))

		slot13 = 10

		slot0.addChild(slot0.controller, slot0, slot8)

		slot0._spineTbl[slot7.txt] = slot8
	end

	if slot7.effect then
		slot12 = __emptyFunction
		slot8 = slot0.controller.createSpineWithEvent(slot9, slot0.controller, slot7.effect)
		slot11 = slot8
		slot16 = slot0.pos_0

		slot8.setPosition(slot0.controller, cc.p(slot0.pos_0.getPosition(slot15)))

		slot13 = 10

		slot0.addChild(slot0.controller, slot0, slot8)

		slot0._spineTbl[slot7.effect] = slot8

		if slot7.effect == "pdkfeiji" then
			slot11 = slot0._feiJiTimer

			slot0._feiJiTimer.start(slot10)

			slot11 = slot0

			slot0.onFeijiTimer(slot10)
		elseif slot7.effect == "pdkzhadan" then
			slot11 = slot8
			slot14 = slot0.model._recentTurnUser

			slot8.setSkin(slot10, tostring(slot13))
		end
	end
end

PdkResourceCcsView.onExitGameSignalChanged = function (slot0)
	if slot0._spineTbl then
		slot3 = slot0._spineTbl

		for slot4, slot5 in pairs(slot2) do
			slot9 = slot5

			spPoolMgr.put(slot7, spPoolMgr)
		end

		slot0._spineTbl = {}
	end
end

PdkResourceCcsView.onCurResultInfoDicChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCurResultInfoDic(slot2) and slot1[PDK_VIEW_CHAIRID_ME] then
		slot3 = ""
		slot4 = ""

		if slot1[PDK_VIEW_CHAIRID_ME].beiGuan then
			slot4 = "1"
			slot3 = "pdkfbl"
		elseif slot2.fanGuan then
			slot4 = "2"
			slot3 = "pdkfbl"
		elseif slot2.liuJu then
			slot4 = "3"
			slot3 = "pdkfbl"
		elseif slot2.shuangGuan then
			slot4 = "1"
			slot3 = "pdkdsguan"
		elseif slot2.danGuan then
			slot4 = "2"
			slot3 = "pdkdsguan"
		end

		if slot3 ~= "" then
			slot9 = __emptyFunction
			slot5 = slot0.controller.createSpineWithEvent(slot6, slot0.controller, slot3)
			slot9 = slot4

			slot5.setSkin(slot0.controller, slot5)

			slot11 = false

			slot5.setAnimation(slot0.controller, slot5, 0, "animation")

			slot11 = false

			slot5.addAnimation(slot0.controller, slot5, 0, "idle")

			slot8 = slot5
			slot13 = slot0.pos_0

			slot5.setPosition(slot0.controller, cc.p(slot0.pos_0.getPosition(slot12)))

			slot10 = 10

			slot0.addChild(slot0.controller, slot0, slot5)

			slot0._spineTbl[slot3] = slot5

			if not slot2.liuJu then
				slot9 = "effect/Spring.mp3"

				slot0.controller.playGameEffect(slot7, slot0.controller)
			end
		end
	end
end

PdkResourceCcsView.onFeijiTimer = function (slot0)
	if slot0._spineTbl.pdkfeiji then
		slot4 = slot1

		if not tolua.isnull(slot3) and slot1.getBoneData then
			slot5 = "pdkfeijipenqiwei"
			slot7 = slot1.getBoneData(slot3, slot1).y + 375

			slot0.feiJiParticle.setPosition(slot1, slot0.feiJiParticle, slot1.getBoneData(slot3, slot1).x + 667)

			slot5 = slot0.feiJiParticle

			if not slot0.feiJiParticle.isVisible(slot1) then
				slot6 = true

				slot0.feiJiParticle.setVisible(slot4, slot0.feiJiParticle)

				slot6 = cc.POSITION_TYPE_FREE

				slot0.feiJiParticle.p1.setPositionType(slot4, slot0.feiJiParticle.p1)

				slot6 = cc.POSITION_TYPE_FREE

				slot0.feiJiParticle.p2.setPositionType(slot4, slot0.feiJiParticle.p2)

				slot5 = slot0.feiJiParticle.p1

				slot0.feiJiParticle.p1.resetSystem(slot4)

				slot5 = slot0.feiJiParticle.p2

				slot0.feiJiParticle.p2.resetSystem(slot4)
			end
		end
	else
		slot5 = false

		slot0.feiJiParticle.setVisible(slot3, slot0.feiJiParticle)

		slot5 = cc.POSITION_TYPE_RELATIVE

		slot0.feiJiParticle.p1.setPositionType(slot3, slot0.feiJiParticle.p1)

		slot5 = cc.POSITION_TYPE_RELATIVE

		slot0.feiJiParticle.p2.setPositionType(slot3, slot0.feiJiParticle.p2)

		slot4 = slot0.feiJiParticle.p1

		slot0.feiJiParticle.p1.stopSystem(slot3)

		slot4 = slot0.feiJiParticle.p2

		slot0.feiJiParticle.p2.stopSystem(slot3)

		slot4 = slot0._feiJiTimer

		slot0._feiJiTimer.reset(slot3)
	end
end

return
