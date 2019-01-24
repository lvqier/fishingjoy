slot3 = ({
	ctor = function (slot0)
		slot0._cache = {
			fish = {},
			bullet = {}
		}
	end,
	getObject = function (slot0, slot1, slot2)
		slot3[slot2] = slot0._cache[slot1][slot2] or {
			_size = 0
		}

		if slot0._cache[slot1][slot2] or ._head then
			slot4._head = slot4._head._next
			slot4._rear = (slot4._head and slot4._rear) or nil
			slot4._size = slot4._size - 1

			return slot5
		end
	end,
	recycleObject = function (slot0, slot1, slot2, slot3)
		slot4[slot2] = slot0._cache[slot1][slot2] or {
			_size = 0
		}

		if slot0._cache[slot1][slot2] or ._rear then
			slot5._rear._next = slot3
			slot5._rear = slot3
		else
			slot5._rear = slot3
			slot5._head = slot3
		end

		slot3._next = nil
		slot5._size = slot5._size + 1
	end,
	clear = function (slot0)
		slot3 = slot0._cache

		for slot4, slot5 in pairs(slot2) do
			slot8 = slot5

			for slot9, slot10 in pairs(slot7) do
				while slot10._head do
					slot10._head = slot10._head._next
					slot10._head._next = nil
					slot14 = slot10._head

					slot10._head.release(slot13)
				end

				slot0._cache[key] = nil
			end
		end
	end,
	_instance = 
})["_instance"]

()["_instance"].ctor(slot2)

return 
