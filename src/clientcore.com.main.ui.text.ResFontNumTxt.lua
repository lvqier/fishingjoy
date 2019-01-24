ResFontNumTxt = ClassUtil.class("ResFontNumTxt")

ResFontNumTxt.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.iNum = nil

	ClassUtil.extends(slot0, ResFontTxt, true, slot1, slot2, slot3, slot4, slot5)
end

ResFontNumTxt.setNumber = function (slot0, slot1, slot2)
	if slot0.iNum ~= slot1 or slot2 then
		slot0.iNum = slot1

		slot0:setTxt(tostring(slot1), slot2)
	end
end

ResFontNumTxt.getNumber = function (slot0)
	return slot0.iNum or 0
end

return
