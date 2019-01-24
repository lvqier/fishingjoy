slot2 = "MJCardBigCcsPane"
MJCardBigCcsPane = class(slot1)

MJCardBigCcsPane.onCreationComplete = function (slot0)
	slot4 = MJCardCcsPane

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	MJCardCcsPane.onCreationComplete(slot2)

	slot0._smallStr = ""
end

return
