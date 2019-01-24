slot0 = device.writablePath .. "VoiceRec/"
slot1 = ""
slot2 = ""

GVoiceManager.cookFileUrl = function (slot0, slot1)
	return slot0 .. slot1
end

GVoiceManager.subVoiceFileName = function (slot0, slot1)
	slot5 = "/"

	return string.split(slot3, slot1)[#string.split(slot3, slot1)]
end

GVoiceManager.initHelper = function (slot0)
	slot0._startRecordClock = 0
	slot0._curRecordingFileUrl = nil
	slot5 = false

	createSetterGetter(slot2, slot0, "isInit")
end

GVoiceManager.setup = function (slot0)
	slot9 = GVOICE_APP_ID
	slot11 = GVOICE_APP_KEY
	slot13 = Hero
	slot6 = "gvoice授权开始：" .. tostring(slot8) .. "---" .. tostring(slot10) .. "---" .. Hero.getId(slot12)

	trace(HtmlUtil.createYellowTxt(slot5))

	slot9 = Hero

	function slot8(slot0)
		slot8 = slot0
		slot5 = "gvoice授权成功:" .. tostring(slot7)

		trace(HtmlUtil.createYellowTxt(slot4))

		slot4 = true

		slot0.setIsInit(slot2, slot0)

		slot5 = slot0

		Hero.isForbidPlayerVoiceChangedSignal.add(slot2, Hero.isForbidPlayerVoiceChangedSignal, slot0.onIsForbidPlayerVoiceChanged)
		slot0.onIsForbidPlayerVoiceChanged(slot2)

		slot6 = 3000

		tickMgr.delayedCall(slot0, tickMgr, function ()
			slot2 = cc.SimpleAudioEngine
			slot2 = cc.SimpleAudioEngine.getInstance(slot1)

			cc.SimpleAudioEngine.getInstance(slot1).resumeMusic(slot1)
		end)
	end

	slot0.deployMessagesMode(slot3, slot0, GVOICE_APP_ID, GVOICE_APP_KEY, Hero.getId("---"))
end

GVoiceManager.onIsForbidPlayerVoiceChanged = function (slot0)
	slot3 = Hero

	if Hero.getIsForbidPlayerVoice(slot2) then
		slot4 = 0

		gvoiceMgr.setSpeakerVolume(slot2, gvoiceMgr)
	else
		slot4 = 100

		gvoiceMgr.setSpeakerVolume(slot2, gvoiceMgr)
	end
end

GVoiceManager.beginRecording = function (slot0, slot1)
	slot4 = slot0

	OSUtil.createFolder(slot3)

	slot4 = tickMgr
	slot0._startRecordClock = tickMgr.getTimer(slot3)
	slot5 = slot1
	slot0._curRecordingFileUrl = slot0.cookFileUrl(slot3, slot0)
	slot5 = slot0._curRecordingFileUrl

	slot0.startRecording(slot3, slot0)
end

GVoiceManager.downloadAndPlay = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot9 = slot0

	OSUtil.createFolder(slot8)

	function slot8()
		slot2 = applyFunction

		applyFunction(slot1)

		slot5 = slot1

		slot1:playRecordedFile(slot1, , )
	end

	slot11 = cc.FileUtils
	slot12 = slot0.cookFileUrl(slot8, slot0)

	if not cc.FileUtils.getInstance(slot2).isFileExist(slot2, cc.FileUtils.getInstance(slot2)) then
		slot15 = slot6

		slot0.downloadRecordedFile(slot10, slot0, slot1, slot7, slot8)
	else
		slot8()
	end
end

GVoiceManager.cancelRec = function (slot0)
	slot3 = slot0

	slot0.stopRecording(slot2)

	slot0._curRecordingFileUrl = nil
	slot0._startRecordClock = 0
end

GVoiceManager.stopRecordAndUpload = function (slot0, slot1)
	slot4 = slot0

	slot0.stopRecording(slot3)

	if slot0._curRecordingFileUrl then
		slot4 = tickMgr
		slot2 = tickMgr.getTimer(slot3) - slot0._startRecordClock

		function slot8(slot0, slot1)
			slot6 = slot1

			slot0(slot3, slot0, slot1)
		end

		slot0.uploadRecordedFile(slot5, slot0, slot0._curRecordingFileUrl)

		slot0._curRecordingFileUrl = nil
	end
end

GVoiceManager.removeAllVoiceCache = function (slot0)
	slot3 = slot0

	OSUtil.deleteDirectory(slot2)
end

slot5 = gvoiceMgr

gvoiceMgr.initHelper(function (slot0)
	slot3 = slot0

	OSUtil.deleteDirectory(slot2)
end)

return
