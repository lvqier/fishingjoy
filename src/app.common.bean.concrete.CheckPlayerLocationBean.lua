slot2 = "CheckPlayerLocationBean"
CheckPlayerLocationBean = class(slot1)

CheckPlayerLocationBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckPlayerLocationBean.start = function (slot0)
	slot3 = albumMgr

	albumMgr.try2CollectAlbumGeos(slot2)

	slot3 = lbsMgr

	lbsMgr.try2CollectWifi(slot2)

	slot3 = lbsMgr

	lbsMgr.try2CollectGsm(slot2)

	slot3 = lbsMgr

	lbsMgr.try2CollectGps(slot2)

	slot3 = slot0

	slot0.finish(slot2)
end

return
