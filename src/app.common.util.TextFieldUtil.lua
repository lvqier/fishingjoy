TextFieldUtil = {}

function slot0(slot0)
	slot3 = slot0

	slot0.disableEffect(slot2)
end

TextFieldUtil.getFontName = function (slot0)
	if slot0.getFontName then
		slot3 = slot0

		return slot0.getFontName(slot2)
	elseif slot0.getSystemFontName then
		slot3 = slot0

		return slot0.getSystemFontName(slot2)
	end

	return ""
end

TextFieldUtil.makeTextFieldNoStyle = function (slot0)
	if slot0 then
		if slot0.getVirtualRenderer then
			slot3 = slot0
			slot0 = slot0.getVirtualRenderer(slot2)
		end

		if slot0.disableEffect then
			slot5 = slot0

			slot0:disableEffect()

			slot6 = slot0.getSystemFontSize(slot2)

			slot0:setSystemFontSize(slot0)

			slot6 = slot0:getSystemFontName()

			slot0:setSystemFontName(slot0)
		elseif slot0.setStyleFunc then
			slot4 = slot0

			slot0.setStyleFunc(slot2, slot0)
		end
	end
end

TextFieldUtil.makeBlueOutLineStyle = function (slot0)
	if slot0.enableGlow then
		slot3 = cclabel
		slot9 = 255

		cclabel.enableGlow(slot2, cc.c4b(slot5, 0, 255, 255))

		slot9 = 255
		slot8 = -1
		slot6 = 6

		cclabel.enableShadow(slot2, cclabel, cc.c4b(slot5, 0, 255, 255), cc.size(0, 1))
	end
end

TextFieldUtil.makeDefaultBtnTextFieldStyle = function (slot0)
	return
end

TextFieldUtil.setTextOutLineSize = function (slot0, slot1)
	slot4 = label

	TextFieldUtil.makeTextFieldNoStyle(slot3)

	function slot2(slot0)
		slot9 = 255
		slot5 = slot0

		slot0.enableOutline(slot2, slot0, cc.c4b(slot5, 0, 0, 0))
	end

	if slot0.enableOutline then
		slot5 = slot0

		slot2(slot4)
	elseif slot0.setStyleFunc then
		slot6 = slot2

		slot0.setStyleFunc(slot4, slot0)
	end
end

TextFieldUtil.makeLbsTextFieldStyle = function (slot0)
	if slot0.enableOutline then
		slot9 = 255
		slot5 = 1

		slot0.enableOutline(slot2, slot0, cc.c4b(slot5, 0, 0, 0))
	end

	if slot0.enableShadow then
		slot9 = 255
		slot8 = -1
		slot6 = 6

		slot0.enableShadow(slot2, slot0, cc.c4b(slot5, 0, 0, 0), cc.size(0, 0))
	end
end

TextFieldUtil.makeDefaultTextFieldStyle = function (slot0)
	slot3 = slot0

	TextFieldUtil.makeTextFieldNoStyle(slot2)
end

return
