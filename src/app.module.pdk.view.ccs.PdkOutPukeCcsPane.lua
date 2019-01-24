slot2 = "PdkOutPukeCcsPane"
PdkOutPukeCcsPane = class(slot1)

PdkOutPukeCcsPane.onCreationComplete = function (slot0)
	slot9 = false
	slot13 = slot0.onDataIntChanged

	createSetterGetter(slot2, slot0, "dataInt", 0, false, false, false, handler(slot11, slot0))
end

PdkOutPukeCcsPane.onDataIntChanged = function (slot0)
	if slot0._dataInt and slot0._dataInt ~= 0 then
		slot4 = slot0._dataInt
		slot8, slot2 = gameMgr.calPukeInfo(slot2, gameMgr)
		slot8 = slot2
		slot9 = string.format(slot5, "plist_pdk_out_puke_value_%d_%d.png", slot3)

		slot0.spValue.setSpriteFrame("plist_pdk_out_puke_color_%d.png", slot0.spValue)

		slot9 = string.format("plist_pdk_out_puke_value_%d_%d.png", "plist_pdk_out_puke_color_%d.png")

		slot0.spColor.setSpriteFrame("plist_pdk_out_puke_color_%d.png", slot0.spColor)
	end
end

return
