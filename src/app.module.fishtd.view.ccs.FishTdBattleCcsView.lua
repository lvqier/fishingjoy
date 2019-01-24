slot0 = ClassLoader:aquireClass("ButtonWrapper")
slot1 = ClassLoader:aquireClass("Tools")
FishTdBattleCcsView = class("FishTdBattleCcsView")

FishTdBattleCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseGameBattleView)

	slot1 = cc.Director:getInstance():getVisibleSize()
	slot1.height = 750
	slot0.touchLayer = ccui.Layout:create()

	slot0.touchLayer:setContentSize(slot1)
	slot0.touchLayer:setPosition(cc.p(-(slot1.width - 1334) / 2, 0))
	slot0:addChild(slot0.touchLayer, 0)
	ClassUtil.extends(slot0.touchLayer, BaseCcsBtn)

	slot0.controller.battleView = slot0
	slot0._buttonAutoFire = ccui.ImageView:create("gameres/module/fishtd/ui/ingame/zidong_anniu.png")

	if slot0._buttonAutoFire:getVirtualRenderer() and cc.Node.setCullFace then
		slot2:setCullFace(true)
	end

	slot0._buttonAutoFire:setPosition(1270, 570)

	slot0._buttonWrapperAutoFire = slot0:wrapWithType(slot0._buttonAutoFire, "CHECK_BOUND_WITH_CANCEL")

	slot0._buttonWrapperAutoFire:setClickEventHandler(slot1:thisCall(slot0.controller.onAutoFireClicked, slot0.controller))

	slot0._buttonWrapperAutoFire.highlight = cc.Sprite:create("gameres/module/fishtd/ui/ingame/suoding-guangxiao.png")

	if slot0._buttonWrapperAutoFire.highlight.setCullFace then
		slot0._buttonWrapperAutoFire.highlight:setCullFace(true)
	end

	slot0._buttonWrapperAutoFire.highlight:setPosition(57, 57)
	slot0._buttonWrapperAutoFire.highlight:setVisible(false)
	slot0._buttonWrapperAutoFire:addChild(slot0._buttonWrapperAutoFire.highlight)

	slot0._buttonWrapperAutoFire.text = cc.Sprite:create("gameres/module/fishtd/ui/ingame/zidongzhong.png")

	if slot0._buttonWrapperAutoFire.text.setCullFace then
		slot0._buttonWrapperAutoFire.text:setCullFace(true)
	end

	slot0._buttonWrapperAutoFire.text:setPosition(57, 10)
	slot0._buttonWrapperAutoFire.text:setVisible(false)
	slot0._buttonWrapperAutoFire:addChild(slot0._buttonWrapperAutoFire.text)
	slot0:addChild(slot0._buttonAutoFire, 10)

	slot0._buttonAutoLock = ccui.ImageView:create("gameres/module/fishtd/ui/ingame/suoding_anniu.png")

	slot0._buttonAutoLock:setPosition(1270, 450)

	slot0._buttonWrapperAutoLock = slot0:wrapWithType(slot0._buttonAutoLock, "CHECK_BOUND_WITH_CANCEL")

	slot0._buttonWrapperAutoLock:setClickEventHandler(slot1:thisCall(slot0.controller.onAutoLockClicked, slot0.controller))

	slot0._buttonWrapperAutoLock.highlight = cc.Sprite:create("gameres/module/fishtd/ui/ingame/suoding-guangxiao.png")

	if cc.Node.setCullFace then
		slot0._buttonWrapperAutoLock.highlight:setCullFace(true)
	end

	slot0._buttonWrapperAutoLock.highlight:setPosition(57, 57)
	slot0._buttonWrapperAutoLock.highlight:setVisible(false)
	slot0._buttonWrapperAutoLock:addChild(slot0._buttonWrapperAutoLock.highlight)

	slot0._buttonWrapperAutoLock.text = cc.Sprite:create("gameres/module/fishtd/ui/ingame/suodingzhong.png")

	if slot0._buttonWrapperAutoLock.text.setCullFace then
		slot0._buttonWrapperAutoLock.text:setCullFace(true)
	end

	slot0._buttonWrapperAutoLock.text:setPosition(57, 10)
	slot0._buttonWrapperAutoLock.text:setVisible(false)
	slot0._buttonWrapperAutoLock:addChild(slot0._buttonWrapperAutoLock.text)
	slot0:addChild(slot0._buttonAutoLock, 10)

	slot0._buttonSpeedUp = ccui.ImageView:create("gameres/module/fishtd/ui/ingame/jiasu_anniu.png")

	slot0._buttonSpeedUp:setPosition(1270, 330)

	slot0._buttonWrapperSpeedUp = slot0:wrapWithType(slot0._buttonSpeedUp, "CHECK_BOUND_WITH_CANCEL")

	slot0._buttonWrapperSpeedUp:setClickEventHandler(slot1:thisCall(slot0.controller.onSpeedUpClicked, slot0.controller))

	slot0._buttonWrapperSpeedUp.highlight = cc.Sprite:create("gameres/module/fishtd/ui/ingame/suoding-guangxiao.png")

	if slot0._buttonWrapperSpeedUp.highlight.setCullFace then
		slot0._buttonWrapperSpeedUp.highlight:setCullFace(true)
	end

	slot0._buttonWrapperSpeedUp.highlight:setPosition(57, 57)
	slot0._buttonWrapperSpeedUp.highlight:setVisible(false)
	slot0._buttonWrapperSpeedUp:addChild(slot0._buttonWrapperSpeedUp.highlight)

	slot0._buttonWrapperSpeedUp.text = cc.Sprite:create("gameres/module/fishtd/ui/ingame/zidongzhong.png")

	if cc.Node.setCullFace then
		slot0._buttonWrapperSpeedUp.text:setCullFace(true)
	end

	slot0._buttonWrapperSpeedUp.text:setPosition(57, 10)
	slot0._buttonWrapperSpeedUp.text:setVisible(false)
	slot0._buttonWrapperSpeedUp:addChild(slot0._buttonWrapperSpeedUp.text)
	slot0:addChild(slot0._buttonSpeedUp, 10)
	slot0.model.fireSpeedChangedSignal:add(slot0.onFireSpeedChanged, slot0)
	slot0.model.isAutoFireChangedSignal:add(slot0.onIsAutoFireChanged, slot0)
	slot0.model.isAutoLockingChangedSignal:add(slot0.onIsAutoLockingChanged, slot0)
	slot0.model.isShowingMenuChangedSignal:add(slot0.onMenuShowChanged, slot0)
	slot0.btnOpen:setLocalZOrder(11)
	slot0.btnClose:setLocalZOrder(11)
	slot0.controller:adjustSlimWidth(slot0.btnOpen, UIConfig.ALIGN_LEFT_UP, 80)
	slot0.controller:adjustSlimWidth(slot0.btnClose, UIConfig.ALIGN_LEFT_UP, 80)
	slot0.controller:adjustSlimWidth(slot0._buttonAutoFire, UIConfig.ALIGN_RIGHT, -80)
	slot0.controller:adjustSlimWidth(slot0._buttonAutoLock, UIConfig.ALIGN_RIGHT, -80)
	slot0.controller:adjustSlimWidth(slot0._buttonSpeedUp, UIConfig.ALIGN_RIGHT, -80)
end

FishTdBattleCcsView.onIsAutoFireChanged = function (slot0)
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.BUTTON_CLICK)

	if slot0.model:getIsAutoFire() then
		slot0._buttonWrapperAutoFire.highlight:setVisible(true)
		slot0._buttonWrapperAutoFire.highlight:runAction(cc.RepeatForever:create(cc.RotateBy:create(3, 360)))
		slot0._buttonWrapperAutoFire.text:setVisible(true)
	else
		slot0._buttonWrapperAutoFire.highlight:setVisible(false)
		slot0._buttonWrapperAutoFire.highlight:stopAllActions()
		slot0._buttonWrapperAutoFire.text:setVisible(false)
	end
end

FishTdBattleCcsView.onIsAutoLockingChanged = function (slot0)
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.BUTTON_CLICK)

	if slot0.model:getIsAutoLocking() then
		slot0._buttonWrapperAutoLock.highlight:setVisible(true)
		slot0._buttonWrapperAutoLock.highlight:runAction(cc.RepeatForever:create(cc.RotateBy:create(3, 360)))
		slot0._buttonWrapperAutoLock.text:setVisible(true)
	else
		slot0._buttonWrapperAutoLock.highlight:setVisible(false)
		slot0._buttonWrapperAutoLock.highlight:stopAllActions()
		slot0._buttonWrapperAutoLock.text:setVisible(false)
	end
end

FishTdBattleCcsView.onFireSpeedChanged = function (slot0)
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.BUTTON_CLICK)

	if slot0.model:getFireSpeed() == 2 then
		slot0._buttonWrapperSpeedUp.highlight:setVisible(true)
		slot0._buttonWrapperSpeedUp.highlight:stopAllActions()
		slot0._buttonWrapperSpeedUp.highlight:runAction(cc.RepeatForever:create(cc.RotateBy:create(3, 360)))
		slot0._buttonWrapperSpeedUp.text:setVisible(true)
		slot0._buttonWrapperSpeedUp.text:setTexture("gameres/module/fishtd/ui/ingame/jiasu-2.png")
	elseif slot0.model:getFireSpeed() == 4 then
		slot0._buttonWrapperSpeedUp.highlight:setVisible(true)
		slot0._buttonWrapperSpeedUp.highlight:stopAllActions()
		slot0._buttonWrapperSpeedUp.highlight:runAction(cc.RepeatForever:create(cc.RotateBy:create(3, 360)))
		slot0._buttonWrapperSpeedUp.text:setVisible(true)
		slot0._buttonWrapperSpeedUp.text:setTexture("gameres/module/fishtd/ui/ingame/jiasu-4.png")
	else
		slot0._buttonWrapperSpeedUp.highlight:setVisible(false)
		slot0._buttonWrapperSpeedUp.highlight:stopAllActions()
		slot0._buttonWrapperSpeedUp.text:setVisible(false)
	end
end

FishTdBattleCcsView.onShow = function (slot0)
	mainMgr:onStopTick2Gc()

	if device.platform == "android" then
		cc.Director:getInstance():setAnimationInterval(0.03333333333333333)
	else
		cc.Director:getInstance():setAnimationInterval(0.03333333333333333)
	end

	slot0.btnOpen:setVisible(true)
	slot0.btnClose:setVisible(false)
	slot0.touchLayer:getTouchSignal():add(slot0.onTouchOperation, slot0)
	slot0:setPosition(0, 0)
	slot0.controller:initBattle()

	if not PathMath._o then
		slot3 = slot0:getParent():convertToWorldSpace(cc.p(0, 0)).y
		PathMath._o = PathMath.projectToViewPlane

		if slot0.getParent().convertToWorldSpace(cc.p(0, 0)).x > 0 then
			slot4.projectToViewPlane = function (slot0, slot1)
				if slot1 then
					ret = slot1._o({
						x = slot0.x + slot0,
						y = slot0.y,
						z = slot0.z
					})
				else
					ret = slot1._o(slot0)
				end

				ret.x = ret.x - slot0

				return ret
			end
		elseif slot3 > 0 then
			slot4.projectToViewPlane = function (slot0, slot1)
				slot2 = nil
				(not slot1 or slot1._o({
					x = slot0.x,
					y = slot0.y + slot0,
					z = slot0.z
				})) and slot1._o(slot0).y = (not slot1 or slot1._o()) and slot1._o(slot0).y - slot0

				return (not slot1 or slot1._o()) and slot1._o(slot0)
			end
		end
	end
end

FishTdBattleCcsView.onHide = function (slot0)
	mainMgr:onRestartTick2Gc()
	cc.Director:getInstance():setAnimationInterval(0.016666666666666666)
	slot0.model:setIsShowingWikiDetail(false)
	slot0.model:setIsShowingExitConfirm(false)
end

FishTdBattleCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnOpen or slot1 == slot0.btnClose then
		slot0.controller:onMenuBtnClick()
		fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.DIALOG_POPUP)
	end
end

FishTdBattleCcsView.onMenuShowChanged = function (slot0)
	slot0.btnOpen:setVisible(not slot0.model:getIsShowingMenu())
	slot0.btnClose:setVisible(slot1)
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.BUTTON_CLICK)
end

FishTdBattleCcsView.onTouchOperation = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		slot0:onTouchBegan(slot0:convertToNodeSpace(slot1:getTouchBeganPosition()), slot2)
	elseif slot2 == ccs.TOUCH_EVENT_MOVED then
		slot0:onTouchMoved(slot0:convertToNodeSpace(slot1:getTouchMovePosition()), slot2)
	elseif slot2 == ccs.TOUCH_EVENT_CANCELED then
		slot0:onTouchEnded(slot0:convertToNodeSpace(slot1:getTouchEndPosition()), slot2)
	elseif slot2 == ccs.TOUCH_EVENT_ENDED then
		slot0:onTouchEnded(slot0:convertToNodeSpace(slot1:getTouchEndPosition()), slot2)
	end
end

FishTdBattleCcsView.onTouchBegan = function (slot0, slot1)
	slot0.controller:onTouchBegan(slot1)
end

FishTdBattleCcsView.onTouchMoved = function (slot0, slot1)
	slot0.controller:onTouchMoved(slot1)
end

FishTdBattleCcsView.onTouchEnded = function (slot0, slot1)
	slot0.controller:onTouchEnded(slot1)
end

return
