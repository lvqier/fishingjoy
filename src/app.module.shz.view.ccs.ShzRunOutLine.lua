ShzRunOutLine = class("ShzRunOutLine")

ShzRunOutLine.ctor = function (slot0)
	ClassUtil.extends(slot0, AbstractBean)
	ClassUtil.extends(slot0, TickBase)
end

slot0 = nil
slot1 = 0
slot2 = 1
slot3 = 2
slot4 = 3
slot5 = {
	JOIN = 4,
	CORNER = 3,
	TOP = 2,
	LEFT = 1,
	NONE = 0
}

function build_slot(slot0, slot1)
	return {
		GROUP_ID = 0,
		LIT_UP = false,
		[slot0] = {},
		[slot1] = {},
		[slot2] = {},
		[slot2] = {}
	}
end

function init_outline(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot6[slot0].node = sp.SkeletonAnimation:createWithJsonFile(slot7 .. "shz_kuang1.json", slot7 .. "shz_kuang1.atlas", 1)

	slot6[slot0].node:setScale(1)
	slot6[slot0].node:setVisible(false)
	slot6[slot0].node:retain()
	slot6[slot0].node:setPosition(cc.p(slot0 + slot2 * slot5 + slot2 * 0.5, slot1 - slot3 * slot4))

	slot6[slot1].node = sp.SkeletonAnimation:createWithJsonFile(slot7 .. "shz_kuang2.json", slot7 .. "shz_kuang2.atlas", 1)

	slot6[slot1].node:setScale(1)
	slot6[slot1].node:setVisible(false)
	slot6[slot1].node:retain()
	slot6[slot1].node:setPosition(cc.p(slot0 + slot2 * slot5 + slot2, slot1 - slot3 * slot4 - slot3 * 0.5))

	slot6[slot2].node = sp.SkeletonAnimation:createWithJsonFile(slot7 .. "shz_kuang3.json", slot7 .. "shz_kuang3.atlas", 1)

	slot6[slot2].node:setScale(1)
	slot6[slot2].node:setVisible(false)
	slot6[slot2].node:retain()
	slot6[slot2].node:setPosition(cc.p(slot0 + slot2 * slot5 + slot2 * 0.5, slot1 - slot3 * slot4 - slot3))

	slot6[slot3].node = sp.SkeletonAnimation:createWithJsonFile(slot7 .. "shz_kuang4.json", slot7 .. "shz_kuang4.atlas", 1)

	slot6[slot3].node:setScale(1)
	slot6[slot3].node:setVisible(false)
	slot6[slot3].node:retain()
	slot6[slot3].node:setPosition(cc.p(slot0 + slot2 * slot5, slot1 - slot3 * slot4 - slot3 * 0.5))
end

function init_slot(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot6.node = cc.DrawNode:create()

	slot6.node:retain()

	slot6.startPoint = cc.p(slot0 + slot2 * slot5, slot1 - slot3 * slot4)
	slot6.endPoint = cc.p(slot0 + slot2 * (slot5 + 1), slot1 - slot3 * (slot4 + 1))

	slot6.node:drawSolidRect(slot6.startPoint, slot6.endPoint, cc.c4f(1, 1, 1, 0.7))
	slot6.node:setVisible(false)
end

function build_machine()
	slot0 = {}

	for slot4 = 0, 14, 1 do
		slot0[slot4] = build_slot()
	end

	for slot4 = 0, 2, 1 do
		for slot8 = 0, 4, 1 do
			init_slot(0, 480, 226, 160, slot4, slot8, get_this(slot4, slot8, slot0))
			init_outline(0, 480, 226, 160, slot4, slot8, get_this(slot4, slot8, slot0))
		end
	end

	slot0.size = 15

	return slot0
end

function run_machine(slot0)
	for slot5 = 1, math.random(3, 14), 1 do
		slot6 = math.random(0, 14)

		while slot0[slot6].LIT_UP do
			slot6 = math.random(0, 14)
		end

		slot0[slot6].LIT_UP = true

		slot0[slot6].node:clear()
		slot0[slot6].node:drawSolidRect(slot0[slot6].startPoint, slot0[slot6].endPoint, cc.c4f(0, 0, 1, 0.7))
	end
end

function reset_machine(slot0)
	for slot4 = 0, 14, 1 do
		slot0[slot4].LIT_UP = false
		slot0[slot4].GROUP_ID = 0

		slot0[slot4][slot0].node:removeFromParent()

		slot0[slot4][slot0].nxt = nil
		slot0[slot4][slot0].prev = nil

		slot0[slot4][slot1].node:removeFromParent()

		slot0[slot4][slot1].nxt = nil
		slot0[slot4][slot1].prev = nil

		slot0[slot4][slot2].node:removeFromParent()

		slot0[slot4][slot2].nxt = nil
		slot0[slot4][slot2].prev = nil

		slot0[slot4][slot3].node:removeFromParent()

		slot0[slot4][slot3].nxt = nil
		slot0[slot4][slot3].prev = nil
	end
end

function get_top(slot0, slot1, slot2)
	if slot0 - 1 < 0 then
		return
	end

	return slot2[(slot0 - 1) * 5 + slot1]
end

function get_right(slot0, slot1, slot2)
	if slot1 + 1 > 4 then
		return
	end

	return slot2[slot0 * 5 + slot1 + 1]
end

function get_down(slot0, slot1, slot2)
	if slot0 + 1 < 0 then
		return
	end

	return slot2[(slot0 + 1) * 5 + slot1]
end

function get_left(slot0, slot1, slot2)
	if slot1 - 1 < 0 then
		return
	end

	return slot2[(slot0 * 5 + slot1) - 1]
end

function get_this(slot0, slot1, slot2)
	return slot2[slot0 * 5 + slot1]
end

function check_surrounding(slot0, slot1, slot2)
	slot3 = get_left(slot0, slot1, slot2)
	slot5 = {
		type = slot0.NONE
	}

	if get_top(slot0, slot1, slot2) and slot4.LIT_UP then
		slot5[slot1] = slot4
		slot5.type = slot0.TOP
	end

	if slot3 and slot3.LIT_UP then
		slot5[slot2] = slot3

		if slot5.type == slot0.NONE then
			slot5.type = slot0.LEFT
		elseif slot4.GROUP_ID == slot3.GROUP_ID then
			slot5.type = slot0.CORNER
		else
			slot5.type = slot0.JOIN
		end
	end

	return slot5
end

function create_group(slot0, slot1)
	slot0.key = slot0.key + 1
	slot0[slot0.key] = {
		slot1,
		size = 1,
		head = slot1[slot0],
		rear = slot1[slot1]
	}
	slot1.GROUP_ID = slot0.key
	slot1[slot0].nxt = slot1[slot2]
	slot1[slot1[slot0]].prev = slot1[slot0]
	slot1[slot1[slot1[slot0]]].nxt = slot1[slot1[slot0]]
	slot1[slot3].prev = slot1[slot2]
	slot1[slot3].nxt = slot1[slot1]
	slot1[slot1].prev = slot1[slot1[slot1]]
end

function merge_edge(slot0, slot1, slot2)
	if slot1.type == slot0.TOP then
		slot1[slot1][slot2].prev.nxt = slot2[slot3]
		slot2[slot3].prev = slot1[slot1][slot2].prev
		slot2[slot3].nxt = slot2[slot2]
		slot2[slot2].prev = slot2[slot3]
		slot2[slot2].nxt = slot2[slot4]
		slot2[slot4].prev = slot2[slot2]
		slot2[slot4].nxt = slot1[slot1][slot2].nxt
		slot1[slot1][slot2].nxt.prev = slot2[slot4]
		slot0[slot1[slot1].GROUP_ID].size = slot0[slot1[slot1].GROUP_ID].size + 1
		slot0[slot1[slot1].GROUP_ID][slot0[slot1[slot1].GROUP_ID].size] = slot2
		slot2.GROUP_ID = slot1[slot1].GROUP_ID
	elseif slot1.type == slot0.LEFT then
		slot1[slot4][slot3].prev.nxt = slot2[slot1]
		slot2[slot1].prev = slot1[slot4][slot3].prev
		slot2[slot1].nxt = slot2[slot3]
		slot2[slot3].prev = slot2[slot1]
		slot2[slot3].nxt = slot2[slot2]
		slot2[slot2].prev = slot2[slot3]
		slot2[slot2].nxt = slot1[slot4][slot3].nxt
		slot1[slot4][slot3].nxt.prev = slot2[slot2]
		slot0[slot1[slot4].GROUP_ID].size = slot0[slot1[slot4].GROUP_ID].size + 1
		slot0[slot1[slot4].GROUP_ID][slot0[slot1[slot4].GROUP_ID].size] = slot2
		slot2.GROUP_ID = slot1[slot4].GROUP_ID
	end
end

function merge_corner(slot0, slot1, slot2)
	if slot1[slot0][slot2].nxt ~= slot1[slot1][slot3] then
		slot0.key = slot0.key + 1
		slot0[slot0.key] = {
			size = 0,
			head = slot3[slot1]
		}
	end

	slot3[slot2].prev.nxt = slot2[slot3]
	slot2[slot3].prev = slot3[slot2].prev
	slot2[slot3].nxt = slot2[slot2]
	slot2[slot2].prev = slot2[slot3]
	slot2[slot2].nxt = slot4[slot3].nxt
	slot4[slot3].nxt.prev = slot2[slot2]
	slot0[slot3.GROUP_ID].size = slot0[slot3.GROUP_ID].size + 1
	slot0[slot3.GROUP_ID][slot0[slot3.GROUP_ID].size] = slot2
	slot3[slot2].prev = nil
	slot3[slot2].nxt = nil
	slot4[slot3].prev.nxt = nil
	slot4[slot3].nxt = nil
	slot4[slot3].prev = nil
	slot2.GROUP_ID = slot3.GROUP_ID
end

function merge_and_join(slot0, slot1, slot2)
	slot1.type = slot0.TOP

	merge_edge(slot0, slot1, slot2)

	slot1[slot1][slot2].prev.nxt = slot2[slot1].nxt
	slot2[slot1].nxt.prev = slot1[slot1][slot2].prev
	slot1[slot1][slot2].nxt.prev = slot2[slot1].prev
	slot2[slot1].prev.nxt = slot1[slot1][slot2].nxt
	slot7 = slot0[slot1[slot1].GROUP_ID]
	slot0[slot2.GROUP_ID] = nil
	slot0[slot2.GROUP_ID].head.prev = slot0[slot2.GROUP_ID].rear
	slot0[slot2.GROUP_ID].rear.nxt = slot0[slot2.GROUP_ID].head

	for slot11 = 1, slot0[slot2.GROUP_ID].size, 1 do
		slot7.size = slot7.size + 1
		slot7[slot7.size] = slot6[slot11]
		slot6[slot11].GROUP_ID = slot3.GROUP_ID
	end
end

function get_outline(slot0)
	slot1 = {
		key = 0
	}

	for slot5 = 0, 2, 1 do
		for slot9 = 0, 4, 1 do
			if get_this(slot5, slot9, slot0).LIT_UP then
				if check_surrounding(slot5, slot9, slot0).type == slot0.NONE then
					print("NONE")
					create_group(slot1, get_this(slot5, slot9, slot0))
				elseif slot11.type == slot0.CORNER then
					print("CORNER")
					merge_corner(slot1, slot11, slot10)
				elseif slot11.type == slot0.JOIN then
					print("JOIN")
					merge_and_join(slot1, slot11, slot10)
				else
					print("EDGE")
					merge_edge(slot1, slot11, slot10)
				end
			end
		end
	end

	return slot1
end

function draw_outline(slot0, slot1)
	slot2 = 0

	for slot6 = 1, slot0.key, 1 do
		if slot0[slot6] then
			slot8 = slot7.head
			slot9 = 0

			while slot8 do
				slot1:addChild(slot8.node)

				slot10 = slot8.node

				slot8.node:runAction(cc.Sequence:create(cc.DelayTime:create(0.025 * slot9), cc.CallFunc:create(function ()
					slot0:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
						slot0:setVisible(true)
						slot0.setVisible:setAnimation(0, "start", false)
						slot0.setVisible.setAnimation:setTimeScale(3)
						slot0.setVisible.setAnimation.setTimeScale:update(0.016)
					end), cc.DelayTime:create(0.33), cc.CallFunc:create(function ()
						slot0:setTimeScale(1)
						slot0.setTimeScale:addAnimation(0, "idle", true)
					end), cc.DelayTime:create(2), cc.CallFunc:create(function ()
						if slot0 - 1 == 0 then
						end
					end)))
				end)))

				slot8 = slot8.nxt
				slot9 = slot9 + 1
				slot2 = slot2 + 1
			end
		end
	end
end

return
