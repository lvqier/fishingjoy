GV_ON_JOINROOM_SUCC = 1
GV_ON_JOINROOM_TIMEOUT = 2
GV_ON_JOINROOM_SVR_ERR = 3
GV_ON_JOINROOM_UNKNOWN = 4
GV_ON_NET_ERR = 5
GV_ON_QUITROOM_SUCC = 6
GV_ON_MESSAGE_KEY_APPLIED_SUCC = 7
GV_ON_MESSAGE_KEY_APPLIED_TIMEOUT = 8
GV_ON_MESSAGE_KEY_APPLIED_SVR_ERR = 9
GV_ON_MESSAGE_KEY_APPLIED_UNKNOWN = 10
GV_ON_UPLOAD_RECORD_DONE = 11
GV_ON_UPLOAD_RECORD_ERROR = 12
GV_ON_DOWNLOAD_RECORD_DONE = 13
GV_ON_DOWNLOAD_RECORD_ERROR = 14
GV_ON_STT_SUCC = 15
GV_ON_STT_TIMEOUT = 16
GV_ON_STT_APIERR = 17
GV_ON_PLAYFILE_DONE = 18
slot0 = 150
slot3 = "GVoiceManager"
GVoiceManager = class(slot2)

GVoiceManager.ctor = function (slot0)
	slot4 = TickBase

	ClassUtil.extends(slot2, slot0)

	slot0._endHoldTime = nil
	slot0._isRecording = false
end

GVoiceManager.tick = function (slot0)
	if not slot0._isRecording then
		if slot0._endHoldTime then
			slot4 = tickMgr

			if slot0._endHoldTime < tickMgr.getTimer(slot3) then
				slot3 = audioMgr

				audioMgr.resetVolume(slot2)

				slot0._endHoldTime = nil
				slot3 = slot0

				slot0.stopTick(slot2)
			end
		end
	end
end

GVoiceManager.beginHoldVolumn = function (slot0, slot1)
	if not slot0._endHoldTime then
		slot0._endHoldTime = 0
		slot5 = 0

		audioMgr.holdVolume(slot3, audioMgr)
	end

	slot5 = slot0._endHoldTime
	slot0._endHoldTime = math.max(slot3, slot1)
	slot4 = slot0

	if not slot0.getIsTicking(slot3) then
		slot5 = 12

		slot0.startTick(slot3, slot0)
	end
end

GVoiceManager.deployMessagesMode = function (slot0, slot1, slot2, slot3, slot4)
	if GVoiceManager_deployMessagesMode then
		function slot11()
			slot3 = slot1

			slot0.setSpeakerVolume(slot1, slot0)

			slot2 = slot0

			applyFunction(slot1)
		end

		GVoiceManager_deployMessagesMode(slot7, slot1, slot2, slot3)
	end
end

GVoiceManager.startRecording = function (slot0, slot1)
	if GVoiceManager_startRecording then
		slot0._isRecording = true
		slot5 = 0

		audioMgr.holdVolume(slot3, audioMgr)

		slot4 = slot0

		if not slot0.getIsTicking(slot3) then
			slot5 = 12

			slot0.startTick(slot3, slot0)
		end

		slot4 = slot1

		GVoiceManager_startRecording(slot3)
	end
end

GVoiceManager.setSpeakerVolume = function (slot0, slot1)
	if GVoiceManager_setSpeakerVolume then
		slot4 = slot1

		GVoiceManager_setSpeakerVolume(slot3)
	end
end

GVoiceManager.getSpeakerVolume = function (slot0, slot1)
	if GVoiceManager_getSpeakerVolume then
		return GVoiceManager_getSpeakerVolume()
	end

	return slot0
end

GVoiceManager.stopRecording = function (slot0)
	if GVoiceManager_stopRecording then
		slot0._isRecording = false

		GVoiceManager_stopRecording()
	end
end

GVoiceManager.uploadRecordedFile = function (slot0, slot1, slot2)
	if GVoiceManager_uploadRecordedFile then
		slot6 = slot2

		GVoiceManager_uploadRecordedFile(slot4, slot1)
	end
end

GVoiceManager.downloadRecordedFile = function (slot0, slot1, slot2, slot3, slot4)
	if GVoiceManager_downloadRecordedFile then
		slot10 = slot4 or 60000

		GVoiceManager_downloadRecordedFile(slot6, slot1, slot2, slot3)
	end
end

GVoiceManager.playRecordedFile = function (slot0, slot1, slot2, slot3)
	if GVoiceManager_playRecordedFile then
		if not slot3 then
			slot7 = slot2

			GVoiceManager_playRecordedFile(slot5, slot1)
		else
			slot6 = Hero

			if not Hero.getIsForbidPlayerVoice(slot5) then
				slot9 = tickMgr
				slot7 = tickMgr.getTimer(slot8) + slot3

				slot0.beginHoldVolumn(slot5, slot0)
			end

			slot6 = slot1

			GVoiceManager_playRecordedFile(slot5)

			if slot2 then
				slot8 = slot3 * 1000

				tickMgr.delayedCall(slot5, tickMgr, slot2)
			end
		end
	end
end

GVoiceManager.stopPlayFile = function (slot0)
	if GVoiceManager_stopPlayFile then
		GVoiceManager_stopPlayFile()
	end
end

GVoiceManager.deployRealTimeMode = function (slot0, slot1, slot2, slot3)
	if GVoiceManager_deployRealTimeMode then
		slot8 = slot3

		GVoiceManager_deployRealTimeMode(slot5, slot1, slot2)
	end
end

GVoiceManager.joinTeamRoom = function (slot0, slot1, slot2, slot3)
	if GVoiceManager_joinTeamRoom then
		slot8 = slot3

		GVoiceManager_joinTeamRoom(slot5, slot1, slot2)
	end
end

GVoiceManager.quitRoom = function (slot0, slot1)
	if GVoiceManager_quitRoom then
		slot4 = slot1

		GVoiceManager_quitRoom(slot3)
	end
end

GVoiceManager.openMic = function (slot0)
	if GVoiceManager_openMic then
		GVoiceManager_openMic()
	end
end

GVoiceManager.closeMic = function (slot0)
	if GVoiceManager_closeMic then
		GVoiceManager_closeMic()
	end
end

GVoiceManager.closeSpeaker = function (slot0)
	if GVoiceManager_closeSpeaker then
		GVoiceManager_closeSpeaker()
	end
end

GVoiceManager.openSpeaker = function (slot0, slot1)
	if GVoiceManager_openSpeaker then
		slot4 = slot1

		GVoiceManager_openSpeaker(slot3)
	end
end

gvoiceMgr = GVoiceManager.new()

return
