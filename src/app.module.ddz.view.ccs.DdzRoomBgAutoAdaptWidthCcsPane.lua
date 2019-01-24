slot2 = "DdzRoomBgAutoAdaptWidthCcsPane"
DdzRoomBgAutoAdaptWidthCcsPane = class(slot1)

DdzRoomBgAutoAdaptWidthCcsPane.onCreationComplete = function (slot0)
	slot4 = BgAutoAdaptWidthCcsPane

	ClassUtil.extends(slot2, slot0)
	BgAutoAdaptWidthCcsPane.onCreationComplete(slot2)

	slot4 = slot0._newTxt
	slot0._newTxt._posX = slot0._newTxt.getPositionX(slot0)
end

DdzRoomBgAutoAdaptWidthCcsPane.onStrTxt = function (slot0)
	slot3 = slot0

	BgAutoAdaptWidthCcsPane.onStrTxt(slot2)

	slot3 = slot0._newTxt

	if slot0._newTxt.getTextWidth(slot2) < slot0._strBaseWidth then
		slot5 = slot0._newTxt._posX + (slot0._strBaseWidth - slot1) / 2

		slot0._newTxt.setPositionX(slot3, slot0._newTxt)
	else
		slot5 = slot0._newTxt._posX

		slot0._newTxt.setPositionX(slot3, slot0._newTxt)
	end
end

return
