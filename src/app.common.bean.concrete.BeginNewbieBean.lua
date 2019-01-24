slot2 = "BeginNewbieBean"
BeginNewbieBean = class(slot1)

BeginNewbieBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

BeginNewbieBean.start = function (slot0)
	slot3 = gameMgr

	if gameMgr.getLastLockServer(slot2) == nil then
		slot4 = NEWBIE_TRIGGER_GAME_BGEIN

		newbieMgr.checkBeginNewbie(slot2, newbieMgr)
	end

	slot3 = slot0

	slot0.finish(slot2)
end

return
