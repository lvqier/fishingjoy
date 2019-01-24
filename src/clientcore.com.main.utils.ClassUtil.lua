shengsmarkPrintSearch = false

module("ClassUtil", package.seeall)

function slot0(slot0, slot1)
	if shengsmarkPrintSearch then
		print(slot0)
	end
end

function slot1(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.__supers) do
		if slot6[slot0] then
			return slot6[slot0]
		end
	end

	return nil
end

function slot2(slot0, slot1, slot2)
	if slot1 and slot0 and not table.indexof(slot0, slot1) then
		if slot2 then
			table.insert(slot0, slot2, slot1)
		else
			table.insert(slot0, slot1)
		end
	end
end

function extends(slot0, slot1, slot2, ...)
	assert(slot0 ~= nil, "why obj is nil?")
	assert(slot1 ~= nil, "why classObj is nil?")

	slot4 = nil

	if type(slot0) == "userdata" then
		if getmetatable(tolua.getpeer(slot0) or {}) and not slot4.__supers then
			slot4.super = slot5.__index
		end

		tolua.setpeer(slot0, slot4)
	else
		slot4 = slot0
	end

	slot5 = slot4.__supers

	if slot4.super == slot1 or (slot5 and table.indexof(slot5, slot1)) then
		return slot0
	end

	if not slot5 then
		slot4.__supers = {}

		if getmetatable(slot4) then
			slot0(slot5, slot6, 1)
		end

		slot6 = {}

		if not slot4.super then
			slot4.super = slot1
		else
			slot0(slot5, slot4.super, 1)
		end

		slot6.__index = function (slot0, slot1)
			return slot0(slot1, slot0)
		end

		setmetatable(slot4, slot6)
	end

	slot0(slot5, slot1)

	if slot2 ~= false and slot1.ctor ~= nil then
		slot1.ctor(slot0, ...)
	end

	return slot0
end

function is(slot0, slot1)
	if slot0 == nil or slot1 == nil or (type(slot0) ~= "table" and type(slot0) ~= "userdata") then
		return false
	end

	if type(slot0) == "userdata" then
		if "class " .. tolua.type(slot0) == tolua.type(slot1) then
			return true
		elseif tolua.getpeer(slot0) == nil then
			return false
		end
	end

	if slot0.class == slot1 then
		return true
	end

	if slot0.class and slot0.class.super == slot1 then
		return true
	end

	if slot0.__supers then
		for slot6, slot7 in pairs(slot2) do
			if slot7 == slot1 or slot7.super == slot1 then
				return true
			end
		end
	end

	return false
end

function printSupers(slot0)
	print("----输出父类开始：")

	for slot4, slot5 in ipairs(slot0.__supers) do
		print(slot5.__cname, tostring(slot5))
	end

	print("----输出父类结束")
end

return
