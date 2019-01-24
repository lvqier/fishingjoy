slot2 = "BaseClcokCcsPane"
BaseClcokCcsPane = class(slot1)

BaseClcokCcsPane.onCreationComplete = function (slot0)
	return
end

BaseClcokCcsPane.start = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0._time = slot1
	slot0._frameTime = slot2 or 1000
	slot0._timePlistFile = slot3
	slot0._soundRes = slot4
	slot0._soundNotRepeat = slot6
	slot0._soundLeaveTime = slot5
	slot0._isPlaySound = false
	slot9 = slot0

	slot0.stop(slot8)

	slot13 = slot0.tick
	slot12 = -1
	slot0._tick = tickMgr.delayedCall(slot8, tickMgr, handler(slot11, slot0), slot0._frameTime)
	slot9 = slot0._tick

	slot0._tick.start(slot8)

	slot9 = slot0

	slot0.tick(slot8)
end

BaseClcokCcsPane.stop = function (slot0)
	if slot0._tick then
		slot3 = slot0._tick

		slot0._tick.destroy(slot2)

		slot0._tick = nil
	end
end

BaseClcokCcsPane.updateView = function (slot0)
	return
end

BaseClcokCcsPane.endCallBack = function (slot0)
	return
end

BaseClcokCcsPane.tick = function (slot0)
	slot0._time = slot0._time - 1

	if slot0._time >= 0 then
		if slot0.txtTime_tf then
			if slot0._timePlistFile then
				slot3 = slot0.txtTime_tf
				slot7 = slot0._timePlistFile

				slot0.txtTime_tf.setHtmlText(slot2, HtmlUtil.createArtNum(slot5, slot0._time))
			else
				slot3 = slot0.txtTime_tf
				slot6 = slot0._time

				slot0.txtTime_tf.setHtmlText(slot2, tostring(slot5))
			end
		else
			slot4 = slot0._time

			slot0.txtTime.setString(slot2, slot0.txtTime)
		end

		if slot0._soundLeaveTime ~= nil and slot0._soundRes ~= nil and slot0._time <= slot0._soundLeaveTime and not slot0._isPlaySound then
			slot4 = slot0._soundRes

			slot0.controller.playGameEffect(slot2, slot0.controller)

			slot3 = slot0.clock
			slot11 = -15
			slot12 = 15
			slot8 = cc.RotateTo.create(cc.RotateTo, cc.RotateTo, 0.1)
			slot13 = 0

			slot0.clock.runAction(slot2, cc.Sequence.create(slot5, cc.Sequence, cc.RotateTo.create(slot8, cc.RotateTo, 0.05), cc.RotateTo.create(cc.RotateTo, cc.RotateTo, 0.05)))

			if slot0._soundNotRepeat then
				slot0._isPlaySound = true
			end
		end

		slot3 = slot0

		slot0.updateView(slot2)
	else
		slot3 = slot0

		slot0.endCallBack(slot2)

		slot3 = slot0

		slot0.stop(slot2)
	end
end

BaseClcokCcsPane.destroy = function (slot0)
	slot3 = slot0

	slot0.stop(slot2)
end

return
