slot2 = "CheckRelogingBean"
CheckRelogingBean = class(slot1)

CheckRelogingBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckRelogingBean.start = function (slot0)
	slot3 = mainMgr

	if mainMgr.getIsRelogining(slot2) then
		slot3 = mainMgr

		mainMgr.hideUi4Relogin(slot2)

		slot3 = popupMgr

		popupMgr.clearPopupQueue(slot2)

		slot4 = true

		popupMgr.setIsFordbidPopupQueue(slot2, popupMgr)

		if PlazaModule then
			slot3 = PlazaModule

			PlazaModule.hide(slot2)
		end
	end

	slot3 = slot0

	slot0.finish(slot2)
end

return
