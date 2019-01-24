slot2 = "PdkModel"
PdkModel = class(slot1)
PDK_INVALID_WORD = 65535
PDK_CV_A = 14
PDK_CV_2 = 15
PDK_CARDS_COUNT = 16
CARD_CHANGE_INIT = 2
CARD_CHANGE_OUT = 3
CARD_CHANGE_RECONNECT = 4
PDK_CT_ERROR = 0
PDK_CT_SINGLE = 1
PDK_CT_DOUBLE = 2
PDK_CT_THREE = 3
PDK_CT_SINGLE_LINE = 4
PDK_CT_DOUBLE_LINE = 5
PDK_CT_THREE_LINE = 6
PDK_CT_THREE_TAKE_ONE = 7
PDK_CT_THREE_TAKE_TWO = 8
PDK_CT_BOMB_CARD = 9
PDK_CT_PLANE_TAKE_SINGLE_WING = 10
PDK_CT_PLANE_TAKE_PAIR_WING = 11
PDK_GAME_SCENE_FREE = GAME_STATUS_FREE
PDK_GAME_SCENE_PLAY = GAME_STATUS_PLAY + 2
PDK_SUB_S_GAME_START = 100
PDK_SUB_S_OUT_CARD = 103
PDK_SUB_S_PASS_CARD = 104
PDK_SUB_S_GAME_CONCLUDE = 105
PDK_SUB_S_TRUSTEE = 108
PDK_SUB_S_ANDROID_CARD = 110
PDK_SUB_C_OUT_CARD = 1
PDK_SUB_C_TRUSTEE = 2
PDK_SUB_C_PASS_CARD = 3
PDK_VIEW_CHAIRID_ME = 1
PDK_VIEW_CHAIRID_RIGHT = 2
PDK_VIEW_CHAIRID_LEFT = 3
PDK_GAMESTATE_NON = 0
PDK_GAMESTATE_READY = 1
PDK_GAMESTATE_PLAY = 2
PDK_GAMESTATE_END = 3
PDK_UNRECONNECT_PROTOCOL = {
	[PDK_SUB_S_GAME_START] = true,
	[PDK_SUB_S_OUT_CARD] = true,
	[PDK_SUB_S_GAME_CONCLUDE] = true,
	[PDK_SUB_S_TRUSTEE] = true
}
PDK_SPECIALCT_EFFECT = {
	[PDK_CT_BOMB_CARD] = "pdkzhadan",
	[PDK_CT_THREE_LINE] = "pdkfeiji",
	[PDK_CT_PLANE_TAKE_SINGLE_WING] = "pdkfeiji",
	[PDK_CT_PLANE_TAKE_PAIR_WING] = "pdkfeiji"
}
PDK_SPECIALCT_TXT = {
	[PDK_CT_SINGLE_LINE] = "pdkshunzi",
	[PDK_CT_DOUBLE_LINE] = "pdkliandui",
	[PDK_CT_PLANE_TAKE_SINGLE_WING] = "pdkfeijipaixingtext"
}
PDK_SOUND_TIMEWARNING1 = "effect/time_warning1.mp3"
PDK_SOUND_TIMEWARNING2 = "effect/TISHICHUPAI-2.mp3"
PDK_SOUND_FAPAI = "fapai.mp3"
PDK_SOUND_XUANPAI = "xuanpai.mp3"

PdkModel.ctor = function (slot0)
	slot10 = true

	ClassUtil.extends(slot2, slot0, BaseGameModel, true, GameKind_PDK, 1, nil, nil)

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

	slot5 = 0

	createSetterGetter(slot2, slot0, "cardChangeType")

	slot6 = true

	createSetterGetter(slot2, slot0, "currentUser", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "gameState", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "canOutCard", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "canOnceOutAllCards", false)

	slot9 = false
	slot13 = slot0.onCanOutDataDicChanged

	createSetterGetter(slot2, slot0, "canOutDataDicValue", nil, true, false, false, handler(slot11, slot0))

	slot5 = nil

	createSetterGetter(slot2, slot0, "canOutDataArrValue")

	slot5 = nil

	createSetterGetter(slot2, slot0, "tipsInfo")

	slot6 = true

	createSetterGetter(slot2, slot0, "myTableUserDatasDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "myUserData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "leaveCardsCountDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "curResultInfoDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "autoDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "timeDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingMatchFloat", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "usersIsOutCardDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "lCellScore", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "winnerViewId", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "curCtScoreDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowWarningSpineDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowHandCard", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowAutoIconDic", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowCantOutTxt", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "stateViewDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "lockViewDic", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "warningEffectDic", nil)

	slot4 = "enterForegroundSignal"

	createSetterGetter(slot2, slot0, SignalAs3.new())

	slot4 = "exitGameSignal"

	createSetterGetter(slot2, slot0, SignalAs3.new())

	slot6 = true

	createSetterGetter(slot2, slot0, "androidCards", nil)

	slot0._isFromReconnect = true
	slot0._loadingDuration = 0.7
	slot0._loadingPlistName = "#plist_pdk_font_loading_1_%s.png"
	slot0._recentOutCardUser = nil
	slot0._recentTurnUser = nil
	slot0._lineType = 0
	slot0._isOpenLine = true
	slot0.spineLogoKeyInLoading = "pdklogo"
	slot6 = true

	createSetterGetter(slot2, slot0, "isShowBtnStart", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isHoldBtnStartAtBegin", true)

	slot6 = true

	createSetterGetter(slot2, slot0, "isHoldBtnStartAtResult", true)

	slot0.musicBg = "bgm/bgm_1.mp3"
	slot0._ctSpineDelay = {
		[PDK_CT_SINGLE_LINE] = 1,
		[PDK_CT_DOUBLE_LINE] = 1,
		[PDK_CT_THREE_LINE] = 2,
		[PDK_CT_PLANE_TAKE_SINGLE_WING] = 2,
		[PDK_CT_PLANE_TAKE_PAIR_WING] = 2,
		[PDK_CT_BOMB_CARD] = 2
	}
	slot3 = slot0

	slot0.initReportModel(PDK_CT_BOMB_CARD)
end

PdkModel.convertArrToDic = function (slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}
	slot5 = slot1

	for slot6, slot7 in pairs(slot4) do
		slot13, slot9 = gameMgr.calPukeInfo(slot9, gameMgr)
		slot14 = slot7

		table.insert(slot12, slot2[slot0.convertDetailToCv(slot7, slot0)] or {})

		slot2[slot8] = slot2[slot0.convertDetailToCv(slot7, slot0)] or 
	end

	return slot2
end

PdkModel.convertDetailToCv = function (slot0, slot1)
	if slot1 == 1 or slot1 == 2 then
		slot1 = slot1 + 13
	elseif slot1 == 14 or slot1 == 15 then
		slot1 = slot1 + 2
	end

	return slot1
end

PdkModel.sortCardsUp = function (slot0, slot1, slot2)
	slot10, slot4 = gameMgr.calPukeInfo(slot4, gameMgr)
	slot10, slot6 = gameMgr.calPukeInfo(slot1, gameMgr)

	if slot0.convertDetailToCv(slot2, slot0) == slot0.convertDetailToCv(slot2, slot0) then
		return slot4 < slot6
	else
		return slot3 < slot5
	end
end

PdkModel.sortCardsDown = function (slot0, slot1, slot2)
	slot10, slot4 = gameMgr.calPukeInfo(slot4, gameMgr)
	slot10, slot6 = gameMgr.calPukeInfo(slot1, gameMgr)

	if slot0.convertDetailToCv(slot2, slot0) == slot0.convertDetailToCv(slot2, slot0) then
		return slot6 < slot4
	else
		return slot5 < slot3
	end
end

PdkModel.nilZeroMetalTable = function (slot0, slot1)
	slot4 = slot1

	for slot5, slot6 in pairs(slot3) do
		if slot6 == 0 then
			slot1[slot5] = nil
		end
	end

	return slot1
end

PdkModel.nilEmptyTable = function (slot0, slot1)
	if slot1 ~= nil then
		slot4 = slot1

		if table.nums(slot3) == 0 then
			return nil
		else
			return slot1
		end
	end
end

PdkModel.isRoundWinner = function (slot0, slot1)
	slot1 = slot1 or PDK_VIEW_CHAIRID_ME

	if slot0._winnerViewId then
		slot4 = slot0._winnerViewId

		for slot5, slot6 in pairs(slot3) do
			if slot6 == slot1 then
				return true
			end
		end
	end

	return false
end

PdkModel.isAaTakeBb = function (slot0, slot1)
	return slot1 == PDK_CT_THREE_TAKE_TWO or slot1 == PDK_CT_PLANE_TAKE_PAIR_WING
end

PdkModel.recentTurnIsOutCard = function (slot0)
	return slot0._recentTurnUser == slot0._recentOutCardUser
end

PdkModel.onSelectedCardsDicChanged = function (slot0)
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
			slot3 = ProxyPdk.controller

			ProxyPdk.controller.resetLineInfo(slot2)

			slot5 = true

			slot0.setSelectedOutCardsDic(slot2, slot0, slot0._selectedOutCardsDic)
		elseif slot0._currentUser == PDK_VIEW_CHAIRID_ME or slot0._lineType == PDK_LINE_PADDLE then
			slot3 = ProxyPdk.controller

			ProxyPdk.controller.smartLine(slot2)
		else
			slot5 = true

			slot0.setSelectedOutCardsDic(slot2, slot0, slot0._selectedOutCardsDic)
		end
	else
		slot5 = true

		slot0.setSelectedOutCardsDic(slot2, slot0, slot0._selectedOutCardsDic)
	end
end

PdkModel.onMyCardsChanged = function (slot0)
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

PdkModel.onOutCardsDicChanged = function (slot0)
	if not slot0._gameState ~= PDK_GAMESTATE_PLAY and slot0._outCardsDic then
		slot3 = slot0

		if not slot0.recentTurnIsOutCard(slot2) then
			return
		end
	end

	function slot1(slot0)
		slot4 = slot0
		slot2 = {}
		slot3 = {}
		slot6 = slot0.convertArrToDic(slot2, slot0)

		for slot7, slot8 in pairs(slot5) do
			slot12 = slot8
			slot13 = {
				count = table.nums(slot11),
				arr = slot8,
				key = slot7
			}

			table.insert(slot11, slot2)
		end

		function slot8(slot0, slot1)
			if slot0.count == slot1.count then
				return slot0.key < slot1.key
			else
				return slot0.count < slot1.count
			end
		end

		table.sort(slot6, slot2)

		slot7 = slot2

		for slot8, slot9 in ipairs(slot6) do
			slot12 = slot9.arr
			slot16 = slot0.sortCardsUp

			table.sort(slot11, handler(slot14, slot0))

			slot13 = slot9.arr
			slot3 = TableUtil.concat(slot11, slot3)
		end

		return slot3
	end

	slot2 = slot0._outCardsDic[slot0._recentOutCardUser]
	slot6 = slot0._outCardInfo.ct

	if slot0.isAaTakeBb(slot4, slot0) then
		slot5 = slot2
		slot2 = slot1(slot4)
	else
		slot5 = slot2
		slot9 = slot0.sortCardsUp

		table.sort(slot4, handler(slot7, slot0))
	end

	if slot0._recentOutCardUser ~= PDK_VIEW_CHAIRID_RIGHT then
		slot5 = slot2
		slot2 = TableUtil.reverse(slot4)
	end

	slot0._outCardsDic[slot0._recentOutCardUser] = slot2
end

PdkModel.onEndCardsDicChanged = function (slot0)
	if not slot0._endCardsDic then
		return
	end

	slot3 = slot0._endCardsDic

	for slot4, slot5 in pairs(slot2) do
		slot9 = slot4

		if not slot0.isRoundWinner(slot7, slot0) then
			slot9 = slot5
			slot8 = slot0.nilZeroMetalTable(slot7, slot0)
			slot12 = slot0.sortCardsUp

			table.sort(slot7, handler(slot10, slot0))
		end
	end
end

PdkModel.onCanOutDataDicChanged = function (slot0, slot1)
	if (slot1 ~= nil and slot1) or slot0._canOutDataDicValue then
		slot4 = slot3(slot5)
		slot5 = slot3(slot2.ctDic)
		slot8 = slot2.bbDic
		slot6, slot7 = slot3(slot2.boomDic)

		if slot1 then
			return {
				ctArr = slot4,
				boomArr = slot5,
				bbArr = slot6,
				bbColorArr = slot7
			}
		else
			slot11 = {
				ctArr = slot4,
				boomArr = slot5,
				bbArr = slot6,
				bbColorArr = slot7
			}

			slot0.setCanOutDataArrValue(slot9, slot0)
		end
	elseif slot1 then
		return nil
	else
		slot6 = nil

		slot0.setCanOutDataArrValue(slot4, slot0)
	end
end

PdkModel.deleteMyCardDatas = function (slot0, slot1)
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

PdkModel.destroy = function (slot0)
	return
end

return
