slot2 = "NewbieApiImp"
NewbieApiImp = class(slot1)
slot2 = "newbie.api.BaseNewbieApi"

requireLuaFromCommon(slot1)

NewbieApiImp.ctor = function (slot0)
	slot0._apis = {}
	slot0._curApi = nil
	slot0._maskView = NewbieMask.new()
	slot4 = newbieMgr.getAllStepData(slot2)

	for slot5, slot6 in pairs(newbieMgr) do
		slot9 = slot6.api

		if StringUtil.isStringValid(slot8) then
			slot10 = slot6.api

			slot0.addApi(slot8, slot0)
		end
	end
end

NewbieApiImp.callApi = function (slot0, slot1)
	slot6 = slot1.api

	print(slot4, "准备调用newbie api：")

	slot5 = slot1.api

	if StringUtil.isStringValid(slot4) then
		slot3 = slot0._apis[slot2]

		if slot0._curApi then
			slot6 = slot0._curApi

			slot0._curApi.destroy(slot5)

			slot0._curApi = nil
		end

		if slot3 then
			slot0._curApi = slot3.new()
			slot7 = slot0._maskView

			slot0._curApi.setMaskView(slot5, slot0._curApi)

			slot6 = slot0._curApi
			slot8 = slot0

			slot0._curApi.getFinishSignal(slot5).add(slot5, slot0._curApi.getFinishSignal(slot5), slot0.onApiFinish)

			slot7 = slot1

			slot0._curApi.checkStart(slot5, slot0._curApi)
		else
			slot10 = slot2
			slot7 = "未配置的api名字：" .. tostring(slot9)

			popupMgr.showAlert(slot5, popupMgr)
		end
	end
end

NewbieApiImp.hideMask = function (slot0)
	slot3 = slot0._maskView

	slot0._maskView.hide(slot2)
end

NewbieApiImp.destroyNewbie = function (slot0)
	slot3 = slot0

	slot0.hideMask(slot2)

	if slot0._curApi then
		slot3 = slot0._curApi

		slot0._curApi.destroy(slot2)

		slot0._curApi = nil
	end
end

NewbieApiImp.onApiFinish = function (slot0)
	slot3 = newbieMgr

	newbieMgr.finishCurStep(slot2)
end

NewbieApiImp.addApi = function (slot0, slot1)
	slot7 = slot1
	slot4 = "newbie.api.concrete." .. tostring(slot6)

	requireLuaFromCommon(slot3)

	slot0._apis[slot1] = _G[slot1]
end

return
