ClassLoader = {
	classes = {},
	paths = {},
	singletons = {},
	COCOS_LOADER_INDEX = 2
}

ClassLoader.registerClass = function (slot0, slot1, slot2)
	if type(slot1) == "string" then
		ClassLoader.paths[slot1] = slot2
	elseif type(slot1) == "table" then
		for slot6 = 1, #slot1, 1 do
			ClassLoader.paths[slot1[slot6].class] = slot1[slot6].path
		end
	end
end

ClassLoader.aquireClass = function (slot0, slot1)
	if not ClassLoader.classes[slot1 or ""] then
		if ClassLoader.paths[slot1] then
			if require(ClassLoader.paths[slot1]) then
				ClassLoader.classes[slot1] = slot2

				return slot2
			end
		else
			print(string.format("Class [%s] not registered!", slot1))
		end
	else
		return slot0.classes[slot1]
	end
end

ClassLoader.aquireInstance = function (slot0, slot1, ...)
	slot3 = {
		...
	}

	if ClassLoader:aquireClass(slot1) then
		slot4, slot5 = xpcall(function ()
			return slot0:create(unpack(slot0))
		end, ClassLoader.trace)

		if slot4 then
			return slot5
		else
			print(string.format("Failed to Instantiate [%s] !", slot1))
		end
	else
		print("Invalid Class Type")
	end
end

ClassLoader.aquireSingleton = function (slot0, slot1, ...)
	if not ClassLoader.singletons[slot1] then
		if ClassLoader:aquireInstance(slot1, ...) then
			ClassLoader.singletons[slot1] = slot3

			return slot3
		end
	else
		return slot2
	end
end

ClassLoader.clearSingleton = function (slot0, slot1)
	ClassLoader.singletons[slot1] = nil
end

ClassLoader.clear = function (slot0)
	ClassLoader.paths = {}
	ClassLoader.classes = {}
	ClassLoader.singletons = {}
end

ClassLoader.trace = function (slot0)
	print("")
	print("----------- [[[ LUA ERROR ]]] ----------- ")
	print("")
	print("               | Message |              ")
	print("")
	print(string.format("%s", slot0))
	print("")
	print("                | Stack |               ")
	print("")
	print(debug.traceback())
	print("")
	print("-------------- [[[ END ]]] --------------")
	print("")
end

return
