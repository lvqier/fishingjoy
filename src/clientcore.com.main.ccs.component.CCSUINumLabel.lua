CCSUINumLabel = class("CCSUINumLabel")

CCSUINumLabel.ctor = function (slot0)
	slot0._num = 0
	slot0._oldNum = 0
	slot0._tweenObj = {
		value = 0
	}

	createSetterGetter(slot0, "textFormat", "$num$", false, false, false, nil, handler(slot0, slot0.updateNumLabelView))
	createSetterGetter(slot0, "numberFormater", nil)
	createSetterGetter(slot0, "isTweenChangedColor", false)
	createSetterGetter(slot0, "htmlColor", "", false, false, true)
end

CCSUINumLabel.onCreationComplete = function (slot0)
	slot0:setNumber(0, false, true)
end

CCSUINumLabel.setNumber = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	if slot0._num ~= slot1 or slot3 then
		if slot4 == nil then
			slot4 = true
		end

		slot0._isRoundTween = slot4
		slot0._num = slot1

		TweenLite.killTweensOf(slot0._tweenObj)

		if slot2 and not DisplayUtil.checkObjShowing(slot0) then
			slot2 = false
		end

		if slot2 then
			slot9 = slot0._oldNum < slot0._num
			slot10 = slot0._num < slot0._oldNum

			TweenLite.to(slot0._tweenObj, slot5 or 0.2, {
				value = slot1,
				onUpdate = function ()
					if isAndroid then
					else
						slot0:updateNumLabelView()
					end
				end,
				delay = slot6,
				onStart = function ()
					if slot0._isTweenChangedColor then
						if slot1 then
							slot0:setHtmlColor("#FF0000")
						elseif slot2 then
							slot0:setHtmlColor("#00FF00")
						else
							slot0:setHtmlColor(nil)
						end
					end

					if isAndroid then
						slot0:updateNumLabelView()
					end

					applyFunction(slot3)
				end,
				onComplete = function ()
					if slot0._isTweenChangedColor then
						slot0:setHtmlColor(nil)
						slot0.setHtmlColor:updateNumLabelView()
					end

					applyFunction(slot1)
				end
			})
		else
			slot0._tweenObj.value = slot1

			slot0:updateNumLabelView()
			applyFunction(slot7)
			applyFunction(slot8)
		end

		slot0._oldNum = slot0._num
	end
end

CCSUINumLabel.stopNumTween = function (slot0)
	slot0._num = nil
	slot0._tweenObj.value = 0

	TweenLite.killTweensOf(slot0._tweenObj)

	if slot0._isTweenChangedColor then
		slot0:setHtmlColor(nil)
		slot0:updateNumLabelView()
	end
end

CCSUINumLabel.updateNumLabelView = function (slot0)
	slot1 = slot0._tweenObj.value

	if slot0._isRoundTween then
		slot1 = math.floor(slot1)
	end

	slot2 = nil
	slot3 = string.gsub(slot0._textFormat, "%$num%$", (not slot0._numberFormater or slot0._numberFormater(slot1)) and tostring(slot1))

	if slot0.setHtmlText then
		if StringUtil.isStringValid(slot0._htmlColor) then
			slot0:setHtmlText(HtmlUtil.createColorTxt(slot3, slot0._htmlColor))
		else
			slot0:setHtmlText(slot3)
		end
	else
		slot0:setString(slot3)
	end
end

CCSUINumLabel.destroy = function (slot0)
	TweenLite.killTweensOf(slot0._tweenObj)
end

return
