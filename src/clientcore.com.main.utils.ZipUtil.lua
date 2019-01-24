ZipUtil = {}
slot0 = nil

xpcall(slot1, function ()
	return
end)

ZipUtil.isSuppoertZLib = function ()
	return slot0 ~= nil
end

ZipUtil.compress = function (slot0)
	if slot0 then
		return slot1(slot0, "finish")
	end
end

ZipUtil.uncompress = function (slot0)
	if slot0 then
		slot2, slot3, slot4, slot5 = slot1(slot0)

		return slot2
	end
end

ZipUtil.unzipFileInThread = function (slot0, slot1, slot2, slot3)
	OSUtil.createFolder(slot1)
	SwManager_unzipFileInThread(slot0, slot1, slot2, slot3)
end

return
