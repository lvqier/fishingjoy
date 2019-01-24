slot0 = class_C("BaseNode", function ()
	return cc.Node:create()
end)

slot0.ctor = function (slot0)
	slot0._alive = true

	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			slot0:onEnter()
		elseif slot0 == "exit" then
			slot0:onExit()
		end
	end)
	slot0:setCascadeOpacityEnabled(true)
end

slot0.onEnter = function (slot0)
	return
end

slot0.onExit = function (slot0)
	return
end

return slot0
