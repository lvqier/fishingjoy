slot2 = "BeginGameBean"
BeginGameBean = class(slot1)

BeginGameBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

BeginGameBean.start = function (slot0)
	slot5 = 1

	mainMgr.updateLoginLoadingInfo(slot2, mainMgr, "正在初始化游戏，请稍候")

	slot6 = 0

	tickMgr.delayedCall(mainMgr, tickMgr, function ()
		slot3 = false

		mainMgr.setIsRelogining(slot1, mainMgr)

		function slot0()
			slot3 = GameEvent.ON_BEGIN_GAME

			eventMgr.dispatch(slot1, eventMgr)

			slot2 = popupMgr
			slot5 = mainMgr

			popupMgr.showPopupNoticeDetail(slot1, mainMgr.getNoticeContent(slot4))

			if IS_IOS_VERIFY then
				if false and not IS_IOS_VERIFY_ALL and not IS_IOS_VERIFY_BANK then
					slot3 = 25
					slot4 = HtmlUtil.createFontSizeTxt(slot1, "我们应广大玩家的强烈要求，现推出<font color = '#00ff00'>免费版本</font>。\n我们承诺本游戏<font color = '#00ff00'>永久免费</font>，而且具有破产保护：\n当欢乐豆消耗光后，重新登陆会赠送大量欢乐豆，让广大玩家持续体验本游戏的乐趣！")

					popupMgr.showAlert("我们应广大玩家的强烈要求，现推出<font color = '#00ff00'>免费版本</font>。\n我们承诺本游戏<font color = '#00ff00'>永久免费</font>，而且具有破产保护：\n当欢乐豆消耗光后，重新登陆会赠送大量欢乐豆，让广大玩家持续体验本游戏的乐趣！", popupMgr)
				end
			else
				function slot4()
					slot2 = Hero

					if not Hero.getIsTourist(slot1) then
						slot2 = Hero

						if Hero.getIsUserType(slot1) ~= 0 then
							slot2 = Hero

							if not Hero.getIsBindMobile(slot1) then
								slot0 = Hero.getFirstLoginReward(slot1)
								slot3 = Hero
								slot2 = nil
								slot5 = Hero
								slot2 = (Hero.getLGrantScoreCount(slot4) <= 0 or function ()
									slot2 = "PlazaModule"

									requireModule(slot1)

									slot3 = 1

									ProxyPlaza.showNewbieReward(slot1, ProxyPlaza)
								end) and (Hero.getRegisterReward(Hero) > 0 or function ()
									slot2 = popupMgr

									popupMgr.showTouristLoginTipsPopup(slot1)
								end) and function ()
									slot2 = "PlazaModule"

									requireModule(slot1)

									slot3 = 2

									ProxyPlaza.showNewbieReward(slot1, ProxyPlaza)
								end

								if slot2 then
									slot7 = slot2

									popupMgr.push(slot4, popupMgr, POPUP_ID_TOURIST_LOGIN_TIP)
								end
							end
						end
					end

					slot2 = Hero

					if Hero.getNewPackagePromotion(slot1) then
						function slot5()
							slot2 = "PlazaModule"

							requireModule(slot1)

							slot3 = 3

							ProxyPlaza.showNewbieReward(slot1, ProxyPlaza)
						end

						popupMgr.push(slot2, popupMgr, POPUP_ID_NEW_PACKAGE)
					end

					slot2 = newbieMgr

					if not newbieMgr.isInNewbie(slot1) then
						slot2 = gameMgr

						if not gameMgr.getCurGameKind(slot1) then
							slot3 = false

							popupMgr.setIsFordbidPopupQueue(slot1, popupMgr)
						end
					end
				end

				mainMgr.requestAccountState(slot2, mainMgr)
			end

			slot2 = slot0

			slot0.finish(slot1)
		end

		function slot1()
			slot2 = ProxyLogin

			ProxyLogin.hide(slot1)
		end

		if IS_IOS_VERIFY and not IS_IOS_VERIFY_ALL and not IS_IOS_VERIFY_ALL_NO_BANK then
			slot5 = MAIN_GAME_KIND

			gameMgr.setCurGameKind(slot3, gameMgr)

			slot4 = "c_gameconfig"
			slot2 = getCSVField(slot3)
			slot3 = MAIN_GAME_KIND or 0

			if slot2[slot3] then
				slot5 = slot2.moduleName

				requireModule(slot4)

				slot7 = slot1

				_G[slot2.moduleProxyName].show(slot2.moduleProxyName, _G[slot2.moduleProxyName], slot0)
			end
		else
			slot4 = gameMgr
			slot3 = gameMgr.getLastLockServer(slot3) ~= nil
			slot7 = "PlazaModule"

			requireModule(slot6)

			slot9 = slot1

			ProxyPlaza.show(slot6, ProxyPlaza, function ()
				slot3 = 15

				Hero.checkTyRoomTimeCount(slot1, Hero)

				if Hero.checkTyRoomTimeCount and ProxyPlaza then
					slot3 = slot1

					ProxyPlaza.loginEnterGame(slot1, ProxyPlaza)
				end

				slot2 = slot2

				applyFunction(slot1)
			end)
		end

		if ProxyClientUpdater then
			slot4 = ProxyClientUpdater

			ProxyClientUpdater.destroy(slot3)

			ProxyClientUpdater = nil
		end
	end)
end

return
