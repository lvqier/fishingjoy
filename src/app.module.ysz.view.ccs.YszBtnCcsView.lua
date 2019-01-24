slot2 = "YszBtnCcsView"
YszBtnCcsView = class(slot1)

YszBtnCcsView.onCreationComplete = function (slot0)
	slot3 = slot0

	slot0.init(slot2)
end

YszBtnCcsView.register = function (slot0)
	slot5 = slot0

	slot0.model.gameStateChangedSignal.add(slot2, slot0.model.gameStateChangedSignal, slot0.onChangeGameState)

	slot5 = slot0

	slot0.model.allInModelChangedSignal.add(slot2, slot0.model.allInModelChangedSignal, slot0.onChangeAllInModel)
end

YszBtnCcsView.onChangeGameState = function (slot0)
	slot3 = "===========YszBtnCcsView:onChangeGameState==============="

	print(slot2)

	slot3 = slot0.model

	if slot0.model.getGameState(slot2) == GAME_STATUS_FREE then
		slot4 = slot0

		slot0.reset(slot3)
	elseif slot1 == GAME_STATUS_PLAY then
	elseif slot1 == YSZ_GAME_SCENE_END then
		slot4 = slot0

		slot0.reset(slot3)
	end
end

YszBtnCcsView.init = function (slot0)
	slot0.isClickAllIn = false
end

YszBtnCcsView.onBtnClick = function (slot0, slot1, slot2)
	slot5 = slot0

	slot0.closeBtnEnable(slot4)

	if slot1 == slot0.btnCancel then
		slot6 = false

		slot0.model.setIsShowBetMenu(slot4, slot0.model)

		slot6 = 13

		slot0.controller.reqClientError(slot4, slot0.controller)

		slot6 = "点击了弃牌按钮"

		slot0.controller.sendlog(slot4, slot0.controller)

		slot5 = slot0.controller

		slot0.controller.reqGiveUp(slot4)

		slot5 = slot0

		slot0.reset(slot4)
	elseif slot1 == slot0.btnAllbet then
		slot6 = false

		slot0.model.setIsShowBetMenu(slot4, slot0.model)

		slot6 = 5

		slot0.controller.reqClientError(slot4, slot0.controller)

		slot6 = "点击了allin按钮"

		slot0.controller.sendlog(slot4, slot0.controller)

		slot6 = false

		slot0.model.setIsShowMenu(slot4, slot0.model)

		slot6 = 4

		slot0.setModel(slot4, slot0)

		slot8 = true

		slot0.controller.reqAddScore(slot4, slot0.controller, 1, 1)

		slot0.isClickAllIn = true
	elseif slot1 == slot0.btnAddBet then
	elseif slot1 == slot0.btnFollow then
		slot6 = true

		slot0.model.setBAllFollow(slot4, slot0.model)

		slot6 = 1

		slot0.controller.reqAutoAdd(slot4, slot0.controller)

		slot6 = 3

		slot0.setModel(slot4, slot0)
	elseif slot1 == slot0.btnCancelFollow then
		slot6 = false

		slot0.model.setBAllFollow(slot4, slot0.model)

		slot6 = 0

		slot0.controller.reqAutoAdd(slot4, slot0.controller)

		slot6 = 2

		slot0.setModel(slot4, slot0)
	elseif slot1 == slot0.btnUnAdd then
		slot6 = false

		slot0.model.setIsShowBetMenu(slot4, slot0.model)

		slot6 = slot0.model
		slot3 = slot0.model.getLCellScore(slot4) * slot0.model.getLCurrentTimes(slot0.model)
		slot6 = slot0.model

		if slot0.model.getBMingZhu(slot0.model)[1] then
			slot3 = slot3 * 2
		end

		slot6 = slot0.model

		if slot0.model.getNCurRounds(slot5) <= 1 then
			slot6 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot5)[1] ~= nil then
				slot6 = slot0.model

				if slot3 < slot0.model.getMyTablePlayingUserData(slot5)[1].lScore then
					return
				end
			end
		end

		slot7 = false

		slot0.model.setIsShowMenu(slot5, slot0.model)

		slot7 = "点击了比牌按钮"

		slot0.controller.sendlog(slot5, slot0.controller)

		slot7 = 4

		slot0.setModel(slot5, slot0)

		slot8 = 0

		slot0.controller.reqCompareCard(slot5, slot0.controller, 1)
	elseif slot1 == slot0.btnFollowBet then
		slot5 = slot0.model

		if slot0.model.getIsAllIn(slot4) then
			return
		end

		slot6 = "点击了跟注按钮"

		slot0.controller.sendlog(slot4, slot0.controller)

		slot6 = false

		slot0.model.setIsShowBetMenu(slot4, slot0.model)

		slot6 = false

		slot0.model.setIsShowMenu(slot4, slot0.model)

		slot6 = 4

		slot0.controller.reqClientError(slot4, slot0.controller)

		slot7 = 1

		slot0.controller.reqAddScore(slot4, slot0.controller, 1)
	end
end

YszBtnCcsView.closeBtnEnable = function (slot0)
	slot4 = false

	slot0.btnAllbet.setEnabled(slot2, slot0.btnAllbet)

	slot4 = false

	slot0.btnUnAdd.setEnabled(slot2, slot0.btnUnAdd)

	slot4 = false

	slot0.btnFollowBet.setEnabled(slot2, slot0.btnFollowBet)

	slot4 = false

	slot0.btnAddBet.setEnabled(slot2, slot0.btnAddBet)

	slot4 = false

	slot0.btnCancelFollow.setEnabled(slot2, slot0.btnCancelFollow)

	slot4 = false

	slot0.btnFollow.setEnabled(slot2, slot0.btnFollow)
end

YszBtnCcsView.setModel = function (slot0, slot1)
	slot5 = true

	slot0.btnCancel.setVisible(slot3, slot0.btnCancel)

	slot5 = true

	slot0.btnCancel.setEnabled(slot3, slot0.btnCancel)

	if slot1 == 1 then
		slot5 = true

		slot0.btnUnAdd.setVisible(slot3, slot0.btnUnAdd)

		slot5 = true

		slot0.btnAllbet.setVisible(slot3, slot0.btnAllbet)

		slot5 = true

		slot0.btnFollowBet.setVisible(slot3, slot0.btnFollowBet)

		slot5 = false

		slot0.btnFollow.setVisible(slot3, slot0.btnFollow)

		slot5 = false

		slot0.btnCancelFollow.setVisible(slot3, slot0.btnCancelFollow)

		slot5 = true

		slot0.btnAllbet.setEnabled(slot3, slot0.btnAllbet)

		slot5 = true

		slot0.btnUnAdd.setEnabled(slot3, slot0.btnUnAdd)

		slot5 = true

		slot0.btnFollowBet.setEnabled(slot3, slot0.btnFollowBet)

		slot5 = slot0.model
		slot2 = slot0.model.getLCellScore(slot3) * slot0.model.getLCurrentTimes(slot0.model)
		slot5 = slot0.model

		if slot0.model.getBMingZhu(slot0.model)[1] then
			slot2 = slot2 * 2
		end

		slot5 = slot0.model

		if slot0.model.getNCurRounds(slot4) <= 1 then
			slot5 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot4)[1] ~= nil then
				slot5 = slot0.model

				if slot2 < slot0.model.getMyTablePlayingUserData(slot4)[1].lScore then
					slot6 = false

					slot0.btnUnAdd.setEnabled(slot4, slot0.btnUnAdd)
				end
			end
		end

		slot5 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot4)[1] ~= nil then
			slot5 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot4)[1].lScore < slot2 then
				slot6 = false

				slot0.btnAddBet.setEnabled(slot4, slot0.btnAddBet)
			end
		end

		slot5 = slot0.model

		if slot0.model.getNCurRounds(slot4) > 1 then
			slot3 = 0
			slot6 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot5)[1].lScore < 0 then
				slot4 = 0
			end

			for slot8 = 1, YSZ_GAME_PLAYER, 1 do
				slot11 = slot0.model

				if slot0.model.getCbPlayStatus(slot10)[slot8] == 1 then
					slot3 = slot3 + 1
					slot14 = slot0.model
					slot12 = slot0.model.getMyTablePlayingUserData(slot13)[slot8].lScore
					slot4 = math.min(slot10, slot4)
				end
			end

			if slot3 == 2 then
				slot7 = slot0.model

				if not slot0.model.getIsAllIn(slot6) then
					slot7 = slot0.model

					if slot0.model.getAllInScore(slot6) > 0 then
						slot7 = slot4
						slot10 = slot0.model
						slot4 = math.min(slot6, slot0.model.getAllInScore(slot9))
					end

					slot7 = slot4
					slot10 = slot0.model
					slot9 = true

					slot0.model.setAllInScore(slot6, slot0.model, math.min(slot6, slot0.model.getLMaxScore(slot9)))
				end

				slot11 = slot0.model
				slot8 = "到自己操作model1，可以进行allin操作，计算到allin的额度为:" .. slot0.model.getAllInScore(slot10)

				slot0.controller.sendlog(slot6, slot0.controller)

				slot8 = true

				slot0.btnAllbet.setEnabled(slot6, slot0.btnAllbet)

				if slot0.xpSpine == nil then
					slot8 = "allineffect.json"
					slot9 = "allineffect.atlas"
					slot0.xpSpine = sp.SkeletonAnimation.create(slot0.controller, sp.SkeletonAnimation, slot5)
					slot13 = slot0.btnAllbet
					slot11 = slot0.btnAllbet.getContentSize(slot0.btnAllbet).height / 2 + 5

					slot0.xpSpine.setPosition(slot0.controller, slot0.xpSpine, slot0.btnAllbet.getContentSize(slot6).width / 2)

					slot10 = slot0.xpSpine

					slot0.btnAllbet.effect.addChild(slot0.controller, slot0.btnAllbet.effect)
				end

				slot10 = true

				slot0.xpSpine.setAnimation(slot6, slot0.xpSpine, 0, "animation")

				slot8 = true

				slot0.xpSpine.setVisible(slot6, slot0.xpSpine)

				slot8 = true

				slot0.btnAllbet.effect.setVisible(slot6, slot0.btnAllbet.effect)
			else
				slot8 = false

				slot0.btnAllbet.effect.setVisible(slot6, slot0.btnAllbet.effect)

				slot8 = false

				slot0.btnAllbet.setEnabled(slot6, slot0.btnAllbet)
			end
		else
			slot6 = false

			slot0.btnAllbet.setEnabled(slot4, slot0.btnAllbet)

			slot6 = false

			slot0.btnAllbet.effect.setVisible(slot4, slot0.btnAllbet.effect)
		end

		slot6 = slot0.model

		if slot0.model.getNCurRounds(slot4) < slot0.model.getNMaxRounds(slot0.model) + 1 then
			slot5 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot4)[1] ~= nil then
				slot5 = slot0.model

				if slot0.model.getMyTablePlayingUserData(slot4)[1].lScore >= slot2 then
					slot5 = slot0.model

					if slot0.model.getIsAllIn(slot4) then
						slot6 = false

						slot0.btnAddBet.setEnabled(slot4, slot0.btnAddBet)

						slot6 = false

						slot0.btnFollowBet.setEnabled(slot4, slot0.btnFollowBet)

						slot6 = false

						slot0.btnAllbet.setEnabled(slot4, slot0.btnAllbet)

						slot6 = false

						slot0.btnAllbet.effect.setVisible(slot4, slot0.btnAllbet.effect)

						slot6 = "到自己操作model1，只剩下比牌按钮,和弃牌按钮"

						slot0.controller.sendlog(slot4, slot0.controller)
					end
				end
			end
		end

		slot5 = slot0.model

		if slot0.model.getLTablePlayerScore(slot4)[1] ~= nil then
			slot6 = slot0.model

			if slot0.model.getLUserMaxScore(slot0.model) < slot0.model.getLTablePlayerScore(slot4)[1] + slot2 then
				slot9 = slot0.model
				slot13 = slot0.model
				slot6 = "到自己操作model1，只剩下比牌按钮,和弃牌按钮，但数据有误" .. slot0.model.getLTablePlayerScore(slot8)[1] .. "将要下注的：" .. slot2 .. "总额:" .. slot0.model.getLUserMaxScore(slot12)

				slot0.controller.sendlog(slot4, slot0.controller)

				slot6 = false

				slot0.btnAddBet.setEnabled(slot4, slot0.btnAddBet)

				slot6 = false

				slot0.btnFollowBet.setEnabled(slot4, slot0.btnFollowBet)

				slot6 = false

				slot0.btnAllbet.setEnabled(slot4, slot0.btnAllbet)

				slot6 = false

				slot0.btnAllbet.effect.setVisible(slot4, slot0.btnAllbet.effect)
			end
		end
	elseif slot1 == 2 then
		slot5 = false

		slot0.btnCancelFollow.setVisible(slot3, slot0.btnCancelFollow)

		slot5 = false

		slot0.btnUnAdd.setVisible(slot3, slot0.btnUnAdd)

		slot5 = false

		slot0.btnAllbet.setVisible(slot3, slot0.btnAllbet)

		slot5 = false

		slot0.btnFollowBet.setVisible(slot3, slot0.btnFollowBet)

		slot5 = false

		slot0.btnAddBet.setVisible(slot3, slot0.btnAddBet)

		slot5 = true

		slot0.btnFollow.setVisible(slot3, slot0.btnFollow)

		slot5 = true

		slot0.btnFollow.setEnabled(slot3, slot0.btnFollow)
	elseif slot1 == 3 then
		slot5 = "已经选择了自动跟注，只显示弃牌和自动跟注"

		slot0.controller.sendlog(slot3, slot0.controller)

		slot5 = false

		slot0.btnFollow.setVisible(slot3, slot0.btnFollow)

		slot5 = false

		slot0.btnUnAdd.setVisible(slot3, slot0.btnUnAdd)

		slot5 = false

		slot0.btnAllbet.setVisible(slot3, slot0.btnAllbet)

		slot5 = false

		slot0.btnFollowBet.setVisible(slot3, slot0.btnFollowBet)

		slot5 = false

		slot0.btnAddBet.setVisible(slot3, slot0.btnAddBet)

		if slot0.ysz_qxgzSpine == nil then
			slot5 = "ysz_qxgz.json"
			slot6 = "ysz_qxgz.atlas"
			slot0.ysz_qxgzSpine = sp.SkeletonAnimation.create(slot0.controller, sp.SkeletonAnimation, slot2)
			slot10 = slot0.btnCancelFollow
			slot8 = slot0.btnCancelFollow.getContentSize(slot0.btnCancelFollow).height / 2 + 15

			slot0.ysz_qxgzSpine.setPosition(slot0.controller, slot0.ysz_qxgzSpine, slot0.btnCancelFollow.getContentSize(slot3).width / 2)

			slot7 = slot0.ysz_qxgzSpine

			slot0.btnCancelFollow.effect.addChild(slot0.controller, slot0.btnCancelFollow.effect)

			slot9 = true

			slot0.ysz_qxgzSpine.setAnimation(slot0.controller, slot0.ysz_qxgzSpine, 0, "animation")
		end

		slot5 = true

		slot0.btnCancelFollow.setVisible(slot3, slot0.btnCancelFollow)

		slot5 = true

		slot0.btnCancelFollow.setEnabled(slot3, slot0.btnCancelFollow)
	elseif slot1 == 4 then
		slot5 = false

		slot0.btnUnAdd.setVisible(slot3, slot0.btnUnAdd)

		slot5 = false

		slot0.btnAllbet.setVisible(slot3, slot0.btnAllbet)

		slot5 = false

		slot0.btnFollowBet.setVisible(slot3, slot0.btnFollowBet)

		slot5 = false

		slot0.btnAddBet.setVisible(slot3, slot0.btnAddBet)

		slot5 = false

		slot0.btnCancelFollow.setVisible(slot3, slot0.btnCancelFollow)

		slot5 = false

		slot0.btnFollow.setVisible(slot3, slot0.btnFollow)

		slot5 = false

		slot0.btnCancel.setVisible(slot3, slot0.btnCancel)

		slot5 = false

		slot0.btnCancel.setVisible(slot3, slot0.btnCancel)
	end

	slot5 = slot1

	slot0.setBtnPos(slot3, slot0)
end

YszBtnCcsView.setBtnPos = function (slot0, slot1)
	if slot1 == 1 then
		slot6 = 54.5

		slot0.btnCancel.setPosition(slot3, slot0.btnCancel, 147.5)
	else
		slot6 = 54.5

		slot0.btnCancel.setPosition(slot3, slot0.btnCancel, 533.5)
	end
end

YszBtnCcsView.changeState = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot2) ~= nil then
		slot3 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot2)[1] == nil or slot0.isClickAllIn then
			slot4 = 4

			slot0.setModel(slot2, slot0)

			return
		end
	end

	slot4 = slot0.model

	if slot0.model.getNMaxRounds(slot0.model) < slot0.model.getNCurRounds(slot2) then
		slot3 = slot0

		slot0.reset(slot2)

		return
	end

	slot3 = slot0.model

	if slot0.model.getWaitCompareData(slot2) == nil then
		slot4 = slot0.model
		slot1 = slot0.model.getLCellScore(slot2) * slot0.model.getLCurrentTimes(slot0.model)
		slot4 = slot0.model

		if slot0.model.getBMingZhu(slot0.model)[1] then
			slot1 = slot1 * 2
		end

		slot4 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot3)[1].lScore >= slot1 then
			slot4 = slot0.model

			if slot0.model.getIsAllIn(slot3) then
				slot5 = slot0.model

				if slot0.model.getWCurrentUser(slot3) == slot0.model.getMeWChairID(slot0.model) then
					slot5 = false

					slot0.model.setBAllFollow(slot3, slot0.model)

					slot5 = "玩家自己不够钱或对方已经allin了"

					slot0.controller.sendlog(slot3, slot0.controller)

					slot5 = 1

					slot0.setModel(slot3, slot0)

					slot5 = true

					slot0.btnAddBet.setVisible(slot3, slot0.btnAddBet)

					slot5 = false

					slot0.btnAddBet.setEnabled(slot3, slot0.btnAddBet)

					return
				end
			end
		end
	else
		slot4 = 4

		slot0.setModel(slot2, slot0)

		return
	end

	slot3 = slot0.model

	if slot0.model.getBAllFollow(slot2) then
		slot3 = slot0.model

		if not slot0.model.getBMeCompare(slot2) then
			slot3 = "=====自动====="

			print(slot2)

			slot3 = "自动发送跟注请求"

			trace(slot2)

			slot5 = ",请求已经发送"

			slot0.controller.sendlog(slot2, slot0.controller, "自动发送跟注请求")

			slot4 = 2

			slot0.controller.reqClientError(slot2, slot0.controller)

			slot5 = 1

			slot0.controller.reqAddScore(slot2, slot0.controller, 1)
		else
			slot5 = "因为还在比牌状态"

			slot0.controller.sendlog(slot2, slot0.controller, "自动发送跟注请求，但不成功")

			slot4 = 3

			slot0.controller.reqClientError(slot2, slot0.controller)
		end

		slot4 = 3

		slot0.setModel(slot2, slot0)

		return
	end

	slot3 = slot0.model

	if slot0.model.getIsShowMenu(slot2) then
		slot4 = "正常菜单显示:样式1"

		slot0.controller.sendlog(slot2, slot0.controller)

		slot4 = 1

		slot0.setModel(slot2, slot0)

		slot1 = 1
		slot4 = slot0.model

		if slot0.model.getBMingZhu(slot0)[1] then
			slot1 = slot1 * 2
		end

		slot4 = slot0.model

		if slot0.model.getLCurrentTimes(slot3) < YszBetMenuCcsView.LVEL_4 then
			slot4 = slot0.model

			if slot0.model.getMyTablePlayingUserData(slot3)[1] ~= nil then
				slot6 = slot0.model

				if slot0.model.getMyTablePlayingUserData(slot3)[1].lScore > slot0.model.getLCellScore(slot0.model) * slot0.model.getLCurrentTimes(slot0.model) * slot1 then
					slot5 = "正常菜单显示:当前注额还不是最大，而且身上的钱可以加注"

					slot0.controller.sendlog(slot3, slot0.controller)

					slot6 = true

					slot0.model.setIsShowBetMenu(slot3, slot0.model, true)

					slot5 = false

					slot0.btnAddBet.setVisible(slot3, slot0.btnAddBet)
				end
			end
		else
			slot5 = "正常菜单显示:当前注额已是最大"

			slot0.controller.sendlog(slot3, slot0.controller)

			slot5 = true

			slot0.btnAddBet.setVisible(slot3, slot0.btnAddBet)

			slot5 = false

			slot0.btnAddBet.setEnabled(slot3, slot0.btnAddBet)
		end
	else
		slot3 = slot0.model

		if slot0.model.getIsAllIn(slot2) == false then
			slot4 = 2

			slot0.setModel(slot2, slot0)
		else
			slot4 = 4

			slot0.setModel(slot2, slot0)
		end
	end
end

YszBtnCcsView.onChangeCompareScore = function (slot0)
	slot4 = slot0.model

	if slot0.model.getWCurrentUser(slot2) == slot0.model.getMeWChairID(slot0.model) then
		slot3 = slot0.model

		if not slot0.model.getBAllFollow(slot2) then
			slot3 = slot0

			slot0.changeState(slot2)
		end
	end
end

YszBtnCcsView.reset = function (slot0)
	slot3 = "==========YszBtnCcsView:reset=============="

	print(slot2)

	slot3 = slot0

	slot0.closeBtnEnable(slot2)

	slot0.isClickAllIn = false
	slot4 = false

	slot0.btnUnAdd.setVisible(slot2, slot0.btnUnAdd)

	slot4 = false

	slot0.btnAllbet.setVisible(slot2, slot0.btnAllbet)

	slot4 = false

	slot0.btnFollowBet.setVisible(slot2, slot0.btnFollowBet)

	slot4 = false

	slot0.btnAddBet.setVisible(slot2, slot0.btnAddBet)

	slot4 = false

	slot0.btnCancelFollow.setVisible(slot2, slot0.btnCancelFollow)

	slot4 = false

	slot0.btnFollow.setVisible(slot2, slot0.btnFollow)

	slot4 = false

	slot0.btnCancel.setVisible(slot2, slot0.btnCancel)

	slot4 = false

	slot0.btnAllbet.effect.setVisible(slot2, slot0.btnAllbet.effect)
end

return
