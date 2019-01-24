PuzzleCcsBtn = class("PuzzleCcsBtn")

PuzzleCcsBtn.ctor = function (slot0, slot1)
	createSetterGetter(slot0, "puzzleTime", 1)

	if slot1 then
		ClassUtil.extends(slot0, BaseCcsBtn, true, slot1)
	end

	slot0:startPuzzle()
end

PuzzleCcsBtn.startPuzzle = function (slot0)
	slot0:setOpacity(255)
	TweenMax.to(slot0, slot0._puzzleTime, {
		opacity = 0,
		yoyo = true,
		repeatCount = -1
	})
end

PuzzleCcsBtn.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseCcsBtn, true, slot0)
end

PuzzleCcsBtn.onPushingDownChanged = function (slot0)
	if slot0._isPushingDown then
		TweenLite.killTweensOf(slot0)
		slot0:setOpacity(255)
	else
		slot0:startPuzzle()
	end
end

return
