PlazaKFQnACcsView = class("PlazaKFQnACcsView")

PlazaKFQnACcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0:init()
end

PlazaKFQnACcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingKfQnA(false)
end

PlazaKFQnACcsView.init = function (slot0)
	if slot0.view.faq_sv then
		slot1 = slot0.view.faq_sv:getContentSize().width

		if slot0.view.faqView:getContentSize().height < slot0.view.faq_sv:getContentSize().height then
			slot2 = slot3
		end

		slot0.view.faq_sv:setInnerContainerSize(cc.size(slot1, slot2))
		slot0.view.faq_sv:addContentChild(slot0.view.faqView)
		slot0.view.faqView:setAnchorPoint(cc.p(0, 1))
		slot0.view.faqView:setPosition(cc.p(0, slot2))
		slot0.view.faq_sv._onPosChangedSignal:add(slot0.onScroll, slot0)
		slot0:onScroll()
	end
end

PlazaKFQnACcsView.onScroll = function (slot0)
	if slot0.view.faq_sv:getInnerContainer():getPositionY() > slot0.view.faq_sv:getContentSize().height - slot0.view.faqView:getContentSize().height then
		slot0.view.emailMaskUp:setVisible(true)
	else
		slot0.view.emailMaskUp:setVisible(false)
	end
end

PlazaKFQnACcsView.destroy = function (slot0)
	slot0.view.faq_sv._onPosChangedSignal:remove(slot0.onScroll, slot0)
	destroySomeObj(slot0.view.faq_sv)
	ZoomPopUpChildView.destroy(slot0)
end

return
