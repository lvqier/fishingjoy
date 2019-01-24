slot2 = "LBSManager"
LBSManager = class(slot1)
slot0 = ""

LBSManager.ctor = function (slot0)
	slot0._onLocation = nil
end

LBSManager.try2CollectGps = function (slot0)
	if isMobile and not isAndroid and MainManager_startLocation then
		slot6 = true

		slot0.startLocation(slot3, slot0, function (slot0, slot1, slot2)
			slot7 = "收集gps信息:"

			trace({
				lng = slot0,
				lat = slot1,
				alt = slot2
			})

			slot7 = 

			trace_r()

			slot9 = 1

			slot0.reqCollectData(, slot0, cjson.encode(slot5))
		end)
	end
end

LBSManager.try2CollectGsm = function (slot0)
	if isAndroid and MainManager_getCellInfo then
		slot3 = slot0

		if not slot0.isCDMA(slot2) then
			slot1 = {
				imei = bridgeMgr.getPhoneIMEI(slot3),
				smac = bridgeMgr.getPhoneMacAddr(slot3)
			}
			slot4 = bridgeMgr
			slot4 = bridgeMgr
			slot6 = slot0
			slot2 = cjson.decode(slot0.getCellInfo(slot5))[1] or {}

			if slot2.location_area_code then
				slot5 = slot2.location_area_code

				if tostring(slot4) ~= "0" then
					slot1.mcc = slot2.mobile_country_code
					slot1.mnc = slot2.mobile_network_code
					slot1.lac = slot2.location_area_code
					slot1.cid = slot2.cell_id
					slot1.signal = slot2.signal_strength
					slot5 = "收集gsm信息:"

					trace(slot4)

					slot5 = slot1

					trace_r(slot4)

					slot8 = 3

					slot0.reqCollectData(slot1, slot0, cjson.encode(slot4))
				end
			end
		end
	end
end

LBSManager.try2CollectWifi = function (slot0)
	if isAndroid and MainManager_getWifiInfo then
		slot1 = {
			imei = bridgeMgr.getPhoneIMEI(slot3),
			smac = bridgeMgr.getPhoneMacAddr(slot3)
		}
		slot4 = bridgeMgr
		slot4 = bridgeMgr
		slot3 = nil
		slot4 = {}
		slot7 = cjson.decode(slot0.getWifiInfo(slot5))

		for slot8, slot9 in ipairs(slot0) do
			slot10 = {
				mac = slot9.mac_address,
				signal = slot9.signal_strength,
				ssid = slot9.ssid
			}

			if slot8 == 1 then
				slot13 = slot10.mac

				if StringUtil.isStringValid(slot12) then
					slot3 = slot10
				end
			else
				slot14 = slot10

				table.insert(slot12, slot4)

				if #slot4 >= 23 then
					break
				end
			end
		end

		if slot3 or #slot4 > 0 then
			slot1.myWifi = slot3
			slot1.wifiList = slot4
			slot7 = "收集wifi列表："

			trace(slot6)

			slot7 = slot1

			trace_r(slot6)

			slot10 = 2

			slot0.reqCollectData(slot1, slot0, cjson.encode(slot6))
		end
	end
end

LBSManager.reqCollectData = function (slot0, slot1, slot2)
	slot5 = slot0

	if not StringUtil.isStringValid(slot4) then
		return
	end

	slot10 = "h$n86CF%g!8Vm28@$RLD43473NMEtCy18lgY"
	slot7 = string.format(slot5, "userid=%s&interfacetype=%s&timestamp=%s&key=%s", ({
		userid = Hero.getDwUserID(slot5),
		interfacetype = "save",
		timestamp = tostring(os.time()),
		sign = StringUtil.md5sum("userid=%s&interfacetype=%s&timestamp=%s&key=%s")
	})["userid"], ()["interfacetype"], ()["timestamp"])
	slot3.istesting = (isOutServerTest and 1) or 0
	slot7 = Hero
	slot3.nickname = Hero.getPNickName(Hero)
	slot3.device = PACKAGE_DEVICE_TYPE
	slot7 = slot1
	slot3.json = mime.b64(Hero)
	slot3.datatype = slot2
	slot9 = Hero
	slot3.gameid = tostring(Hero.getDwGameID(slot8))
	slot18 = true

	requestHttp(slot8, slot0, function (slot0)
		slot5 = slot0

		trace(slot2, "geo收集成功", slot0)
	end, function (slot0)
		slot5 = slot0

		trace(slot2, "geo收集失败", slot0)
	end, nil, nil, "POST", nil, slot3, nil)
end

LBSManager.cookGeoStr = function (slot0, slot1, slot2)
	slot7 = nil
	slot7 = nil
	slot2 = fixFloat(slot4, slot2, 3)
	slot3 = ""

	return (slot2 < 0 and ((fixFloat(slot4, slot1, 3) < 0 and "W:" .. slot1) or "E:" .. slot1) .. " S:" .. slot2) or ((fixFloat(slot4, slot1, 3) < 0 and "W:" .. slot1) or "E:" .. slot1) .. " N:" .. slot2
end

LBSManager.isCDMA = function (slot0)
	if isAndroid and MainManager_isCdma then
		return MainManager_isCdma()
	end

	return false
end

LBSManager.getCellInfo = function (slot0)
	if isAndroid and MainManager_getCellInfo then
		return MainManager_getCellInfo()
	end

	return ""
end

LBSManager.getCDMAInfo = function (slot0)
	if isAndroid and MainManager_getCDMAInfo then
		return MainManager_getCDMAInfo()
	end

	return ""
end

LBSManager.getWifiInfo = function (slot0)
	if isAndroid and MainManager_getWifiInfo then
		return MainManager_getWifiInfo()
	end

	return ""
end

LBSManager.reqLocationAuthorization = function (slot0, slot1)
	if isAndroid and MainManager_reqLocationAuthorization then
		slot4 = slot1

		MainManager_reqLocationAuthorization(slot3)
	end
end

LBSManager.onLbsUpdate = function (slot0, slot1, slot2, slot3)
	if slot0._onLocation then
		slot8 = slot3

		slot0._onLocation(slot5, slot1, slot2)
	end
end

LBSManager.stopGps = function (slot0, slot1)
	if isMobile and not isAndroid and MainManager_stopLocation then
		MainManager_stopLocation()
	end
end

LBSManager.getLocationAuthorization = function (slot0)
	if MainManager_getLocationAuthorization then
		return MainManager_getLocationAuthorization()
	end
end

LBSManager.jump2LocationAuthorization = function (slot0)
	if isMobile and MainManager_jump2LocationAuthorization then
		MainManager_jump2LocationAuthorization()
	end
end

LBSManager.startLocation = function (slot0, slot1, slot2)
	if isMobile and not isAndroid and MainManager_startLocation then
		if slot2 == nil then
			slot2 = true
		end

		slot0._onLocation = slot1
		slot8 = slot0.onLbsUpdate
		slot6 = slot2

		MainManager_startLocation(slot4, handler(slot6, slot0))
	end
end

lbsMgr = LBSManager.new()

return
