slot2 = "ClientUpdaterModel"
ClientUpdaterModel = class(slot1)
slot2 = "clientupdater.mvc.model.ClientUpdaterVersionVo"

require(slot1)

ClientUpdaterModel.ctor = function (slot0)
	slot7 = cc.UserDefault
	slot7 = true

	createSetterGetter(slot2, slot0, "so", cc.UserDefault.getInstance(slot6), false)

	slot5 = nil

	createSetterGetter(slot2, slot0, "finishCallback")

	slot6 = true

	createSetterGetter(slot2, slot0, "loadingTxt", "")

	slot5 = "scripts"

	createSetterGetter(slot2, slot0, "scriptsFileName")

	slot5 = nil

	createSetterGetter(slot2, slot0, "myVersionConfigs")

	slot5 = nil

	createSetterGetter(slot2, slot0, "newVersionConfigs")

	slot5 = nil

	createSetterGetter(slot2, slot0, "myZipVersionConfigs")

	slot5 = nil

	createSetterGetter(slot2, slot0, "newZipVersionConfigs")

	slot5 = nil

	createSetterGetter(slot2, slot0, "versionConfigs2DownLoad")

	slot5 = nil

	createSetterGetter(slot2, slot0, "versionConfigs2Delete")

	slot5 = nil

	createSetterGetter(slot2, slot0, "curUpdateVersionVo")

	slot5 = 0

	createSetterGetter(slot2, slot0, "downloadTotalSize")

	slot9 = true

	createSetterGetter(slot2, slot0, "curDownloadSize", 0, true, false, false)

	slot6 = true

	createSetterGetter(slot2, slot0, "curShowLoadingPercent", 0)

	slot9 = true

	createSetterGetter(slot2, slot0, "curDownLoadIndex", 1, false, false, false)

	slot6 = true

	createSetterGetter(slot2, slot0, "popupMsgVo", nil)

	slot0.curFileDownloadSize = 0
	slot0.curDownloadedFileSize = 0
	slot0.remoteRootUrl = nil
	slot0.localUpdateRootUrl = nil
	slot0.localVersionFileInUpdateUrl = nil
	slot0.versionFileRelativePath = "res/gameres/config/version.csv"

	if isCQ then
		slot4 = slot0.versionFileRelativePath
		slot0.versionFileRelativePath = "src/" .. cookWSJMPath(slot3)
	end

	slot0.gameZipFileName = "game.zip"
	slot0.localUpdateGameZipUrl = nil
	slot0.updateScene = nil
end

ClientUpdaterModel.getFileDownloadUrl = function (slot0, slot1)
	slot6 = slot0.remoteRootUrl .. "/res"
	slot11 = slot0
	slot7 = slot0.remoteRootUrl .. "/" .. slot0.getScriptsFileName(slot10)

	return string.gsub(slot1.path, string.gsub(slot3, slot1.path, "%$res%$"), "%$scripts%$")
end

ClientUpdaterModel.getFileSaveUrl = function (slot0, slot1)
	slot6 = slot0.localUpdateRootUrl .. "/res"
	slot11 = slot0
	slot7 = slot0.localUpdateRootUrl .. "/" .. slot0.getScriptsFileName(slot10)

	return string.gsub(slot1.path, string.gsub(slot3, slot1.path, "%$res%$"), "%$scripts%$")
end

ClientUpdaterModel.destroy = function (slot0)
	slot3 = slot0

	SignalAs3.clearAllSignal(slot2)

	slot0._finishCallback = nil
	slot0._so = nil
	slot0._loadingTxt = nil
	slot0._myVersionConfigs = nil
	slot0._newVersionConfigs = nil
	slot0._versionConfigs2DownLoad = nil
	slot0._versionConfigs2Delete = nil
	slot0._curUpdateVersionVo = nil
	slot0._downloadTotalSize = nil
	slot0.remoteRootUrl = nil
	slot0.localUpdateRootUrl = nil
	slot0.localVersionFileInUpdateUrl = nil
	slot0.gameZipFileName = nil
	slot0.localUpdateGameZipUrl = nil
end

return
