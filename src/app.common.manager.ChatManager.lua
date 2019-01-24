slot2 = "ChatManager"
ChatManager = class(slot1)
CHAT_TXT = "1"
CHAT_EMOTION = "2"
CHAT_VOICE = "3"
CHAT_USUAL = "4"
slot0 = 150
slot1 = 20
slot2 = "|||"

ChatManager.ctor = function (slot0)
	slot0._voiceRecordingView = nil
	slot0._beginVoiceWorldPos = nil
	slot0._isCancel = false
	slot9 = false

	createSetterGetter(slot2, slot0, "curChat", {}, true, false, false)

	slot9 = false

	createSetterGetter(slot2, slot0, "chatDatas", {}, true, false, false)

	slot6 = true

	createSetterGetter(slot2, slot0, "curSpeakingsDic", {})
end

ChatManager.isSpeaking = function (slot0, slot1)
	slot4 = slot1

	return slot0._curSpeakingsDic[parseInt(slot3)] or false
end

ChatManager.changePlayerSpeakState = function (slot0, slot1, slot2)
	if slot1 then
		slot5 = slot1
		slot3 = slot0._curSpeakingsDic[parseInt(slot4)] or false

		if slot3 ~= slot2 then
			slot0._curSpeakingsDic[slot1] = slot2
			slot6 = slot0.curSpeakingsDicChangedSignal

			slot0.curSpeakingsDicChangedSignal.emit(slot5)
		end
	end
end

ChatManager.reset = function (slot0)
	slot4 = {}

	slot0.setChatDatas(slot2, slot0)

	slot4 = {}

	slot0.setCurChat(slot2, slot0)

	slot4 = {}

	slot0.setCurSpeakingsDic(slot2, slot0)
end

ChatManager.deployVoiceBtn = function (slot0, slot1)
	slot4 = slot1
	slot6 = slot0

	slot1.getTouchSignal(slot3).add(slot3, slot1.getTouchSignal(slot3), slot0.onBtnVoiceTouch)
end

ChatManager.onBtnVoiceTouch = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		slot5 = slot1
		slot0._beginVoiceWorldPos = slot1.getTouchBeganPosition(slot4)
		slot5 = slot0

		slot0.beginVoiceRec(slot4)
	elseif slot2 == ccs.TOUCH_EVENT_MOVED then
		slot6 = slot1

		slot0.checkCancelVoiceRec(slot4, slot0)
	elseif slot2 == ccs.TOUCH_EVENT_ENDED or slot2 == ccs.TOUCH_EVENT_CANCELED then
		slot5 = slot0

		slot0.finishVoiceRec(slot4)
	end
end

ChatManager.getClientContentByServerVo = function (slot0, slot1)
	slot2 = nil

	if slot1.T == CHAT_TXT then
		slot2 = slot1.C
	elseif slot1.T == CHAT_EMOTION then
		slot5 = "chat/E_" .. slot1.C .. ".png"
		slot2 = ResConfig.getIconPath(slot4)
	elseif slot1.T == CHAT_USUAL then
		slot6 = slot1.C
		slot2 = getCSVField(slot4)[parseInt("chatusual")].content
	end

	return slot2
end

ChatManager.getVoiceTimeByParseVoice = function (slot0, slot1)
	slot8 = string.split(slot3, slot1)[#string.split(slot3, slot1)]
	slot6 = checknumber(slot7) * 10

	return math.floor(slot0) / 10
end

ChatManager.insertMsg = function (slot0, slot1)
	if slot1.T ~= CHAT_EMOTION then
		if slot1.T == CHAT_TXT then
			slot6 = "***"
			slot1.C = mainMgr.replaceForbidKeyWord(slot3, mainMgr, slot1.C)
		end

		slot0._chatDatas = slot0._chatDatas or {}
		slot5 = slot1

		table.insert(slot3, slot0._chatDatas)

		if slot0 < #slot0._chatDatas then
			slot5 = 1

			table.remove(slot3, slot0._chatDatas)
		end

		slot4 = slot0.chatDatasChangedSignal

		slot0.chatDatasChangedSignal.emit(slot3)
	end

	slot6 = true

	slot0.setCurChat(slot3, slot0, slot1)

	slot5 = slot1

	slot0.try2UsalVoiceByChatVo(slot3, slot0)
end

ChatManager.handleBroadcastChatInfo = function (slot0, slot1)
	slot5 = slot1

	slot0.insertMsg(slot3, slot0)

	slot5 = slot1

	slot0.try2PlayVoiceByChatVo(slot3, slot0)
end

ChatManager.try2UsalVoiceByChatVo = function (slot0, slot1)
	if slot1.T == CHAT_USUAL then
		slot5 = slot1.C
		slot2 = getCSVField(slot3)[parseInt("chatusual")]
		slot6 = slot1.PID
		slot7 = battleMgr.getClientPosByPlayerId("chatusual", battleMgr)

		if battleMgr.getReadyPlayerBy(battleMgr, battleMgr) and slot2 then
			slot7 = slot2.voicePath

			if StringUtil.isStringValid(slot6) then
				slot10 = true

				audioMgr.playGenderSound(slot6, audioMgr, slot2.voicePath .. ".mp3", slot4.SEX == "1")
			end
		end
	end
end

ChatManager.try2PlayVoiceByChatVo = function (slot0, slot1)
	if slot1.T == CHAT_VOICE then
		function slot9()
			slot4 = false

			slot0.changePlayerSpeakState(slot1, slot0, slot1.PID)
		end

		slot0.try2PlayVoiceByChatContent(slot5, slot0, slot1.C, function ()
			slot4 = true

			slot0.changePlayerSpeakState(slot1, slot0, slot1.PID)
		end)
	end
end

ChatManager.try2PlayVoiceByChatContent = function (slot0, slot1, slot2, slot3)
	slot7 = slot0
	slot4 = string.split(slot5, slot1)
	slot13 = checknumber(slot1)

	gvoiceMgr.downloadAndPlay(slot4[3], gvoiceMgr, slot4[1], slot4[2], slot2, slot3)
end

ChatManager.checkCancelVoiceRec = function (slot0, slot1)
	if not slot0._isCancel then
		slot4 = slot1

		if slot1.getTouchMovePosition(slot3).y > slot0._beginVoiceWorldPos.y + slot0 then
			slot0._isCancel = true

			if slot0._voiceRecordingView then
				slot6 = true

				slot0._voiceRecordingView.setIsCancel(slot4, slot0._voiceRecordingView)
			end

			slot5 = gvoiceMgr

			gvoiceMgr.cancelRec(slot4)
		end
	end
end

ChatManager.forceCancel = function (slot0)
	slot0._isCancel = true

	if slot0._voiceRecordingView then
		slot4 = true

		slot0._voiceRecordingView.setIsCancel(slot2, slot0._voiceRecordingView)
	end

	slot3 = gvoiceMgr

	gvoiceMgr.cancelRec(slot2)

	slot3 = slot0

	slot0.finishVoiceRec(slot2)
end

ChatManager.finishVoiceRec = function (slot0)
	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.OnSceneChanged, slot0.forceCancel)

	if not slot0._isCancel then
		function slot5(slot0, slot1, slot2)
			slot8 = slot0
			slot10 = slot1
			slot5 = "录制上传成功:" .. tostring(slot7) .. "---" .. tostring(slot9)

			trace(slot4)

			slot8 = slot2

			slot0.reqVoiceChat(slot4, slot0, slot0, slot1)
		end

		gvoiceMgr.stopRecordAndUpload(slot3, gvoiceMgr)
	end

	slot0._isCancel = false

	if slot0._voiceRecordingView then
		slot3 = slot0._voiceRecordingView

		slot0._voiceRecordingView.hide(slot2)
	end
end

ChatManager.beginVoiceRec = function (slot0)
	slot6 = slot0

	eventMgr.addOnce(slot2, eventMgr, GameEvent.OnSceneChanged, slot0.forceCancel)

	slot0._isCancel = false
	slot3 = Hero
	slot5 = Hero.getId(slot2) .. "_" .. os.time()

	gvoiceMgr.beginRecording(os.time(), gvoiceMgr)

	if not slot0._voiceRecordingView then
		slot0._voiceRecordingView = VoiceRecordView.new()
	end

	slot4 = slot0._voiceRecordingView

	slot0._voiceRecordingView.showRecording(slot3)
end

ChatManager.reqVoiceChat = function (slot0, slot1, slot2, slot3)
	slot10 = slot3

	function slot10()
		slot2 = "语音聊天发送成功"

		trace(slot1)
	end

	reqChat(slot0, CHAT_VOICE, slot4)

	slot9 = Hero
	slot10 = {
		PID = Hero.getId(CHAT_VOICE),
		T = CHAT_VOICE,
		C = slot1 .. slot0 .. gvoiceMgr.subVoiceFileName(slot7, gvoiceMgr) .. slot0 .. tostring(slot2)
	}

	chatMgr.insertMsg(CHAT_VOICE, chatMgr)
end

chatMgr = ChatManager.new()

return
