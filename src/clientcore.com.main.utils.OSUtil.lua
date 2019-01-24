OSUtil = {
	deleteDirectory = function (slot0)
		if string.sub(slot0, #slot0) ~= "/" then
			slot0 = slot0 .. "/"
		end

		return cc.FileUtils:getInstance():removeDirectory(slot0)
	end,
	isFileExists = function (slot0)
		return cc.FileUtils:getInstance():isFileExist(slot0)
	end,
	isFolderExists = function (slot0)
		return cc.FileUtils:getInstance():isDirectoryExist(slot0)
	end,
	openURL = function (slot0)
		cc.Application:getInstance():openURL(slot0)
	end
}

OSUtil.copyFolder2 = function (slot0, slot1)
	OSUtil.createFolder(slot1)
	os.execute(slot2)
	print("执行指令", string.format("cp -R %s %s", slot0, slot1))
end

OSUtil.copyFile2 = function (slot0, slot1)
	OSUtil.writefile(slot1, io.readfile(slot0))
end

OSUtil.deleteFile = function (slot0)
	io.deleteFile(slot0)
end

io.deleteFile = function (slot0)
	return cc.FileUtils:getInstance():removeFile(slot0)
end

OSUtil.createFolder = function (slot0)
	return cc.FileUtils:getInstance():createDirectory(slot0)
end

OSUtil.writefile = function (slot0, slot1, slot2)
	io.deleteFile(slot0)
	OSUtil.createFolder(slot3)

	slot4, slot5 = io.open(slot0, slot2 or "w+b")

	if slot4 then
		if slot4:write(slot1) == nil then
			return false
		end

		io.close(slot4)

		return true
	else
		return false
	end
end

return
