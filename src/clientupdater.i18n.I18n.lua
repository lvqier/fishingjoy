I18n = {}
slot0 = {}

I18n.cookLang = function (slot0)
	slot1 = os.clock()
	slot4 = slot0

	if StringUtil.isStringValid(slot3) then
		slot4 = cc.FileUtils
		slot5 = slot0

		if cc.FileUtils.getInstance(slot3).isFileExist(slot3, cc.FileUtils.getInstance(slot3)) then
			function slot4(slot0, slot1)
				slot4 = slot0

				if StringUtil.isStringValid(slot3) then
					slot4 = slot1

					if StringUtil.isStringValid(slot3) then
						slot0[slot0] = slot1
					end
				end
			end

			slot7 = string.split(slot0, slot2)

			for slot8, slot9 in ipairs("\n") do
				slot12 = slot9

				if StringUtil.isStringValid(slot11) then
					slot14 = slot4

					string.gsub(slot11, slot9, "^([uc]%d+)%:(.+)$")
				end
			end
		end
	end

	slot7 = slot0
	slot7 = os.clock() - slot1

	print(slot3, "国际化语言包解析成功，共:", table.nums(slot6), "耗时：")
end

I18n.breakUiText = function (slot0)
	function slot7(slot0, slot1)
		slot0 = slot0

		return slot1
	end

	return string.gsub(slot4, slot0, "^(u%d+)%_(.+)$"), nil
end

I18n.get = function (slot0, ...)
	slot1 = nil
	slot4 = slot0

	if StringUtil.isStringValid(slot3) then
		slot4 = slot0[slot0]

		if StringUtil.isStringValid(slot3) then
			slot2 = {
				...
			}

			function slot8(slot0)
				slot4 = nil

				return tonumber(slot2, slot0) or 0[]
			end

			slot1 = string.gsub(slot5, slot1, "%$(%d+)%$")
		end
	end

	slot6 = "\n"

	return string.gsub(slot3, slot1 or "", "\\n")
end

return
