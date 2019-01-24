ErrorManager = class("ErrorManager")

ErrorManager.throw = function (slot0, slot1, slot2)
	error(slot1, slot2)
end

ErrorManager.throwMethodShouldBeOverwritten = function (slot0)
	slot0:throw("method is supposed to be overwritten")
end

errorMgr = ErrorManager.new()

return
