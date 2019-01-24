quick = quick or {}
quick._snapshots = {}

io.readfileWithLuaApi = function (slot0)
	if io.open(slot0, "r") then
		io.close(slot1)

		return slot1:read("*a")
	end

	return nil
end

io.readfile = function (slot0)
	if CryptoLoaderManager_loadFile then
		return CryptoLoaderManager_loadFile(slot0)
	else
		return cc.FileUtils:getInstance():getStringFromFile(slot0)
	end
end

quick.gc = function (slot0)
	slot1 = collectgarbage("count")

	collectgarbage("collect")

	slot2 = collectgarbage("count")

	if not slot0 then
		traceLog(string.format("GC: <font color = '#FFFF00'>%0.2f KB</font>, reduce: %0.2fKB", slot2, slot1 - slot2))
	end
end

quick.exit = function ()
	cc.Director:getInstance():endToLua()
	os.exit()
end

quick.makeLuaVMSnapshot = function ()
	quick._snapshots[#quick._snapshots + 1] = CCLuaStackSnapshot()

	while #quick._snapshots > 2 do
		table.remove(quick._snapshots, 1)
	end

	traceLog("make a lua vm snapshot, cur num of snapshot is :", #quick._snapshots)
end

quick.checkLuaVMLeaks = function ()
	if #quick._snapshots < 2 then
		traceLog("checkLuaVMLeaks - need least 2 snapshots, cur num:", slot0)
	else
		slot1 = quick._snapshots[1]
		slot3 = ""

		for slot7, slot8 in pairs(slot2) do
			if slot1[slot7] == nil then
				if slot3 ~= "" then
					slot3 = slot3 .. "\n"
				end

				slot3 = slot3 .. tostring(slot7) .. "   " .. tostring(slot8)
			end
		end

		if slot3 == "" then
			slot3 = "no record"
		end

		traceLog("checkLuaVMLeaks:\n" .. slot3)
	end
end

return
