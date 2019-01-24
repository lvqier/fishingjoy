ResConfig = {
	getFullFile = function (slot0)
		return cc.FileUtils:getInstance():fullPathForFilename(slot0)
	end
}

ResConfig.getResPath = function (slot0, slot1)
	slot0 = "res/" .. slot0

	if slot1 then
		slot0 = ResConfig.getFullFile(slot0)
	end

	return slot0
end

return
