slot2 = "config.globalDefine"

FishingJoyRequireLua(slot1)

slot2 = "config.remoteConfig.FishingJoy_Proto"

FishingJoyRequireLua(slot1)

slot0 = FishingJoyRequireLua(slot1)
slot1 = FishingJoyRequireLua("config.localConfig.FishingJoy_Fish")
slot2 = FishingJoyRequireLua("config.localConfig.FishingJoy_Cannon")
slot3 = FishingJoyRequireLua("config.localConfig.FishingJoy_Special")
slot4 = FishingJoyRequireLua("config.localConfig.FishingJoy_LocalRes")
slot5 = FishingJoyRequireLua("config.localConfig.FishingJoy_Duration")
slot6 = FishingJoyRequireLua("config.localConfig.FishingJoy_FishRender")
slot7 = FishingJoyRequireLua("config.localConfig.FishingJoy_RenderOrder")
slot8 = FishingJoyRequireLua("config.localConfig.FishingJoy_BoundingBox")
slot9 = FishingJoyRequireLua("config.localConfig.FishingJoy_PathCtlPoint")
slot12 = "config.localConfig.FishingJoy_TroopPathCtlPoint"
slot10 = FishingJoyRequireLua("config.localConfig.FishingJoy_TroopDuration")

function FishingJoy_LocalRes_GetResConfig()
	if FISHINGJOY_ANDROID_PLATFORM then
		slot2 = slot0.shadowConfig

		for slot3, slot4 in ipairs(slot1) do
			slot0.processConfig[#slot0.processConfig + 1] = slot4
		end
	end

	return slot0.processConfig
end

function FishingJoy_LocalRes_GetRoomSpine(slot0)
	return slot0.roomSpine[slot0]
end

function FishingJoy_LocalRes_GetBossComingTips()
	return slot0.resourcePath.bossComingTips.getFileName()
end

function FishingJoy_LocalRes_GetFishGroupComingTips()
	return slot0.resourcePath.fishGroupComingTips.getFileName()
end

function FishingJoy_LocalRes_GetBingoBg()
	return slot0.resourcePath.bingo.bgPng
end

function FishingJoy_LocalRes_GetBingoFntSelf()
	return slot0.resourcePath.bingo.fntSelf
end

function FishingJoy_LocalRes_GetBingoFntOther()
	return slot0.resourcePath.bingo.fntOther
end

function FishingJoy_LocalRes_GetHitFishFntSelf()
	return slot0.resourcePath.hitFish.fntSelf
end

function FishingJoy_LocalRes_GetHitFishFntOther()
	return slot0.resourcePath.hitFish.fntOther
end

function FishingJoy_LocalRes_GetGoldPlistSelf()
	return slot0.resourcePath.gold.plistSelf.fileName, slot0.resourcePath.gold.plistSelf.saveKey, slot0.resourcePath.gold.plistSelf.frameCount, slot0.resourcePath.gold.plistSelf.frameName
end

function FishingJoy_LocalRes_GetGoldPlistOther()
	return slot0.resourcePath.gold.plistOther.fileName, slot0.resourcePath.gold.plistOther.saveKey, slot0.resourcePath.gold.plistOther.frameCount, slot0.resourcePath.gold.plistOther.frameName
end

function FishingJoy_LocalRes_GetKillFishScoreFnt()
	return slot0.resourcePath.killFishScoreFtn.fileName
end

function FishingJoy_LocalRes_GetCannonFileName()
	return slot0.resourcePath.cannon.fileName
end

function FishingJoy_LocalRes_GetCannonAnimationFileName()
	return slot0.resourcePath.cannon.animationFileName()
end

function FishingJoy_LocalRes_GetCannonAnimationParticle1()
	return slot0.resourcePath.cannon.animationParticle1
end

function FishingJoy_LocalRes_GetCannonAnimationParticle2()
	return slot0.resourcePath.cannon.animationParticle2
end

function FishingJoy_LocalRes_GetEffect_Shandianxianjie()
	return slot0.resourcePath.effect.shandianxianjie
end

function FishingJoy_LocalRes_GetEffect_Shandianliansuo()
	return slot0.resourcePath.effect.shandianliansuo
end

function FishingJoy_LocalRes_GetEffect_FrezonPng()
	return slot0.resourcePath.effect.frezonPng
end

function FishingJoy_LocalRes_GetEffect_FrezonPlist()
	return slot0.resourcePath.effect.frezonPlist
end

function FishingJoy_LocalRes_GetEffect_FoShou()
	return slot0.resourcePath.effect.foshou
end

function FishingJoy_LocalRes_GetParticle_BoomEffect(slot0)
	if slot0 == "yuboombeffect" then
		return slot0.resourcePath.particle.getyuboombeffect()
	elseif slot0 == "yuboomceffect" then
		return slot0.resourcePath.particle.getyuboomceffect()
	end
end

function FishingJoy_LocalRes_GetParticle_BoomParticle()
	return slot0.resourcePath.particle.getyuboomdeffect()
end

function FishingJoy_LocalRes_GetExitBattleNoFireTxt()
	return slot0.txtEnum.exitBattleNoFire
end

function FishingJoy_LocalRes_GetMoneyNotEnoughTxt()
	return slot0.txtEnum.moneyNotEnough
end

function FishingJoy_LocalRes_GetMoneyNotEnough2Txt()
	return slot0.txtEnum.moneyNotEnough2
end

function FishingJoy_LocalRes_GetBulletTooMuchTxt()
	return slot0.txtEnum.bulletTooMuch
end

function FishingJoy_Fish_GetFishConfig(slot0)
	return slot0[slot0]
end

function FishingJoy_Cannon_GetCannonLocalConfig()
	return slot0.CannonPosition
end

function FishingJoy_Cannon_GetCannonPosition(slot0)
	return slot0.CannonPosition[slot0].seatPosition
end

function slot11(slot0)
	return slot0.CannonRes.Normal[slot0]
end

function slot12(slot0)
	return slot0.CannonRes.Power[slot0]
end

function FishingJoy_Cannon_GetCannonConfig(slot0, slot1)
	if slot0 == 0 then
		if slot1 >= 6 then
			slot4 = 3

			return slot0(slot3)
		elseif slot1 >= 3 then
			slot4 = 2

			return slot0(slot3)
		else
			slot4 = 1

			return slot0(slot3)
		end
	elseif slot0 == 1 then
		if slot1 >= 6 then
			slot4 = 3

			return slot1(slot3)
		elseif slot1 >= 3 then
			slot4 = 2

			return slot1(slot3)
		else
			slot4 = 1

			return slot1(slot3)
		end
	end

	slot4 = 1

	return slot0(slot3)
end

function FishingJoy_Specila_GetFishKingConfig(slot0)
	return slot0.FishKing[slot0]
end

function FishingJoy_FishRender_GetFishRenderData(slot0)
	return slot0[slot0]
end

function FishingJoy_RenderOrder_GetRenderOrder(slot0)
	return slot0[slot0]
end

function FishingJoy_BoundingBox_GetBoundingBoxData(slot0)
	return slot0[slot0]
end

function FishingJoy_Path_GetPathDataAndDuration(slot0, slot1)
	if slot0 then
		return slot0[slot1], slot1[slot1]
	else
		return slot2[slot1 + 1], slot1 + 1[slot1 + 1]
	end
end

return
