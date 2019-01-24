slot2 = "CheckNoticeBean"
CheckNoticeBean = class(slot1)

CheckNoticeBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckNoticeBean.start = function (slot0)
	slot3 = gameMgr

	gameMgr.connectTrumpServer(slot2)

	slot4 = true

	gameMgr.setConnectedTrumpSocket(slot2, gameMgr)

	slot3 = slot0

	slot0.finish(slot2)
end

return
