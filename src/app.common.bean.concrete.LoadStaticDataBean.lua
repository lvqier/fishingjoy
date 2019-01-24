slot2 = "LoadStaticDataBean"
LoadStaticDataBean = class(slot1)

LoadStaticDataBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

LoadStaticDataBean.start = function (slot0)
	slot3 = ffiMgr

	ffiMgr.deployProtocol(slot2)

	slot3 = mainMgr
	slot6 = "c50"

	mainMgr.updateLoginLoadingInfo(slot2, I18n.get(slot5))

	slot3 = gameMgr

	gameMgr.loadGameConfig(slot2)

	slot3 = slot0

	slot0.finish(slot2)
end

return
