class_C("PathTrackerFactory").getPathTrackerByConfig = function (slot0, slot1, slot2)
	if slot1.type == ClassLoader:aquireClass("GameConfig").PathType.LINE then
		return ClassLoader:aquireInstance("PathTrackerLine", slot1, slot2)
	elseif slot1.type == slot3.PathType.BEZIER then
		return ClassLoader:aquireInstance("PathTrackerCubicBezier", slot1, slot2)
	elseif slot1.type == slot3.PathType.CIRCLE then
		return ClassLoader:aquireInstance("PathTrackerCircle", slot1, slot2)
	elseif slot1.type == slot3.PathType.DELAY then
		return ClassLoader:aquireInstance("PathTrackerDelay", slot1, slot2)
	elseif slot1.type == slot3.PathType.SPIRAL then
		return ClassLoader:aquireInstance("PathTrackerSpiral", slot1, slot2)
	end
end

return class_C("PathTrackerFactory")
