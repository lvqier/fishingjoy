slot2 = "CheckFixGameStateBean"
CheckFixGameStateBean = class(slot1)

CheckFixGameStateBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckFixGameStateBean.start = function (slot0)
	slot3 = gameMgr

	gameMgr.fixGameState(slot2)

	slot3 = slot0

	slot0.finish(slot2)
end

return
