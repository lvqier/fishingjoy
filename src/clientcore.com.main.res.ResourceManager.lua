requireClientCoreMain("utils.StringUtil")

slot0 = class("ResourceManager")
slot1 = nil

slot0.ctor = function (slot0)
	slot0._plistRefs = {}
	slot0 = cc.SpriteFrameCache:getInstance()
end

slot0.getTpFrames = function (slot0, slot1, slot2)
	slot3 = nil
	slot4 = 0

	while true do
		if slot0:getTpFrame(slot1, slot4, nil, slot2) then
			table.insert(slot3 or {}, slot5)

			slot4 = slot4 + 1
		else
			break
		end
	end

	return slot3
end

slot0.getTpFrame = function (slot0, slot1, slot2, slot3, slot4)
	slot2 = slot2 or ""
	slot1 = string.split(slot1, ".")[1]
	slot3 = slot3 or ""

	if slot5[2] then
		slot3 = "." .. slot5[2]
	end

	slot6 = ""

	if slot4 then
		slot6 = slot1 .. "/" .. StringUtil.int2StringKeepBits(slot2 or 0, 4)
	else
		slot6 = slot1 .. slot2 .. slot3
	end

	return slot0:getSpriteFrame(slot6)
end

slot0.containsPlist = function (slot0, slot1)
	return slot0:isSpriteFramesWithFileLoaded(slot1)
end

slot0.unloadTextureAtlas = function (slot0, slot1, slot2)
	if slot0._plistRefs[slot1] or slot2 then
		if slot3 == 1 or slot2 then
			slot0._plistRefs[slot1] = nil

			slot0:removeSpriteFramesFromFile(slot1)
		else
			slot0._plistRefs[slot1] = slot3 - 1
		end
	end
end

slot0.loadTextureAtlas = function (slot0, slot1, slot2)
	if StringUtil.isStringValid(slot1) then
		if slot2 then
			slot0._plistRefs[slot1] = (slot0._plistRefs[slot1] or 0) + 1
		end

		slot0:addSpriteFrames(slot1)
	end
end

slot0.loadImageAsync = function (slot0, slot1, slot2)
	cc.Director:getInstance():getTextureCache():addImageAsync(slot1, slot2)
end

resMgr = slot0.new()

return resMgr
