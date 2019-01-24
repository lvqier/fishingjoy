HtmlUtil = {}
HTML_COLOR_BLACK = "#000000"
HTML_COLOR_YELLOW = "#FFFF00"
HTML_COLOR_RED = "#FF0000"
HTML_COLOR_BLUE = "#0000FF"
HTML_COLOR_GREEN = "#00FF00"
HTML_COLOR_WHITE = "#FFFFFF"
HTML_COLOR_PURPLE = "#800080"
HTML_COLOR_ORANGE = "#FFA500"
HTML_COLOR_GRAY = "#808080"

HtmlUtil.createBlackTxt = function (slot0, slot1)
	return HtmlUtil.createFontTxt(slot0, nil, HTML_COLOR_BLACK, slot1)
end

HtmlUtil.createWhiteTxt = function (slot0, slot1)
	return HtmlUtil.createFontTxt(slot0, nil, HTML_COLOR_WHITE, slot1)
end

HtmlUtil.createYellowTxt = function (slot0, slot1)
	return HtmlUtil.createFontTxt(slot0, nil, HTML_COLOR_YELLOW, slot1)
end

HtmlUtil.createOrangeTxt = function (slot0, slot1)
	return HtmlUtil.createFontTxt(slot0, nil, HTML_COLOR_ORANGE, slot1)
end

HtmlUtil.createGreenTxt = function (slot0, slot1)
	return HtmlUtil.createFontTxt(slot0, nil, HTML_COLOR_GREEN, slot1)
end

HtmlUtil.createRedTxt = function (slot0, slot1)
	return HtmlUtil.createFontTxt(slot0, nil, HTML_COLOR_RED, slot1)
end

HtmlUtil.createPurpleTxt = function (slot0, slot1)
	return HtmlUtil.createFontTxt(slot0, nil, HTML_COLOR_PURPLE, slot1)
end

HtmlUtil.createBlueTxt = function (slot0, slot1)
	return HtmlUtil.createFontTxt(slot0, nil, HTML_COLOR_BLUE, slot1)
end

HtmlUtil.createFontSizeTxt = function (slot0, slot1)
	return HtmlUtil.createFontTxt(slot0, nil, nil, slot1)
end

HtmlUtil.createColorTxt = function (slot0, slot1, slot2)
	if StringUtil.isStringValid(slot1) then
		return HtmlUtil.createFontTxt(slot0, nil, slot1, slot2)
	else
		return slot0
	end
end

HtmlUtil.createFontTxt = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if type(slot0) ~= "string" then
		slot0 = tostring(slot0)
	end

	return "<font" .. HtmlUtil.createPropertyStrByTable({
		font = slot1,
		color = (slot2 and tostring(slot2)) or nil,
		size = slot3,
		offsetX = slot4,
		offsetY = slot5,
		spaceWidth = slot6,
		spaceHeight = slot7
	}) .. ">" .. slot0 .. "</font>"
end

HtmlUtil.createEvent = function (slot0, slot1)
	return "<a" .. HtmlUtil.createPropertyStrByTable(slot2) .. ">" .. slot0 .. "</a>"
end

HtmlUtil.createImg = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	return "<img src ='" .. slot0 .. "'" .. HtmlUtil.createPropertyStrByTable(slot9) .. "></img>"
end

HtmlUtil.createPropertyStrByTable = function (slot0, slot1)
	slot2 = slot1 or ""

	for slot6, slot7 in pairs(slot0) do
		slot2 = HtmlUtil.createPropertyStr(slot6, slot7, slot2)
	end

	return slot2
end

HtmlUtil.createPropertyStr = function (slot0, slot1, slot2)
	slot2 = slot2 or ""
	slot3 = ""

	if slot1 and slot1 ~= 0 and slot1 ~= "" then
		slot3 = " " .. slot0 .. " = '" .. tostring(slot1) .. "'"
	end

	return slot2 .. slot3
end

HtmlUtil.createSpacer = function (slot0, slot1)
	return "<space" .. HtmlUtil.createPropertyStrByTable(slot2) .. "/>"
end

HtmlUtil.createVGap = function (slot0)
	return HtmlUtil.createBr() .. HtmlUtil.createSpacer(nil, slot0) .. HtmlUtil.createBr()
end

HtmlUtil.createBr = function ()
	return "<br>"
end

return
