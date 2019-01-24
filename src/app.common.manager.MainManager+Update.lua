MainManager.initUpdateHelper = function (slot0)
	slot0._timer2CheckUpdate = nil
	slot0._isShowingAlert = false

	if not IS_IOS_VERIFY and isMobile then
		slot3 = _versionUrl1

		if StringUtil.isStringValid(slot2) and CHECK_CLIENT_UPDATE then
			slot7 = slot0.requestCheckUpdate
			slot6 = -1
			slot0._timer2CheckUpdate = tickMgr.delayedCall(slot2, tickMgr, handler(slot5, slot0), 60000)
		end
	end
end

MainManager.startCheckUpdate = function (slot0)
	if slot0._timer2CheckUpdate then
		slot3 = slot0._timer2CheckUpdate

		slot0._timer2CheckUpdate.reset(slot2)

		slot3 = slot0._timer2CheckUpdate

		slot0._timer2CheckUpdate.start(slot2)

		slot3 = slot0

		slot0.requestCheckUpdate(slot2)
	end
end

MainManager.stopCheckUpdate = function (slot0)
	if slot0._timer2CheckUpdate then
		slot3 = slot0._timer2CheckUpdate

		slot0._timer2CheckUpdate.stop(slot2)
	end
end

MainManager.onVersionComplete = function (slot0, slot1)
	slot4 = slot1
	slot6 = "\n"
	slot5 = "\n"
	slot2 = TableUtil.validateStringArray(slot1)
	slot3 = nil
	slot4 = string.trim
	slot6 = (((isAndroid and #slot2 >= 2) or slot2[1]) and slot2[2]) or ""
	slot7 = ","
	slot13 = string.split(string.split(slot3, slot1), ((isAndroid and #slot2 >= 2) or slot2[1]) and slot2[2])[1]
	slot15 = CLIENT_VERSION
	slot10 = "客户端版本检测：" .. tostring(slot12) .. "_" .. tostring(slot14)

	trace(HtmlUtil.createYellowTxt(slot9))

	if string.split(string.split(slot3, slot1), ((isAndroid and #slot2 >= 2) or slot2[1]) and slot2[2])[1] ~= CLIENT_VERSION then
		slot9 = "."
		slot6 = string.split(slot7, slot5)
		slot10 = "."
		slot7 = string.split(slot5, CLIENT_VERSION)
		slot8 = true

		for slot12 = 1, 3, 1 do
			if slot6[slot12] ~= slot7[slot12] then
				slot8 = false

				break
			end
		end

		if not slot8 then
			slot11 = slot0

			slot0.showNewVersionPopup(slot10)
		end
	end
end

MainManager.showNewVersionPopup = function (slot0)
	if not slot0._isShowingAlert then
		slot0._isShowingAlert = true
		slot3 = slot0._timer2CheckUpdate

		slot0._timer2CheckUpdate.reset(slot2)

		function slot7()
			quick.exit()
		end

		slot3 = popupMgr.showAlert(slot4, popupMgr, slot1)
		slot7 = false

		slot3.setCanHide(popupMgr, slot3)

		slot7 = ZORDER_NORMAL_POPUP + 1

		slot3._view.setLocalZOrder(popupMgr, slot3._view)

		slot7 = SOCKET_TYPE_ALL_BUT_TRUMP

		networkMgr.closeSocket(popupMgr, networkMgr)
	end
end

MainManager.requestCheckUpdate = function (slot0)
	if slot0._timer2CheckUpdate then
		slot3 = os.time()
		slot5 = _versionUrl1 .. "?v=" .. slot3

		trace(slot3, "检测版本:")

		slot8 = slot0.onVersionComplete
		slot13 = true

		requestHttp(slot3, _versionUrl1 .. "?v=" .. slot3, handler(slot6, slot0), nil, nil, nil, nil, nil, nil, nil)
	end
end

slot2 = mainMgr

mainMgr.initUpdateHelper(function (slot0)
	if slot0._timer2CheckUpdate then
		slot3 = os.time()
		slot5 = _versionUrl1 .. "?v=" .. slot3

		trace(slot3, "检测版本:")

		slot8 = slot0.onVersionComplete
		slot13 = true

		requestHttp(slot3, _versionUrl1 .. "?v=" .. slot3, handler(slot6, slot0), nil, nil, nil, nil, nil, nil, nil)
	end
end)

return
