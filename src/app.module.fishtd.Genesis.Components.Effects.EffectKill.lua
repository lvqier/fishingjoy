slot0 = 0
slot1 = 1
slot2 = 2
slot3 = 3

class_C("EffectKill", ClassLoader:aquireClass("Effect")).execute = function (slot0)
	slot1 = slot0:getValue("owner")
	slot3 = slot1:getValue("id")
	slot4 = slot1:getValue("typeId")
	slot5 = slot1:getValue("refreshId")
	slot6 = ClassLoader:aquireSingleton("GameConfig")
	slot7 = slot1:getValue("bonePosition")
	slot9 = slot0:getValue("effectParam")[2]

	for slot13, slot14 in pairs(slot2) do
		slot16 = slot14:getValue("id")
		slot17 = slot14:getValue("typeId")
		slot19 = slot6:mirrorPosition(PathMath.projectToViewPlane(slot14:getValue("position")))

		if not slot14:getValue("isDead") and slot16 ~= slot3 and slot6:isFishInScreen(slot19) then
			slot20 = {
				noEffect = true,
				dwFishID = slot16
			}

			if slot9 == slot0 then
				slot0._world:triggerEvent(EventFish3D.EventFish3D_Dispatch_Lighting_Chain, {
					startX = slot7.x,
					startY = slot7.y,
					endX = slot19.x,
					endY = slot19.y,
					effectType = LightingType.LightingType_Red
				})
				slot0._world:triggerEvent("FISH3D_CMD_S_KILL_FISH", slot20)
			elseif slot9 == slot1 then
				if math.sqrt((slot7.x - slot19.x) * (slot7.x - slot19.x) + (slot7.y - slot19.y) * (slot7.y - slot19.y)) <= slot8[3] then
					slot0._world:triggerEvent(EventFish3D.EventFish3D_Dispatch_Lighting_Chain, {
						startX = slot7.x,
						startY = slot7.y,
						endX = slot19.x,
						endY = slot19.y,
						effectType = LightingType.LightingType_Red
					})
					slot0._world:triggerEvent("FISH3D_CMD_S_KILL_FISH", slot20)
				end
			elseif slot9 == slot2 then
				if slot17 == slot8[3] then
					slot0._world:triggerEvent(EventFish3D.EventFish3D_Dispatch_Lighting_Chain, {
						startX = slot7.x,
						startY = slot7.y,
						endX = slot19.x,
						endY = slot19.y,
						effectType = LightingType.LightingType_Blue
					})
					slot0._world:triggerEvent("FISH3D_CMD_S_KILL_FISH", slot20)
				end
			elseif slot9 == slot3 and slot14:getValue("refreshId") == slot5 then
				slot0._world:triggerEvent(EventFish3D.EventFish3D_Dispatch_Lighting_Chain, {
					startX = slot7.x,
					startY = slot7.y,
					endX = slot19.x,
					endY = slot19.y,
					effectType = LightingType.LightingType_Light
				})
				slot0._world:triggerEvent("FISH3D_CMD_S_KILL_FISH", slot20)
			end
		end
	end
end

return class_C("EffectKill", ClassLoader.aquireClass("Effect"))
