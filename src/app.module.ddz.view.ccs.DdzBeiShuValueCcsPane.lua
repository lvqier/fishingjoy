slot2 = "DdzBeiShuValueCcsPane"
DdzBeiShuValueCcsPane = class(slot1)

DdzBeiShuValueCcsPane.onCreationComplete = function (slot0)
	slot9 = false
	slot13 = slot0.onValueChanged

	createSetterGetter(slot2, slot0, "str", nil, false, false, false, handler(slot11, slot0))
end

DdzBeiShuValueCcsPane.onValueChanged = function (slot0)
	slot5 = slot0._str ~= nil

	slot0.txt_tf.setVisible(slot3, slot0.txt_tf)

	slot5 = not (slot0._str ~= nil)

	slot0.default.setVisible(slot3, slot0.default)

	if slot0._str ~= nil then
		slot5 = slot0._str

		slot0.txt_tf.setHtmlText(slot3, slot0.txt_tf)
	end
end

DdzBeiShuValueCcsPane.destroy = function (slot0)
	slot3 = slot0.txt_tf

	slot0.txt_tf.destroy(slot2)
end

return
