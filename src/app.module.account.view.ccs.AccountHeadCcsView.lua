AccountHeadCcsView = class("AccountHeadCcsView")

AccountHeadCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0.view.head_lv:setItemResCcsFileName("csb/common/AccountHeadItem.csb")
	slot0.view.head_lv:setScrollPolicy(CcsScrollView.SCROLL_H)
end

AccountHeadCcsView.onShow = function (slot0)
	slot0._dataTab = slot0:initData()
	slot0._index = Hero:getWFaceID()
	slot0._gender = Hero:getCbGender()

	slot0.model:setHeadSelectedId(mainMgr:parseFaceId(slot0._index))
	slot0.model:setHeadSelectedGender(slot0._gender)
	slot0:refreshView()
end

AccountHeadCcsView.refreshView = function (slot0)
	slot0.view.head_lv:setDatas(TableUtil.cookDataAs2Dimension(slot0._dataTab, 2), true)
end

AccountHeadCcsView.initData = function (slot0)
	slot1 = {}
	slot2 = {
		[0] = "female_",
		"male_"
	}
	slot3 = (Hero:getCbGender() == 0 and {
		0,
		1
	}) or {
		1,
		0
	}

	for slot7, slot8 in ipairs(slot3) do
		slot9 = slot2[slot8]

		for slot13 = 1, PLAYER_HEAD_COUNT, 1 do
			table.insert(slot1, {
				picName = "plist_head_" .. slot9 .. slot13 .. ".png",
				gender = slot8,
				faceId = slot13
			})
		end
	end

	return slot1
end

AccountHeadCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		if slot0.model:getHeadSelectedId() ~= slot0._index or slot0.model:getHeadSelectedGender() ~= slot0._gender then
			slot0.controller:requestChangeFace()
		end

		slot0.model:setIsShowingHeadView(false)
	end
end

AccountHeadCcsView.onHide = function (slot0)
	return
end

AccountHeadCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.head_lv)
	ZoomPopUpChildView.destroy(slot0)

	slot0._index = nil
	slot0._dataTab = nil
end

return
