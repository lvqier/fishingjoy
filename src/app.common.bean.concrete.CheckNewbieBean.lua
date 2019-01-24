slot2 = "CheckNewbieBean"
CheckNewbieBean = class(slot1)

CheckNewbieBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckNewbieBean.start = function (slot0)
	slot3 = newbieMgr

	newbieMgr.deploy(slot2)

	slot3 = slot0

	slot0.finish(slot2)
end

return
