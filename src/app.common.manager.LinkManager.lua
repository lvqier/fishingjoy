slot2 = "LinkManager"
LinkManager = class(slot1)
slot0 = "noticePopup"
slot1 = "wx"
slot2 = "qq"
slot3 = "alipay"
slot4 = "link"
slot5 = "evaluate"

LinkManager.ctor = function (slot0)
	return
end

LinkManager.createWebLink = function (slot0, slot1, slot2)
	slot7 = slot0 .. "|" .. slot2

	return HtmlUtil.createEvent(slot2, slot1)
end

LinkManager.createNoticePopup = function (slot0, slot1, slot2)
	slot5 = slot2
	slot8 = cmsgpack.pack(slot4)
	slot8 = slot0 .. "|" .. mime.b64(slot7)

	return HtmlUtil.createEvent(mime.b64(slot7), slot1)
end

LinkManager.executeEvent = function (slot0, slot1, slot2)
	slot6 = slot1
	slot3, slot4 = slot0.parseEvent(slot4, slot0)

	if slot3 then
		slot7 = slot3
		slot7 = slot0

		if string.lower(slot6) == string.lower(slot6) then
			slot10 = cmsgpack.unpack(slot4[1])

			popupMgr.showNoticePopup(mime.unb64(slot6), popupMgr)
		else
			slot7 = slot1

			if slot3 == string.lower(slot6) then
				slot9 = slot4[1] or ""

				mainMgr.gotoWeChat(slot7, mainMgr)
			else
				slot7 = slot2

				if slot3 == string.lower(slot6) then
					slot9 = slot4[1] or ""

					mainMgr.gotoQQ(slot7, mainMgr)
				else
					slot7 = slot3

					if slot3 == string.lower(slot6) then
						slot8 = slot4[1] or ""

						if StringUtil.isStringValid(slot7) then
							slot8 = slot5

							OSUtil.openURL(slot7)
						end
					else
						slot7 = slot4

						if slot3 == string.lower(slot6) then
							slot7 = bridgeMgr

							if bridgeMgr.isInstallAli(slot6) then
								slot7 = "alipay://"

								OSUtil.openURL(slot6)
							else
								slot8 = "支付宝尚未安装！"

								tweenMsgMgr.showRedMsg(slot6, tweenMsgMgr)
							end
						else
							slot7 = string.lower

							if slot3 == string.lower(slot6) then
								slot8 = slot4[1]

								popupMgr.showKefuKpiPopup(slot6, popupMgr)
							end
						end
					end
				end
			end
		end
	end
end

LinkManager.parseEvent = function (slot0, slot1)
	slot5 = "|"
	slot3 = nil

	if #string.split(slot3, slot1) > 0 then
		slot6 = slot2
		slot3 = TableUtil.shift(slot5)
	end

	return slot3, slot2
end

LinkManager.parseLink = function (slot0, slot1, slot2)
	slot7 = ""
	slot3 = string.gsub(slot4, slot1, "^event%:")

	if slot2 then
		return slot3
	else
		slot8 = slot3

		return slot3, nil, slot0.parseEvent(slot6, slot0)
	end
end

LinkManager.executeLink = function (slot0, slot1, slot2)
	slot5 = slot1

	if StringUtil.isStringValid(slot4) then
		slot6 = "^event%:"
		slot3 = string.find(slot4, slot1) ~= nil

		if slot3 then
			slot8 = true
			slot9 = slot2

			slot0:executeEvent(slot0, slot0.parseLink(slot5, slot0, slot1))
		end
	end
end

linkMgr = LinkManager.new()

return
