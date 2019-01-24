require("clientcore.com.main.utils.SignalAs3")
require("clientcore.com.main.tick.TickManager")

SocketConnector = class("SocketConnector")
slot0 = "timeout"
slot1 = "already connected"
slot2 = "closed"
slot3 = "Socket is not connected"

SocketConnector.ctor = function (slot0, ...)
	slot0.onConnectSignal = SignalAs3.new("SocketConnector:onConnectSignal")
	slot0.onDataSignal = SignalAs3.new("SocketConnector:onDataSignal")
	slot0.onSocketClosed = SignalAs3.new("SocketConnector:onSocketClosed")
	slot0.onSocketConnectTimeOutSignal = SignalAs3.new("SocketConnector:onSocketClosed")
	slot0.socketClazz = require("socket")
	slot0.socket = nil
	slot0.isConnected = false
	slot0.isConnecting = false
	slot0.packageHandler = nil
	slot0._readSocketSize = 20480
	slot0._connectingTimeMs = 0
	slot0._port = nil
	slot0._host = nil
	slot0._connectSocketTimeOutMs = 3000
	slot0._curParseDnsToken = nil

	ClassUtil.extends(slot0, TickBase)
end

SocketConnector.tick = function (slot0, slot1, slot2)
	if slot0.isConnected then
		slot0:doReceiveData()
		socketCallbackMgr:checkTimeOutRequests()
	elseif slot0.isConnecting then
		slot0._connectingTimeMs = slot0._connectingTimeMs + slot1

		if slot0._connectingTimeMs < slot0._connectSocketTimeOutMs then
			slot3, slot4 = slot0:check2Connect()

			if slot4 == slot0 then
				slot0:onSocketConnect()
			end
		else
			slot0:onSocketConnectTimeOut()
		end
	end
end

SocketConnector.onSocketConnect = function (slot0)
	trace("socket连接成功：" .. tostring(slot0._host) .. ":" .. tostring(slot0._port))
	popupMgr:hideActivityIndicator()

	slot0.isConnected = true
	slot0.isConnecting = false

	slot0.onConnectSignal:emit(slot0.onConnectSignal)
end

SocketConnector.onSocketConnectTimeOut = function (slot0)
	slot0:close()
	slot0.onSocketConnectTimeOutSignal:emit(slot0.onSocketConnectTimeOutSignal)
end

SocketConnector.flushBytes = function (slot0, slot1)
	slot1:setPosition(1)
	slot0:send(slot1:toString())
end

SocketConnector.send = function (slot0, slot1)
	if slot0.socket then
		slot2, slot3, slot4 = slot0.socket:send(slot1)

		if slot3 == slot0 then
			slot0:close()
		end
	end
end

SocketConnector.destroySocketInstance = function (slot0)
	if slot0.socket then
		xpcall(slot1, __emptyFunction)
		slot0.socket:close()

		slot0.socket = nil
	end
end

SocketConnector.close = function (slot0)
	if slot0.isConnected or slot0.isConnecting then
		slot0._curParseDnsToken = nil

		popupMgr:hideActivityIndicator()
		slot0:stopTick()
		slot0:destroySocketInstance()
		trace("socket连接断开：" .. tostring(slot0._host) .. ":" .. tostring(slot0._port))

		slot0._port = nil
		slot0._host = nil
		slot0.isConnected = false
		slot0.isConnecting = false

		slot0.onSocketClosed:emit(slot0.onSocketClosed)
	end
end

SocketConnector.doReceiveData = function (slot0)
	if slot0.isConnected then
		slot1, slot2, slot3 = slot0.socket:receive(slot0._readSocketSize)
		slot1 = slot1 or ""
		slot3 = slot3 or ""

		if StringUtil.isStringValid(slot1) or StringUtil.isStringValid(slot3) then
			slot0:echoReceiveDataLog(slot1, slot2, slot3, false)
			slot0.packageHandler:cookBytes2Object(slot1, slot3)
			slot0:doReceiveData()
		end

		if slot2 == slot0 then
			trace("服务器socket主动断开：" .. tostring(slot0._host) .. ":" .. tostring(slot0._port))
			slot0:close()
		end
	end
end

SocketConnector.check2Connect = function (slot0)
	slot3, slot4 = slot0.socket:connect(slot0._host, slot0._port)

	return slot1, slot2
end

SocketConnector.getAddresFromDns = function (slot0, slot1, slot2)
	slot3 = 0
	slot4, slot5 = nil

	if SwManager_getaddrinfoInThread then
		slot0._curParseDnsToken = tostring(os.time())

		SwManager_getaddrinfoInThread(slot1, function (slot0)
			if slot0._curParseDnsToken ==  then
				xpcall(function ()
					slot0 = cjson.decode(slot1)
				end, function ()
					if trackToServer then
						trackToServer(TRACK_SHENGSLOG, "很奇怪的dns解析结果，jsonstr：" .. tostring(trackToServer))
					end
				end)

				if ({})["errorCode"] then
					if slot2 + 1 < 3 then
						SwManager_getaddrinfoInThread(slot3, SwManager_getaddrinfoInThread)
					elseif slot5 then
						slot5({}, slot1.errorCode, slot2, true)
					end
				elseif slot5 then
					slot5(slot1, slot1.errorCode, slot2, true)
				end
			end
		end)

		return
	end

	while slot3 < 3 do
		slot4, slot5 = slot0.socketClazz.dns.getaddrinfo(slot1)

		if not slot6 or table.nums(slot4) == 0 then
			slot3 = slot3 + 1
		else
			break
		end
	end

	if slot2 then
		slot2(slot4, slot5, slot3, false)
	end
end

SocketConnector.connect = function (slot0, slot1, slot2, slot3, slot4)
	if not slot0.isConnecting and not slot0.isConnected then
		if not slot3 then
			popupMgr:showActivityIndicator()
		end

		slot0:destroySocketInstance()

		slot5 = false
		slot6 = tickMgr:getTimer()

		slot0:getAddresFromDns(slot1, function (slot0, slot1, slot2, slot3)
			TableUtil.randomSort(slot0 or {})

			slot4 = #(slot0 or )
			slot5 = 1
			slot6 = {}

			while slot5 <= slot4 do
				if slot6[slot0[slot5].addr] then
					table.remove(slot0, slot5)

					slot4 = slot4 - 1
				else
					slot6[slot7.addr] = slot7
					slot5 = slot5 + 1
				end
			end

			traceLog("dns解析socket域名，耗时：" .. tickMgr:getTimer() - slot0 .. " " .. I18n.get("c1487") .. slot2 .. ", ip:" .. slot1 .. ", port:" .. slot2 .. ",是否多线程：" .. tostring(slot3))
			traceLog_r(slot0)

			for slot10, slot11 in ipairs(slot0) do
				if slot11.family == "inet6" then
					slot3 = true
					slot4._host = slot11.addr

					break
				elseif not slot4._host then
					slot4._host = slot11.addr
				end
			end

			if slot3 then
				slot4.socket = slot4.socketClazz.tcp6()
			else
				slot4.socket = slot4.socketClazz.tcp()
			end

			slot4.socket:setoption("tcp-nodelay", true)
			slot4.socket:settimeout(0)

			if not slot4._host then
				slot4._host = slot1
			end

			slot4._port = slot2

			if slot5 then
				slot5(slot4._host, slot4._port)
			end

			traceLog("socket正在连接：" .. tostring(slot4._host) .. ":" .. tostring(slot4._port))

			slot4.isConnecting = true
			slot4._connectingTimeMs = 0

			slot4:startTick(10)
		end)

		return
	end

	print("socket正在连接或已连接，不能再次进行连接")
end

SocketConnector.echoReceiveDataLog = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = ""
	slot5 = (slot1 and ",dataLen:" .. tostring(#slot1)) or ""
	slot6 = ""
	slot6 = (slot3 and ",partialLen:" .. tostring(#slot3)) or ""

	if slot4 then
		if slot1 then
			print("data:")
			slot0:printData(slot1)
		end

		if slot3 then
			print("partial:")
			slot0:printData(slot3)
		end
	end
end

SocketConnector.printData = function (slot0, slot1)
	slot2 = ByteArray.new(slot1)

	print("len", slot3, type(slot1), slot2:getBytesAvailable())

	for slot7 = 1, slot2:getSize(), 1 do
		print("char:", slot7, "ascii", slot2:readByte(false))
	end
end

return
