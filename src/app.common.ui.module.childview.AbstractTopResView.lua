slot2 = "AbstractTopResView"
AbstractTopResView = class(slot1)

AbstractTopResView.ctor = function (slot0, slot1)
	slot0._topResBarOld = nil
	slot0._topResBar2 = nil
	slot0._topResParent = slot1
	slot0._x = CONFIG_DESIGN_WIDTH * 0.5
	slot0._y = CONFIG_DESIGN_HEIGHT - 50 + (CUR_SELECTED_HEIGHT - CONFIG_DESIGN_HEIGHT) * 0.5
end

AbstractTopResView.onTopAddBtnClick = function (slot0)
	return
end

AbstractTopResView.onTopCloseBtnClick = function (slot0)
	if slot0.onRootClick then
		slot3 = slot0

		slot0.onRootClick(slot2)
	end
end

AbstractTopResView.getTopBtnClose = function (slot0)
	if slot0._topResBar2 then
		return slot0._topResBar2.btnBack
	end

	return nil
end

AbstractTopResView.showTopReses2 = function (slot0, ...)
	if not slot0._topResBar2 then
		slot6 = slot0
		slot0._topResBar2 = ccsPoolMgr.get(slot2, ccsPoolMgr, "csb/common/TopResPane.csb", false)
		slot3 = slot0._topResBar2
		slot7 = slot0.onTopCloseBtnClick

		slot0._topResBar2.setCloseBtnClickHandler(slot2, handler(false, slot0))

		slot3 = slot0._topResBar2
		slot7 = slot0.onTopAddBtnClick

		slot0._topResBar2.setAddBtnClickHandler(slot2, handler(false, slot0))

		slot3 = slot0

		slot0.onTopResPositionOrParentChanged(slot2)
	end

	slot4 = {
		...
	}

	slot0._topResBar2.pushResesOrItemVos(slot2, slot0._topResBar2)
end

AbstractTopResView.showTopReses = function (slot0, ...)
	if not slot0._topResBarOld then
		slot3 = {
			...
		}
		slot0._topResBarOld = MyResTopBar.new(slot2)
		slot3 = slot0

		slot0.onTopResPositionOrParentChanged(slot2)
	else
		slot4 = {
			...
		}

		slot0._topResBarOld.pushResesOrItemVos(slot2, slot0._topResBarOld)
	end
end

AbstractTopResView.changePositionNParent = function (slot0, slot1, slot2, slot3)
	if slot3 then
		slot0._topResParent = slot3
	end

	if slot1 then
		slot0._x = slot1
	end

	if slot2 then
		slot0._y = slot2
	end

	slot6 = slot0

	slot0.onTopResPositionOrParentChanged(slot5)
end

AbstractTopResView.setTopResPaneShowing = function (slot0, slot1, slot2)
	if slot0._topResBarOld then
		if slot1 then
			slot6 = slot2

			slot0._topResBarOld.onShow(slot4, slot0._topResBarOld)
		else
			slot6 = slot2

			slot0._topResBarOld.onHide(slot4, slot0._topResBarOld)
		end
	end

	if slot0._topResBar2 then
		if slot1 then
			slot6 = slot2

			slot0._topResBar2.onShow(slot4, slot0._topResBar2)
		else
			slot6 = slot2

			slot0._topResBar2.onHide(slot4, slot0._topResBar2)
		end
	end
end

AbstractTopResView.onTopResHide = function (slot0)
	if slot0._topResBarOld then
		slot3 = slot0._topResBarOld

		slot0._topResBarOld.onHide(slot2)
	end

	if slot0._topResBar2 then
		slot3 = slot0._topResBar2

		slot0._topResBar2.onHide(slot2)
	end
end

AbstractTopResView.onTopResShow = function (slot0)
	if slot0._topResBarOld then
		slot3 = slot0._topResBarOld

		slot0._topResBarOld.onShow(slot2)
	end

	if slot0._topResBar2 then
		slot3 = slot0._topResBar2

		slot0._topResBar2.onShow(slot2)
	end

	slot3 = slot0

	slot0.onTopResPositionOrParentChanged(slot2)
end

AbstractTopResView.onTopResPositionOrParentChanged = function (slot0)
	if slot0._topResBarOld then
		slot5 = true

		DisplayUtil.setAddOrRemoveChild(slot2, slot0._topResBarOld, slot0._topResParent)

		slot5 = slot0._y

		slot0._topResBarOld.setPosition(slot2, slot0._topResBarOld, slot0._x)
	end

	if slot0._topResBar2 then
		slot5 = true

		DisplayUtil.setAddOrRemoveChild(slot2, slot0._topResBar2, slot0._topResParent)
	end
end

AbstractTopResView.destroy = function (slot0)
	if slot0._topResBarOld then
		slot3 = slot0._topResBarOld

		slot0._topResBarOld.destroy(slot2)

		slot0._topResBarOld = nil
	end

	if slot0._topResBar2 then
		slot4 = nil

		slot0._topResBar2.setAddBtnClickHandler(slot2, slot0._topResBar2)

		slot4 = nil

		slot0._topResBar2.setCloseBtnClickHandler(slot2, slot0._topResBar2)

		slot4 = slot0._topResBar2

		ccsPoolMgr.put(slot2, ccsPoolMgr)

		slot0._topResBar2 = nil
	end
end

return
