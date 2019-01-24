AccountModel = class("AccountModel")

AccountModel.ctor = function (slot0)
	createSetterGetter(slot0, "tabIndex", nil, true)
	createSetterGetter(slot0, "phoneBindYzmCd", 0, true)
	createSetterGetter(slot0, "isShowingPwModify", false, true)
	createSetterGetter(slot0, "isShowingPhoneBind", false, true)
	createSetterGetter(slot0, "isShowingTouristPhoneBind", false, true)
	createSetterGetter(slot0, "isShowingTouristPhoneBindInfo", false, true)
	createSetterGetter(slot0, "touristBindPhone", "")
	createSetterGetter(slot0, "touristBindYzm", "")
	createSetterGetter(slot0, "resetPwSignal", SignalAs3.new(), nil, true)
	createSetterGetter(slot0, "isShowingHeadView", false, true)
	createSetterGetter(slot0, "headSelectedId", Hero:getWFaceID(), true)
	createSetterGetter(slot0, "headSelectedGender", Hero:getCbGender(), true)
	createSetterGetter(slot0, "cbGender", Hero:getCbGender(), true)
	createSetterGetter(slot0, "isShowingSetting", false, true)
end

AccountModel.destroy = function (slot0)
	SignalAs3.clearAllSignal(slot0)
end

return
