slot2 = "VoiceRecordView"
VoiceRecordView = class(slot1)

VoiceRecordView.ctor = function (slot0)
	slot5 = false
	slot0._view = ccsPoolMgr.get(slot2, ccsPoolMgr, "csb/common/Record.csb")
	slot13 = slot0.onIsCancelChanged

	createSetterGetter(slot2, slot0, "isCancel", true, nil, nil, nil, handler(slot11, slot0))

	slot3 = slot0

	slot0.onIsCancelChanged(slot2)
end

VoiceRecordView.onIsCancelChanged = function (slot0)
	if slot0._view then
		slot4 = not slot0._isCancel

		slot0._view.micOnLayer.setVisible(slot2, slot0._view.micOnLayer)

		slot4 = slot0._isCancel

		slot0._view.micCancelLayer.setVisible(slot2, slot0._view.micCancelLayer)

		slot5 = true

		CCSUtil.setArmaturePlaying(slot2, slot0._view.micOnLayer.arm, not slot0._isCancel)
	end
end

VoiceRecordView.hide = function (slot0)
	slot4 = true

	slot0.setIsCancel(slot2, slot0)

	slot3 = slot0._view

	slot0._view.removeFromParent(slot2)
end

VoiceRecordView.showRecording = function (slot0)
	slot4 = false

	slot0.setIsCancel(slot2, slot0)

	slot4 = slot0._view

	uiMgr.centerLocate(slot2, uiMgr)

	slot6 = uiMgr
	slot5 = true

	DisplayUtil.setAddOrRemoveChild(slot2, slot0._view, uiMgr.getTopLayerInAllScene(slot5))
end

VoiceRecordView.destroy = function (slot0)
	if slot0._view then
		slot3 = slot0._view

		slot0._view.removeFromParent(slot2)

		slot3 = slot0._view

		slot0._view.release(slot2)

		slot0._view = nil
	end
end

return
