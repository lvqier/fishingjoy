slot2 = "DdzModel"
DdzModel = class(slot1)
VIEW_TYPE_DDZ_KIND = 105
VIEW_TYPE_DDZ_BATTLE_BXP = 106
VIEW_TYPE_DDZ_BATTLE_JD = 107
DDZ_CV_A = 14
DDZ_CV_2 = 15
DDZ_CV_LITTLE_JOKER = 16
DDZ_CV_BIG_JOKER = 17
DDZ_CARDS_COUNT = 17
DDZ_BANKER_CARDS_COUNT = 20
CARD_CHANGE_ADD = 1
CARD_CHANGE_INIT = 2
CARD_CHANGE_OUT = 3
CARD_CHANGE_RECONNECT = 4
DDZ_CT_ERROR = 0
DDZ_CT_SINGLE = 1
DDZ_CT_DOUBLE = 2
DDZ_CT_THREE = 3
DDZ_CT_SINGLE_LINE = 4
DDZ_CT_DOUBLE_LINE = 5
DDZ_CT_THREE_LINE = 6
DDZ_CT_THREE_TAKE_ONE = 7
DDZ_CT_THREE_TAKE_TWO = 8
DDZ_CT_FOUR_TAKE_ONE = 9
DDZ_CT_FOUR_TAKE_TWO = 10
DDZ_CT_BOMB_CARD = 11
DDZ_CT_MISSILE_CARD = 12
DDZ_CT_PLANE_TAKE_SINGLE_WING = 13
DDZ_CT_PLANE_TAKE_PAIR_WING = 14
DDZ_GAME_SCENE_FREE = 0
DDZ_GAME_SCENE_CALL = 100
DDZ_GAME_SCENE_ADDTIMES = 101
DDZ_GAME_SCENE_PLAY = 102
DDZ_SUB_S_GAME_START = 100
DDZ_SUB_S_CALL_SCORE = 101
DDZ_SUB_S_BANKER_INFO = 102
DDZ_SUB_S_OUT_CARD = 103
DDZ_SUB_S_PASS_CARD = 104
DDZ_SUB_S_GAME_CONCLUDE = 105
DDZ_SUB_S_SET_BASESCORE = 106
DDZ_SUB_S_CHEAT_CARD = 107
DDZ_SUB_S_TRUSTEE = 108
DDZ_SUB_S_ADD_TIMES = 109
DDZ_SUB_S_START_CARD = 110
DDZ_SUB_S_OPEN_CARD = 111
DDZ_SUB_S_REMBER_CARD = 113
DDZ_SUB_C_CALL_SCORE = 1
DDZ_SUB_C_OUT_CARD = 2
DDZ_SUB_C_PASS_CARD = 3
DDZ_SUB_C_TRUSTEE = 4
DDZ_SUB_C_ADD_TIMES = 5
DDZ_SUB_C_OPEN_CARD = 6
DDZ_VIEW_CHAIRID_ME = 1
DDZ_VIEW_CHAIRID_RIGHT = 2
DDZ_VIEW_CHAIRID_LEFT = 3
DDZ_GAMESTATE_NON = 0
DDZ_GAMESTATE_READY = 1
DDZ_GAMESTATE_CALL = 2
DDZ_GAMESTATE_ROB = 3
DDZ_GAMESTATE_ADDTIMES = 4
DDZ_GAMESTATE_PLAY = 5
DDZ_GAMESTATE_END = 6
BCT_ERROR = 0
BCT_SINGLE = 1
BCT_LINE = 2
BCT_SAME_COLOR = 3
BCT_DOUBLE = 4
BCT_THREE = 5
BCT_SINGLE_KING = 6
BCT_DOUBLE_KING = 7
BCT_SAME_LINE = 8
DDZ_DIPAI_TEX = {
	[BCT_SAME_COLOR] = "ddz_txt_th3bei.png",
	[BCT_SAME_LINE] = "ddz_txt_ths5bei.png",
	[BCT_SINGLE_KING] = "ddz_txt_dw2bei.png",
	[BCT_THREE] = "ddz_txt_st5bei.png",
	[BCT_DOUBLE] = "ddz_txt_dz2bei.png",
	[BCT_DOUBLE_KING] = "ddz_txt_sw5bei.png",
	[BCT_LINE] = "ddz_txt_sz3bei.png"
}
DDZ_UNRECONNECT_PROTOCOL = {
	[DDZ_SUB_S_GAME_START] = true,
	[DDZ_SUB_S_CALL_SCORE] = true,
	[DDZ_SUB_S_BANKER_INFO] = true,
	[DDZ_SUB_S_OUT_CARD] = true,
	[DDZ_SUB_S_GAME_CONCLUDE] = true,
	[DDZ_SUB_S_SET_BASESCORE] = true,
	[DDZ_SUB_S_CHEAT_CARD] = true,
	[DDZ_SUB_S_TRUSTEE] = true,
	[DDZ_SUB_S_ADD_TIMES] = true,
	[DDZ_SUB_S_START_CARD] = true,
	[DDZ_SUB_S_OPEN_CARD] = true,
	[DDZ_SUB_S_REMBER_CARD] = true
}
DDZ_LINE_LINK_DISCARD = -1
DDZ_LINE_NON = 0
DDZ_LINE_SINGLE_CLICK = 1
DDZ_LINE_LINK_CLICK = 2
DDZ_LINE_PADDLE = 3
DDZ_SPECIALCT_EFFECT = {
	[DDZ_CT_BOMB_CARD] = "ddzzhadan",
	[DDZ_CT_MISSILE_CARD] = "ddzwangzha",
	[DDZ_CT_THREE_LINE] = "ddzfeiji",
	[DDZ_CT_PLANE_TAKE_SINGLE_WING] = "ddzfeiji",
	[DDZ_CT_PLANE_TAKE_PAIR_WING] = "ddzfeiji"
}
DDZ_SPECIALCT_TXT = {
	[DDZ_CT_SINGLE_LINE] = "ddzshunzi",
	[DDZ_CT_DOUBLE_LINE] = "ddzliandui",
	[DDZ_CT_PLANE_TAKE_SINGLE_WING] = "ddzfeijipaixingtext"
}
DDZ_SOUND_TIMEWARNING1 = "effect/time_warning1.mp3"
DDZ_SOUND_TIMEWARNING2 = "effect/TISHICHUPAI-2.mp3"
DDZ_AACOMMON_NUM = {
	[DDZ_CT_SINGLE] = 1,
	[DDZ_CT_DOUBLE] = 2,
	[DDZ_CT_THREE] = 3,
	[DDZ_CT_SINGLE_LINE] = 1,
	[DDZ_CT_DOUBLE_LINE] = 2,
	[DDZ_CT_THREE_LINE] = 3,
	[DDZ_CT_THREE_TAKE_ONE] = 3,
	[DDZ_CT_THREE_TAKE_TWO] = 3,
	[DDZ_CT_FOUR_TAKE_ONE] = 4,
	[DDZ_CT_FOUR_TAKE_TWO] = 4,
	[DDZ_CT_PLANE_TAKE_SINGLE_WING] = 3,
	[DDZ_CT_PLANE_TAKE_PAIR_WING] = 3
}
DDZ_BBCOMMON_NUM = {
	[DDZ_CT_THREE_TAKE_ONE] = 1,
	[DDZ_CT_THREE_TAKE_TWO] = 2,
	[DDZ_CT_FOUR_TAKE_ONE] = 2,
	[DDZ_CT_FOUR_TAKE_TWO] = 2,
	[DDZ_CT_PLANE_TAKE_SINGLE_WING] = 2,
	[DDZ_CT_PLANE_TAKE_PAIR_WING] = 2
}
DDZ_SOUND_FAPAI = "fapai.mp3"
DDZ_SOUND_XUANPAI = "xuanpai.mp3"

DdzModel.ctor = function (slot0)
	slot10 = true

	ClassUtil.extends(slot2, slot0, BaseGameModel, true, GameKind_DDZ_VIRTUAL, 1, nil, nil)

	slot9 = false
	slot13 = slot0.onRealGameKindChanged

	createSetterGetter(slot2, slot0, "realGameKind", nil, true, false, false, handler(slot11, slot0))

	slot6 = true

	createSetterGetter(slot2, slot0, "selectedOutCardsDic", nil)

	slot5 = nil

	createSetterGetter(slot2, slot0, "selectedCardsArr")

	slot9 = false
	slot13 = slot0.onSelectedCardsDicChanged

	createSetterGetter(slot2, slot0, "selectedCardsDic", nil, true, false, false, handler(slot11, slot0))

	slot9 = false
	slot13 = slot0.onMyCardsChanged

	createSetterGetter(slot2, slot0, "myCards", nil, true, false, false, handler(slot11, slot0))

	slot5 = nil

	createSetterGetter(slot2, slot0, "myCardsIndexDic")

	slot5 = nil

	createSetterGetter(slot2, slot0, "myCardsColorDic")

	slot9 = false
	slot13 = slot0.onOutCardsDicChanged

	createSetterGetter(slot2, slot0, "outCardsDic", nil, true, false, false, handler(slot11, slot0))

	slot6 = true

	createSetterGetter(slot2, slot0, "outCardInfo", nil)

	slot9 = false
	slot13 = slot0.onEndCardsDicChanged

	createSetterGetter(slot2, slot0, "endCardsDic", nil, true, false, false, handler(slot11, slot0))

	slot9 = false
	slot13 = slot0.onOpenCardsChanged

	createSetterGetter(slot2, slot0, "openCards", nil, true, false, false, handler(slot11, slot0))

	slot6 = true

	createSetterGetter(slot2, slot0, "openUser", nil)

	slot5 = 0

	createSetterGetter(slot2, slot0, "cardChangeType")

	slot6 = true

	createSetterGetter(slot2, slot0, "bankerUser", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "currentUser", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "gameState", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "canOutCard", false)

	slot9 = false
	slot13 = slot0.onCanOutDataDicChanged

	createSetterGetter(slot2, slot0, "canOutDataDic", nil, true, false, false, handler(slot11, slot0))

	slot5 = nil

	createSetterGetter(slot2, slot0, "canOutDataArr")

	slot5 = nil

	createSetterGetter(slot2, slot0, "tipsInfo")

	slot6 = true

	createSetterGetter(slot2, slot0, "mySpTableUserDatasDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "myTableUserDatasDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "playerCdsDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "startCallUser", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "bankerScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "leaveCardsCountDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "sendCardsCountDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "curResultInfoDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "callRobDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "addTimesInfoDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "diPaiInfo", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "autoSignal", SignalAs3.new())

	slot6 = true

	createSetterGetter(slot2, slot0, "autoDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "timeDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "beiShuInfo", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingMatchFloat", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowResultBeiShuTips", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowBattleBeiShuTips", false)

	slot4 = "countDownSignal"

	createSetterGetter(slot2, slot0, SignalAs3.new())

	slot4 = "exitGameSignal"

	createSetterGetter(slot2, slot0, SignalAs3.new())

	slot4 = "enterForegroundSignal"

	createSetterGetter(slot2, slot0, SignalAs3.new())

	slot6 = true

	createSetterGetter(slot2, slot0, "stateViewDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "lockViewDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "figureState", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "canOnceOutAllCards", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "showBankerIconUser", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "showOpenIconUser", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowWarningSpineDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowOpenSheet", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowCantOutTxt", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowDdnmjbTxt", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowZdcpzTxt", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowDiPaiUi", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowAutoIconDic", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowLeaveUi", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowJiPaiUi", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowJiPaiInfoUi", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowHandCard", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowBxpRule", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowJdRule", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "jiPaiDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "usersIsOutCardDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "warningEffectDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "winnerViewIds", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "lCellScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "roomTabIndex", 1)

	slot0._viewChairIdDic = nil
	slot0._openIsFromReconnect = false
	slot0._isFromReconnect = true
	slot0._loadingDuration = 0.7
	slot0._loadingPlistName = "#plist_ddz_font_loading_1_%s.png"
	slot0._recentOutCardUser = nil
	slot0._recentTurnUser = nil
	slot0._lineType = 0
	slot0._isOpenLine = true
	slot6 = true

	createSetterGetter(slot2, slot0, "isShowBtnStart", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isHoldBtnStartAtBegin", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "isHoldBtnStartAtResult", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "isLaunchOpMenu", true)

	slot0.spineLogoKeyInLoading = "ddz_qidong"
	slot0.musicBg = "bgm/bgm_1.mp3"
	slot0._ctSpineDelay = {
		[DDZ_CT_SINGLE_LINE] = 1,
		[DDZ_CT_DOUBLE_LINE] = 1,
		[DDZ_CT_THREE_LINE] = 2,
		[DDZ_CT_PLANE_TAKE_SINGLE_WING] = 2,
		[DDZ_CT_PLANE_TAKE_PAIR_WING] = 2,
		[DDZ_CT_BOMB_CARD] = 2,
		[DDZ_CT_MISSILE_CARD] = 3
	}
	slot0.jdGameFigureName = {
		{
			[1.0] = "ddz_dzp",
			[2.0] = "ddz_dz"
		},
		{
			[1.0] = "ddz_nnm",
			[2.0] = "ddz_nm_nan"
		}
	}
	slot0.jdResultFigureName = {
		{
			[1.0] = "ddz_dzp_winlose",
			[2.0] = "ddz_dz_winlose"
		},
		{
			[1.0] = "ddz_nnm_winlose",
			[2.0] = "ddz_nm_nan_winlose"
		}
	}
	slot0.bxpGameFigureName = {
		{
			[1.0] = "dizhupogame",
			[2.0] = "dizhugongneng"
		},
		{
			[1.0] = "nvnongming",
			[2.0] = "nongmingnan"
		}
	}
	slot0.bxpResultFigureName = {
		{
			[1.0] = "dizhupogame_l",
			[2.0] = "dizhugongneng_l"
		},
		{
			[1.0] = "nvnongming_l",
			[2.0] = "nongmingnan_l"
		}
	}
	slot3 = slot0

	slot0.initReportModel()
end

DdzModel.initViewChairIdDic = function (slot0)
	slot0._viewChairIdDic = {}

	for slot4 = 0, 2, 1 do
		slot8 = slot4
		slot0._viewChairIdDic[gameMgr.switchViewChairID(slot6, gameMgr)] = slot4
	end
end

DdzModel.convertArrToDic = function (slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}
	slot5 = slot1

	for slot6, slot7 in pairs(slot4) do
		slot13, slot9 = gameMgr.calPukeInfo(slot9, gameMgr)
		slot14 = slot7

		table.insert(slot12, slot2[ProxyDdz.controller.convertDetailToCv(slot7, ProxyDdz.controller)] or {})

		slot2[slot8] = slot2[ProxyDdz.controller.convertDetailToCv(slot7, ProxyDdz.controller)] or 
	end

	return slot2
end

DdzModel.sortCardsUp = function (slot0, slot1, slot2)
	slot10, slot4 = gameMgr.calPukeInfo(slot4, gameMgr)
	slot10, slot6 = gameMgr.calPukeInfo(slot1, gameMgr)

	if ProxyDdz.controller.convertDetailToCv(slot2, ProxyDdz.controller) == ProxyDdz.controller.convertDetailToCv(slot2, ProxyDdz.controller) then
		return slot4 < slot6
	else
		return slot3 < slot5
	end
end

DdzModel.sortCardsDown = function (slot0, slot1, slot2)
	slot10, slot4 = gameMgr.calPukeInfo(slot4, gameMgr)
	slot10, slot6 = gameMgr.calPukeInfo(slot1, gameMgr)

	if ProxyDdz.controller.convertDetailToCv(slot2, ProxyDdz.controller) == ProxyDdz.controller.convertDetailToCv(slot2, ProxyDdz.controller) then
		return slot6 < slot4
	else
		return slot5 < slot3
	end
end

DdzModel.sortAaTakeBbCards = function (slot0, slot1)
	slot5 = slot1
	slot3 = {}
	slot4 = {}
	slot7 = slot0.convertArrToDic(slot3, slot0)

	for slot8, slot9 in pairs(slot6) do
		slot13 = slot9
		slot14 = {
			count = table.nums(slot12),
			arr = slot9,
			key = slot8
		}

		table.insert(slot12, slot3)
	end

	function slot9(slot0, slot1)
		if slot0.count == slot1.count then
			return slot0.key < slot1.key
		else
			return slot0.count < slot1.count
		end
	end

	table.sort(slot7, slot3)

	slot8 = slot3

	for slot9, slot10 in ipairs(slot7) do
		slot13 = slot10.arr
		slot17 = slot0.sortCardsUp

		table.sort(slot12, handler(slot15, slot0))

		slot14 = slot10.arr
		slot4 = TableUtil.concat(slot12, slot4)
	end

	return slot4
end

DdzModel.nilZeroMetalTable = function (slot0, slot1)
	slot4 = slot1

	for slot5, slot6 in pairs(slot3) do
		if slot6 == 0 then
			slot1[slot5] = nil
		end
	end

	return slot1
end

DdzModel.nilEmptyTable = function (slot0, slot1)
	if slot1 ~= nil then
		slot4 = slot1

		if table.nums(slot3) == 0 then
			return nil
		else
			return slot1
		end
	end
end

DdzModel.onRealGameKindChanged = function (slot0)
	if slot0._realGameKind == GameKind_DDZ_JD then
		slot0._roomTabIndex = 1
	elseif slot0._realGameKind == GameKind_DDZ_BXP then
		slot0._roomTabIndex = 2
	end
end

DdzModel.onSelectedCardsDicChanged = function (slot0)
	if not slot0._selectedCardsDic then
		return
	end

	slot0._selectedOutCardsDic = slot0._selectedOutCardsDic or {}
	slot3 = slot0._selectedCardsDic

	for slot4, slot5 in pairs(slot2) do
		if slot5 == true then
			if slot0._selectedOutCardsDic[slot4] then
				slot0._selectedOutCardsDic[slot4] = nil
			else
				slot0._selectedOutCardsDic[slot4] = true
			end
		end
	end

	if slot0._isOpenLine then
		slot3 = slot0._selectedOutCardsDic

		if table.nums(slot2) == 0 then
			slot3 = ProxyDdz.controller

			ProxyDdz.controller.resetLineInfo(slot2)

			slot5 = true

			slot0.setSelectedOutCardsDic(slot2, slot0, slot0._selectedOutCardsDic)
		elseif slot0._currentUser == DDZ_VIEW_CHAIRID_ME or slot0._lineType == DDZ_LINE_PADDLE then
			slot3 = ProxyDdz.controller

			ProxyDdz.controller.smartLine(slot2)
		else
			slot5 = true

			slot0.setSelectedOutCardsDic(slot2, slot0, slot0._selectedOutCardsDic)
		end
	else
		slot5 = true

		slot0.setSelectedOutCardsDic(slot2, slot0, slot0._selectedOutCardsDic)
	end
end

DdzModel.onMyCardsChanged = function (slot0)
	if slot0._myCards then
		slot4 = slot0._myCards

		slot0.nilZeroMetalTable(slot2, slot0)

		slot3 = slot0._myCards
		slot7 = slot0.sortCardsDown

		table.sort(slot2, handler(slot5, slot0))

		slot0._myCardsColorDic = {}
		slot0._myCardsIndexDic = {}
		slot3 = slot0._myCards

		for slot4, slot5 in ipairs() do
			slot0._myCardsIndexDic[slot5] = slot4
			slot9 = slot5
			slot6, slot7 = gameMgr.calPukeInfo(slot7, gameMgr)
			slot0._myCardsColorDic[slot6] = slot0._myCardsColorDic[slot6] or {}
			slot11 = slot5

			table.insert(slot0._myCardsColorDic[slot6] or , slot0._myCardsColorDic[slot6])
		end
	else
		slot0._myCardsIndexDic = nil
	end
end

DdzModel.onOutCardsDicChanged = function (slot0)
	if not slot0._gameState ~= DDZ_GAMESTATE_PLAY and slot0._outCardsDic then
		slot3 = slot0

		if not slot0.recentTurnIsOutCard(slot2) then
			return
		end
	end

	slot1 = slot0._outCardsDic[slot0._recentOutCardUser]
	slot4 = slot0

	if slot0.getOpenUser(slot3) == slot0._recentOutCardUser then
		slot4 = slot0

		if slot0.getOpenCards(slot3) then
			slot6 = slot1
			slot7 = true

			slot0:setOpenCards(slot0, TableUtil.removeElements(slot0, slot0.getOpenCards(slot3)))
		end
	end

	slot5 = slot0._outCardInfo.ct

	if slot0.isAaTakeBb(slot3, slot0) then
		slot5 = slot1
		slot1 = slot0.sortAaTakeBbCards(slot3, slot0)
	else
		slot4 = slot1
		slot8 = slot0.sortCardsUp

		table.sort(slot3, handler(slot6, slot0))
	end

	if slot0._recentOutCardUser ~= DDZ_VIEW_CHAIRID_RIGHT then
		slot4 = slot1
		slot1 = TableUtil.reverse(slot3)
	end

	slot0._outCardsDic[slot0._recentOutCardUser] = slot1
end

DdzModel.onEndCardsDicChanged = function (slot0)
	if not slot0._endCardsDic then
		return
	end

	slot3 = slot0._endCardsDic

	for slot4, slot5 in pairs(slot2) do
		slot9 = slot4

		if not ProxyDdz.controller.isRoundWinner(slot7, ProxyDdz.controller) then
			slot9 = slot5
			slot8 = slot0.nilZeroMetalTable(slot7, slot0)
			slot12 = slot0.sortCardsUp

			table.sort(slot7, handler(slot10, slot0))
		end
	end
end

DdzModel.onCanOutDataDicChanged = function (slot0, slot1)
	if (slot1 ~= nil and slot1) or slot0._canOutDataDic then
		slot4 = slot3(slot5)
		slot5 = slot3(slot2.ctDic)
		slot8 = slot2.bbDic
		slot6, slot7 = slot3(slot2.boomDic)
		slot10 = slot2.rocketDic
		slot8 = slot3(slot9)

		if slot1 then
			return {
				ctArr = slot4,
				boomArr = slot5,
				bbArr = slot6,
				bbColorArr = slot7,
				rocketArr = slot8
			}
		else
			slot12 = {
				ctArr = slot4,
				boomArr = slot5,
				bbArr = slot6,
				bbColorArr = slot7,
				rocketArr = slot8
			}

			slot0.setCanOutDataArr(slot10, slot0)
		end
	elseif slot1 then
		return nil
	else
		slot6 = nil

		slot0.setCanOutDataArr(slot4, slot0)
	end
end

DdzModel.onOpenCardsChanged = function (slot0)
	if slot0._openCards then
		slot4 = slot0._openCards
		slot0._openCards = slot0.nilZeroMetalTable(slot2, slot0)
		slot3 = slot0._openCards

		for slot4, slot5 in pairs(slot2) do
			slot8 = slot0._openCards
			slot12 = slot0.sortCardsUp

			table.sort(slot7, handler(slot10, slot0))
		end
	end
end

DdzModel.deleteMyCards = function (slot0, slot1)
	slot4 = slot1

	if type(slot3) == "number" then
		slot5 = slot1

		table.removebyvalue(slot3, slot0._myCards)
	else
		slot4 = slot1

		if type(slot3) == "table" then
			slot4 = slot1

			for slot5, slot6 in pairs(slot3) do
				slot10 = slot6

				table.removebyvalue(slot8, slot0._myCards)
			end
		end
	end

	slot6 = true

	slot0.setMyCards(slot3, slot0, slot0._myCards)

	slot5 = nil

	slot0.setSelectedCardsDic(slot3, slot0)
end

DdzModel.isAaTakeBb = function (slot0, slot1)
	return slot1 == DDZ_CT_THREE_TAKE_ONE or slot1 == DDZ_CT_THREE_TAKE_TWO or slot1 == DDZ_CT_FOUR_TAKE_ONE or slot1 == DDZ_CT_FOUR_TAKE_TWO or slot1 == DDZ_CT_PLANE_TAKE_SINGLE_WING or slot1 == DDZ_CT_PLANE_TAKE_PAIR_WING
end

DdzModel.recentTurnIsOutCard = function (slot0)
	return slot0._recentTurnUser == slot0._recentOutCardUser
end

DdzModel.convertDetailToCv = function (slot0, slot1)
	if slot1 == 1 or slot1 == 2 then
		slot1 = slot1 + 13
	elseif slot1 == 14 or slot1 == 15 then
		slot1 = slot1 + 2
	end

	return slot1
end

DdzModel.destroy = function (slot0)
	return
end

return
