LfsUtil = {}

xpcall(slot0, __emptyFunction)

LfsUtil.getFileListInFolder = function (slot0, slot1, slot2, slot3)
	slot3 = slot3 or {}
	slot4 = cc.FileUtils:getInstance()

	for slot8 in lfs.dir(slot0) do
		if slot8 ~= "." and slot8 ~= ".." and lfs.attributes(slot0 .. "/" .. slot8) then
			if slot10.mode == "directory" then
				if slot2 then
					LfsUtil.getFileListInFolderByExtension(slot9, slot1, slot2, slot3)
				end
			elseif slot10.mode == "file" then
				if slot1 then
					if slot4:getFileExtension(slot8) == slot1 then
						table.insert(slot3, slot9)
					end
				else
					table.insert(slot3, slot9)
				end
			end
		end
	end

	return slot3
end

LfsUtil.fileInFolderRun = function (slot0, slot1, slot2, slot3)
	slot4 = cc.FileUtils:getInstance()

	for slot8 in lfs.dir(slot0) do
		if slot8 ~= "." and slot8 ~= ".." and lfs.attributes(slot0 .. "/" .. slot8) then
			if slot10.mode == "directory" then
				if slot2 and LfsUtil.fileInFolderRun(slot9, slot1, slot2, slot3) then
					return true
				end
			elseif slot10.mode == "file" then
				if slot1 then
					if slot4:getFileExtension(slot8) == slot1 and slot3(slot9) then
						return true
					end
				elseif slot3(slot9) then
					return true
				end
			end
		end
	end
end

return
