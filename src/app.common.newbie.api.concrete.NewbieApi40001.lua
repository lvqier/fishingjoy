slot2 = "NewbieApi40001"
NewbieApi40001 = class(slot1)

NewbieApi40001.ctor = function (slot0)
	slot4 = BaseNewbieApi

	ClassUtil.extends(slot2, slot0)

	slot0.getBtnSize = {
		w = 320,
		h = 370
	}
end

NewbieApi40001.start = function (slot0)
	if NewbieUI.bankViewGetBtn then
		slot12 = -80

		slot0._maskView.show(slot2, slot0._maskView, NewbieUI.bankViewGetBtn, nil, slot0.getBtnSize.w, slot0.getBtnSize.h, nil, nil, 0, nil)

		slot3 = NewbieUI.bankViewGetBtn
		slot5 = slot0

		NewbieUI.bankViewGetBtn.getClickSignal(slot2).addOnce(slot2, NewbieUI.bankViewGetBtn.getClickSignal(slot2), slot0.onBtnClick)
	else
		slot3 = slot0

		slot0.finishNewbie(slot2)
	end
end

NewbieApi40001.onBtnClick = function (slot0)
	slot3 = slot0

	slot0.finish(slot2)
end

NewbieApi40001.destroy = function (slot0)
	if NewbieUI.bankViewGetBtn then
		slot3 = NewbieUI.bankViewGetBtn
		slot5 = slot0

		NewbieUI.bankViewGetBtn.getClickSignal(slot2).remove(slot2, NewbieUI.bankViewGetBtn.getClickSignal(slot2), slot0.onBtnClick)
	end

	slot3 = slot0

	BaseNewbieApi.destroy(slot2)
end

return
