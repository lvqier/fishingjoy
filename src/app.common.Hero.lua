slot2 = "HeroClass"
HeroClass = class(slot1)
HERO_KEFU = "kefu_hongdian"
HERO_COMPLAINT = "complaint_reddot"

HeroClass.ctor = function (slot0)
	slot4 = BaseHero

	ClassUtil.extends(slot2, slot0)

	slot6 = ""

	slot0.createSOProperty(slot2, slot0, "accountLoginName", BaseHero.STRING)

	slot6 = ""

	slot0.createSOProperty(slot2, slot0, "accountLoginPassword", BaseHero.STRING)

	slot6 = 0

	slot0.createSOProperty(slot2, slot0, "writeHttpCacheTime", BaseHero.NUMBER)

	slot6 = true

	createSetterGetter(slot2, slot0, "isTourist", false)

	slot5 = nil

	createSetterGetter(slot2, slot0, "pAccounts")

	slot5 = nil

	createSetterGetter(slot2, slot0, "pPassword")

	slot5 = nil

	createSetterGetter(slot2, slot0, "pBankword")

	slot6 = true

	createSetterGetter(slot2, slot0, "pNickName", nil)

	slot5 = nil

	createSetterGetter(slot2, slot0, "dynamicpass")

	slot5 = nil

	createSetterGetter(slot2, slot0, "tablepass")

	slot5 = nil

	createSetterGetter(slot2, slot0, "tjr")

	slot5 = nil

	createSetterGetter(slot2, slot0, "QQ")

	slot5 = nil

	createSetterGetter(slot2, slot0, "IDCard")

	slot5 = nil

	createSetterGetter(slot2, slot0, "szToken")

	slot5 = nil

	createSetterGetter(slot2, slot0, "cbDevice")

	slot5 = nil

	createSetterGetter(slot2, slot0, "wChairID")

	slot6 = true

	createSetterGetter(slot2, slot0, "wTableID", nil)

	slot5 = nil

	createSetterGetter(slot2, slot0, "dwUserID")

	slot6 = true

	createSetterGetter(slot2, slot0, "dwGameID", nil)

	slot5 = nil

	createSetterGetter(slot2, slot0, "dwKindID")

	slot5 = nil

	createSetterGetter(slot2, slot0, "cbStatus")

	slot6 = true

	createSetterGetter(slot2, slot0, "wFaceID", nil)

	slot5 = nil

	createSetterGetter(slot2, slot0, "wCustom")

	slot6 = true

	createSetterGetter(slot2, slot0, "cbGender", nil)

	slot5 = nil

	createSetterGetter(slot2, slot0, "cbMember")

	slot5 = nil

	createSetterGetter(slot2, slot0, "dwExperience")

	slot5 = nil

	createSetterGetter(slot2, slot0, "dwLoveliness")

	slot5 = nil

	createSetterGetter(slot2, slot0, "nGuestState")

	slot6 = true

	createSetterGetter(slot2, slot0, "IsUserType", nil)

	slot5 = nil

	createSetterGetter(slot2, slot0, "ingot")

	slot6 = true

	createSetterGetter(slot2, slot0, "bean", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "userInsure", nil)

	slot8 = true

	createSetterGetter(slot2, slot0, "userScore", 0, true, false)

	slot8 = false

	createSetterGetter(slot2, slot0, "userFakeScore", 0, true, true)

	slot6 = true

	createSetterGetter(slot2, slot0, "tyRoomTime", 0)

	slot5 = nil

	createSetterGetter(slot2, slot0, "gameVersion")

	slot5 = nil

	createSetterGetter(slot2, slot0, "yzm_IdentityID")

	slot5 = nil

	createSetterGetter(slot2, slot0, "yzm_Sum")

	slot5 = nil

	createSetterGetter(slot2, slot0, "bcancel")

	slot6 = true

	slot0.createSOProperty(slot2, slot0, "isFirstOpen", BaseHero.BOOLEAN)

	slot6 = true

	slot0.createSOProperty(slot2, slot0, "need2ShowKfMsg", BaseHero.BOOLEAN)

	slot6 = false

	slot0.createSOProperty(slot2, slot0, "isExistQualityType", BaseHero.BOOLEAN)

	slot6 = false

	slot0.createSOProperty(slot2, slot0, "qualityType", BaseHero.BOOLEAN)

	slot5 = nil

	createSetterGetter(slot2, slot0, "isInTestRoom")

	slot6 = true

	createSetterGetter(slot2, slot0, "isBindWx", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isBindMobile", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "bindPhone", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "lGrantScoreCount", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "firstLoginReward", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "registerReward", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "isOpenApplePay", true)

	slot6 = "1"

	slot0.createSOProperty(slot2, slot0, "isShowSjbGuessBuyNotice", BaseHero.STRING)

	slot6 = ""

	slot0.createSOProperty(slot2, slot0, "openid", BaseHero.STRING)

	slot6 = ""

	slot0.createSOProperty(slot2, slot0, "accessToken", BaseHero.STRING)

	slot6 = ""

	slot0.createSOProperty(slot2, slot0, "refreshToken", BaseHero.STRING)

	slot6 = ""

	slot0.createSOProperty(slot2, slot0, "pushArgStr", BaseHero.STRING)

	slot6 = nil

	slot0.createSOProperty(slot2, slot0, "updateLogVersion", BaseHero.STRING)

	slot5 = nil

	createSetterGetter(slot2, slot0, "gameServerIp")

	slot5 = nil

	createSetterGetter(slot2, slot0, "gameServerPort")

	slot6 = CLIENT_REGION

	slot0.createSOProperty(slot2, slot0, "clientRegion", BaseHero.STRING)

	slot6 = 0

	slot0.createSOProperty(slot2, slot0, "gameKind", BaseHero.INT)

	slot6 = 0

	slot0.createSOProperty(slot2, slot0, "realGameKind", BaseHero.INT)

	slot6 = true

	createSetterGetter(slot2, slot0, "hongDianDic", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "reportWechatAccout", "")

	slot6 = true

	createSetterGetter(slot2, slot0, "reportQQAccout", "")

	slot6 = true

	createSetterGetter(slot2, slot0, "reportType", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "reportWechatNickname", "")

	slot6 = true

	createSetterGetter(slot2, slot0, "reportReward", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowReport", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowYydb", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowRouletee", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowSjb", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowDzpkMatch", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowSpeadIcon", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowSjbPopup", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowDzpkMatchPopup", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowJjj", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "reliefNum", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowSignin", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowMc", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowSignInEntrance", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowRedPacket", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "redPacketGames", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "redPacketDesInfo", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "firstPayEnable", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "firstPayPrice", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "firstPayScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "firstPayLockKinds", {})

	slot6 = ""

	slot0.createSOProperty(slot2, slot0, "chargeBankName", BaseHero.STRING)

	slot6 = false

	slot0.createSOProperty(slot2, slot0, "autoLogin", BaseHero.BOOLEAN)

	slot6 = true

	slot0.createSOProperty(slot2, slot0, "canPlayMusic", BaseHero.BOOLEAN)

	slot6 = true

	slot0.createSOProperty(slot2, slot0, "canPlayEffect", BaseHero.BOOLEAN)

	slot6 = true

	slot0.createSOProperty(slot2, slot0, "canShock", BaseHero.BOOLEAN)

	slot6 = 0.5

	slot0.createSOProperty(slot2, slot0, "effectVolume", BaseHero.NUMBER)

	slot6 = DEFAULT_MUSIC_VOL

	slot0.createSOProperty(slot2, slot0, "musicVolume", BaseHero.NUMBER)

	slot6 = VOICE_LANG_PuTongHua

	slot0.createSOProperty(slot2, slot0, "voiceLang", BaseHero.INT)

	slot6 = false

	slot0.createSOProperty(slot2, slot0, "isForbidPlayerVoice", BaseHero.BOOLEAN)

	slot6 = false

	slot0.createSOProperty(slot2, slot0, "isMaskNight", BaseHero.BOOLEAN)

	slot6 = false

	slot0.createSOProperty(slot2, slot0, "isAutoMaskNight", BaseHero.BOOLEAN)

	slot6 = ""

	slot0.createSOProperty(slot2, slot0, "machineId4IosVerify", BaseHero.STRING)

	slot6 = ""

	slot0.createSOProperty(slot2, slot0, "machineIdInSO", BaseHero.STRING)

	slot6 = -1

	slot0.createSOProperty(slot2, slot0, "backupsTime", BaseHero.NUMBER)

	slot5 = 0

	createSetterGetter(slot2, slot0, "onlineTime")

	slot6 = false

	slot0.createSOProperty(slot2, slot0, "isBackups", BaseHero.BOOLEAN)

	slot5 = nil

	createSetterGetter(slot2, slot0, "official_url")

	slot5 = nil

	createSetterGetter(slot2, slot0, "complaintLink")

	slot6 = true

	createSetterGetter(slot2, slot0, "dzpkShareInfo", nil)

	slot5 = ""

	createSetterGetter(slot2, slot0, "openId")

	slot5 = ""

	createSetterGetter(slot2, slot0, "openKey")

	slot5 = ""

	createSetterGetter(slot2, slot0, "pf")

	slot5 = ""

	createSetterGetter(slot2, slot0, "pfKey")

	slot5 = ""

	createSetterGetter(slot2, slot0, "ysdkLoginType")

	slot5 = ""

	createSetterGetter(slot2, slot0, "sdkOpenId")

	slot5 = 0

	createSetterGetter(slot2, slot0, "newbie2GameKind")

	slot6 = true

	createSetterGetter(slot2, slot0, "newPackagePromotion", nil)

	slot0._orderUpdateList = {}
	slot0._resProperies = {}
end

HeroClass.isOfficialAccount = function (slot0)
	slot3 = slot0

	if not slot0.getIsTourist(slot2) then
		slot3 = slot0

		if slot0.getIsUserType(slot2) == 4 then
			slot3 = slot0

			if not slot0.getIsBindMobile(slot2) then
				return false
			end
		else
			return true
		end
	end
end

HeroClass.setProperty = function (slot0, slot1, slot2)
	slot6 = slot1
	slot7 = slot2

	slot0["set" .. StringUtil.upperFirstChar(slot5)](slot5, slot0)
end

HeroClass.getProperty = function (slot0, slot1)
	slot5 = slot1
	slot5 = slot0

	return slot0["get" .. StringUtil.upperFirstChar(slot4)](slot4)
end

HeroClass.addHd = function (slot0, slot1, slot2)
	slot3 = slot0._hongDianDic[slot1]

	if slot2 ~= nil then
		if slot3 == nil then
			slot3 = {}
		end
	else
		slot0._hongDianDic[slot1] = 1
		slot6 = Hero.hongDianDicChangedSignal

		Hero.hongDianDicChangedSignal.emit(1)

		return
	end

	slot6 = slot3

	if type(slot5) == "table" and slot2 ~= nil then
		slot3[slot2] = 1
	end

	slot0._hongDianDic[slot1] = slot3
	slot6 = Hero.hongDianDicChangedSignal

	Hero.hongDianDicChangedSignal.emit(slot5)
end

HeroClass.removeHd = function (slot0, slot1, slot2)
	if slot0._hongDianDic[slot1] == nil then
		return
	end

	if slot2 == nil then
		slot0._hongDianDic[slot1] = nil
		slot6 = Hero.hongDianDicChangedSignal

		Hero.hongDianDicChangedSignal.emit(nil)

		return
	end

	slot6 = slot3

	if type(slot5) == "table" and slot2 ~= nil then
		slot3[slot2] = nil
	end

	slot0._hongDianDic[slot1] = slot3
	slot6 = Hero.hongDianDicChangedSignal

	Hero.hongDianDicChangedSignal.emit(slot5)
end

HeroClass.getHd = function (slot0, slot1, slot2)
	if slot0._hongDianDic[slot1] == nil then
		return false
	end

	slot6 = slot3

	if type(slot5) == "table" then
		if slot2 == nil then
			slot6 = slot3

			for slot7, slot8 in pairs(slot5) do
				if slot8 ~= nil then
					return true
				end
			end

			return false
		else
			return slot3[slot2] ~= nil
		end
	else
		return true
	end

	return false
end

HeroClass.getUserScore = function (slot0)
	return slot0._userScore + slot0._userFakeScore
end

HeroClass.setUserFakeScore = function (slot0, slot1, slot2, slot3)
	if slot0._userFakeScore ~= slot1 or slot2 then
		slot0._userFakeScore = slot1

		if not slot3 then
			slot7 = slot1

			slot0.userScoreChangedSignal.emit(slot5, slot0.userScoreChangedSignal)
		end
	end
end

HeroClass.addUserFakeScore = function (slot0, slot1, slot2, slot3)
	slot9 = slot3

	slot0.setUserFakeScore(slot5, slot0, slot1 + slot0._userFakeScore, slot2)
end

HeroClass.initRoomCreateSettingsProperty = function (slot0)
	return
end

HeroClass.resetState4Relogin = function (slot0, slot1)
	slot5 = nil

	Hero.setNGuestState(slot3, Hero)
end

HeroClass.initAfterLogin = function (slot0)
	slot8 = slot0._dwUserID

	slot0.createSOProperty(slot2, slot0, "cardBuyNumToday", BaseHero.NUMBER, 0, nil)

	slot8 = slot0._dwUserID

	slot0.createSOProperty(slot2, slot0, "cardBuyNumDate", BaseHero.NUMBER, 0, nil)

	slot8 = slot0._dwUserID

	slot0.createSOProperty(slot2, slot0, "bankGiveRecord", BaseHero.STRING, "", nil)

	slot8 = slot0._dwUserID

	slot0.createSOProperty(slot2, slot0, "tyRoomTimeDic", BaseHero.STRING, "", nil)

	slot8 = slot0._dwUserID

	slot0.createSOProperty(slot2, slot0, "newbieData", BaseHero.STRING, nil, nil)

	slot3 = slot0
	slot6 = "%d"
	slot2 = parseInt(os.date(BaseHero.STRING))

	if slot0.getCardBuyNumDate(slot2) == 0 or slot2 ~= slot1 then
		slot6 = slot2

		slot0.setCardBuyNumDate(slot4, slot0)

		slot6 = 0

		slot0.setCardBuyNumToday(slot4, slot0)
	end

	slot10 = slot0._dwUserID

	slot0.createSOProperty(slot4, slot0, "yydbLastPeriod", BaseHero.NUMBER, 0, nil)

	slot10 = slot0._dwUserID

	slot0.createSOProperty(slot4, slot0, "lastLoginDate", BaseHero.STRING, "", nil)
end

HeroClass.checkTyRoomTimeCount = function (slot0, slot1)
	slot1 = slot1 or 20
	slot4 = Hero

	if Hero.getTyRoomTimeDic(slot3) and slot2 ~= "" then
		slot5 = slot2

		if cjson.decode(slot4) then
			slot5 = slot2

			if slot1 <= table.nums(slot4) then
				slot3 = TableUtil.toArray(slot4)

				function slot7(slot0, slot1)
					return slot0.time < slot1.time
				end

				table.sort(slot2, slot3)

				slot7 = 1

				table.remove(slot2, slot3)

				slot4 = {}
				slot7 = slot3

				for slot8, slot9 in pairs(slot3) do
					slot13 = 2
					slot4[DateUtil.getDateString(slot11, slot9.time)] = slot9
				end

				slot7 = slot0
				slot10 = slot4

				slot0.setTyRoomTimeDic(slot6, cjson.encode(slot9))
			end
		end
	end
end

HeroClass.addTyRoomTime = function (slot0)
	slot3 = Hero

	if Hero.getTyRoomTimeDic(slot2) and slot1 ~= "" then
		slot4 = slot1
		slot1 = cjson.decode(slot3)
	else
		slot1 = {}
	end

	slot1[DateUtil.getDateString(tickMgr, tickMgr.getChinaTime(slot3))] or {
		count = 0,
		time = slot2
	}.count = slot1[DateUtil.getDateString(tickMgr, tickMgr.getChinaTime(slot3))] or .count + 0.05
	slot1[slot3] = slot1[DateUtil.getDateString(tickMgr, tickMgr.getChinaTime(slot3))] or 
	slot7 = slot0
	slot10 = slot1

	slot0.setTyRoomTimeDic(2, cjson.encode(slot9))
end

HeroClass.isMe = function (slot0, slot1)
	slot5 = slot1

	return parseInt(slot3) == parseInt(slot0._dwUserID)
end

HeroClass.isFromWX = function (slot0)
	return slot0._loginContextSdk ~= nil
end

HeroClass.tyTimeIsValid = function (slot0)

	-- Decompilation error in this vicinity:
	slot3 = slot0

	if slot0.getTyRoomTimeDic(slot2) and slot1 ~= "" then
		slot4 = slot1
		slot1 = cjson.decode(slot3)
	else
		slot1 = {}
	end

	slot6 = tickMgr
	slot5 = 2
	slot5 = slot0
	slot6 = slot0

	return slot1[slot2].count <= slot0.getTyRoomTime(slot5)
end

Hero = HeroClass.new()

return
