slot2 = "DzpkBtnCcsView"
DzpkBtnCcsView = class(slot1)

DzpkBtnCcsView.onCreationComplete = function (slot0)
	slot0.isClickAllIn = false
	slot0.beishu = {
		10,
		20,
		50,
		100,
		200
	}
	slot4 = false

	slot0.addMenu.setVisible(slot2, slot0.addMenu)

	slot4 = 2

	slot0.addMenu.setDirection(slot2, slot0.addMenu)

	slot3 = slot0.addMenu
	slot7 = slot0.onSliderChange

	slot0.addMenu.setCallBack(slot2, handler(slot5, slot0))

	slot5 = true

	ClassUtil.extends(slot2, slot0.touchLayer, BaseCcsBtn)

	if slot0.touchLayer.addTouchEventListener then
		slot3 = slot0.touchLayer
		slot7 = slot0.onTouchOperation

		slot0.touchLayer.addTouchEventListener(slot2, handler(slot5, slot0))
	end

	slot4 = "dzpk_allinmenufire"
	slot0.allinEffect = slot0.controller.createSpineByPool(slot2, slot0.controller)
	slot4 = slot0.allinEffect

	slot0.btnAdd.allin.addChild(slot2, slot0.btnAdd.allin)

	slot6 = true

	slot0.allinEffect.setAnimation(slot2, slot0.allinEffect, 0, "animation")

	slot5 = 30

	slot0.allinEffect.setPosition(slot2, slot0.allinEffect, 60)

	slot4 = "dzpk_allinmenufire"
	slot0.allinEffect2 = slot0.controller.createSpineByPool(slot2, slot0.controller)
	slot4 = slot0.allinEffect2

	slot0.btnFollow.allinTxt.addChild(slot2, slot0.btnFollow.allinTxt)

	slot6 = true

	slot0.allinEffect2.setAnimation(slot2, slot0.allinEffect2, 0, "animation")

	slot5 = 30

	slot0.allinEffect2.setPosition(slot2, slot0.allinEffect2, 50)

	slot3 = slot0

	slot0.register(slot2)
end

DzpkBtnCcsView.register = function (slot0)
	slot3 = slot0.checkBoxGiveUp
	slot7 = slot0.handleCheck

	slot0.checkBoxGiveUp.setParetHandler(slot2, handler(slot5, slot0))

	slot3 = slot0.checkBoxPass
	slot7 = slot0.handleCheck

	slot0.checkBoxPass.setParetHandler(slot2, handler(slot5, slot0))

	slot3 = slot0.checkBoxFollow
	slot7 = slot0.handleCheck

	slot0.checkBoxFollow.setParetHandler(slot2, handler(slot5, slot0))

	slot5 = slot0

	slot0.model.currentRaiseChangedSignal.add(slot2, slot0.model.currentRaiseChangedSignal, slot0.onChangeCurrentRaise)

	slot5 = slot0

	slot0.model.bigRaiseChangedSignal.add(slot2, slot0.model.bigRaiseChangedSignal, slot0.onChangeBigRaise)
end

DzpkBtnCcsView.onTouchOperation = function (slot0, slot1, slot2)
	slot3 = nil

	if slot2 == ccs.TOUCH_EVENT_BEGAN then
	elseif slot2 == ccs.TOUCH_EVENT_MOVED then
	elseif slot2 == ccs.TOUCH_EVENT_ENDED then
		slot6 = slot0

		slot0.changeState(slot5)
	end
end

DzpkBtnCcsView.onSliderChange = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot2)[1] == nil then
		return
	end

	slot6 = slot0.model
	slot4 = slot0.model

	if math.round(slot2) == slot0.model.getMyTablePlayingUserData(slot0.addMenu.getPercentFloat(slot4) * slot0.model.getMyTablePlayingUserData(slot0.addMenu)[1].lScore)[1].lScore then
		slot5 = false

		slot0.btnAdd.Txt.setVisible(slot3, slot0.btnAdd.Txt)

		slot5 = true

		slot0.btnAdd.allin.setVisible(slot3, slot0.btnAdd.allin)
	else
		slot5 = "加注"

		slot0.btnAdd.Txt.setString(slot3, slot0.btnAdd.Txt)

		slot5 = true

		slot0.btnAdd.Txt.setVisible(slot3, slot0.btnAdd.Txt)

		slot5 = false

		slot0.btnAdd.allin.setVisible(slot3, slot0.btnAdd.allin)
	end

	slot5 = slot1

	slot0.addMenu.updateTip(slot3, slot0.addMenu)

	slot0.btnAdd.num = slot1
end

DzpkBtnCcsView.onChangeCurrentRaise = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot2)[1] ~= nil then
		slot3 = slot0.model

		if not slot0.model.getMePlaying(slot2) then
			return
		end
	end

	slot3 = slot0.model

	if slot0.model.getAutoPass(slot2) then
		slot3 = slot0.model

		if slot0.model.getCurrentRaise(slot2) > 0 then
			slot3 = slot0

			slot0.resetAuto(slot2)
		end
	else
		slot3 = slot0.model

		if slot0.model.getCurrentRaise(slot2) == 0 then
			slot4 = "自动让牌"

			slot0.checkBoxPass.bgCheckBox.Text_12.setString(slot2, slot0.checkBoxPass.bgCheckBox.Text_12)
		else
			slot7 = slot0.model
			slot4 = "跟" .. slot0.model.getCurrentRaise(slot6)

			slot0.checkBoxPass.bgCheckBox.Text_12.setString(slot2, slot0.checkBoxPass.bgCheckBox.Text_12)
		end
	end

	slot0.btnAdd.num = 0
	slot4 = "加注"

	slot0.btnAdd.Txt.setString(0, slot0.btnAdd.Txt)

	slot4 = false

	slot0.btnAdd.allin.setVisible(0, slot0.btnAdd.allin)

	slot4 = slot0.model

	if slot0.model.getMyTablePlayingUserData(0)[1].lScore <= slot0.model.getCurrentRaise(slot0.model) then
		slot4 = false

		slot0.btnAdd.Txt.setVisible(slot2, slot0.btnAdd.Txt)

		slot4 = true

		slot0.btnAdd.allin.setVisible(slot2, slot0.btnAdd.allin)
	end

	slot3 = slot0.model

	if slot0.model.getGameRound(slot2) > 1 then
		slot4 = "1x底池"

		slot0.btnFollow3.Txt.setString(slot2, slot0.btnFollow3.Txt)

		slot4 = "1/2底池"

		slot0.btnFollow1.Txt.setString(slot2, slot0.btnFollow1.Txt)

		slot4 = "2/3底池"

		slot0.btnFollow2.Txt.setString(slot2, slot0.btnFollow2.Txt)

		slot4 = false

		slot0.btnFollow3.setEnabled(slot2, slot0.btnFollow3)

		slot4 = false

		slot0.btnFollow1.setEnabled(slot2, slot0.btnFollow1)

		slot4 = false

		slot0.btnFollow2.setEnabled(slot2, slot0.btnFollow2)

		slot4 = slot0.model
		slot0.btnFollow1.num = slot0.model.getGamePool(slot0.btnFollow2) / 2
		slot4 = slot0.model
		slot0.btnFollow2.num = (slot0.model.getGamePool(slot0.btnFollow2) * 2) / 3
		slot4 = slot0.model
		slot0.btnFollow3.num = slot0.model.getGamePool(slot0.btnFollow2)
		slot4 = slot0.model

		if slot0.model.getGamePool(slot0.model) < slot0.model.getMyTablePlayingUserData(slot0.model.getGamePool(slot0.btnFollow2))[1].lScore then
			slot4 = slot0.model
			slot4 = slot0.model

			if slot0.model.getBigRaise(slot0.model) <= slot0.model.getGamePool(slot2) - slot0.model.getCurrentRaise(slot0.model) then
				slot6 = slot0.model
				slot4 = slot0.model.getRaiseRound(slot5) > 0

				slot0.btnFollow3.setEnabled(slot2, slot0.btnFollow3)

				slot6 = slot0.model
				slot4 = slot0.model.getRaiseRound(slot5) > 0

				slot0.btnFollow1.setEnabled(slot2, slot0.btnFollow1)

				slot6 = slot0.model
				slot4 = slot0.model.getRaiseRound(slot5) > 0

				slot0.btnFollow2.setEnabled(slot2, slot0.btnFollow2)
			end
		else
			slot4 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot2)[1].lScore > (slot0.model.getGamePool(slot0.model) * 2) / 3 then
				slot4 = slot0.model
				slot4 = slot0.model

				if slot0.model.getBigRaise(slot0.model) <= (slot0.model.getGamePool(slot2) * 2) / 3 - slot0.model.getCurrentRaise(slot0.model) then
					slot6 = slot0.model
					slot4 = slot0.model.getRaiseRound(slot5) > 0

					slot0.btnFollow2.setEnabled(slot2, slot0.btnFollow2)

					slot6 = slot0.model
					slot4 = slot0.model.getRaiseRound(slot5) > 0

					slot0.btnFollow1.setEnabled(slot2, slot0.btnFollow1)
				end
			else
				slot4 = slot0.model

				if slot0.model.getMyTablePlayingUserData(slot2)[1].lScore > slot0.model.getGamePool(slot0.model) / 2 then
					slot4 = slot0.model
					slot4 = slot0.model

					if slot0.model.getBigRaise(slot0.model) <= slot0.model.getGamePool(slot2) / 2 - slot0.model.getCurrentRaise(slot0.model) then
						slot6 = slot0.model
						slot4 = slot0.model.getRaiseRound(slot5) > 0

						slot0.btnFollow1.setEnabled(slot2, slot0.btnFollow1)
					end
				end
			end
		end
	else
		slot4 = "1x底池"

		slot0.btnFollow3.Txt.setString(slot2, slot0.btnFollow3.Txt)

		slot4 = "3x大盲"

		slot0.btnFollow1.Txt.setString(slot2, slot0.btnFollow1.Txt)

		slot4 = "4x大盲"

		slot0.btnFollow2.Txt.setString(slot2, slot0.btnFollow2.Txt)

		slot4 = false

		slot0.btnFollow3.setEnabled(slot2, slot0.btnFollow3)

		slot4 = false

		slot0.btnFollow1.setEnabled(slot2, slot0.btnFollow1)

		slot4 = false

		slot0.btnFollow2.setEnabled(slot2, slot0.btnFollow2)

		slot4 = slot0.model
		slot0.btnFollow1.num = slot0.model.getBigRaise(slot0.btnFollow2) * 3
		slot4 = slot0.model
		slot0.btnFollow2.num = slot0.model.getBigRaise(slot0.btnFollow2) * 4
		slot4 = slot0.model
		slot0.btnFollow3.num = slot0.model.getGamePool(slot0.btnFollow2)
		slot4 = slot0.model

		if slot0.model.getGamePool(slot0.model) < slot0.model.getMyTablePlayingUserData(slot0.model.getGamePool(slot0.btnFollow2))[1].lScore then
			slot4 = slot0.model
			slot4 = slot0.model

			if slot0.model.getBigRaise(slot0.model) <= slot0.model.getGamePool(slot2) - slot0.model.getCurrentRaise(slot0.model) then
				slot6 = slot0.model
				slot4 = slot0.model.getRaiseRound(slot5) > 0

				slot0.btnFollow3.setEnabled(slot2, slot0.btnFollow3)
			end
		end

		slot4 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot2)[1].lScore > slot0.model.getBigRaise(slot0.model) * 3 then
			slot4 = slot0.model
			slot4 = slot0.model

			if slot0.model.getBigRaise(slot0.model) <= slot0.model.getBigRaise(slot2) * 3 - slot0.model.getCurrentRaise(slot0.model) then
				slot6 = slot0.model
				slot4 = slot0.model.getRaiseRound(slot5) > 0

				slot0.btnFollow1.setEnabled(slot2, slot0.btnFollow1)
			end
		end

		slot4 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot2)[1].lScore > slot0.model.getBigRaise(slot0.model) * 4 then
			slot4 = slot0.model
			slot4 = slot0.model

			if slot0.model.getBigRaise(slot0.model) <= slot0.model.getBigRaise(slot2) * 4 - slot0.model.getCurrentRaise(slot0.model) then
				slot6 = slot0.model
				slot4 = slot0.model.getRaiseRound(slot5) > 0

				slot0.btnFollow2.setEnabled(slot2, slot0.btnFollow2)
			end
		end
	end
end

DzpkBtnCcsView.onChangeBigRaise = function (slot0)
	slot3 = "==============DzpkBtnCcsView:onChangeBigRaise==================="

	print(slot2)

	slot3 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot2)[1] ~= nil then
		slot3 = slot0.model

		if not slot0.model.getMePlaying(slot2) then
			return
		end
	end

	slot3 = slot0.model

	if slot0.model.getBigRaise(slot2) == nil then
		return
	end

	for slot5 = 1, #slot0.beishu, 1 do
		if slot0["btnAdd" .. slot5] ~= nil then
			slot8 = slot0["btnAdd" .. slot5].Txt
			slot11 = slot0.beishu[slot5] * slot1

			slot0["btnAdd" .. slot5].Txt.setString(slot5, MathUtil.cookNumWithHansUnits(slot10))

			slot0["btnAdd" .. slot5].num = slot0.beishu[slot5] * slot1
			slot8 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot0.beishu[slot5] * slot1)[1].lScore >= slot0.beishu[slot5] * slot1 then
				slot8 = slot0.model

				if slot0.model.getCurrentRaise(slot7) > slot0.beishu[slot5] * slot1 then
					slot9 = false

					slot0["btnAdd" .. slot5].setEnabled(slot5, slot0["btnAdd" .. slot5])
				else
					slot9 = true

					slot0["btnAdd" .. slot5].setEnabled(slot5, slot0["btnAdd" .. slot5])
				end
			else
				slot9 = false

				slot0["btnAdd" .. slot5].setEnabled(slot5, slot0["btnAdd" .. slot5])
			end
		end
	end
end

DzpkBtnCcsView.onBtnClick = function (slot0, slot1, slot2)
	slot6 = Dzpk_SOUND_BUTTON

	slot0.controller.playGameEffect(slot4, slot0.controller)

	slot5 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot4)[1] == nil then
		return
	end

	if slot1 == slot0.btnCancel then
		slot5 = slot0.controller

		slot0.controller.requestGiveUp(slot4)

		slot5 = slot0

		slot0.reset(slot4)
	elseif slot1 == slot0.btnFollow then
		slot5 = slot0.model

		if slot0.model.getCurrentRaise(slot4) ~= 0 then
			slot6 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot4)[1].lScore < slot0.model.getCurrentRaise(slot0.model) then
				slot5 = slot0.controller

				slot0.controller.requestAllin(slot4)
			else
				slot5 = slot0.controller

				slot0.controller.requestFollow(slot4)
			end
		else
			slot5 = slot0.controller

			slot0.controller.requestPass(slot4)
		end

		slot5 = slot0

		slot0.reset(slot4)

		slot7 = true

		slot0.model.setIsShowMenu(slot4, slot0.model, false)
	elseif slot1 == slot0.btnAdd then
		if slot1.num > 0 then
			slot6 = slot1.num

			slot0.controller.requestAddScore(slot4, slot0.controller)

			slot6 = false

			slot0.addMenu.setVisible(slot4, slot0.addMenu)

			slot6 = false

			slot0.resetAddBtn(slot4, slot0)

			slot7 = true

			slot0.model.setIsShowMenu(slot4, slot0.model, false)
		else
			slot6 = true

			slot0.addMenu.setVisible(slot4, slot0.addMenu)

			slot6 = true

			slot0.handleSubMenu(slot4, slot0)

			slot0.btnAdd.num = slot0.model.getCurrentRaise(slot0) + slot0.model.getBigRaise(slot0.model)
			slot8 = slot0.model
			slot6 = slot0.model.getMyTablePlayingUserData(slot0.model)[1].lScore

			slot0.addMenu.setTotalScore(slot0.model.getCurrentRaise(slot0) + slot0.model.getBigRaise(slot0.model), slot0.addMenu)

			slot5 = slot0.addMenu

			slot0.addMenu.setUnScore(slot0.model.getCurrentRaise(slot0) + slot0.model.getBigRaise(slot0.model), slot0.model.getBigRaise(slot0.model))

			slot9 = slot0.model
			slot6 = slot0.btnAdd.num / slot0.model.getMyTablePlayingUserData(slot0.model)[1].lScore

			slot0.addMenu.setPercentFloat(slot0.model.getCurrentRaise(slot0) + slot0.model.getBigRaise(slot0.model), slot0.addMenu)

			slot5 = slot0.addMenu

			slot0.addMenu.resetMin(slot0.model.getCurrentRaise(slot0) + slot0.model.getBigRaise(slot0.model))

			slot5 = slot0

			slot0.onChangeBigRaise(slot0.model.getCurrentRaise(slot0) + slot0.model.getBigRaise(slot0.model))
		end
	elseif slot1 == slot0.btnFollow1 or slot1 == slot0.btnFollow2 or slot1 == slot0.btnFollow3 then
		slot6 = slot1.num

		slot0.controller.requestAddScore(slot4, slot0.controller)

		slot7 = true

		slot0.model.setIsShowMenu(slot4, slot0.model, false)
	elseif slot1 == slot0.btnAdd1 or slot1 == slot0.btnAdd2 or slot1 == slot0.btnAdd3 or slot1 == slot0.btnAdd4 or slot1 == slot0.btnAdd5 then
		slot6 = slot1.num

		slot0.controller.requestAddScore(slot4, slot0.controller)

		slot7 = true

		slot0.model.setIsShowMenu(slot4, slot0.model, false)
	end
end

DzpkBtnCcsView.handleSubMenu = function (slot0, slot1)
	slot5 = not slot1

	slot0.resetFollow(slot3, slot0)

	slot5 = slot1

	slot0.resetAddBtn(slot3, slot0)

	slot5 = not slot1

	slot0.btnFollow.setVisible(slot3, slot0.btnFollow)

	slot5 = not slot1

	slot0.btnCancel.setVisible(slot3, slot0.btnCancel)
end

DzpkBtnCcsView.handleCheck = function (slot0, slot1)
	slot5 = false

	slot0.model.setAutoGiveUp(slot3, slot0.model)

	slot5 = false

	slot0.model.setAutoFollow(slot3, slot0.model)

	slot5 = false

	slot0.model.setAutoPass(slot3, slot0.model)

	if slot1 == slot0.checkBoxGiveUp then
		slot5 = false

		slot0.checkBoxPass.setIsSelected(slot3, slot0.checkBoxPass)

		slot5 = false

		slot0.checkBoxFollow.setIsSelected(slot3, slot0.checkBoxFollow)

		slot4 = slot0.model
		slot7 = slot0.checkBoxGiveUp

		slot0.model.setAutoGiveUp(slot3, slot0.checkBoxGiveUp.getIsSelected(slot6))
	elseif slot1 == slot0.checkBoxPass then
		slot5 = false

		slot0.checkBoxGiveUp.setIsSelected(slot3, slot0.checkBoxGiveUp)

		slot5 = false

		slot0.checkBoxFollow.setIsSelected(slot3, slot0.checkBoxFollow)

		slot4 = slot0.model
		slot7 = slot0.checkBoxPass

		slot0.model.setAutoPass(slot3, slot0.checkBoxPass.getIsSelected(slot6))
	elseif slot1 == slot0.checkBoxFollow then
		slot5 = false

		slot0.checkBoxPass.setIsSelected(slot3, slot0.checkBoxPass)

		slot5 = false

		slot0.checkBoxGiveUp.setIsSelected(slot3, slot0.checkBoxGiveUp)

		slot4 = slot0.model
		slot7 = slot0.checkBoxFollow

		slot0.model.setAutoFollow(slot3, slot0.checkBoxFollow.getIsSelected(slot6))
	end
end

DzpkBtnCcsView.setModel = function (slot0, slot1)
	slot5 = true

	slot0.btnCancel.setVisible(slot3, slot0.btnCancel)

	slot5 = true

	slot0.btnCancel.setEnabled(slot3, slot0.btnCancel)

	slot4 = slot0

	slot0.handleBtn(slot3)

	slot5 = true

	slot0.touchLayer.setVisible(slot3, slot0.touchLayer)

	if slot1 == 1 then
		slot5 = true

		slot0.checkBoxGiveUp.setVisible(slot3, slot0.checkBoxGiveUp)

		slot5 = true

		slot0.checkBoxPass.setVisible(slot3, slot0.checkBoxPass)

		slot5 = true

		slot0.checkBoxFollow.setVisible(slot3, slot0.checkBoxFollow)
	elseif slot1 == 2 then
		slot5 = true

		slot0.btnFollow.setVisible(slot3, slot0.btnFollow)

		slot5 = true

		slot0.btnCancel.setVisible(slot3, slot0.btnCancel)

		slot5 = true

		slot0.btnAdd.setVisible(slot3, slot0.btnAdd)

		slot4 = slot0.model

		if slot0.model.getRaiseRound(slot3) > 0 then
			slot4 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot3)[1] ~= nil then
				slot6 = slot0.model

				if slot0.model.getMyTablePlayingUserData(slot3)[1].lScore >= slot0.model.getCurrentRaise(slot0.model) + slot0.model.getBigRaise(slot0.model) then
					slot5 = true

					slot0.btnAdd.setEnabled(slot3, slot0.btnAdd)
				end
			end
		else
			slot5 = false

			slot0.btnAdd.setEnabled(slot3, slot0.btnAdd)
		end

		slot4 = slot0

		slot0.onChangeCurrentRaise(slot3)

		slot5 = true

		slot0.resetFollow(slot3, slot0)
	elseif slot1 == 3 then
	elseif slot1 == 4 then
		slot5 = true

		slot0.btnFollow.setVisible(slot3, slot0.btnFollow)

		slot5 = true

		slot0.btnCancel.setVisible(slot3, slot0.btnCancel)
	end
end

DzpkBtnCcsView.changeState = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot2) ~= nil then
		slot3 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot2)[1] ~= nil then
			slot3 = slot0.model

			if not slot0.model.getIsAllIn(slot2) then
				slot3 = slot0.model

				if not slot0.model.getMePlaying(slot2) then
					slot4 = 3

					slot0.setModel(slot2, slot0)

					return
				end
			end
		end
	end

	slot3 = slot0.model

	if not slot0.model.getIsShowMenu(slot2) then
		slot3 = slot0.model

		if slot0.model.getCurrentRaise(slot2) == 0 then
			slot4 = "自动让牌"

			slot0.checkBoxPass.bgCheckBox.Text_12.setString(slot2, slot0.checkBoxPass.bgCheckBox.Text_12)
		else
			slot7 = slot0.model
			slot4 = "跟" .. slot0.model.getCurrentRaise(slot6)

			slot0.checkBoxPass.bgCheckBox.Text_12.setString(slot2, slot0.checkBoxPass.bgCheckBox.Text_12)
		end

		slot4 = 1

		slot0.setModel(slot2, slot0)

		return
	else
		slot3 = slot0.model

		if slot0.model.getAutoGiveUp(slot2) then
			slot3 = slot0.model

			if slot0.model.getCurrentRaise(slot2) == 0 then
				slot3 = slot0.controller

				slot0.controller.requestPass(slot2)
			else
				slot3 = slot0.controller

				slot0.controller.requestGiveUp(slot2)
			end

			slot3 = slot0

			slot0.resetAuto(slot2)

			slot4 = 1

			slot0.setModel(slot2, slot0)

			return
		end

		slot3 = slot0.model

		if slot0.model.getAutoPass(slot2) then
			slot3 = slot0.model

			if slot0.model.getCurrentRaise(slot2) == 0 then
				slot3 = slot0.controller

				slot0.controller.requestPass(slot2)
			else
				slot3 = slot0.controller

				slot0.controller.requestFollow(slot2)
			end

			slot3 = slot0

			slot0.resetAuto(slot2)

			slot4 = 1

			slot0.setModel(slot2, slot0)

			return
		end

		slot3 = slot0.model

		if slot0.model.getAutoFollow(slot2) then
			slot3 = slot0.model

			if slot0.model.getCurrentRaise(slot2) > 0 then
				slot4 = slot0.model

				if slot0.model.getCurrentRaise(slot0.model) < slot0.model.getMyTablePlayingUserData(slot2)[1].lScore then
					slot3 = slot0.controller

					slot0.controller.requestFollow(slot2)
				else
					slot3 = slot0.controller

					slot0.controller.requestAllin(slot2)
				end
			else
				slot3 = slot0.controller

				slot0.controller.requestPass(slot2)
			end

			slot3 = slot0

			slot0.resetAuto(slot2)

			slot4 = 1

			slot0.setModel(slot2, slot0)

			return
		end

		slot4 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot2)[1].lScore <= slot0.model.getCurrentRaise(slot0.model) then
			slot4 = true

			slot0.btnFollow.allinbg.setVisible(slot2, slot0.btnFollow.allinbg)

			slot4 = true

			slot0.btnFollow.allinTxt.setVisible(slot2, slot0.btnFollow.allinTxt)

			slot3 = "============zhe=========="

			print(slot2)

			slot4 = 4

			slot0.setModel(slot2, slot0)

			return
		end

		slot4 = false

		slot0.btnFollow.allinbg.setVisible(slot2, slot0.btnFollow.allinbg)

		slot4 = false

		slot0.btnFollow.allinTxt.setVisible(slot2, slot0.btnFollow.allinTxt)

		slot3 = slot0.model

		if slot0.model.getCurrentRaise(slot2) == 0 then
			slot4 = "让牌"

			slot0.btnFollow.Txt.setString(slot2, slot0.btnFollow.Txt)
		else
			slot7 = slot0.model
			slot4 = "跟" .. slot0.model.getCurrentRaise(slot6)

			slot0.btnFollow.Txt.setString(slot2, slot0.btnFollow.Txt)
		end

		slot4 = 2

		slot0.setModel(slot2, slot0)
	end
end

DzpkBtnCcsView.resetAddBtn = function (slot0, slot1)
	for slot5 = 1, 5, 1 do
		slot9 = slot1

		slot0["btnAdd" .. slot5].setVisible(slot5, slot0["btnAdd" .. slot5])
	end
end

DzpkBtnCcsView.resetFollow = function (slot0, slot1)
	for slot5 = 1, 3, 1 do
		slot9 = slot1

		slot0["btnFollow" .. slot5].setVisible(slot5, slot0["btnFollow" .. slot5])
	end
end

DzpkBtnCcsView.resetAuto = function (slot0)
	slot3 = "=======DzpkBtnCcsView:resetAuto=========="

	print(slot2)

	slot4 = false

	slot0.model.setAutoGiveUp(slot2, slot0.model)

	slot4 = false

	slot0.model.setAutoFollow(slot2, slot0.model)

	slot4 = false

	slot0.model.setAutoPass(slot2, slot0.model)

	slot4 = false

	slot0.checkBoxPass.setIsSelected(slot2, slot0.checkBoxPass)

	slot4 = false

	slot0.checkBoxFollow.setIsSelected(slot2, slot0.checkBoxFollow)

	slot4 = false

	slot0.checkBoxGiveUp.setIsSelected(slot2, slot0.checkBoxGiveUp)
end

DzpkBtnCcsView.handleBtn = function (slot0)
	slot4 = true

	slot0.btnAdd.Txt.setVisible(slot2, slot0.btnAdd.Txt)

	slot4 = false

	slot0.btnAdd.allin.setVisible(slot2, slot0.btnAdd.allin)

	slot4 = false

	slot0.btnFollow.setVisible(slot2, slot0.btnFollow)

	slot4 = false

	slot0.btnCancel.setVisible(slot2, slot0.btnCancel)

	slot4 = false

	slot0.btnAdd.setVisible(slot2, slot0.btnAdd)

	slot4 = false

	slot0.checkBoxGiveUp.setVisible(slot2, slot0.checkBoxGiveUp)

	slot4 = false

	slot0.checkBoxPass.setVisible(slot2, slot0.checkBoxPass)

	slot4 = false

	slot0.checkBoxFollow.setVisible(slot2, slot0.checkBoxFollow)

	slot0.btnAdd.num = 0
	slot4 = false

	slot0.addMenu.setVisible(0, slot0.addMenu)

	slot3 = slot0.addMenu

	slot0.addMenu.reset(0)

	slot4 = false

	slot0.touchLayer.setVisible(0, slot0.touchLayer)

	slot4 = "自动让牌"

	slot0.checkBoxPass.bgCheckBox.Text_12.setString(0, slot0.checkBoxPass.bgCheckBox.Text_12)

	slot4 = false

	slot0.resetFollow(0, slot0)

	slot4 = false

	slot0.resetAddBtn(0, slot0)
end

DzpkBtnCcsView.reset = function (slot0)
	slot3 = slot0

	slot0.handleBtn(slot2)

	slot3 = slot0

	slot0.resetAuto(slot2)
end

DzpkBtnCcsView.destroy = function (slot0)
	return
end

return
