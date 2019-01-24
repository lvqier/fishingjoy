slot2 = "CheckModuleStateBean"
CheckModuleStateBean = class(slot1)

CheckModuleStateBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckModuleStateBean.start = function (slot0)
	slot7 = slot0.finish
	slot8 = slot0.finish
	slot5 = handler(slot0, slot0)
	slot9 = slot0.finish

	mainMgr.requestModuleState(slot2, mainMgr, handler(slot5, slot0), handler(slot0, slot0))
end

return
