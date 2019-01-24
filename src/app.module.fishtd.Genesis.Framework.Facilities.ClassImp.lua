slot0 = nil

function slot1(slot0, slot1)
	if type(slot0) == "userdata" then
		if not tolua.getpeer(slot0) then
			tolua.setpeer(slot0, {})
		end

		slot0(slot2, slot1)
	elseif not getmetatable(slot0) or {}.__index then
		slot2.__index = slot1

		setmetatable(slot0, slot2)
	elseif slot2.__index ~= slot1 then
		slot0(slot1, slot2.__index)

		slot2.__index = slot1
	end
end

function class_C(slot0, ...)
	slot1 = {
		__cname = slot0
	}

	for slot6, slot7 in ipairs(slot2) do
		assert(type(slot7) == "nil" or slot8 == "table" or slot8 == "function", string.format("class_C() - create class \"%s\" with invalid super class type \"%s\"", slot0, slot8))

		if slot8 == "function" then
			assert(slot1.__create == nil, string.format("class_C() - create class \"%s\" with more than one creating function", slot0))

			slot1.__create = slot7
		elseif slot8 == "table" then
			if slot7[".isclass"] then
				assert(slot1.__create == nil, string.format("class_C() - create class \"%s\" with more than one creating function or native class", slot0))

				slot1.__create = function ()
					return slot0:create()
				end
			else
				slot1.__supers = slot1.__supers or {}
				slot1.__supers[#slot1.__supers + 1] = slot7

				if not slot1.super then
					slot1.super = slot7
				end
			end
		else
			error(string.format("class_C() - create class \"%s\" with invalid super type", slot0), 0)
		end
	end

	slot1.__index = slot1

	if not slot1.__supers or #slot1.__supers == 1 then
		setmetatable(slot1, {
			__index = slot1.super
		})
	else
		setmetatable(slot1, {
			__index = function (slot0, slot1)
				for slot6 = 1, #slot0.__supers, 1 do
					if slot2[slot6][slot1] then
						return slot7[slot1]
					end
				end
			end
		})
	end

	slot1.new = function (...)
		slot1((not slot0.__create or slot0.__create(...)) and {}, )

		(not slot0.__create or slot0.__create(...)) and .class = (not slot0.__create or slot0.__create(...)) and 

		if (not slot0.__create or slot0.__create(...)) and .onCreate then
			slot0:onCreate(...)
			slot0:onCreateFinish()
		elseif tolua.getpeer(slot0) then
			if rawget(getmetatable(slot1).__index, "ctor") then
				slot0:ctor(...)
			end
		elseif rawget(getmetatable(slot0).__index, "ctor") then
			slot0:ctor(...)
		end

		return slot0
	end

	slot1.create = function (slot0, ...)
		return slot0.new(...)
	end

	return slot1
end

return
