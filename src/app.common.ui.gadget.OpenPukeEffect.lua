slot2 = "OpenPukeEffect"
OpenPukeEffect = class(slot1)
slot7 = 150.28
slot7 = 158.99
slot7 = 162.2
slot7 = 168.07
slot7 = 168.21
slot7 = 168.07
slot7 = 168.21
slot7 = 168.07
slot7 = 168.21
slot7 = 168.07
slot7 = 168.21
slot7 = 203.75
slot7 = 199.21
OpenPukeEffect.normalMap = {
	[10] = {
		val = {
			v = false
		},
		col = {
			s = 0.275,
			v = true,
			r = 90,
			p = cc.p(slot5, 288.32)
		}
	},
	[11] = {
		val = {
			v = false
		},
		col = {
			s = 0.3992,
			v = true,
			r = 90,
			p = cc.p(slot5, 288.34)
		}
	},
	[12] = {
		val = {
			v = false
		},
		col = {
			s = 0.3992,
			v = true,
			r = 90,
			p = cc.p(slot5, 289.36)
		}
	},
	[13] = {
		val = {
			s = 0.321,
			v = true,
			r = 90,
			p = cc.p(slot5, 304.58)
		},
		col = {
			s = 0.3992,
			v = true,
			r = 90,
			p = cc.p(slot5, 287.67)
		}
	},
	[14] = {
		val = {
			s = 0.321,
			v = true,
			r = 90,
			p = cc.p(slot5, 304.58)
		},
		col = {
			s = 0.3992,
			v = true,
			r = 90,
			p = cc.p(slot5, 287.67)
		}
	},
	[15] = {
		val = {
			s = 0.321,
			v = true,
			r = 90,
			p = cc.p(slot5, 304.58)
		},
		col = {
			s = 0.3992,
			v = true,
			r = 90,
			p = cc.p(slot5, 287.67)
		}
	},
	[16] = {
		val = {
			s = 0.321,
			v = true,
			r = 90,
			p = cc.p(slot5, 304.58)
		},
		col = {
			s = 0.3992,
			v = true,
			r = 90,
			p = cc.p(slot5, 287.67)
		}
	},
	[17] = {
		val = {
			s = 0.321,
			v = true,
			r = 70,
			p = cc.p(slot5, 304.04)
		},
		col = {
			s = 0.3992,
			v = true,
			r = 70,
			p = cc.p(slot5, 287.13)
		}
	}
}
slot7 = 150.5
slot7 = 157.7
slot7 = 162.39
slot7 = 168.35
slot7 = 167.43
slot7 = 167.43
slot7 = 167.43
slot7 = 198.25
OpenPukeEffect.map = {
	[10] = {
		val = {
			s = 0.7,
			v = true,
			r = 90,
			p = cc.p(slot5, 288.2)
		},
		col = {
			v = false
		}
	},
	[11] = {
		val = {
			s = 0.7,
			v = true,
			r = 90,
			p = cc.p(slot5, 286.56)
		},
		col = {
			v = false
		}
	},
	[12] = {
		val = {
			s = 0.7,
			v = true,
			r = 90,
			p = cc.p(slot5, 288.37)
		},
		col = {
			v = false
		}
	},
	[13] = {
		val = {
			s = 0.7,
			v = true,
			r = 90,
			p = cc.p(slot5, 286.78)
		},
		col = {
			v = false
		}
	},
	[14] = {
		val = {
			s = 0.7,
			v = true,
			r = 90,
			p = cc.p(slot5, 288.03)
		},
		col = {
			v = false
		}
	},
	[15] = {
		val = {
			s = 0.7,
			v = true,
			r = 90,
			p = cc.p(slot5, 288.03)
		},
		col = {
			v = false
		}
	},
	[16] = {
		val = {
			s = 0.7,
			v = true,
			r = 90,
			p = cc.p(slot5, 288.03)
		},
		col = {
			v = false
		}
	},
	[17] = {
		val = {
			s = 0.7,
			v = true,
			r = 70,
			p = cc.p(slot5, 288.29)
		},
		col = {
			v = false
		}
	}
}

OpenPukeEffect.create = function (slot0, slot1, slot2, slot3)
	slot14 = 0.1
	slot6 = AnimationUtil.playEffectFromSpriteFrame(slot7, slot2, 1, slot5, slot3 or 20, 1, true)
	slot7, slot8 = nil
	slot9 = {}
	slot10 = slot1 ~= PUKE_JOKER_BIG and slot1 ~= PUKE_JOKER_SMALL and slot1 ~= POKER_JOKER_BIG and slot1 ~= POKER_JOKER_SMALL

	if slot10 then
		slot14 = slot1
		slot18, slot12 = gameMgr.calPukeInfo(slot12, gameMgr)
		slot18 = slot12
		slot19 = string.format(slot15, "plist_puke_value_%d_%d.png", slot13)
		slot19 = string.format("plist_puke_value_%d_%d.png", "plist_puke_color_small_%d.png")
		slot19 = 90

		cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite).setRotation("plist_puke_color_small_%d.png", slot7)

		slot19 = 90

		cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite).setRotation("plist_puke_color_small_%d.png", slot8)

		slot19 = false

		cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite).setVisible("plist_puke_color_small_%d.png", slot7)

		slot19 = false

		cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite).setVisible("plist_puke_color_small_%d.png", slot8)

		slot19 = cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite)

		slot6.addChild("plist_puke_color_small_%d.png", slot6)

		slot19 = cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite)

		slot6.addChild("plist_puke_color_small_%d.png", slot6)

		slot9 = slot0.normalMap
	else
		slot15 = (slot1 == PUKE_JOKER_BIG and 1) or 0
		slot15 = string.format(slot13, "plist_puke_joker_small_%d.png")
		slot15 = 90

		cc.Sprite.createWithSpriteFrameName(slot13, cc.Sprite).setRotation(slot13, slot7)

		slot15 = false

		cc.Sprite.createWithSpriteFrameName(slot13, cc.Sprite).setVisible(slot13, slot7)

		slot15 = cc.Sprite.createWithSpriteFrameName(slot13, cc.Sprite)

		slot6.addChild(slot13, slot6)

		slot9 = slot0.map
	end

	slot11 = 0
	slot16 = slot6

	function slot26()
		slot0 = slot0 + 1

		if slot1[] == nil then
			slot4 = false

			slot2:setVisible(slot2)

			if slot2 then
				slot4 = false

				slot3.setVisible(slot2, slot3)
			end

			return
		end

		slot4 = slot0.val.v

		slot2:setVisible(slot2)

		if slot2 then
			slot4 = slot0.col.v

			slot3.setVisible(slot2, slot3)
		end

		if slot0.val.v then
			slot4 = slot0.val.p

			slot2:setPosition(slot2)

			slot4 = slot0.val.s

			slot2:setScale(slot2)

			slot4 = slot0.val.r

			slot2:setRotation(slot2)
		end

		if slot0.col.v and slot3 then
			slot4 = slot0.col.p

			slot3.setPosition(slot2, slot3)

			slot4 = slot0.col.s

			slot3.setScale(slot2, slot3)

			slot4 = slot0.col.r

			slot3.setRotation(slot2, slot3)
		end
	end

	slot23 = cc.CallFunc.create(slot24, cc.CallFunc)
	slot27 = 1 / slot4
	slot21 = slot5

	slot6.runAction(slot15, cc.Repeat.create(slot18, cc.Repeat, cc.Sequence.create(slot21, cc.Sequence, cc.DelayTime.create(cc.CallFunc, cc.DelayTime))))

	return slot6
end

slot2 = OpenPukeEffect
openPukeEffect = OpenPukeEffect.new(function (slot0, slot1, slot2, slot3)
	slot14 = 0.1
	slot6 = AnimationUtil.playEffectFromSpriteFrame(slot7, slot2, 1, slot5, slot3 or 20, 1, true)
	slot7, slot8 = nil
	slot9 = 
	slot10 = slot1 ~= PUKE_JOKER_BIG and slot1 ~= PUKE_JOKER_SMALL and slot1 ~= POKER_JOKER_BIG and slot1 ~= POKER_JOKER_SMALL

	if slot10 then
		slot14 = slot1
		slot18, slot12 = gameMgr.calPukeInfo(slot12, gameMgr)
		slot18 = slot12
		slot19 = string.format(slot15, "plist_puke_value_%d_%d.png", slot13)
		slot19 = string.format("plist_puke_value_%d_%d.png", "plist_puke_color_small_%d.png")
		slot19 = 90

		cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite).setRotation("plist_puke_color_small_%d.png", slot7)

		slot19 = 90

		cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite).setRotation("plist_puke_color_small_%d.png", slot8)

		slot19 = false

		cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite).setVisible("plist_puke_color_small_%d.png", slot7)

		slot19 = false

		cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite).setVisible("plist_puke_color_small_%d.png", slot8)

		slot19 = cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite)

		slot6.addChild("plist_puke_color_small_%d.png", slot6)

		slot19 = cc.Sprite.createWithSpriteFrameName("plist_puke_color_small_%d.png", cc.Sprite)

		slot6.addChild("plist_puke_color_small_%d.png", slot6)

		slot9 = slot0.normalMap
	else
		slot15 = (slot1 == PUKE_JOKER_BIG and 1) or 0
		slot15 = string.format(slot13, "plist_puke_joker_small_%d.png")
		slot15 = 90

		cc.Sprite.createWithSpriteFrameName(slot13, cc.Sprite).setRotation(slot13, slot7)

		slot15 = false

		cc.Sprite.createWithSpriteFrameName(slot13, cc.Sprite).setVisible(slot13, slot7)

		slot15 = cc.Sprite.createWithSpriteFrameName(slot13, cc.Sprite)

		slot6.addChild(slot13, slot6)

		slot9 = slot0.map
	end

	slot11 = 0
	slot16 = slot6

	function slot26()
		slot0 = slot0 + 1

		if slot1[] == nil then
			slot4 = false

			slot2:setVisible()

			if slot2 then
				slot4 = false

				slot3.setVisible(slot2, slot3)
			end

			return
		end

		slot4 = slot0.val.v

		slot2:setVisible()

		if slot2 then
			slot4 = slot0.col.v

			slot3.setVisible(slot2, slot3)
		end

		if slot0.val.v then
			slot4 = slot0.val.p

			slot2:setPosition()

			slot4 = slot0.val.s

			slot2:setScale()

			slot4 = slot0.val.r

			slot2:setRotation()
		end

		if slot0.col.v and slot3 then
			slot4 = slot0.col.p

			slot3.setPosition(slot2, slot3)

			slot4 = slot0.col.s

			slot3.setScale(slot2, slot3)

			slot4 = slot0.col.r

			slot3.setRotation(slot2, slot3)
		end
	end

	slot23 = cc.CallFunc.create(slot24, cc.CallFunc)
	slot27 = 1 / slot4
	slot21 = slot5

	slot6.runAction(slot15, cc.Repeat.create(slot18, cc.Repeat, cc.Sequence.create(slot21, cc.Sequence, cc.DelayTime.create(cc.CallFunc, cc.DelayTime))))

	return slot6
end)

return
