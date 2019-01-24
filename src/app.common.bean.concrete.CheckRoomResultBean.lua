slot2 = "CheckRoomResultBean"
CheckRoomResultBean = class(slot1)

CheckRoomResultBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)

	slot0._timeOutTimer = nil
end

CheckRoomResultBean.start = function (slot0)
	slot3 = gameMgr

	if gameMgr.getServerVosDic(slot2) ~= nil then
		slot5 = gameMgr

		if table.nums(gameMgr.getServerVosDic(slot4)) == 0 then
			slot4 = slot0.finish
			RoomResultFromClientGet = handler(slot2, slot0)
			slot3 = "登录的时候房间没有下发房间列表, 客户端主动请求房间信息了"

			trace(slot2)

			slot3 = "true"

			reqGetServerRoomList(slot2)

			slot7 = slot0.onTimeOut
			slot5 = 6000
			slot0._timeOutTimer = tickMgr.delayedCall(slot2, tickMgr, handler(slot5, slot0))
			slot0._timeOutTimer.autoDispose = false
		else
			slot3 = slot0

			slot0.finish(slot2)
		end
	end
end

CheckRoomResultBean.onTimeOut = function (slot0)
	if slot0._timeOutTimer then
		slot3 = slot0._timeOutTimer

		slot0._timeOutTimer.destroy(slot2)

		slot0._timeOutTimer = nil
	end

	slot3 = "客户端主动请求房间信息超时，重新请求"

	trace(slot2)

	slot3 = slot0

	slot0.start(slot2)
end

CheckRoomResultBean.finish = function (slot0)
	if slot0._timeOutTimer then
		slot3 = slot0._timeOutTimer

		slot0._timeOutTimer.destroy(slot2)

		slot0._timeOutTimer = nil
	end

	RoomResultFromClientGet = nil
	slot3 = slot0

	AbstractBean.finish(slot2)
end

return
