class("LoaderVo").ctor = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.url = slot1
	slot0.notCheckWritePath = slot7
	slot0.writePath = slot6
	slot0.onProgress = slot4
	slot0.onComplete = slot2
	slot0.onError = slot3
	slot0.onTimeOut = slot5
end

slot1 = class("LoaderManager")
slot2 = 100

slot1.ctor = function (slot0)
	slot0._curLoadersDic = {}
	slot0._curLoadingUrlsDic = {}
	slot0._waitingLoadingUrls = {}
end

slot1.addLoad = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if not slot7 and slot6 and slot6 ~= "" and cc.FileUtils:getInstance():isFileExist(slot6) then
		if slot2 then
			slot2(io.readfileWithLuaApi(slot6), slot1)
		end

		return
	end

	slot8 = slot0.new(slot1, slot2, slot3, slot4, slot5, slot6, slot7)

	if not slot0._curLoadersDic[slot1] then
		slot0._curLoadersDic[slot1] = {}
	end

	table.insert(slot9, slot8)

	if not slot0._curLoadingUrlsDic[slot1] then
		if table.nums(slot0._curLoadingUrlsDic) < slot1 then
			slot0:doLoad(slot1)
		else
			TableUtil.push(slot0._waitingLoadingUrls, slot1, true)
		end
	end

	return slot8
end

slot1.doLoad = function (slot0, slot1)
	print("[LoaderManager]正在下载文件：", slot1)

	slot0._curLoadingUrlsDic[slot1] = true

	requestHttp(slot1, handler(slot0, slot0.onFileDownLoadComplete), handler(slot0, slot0.onFileDownLoadError), handler(slot0, slot0.onFileDownLoadProgress), handler(slot0, slot0.onFileDownLoadTimeOut), nil, 1000000, nil, nil, true)
end

slot1.applyFuc = function (slot0, slot1, slot2, ...)
	if slot0._curLoadersDic[slot1] then
		for slot7, slot8 in ipairs(slot3) do
			if slot2 == "onComplete" and slot8.writePath and slot8.writePath ~= "" and (slot8.notCheckWritePath or not cc.FileUtils:getInstance():isFileExist(slot8.writePath)) then
				OSUtil.writefile(slot8.writePath, ({
					...
				})[1])
			end

			if slot8[slot2] then
				slot9(...)
			end
		end
	end
end

slot1.checkNextLoad = function (slot0)
	if slot0 <= table.nums(slot0._curLoadingUrlsDic) and #slot0._waitingLoadingUrls > 0 then
		slot0:doLoad(TableUtil.shift(slot0._waitingLoadingUrls))
	end
end

slot1.removeAllLoad = function (slot0, slot1, slot2)
	if slot1 then
		if slot2 then
			slot0._curLoadingUrlsDic[slot1] = nil
		end

		slot0._curLoadersDic[slot1] = nil

		table.removebyvalue(slot0._waitingLoadingUrls, slot1)
	end
end

slot1.onFileDownLoadTimeOut = function (slot0, slot1)
	slot0:applyFuc(slot1, "onTimeOut", slot1)
	slot0:removeAllLoad(slot1, true)
	slot0:checkNextLoad()
end

slot1.onFileDownLoadProgress = function (slot0, slot1, slot2)
	slot0:applyFuc(slot2, "onProgress", event, slot2)
end

slot1.onFileDownLoadError = function (slot0, slot1, slot2)
	slot0:applyFuc(slot2, "onError", slot1, slot2)
	slot0:removeAllLoad(slot2, true)
	slot0:checkNextLoad()
end

slot1.onFileDownLoadComplete = function (slot0, slot1, slot2)
	print("下载完毕", slot2)
	slot0:applyFuc(slot2, "onComplete", slot1, slot2)
	slot0:removeAllLoad(slot2, true)
	slot0:checkNextLoad()
end

slot1.removeLoaderVo = function (slot0, slot1)
	print("尝试删除loader", slot1.url)

	for slot5, slot6 in pairs(slot0._curLoadersDic) do
		if table.removebyvalue(slot6, slot1) > 0 then
			print("删除loader", slot1.url)

			return
		end
	end
end

slot1.removeLoad = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:checkNextLoad()
end

loaderMgr = slot1.new()

return
