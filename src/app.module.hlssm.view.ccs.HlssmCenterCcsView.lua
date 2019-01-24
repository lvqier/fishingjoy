HlssmCenterCcsView = class("HlssmCenterCcsView")

HlssmCenterCcsView.onCreationComplete = function (slot0)
	slot0.layerHover:setVisible(true)

	for slot4 = 0, 7, 1 do
		slot0["btnArea" .. slot4].setIsIgnoreSound(slot5, true)
		slot0["btnArea" .. slot4].addTouchEventListener(slot5, handler(slot0, slot0.onTouchOperation))
		slot0.layerHover["hover" .. slot4]:setVisible(false)
	end
end

HlssmCenterCcsView.onTouchOperation = function (slot0, slot1, slot2)
	for slot6 = 0, 7, 1 do
		if slot1 == slot0["btnArea" .. slot6] and slot2 == ccs.TOUCH_EVENT_BEGAN then
			slot0.layerHover["hover" .. slot6]:setVisible(true)

			if not slot0.controller:requestPlaceJetton(slot6) then
				slot0.controller:playGameEffect("BT_CLICK.mp3")
			end
		elseif slot2 == ccs.TOUCH_EVENT_ENDED or slot2 == ccs.TOUCH_EVENT_CANCELED then
			slot0.layerHover["hover" .. slot6]:setVisible(false)
		end
	end
end

return
