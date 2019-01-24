slot0 = class("ArtNumLayoutManager")

slot0.ctor = function (slot0)
	ClassUtil.extends(slot0, TickBase)

	slot0._checkRenderInNextFrameDic = {}
	slot0._checkRenderLenNextFrame = 0
	slot0._checkRenderInDisplayIntervalInS = 0.125
end

slot0.put = function (slot0, slot1)
	if not slot0._checkRenderInNextFrameDic[slot1] then
		slot0._checkRenderInNextFrameDic[slot1] = true
		slot0._checkRenderLenNextFrame = slot0._checkRenderLenNextFrame + 1
	end

	if slot0._checkRenderLenNextFrame > 0 and not slot0:getIsTicking() then
		slot0:startTick(8)
	end
end

slot0.checkStopTick = function (slot0)
	if slot0._checkRenderLenNextFrame <= 0 then
		slot0:stopTick()

		slot0._checkRenderLenNextFrame = 0
	end
end

slot0.remove = function (slot0, slot1)
	if slot0._checkRenderInNextFrameDic[slot1] then
		slot0._checkRenderInNextFrameDic[slot1] = nil
		slot0._checkRenderLenNextFrame = slot0._checkRenderLenNextFrame - 1
	end

	slot0:checkStopTick()
end

slot0.tick = function (slot0, slot1)
	if slot0._checkRenderLenNextFrame > 0 then
		for slot5, slot6 in pairs(slot0._checkRenderInNextFrameDic) do
			slot5:render()
		end

		slot0._checkRenderInNextFrameDic = {}
		slot0._checkRenderLenNextFrame = 0
	end

	slot0:checkStopTick()
end

anlMgr = slot0.new()

return
