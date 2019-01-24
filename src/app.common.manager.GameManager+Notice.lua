REQUEST_NOTICE_URL = "/reboot_api?timestamp=%s&sign=%s&istesting=%d"
REQUEST_NOTICE_BACK_URL = "/reboot_callback_api?timestamp=%s&gameid=%d&sign=%s&istesting=%d"

GameManager.initNoticeHelper = function (slot0)
	slot0._noticeDic = {}
	slot6 = false

	createSetterGetter(slot2, slot0, "connectedTrumpSocket", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "trumpMsgArr", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "trumpMsgArr4Chat", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "yydbInfo", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "yydbTempInfo", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "yydbBuyInfoArr", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "yydbMyHistory", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "yydbHistory", {})

	slot6 = true

	createSetterGetter(slot2, slot0, "dzpkPeopleNumNote", {})

	slot6 = slot0

	networkMgr.registertrumpfunction(slot2, networkMgr, MDM_GR_USER, slot0.networkGRUserTrump)

	slot6 = true

	createSetterGetter(slot2, slot0, "winNoticeMsgArr", {})

	slot3 = slot0

	slot0.initWinNoticeConfig(slot2)
end

GameManager.networkGRUserTrump = function (slot0, slot1, slot2)
	if slot2 == SUB_GR_PROPERTY_TRUMPET then
		if IS_IOS_VERIFY or IS_YYB_VERIFY or IS_SDK_VERIFY then
			return
		end

		slot5 = slot1
		slot7 = "CMD_GR_S_SendTrumpet"

		if ffiMgr.isSizeEqual(slot4, ffiMgr, ZipUtil.uncompress(slot4)) then
			slot7 = "CMD_GR_S_SendTrumpet"
			slot7 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)

			table.insert(ffiMgr, slot0._trumpMsgArr)

			slot7 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)

			table.insert(ffiMgr, slot0._trumpMsgArr4Chat)

			slot6 = slot0.trumpMsgArrChangedSignal

			slot0.trumpMsgArrChangedSignal.emit(ffiMgr)

			slot6 = slot0.trumpMsgArr4ChatChangedSignal

			slot0.trumpMsgArr4ChatChangedSignal.emit(ffiMgr)
		end
	elseif slot2 == SUB_GP_BRAODCAST_ACTIVITY_MESSAGE then
		slot4 = ByteArray.new(slot5)
		slot8 = true
		slot8 = true
		slot7 = slot4
		slot10 = slot4
		slot7 = ({
			dwActivityID = slot4.readUInt(slot1, slot4),
			dwMessageID = slot4.readUInt(slot1, slot4),
			szMessage = slot4.readBytes2String(slot1, slot4.getBytesAvailable(slot9)),
			szMessage = ZipUtil.uncompress(slot1)
		})["szMessage"]

		if  and slot3.szMessage then
			slot7 = slot3.szMessage
			slot3.szMessage = cjson.decode(slot6)

			if slot3.dwActivityID == ActivityID_YYDB then
				if slot3.dwMessageID == MESSAGE_STATE_UPDATE_BROADCAST then
					slot8 = slot3.szMessage

					slot0.onBroadcastLotteryInfo(slot6, slot0)
				elseif slot3.dwMessageID == MESSAGE_DRAW_A_LOTTERY_BROADCAST then
					slot8 = slot3.szMessage

					slot0.onBroadcastDrawALottery(slot6, slot0)
				end
			elseif slot3.dwActivityID == ActivityID_DZPK_GB then
				if slot3.dwMessageID == MESSAGE_DZPK_PEOPLE_REQUEST then
					slot8 = slot3.szMessage

					slot0.onBroadcastDZPKGB(slot6, slot0)
				elseif slot3.dwMessageID == MESSAGE_DZPK_READY_REQUEST then
					slot7 = popupMgr
					slot11 = slot3.szMessage.szMatchName

					popupMgr.showAlert(slot6, string.format(slot9, "您报名的<font color = '#ffef84'>%s</font> 即将开赛，为避免错过精彩赛事，请您尽快进入MTT赛场，做好开赛准备。"))
				elseif slot3.dwMessageID == MESSAGE_DZPK_READY_REQUEST1 then
					slot7 = popupMgr
					slot11 = slot3.szMessage.szMatchName

					popupMgr.showAlert(slot6, string.format(slot9, "您报名的<font color = '#ffef84'>%s</font> 五分钟后即将开赛，为避免错过精彩赛事，请您尽快进入MTT赛场，做好开赛准备。"))
				end
			elseif slot3.dwActivityID == ActivityID_YFGG then
				function slot5()
					slot3 = slot1.szMessage

					slot0.onBroadcastWinNotice(slot1, slot0)
				end

				if slot3.dwMessageID == GameKind_SHZ then
					slot10 = 3000

					tickMgr.delayedCall(slot7, tickMgr, slot5)
				else
					slot5()
				end
			end
		end
	end
end

GameManager.createNoticeTxt = function (slot0, slot1)
	slot2 = ""
	slot5 = slot1

	for slot6, slot7 in ipairs(slot4) do
		slot10 = slot7

		if type(slot9) == "number" then
			slot11 = slot7
			slot2 = slot2 .. HtmlUtil.createSpacer(slot10)
		elseif slot7 ~= "%s" then
			slot15 = -3
			slot2 = slot2 .. HtmlUtil.createImg(slot10, "#plist_notice_txt_" .. slot7 .. ".png", nil, nil, nil)
		else
			slot2 = slot2 .. slot7
		end
	end

	return slot2
end

GameManager.initWinNoticeConfig = function (slot0)
	slot6 = {
		"gongxi",
		"%s",
		"zai",
		"%s",
		"zhong",
		"renpinbaofa",
		"cn_dou",
		"huode",
		2,
		"icon_bean",
		2,
		"%s",
		"cn_tan",
		"tailihaile",
		"cn_tan"
	}
	slot7 = {
		"gongxi",
		"%s",
		"zai",
		"%s",
		"zhong",
		"huode_hui",
		"di",
		"%s",
		"ming",
		"cn_dou",
		"yingde",
		2,
		"icon_bean",
		2,
		"%s",
		"cn_tan",
		"tailihaile",
		"cn_tan"
	}
	slot7 = {
		"gongxi",
		"%s",
		"zai",
		"%s",
		"zhong",
		"mingzhong",
		"%s",
		"cn_dou",
		"huode",
		2,
		"icon_bean",
		2,
		"%s",
		"cn_tan"
	}
	slot7 = {
		"gongxi",
		"%s",
		"zai",
		"%s",
		"zhong",
		"mingzhong",
		"%s",
		"cn_dou",
		"huode",
		2,
		"icon_bean",
		2,
		"%s",
		"cn_tan"
	}
	slot7 = {
		"gongxi",
		"%s",
		"zai",
		"%s",
		"zhong",
		"mingzhong",
		"%s",
		"cn_dou",
		"huode",
		2,
		"icon_bean",
		2,
		"%s",
		"cn_tan"
	}
	slot7 = {
		"gongxi",
		"%s",
		"zai",
		"%s",
		"zhong",
		"mingzhong",
		"%s",
		"cn_dou",
		"huode",
		2,
		"icon_bean",
		2,
		"%s",
		"cn_tan"
	}
	slot7 = {
		"gongxi",
		"%s",
		"zai",
		"%s",
		"zhong",
		"zhuanchu",
		"%s",
		"cn_dou",
		"huode",
		2,
		"icon_bean",
		2,
		"%s",
		"cn_tan"
	}
	slot7 = {
		"gongxi",
		"%s",
		"zai",
		"%s",
		"zhong",
		"jizhong",
		"%s",
		"cn_dou",
		"huode",
		2,
		"icon_bean",
		2,
		"%s",
		"cn_tan"
	}
	slot7 = {
		"gongxi",
		"%s",
		"zai",
		"%s",
		"zhong",
		"huode",
		"leijijiang",
		"%s",
		2,
		"icon_bean",
		2,
		"%s",
		"cn_tan"
	}
	slot4 = slot0:createNoticeTxt(slot0)
	slot0._winNoticeConfig1 = {
		default = slot0.createNoticeTxt(slot4, slot0),
		[GameKind_DZPK] = slot0:createNoticeTxt(slot0),
		[GameKind_DNTG] = slot0:createNoticeTxt(slot0),
		[GameKind_DNTGTEST] = slot0:createNoticeTxt(slot0),
		[GameKind_FISHTD] = slot0:createNoticeTxt(slot0),
		[GameKind_DNTGLK] = slot0:createNoticeTxt(slot0),
		[GameKind_SHZ] = slot0:createNoticeTxt(slot0),
		[GameKind_JXLW] = slot0:createNoticeTxt(slot0),
		[GameKind_SERIAL] = slot4
	}
	slot6 = {
		"shz_quanping",
		"shz_changqiang"
	}
	slot6 = {
		"shz_quanping",
		"shz_dadao"
	}
	slot6 = {
		"shz_quanping",
		"shz_long"
	}
	slot6 = {
		"shz_quanping",
		"shz_linchong"
	}
	slot6 = {
		"shz_quanping",
		"shz_luzhishen"
	}
	slot6 = {
		"shz_quanping",
		"shz_renwu"
	}
	slot6 = {
		"shz_quanping",
		"shz_shuangfu"
	}
	slot6 = {
		"shz_quanping",
		"shz_songjiang"
	}
	slot6 = {
		"shz_quanping",
		"shz_titianxingdao"
	}
	slot6 = {
		"shz_quanping",
		"shz_wuqi"
	}
	slot6 = {
		"shz_quanping",
		"shz_zhongyitang"
	}
	slot6 = {
		"fish_daozhen"
	}
	slot6 = {
		"fish_haidaochuan"
	}
	slot6 = {
		"fish_haiyao"
	}
	slot6 = {
		"fish_huangjinchuitousha"
	}
	slot6 = {
		"fish_jinlong"
	}
	slot6 = {
		"fish_likui"
	}
	slot6 = {
		"fish_shenhaizhangyu"
	}
	slot6 = {
		"fish_shuangtouqie"
	}
	slot6 = {
		"fish_shuihuzhuan"
	}
	slot6 = {
		"fish_sunwukong"
	}
	slot6 = {
		"fish_yuhuangdadi"
	}
	slot6 = {
		"caichi"
	}
	slot0._winNoticeConfig2 = {
		全屏双枪 = slot0.createNoticeTxt(slot4, slot0),
		全屏金刀 = slot0.createNoticeTxt(slot4, slot0),
		全屏龙 = slot0.createNoticeTxt(slot4, slot0),
		全屏林冲 = slot0.createNoticeTxt(slot4, slot0),
		全屏鲁智深 = slot0.createNoticeTxt(slot4, slot0),
		全屏人物 = slot0.createNoticeTxt(slot4, slot0),
		全屏双斧 = slot0.createNoticeTxt(slot4, slot0),
		全屏宋江 = slot0.createNoticeTxt(slot4, slot0),
		全屏替天行道 = slot0.createNoticeTxt(slot4, slot0),
		全屏武器 = slot0.createNoticeTxt(slot4, slot0),
		全屏忠义堂 = slot0.createNoticeTxt(slot4, slot0),
		刀阵 = slot0.createNoticeTxt(slot4, slot0),
		海盗船 = slot0.createNoticeTxt(slot4, slot0),
		海妖 = slot0.createNoticeTxt(slot4, slot0),
		黄金锤头鲨 = slot0.createNoticeTxt(slot4, slot0),
		金龙 = slot0.createNoticeTxt(slot4, slot0),
		李逵 = slot0.createNoticeTxt(slot4, slot0),
		章鱼怪 = slot0.createNoticeTxt(slot4, slot0),
		双头企鹅 = slot0.createNoticeTxt(slot4, slot0),
		水浒传 = slot0.createNoticeTxt(slot4, slot0),
		孙悟空 = slot0.createNoticeTxt(slot4, slot0),
		玉帝 = slot0.createNoticeTxt(slot4, slot0),
		彩池 = slot0.createNoticeTxt(slot4, slot0)
	}
	slot7 = {
		"game_dntg"
	}
	slot7 = {
		"game_dntg2"
	}
	slot7 = {
		"game_qpby3d"
	}
	slot7 = {
		"game_lkpy"
	}
	slot7 = {
		"game_shz"
	}
	slot7 = {
		"game_jxlw"
	}
	slot7 = {
		"game_lhdb"
	}
	slot0._winNoticeConfig3 = {
		[GameKind_DNTG] = slot0:createNoticeTxt(slot0),
		[GameKind_DNTGTEST] = slot0:createNoticeTxt(slot0),
		[GameKind_FISHTD] = slot0:createNoticeTxt(slot0),
		[GameKind_DNTGLK] = slot0:createNoticeTxt(slot0),
		[GameKind_SHZ] = slot0:createNoticeTxt(slot0),
		[GameKind_JXLW] = slot0:createNoticeTxt(slot0),
		[GameKind_SERIAL] = slot0:createNoticeTxt(slot0)
	}
end

GameManager.onBroadcastWinNotice = function (slot0, slot1)
	slot4 = slot1.gameID
	slot3 = slot0._winNoticeConfig1[parseInt(slot3)]

	if slot1.param1 == "" then
		slot3 = slot0._winNoticeConfig1.default
	end

	if not slot3 then
		slot6 = slot1

		trace_r(slot5)

		return
	end

	slot7 = "#7ef0fc"
	slot4 = HtmlUtil.createColorTxt(slot5, slot1.szNickName)
	slot9 = slot1.winScore
	slot12 = -3
	slot5 = HtmlUtil.createArtNumDot(slot1.szNickName, parseInt(slot8), "#plist_notice_txt_yellow_num_%s.png", nil, nil, nil)
	slot6 = ""
	slot9 = slot1.param1

	if StringUtil.isStringValid("#plist_notice_txt_yellow_num_%s.png") then
		slot6 = slot0._winNoticeConfig2[slot1.param1] or ""
		slot7 = ""
	end

	if slot2 == GameKind_DZPK then
		slot11 = "#f9df66"
		slot13 = slot1.param2
		slot16 = -3
		slot16 = slot5
		slot7 = string.format(parseInt(slot12), slot3, slot4, HtmlUtil.createColorTxt(slot9, slot1.param1), HtmlUtil.createArtNumDot(slot1.param1, parseInt(slot12), "#plist_notice_txt_yellow_num_%s.png", nil, nil, nil))
	else
		slot8 = slot0._winNoticeConfig3[slot2]

		if slot1.param1 == "" then
			slot14 = slot5
			slot7 = string.format(slot10, slot3, slot4, slot8)
		else
			slot15 = slot5
			slot7 = string.format(slot10, slot3, slot4, slot8, slot6)
		end
	end

	slot12 = {
		content = slot7
	}

	table.insert(slot10, slot0._winNoticeMsgArr)

	slot11 = slot0.winNoticeMsgArrChangedSignal

	slot0.winNoticeMsgArrChangedSignal.emit(slot10)
end

GameManager.onBroadcastLotteryInfo = function (slot0, slot1)
	slot5 = slot1

	slot0.setYydbInfo(slot3, slot0)

	if slot1.wState == 3 then
		slot5 = "908fc8"
		slot6 = "f1953c"
		slot7 = "908fc8"
		slot8 = "ffffff"
		slot7 = slot1.dwPeriod
		slot11 = 0
		slot0._yydbBuyInfoArr = {}
		slot7 = {
			content = string.format(HtmlUtil.createColorTxt("%s", "在第%d期获得幸运号码喜中"), HtmlUtil.createColorTxt(slot3, "恭喜") .. HtmlUtil.createColorTxt("恭喜", "%s") .. HtmlUtil.createColorTxt("%s", "在第%d期获得幸运号码喜中") .. HtmlUtil.createColorTxt("在第%d期获得幸运号码喜中", "%s欢乐豆"), slot1.szWinner, MathUtil.cookNumWithHansUnits(slot9, slot1.lReward))
		}

		table.insert(HtmlUtil.createColorTxt(slot3, "恭喜") .. HtmlUtil.createColorTxt("恭喜", "%s") .. HtmlUtil.createColorTxt("%s", "在第%d期获得幸运号码喜中") .. HtmlUtil.createColorTxt("在第%d期获得幸运号码喜中", "%s欢乐豆"), slot0._yydbBuyInfoArr)

		slot6 = slot0.yydbBuyInfoArrChangedSignal

		slot0.yydbBuyInfoArrChangedSignal.emit(HtmlUtil.createColorTxt(slot3, "恭喜") .. HtmlUtil.createColorTxt("恭喜", "%s") .. HtmlUtil.createColorTxt("%s", "在第%d期获得幸运号码喜中") .. HtmlUtil.createColorTxt("在第%d期获得幸运号码喜中", "%s欢乐豆"))

		slot6 = "PlazaModule"

		requireModule(HtmlUtil.createColorTxt(slot3, "恭喜") .. HtmlUtil.createColorTxt("恭喜", "%s") .. HtmlUtil.createColorTxt("%s", "在第%d期获得幸运号码喜中") .. HtmlUtil.createColorTxt("在第%d期获得幸运号码喜中", "%s欢乐豆"))

		slot6 = ProxyPlaza

		ProxyPlaza.requestYydbMyHistory(HtmlUtil.createColorTxt(slot3, "恭喜") .. HtmlUtil.createColorTxt("恭喜", "%s") .. HtmlUtil.createColorTxt("%s", "在第%d期获得幸运号码喜中") .. HtmlUtil.createColorTxt("在第%d期获得幸运号码喜中", "%s欢乐豆"))
	elseif slot1.wState == 2 then
		slot5 = Hero

		if slot1.dwPeriod < Hero.getYydbLastPeriod(slot4) then
			slot5 = 0

			Hero.setYydbLastPeriod(slot3, Hero)
		end
	end
end

GameManager.onBroadcastDrawALottery = function (slot0, slot1)
	slot4 = gameMgr

	if gameMgr.getYydbInfo(slot3) and slot2.dwRemainCount then
		slot2.dwRemainCount = slot1.dwLeftCount
		slot5 = gameMgr.yydbInfoChangedSignal

		gameMgr.yydbInfoChangedSignal.emit(slot4)
	end

	if ProxyYydb then
		slot5 = ProxyYydb

		if ProxyYydb.isShowing(slot4) then
			slot5 = ProxyYydb

			if ProxyYydb.getTabIndex(slot4) == 1 then
				slot6 = "908fc8"
				slot7 = "ffffff"
				slot8 = "908fc8"
				slot9 = "ffffff"
				slot8 = slot1.dwCount
				slot8 = {
					content = string.format(HtmlUtil.createColorTxt("%s", "购买了"), HtmlUtil.createColorTxt(slot4, "玩家") .. HtmlUtil.createColorTxt("玩家", "%s") .. HtmlUtil.createColorTxt("%s", "购买了") .. HtmlUtil.createColorTxt("购买了", "%s份"), slot1.szUser)
				}

				table.insert(HtmlUtil.createColorTxt(slot4, "玩家") .. HtmlUtil.createColorTxt("玩家", "%s") .. HtmlUtil.createColorTxt("%s", "购买了") .. HtmlUtil.createColorTxt("购买了", "%s份"), slot0._yydbBuyInfoArr)

				slot7 = slot0.yydbBuyInfoArrChangedSignal

				slot0.yydbBuyInfoArrChangedSignal.emit(HtmlUtil.createColorTxt(slot4, "玩家") .. HtmlUtil.createColorTxt("玩家", "%s") .. HtmlUtil.createColorTxt("%s", "购买了") .. HtmlUtil.createColorTxt("购买了", "%s份"))
			end
		end
	end
end

GameManager.onBroadcastDZPKGB = function (slot0, slot1)
	if not slot1 then
		return
	end

	if ProxyDzpk then
		slot4 = ProxyDzpk

		if ProxyDzpk.isShowing(slot3) then
			slot6 = true

			slot0.setDzpkPeopleNumNote(slot3, slot0, {
				matchID = slot1.wMatchID,
				joinUserCount = slot1.dwJoinUserCount
			})
		end
	end
end

GameManager.removeWinNoticeMsg = function (slot0, slot1)
	slot5 = slot1

	table.removebyvalue(slot3, slot0._winNoticeMsgArr)
end

GameManager.removeYydbMsg = function (slot0, slot1)
	slot5 = slot1

	table.removebyvalue(slot3, slot0._yydbBuyInfoArr)
end

GameManager.removeTrumpMsg = function (slot0, slot1)
	slot5 = slot1

	table.removebyvalue(slot3, slot0._trumpMsgArr)
end

GameManager.onTrumpServerConnected = function (slot0)
	slot3 = "聊天服务器链接成功"

	trace(slot2)
end

GameManager.onTrumpServerTimeOut = function (slot0)
	slot3 = "聊天服务器链接超时"

	trace(slot2)
end

GameManager.connectTrumpServer = function (slot0)
	slot5 = SOCKET_PORT_TRUMPET

	mainMgr.requestLoginTrump(slot2, mainMgr, SOCKET_IP_TRUMPET)
end

GameManager.requestNoticeContent = function (slot0)
	return
end

slot2 = gameMgr

gameMgr.initNoticeHelper(function (slot0)
	return
end)

return
