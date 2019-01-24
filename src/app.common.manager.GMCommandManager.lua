slot2 = "GMCommandManager"
GMCommandManager = class(slot1)

GMCommandManager.ctor = function (slot0)
	slot0.m_sGmCmdReg = "^###()"
	slot0.m_sGmCmdReg2 = "^@()"
	slot0.m_tGmCmdList = {
		fps = function (slot0, slot1)
			slot4 = cc.Director
			slot5 = cc.Director
			slot6 = not cc.Director.getInstance(slot3).isDisplayStats(slot3)

			cc.Director.getInstance(cc.Director.getInstance(slot3)).setDisplayStats(cc.Director.getInstance(slot3), cc.Director.getInstance(cc.Director.getInstance(slot3)))
		end,
		killtick = function (slot0, slot1)
			slot4 = tickMgr

			tickMgr.stopTick(slot3)
		end,
		rc = function (slot0, slot1)
			slot7 = 3000

			tickMgr.delayedCall(slot4, tickMgr, function ()
				slot2 = mainMgr

				mainMgr.try2Reconnect(slot1)
			end)
		end,
		share = function (slot0, slot1)
			slot7 = 1000

			tickMgr.delayedCall(slot4, tickMgr, function ()
				slot2 = mainMgr

				mainMgr.capture2Share(slot1)
			end)
		end,
		showlog = function (slot0, slot1)
			slot5 = true

			ProxyDebugLog.setEntranceShowing(slot3, ProxyDebugLog)
		end,
		hidelog = function (slot0, slot1)
			slot5 = false

			ProxyDebugLog.setEntranceShowing(slot3, ProxyDebugLog)
		end,
		debugmark = function (slot0, slot1)
			DebugUtil.enableMark = not DebugUtil.enableMark
			slot4 = "debug mark标识："
			slot7 = DebugUtil.enableMark

			trace(not DebugUtil.enableMark, tostring(slot6))
		end,
		updatelog = function (slot0, slot1)
			slot4 = "UpdateLogModule"

			requireModule(slot3)

			slot4 = ProxyUpdateLog

			ProxyUpdateLog.show(slot3)
		end,
		multitouch = function (slot0, slot1)
			BaseCcsBtn.multiTouchEnabled = not BaseCcsBtn.multiTouchEnabled
			slot4 = tweenMsgMgr
			slot8 = (BaseCcsBtn.multiTouchEnabled and "开启") or "关闭"

			tweenMsgMgr.showWhiteMsg(slot3, string.format(slot6, "按钮多点触控开关：%s"))
		end,
		reqtrack = function (slot0, slot1)
			slot4 = trackMgr

			trackMgr.requestTrackInfoHttp(slot3)
		end,
		newbie = function (slot0, slot1)
			if Hero.setNewbieData then
				slot5 = "已重置引导，请重新登录"

				tweenMsgMgr.showRedMsg(slot3, tweenMsgMgr)

				slot5 = nil

				Hero.setNewbieData(slot3, Hero)
			else
				slot5 = "需登录后才能重制引导"

				tweenMsgMgr.showRedMsg(slot3, tweenMsgMgr)
			end
		end,
		lip = function (slot0, slot1)
			slot5 = slot1[2]

			if StringUtil.isStringValid(slot4) then
				slot6 = ":"
				FORCE_IP = string.split(slot4, slot2)[1]
				FORCE_PORT = string.split(slot4, slot2)[2]
				slot6 = SOCKET_TYPE_LOAD

				socketMgr.close(slot4, socketMgr)

				slot9 = FORCE_IP
				slot11 = FORCE_PORT
				slot6 = "强制设定登陆服ip:port为：" .. tostring(slot8) .. ":" .. tostring(slot10)

				popupMgr.showAlert(slot4, popupMgr)
			else
				slot6 = "清空子游戏服务器强制设定的ip:port"

				tweenMsgMgr.showGreenMsg(slot4, tweenMsgMgr)

				FORCE_IP = nil
				FORCE_PORT = nil
			end
		end,
		httpcache = function (slot0, slot1)
			if not IS_TEST_HTTP_CACHE then
				IS_TEST_HTTP_CACHE = true
			else
				IS_TEST_HTTP_CACHE = false
			end

			slot8 = IS_TEST_HTTP_CACHE
			slot5 = "http缓存状态:" .. tostring(slot7)

			tweenMsgMgr.showWhiteMsg(slot3, tweenMsgMgr)
		end,
		gip = function (slot0, slot1)
			slot5 = slot1[2]

			if StringUtil.isStringValid(slot4) then
				FORCE_GAME_IP = slot2
				slot6 = "强制设定所有子游戏服务器ip为：" .. slot2

				tweenMsgMgr.showGreenMsg(slot4, tweenMsgMgr)
			else
				slot6 = "清空子游戏服务器强制设定的ip"

				tweenMsgMgr.showGreenMsg(slot4, tweenMsgMgr)

				FORCE_GAME_IP = nil
			end
		end,
		gps = function (slot0, slot1)
			slot5 = slot1[2]

			slot0.checkGpsGm(slot3, slot0)
		end,
		lgip = function (slot0, slot1)
			slot6 = "lip"
			slot6 = string.gsub(slot3, slot0, "lgip")

			slot0:doSend(slot0)

			slot7 = "gip"
			slot7 = string.gsub(slot0, slot0, "lgip")

			slot0:doSend(slot0)
		end,
		sockettimeout = function (slot0, slot1)
			slot4 = networkMgr

			networkMgr.onNetworkHeardTimeOut(slot3)
		end,
		socket = function (slot0, slot1)
			slot4 = "socket连接状态："
			slot8 = SOCKET_TYPE_ROOM

			trace(slot3, socketMgr.isConnected(slot6, socketMgr))
		end,
		killtween = function (slot0, slot1)
			slot4 = TweenLite.driveTimer

			TweenLite.driveTimer.stop(slot3)
		end,
		showwebview = function (slot0, slot1)
			CHARGE_SHOW_WEBVIEW = true
			slot5 = "已打开支付webview"

			tweenMsgMgr.showRedMsg(slot3, tweenMsgMgr)
		end,
		chargefinish = function (slot0, slot1)
			CHARGE_AUTO_FINISH_key845234 = true
			slot5 = "已开启充值自动完成"

			tweenMsgMgr.showRedMsg(slot3, tweenMsgMgr)
		end,
		cb = function (slot0, slot1)
			if MainManager_readClipBoard then
				slot5 = "粘贴版内容是：\n" .. tostring(MainManager_readClipBoard())

				popupMgr.showAlert(slot3, popupMgr)
			else
				slot5 = "该包不支持读取粘贴板！"

				popupMgr.showAlert(slot3, popupMgr)
			end
		end,
		error = function (slot0, slot1)
			slot4 = "报错测试"

			error(slot3)
		end,
		mid = function (slot0, slot1)
			slot4 = "机器码是："
			slot7 = bridgeMgr

			trace(slot3, bridgeMgr.getPhoneUUId(slot6))
		end,
		debugpng = function ()
			slot5 = true
			slot4 = DisplayUtil.getMsgOfPng(ResConfig.getResPath(slot3, "Default/Button_Disable.png"))

			trace(ResConfig.getResPath, "信息是")
		end
	}
end

GMCommandManager.checkGmCommand = function (slot0, slot1)
	slot4 = slot1
	slot5 = slot0.m_sGmCmdReg

	if string.match(slot3, string.rtrim(slot3)) then
		slot6 = slot2

		if #string.sub(slot4, slot1) > 0 then
			slot6 = slot1

			return slot0.doSend(slot4, slot0)
		else
			return false
		end
	else
		slot6 = slot0.m_sGmCmdReg2

		if string.match(slot4, slot1) then
			slot6 = slot2

			if #string.sub(slot4, slot1) > 0 then
				slot7 = true

				return slot0.doSend(slot4, slot0, slot1)
			else
				return false
			end
		else
			return false
		end
	end
end

GMCommandManager.showGmCmdPopup = function (slot0)
	slot7 = "c125"

	function slot6(slot0)
		slot4 = slot0

		if not slot0.checkGmCommand(slot2, slot0) then
			slot3 = tweenMsgMgr
			slot6 = "c124"

			tweenMsgMgr.showRedMsg(slot2, I18n.get(slot5))
		end
	end

	popupMgr.showInput(slot3, popupMgr, I18n.get(slot6))
end

GMCommandManager.doSend = function (slot0, slot1, slot2)
	slot3 = false
	slot6 = slot1

	if StringUtil.isStringValid(slot5) then
		slot3 = true
		slot7 = " "
		slot7 = string.split(slot5, slot1)[1]
		slot6 = string.lower(slot1) and slot0.m_tGmCmdList[slot5]

		if slot6 then
			slot9 = slot6

			if type(slot8) == "function" and not slot2 then
				slot10 = slot4

				slot6(slot8, slot1)
			end
		else
			slot3 = false
		end
	end

	return slot3
end

GMCommandManager.checkGpsGm = function (slot0, slot1)
	slot4 = slot1

	if parseInt(slot3) ~= 0 then
		if not ({
			"MainManager_jump2AlbumAuthorization",
			"MainManager_isAlbumReadAllow",
			"MainManager_reqAlbumAuthorization",
			"MainManager_readGeoesFromAlbum",
			"MainManager_getLocationAuthorization",
			"MainManager_jump2LocationAuthorization",
			"MainManager_startLocation",
			"MainManager_stopLocation",
			"MainManager_getWifiInfo",
			"MainManager_getCellInfo",
			"MainManager_getCDMAInfo",
			"MainManager_isCdma",
			"MainManager_reqLocationAuthorization"
		})[slot1] then
			slot3 = "___shengsNotExitFunc"
		end

		slot3 = ()[slot1] or "___shengsNotExitFunc"
		slot11 = tostring(slot12)
		slot14 = _G[()[slot1] or "___shengsNotExitFunc"]

		trace(string.format(slot8, "gps gm 函数: %s, %s, %s", slot1, tostring(()[slot1] or "___shengsNotExitFunc")))

		if _G[()[slot1] or "___shengsNotExitFunc"] then
			if slot1 == 3 then
				slot8 = "请求相册权限"

				trace(slot7)

				function slot8(slot0)
					slot4 = slot0

					trace(slot2, "请求相册权限返回:")
				end

				MainManager_reqAlbumAuthorization(slot7)
			elseif slot1 == 4 then
				slot8 = "请求相册geos"

				trace(slot7)

				function slot10(slot0)
					slot3 = "请求相册geos返回:"

					trace(slot2)

					slot3 = slot0

					trace_r(slot2)
				end

				MainManager_readGeoesFromAlbum(slot7, 0, 10)
			elseif slot1 == 7 then
				slot8 = "请求gps信息"

				trace(slot7)

				slot9 = true

				MainManager_startLocation(slot7, function (slot0, slot1, slot2)
					slot10 = slot2

					trace(string.format(slot6, "gps信息返回：%s, %s, %s", slot0, slot1))
				end)
			elseif slot1 == 13 then
				slot8 = "请求定位权限"

				trace(slot7)

				function slot8(slot0)
					slot4 = slot0

					trace(slot2, "请求定位权限返回")
				end

				MainManager_reqLocationAuthorization(slot7)
			else
				slot11 = slot4()

				trace(string.format(slot9, "执行后返回: %s"))
			end
		end
	end
end

gmMgr = GMCommandManager.new()

return
