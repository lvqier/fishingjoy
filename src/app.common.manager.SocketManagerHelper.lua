SocketManager.initHelper = function (slot0)
	slot0.socketLoadConnector = SocketConnector.new()
	slot0.socketTrumpConnector = SocketConnector.new()
	slot0.onConnectSignal = SignalAs3.new()
	slot0.onCloseSignal = SignalAs3.new()
	slot0.onSocketConnectTimeOutSignal = SignalAs3.new()
	slot5 = slot0

	slot0.socketConnector.onConnectSignal.add(slot2, slot0.socketConnector.onConnectSignal, slot0.onSocketSignal)

	slot5 = slot0

	slot0.socketConnector.onSocketClosed.add(slot2, slot0.socketConnector.onSocketClosed, slot0.onSocketSignal)

	slot5 = slot0

	slot0.socketConnector.onSocketConnectTimeOutSignal.add(slot2, slot0.socketConnector.onSocketConnectTimeOutSignal, slot0.onSocketSignal)

	slot5 = slot0

	slot0.socketLoadConnector.onConnectSignal.add(slot2, slot0.socketLoadConnector.onConnectSignal, slot0.onSocketSignal)

	slot5 = slot0

	slot0.socketLoadConnector.onSocketClosed.add(slot2, slot0.socketLoadConnector.onSocketClosed, slot0.onSocketSignal)

	slot5 = slot0

	slot0.socketLoadConnector.onSocketConnectTimeOutSignal.add(slot2, slot0.socketLoadConnector.onSocketConnectTimeOutSignal, slot0.onSocketSignal)

	slot5 = slot0

	slot0.socketTrumpConnector.onConnectSignal.add(slot2, slot0.socketTrumpConnector.onConnectSignal, slot0.onSocketSignal)

	slot5 = slot0

	slot0.socketTrumpConnector.onSocketClosed.add(slot2, slot0.socketTrumpConnector.onSocketClosed, slot0.onSocketSignal)

	slot5 = slot0

	slot0.socketTrumpConnector.onSocketConnectTimeOutSignal.add(slot2, slot0.socketTrumpConnector.onSocketConnectTimeOutSignal, slot0.onSocketSignal)
end

SocketManager.onSocketSignal = function (slot0, slot1)
	if slot1 == slot0.socketConnector.onConnectSignal then
		slot5 = SOCKET_TYPE_ROOM

		slot0.onConnectSignal.emit(slot3, slot0.onConnectSignal)
	elseif slot1 == slot0.socketConnector.onSocketClosed then
		slot5 = SOCKET_TYPE_ROOM

		slot0.onCloseSignal.emit(slot3, slot0.onCloseSignal)
	elseif slot1 == slot0.socketConnector.onSocketConnectTimeOutSignal then
		slot5 = SOCKET_TYPE_ROOM

		slot0.onSocketConnectTimeOutSignal.emit(slot3, slot0.onSocketConnectTimeOutSignal)
	elseif slot1 == slot0.socketLoadConnector.onConnectSignal then
		slot5 = SOCKET_TYPE_LOAD

		slot0.onConnectSignal.emit(slot3, slot0.onConnectSignal)
	elseif slot1 == slot0.socketLoadConnector.onSocketClosed then
		slot5 = SOCKET_TYPE_LOAD

		slot0.onCloseSignal.emit(slot3, slot0.onCloseSignal)
	elseif slot1 == slot0.socketLoadConnector.onSocketConnectTimeOutSignal then
		slot5 = SOCKET_TYPE_LOAD

		slot0.onSocketConnectTimeOutSignal.emit(slot3, slot0.onSocketConnectTimeOutSignal)
	elseif slot1 == slot0.socketTrumpConnector.onConnectSignal then
		slot5 = SOCKET_TYPE_TRUMP

		slot0.onConnectSignal.emit(slot3, slot0.onConnectSignal)
	elseif slot1 == slot0.socketTrumpConnector.onSocketClosed then
		slot5 = SOCKET_TYPE_TRUMP

		slot0.onCloseSignal.emit(slot3, slot0.onCloseSignal)
	elseif slot1 == slot0.socketTrumpConnector.onSocketConnectTimeOutSignal then
		slot5 = SOCKET_TYPE_TRUMP

		slot0.onSocketConnectTimeOutSignal.emit(slot3, slot0.onSocketConnectTimeOutSignal)
	end
end

SocketManager.setPackageHandler = function (slot0, slot1, slot2)
	slot3, slot4, slot5, slot6 = nil

	if (slot2 or SOCKET_TYPE_ROOM) == SOCKET_TYPE_ROOM then
		slot5 = slot0.socketConnector.packageHandler
		slot10 = SOCKET_TYPE_ROOM

		slot1.new().setDataType(slot8, slot1.new())

		slot0.socketConnector.packageHandler = slot1.new()
	end

	if slot2 == SOCKET_TYPE_LOAD then
		slot3 = slot0.socketLoadConnector.packageHandler
		slot10 = SOCKET_TYPE_LOAD

		slot1.new().setDataType(slot8, slot1.new())

		slot0.socketLoadConnector.packageHandler = slot1.new()
	end

	if slot2 == SOCKET_TYPE_TRUMP then
		slot3 = slot0.socketTrumpConnector.packageHandler
		slot10 = SOCKET_TYPE_TRUMP

		slot1.new().setDataType(slot8, slot1.new())

		slot0.socketTrumpConnector.packageHandler = slot1.new()
	end

	if slot3 then
		slot9 = slot3

		slot3.destroy(slot8)
	end

	if slot5 then
		slot9 = slot5

		slot5.destroy(slot8)
	end
end

SocketManager.connect = function (slot0, slot1, slot2, slot3)
	if (slot3 or SOCKET_TYPE_ROOM) == SOCKET_TYPE_ROOM then
		slot8 = slot2

		print(slot5, "连接房间的socket", slot1)

		function slot11(slot0, slot1)
			slot0._roomSocketInfo = {
				domain = slot1,
				ip = slot0,
				port = slot1
			}
		end

		slot0.socketConnector.connect("连接房间的socket", slot0.socketConnector, slot1, slot2, nil)
	elseif slot3 == SOCKET_TYPE_LOAD then
		slot8 = slot2

		print(slot5, "连接登录的socket", slot1)

		function slot11(slot0, slot1)
			slot0._loadSocketInfo = {
				domain = slot1,
				ip = slot0,
				port = slot1
			}
		end

		slot0.socketLoadConnector.connect("连接登录的socket", slot0.socketLoadConnector, slot1, slot2, nil)
	elseif slot3 == SOCKET_TYPE_TRUMP then
		slot8 = slot2

		print(slot5, "连接大喇叭的socket", slot1)

		slot9 = true

		slot0.socketTrumpConnector.connect(slot5, slot0.socketTrumpConnector, slot1, slot2)
	end
end

SocketManager.isConnecting = function (slot0, slot1)
	if (slot1 or SOCKET_TYPE_ROOM) == SOCKET_TYPE_ROOM then
		return slot0.socketConnector and slot0.socketConnector.isConnecting
	elseif slot1 == SOCKET_TYPE_LOAD then
		return slot0.socketLoadConnector and slot0.socketLoadConnector.isConnecting
	elseif slot1 == SOCKET_TYPE_TRUMP then
		return slot0.socketTrumpConnector and slot0.socketTrumpConnector.isConnecting
	end
end

SocketManager.isConnected = function (slot0, slot1)
	if (slot1 or SOCKET_TYPE_ROOM) == SOCKET_TYPE_ROOM then
		return slot0.socketConnector and slot0.socketConnector.isConnected
	elseif slot1 == SOCKET_TYPE_LOAD then
		return slot0.socketLoadConnector and slot0.socketLoadConnector.isConnected
	elseif slot1 == SOCKET_TYPE_TRUMP then
		return slot0.socketTrumpConnector and slot0.socketTrumpConnector.isConnected
	end
end

SocketManager.close = function (slot0, slot1)
	if (slot1 or SOCKET_TYPE_ROOM) == SOCKET_TYPE_ROOM or slot1 == SOCKET_TYPE_ALL_BUT_TRUMP or slot1 == SOCKET_TYPE_ALL then
		slot4 = slot0.socketConnector

		slot0.socketConnector.close(slot3)
	end

	if slot1 == SOCKET_TYPE_LOAD or slot1 == SOCKET_TYPE_ALL_BUT_TRUMP or slot1 == SOCKET_TYPE_ALL then
		slot4 = slot0.socketLoadConnector

		slot0.socketLoadConnector.close(slot3)
	end

	if slot1 == SOCKET_TYPE_TRUMP or slot1 == SOCKET_TYPE_ALL then
		slot4 = slot0.socketTrumpConnector

		slot0.socketTrumpConnector.close(slot3)
	end
end

SocketManager.sendTrumpRequest = function (slot0, slot1, slot2, ...)
	if slot0.socketTrumpConnector and slot0.socketTrumpConnector.isConnected then
		slot8 = slot2
		slot6 = slot0.socketTrumpConnector.packageHandler.cookOject2Bytes(slot4, slot0.socketTrumpConnector.packageHandler, slot1, nil, ...)

		if type(slot0.socketTrumpConnector.packageHandler) == "string" then
			slot7 = slot3

			slot0.socketTrumpConnector.send(slot5, slot0.socketTrumpConnector)
		else
			slot7 = slot3

			slot0.socketTrumpConnector.flushBytes(slot5, slot0.socketTrumpConnector)
		end
	elseif not isNotLogin then
		slot5 = "trump socket 已断开，请求失效"

		print(slot4)
	end
end

SocketManager.sendUserRequest = function (slot0, slot1, slot2, ...)
	if slot0.socketLoadConnector and slot0.socketLoadConnector.isConnected then
		slot8 = slot2
		slot6 = slot0.socketLoadConnector.packageHandler.cookOject2Bytes(slot4, slot0.socketLoadConnector.packageHandler, slot1, nil, ...)

		if type(slot0.socketLoadConnector.packageHandler) == "string" then
			slot7 = slot3

			slot0.socketLoadConnector.send(slot5, slot0.socketLoadConnector)
		else
			slot7 = slot3

			slot0.socketLoadConnector.flushBytes(slot5, slot0.socketLoadConnector)
		end
	elseif not isNotLogin then
		slot5 = "load socket 已断开，请求失效"

		print(slot4)
	end
end

slot2 = socketMgr

socketMgr.initHelper(function (slot0, slot1, slot2, ...)
	if slot0.socketLoadConnector and slot0.socketLoadConnector.isConnected then
		slot8 = slot2
		slot6 = slot0.socketLoadConnector.packageHandler.cookOject2Bytes(slot4, slot0.socketLoadConnector.packageHandler, slot1, nil, ...)

		if type(slot0.socketLoadConnector.packageHandler) == "string" then
			slot7 = slot3

			slot0.socketLoadConnector.send(slot5, slot0.socketLoadConnector)
		else
			slot7 = slot3

			slot0.socketLoadConnector.flushBytes(slot5, slot0.socketLoadConnector)
		end
	elseif not isNotLogin then
		slot5 = "load socket 已断开，请求失效"

		print(slot4)
	end
end)

return
