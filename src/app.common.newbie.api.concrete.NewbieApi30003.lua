slot2 = "NewbieApi30003"
NewbieApi30003 = class(slot1)

NewbieApi30003.ctor = function (slot0)
	slot4 = BaseNewbieApi

	ClassUtil.extends(slot2, slot0)
end

NewbieApi30003.checkStart = function (slot0, slot1)
	slot4 = gameMgr

	if gameMgr.getIsLoginBank(slot3) then
		slot4 = slot0

		slot0.finish(slot3)
	else
		slot5 = slot1

		BaseNewbieApi.checkStart(slot3, slot0)
	end
end

NewbieApi30003.start = function (slot0)
	slot3 = slot0

	slot0.finish(slot2)
end

NewbieApi30003.destroy = function (slot0)
	slot3 = slot0

	BaseNewbieApi.destroy(slot2)
end

return
