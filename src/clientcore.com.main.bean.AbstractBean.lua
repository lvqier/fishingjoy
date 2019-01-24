AbstractBean = class("AbstractBean")

AbstractBean.ctor = function (slot0)
	slot0.finishSignal = SignalAs3.new(slot0.__cname .. ":finishSignal")
end

AbstractBean.start = function (slot0)
	assert(false, "This method is supposed to be overwritten by subclass!! Class is ")
end

AbstractBean.finish = function (slot0)
	if slot0.finishSignal then
		slot0.finishSignal:emit()
	end

	slot0:destroy()
end

AbstractBean.destroy = function (slot0)
	if slot0.finishSignal then
		slot0.finishSignal:removeAll()

		slot0.finishSignal = nil
	end
end

return
