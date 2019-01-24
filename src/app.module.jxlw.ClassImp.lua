slot0 = nil

function slot1(slot0, slot1)
	slot4 = slot0

	if type(slot3) == "userdata" then
		slot4 = slot0

		if not tolua.getpeer(slot3) then
			slot6 = {}

			tolua.setpeer(slot4, slot0)
		end

		slot6 = slot1

		slot0(slot4, slot2)
	else
		slot4 = slot0
		slot2 = getmetatable(slot3) or {}

		if not slot2.__index then
			slot2.__index = slot1
			slot6 = slot2

			setmetatable(slot4, slot0)
		elseif slot2.__index ~= slot1 then
			slot6 = slot2.__index

			slot0(slot4, slot1)

			slot2.__index = slot1
		end
	end
end

function class_C(slot0, ...)
	slot1 = {
		__cname = slot0
	}
	slot5 = {
		...
	}

	for slot6, slot7 in ipairs(slot4) do
		slot11 = type(assert) == "nil" or slot8 == "table" or slot8 == "function"
		slot16 = slot8

		assert(slot7, string.format(slot13, "class_C() - create class \"%s\" with invalid super class type \"%s\"", slot0))

		if slot8 == "function" then
			slot11 = slot1.__create == nil
			slot15 = slot0

			assert(slot10, string.format(slot13, "class_C() - create class \"%s\" with more than one creating function"))

			slot1.__create = slot7
		elseif slot8 == "table" then
			if slot7[".isclass"] then
				slot11 = slot1.__create == nil
				slot15 = slot0

				assert(slot10, string.format(slot13, "class_C() - create class \"%s\" with more than one creating function or native class"))

				slot1.__create = function ()
					slot2 = slot0

					return slot0.create(slot1)
				end
			else
				slot1.__supers = slot1.__supers or {}
				slot1.__supers[#slot1.__supers + 1] = slot7

				if not slot1.super then
					slot1.super = slot7
				end
			end
		else
			slot14 = slot0
			slot12 = 0

			error(slot10, string.format(slot12, "class_C() - create class \"%s\" with invalid super type"))
		end
	end

	slot1.__index = slot1

	if not slot1.__supers or #slot1.__supers == 1 then
		slot6 = {
			__index = slot1.super
		}

		setmetatable(slot4, slot1)
	else
		slot6 = {
			__index = function (slot0, slot1)
				for slot6 = 1, #slot0.__supers, 1 do
					if slot2[slot6][slot1] then
						return slot7[slot1]
					end
				end
			end
		}

		setmetatable(slot4, slot1)
	end

	slot1.new = function (...)
		slot4 = (not slot0.__create or slot0.__create(...)) and {}

		slot1(slot2, (not slot0.__create or slot0.__create(...)) and )

		(not slot0.__create or slot0.__create(...)) and .class = (not slot0.__create or slot0.__create(...)) and 

		if (not slot0.__create or slot0.__create(...)) and .onCreate then
			slot3 = slot0

			slot0.onCreate(slot2, ...)

			slot3 = slot0

			slot0.onCreateFinish(slot2)
		else
			slot3 = slot0

			if tolua.getpeer(slot2) then
				slot6 = "ctor"

				if rawget(slot1, getmetatable(slot3).__index) then
					slot6 = slot0

					slot0.ctor(slot5, ...)
				end
			else
				slot6 = "ctor"

				if rawget(slot0, getmetatable(slot3).__index) then
					slot6 = slot0

					slot0.ctor(slot5, ...)
				end
			end
		end

		return slot0
	end

	slot1.create = function (slot0, ...)
		return slot0.new(...)
	end

	return slot1
end

return
