slot0 = class("SocketCallbackManager")

slot0.ctor = function (slot0)
	slot0._callbackDics = {}
	slot0._serialCounter = 0
	slot0.curSerial = 0
end

slot0.put = function (slot0, slot1, slot2)
	slot0._callbackDics[slot1] = slot2
end

slot0.cookNextSerial = function (slot0)
	slot0._serialCounter = slot0._serialCounter + 1
	slot0.curSerial = math.floor(os.time()) + slot0._serialCounter
end

slot0.checkTimeOutRequests = function (slot0)
	slot1 = os.time()

	for slot5, slot6 in pairs(slot0._callbackDics) do
		if slot6.timeOutS and slot6.timeOutS < slot1 then
			slot6:onTimeOut()
			slot6:destroy()

			slot0._callbackDics[slot5] = nil
		end
	end
end

slot0.debug = function (slot0)
	print("没有返回的callback：", table.nums(slot0._callbackDics))

	for slot4, slot5 in pairs(slot0._callbackDics) do
		print(slot4)
	end
end

slot0.reset = function (slot0)
	slot0._callbackDics = {}
	slot0._serialCounter = 0
	slot0.curSerial = 0
end

slot0.remove = function (slot0, slot1)
	slot0._callbackDics[slot1] = nil

	return slot0._callbackDics[slot1]
end

socketCallbackMgr = slot0.new()

return
