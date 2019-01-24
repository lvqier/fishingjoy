HttpDownRequest = {
	bDowning = false,
	totalSize = 0,
	curPosBytes = 0,
	url = "",
	timeoutTimeInMS = 5000,
	downSize = 1048575,
	doStopDown = false,
	fileUrl = "",
	waitTime = 1000,
	new = function (slot0)
		slot0.__index = slot0

		setmetatable({}, slot0)

		return 
	end
}
slot0 = "([^a-zA-Z0-9%;%/%?%:%@%&%=%+%$%,%#%-%_%.%!%~%*%'%(%)])"

function slot1(slot0)
	return string.gsub(string.gsub(slot0, slot0, function (slot0)
		return string.format("%%%02X", string.byte(slot0))
	end), " ", "+")
end

HttpDownRequest.creatRequestHttp = function (slot0)
	if not slot0.url or slot0.url == "" then
		return nil
	end

	slot3 = cc.XMLHttpRequest:new()
	slot3.responseType = 0

	slot3:open("GET", slot1)
	slot3:registerScriptHandler(function (slot0, slot1, slot2)
		slot0:requestCallBack(slot0, slot1, slot2)
	end)

	slot3.timeout = slot0.timeoutTimeInMS

	return slot3
end

HttpDownRequest.getFileCurPosBytes = function (slot0)
	slot1 = 0

	if not slot0.fileUrl or slot0.fileUrl == "" then
		return 0
	end

	if OSUtil.isFileExists(slot0.fileUrl) then
		slot1 = cc.FileUtils:getInstance():getFileSize(slot0.fileUrl)
	end

	return slot1
end

HttpDownRequest.downByRange = function (slot0)
	slot0.request = slot0:creatRequestHttp()
	slot0.curPosBytes = slot0:getFileCurPosBytes()

	print("下载范围。。。。。", slot2)
	slot0.request:setRequestHeader("Range", string.format("bytes=%d-%d", slot1, math.max(0, slot0.curPosBytes - 20) + slot0.downSize))
	slot0.request:send()
end

HttpDownRequest.downToEnd = function (slot0)
	slot0.request = slot0:creatRequestHttp()
	slot0.curPosBytes = slot0:getFileCurPosBytes()

	print("下载范围。。。。。", slot2)
	slot0.request:setRequestHeader("Range", string.format("bytes=%d-", slot1))
	slot0.request:send()
end

HttpDownRequest.downProgress = function (slot0, slot1)
	slot1.dltotal = slot1.dltotal + slot0.curPosBytes

	if slot0.onProgress then
		slot0.onProgress(slot1)
	end
end

HttpDownRequest.checkAndSaveUrl = function (slot0)
	if OSUtil.isFileExists(slot0.fileUrl .. "SLFEV") then
		if io.readfile(slot0.fileUrl .. "SLFEV") ~= slot0.url then
			OSUtil.deleteFile(slot0.fileUrl)
			OSUtil.writefile(slot0.fileUrl .. "SLFEV", slot0.url, "w+")
		else
			return true
		end
	else
		OSUtil.deleteFile(slot0.fileUrl)
		OSUtil.writefile(slot0.fileUrl .. "SLFEV", slot0.url, "w+")
	end

	return false
end

HttpDownRequest.startDownFile = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.url = slot1
	slot0.fileUrl = slot2
	slot0.onProgress = slot3
	slot0.onFullDown = slot4
	slot0.timeoutTimeInMS = slot5
	slot0.downSize = slot6 or 1048575
	slot0.waitTime = slot7 or 1000
	slot0.bDowning = true
	slot0.doStopDown = false

	slot0:checkAndSaveUrl()
	slot0:downByRange()
end

HttpDownRequest.resetDownSize = function (slot0, slot1)
	slot0.downSize = slot1 or 1048575
end

HttpDownRequest.resetWaitTime = function (slot0, slot1)
	slot0.waitTime = slot1 or 1000
end

HttpDownRequest.getbDowning = function (slot0)
	return slot0.bDowning
end

HttpDownRequest.doStopDown = function (slot0, slot1)
	slot0.doStopDown = true
	slot0.onStopFunc = slot1
end

HttpDownRequest.requestCallBack = function (slot0, slot1, slot2, slot3)
	if slot1 == "progress" then
		slot0:downProgress({
			total = slot0.totalSize,
			dltotal = slot2
		})
	else
		slot4 = slot0.request.status

		if (slot0.request.readyState == 4 or slot5 == 1) and slot4 >= 200 and slot4 < 207 then
			if slot0.request.response and #slot6 > 0 then
				if slot0:compFileEnd20AndDownStart20(slot6) then
					if OSUtil.writefile(slot0.fileUrl, slot7, "ab+") then
						if string.find(slot0.request:getResponseHeader("Content-Range"), "/") then
							slot0.totalSize = tonumber(string.sub(slot8, slot9 + 1))
						end

						slot0.curPosBytes = slot0:getFileCurPosBytes()

						if slot0.totalSize == slot0.curPosBytes then
							if slot0.onFullDown then
								slot0.onFullDown(slot0.totalSize)
							end

							slot0.bDowning = false
						elseif slot0.downSize <= slot0.totalSize - slot0.curPosBytes then
							function slot10()
								slot0:downByRange()
							end

							if slot0.doStopDown == false then
								slot0.bDowning = true

								tickMgr:delayedCall(slot10, slot0.waitTime)
							else
								if slot0.onStopFunc then
									slot0.onStopFunc()
								end

								slot0.bDowning = false
							end
						else
							slot0:downToEnd()
						end
					else
						print("数据写入到文件失败")

						slot0.bDowning = false
					end
				else
					print("下载的数据有错，与前一段数据衔接不上")

					slot0.bDowning = false
				end
			else
				print("下载的数据有错,为空")

				slot0.bDowning = false
			end
		elseif slot4 == 504 then
			slot0.bDowning = false

			print("Http下载超时")
		elseif slot4 == 416 then
			slot0.bDowning = false

			if string.find(slot0.request:getResponseHeader("Content-Range"), "/") then
				slot0.totalSize = tonumber(string.sub(slot6, slot7 + 1))
			end

			slot0.curPosBytes = slot0:getFileCurPosBytes()

			if slot0.curPosBytes == slot0.totalSize then
				print(string.format("Http下载错误文件已经下载完成%d/%d", slot0.curPosBytes, slot0.totalSize))

				if slot0.onFullDown then
					slot0.onFullDown(slot0.totalSize)
				end
			else
				print("Http下载错误，总大小为", slot0.totalSize)
			end
		else
			slot0.bDowning = false

			print("Http下载错误", slot4)
		end
	end
end

HttpDownRequest.compFileEnd20AndDownStart20 = function (slot0, slot1)
	if OSUtil.isFileExists(slot0.fileUrl) == false then
		return slot1
	end

	if string.sub(slot2, -20) == string.sub(slot1, 1, 20) then
		if #slot1 <= 20 then
			return slot1
		else
			return string.sub(slot1, 21)
		end
	end

	return nil
end

return
