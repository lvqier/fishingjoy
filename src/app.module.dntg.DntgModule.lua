slot0 = class("DntgModule")

requireLuaFromModule("dntg.model.DntgModel")
requireLuaFromModule("dntg.model.DntgModel+Cannon")
requireLuaFromModule("dntg.model.DntgModel+Player")
requireLuaFromModule("dntg.controller.DntgController")
requireLuaFromModule("dntg.controller.DntgController+TimeService")
requireLuaFromModule("dntg.controller.DntgController+MathAide")
requireLuaFromModule("dntg.controller.DntgController+SoundManager")
requireLuaFromModule("dntg.view.DntgView")

DNTG_IS_SHIELDING_CLICKFIRE = true
DNTG_IS_SHIELDING_SPEEDUP = true
DNTG_IS_USE_WATER_WAVE = true
DNTG_CAN_CLICK_LOCK_FISH = false
DNTG_IS_UPDATE_CACHE = false
DNTG_SEND_LOCK_FISH_DELTA = 1
DNTG_LOW_ANGLE = 20
DNTG_LOW_ANGLE_RADION = (90 - DNTG_LOW_ANGLE) / 180 * 3.14
M_PI_2 = math.pi * 0.5
M_PI = math.pi
DNTG_EOS_OBJ = {
	EOS_HIT = 2,
	EOS_LIVE = 1,
	EOS_DEAD = 3,
	EOS_DESTORY = 4,
	EOS_LIGHTING = 5,
	EOS_INIT = 0
}
DNTG_VAT_TYPE = {
	VAT_SKELETON = 1,
	VAT_PARTICLE = 2,
	VAT_FRAME = 0,
	VAT_SKELETON_BINARY = 3
}
DNTG_PathMoveType = {
	PMT_CIRCLE = 2,
	PMT_STAY = 3,
	PMT_BEZIER = 1,
	PMT_LINE = 0
}
DNTG_SpecialFishType = {
	ESFT_NORMAL = 0,
	ESFT_MAX = 5,
	ESFT_KING = 1,
	ESFT_KINGANDQUAN = 2,
	ESFT_SIXI = 4,
	ESFT_SANYUAN = 3
}
DNTG_EffectType = {
	ETP_KILL = 1,
	ETP_ADDMONEY = 0,
	ETP_PRODUCE = 3,
	ETP_AWARD = 5,
	ETP_ADDBUFFER = 2,
	ETP_BLACKWATER = 4,
	ETF_NONE = -1
}

slot0.ctor = function (slot0)
	ClassUtil.extends(slot0, BaseGameModule, true)

	slot0.model = DntgModel.new()
	slot0.controller = DntgController.new(slot0.model)
	slot0.view = DntgView.new(slot0.model, slot0.controller)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	BaseGameModule.show(slot0, slot1, slot2, slot3, slot4, slot5)
end

ProxyDntg = slot0.new()

return ProxyDntg
