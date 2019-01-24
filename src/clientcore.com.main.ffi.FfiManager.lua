FfiManager = class("FfiManager")

FfiManager.ctor = function (slot0)
	slot0._ffi = require("ffi")
	slot0._sizeOfCached = {}
end

FfiManager.sizeOf = function (slot0, slot1)
	slot2 = nil

	if type(slot1) == "string" then
		if not slot0._sizeOfCached[slot1] then
			slot0._sizeOfCached[slot1] = slot0._ffi.sizeof(slot1)
		end
	else
		slot2 = slot0._ffi.sizeof(slot1)
	end

	return slot2
end

FfiManager.createCStruct = function (slot0, slot1, slot2)
	slot3 = nil

	return (not slot2 or slot0._ffi.new(slot1, slot2)) and slot0._ffi.new(slot1)
end

FfiManager.toCStruct = function (slot0, slot1, slot2)
	if not string.find(slot2, "%*") then
		slot2 = slot2 .. " *"
	end

	return slot0._ffi.cast(slot2, slot1)
end

FfiManager.toLuaString = function (slot0, slot1, slot2, slot3)
	slot5 = slot0._ffi.string(slot1, (not slot2 or slot2 <= 0 or math.min(slot2, slot0._ffi.sizeof(slot1))) and slot0._ffi.sizeof(slot1))

	if SwManager_whConverUnicodeToUtf8WithArray and string.find(tostring(slot1), "unsigned short") then
		slot5 = SwManager_whConverUnicodeToUtf8WithArray(slot5)
	end

	if slot3 then
		slot5 = StringUtil.truncateZeroTerminated(slot5)
	end

	return slot5
end

FfiManager.importFfiFile = function (slot0, slot1)
	slot0._ffi.cdef(io.readfile(ResConfig.getAssetPath("ffi/" .. slot1)))
end

ffiMgr = FfiManager.new()

return
