SocketManager = class("SocketManager")

SocketManager.ctor = function (slot0)
	slot0.socketConnector = SocketConnector.new()
	slot0.socketUdp = SocketUdpServer.new()

	slot0.socketUdp:start(10)

	slot0.onConnectSignal = slot0.socketConnector.onConnectSignal
	slot0.onCloseSignal = slot0.socketConnector.onSocketClosed
	slot0.onSocketConnectTimeOutSignal = slot0.socketConnector.onSocketConnectTimeOutSignal

	slot0:setPackageHandler(NormalPackageHandler.new())
	slot0.onCloseSignal:add(slot0.onSocketClose, slot0)
end

SocketManager.setPackageHandler = function (slot0, slot1)
	if slot0.socketConnector.packageHandler or slot0.socketUdp.packageHandler then
		slot2:destroy()
	end

	slot0.socketConnector.packageHandler = slot1
	slot0.socketUdp.packageHandler = slot1
end

SocketManager.isConnected = function (slot0)
	return slot0.socketConnector and slot0.socketConnector.isConnected
end

SocketManager.close = function (slot0)
	if slot0.socketConnector then
		slot0.socketConnector:close()
	end
end

SocketManager.onSocketClose = function (slot0)
	socketCallbackMgr:reset()
end

SocketManager.connect = function (slot0, slot1, slot2)
	slot0.socketConnector:connect(slot1, slot2)
end

SocketManager.sendRequest = function (slot0, slot1, slot2, slot3, ...)
	if slot0.socketConnector and slot0.socketConnector.isConnected then
		socketCallbackMgr:cookNextSerial()

		if slot2 then
			socketCallbackMgr:put(tostring(socketCallbackMgr.curSerial), slot2)
		end

		if type(slot0.socketConnector.packageHandler:cookOject2Bytes(slot1, socketCallbackMgr.curSerial, slot3, ...)) == "string" then
			slot0.socketConnector:send(slot4)
		else
			slot0.socketConnector:flushBytes(slot4)
		end
	elseif not isNotLogin then
		print("socket 已断开，请求失效")
	end
end

SocketManager.sendRequestUdp = function (slot0, slot1, slot2, slot3)
	if slot1 then
		slot0.socketUdp:flushBytes(slot0.socketUdp.packageHandler:cookOject2UdpBytes(slot1), slot2, slot3)
	end
end

socketMgr = SocketManager.new()

return socketMgr
