slot3 = ({
	ctor = function (slot0)
		slot0._cache = {}
	end,
	getObject = function (slot0, slot1, slot2, ...)
		if not slot0._cache[slot1] then
			slot0._cache[slot1] = {
				_freeSize = 0,
				_totalSize = 0,
				_usedSize = 0,
				_free = {},
				_used = {}
			}
		end

		if slot3._freeSize == 0 then
			if slot2 then
				slot3._used[slot2(...)] = true
				slot3._totalSize = slot3._totalSize + 1
				slot3._usedSize = slot3._usedSize + 1

				return slot2(...)
			end
		else
			slot3._free[slot3._freeSize] = nil
			slot3._used[slot3._free[slot3._freeSize]] = true
			slot3._freeSize = slot3._freeSize - 1
			slot3._usedSize = slot3._usedSize + 1

			return slot3._free[slot3._freeSize]
		end
	end,
	recycleObject = function (slot0, slot1, slot2)
		if not slot0._cache[slot1] then
			slot0._cache[slot1] = {
				_freeSize = 0,
				_totalSize = 0,
				_usedSize = 0,
				_free = {},
				_used = {}
			}
		end

		slot3._free[slot3._freeSize + 1] = slot2

		if not slot3._used[slot2] then
			slot3._totalSize = slot3._totalSize + 1
		else
			slot3._usedSize = slot3._usedSize - 1
		end

		slot5[slot2] = nil
		slot3._freeSize = slot3._freeSize + 1
	end,
	recycleAllObjects = function (slot0)
		slot3 = slot0._cache

		for slot4, slot5 in pairs(slot2) do
			slot8 = slot5._used

			for slot9, slot10 in pairs(slot7) do
				slot13 = slot9

				slot9.removeFromParent(slot12)

				slot5._freeSize = slot5._freeSize + 1
				slot5._free[slot5._freeSize] = slot9
				slot5._used[slot9] = nil
			end
		end
	end,
	clear = function (slot0)
		return
	end,
	dump = function (slot0)
		return
	end,
	_instance = 
})["_instance"]

()["_instance"].ctor(slot2)

return 
