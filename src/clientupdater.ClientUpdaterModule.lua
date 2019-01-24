slot2 = "clientupdater.util.utils"

require(slot1)

slot2 = "clientupdater.i18n.I18n"

require(slot1)

slot2 = "clientupdater.mvc.model.ClientUpdaterModel"

require(slot1)

slot2 = "clientupdater.mvc.controller.ClientUpdaterController"

require(slot1)

slot2 = "clientupdater.mvc.view.ClientUpdaterView"

require(slot1)

slot2 = "ClientUpdaterModule"
slot0 = class(slot1)

slot0.ctor = function (slot0)
	slot3 = "gameres/config/lang/code_lang.txt"

	I18n.cookLang(slot2)

	slot3 = "gameres/config/lang/ui_lang.txt"

	I18n.cookLang(slot2)

	slot0.model = ClientUpdaterModel.new()
	slot3 = slot0.model
	slot0.controller = ClientUpdaterController.new(slot2)
	slot4 = slot0.controller
	slot0.view = ClientUpdaterView.new(slot2, slot0.model)
end

slot0.show = function (slot0)
	slot3 = slot0.view

	slot0.view.show(slot2)
end

slot0.show2CheckVersion = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	if slot5 then
		slot13 = slot5

		slot0.model.setScriptsFileName(slot11, slot0.model)
	end

	slot0.model.localUpdateRootUrl = slot4
	slot0.model.localUpdateGameZipUrl = slot4 .. "/" .. slot0.model.gameZipFileName
	slot13 = slot3

	slot0.model.setFinishCallback(slot4 .. "/" .. slot0.model.gameZipFileName, slot0.model)

	slot12 = slot0

	slot0.show(slot4 .. "/" .. slot0.model.gameZipFileName)

	slot18 = slot9

	slot0.controller.requestVersion(slot4 .. "/" .. slot0.model.gameZipFileName, slot0.controller, slot1, slot2, slot6, slot7, slot8)
end

slot0.changeProgressInfo = function (slot0, slot1, slot2)
	if slot1 then
		slot6 = slot1

		slot0.controller.changeLoadingText(slot4, slot0.controller)
	end

	if slot2 then
		slot6 = slot2

		slot0.model.setCurShowLoadingPercent(slot4, slot0.model)
	end
end

slot0.getUpdateScene = function (slot0)
	return slot0.model.updateScene
end

slot0.destroy = function (slot0)
	if slot0.model then
		slot3 = slot0.view

		slot0.view.destroy(slot2)

		slot3 = slot0.controller

		slot0.controller.destroy(slot2)

		slot3 = slot0.model

		slot0.model.destroy(slot2)

		slot0.view = nil
		slot0.controller = nil
		slot0.model = nil
		ProxyClientUpdater = nil
	end

	_updateLog = nil
end

ProxyClientUpdater = slot0.new()

return
