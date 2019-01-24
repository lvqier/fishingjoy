function LhdGetBetScoreConfig(slot0)
	return (LHD_BET_SCORE_CONFIG[slot0 or gameMgr:getCurRoomKind()] == nil and LHD_BET_SCORE_CONFIG[1]) or LHD_BET_SCORE_CONFIG[slot0 or gameMgr.getCurRoomKind()]
end

function LhdGetBetSpRes(slot0)
	if slot0 == nil then
		return nil
	end

	return LHD_FLY_BET_SP_CONFIG[slot0], LHD_FLY_BET_STR_CONFIG[slot0]
end

return
