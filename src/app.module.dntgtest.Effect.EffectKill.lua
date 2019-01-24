slot4 = import(slot1)
slot1 = class(".Effect", "EffectKill")

slot1.ctor = function (slot0)
	slot3 = slot0

	slot0.super.ctor(slot2)

	slot4 = DNTGTEST_EFFECT_TYPE.KILL

	slot0.SetEffectType(slot2, slot0)

	slot0.m_nParamCount = 3
end

slot1.GetParamSize = function (slot0)
	return slot0.m_nParamCount
end

slot1.Execute = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == nil then
		return 0, slot3
	end

	slot6 = 0
	slot7 = nil

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot10 = fishgame.FishObjectManager
		slot10 = fishgame.FishObjectManager.GetInstance(slot9)
		slot7 = fishgame.FishObjectManager.GetInstance(slot9).GetAllFishes(slot9)
	else
		slot10 = slot1
		slot10 = slot1.GetFishObjectManager(slot9)
		slot7 = slot1.GetFishObjectManager(slot9).GetAllFishes(slot9)
	end

	slot11 = 0
	slot8 = slot0.GetParam(slot9, slot0)
	slot9 = slot1.GetId(slot0)
	slot10 = slot1:GetPosition()
	slot11 = slot1:GetRefershID()
	slot12 = slot1:GetTypeID()
	slot15 = slot7

	for slot16, slot17 in pairs(slot1) do
		slot20 = slot17

		if slot17.GetId(slot19) ~= slot9 then
			slot20 = slot17

			if slot17.GetState(slot19) < DNTGTEST_OBJ_STATE.EOS_DEAD then
				if slot8 == 0 then
					slot20 = slot17

					if slot17.InSideScreen(slot19) then
						slot20 = slot17
						slot20 = slot17.GetMoveCompent(slot19)

						if slot17.GetMoveCompent(slot19).HasBeginMove(slot19) then
							slot24 = DNTGTEST_OVER_BY_EFFECT
							slot18, slot19 = slot17.ExecuteEffects(slot19, slot17, slot2, slot3, slot4)
							slot6 = slot6 + slot18

							if not DNTGTEST_IS_ANDROID_PLATFORM and DNTGTEST_OVER_BY_BULLET == slot5 then
								slot24 = {
									lightType = "KillAllFish",
									beginPos = slot10,
									endPos = slot17.GetPosition(slot26)
								}
								slot27 = slot17

								eventMgr.dispatch(slot21, eventMgr, "EffectKillFish")

								slot3 = slot19
							end
						end
					end
				elseif slot8 == 1 then
					slot20 = slot17

					if slot17.InSideScreen(slot19) then
						slot20 = slot17
						slot20 = slot17.GetMoveCompent(slot19)

						if slot17.GetMoveCompent(slot19).HasBeginMove(slot19) then
							slot22 = slot17
							slot26 = 1

							if math.sqrt(slot23) < slot0.GetParam((slot10.x - slot17.GetPosition(slot20).x) * () + (slot10.y - slot17:GetPosition().y) * (), slot0) then
								slot28 = DNTGTEST_OVER_BY_EFFECT
								slot22, slot23 = slot17.ExecuteEffects(slot23, slot17, slot2, slot3, slot4)
								slot6 = slot6 + slot22

								if not DNTGTEST_IS_ANDROID_PLATFORM and DNTGTEST_OVER_BY_BULLET == slot5 then
									slot28 = {
										lightType = "KillRangeFish",
										beginPos = slot10,
										endPos = slot17.GetPosition(slot30)
									}
									slot31 = slot17

									eventMgr.dispatch(slot25, eventMgr, "EffectKillFish")

									slot3 = slot23
								end
							end
						end
					end
				elseif slot8 == 2 then
					slot20 = slot17

					if slot17.InSideScreen(slot19) then
						slot20 = slot17
						slot20 = slot17.GetMoveCompent(slot19)

						if slot17.GetMoveCompent(slot19).HasBeginMove(slot19) then
							slot21 = 1
							slot21 = slot17

							if slot0.GetParam(slot19, slot0) == slot17.GetTypeID(slot0) then
								slot20 = slot17

								if slot17.GetFishType(slot19) == DNTGTEST_SPECIAL_FISH_TYPE.NORMAL then
									slot24 = DNTGTEST_OVER_BY_EFFECT
									slot18, slot19 = slot17.ExecuteEffects(slot19, slot17, slot2, slot3, slot4)
									slot6 = slot6 + slot18

									if not DNTGTEST_IS_ANDROID_PLATFORM and DNTGTEST_OVER_BY_BULLET == slot5 then
										slot24 = {
											lightType = "KillSpecialFish",
											beginPos = slot10,
											endPos = slot17.GetPosition(slot26)
										}
										slot27 = slot17

										eventMgr.dispatch(slot21, eventMgr, "EffectKillFish")

										slot3 = slot19
									end
								end
							end
						end
					end
				elseif slot8 == 3 then
					slot20 = slot17

					if slot17.GetRefershID(slot19) == slot11 then
						slot20 = slot17

						if slot17.InSideScreen(slot19) then
							slot20 = slot17
							slot20 = slot17.GetMoveCompent(slot19)

							if slot17.GetMoveCompent(slot19).HasBeginMove(slot19) then
								slot18 = slot5
								slot25 = (slot12 < 200 or slot12 >= 300 or DNTGTEST_OVER_BY_BULLET) and slot5
								slot19, slot20 = slot17.ExecuteEffects(slot20, slot17, slot2, slot3, slot4)
								slot6 = slot6 + slot19

								if not DNTGTEST_IS_ANDROID_PLATFORM and DNTGTEST_OVER_BY_BULLET == slot18 then
									slot25 = {
										lightType = "KillSameRefreshIDFish",
										beginPos = slot10,
										endPos = slot17.GetPosition(slot27)
									}
									slot28 = slot17

									eventMgr.dispatch(slot22, eventMgr, "EffectKillFish")

									slot3 = slot20
								end
							end
						else
							slot21 = DNTGTEST_OBJ_STATE.EOS_DEAD

							slot17.SetState(slot19, slot17)
						end
					end
				end
			end
		end
	end

	slot17 = 2

	if slot0.GetParam(slot2, slot0) < slot6 / slot2.GetScore(slot14) then
		slot17 = 2
		slot6 = slot2.GetScore(slot14) * slot0.GetParam(slot2, slot0)
	end

	return slot6, slot3
end

return slot1
