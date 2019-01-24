slot2 = "BridgeManager"
slot0 = class(slot1)
GdtEventType = {
	kAddToCart = 2,
	kSearch = 5,
	kStart = 6,
	kScore = 4,
	kPurchase = 3,
	kRegister = 1
}

slot0.ctor = function (slot0)
	slot0._bridge = nil
	slot0._mainMgrClazz = nil
	slot0._yybHelpClazz = "org/cocos2dx/lua/YYBJniHelper"
	slot0._sdkHelpClazz = "org/cocos2dx/lua/SDKHelper"
	slot3 = cc.Application
	slot3 = cc.Application.getInstance(slot2)

	if cc.Application.getInstance(slot2).getTargetPlatform(slot2) == cc.PLATFORM_OS_ANDROID then
		slot4 = "cocos.cocos2d.luaj"
		slot0._bridge = require(slot3)
		slot0._mainMgrClazz = "com/shunwo/MainManager"
	elseif slot1 == cc.PLATFORM_OS_IPHONE or slot1 == cc.PLATFORM_OS_IPAD then
		slot4 = "cocos.cocos2d.luaoc"
		slot0._bridge = require(slot3)
		slot0._mainMgrClazz = "MainManager"
	end
end

slot0.saveFileToAlbum = function (slot0, slot1, slot2, slot3)
	slot4 = {}

	if isAndroid then
		slot4 = {
			tostring(slot7),
			slot2 or 0,
			slot3 or 0
		}
		slot10 = 1
		sig = "(" .. string.rep(slot1, "Ljava/lang/String;") .. "II)V"
	else
		slot4.filePath = slot1
		slot4.onSuccess = slot2
		slot4.onError = slot3
	end

	slot7 = "保存图片到相册"

	trace(slot6)

	slot7 = slot4

	trace_r(slot6)

	slot10 = sig

	return slot0.callMainManager(slot6, slot0, "saveFileToAlbum", slot4)
end

slot0.stopGps = function (slot0)
	return slot0.callMainManager(slot2, slot0, "stopGps", nil)
end

slot0.jumpTo3rdApp = function (slot0, slot1, slot2, slot3)
	slot4 = {}

	if isAndroid then
		slot8 = slot1
		slot10 = 2
		slot12 = "(" .. string.rep(slot2, {
			tostring(slot7),
			tostring(slot7),
			slot3 or 0
		}) .. "I)V"

		return slot0.callMainManager("I)V", slot0, "jump2App", )
	else
		return 0
	end
end

slot0.jump2Wechat = function (slot0)
	slot3 = slot0

	if not slot0.isInstallWeChat(slot2) then
		popupMgr.showAlert(slot2, popupMgr, "请先安装微信客户端", nil)

		return 0
	end

	if isAndroid then
		slot5 = "com.tencent.mm.ui.LauncherUI"

		slot0.jumpTo3rdApp(slot2, slot0, "com.tencent.mm")
	elseif isMobile then
		slot3 = "weixin://"

		OSUtil.openURL(slot2)
	else
		return 0
	end

	return 1
end

slot0.gotoLocationSetting = function (slot0)
	if isMobile then
		return slot0.callMainManager(slot2, slot0, "gotoLocationSetting", nil)
	end
end

slot0.startGps = function (slot0)
	return slot0.callMainManager(slot2, slot0, "startGps", nil)
end

slot0.setLbsUpdateCallback = function (slot0, slot1)
	return
end

slot0.payAlipay = function (slot0, slot1, slot2, slot3)
	slot4 = {}

	if isAndroid then
		slot4 = {
			tostring(slot7),
			slot2 or 0,
			slot3 or 0
		}
		slot10 = 1
		sig = "(" .. string.rep(slot1, "Ljava/lang/String;") .. "II)V"
	else
		slot4.orderInfo = slot1
		slot4.appScheme = APP_SCHEME
		slot4.onSuccessLuaCallback = slot2
		slot4.onErrorLuaCallback = slot3
	end

	slot7 = "准备拉起支付宝支付"

	trace(slot6)

	slot7 = slot4

	trace_r(slot6)

	slot10 = sig

	return slot0.callMainManager(slot6, slot0, "payAlipay", slot4)
end

slot0.payWx = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot10 = nil
	slot11 = {
		appid = slot3,
		noncestr = slot5,
		package = slot2,
		partnerid = slot4,
		prepayid = slot1,
		sign = slot7,
		timestamp = tostring(slot13)
	}
	slot14 = slot6
	slot12 = {}

	if isAndroid then
		slot16 = slot11.appid
		slot16 = slot11.noncestr
		slot16 = slot11.package
		slot16 = slot11.partnerid
		slot16 = slot11.prepayid
		slot16 = slot11.sign
		slot12 = {
			tostring(slot15),
			tostring(slot15),
			tostring(slot15),
			tostring(slot15),
			tostring(slot15),
			tostring(slot15),
			tostring(slot15),
			slot8 or 0,
			slot9 or 0
		}
		slot18 = 7
		slot10 = "(" .. string.rep(slot11.timestamp, "Ljava/lang/String;") .. "II)V"
	else
		slot11.onSuccessLuaCallback = slot8
		slot11.onErrorLuaCallback = slot9
	end

	slot15 = "准备拉起微信支付"

	trace(slot14)

	slot15 = slot12

	trace_r(slot14)

	slot18 = slot10

	return slot0.callMainManager(slot14, slot0, "payWx", slot12)
end

slot0.payWxByTH = function (slot0, slot1, slot2, slot3, slot4)
	slot5, slot6 = nil

	if isAndroid then
		slot5 = {
			slot1,
			slot2,
			slot3,
			slot4
		}
		slot6 = "(Ljava/lang/String;FII)V"
	else
		slot5 = {
			token = slot1,
			money = slot2,
			onSuccessLuaCallback = slot3,
			onErrorLuaCallback = slot4
		}
	end

	slot12 = slot6

	return slot0.callMainManager(slot8, slot0, "payWxByTH", slot5)
end

slot0.copy2ClipBoard = function (slot0, slot1)
	slot2 = nil
	slot7 = (not isAndroid or {
		slot1
	}) and {
		content = slot1
	}

	return slot0.callMainManager(slot4, slot0, "copy2ClipBoard")
end

slot0.setWebappShow = function (slot0)
	slot6 = {}

	return slot0.callMainManager(slot3, slot0, "setWebappShow")
end

slot0.addMainCallback = function (slot0, slot1)
	slot2 = nil
	slot7 = (not isAndroid or {
		slot1
	}) and {
		luaMainCallback = slot1
	}

	return slot0.callMainManager(slot4, slot0, "addMainCallback")
end

slot0.deleteOauth = function (slot0)
	slot4 = "deleteOauth"

	return slot0.callMainManager(slot2, slot0)
end

slot0.registerWechat = function (slot0, slot1)
	if isMobile then
		slot2 = nil
		slot7 = (not isAndroid or {
			slot1
		}) and {
			wechatAppId = slot1
		}

		return slot0.callMainManager(slot4, slot0, "registerWechat")
	end
end

slot0.shareWechat = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if isMobile then
		slot7 = nil
		slot13 = "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V"

		return slot0.callMainManager(slot9, slot0, "shareWechat", (not isAndroid or {
			slot1,
			slot2,
			slot3,
			slot4,
			slot5,
			slot6
		}) and {
			title = slot1,
			content = slot2,
			webpageUrl = slot3,
			thumbUrl = slot4,
			isCircleOrChat = slot5,
			onWXShareRespCallback = slot6
		})
	end
end

slot0.reqAuthWithUserInfoFromWechat = function (slot0, slot1, slot2)
	slot3 = nil
	slot9 = "(II)V"

	return slot0.callMainManager(slot5, slot0, "reqAuthWithUserInfoFromWechat", (not isAndroid or {
		slot1,
		slot2
	}) and {
		luaOnAuth = slot1,
		state = slot2
	})
end

slot0.startNetworkListener = function (slot0, slot1)
	slot2 = nil
	slot7 = (not isAndroid or {
		slot1
	}) and {
		luaOnNetworkChanged = slot1
	}

	return slot0.callMainManager(slot4, slot0, "addNetworkChangedListener")
end

slot0.getNetJsonInfo = function (slot0)
	slot6 = "()Ljava/lang/String;"

	if slot0.callMainManager(slot2, slot0, "getNetInfo", nil) then
		slot4 = slot1

		return cjson.decode(slot3)
	else
		return nil
	end
end

slot0.vibra = function (slot0)
	slot5 = args

	slot0.callMainManager(slot2, slot0, "vibra")
end

slot0.getBatteryInfo = function (slot0)
	slot6 = "()Ljava/lang/String;"

	if slot0.callMainManager(slot2, slot0, "getBatteryInfo", nil) then
		slot4 = slot1

		return cjson.decode(slot3)
	else
		return nil
	end
end

slot0.getPhoneIMEI = function (slot0)
	slot6 = "()Ljava/lang/String;"

	return slot0.callMainManager(slot2, slot0, "getPhoneIMEI", nil)
end

slot0.getPhoneMacAddr = function (slot0)
	slot6 = "()Ljava/lang/String;"

	return slot0.callMainManager(slot2, slot0, "getPhoneMacAddr", nil)
end

slot0.getPhoneModel = function (slot0)
	slot6 = "()Ljava/lang/String;"

	return slot0.callMainManager(slot2, slot0, "getPhoneModel", nil)
end

slot0.getPhoneOSVer = function (slot0)
	slot6 = "()Ljava/lang/String;"

	return slot0.callMainManager(slot2, slot0, "getPhoneOSVer", nil)
end

slot0.getPhoneChanId = function (slot0)
	slot6 = "()Ljava/lang/String;"

	return slot0.callMainManager(slot2, slot0, "getPhoneChanId", nil)
end

slot0.getPhoneOperator = function (slot0)
	slot6 = "()Ljava/lang/String;"

	return slot0.callMainManager(slot2, slot0, "getPhoneOperator", nil)
end

slot0.getPhoneNettype = function (slot0)
	slot6 = "()Ljava/lang/String;"

	return slot0.callMainManager(slot2, slot0, "getPhoneNettype", nil)
end

slot0.getPhoneUUId = function (slot0, slot1)
	slot2 = nil

	if slot0._uuid then
		return slot0._uuid
	else
		if IS_IOS_VERIFY and not IS_IOS_VERIFY_ALL then
			slot5 = Hero
			slot5 = Hero.getMachineId4IosVerify(slot4)

			if not StringUtil.isStringValid(slot4) then
				slot8 = 1000000
				slot8 = tickMgr
				slot5 = math.random(slot6, 0) * tickMgr.getTime(0)
				slot6 = tostring(slot4)

				Hero.setMachineId4IosVerify(slot4, Hero)
			end
		elseif isMobile then
			slot5 = Hero
			slot5 = Hero.getMachineIdInSO(slot4)

			if not StringUtil.isStringValid(slot4) then
				slot8 = "()Ljava/lang/String;"
				slot6 = slot0.callMainManager(slot4, slot0, "getPhoneUUId", nil)

				Hero.setMachineIdInSO(slot4, Hero)
			end
		else
			slot2 = "desktop"

			if not slot1 then
				slot7 = 10000
				slot2 = slot2 .. math.random(slot5, 0)
			end
		end

		slot6 = false
		slot2 = StringUtil.md5sum(slot4, slot2)

		if not IS_IOS_VERIFY or IS_IOS_VERIFY_ALL or not not IS_IOS_VERIFY_ALL_NO_BANK then
			slot0._uuid = slot2
		end

		return slot2
	end
end

slot0.getRoomId = function (slot0)
	slot6 = "()Ljava/lang/String;"

	return slot0.callMainManager(slot2, slot0, "getRoomId", nil)
end

slot0.setRoomId = function (slot0, slot1)
	slot4 = slot1
	slot1 = tostring(slot3)
	slot2 = {}

	if isAndroid then
		slot2[1] = slot1
	else
		slot2.roomId = slot1
	end

	slot8 = "(Ljava/lang/String;)V"

	return slot0.callMainManager(slot4, slot0, "setRoomId", slot2)
end

slot0.payForRechargeIos = function (slot0, slot1, slot2, slot3)
	if isMobile and not isAndroid then
		slot10 = nil

		slot0.callMainManager(slot6, slot0, "payForRecharge", {
			productId = slot1,
			onFinish = slot2,
			onFailed = slot3
		})
	end
end

slot0.canOpenURL = function (slot0, slot1)
	slot0._urlOpenCacheDic = slot0._urlOpenCacheDic or {}
	slot2 = slot0._urlOpenCacheDic[slot1]

	if isMobile and not isAndroid and slot2 == nil then
		slot9 = nil
		slot0._urlOpenCacheDic[slot1] = slot0.callMainManager(slot5, slot0, "canOpenURL", {
			url = slot1
		}) == 1
	end

	return slot2
end

slot0.isInstallQQ = function (slot0)
	slot1 = false

	if isMobile then
		if isAndroid then
			return true
		else
			slot5 = "mqq://"
			slot1 = slot0.canOpenURL(slot3, slot0)
		end
	end

	return slot1
end

slot0.isInstallAli = function (slot0)
	slot1 = false

	if isMobile then
		if isAndroid then
			slot7 = "()I"
			slot1 = slot0.callMainManager(slot3, slot0, "isInstallAli", nil) == 1
		elseif isSupportAlipayScheme then
			slot7 = "()I"
			slot1 = slot0.callMainManager(slot3, slot0, "isInstallAli", nil) == 1
		else
			slot1 = true
		end
	end

	return slot1
end

slot0.isInstallWeChat = function (slot0)
	slot1 = false

	if isMobile then
		slot7 = "()I"

		return slot0.callMainManager(slot3, slot0, "isInstallWeChat", nil) == 1
	end
end

slot0.setStatusBarOrientation = function (slot0, slot1)
	if isMobile then
		slot2 = {}

		if isAndroid then
			slot2[1] = slot1 or false
		else
			slot2.isLandscapeOrPortrait = slot1 or false
		end

		slot8 = "(Z)V"

		slot0.callMainManager(slot4, slot0, "setStatusBarOrientation", slot2)
	end
end

slot0.callMainManager = function (slot0, slot1, slot2, slot3)
	slot4 = false
	slot5 = nil

	if slot0._bridge then
		slot11 = slot3
		slot4, slot5 = slot0._bridge.callStaticMethod(slot7, slot0._mainMgrClazz, slot1, slot2)
	end

	if slot4 then
		return slot5
	else
		return nil
	end
end

slot0.loginYybQQ = function (slot0, slot1)
	slot8 = "(I)V"

	slot0.callYYBJniHelp(slot4, slot0, "loginQQ", {
		slot1
	})
end

slot0.loginYybWX = function (slot0, slot1)
	slot8 = "(I)V"

	slot0.callYYBJniHelp(slot4, slot0, "loginWX", {
		slot1
	})
end

slot0.loginYybGuest = function (slot0, slot1)
	slot8 = "(I)V"

	slot0.callYYBJniHelp(slot4, slot0, "loginGuest", {
		slot1
	})
end

slot0.logoutYyb = function (slot0, slot1)
	slot8 = "(I)V"

	slot0.callYYBJniHelp(slot4, slot0, "loginOut", {
		slot1
	})
end

slot0.rechargeYyb = function (slot0, slot1, slot2, slot3, slot4)
	slot11 = 3
	slot13 = "(" .. string.rep(slot9, slot6) .. "I)V"

	slot0.callYYBJniHelp("I)V", slot0, "recharge", {
		slot1,
		slot2,
		slot3,
		slot4
	})
end

slot0.isInstallQQYyb = function (slot0)
	slot6 = "()Z"

	return slot0.callYYBJniHelp(slot2, slot0, "isQQInstalled", nil)
end

slot0.isInstallWxYyb = function (slot0)
	slot6 = "()Z"

	return slot0.callYYBJniHelp(slot2, slot0, "isWXInstalled", nil)
end

slot0.queryQQUserInfo = function (slot0, slot1)
	slot8 = "(I)V"

	slot0.callYYBJniHelp(slot4, slot0, "queryQQUserInfo", {
		slot1
	})
end

slot0.queryWXUserInfo = function (slot0, slot1)
	slot8 = "(I)V"

	slot0.callYYBJniHelp(slot4, slot0, "queryWXUserInfo", {
		slot1
	})
end

slot0.logEventYyb = function (slot0, slot1)
	if not IS_YYB then
		return
	end

	slot8 = "(I)V"

	slot0.callYYBJniHelp(slot4, slot0, "logEvent", {
		slot1
	})
end

slot0.callYYBJniHelp = function (slot0, slot1, slot2, slot3)
	slot4 = false
	slot5 = nil

	if slot0._bridge then
		slot11 = slot3
		slot4, slot5 = slot0._bridge.callStaticMethod(slot7, slot0._yybHelpClazz, slot1, slot2)
	end

	if slot4 then
		return slot5
	else
		return nil
	end
end

slot0.setAutorotate = function (slot0, slot1)
	if isSupportAutoRotate then
		slot1 = true
		slot2 = {}

		if isAndroid then
			slot2[1] = slot1
		else
			slot2.isAutorotate = slot1
		end

		slot8 = "(Z)V"

		slot0.callMainManager(slot4, slot0, "setAutorotate", slot2)
	end
end

slot0.isInstallPotato = function (slot0)
	slot6 = "()I"

	return slot0.callMainManager(slot2, slot0, "isInstallPotato", nil) == 1
end

slot0.reqPotatoAuth = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = nil
	slot11 = "(Ljava/lang/String;Ljava/lang/String;II)V"

	slot0.callMainManager(slot7, slot0, "reqPotatoAuth", (not isAndroid or {
		slot1,
		slot2,
		slot3,
		slot4
	}) and {
		clientId = slot1,
		secretKey = slot2,
		successCallback = slot3,
		failCallback = slot4
	})
end

slot0.loginSDK = function (slot0, slot1)
	if not CUR_SDK_TYPE then
		return
	end

	slot8 = "(I)V"

	slot0.callSDKJniHelp(slot4, slot0, "login", {
		slot1
	})
end

slot0.exitSDK = function (slot0, slot1)
	if not CUR_SDK_TYPE then
		return
	end

	slot8 = "(I)V"

	slot0.callSDKJniHelp(slot4, slot0, "exit", {
		slot1
	})
end

slot0.rechargeSDK = function (slot0, slot1, slot2)
	slot10 = "(Ljava/lang/String;I)V"

	slot0.callSDKJniHelp(slot6, slot0, "recharge", {
		slot1,
		slot2
	})
end

slot0.callSDKJniHelp = function (slot0, slot1, slot2, slot3)
	slot4 = false
	slot5 = nil

	if slot0._bridge then
		slot11 = slot3
		slot4, slot5 = slot0._bridge.callStaticMethod(slot7, slot0._sdkHelpClazz, slot1, slot2)
	end

	if slot4 then
		return slot5
	else
		return nil
	end
end

slot0.setupGDT = function (slot0, slot1, slot2)
	if IS_USE_GDK then
		args = {
			actionSetId = slot1,
			secretKey = slot2
		}
		slot7 = args

		slot0.callMainManager(slot4, slot0, "setupGDT")
	end
end

slot0.logGDTAction = function (slot0, slot1, slot2)
	if IS_USE_GDK then
		args = {
			actionType = slot1,
			actionParam = slot2
		}
		slot7 = args

		slot0.callMainManager(slot4, slot0, "logGDTAction")
	end
end

bridgeMgr = slot0.new()

return
