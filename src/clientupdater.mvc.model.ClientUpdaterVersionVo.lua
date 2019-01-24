slot2 = "ClientUpdaterVersionVo"
ClientUpdaterVersionVo = class(slot1)

ClientUpdaterVersionVo.ctor = function (slot0, slot1)
	slot0.size = 0
	slot0.path = ""
	slot0.version = ""
	slot0.failedNum = 0

	if slot1 then
		slot5 = slot1

		slot0.parseConfigStr(slot3, slot0)
	end
end

ClientUpdaterVersionVo.parseConfigStr = function (slot0, slot1)
	slot5 = ","
	slot5 = string.split(string.trim, slot1)[1] or ""
	slot0.path = string.trim(slot4)
	slot0.version = slot2[2]
	slot5 = slot2[3]
	slot0.size = tonumber(slot4) or 0
end

return
