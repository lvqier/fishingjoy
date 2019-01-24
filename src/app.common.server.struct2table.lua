slot3 = package.seeall

module(slot1, "FfiStructTables")

ZJH_CMD_S_Brand = {
	cbCardData = {
		_t = 1,
		_l = {
			5,
			3
		}
	}
}
ZJH_CMD_S_SendCard = {
	cbCardData = {
		_t = 1,
		_l = {
			5,
			3
		}
	}
}
ZJH_CMD_S_GiveUp = {
	wGiveUpUser = 1,
	cbCardData = {
		_t = 1,
		_l = {
			3
		}
	}
}
ZJH_CMD_S_AddScore = {
	bIsOpenCard = 3,
	nCurRounds = 1,
	wAddScoreUser = 1,
	wCompareState = 1,
	wCurrentUser = 1,
	bIsAllIn = 1,
	lCurrentTimes = 1,
	lAddScoreCount = 1
}
ZJH_CMD_C_AddScore = {
	lScore = 1,
	wState = 1,
	bIsAllIn = 1
}
ZJH_CMD_S_LookCard = {
	wLookCardUser = 1,
	cbCardData = {
		_t = 1,
		_l = {
			3
		}
	}
}
ZJH_CMD_C_CompareCard = {
	wCompareUser = 1
}
ZJH_CMD_S_GameEnd = {
	wEndState = 1,
	lGameTax = 1,
	lGameScore = {
		_t = 1,
		_l = {
			5
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			5,
			3
		}
	},
	wCompareUser = {
		_t = 1,
		_l = {
			5,
			4
		}
	},
	wOpenUser = {
		_t = 1,
		_l = {
			5
		}
	}
}
ZJH_CMD_S_CompareCard = {
	wCurrentUser = 1,
	wLostUser = 1,
	wCompareUser = {
		_t = 1,
		_l = {
			2
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			3
		}
	}
}
ZJH_CMD_S_CompareCardNoMoney = {
	wCount = 1,
	compareCard = {
		_t = "ZJH_CMD_S_CompareCard",
		_l = {
			4
		}
	}
}
ZJH_CMD_S_Config = {
	bNoAllIn = 3,
	lMaxCellScore = 1
}
ZJH_CMD_S_GameStart = {
	lUserMaxScore = 1,
	lCurrentTimes = 1,
	wBankerUser = 1,
	wCurrentUser = 1,
	lCellScore = 1,
	nMaxRounds = 1,
	lMaxScore = 1
}
ZJH_CMD_S_StatusFree = {
	lCellScore = 1
}
ZJH_CMD_S_WaitCompare = {
	wCompareUser = 1
}
ZJH_CMD_S_GetAllCard = {
	cbCardData = {
		_t = 1,
		_l = {
			5,
			3
		}
	}
}
ZJH_CMD_S_OpenCard = {
	wWinner = 1
}
ZJH_CMD_S_ShowCard = {
	wShowUser = 1,
	cbCardData = {
		_t = 1,
		_l = {
			3
		}
	}
}
ZJH_CMD_S_StatusPlay = {
	lUserMaxScore = 1,
	bIsAllIn = 3,
	lMaxCellScore = 1,
	lAllInScore = 1,
	lCellScore = 1,
	bCompareState = 3,
	nLastSeconds = 1,
	nCurRounds = 1,
	nMaxRounds = 1,
	wBankerUser = 1,
	wCurrentUser = 1,
	lCurrentTimes = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			5
		}
	},
	bMingZhu = {
		_t = 3,
		_l = {
			5
		}
	},
	lTableScore = {
		_t = 1,
		_l = {
			5
		}
	},
	lUserJetton = {
		_t = 1,
		_l = {
			5,
			30
		}
	},
	wUserJettonTimes = {
		_t = 1,
		_l = {
			5,
			30
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			3
		}
	}
}
ZJH_CMD_S_PlayerExit = {
	wPlayerID = 1
}
ZJH_CMD_C_AutoScore = {
	wState = 1
}
ZJH_CMD_C_ClientError = {
	wIndex = 1
}
SH_CMD_S_KongZhi = {
	cbCard = 1,
	cbIndex = 1
}
SH_CMD_S_GiveUp = {
	wUserChairID = 1
}
SH_CMD_C_LookCard = {
	dwUserID = 1
}
SH_CMD_S_GameStart = {
	bProSet = 3,
	lMaxGold = 1,
	lBasicGold = 1,
	cbUsrCount = 1,
	wCurrentUser = 1,
	lTurnBasicGold = 1,
	lTurnMaxGold = 1,
	lGameType = 1,
	lHandCard = 1,
	cbObscureCard = 1,
	bCardData = {
		_t = 1,
		_l = {
			2
		}
	},
	cbCardDataToAndRoid = {
		_t = 1,
		_l = {
			2,
			5
		}
	}
}
SH_CMD_C_AddScore = {
	lScore = 1,
	cbTimes = 1,
	nServriValue = 1
}
SH_CMD_S_GameEnd = {
	lGameTax = {
		_t = 1,
		_l = {
			2
		}
	},
	lGameGold = {
		_t = 1,
		_l = {
			2
		}
	},
	bUserCard = {
		_t = 1,
		_l = {
			2
		}
	}
}
SH_CMD_S_LookCard = {
	dwUserID = 1
}
SH_CMD_C_GetWinner = {
	dwUserID = 1
}
SH_CMD_C_KongZhi = {
	cbCard = 1,
	nServalValue = 1
}
SH_CMD_S_AddScore = {
	wLastChairID = 1,
	lCurrentLessGold = 1,
	wCurrentUser = 1,
	lLastAddGold = 1,
	cbTimes = 1
}
SH_CMD_S_ScoreOption = {
	lMaxScore = 1,
	lBlackCount = 1,
	lMaxWinScore = 1,
	lMaxLoseScore = 1,
	lUserCount = 1
}
SH_CMD_S_StatusPlay = {
	cbUsrCount = 1,
	lMaxScore = 1,
	lCellScore = 1,
	bCanShowHand = 3,
	bAddScore = 1,
	lTurnLessScore = 1,
	bShowHand = 1,
	lTurnMaxScore = 1,
	wCurrentUser = 1,
	lGameType = 1,
	lHandCard = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			2
		}
	},
	lTableScore = {
		_t = 1,
		_l = {
			4
		}
	},
	cbCardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			2,
			5
		}
	},
	lTurnScore = {
		_t = 1,
		_l = {
			2
		}
	},
	lCollectScore = {
		_t = 1,
		_l = {
			2
		}
	}
}
SH_CMD_S_SendCard = {
	wStartChairId = 1,
	cbSendCardCount = 1,
	lMaxGold = 1,
	wCurrentUser = 1,
	lTurnLessScore = 1,
	bUserCard = {
		_t = 1,
		_l = {
			2,
			2
		}
	}
}
SH_CMD_C_ScoreInfo = {
	lScore = 1
}
SH_CMD_C_UserIDInfo = {
	dwUserID = 1
}
SH_CMD_S_StatusFree = {
	lHandCard = 1,
	lGameType = 1,
	lCellScore = 1,
	lTurnScore = {
		_t = 1,
		_l = {
			2
		}
	},
	lCollectScore = {
		_t = 1,
		_l = {
			2
		}
	}
}
CMD_C_Ox4_AdminFloatEnableUpdate = {
	cbEnable = 1
}
CMD_C_Ox4_AdminStorageUpdate = {
	lStorage = 1,
	nStorageDeduct = 1
}
CMD_C_Ox4_AddScore = {
	lScore = 1,
	nServriValue = 1
}
CMD_S_Ox4_AddScore = {
	wAddScoreUser = 1,
	lAddScoreCount = 1
}
CMD_S_Ox4_CallBanker = {
	bFirstTimes = 3,
	wCallBanker = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			4
		}
	}
}
CMD_S_Ox4_StatusPlay = {
	lTurnMaxScore = 1,
	wBankerUser = 1,
	lTableScore = {
		_t = 1,
		_l = {
			4
		}
	},
	cbPlayStatus = {
		_t = 1,
		_l = {
			4
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			4,
			5
		}
	},
	bOxCard = {
		_t = 1,
		_l = {
			4
		}
	}
}
CMD_S_Ox4_AdminStorage = {
	lStorage = 1,
	nStorageDeduct = 1
}
CMD_S_Ox4_GameStart = {
	bAndroid = 3,
	lTurnMaxScore = 1,
	wBankerUser = 1
}
CMD_S_Ox4_AllCaijin = {
	lCaijin = 1
}
CMD_S_Ox4_Open_Card = {
	wPlayerID = 1,
	bOpen = 1
}
CMD_C_Ox4_AdminControlAdd = {
	szMachineID = 2,
	nPercent = 1,
	cbType = 1,
	dwGameID = 1,
	nTimes = 1
}
CMD_C_Ox4_CallBanker = {
	bBanker = 1
}
CMD_S_Ox4_GameEnd = {
	lGameTax = {
		_t = 1,
		_l = {
			4
		}
	},
	lGameScore = {
		_t = 1,
		_l = {
			4
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			4
		}
	}
}
CMD_S_Ox4_SendCard = {
	cbCardData = {
		_t = 1,
		_l = {
			4,
			5
		}
	}
}
CMD_C_Ox4_AdminFloatAdd = {
	lStorage = 1,
	nPercent = 1
}
CMD_S_Ox4_StatusFree = {
	lCaijin = 1,
	bCaiJin = 3,
	lCellScore = 1,
	caijinInfo = {
		_t = "Ox4_CajinInfo",
		_l = {
			10
		}
	},
	lAllCaijin = {
		_t = 1,
		_l = {
			4
		}
	}
}
CMD_S_Ox4_AdminControl = {
	szMachineID = 2,
	nPercent = 1,
	cbType = 1,
	dwGameID = 1,
	nTimes = 1
}
CMD_C_Ox4_AdminControlEnableUpdate = {
	cbEnable = 1
}
CMD_S_Ox4_AdminFloatEnable = {
	cbEnable = 1
}
CMD_C_Ox4_AdminFloatDelete = {
	lStorage = 1
}
CMD_S_Ox4_AdminControlEnable = {
	cbEnable = 1
}
CMD_S_Ox4_AdminFloat = {
	lStorage = 1,
	nPercent = 1
}
CMD_C_Ox4_AdminControlDelete = {
	szMachineID = 2,
	cbType = 1,
	dwGameID = 1
}
CMD_S_Ox4_StatusCall = {
	wCallBanker = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			4
		}
	}
}
Ox4_CajinInfo = {
	lGetCajin = 1,
	nickName = {
		_t = 1,
		_l = {
			64
		}
	},
	cardType = {
		_t = 1,
		_l = {
			30
		}
	}
}
CMD_S_Ox4_StatusScore = {
	lTurnMaxScore = 1,
	wBankerUser = 1,
	lTableScore = {
		_t = 1,
		_l = {
			4
		}
	},
	cbPlayStatus = {
		_t = 1,
		_l = {
			4
		}
	}
}
CMD_S_Ox4_PlayerExit = {
	wPlayerID = 1
}
CMD_C_Ox4_OxCard = {
	bOX = 1,
	nServriValue = 1
}
Ox2_CMD_C_OperateCard = {
	cbOperateType = 1,
	nServriValue = 1
}
Ox2_CMD_S_GameEnd = {
	lGameTax = {
		_t = 1,
		_l = {
			2
		}
	},
	lGameScore = {
		_t = 1,
		_l = {
			2
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			2
		}
	}
}
Ox2_CMD_C_GameSetBank = {
	bBankUser = 1
}
Ox2_CMD_S_StatusPlay = {
	lTurnMaxScore = 1,
	wBankUser = 1,
	lBet = {
		_t = 1,
		_l = {
			2
		}
	},
	bCardData = {
		_t = 1,
		_l = {
			2,
			5
		}
	},
	bOperateType = {
		_t = 1,
		_l = {
			2
		}
	}
}
Ox2_CMD_S_GameStart = {
	wBankUser = 1,
	lTurnMaxScore = 1
}
Ox2_CMD_S_StatusBet = {
	wBankUser = 1,
	lTurnMaxScore = 1,
	lBet = {
		_t = 1,
		_l = {
			2
		}
	}
}
Ox2_CMD_S_GameBet = {
	wCurrentUser = 1,
	lBaseBet = 1
}
Ox2_CMD_S_GameQuit = {
	wCurrentUser = 1
}
Ox2_CMD_S_StatusBank = {
	wCallBanker = 1
}
Ox2_CMD_S_CallBank = {
	bStart = 3,
	wCallBanker = 1
}
Ox2_CMD_S_OperateCard = {
	wCurrentUser = 1,
	cbOperateType = 1
}
Ox2_CMD_C_GameBet = {
	lBet = 1,
	nServriValue = 1
}
Ox2_CMD_S_StatusFree = {
	lCellScore = 1
}
Ox2_CMD_S_SendCard = {
	cbCardData = {
		_t = 1,
		_l = {
			2,
			5
		}
	}
}
CMD_GR_ConfigProperty = {
	cbPropertyCount = 1,
	PropertyInfo = {
		_t = "tagPropertyInfo",
		_l = {
			128
		}
	}
}
CMD_GR_S_WisperChat = {
	szChatString = 2,
	wChatLength = 1,
	dwChatColor = 1,
	dwTargetUserID = 1,
	dwSendUserID = 1
}
CMD_GR_C_WisperExpression = {
	dwTargetUserID = 1,
	wItemIndex = 1,
	dwSendUserID = 1
}
CMD_GR_S_UserInsureFailure = {
	szDescribeString = 2,
	lErrorCode = 1,
	cbActivityGame = 1
}
CMD_GR_S_TaskFinish = {
	szTaskName = 2,
	wFinishTaskID = 1
}
CMD_GR_UserScore = {
	UserScore = "tagUserScore",
	dwUserID = 1
}
CMD_GR_Match_Num = {
	dwWaitting = 1,
	dwTotal = 1
}
CMD_GR_C_QueryInsureInfoRequest = {
	cbActivityGame = 1
}
CMD_GR_S_TaskInfo = {
	wTaskCount = 1,
	TaskStatus = {
		_t = "tagTaskStatus",
		_l = {
			128
		}
	}
}
CMD_GR_S_SendTrumpet = {
	szTrumpetContent = 2,
	TrumpetColor = 1,
	szSendNickName = 2,
	wPropertyIndex = 1,
	dwSendUserID = 1
}
CMD_GR_C_SaveScoreRequest = {
	cbActivityGame = 1,
	lSaveScore = 1
}
CMD_GR_UserRule = {
	wMinWinRate = 1,
	lMaxGameScore = 1,
	wMaxFleeRate = 1,
	cbRuleMask = 1,
	lMinGameScore = 1
}
CMD_GF_C_UserChat = {
	szChatString = 2,
	dwTargerUserID = 1,
	dwChatColor = 1,
	wChatLength = 1
}
CMD_GR_LogonUserID = {
	dwPlazaVersion = 1,
	dwProcessVersion = 1,
	szServerPasswd = 2,
	szPassword = 2,
	dwFrameVersion = 1,
	szMachineID = 2,
	wKindID = 1,
	dwUserID = 1
}
CMD_GR_ChairUserInfoReq = {
	wChairID = 1,
	wTableID = 1
}
CMD_GR_LimitUserChat = {
	cbLimitValue = 1,
	dwTargerUserID = 1,
	cbLimitFlags = 1
}
CMD_GR_ExchangeScore = {
	szMachineID = 2,
	lExchangeIngot = 1,
	dwUserID = 1
}
CMD_GR_S_UserChat = {
	szChatString = 2,
	wChatLength = 1,
	dwChatColor = 1,
	dwTargetUserID = 1,
	dwSendUserID = 1
}
CMD_GR_UserInvite = {
	dwUserID = 1,
	wTableID = 1
}
CMD_GR_UserInfoReq = {
	wTablePos = 1,
	dwUserIDReq = 1
}
CMD_GR_C_EnableInsureRequest = {
	szMachineID = 2,
	cbActivityGame = 1,
	szInsurePass = 2,
	szLogonPass = 2,
	dwUserID = 1
}
CMD_GR_limitAccounts = {
	dwTargerUserID = 1
}
CMD_GR_OPtionServer = {
	cbOptionValue = 1,
	cbOptionFlags = 1
}
CMD_GR_C_QueryUserInfoRequest = {
	cbByNickName = 1,
	szAccounts = 2,
	cbActivityGame = 1
}
CMD_GR_ExchangeResult = {
	szNotifyContent = 2,
	lCurrScore = 1,
	lCurIngot = 1,
	bSuccessed = 3
}
CMD_GR_S_UserInsureInfo = {
	wServerID = 1,
	lUserScore = 1,
	cbActivityGame = 1,
	wRevenueTransfer = 1,
	lTransferPrerequisite = 1,
	lUserInsure = 1,
	wRevenueTake = 1
}
CMD_GR_UserStandUp = {
	wChairID = 1,
	cbForceLeave = 1,
	wTableID = 1
}
CMD_GR_KickUser = {
	dwTargerUserID = 1
}
CMD_GF_GameOption = {
	dwFrameVersion = 1,
	cbAllowLookon = 1,
	dwClientVersion = 1
}
CMD_GR_MatchDesc = {
	szDescribe = 2,
	crDescribeColor = 1,
	crTitleColor = 1,
	szTitle = 2
}
CMD_GR_S_PropertyFailure = {
	lErrorCode = 1,
	szDescribeString = 2,
	wRequestArea = 1
}
CMD_GR_C_TakeReward = {
	szMachineID = 2,
	szPassword = 2,
	dwUserID = 1,
	wTaskID = 1
}
CMD_GR_ConfigUserRight = {
	dwUserRight = 1
}
CMD_GR_LogonFailure = {
	szDescribeString = 2,
	lErrorCode = 1
}
CMD_GR_MatchResult = {
	szDescribe = 2,
	lGold = 1,
	dwIngot = 1,
	dwExperience = 1
}
CMD_GR_PurchaseResult = {
	dCurrBeans = 1,
	cbMemberOrder = 1,
	lCurrScore = 1,
	szNotifyContent = 2,
	bSuccessed = 3
}
CMD_GR_LookUserIP = {
	dwTargerUserID = 1
}
CMD_GR_DissmissGame = {
	wDissmissTableNum = 1
}
CMD_GR_S_PropertyMessage = {
	wPropertyCount = 1,
	dwTargetUserID = 1,
	wPropertyIndex = 1,
	dwSourceUserID = 1
}
CMD_GR_Match_Info = {
	szTitle = 2,
	wGameCount = 1
}
CMD_GR_PlayTimePresentNotify = {
	dwPresentPlayTime = 1,
	dwPlayTimeCount = 1
}
CMD_GR_GR_ColloquyChat = {
	szChatString = 2,
	dwChatColor = 1,
	wChatLength = 1,
	dwConversationID = 1,
	dwSendUserID = 1,
	dwTargetUserID = {
		_t = 1,
		_l = {
			16
		}
	}
}
CMD_GR_KickAllUser = {
	szKickMessage = 2
}
CMD_GR_LogonSuccess = {
	dwMasterRight = 1,
	dwUserRight = 1
}
CMD_GR_S_InviteUser = {
	dwTargetUserID = 1
}
CMD_GR_C_UserExpression = {
	dwTargetUserID = 1,
	wItemIndex = 1
}
CMD_GR_C_UserChat = {
	szChatString = 2,
	dwTargerUserID = 1,
	dwChatColor = 1,
	wChatLength = 1
}
CMD_GR_S_WisperExpression = {
	dwTargetUserID = 1,
	wItemIndex = 1,
	dwSendUserID = 1
}
CMD_GR_SendMessage = {
	cbLoop = 1,
	cbGame = 1,
	cbRoom = 1,
	cbAllRoom = 1,
	dwTimeRate = 1,
	szSystemMessage = 2,
	wChatLength = 1,
	lConcludeTime = 1
}
CMD_GR_C_SendTrumpet = {
	TrumpetColor = 1,
	cbRequestArea = 1,
	wPropertyIndex = 1,
	szTrumpetContent = 2
}
CMD_GR_MatchGoldUpdate = {
	lCurrScore = 1,
	lCurIngot = 1,
	dwCurrExprience = 1
}
CMD_GF_GameStatus = {
	cbGameStatus = 1,
	cbAllowLookon = 1
}
CMD_GR_UserInviteReq = {
	dwUserID = 1,
	wTableID = 1
}
CMD_GR_C_TakeGameScoreRequest = {
	szInsurePass = 2,
	cbActivityGame = 1,
	lTakeScore = 1
}
CMD_GR_UpdateNotify = {
	cbMustUpdateClient = 1,
	dwCurrentClientVersion = 1,
	cbAdviceUpdateClient = 1,
	dwCurrentPlazaVersion = 1,
	dwCurrentFrameVersion = 1,
	cbMustUpdatePlaza = 1
}
CMD_GR_ServerOption = {
	ServerOptionInfo = "tagServerOptionInfo"
}
CMD_GR_Match_Wait_Tip = {
	wUserCount = 1,
	wCurTableRank = 1,
	szMatchName = 2,
	wPlayingTable = 1,
	lScore = 1,
	wGameCount = 1,
	wCurGameCount = 1,
	wRank = 1
}
CMD_GR_C_WisperChat = {
	szChatString = 2,
	wChatLength = 1,
	dwChatColor = 1,
	dwTargetUserID = 1,
	dwSendUserID = 1
}
CMD_GR_C_BuyProperty = {
	dwTargetUserID = 1,
	wItemCount = 1,
	cbRequestArea = 1,
	wPropertyIndex = 1,
	cbConsumScore = 1
}
CMD_GR_LogonAccounts = {
	dwPlazaVersion = 1,
	szAccounts = 2,
	dwProcessVersion = 1,
	dwFrameVersion = 1,
	szPassword = 2,
	szMachineID = 2
}
CMD_GR_PurchaseMember = {
	szMachineID = 2,
	cbMemberOrder = 1,
	wPurchaseTime = 1,
	dwUserID = 1
}
CMD_GR_C_TakeTask = {
	szMachineID = 2,
	szPassword = 2,
	dwUserID = 1,
	wTaskID = 1
}
CMD_GR_ConfigServer = {
	dwServerRule = 1,
	wChairCount = 1,
	wServerType = 1,
	wTableCount = 1
}
CMD_GR_RequestFailure = {
	szDescribeString = 2,
	cbFailureCode = 1
}
CMD_GR_StandUp_Return = {
	cbRet = 1
}
CMD_GR_C_TakeScoreRequest = {
	cbAvtivityGame = 1,
	szInsurePass = 2,
	lTakeScore = 1
}
CMD_GR_S_PropertyEffect = {
	wUserID = 1,
	cbMemberOrder = 1
}
CMD_GR_S_UserExpression = {
	dwTargetUserID = 1,
	wItemIndex = 1,
	dwSendUserID = 1
}
CMD_GR_SendWarning = {
	dwTargerUserID = 1,
	wChatLength = 1,
	szWarningMessage = 2
}
CMD_GR_S_UserTransferUserInfo = {
	szAccounts = 2,
	dwTargerUserID = 1,
	cbActivityGame = 1
}
CMD_GR_C_InviteUser = {
	dwSendUserID = 1,
	wTableID = 1
}
CMD_GR_TableStatus = {
	TableStatus = "tagTableStatus",
	wTableID = 1
}
CMD_GF_LookonStatus = {
	cbAllowLookon = 1
}
CMD_GR_UserStatus = {
	UserStatus = "tagUserStatus",
	dwUserID = 1
}
CMD_GR_LogonMobile_Lua = {
	szMachineID = 2,
	wBehaviorFlags = 1,
	dwProcessVersion = 1,
	dwDeviceType = 1,
	wGameID = 1,
	wPageTableCount = 1,
	szPassword = 2,
	szToken = 2,
	dwUserID = 1
}
CMD_GR_Match_Fee = {
	lMatchFee = 1,
	szNotifyContent = 2
}
CMD_GR_S_UserInsureEnableResult = {
	szDescribeString = 2,
	cbActivityGame = 1,
	cbInsureEnabled = 1
}
CMD_GR_UserSitDown = {
	wChairID = 1,
	szPassword = 2,
	wTableID = 1
}
CMD_GR_S_UserInsureSuccess = {
	szDescribrString = 2,
	lUserScore = 1,
	cbActivityGame = 1,
	lUserInsure = 1
}
CMD_GR_TableInfo = {
	wTableCount = 1,
	TableStatusArray = {
		_t = "tagTableStatus",
		_l = {
			512
		}
	}
}
CMD_GR_S_PropertySuccess = {
	dwSourceUserID = 1,
	wItemCount = 1,
	cbRequestArea = 1,
	wPropertyIndex = 1,
	dwTargetUserID = 1
}
CMD_GR_SetUserRight = {
	cbLimitRoomChat = 1,
	dwTargerUserID = 1,
	cbLimitSendWisper = 1,
	cbLimitPlayGame = 1,
	cbAccountsRight = 1,
	cbLimitGameChat = 1,
	cbGameRight = 1,
	cbLimitLookonGame = 1
}
CMD_GR_OptionCurrent = {
	ServerOptionInfo = "tagServerOptionInfo",
	dwRuleMask = 1
}
CMD_GR_C_TransferScoreRequest = {
	szTransRemark = 2,
	szAccounts = 2,
	cbActivityGame = 1,
	szInsurePass = 2,
	lTransferScore = 1
}
CMD_GR_ExchangeParameter = {
	wRateGold = 1,
	wMemberCount = 1,
	wPresentExchangeRate = 1,
	wExchangeRate = 1,
	MemberParameter = {
		_t = "tagMemberParameter",
		_l = {
			10
		}
	}
}
CMD_GR_ConfigColumn = {
	cbColumnCount = 1,
	ColumnItem = {
		_t = "tagColumnItem",
		_l = {
			32
		}
	}
}
CMD_GR_C_LoadTaskInfo = {
	szPassword = 2,
	dwUserID = 1
}
CMD_GR_S_TaskResult = {
	lCurrScore = 1,
	wCommandID = 1,
	szNotifyContent = 2,
	lCurIngot = 1,
	bSuccessed = 3
}
CMD_GF_S_UserChat = {
	szChatString = 2,
	dwTargerUserID = 1,
	dwChatColor = 1,
	wChatLength = 1,
	dwSendUserID = 1
}
CMD_GR_UserLookon = {
	wChairID = 1,
	wTableID = 1
}
CMD_GR_ExchangeScoreByBean = {
	szMachineID = 2,
	dExchangeBean = 1,
	dwUserID = 1
}
CMD_GF_LookonConfig = {
	cbAllowLookon = 1,
	dwUserID = 1
}
CMD_GF_C_UserExpression = {
	dwTargerUserID = 1,
	wItemIndex = 1
}
CMD_gr_playTimePresentDraw = {
	cbActionGame = 1
}
CMD_GF_S_UserExpression = {
	dwTargerUserID = 1,
	wItemIndex = 1,
	dwSendUserID = 1
}
CMD_GF_S_LuckyMoney = {
	dwParam = 1,
	dwUserID = 1,
	lCount = 1,
	cbIsActiviting = 1
}
CMD_GR_UserRepulseSit = {
	wChairID = 1,
	dwUserID = 1,
	dwrepulseUserID = 1,
	wTableID = 1
}
CMD_GR_LogonFinish = {
	bGuideTask = 3
}
CMD_GR_MobileUserScore = {
	UserScore = "tagMobileUserScore",
	dwUserID = 1
}
SYSTEMTIME = {
	wDay = 1,
	wSecond = 1,
	wMonth = 1,
	wHour = 1,
	wDayOfWeek = 1,
	wMinute = 1,
	wYear = 1,
	wMilliseconds = 1
}
BR30S_CMD_S_StatusFree = {
	lApplyBankerCondition = 1,
	wBankerUser = 1,
	bEnableSysBanker = 3,
	wBankerTime = 1,
	lPlayFreeSocre = 1,
	lBankerWinScore = 1,
	dwServerId = 1,
	lAreaLimitScore = 1,
	lBankerScore = 1,
	cbTimeLeave = 1
}
BR30S_CMD_S_ChangeBanker = {
	wBankerUser = 1,
	lBankerScore = 1
}
BR30S_tagRankUser = {
	szUserName = 2,
	lWinScore = 1
}
BR30S_CMD_S_StatusPlayEx = {
	lApplyBankerCondition = 1,
	lPlayAllScore = 1,
	bEnableSysBanker = 3,
	wBankerUser = 1,
	lPlayFreeSocre = 1,
	lBankerWinScore = 1,
	cbGameStatus = 1,
	dwServerId = 1,
	lEndBankerScore = 1,
	lPlayBetScore = 1,
	lBankerScore = 1,
	wBankerTime = 1,
	cbRankCount = 1,
	lAreaLimitScore = 1,
	cbTimeLeave = 1,
	lAllBet = {
		_t = 1,
		_l = {
			8
		}
	},
	lPlayBet = {
		_t = 1,
		_l = {
			8
		}
	},
	lPlayScore = {
		_t = 1,
		_l = {
			8
		}
	},
	cbCardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			2,
			3
		}
	},
	RankUser = {
		_t = "BR30S_tagRankUser",
		_l = {
			5
		}
	}
}
BR30S_CMD_S_PlaceBetFail = {
	lBetArea = 1,
	wPlaceUser = 1,
	lPlaceScore = 1
}
BR30S_CMD_C_AdminReq = {
	cbReqType = 1,
	cbExtendData = {
		_t = 1,
		_l = {
			20
		}
	}
}
BR30S_CMD_S_CommandResult = {
	cbAckType = 1,
	cbResult = 1,
	cbExtendData = {
		_t = 1,
		_l = {
			20
		}
	}
}
BR30S_CMD_S_ApplyBanker = {
	wApplyUser = 1
}
BR30S_CMD_S_GameStart = {
	lPlayFreeSocre = 1,
	wBankerUser = 1,
	nChipRobotCount = 1,
	nListUserCount = 1,
	nAndriodCount = 1,
	lPlayBetScore = 1,
	lBankerScore = 1,
	cbTimeLeave = 1,
	bRealUser = {
		_t = 1,
		_l = {
			150
		}
	}
}
BR30S_CMD_C_PlaceBet = {
	lBetScore = 1,
	cbBetArea = 1
}
BR30S_CMD_S_GameEnd = {
	lRevenue = 1,
	lPlayAllScore = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbCardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			2,
			3
		}
	},
	lPlayScore = {
		_t = 1,
		_l = {
			8
		}
	}
}
BR30S_CMD_S_PlaceBet = {
	wChairID = 1,
	cbAndroidUser = 1,
	lBetScore = 1,
	cbBetArea = 1
}
BR30S_CMD_S_CancelBanker = {
	wCancelUser = 1
}
BR30S_tagClientGameRecord = {
	bHu = 3,
	bBankerTwoPair = 3,
	bInit = 3,
	bPlayerTwoPair = 3,
	cbBankerCount = 1,
	cbPing = 3,
	bLong = 3,
	cbPlayerCount = 1
}
BR30S_CMD_S_GameSide = {
	wBetUser = 1,
	cbbetArea = 1
}
BR30S_tagServerGameRecord = {
	cbPlayerCount = 1,
	bBankerTwoPair = 3,
	bPlayerTwoPair = 3,
	cbBankerCount = 1,
	cbKingWinner = 1
}
BR30S_CMD_S_GameEndEx = {
	lRevenue = 1,
	lPlayAllScore = 1,
	cbRankCount = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbCardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			2,
			3
		}
	},
	lPlayScore = {
		_t = 1,
		_l = {
			8
		}
	},
	RankUser = {
		_t = "BR30S_tagRankUser",
		_l = {
			5
		}
	}
}
BR30S_CMD_S_GameFree = {
	cbTimeLeave = 1
}
BR30S_CMD_S_StatusPlay = {
	lApplyBankerCondition = 1,
	lPlayAllScore = 1,
	bEnableSysBanker = 3,
	wBankerUser = 1,
	lPlayFreeSocre = 1,
	lBankerWinScore = 1,
	cbGameStatus = 1,
	dwServerId = 1,
	lPlayBetScore = 1,
	lBankerScore = 1,
	wBankerTime = 1,
	lAreaLimitScore = 1,
	cbTimeLeave = 1,
	lAllBet = {
		_t = 1,
		_l = {
			8
		}
	},
	lPlayBet = {
		_t = 1,
		_l = {
			8
		}
	},
	lPlayScore = {
		_t = 1,
		_l = {
			8
		}
	},
	cbCardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			2,
			3
		}
	}
}
tagGameType = {
	szTypeName = 2,
	wTypeID = 1,
	wSortID = 1
}
tagServerOptionInfo = {
	lMinEnterScore = 1,
	szServerName = 2,
	lMaxEnterScore = 1,
	wRevenueRatio = 1,
	cbMinEnterMember = 1,
	cbMaxEnterMember = 1,
	dwServerRule = 1,
	wKindID = 1,
	lServiceScore = 1,
	lMinTableScore = 1,
	wSortID = 1,
	wNodeID = 1,
	lRestrictScore = 1
}
tagMasterItem = {
	cbMasterOrder = 1,
	szMasterName = 2
}
tagUserRemoteInfo = {
	cbGender = 1,
	cbMemberOrder = 1,
	wKindID = 1,
	szGameServer = 2,
	cbMasterOrder = 1,
	wServerID = 1,
	szNickName = 2,
	dwGameID = 1,
	dwUserID = 1
}
tagUserSpreadInfo = {
	dwSpreadCount = 1,
	lSpreadReward = 1
}
tagOnLineInfoKind = {
	wKindID = 1,
	dwOnLineCount = 1
}
tagGameMatch = {
	cbMatchFeeType = 1,
	cbMemberOrder = 1,
	wMatchPlayCount = 1,
	wRewardCount = 1,
	dwMatchID = 1,
	cbMatchType = 1,
	wServerID = 1,
	MatchEndTime = 1,
	szMatchName = 2,
	wStartUserCount = 1,
	dwMatchNO = 1,
	lMatchFee = 1,
	MatchStartTime = 1
}
tagUserStatus = {
	wChairID = 1,
	cbUserStatus = 1,
	wTableID = 1
}
tagAVServerOption = {
	wAVServerPort = 1,
	dwAVServerAddr = 1
}
tagGameKind = {
	wGameID = 1,
	wSortID = 1,
	szProcessName = 2,
	wKindID = 1,
	wTypeID = 1,
	wJoinID = 1,
	dwOnLineCount = 1,
	dwFullCount = 1,
	szKindName = 2
}
tagCustomFaceInfo = {
	dwDataSize = 1,
	dwCutstomFace = {
		_t = 1,
		_l = {
			2304
		}
	}
}
tagGrowLevelConfig = {
	wLevelID = 1,
	dwExperience = 1
}
tagAddressInfo = {
	szAddress = 2
}
tagUserScore = {
	lBanker = 1,
	dwLostCount = 1,
	dwUserMedal = 1,
	dwDrawCount = 1,
	dwWinCount = 1,
	dwExperience = 1,
	dwLoveLiness = 1,
	dwFleeCount = 1,
	lScore = 1,
	lIngot = 1,
	lGrade = 1
}
tagDataBaseParameter = {
	wDataBasePort = 1,
	szDataBaseUser = 2,
	szDataBaseName = 2,
	szDataBasePass = 2,
	szDataBaseAddr = 2
}
tagMemberParameter = {
	lPresentScore = 1,
	cbMemberOrder = 1,
	szMemberName = 2,
	lMemberPrice = 1
}
tagSignupMatchInfo = {
	wServerID = 1,
	dwMatchNO = 1,
	dwMatchID = 1
}
tagTimeInfo = {
	dwEnterTableTimer = 1,
	dwEndGameTimer = 1,
	dwLeaveTableTimer = 1,
	dwStartGameTimer = 1
}
tagUserProperty = {
	wPropertyUseMark = 1,
	PropertyInfo = {
		_t = "tagUsePropertyInfo",
		_l = {
			4
		}
	}
}
tagMobileUserScore = {
	dwWinCount = 1,
	dwFleeCount = 1,
	dwExperience = 1,
	lScore = 1,
	dwDrawCount = 1,
	dwLostCount = 1
}
tagOnLineInfoKindEx = {
	dwOnLineCount = 1,
	wKindID = 1,
	dwAndroidCount = 1
}
tagGamePlaza = {
	szServerAddr = 2,
	wPlazaID = 1,
	szServerName = 2
}
tagLotteryItem = {
	lItemQuota = 1,
	cbItemType = 1,
	cbItemIndex = 1
}
tagGameNode = {
	wKindID = 1,
	szStationName = 2,
	wSortID = 1,
	wStationID = 1,
	wJoinID = 1
}
tagUserInfo = {
	wFaceID = 1,
	cbMemberOrder = 1,
	lInsure = 1,
	dwCustomID = 1,
	dwGroupID = 1,
	lGrade = 1,
	wTableID = 1,
	lIngot = 1,
	dwWinCount = 1,
	dwLostCount = 1,
	dwDrawCount = 1,
	dwFleeCount = 1,
	lScore = 1,
	cbUserStatus = 1,
	szGroupName = 2,
	dwUserID = 1,
	dwExperience = 1,
	cbGender = 1,
	TimerInfo = "tagTimeInfo",
	dwLoveLiness = 1,
	cbMasterOrder = 1,
	szUnderWrite = 2,
	wLastTableID = 1,
	wChairID = 1,
	szNickName = 2,
	dwGameID = 1
}
tagGrowLevelParameter = {
	lUpgradeRewardIngot = 1,
	lUpgradeRewardGold = 1,
	dwUpgradeExperience = 1,
	dwExperience = 1,
	wCurrLevelID = 1
}
tagTableStatus = {
	cbPlayStatus = 1,
	cbTableLock = 1
}
tagUserAttrib = {
	cbCompanion = 1
}
tagGameServerType = {
	szTypeName = 2,
	wTypeID = 1,
	wSortID = 1,
	wJoinID = 1
}
tagUsePropertyInfo = {
	wPropertyCount = 1,
	dwValidNum = 1,
	dwEffectTime = 1
}
tagLevelItem = {
	lLevelScore = 1,
	szLevelName = 2
}
tagOnLineInfoServer = {
	wServerID = 1,
	dwOnLineCount = 1
}
tagBaseEnsureParameter = {
	cbTakeTimes = 1,
	lScoreCondition = 1,
	lScoreAmount = 1
}
tagDataDescribe = {
	wDataSize = 1,
	wDataDescribe = 1
}
tagUserInfoHead = {
	lGrade = 1,
	cbMemberOrder = 1,
	lInsure = 1,
	dwGroupID = 1,
	dwCustomID = 1,
	wTableID = 1,
	dwWinCount = 1,
	dwLostCount = 1,
	dwDrawCount = 1,
	BIsAndroid = 3,
	dwFleeCount = 1,
	dwExperience = 1,
	lScore = 1,
	cbUserStatus = 1,
	lLoveliness = 1,
	dwUserID = 1,
	cbGender = 1,
	cbMasterOrder = 1,
	wFaceID = 1,
	wChairID = 1,
	lIngot = 1,
	dwGameID = 1
}
tagUserData = {
	lGameGold = 1,
	cbMemberOrder = 1,
	lExperience = 1,
	lBodySilverScore = 1,
	lBodyScore = 1,
	lIngot = 1,
	lScore = 1,
	dwCustomFaceVer = 1,
	dwUserID = 1,
	lLoveliness = 1,
	cbCompanion = 1,
	dwUserRight = 1,
	wTableID = 1,
	lSilverScore = 1,
	cbMasterOrder = 1,
	wChairID = 1,
	lLostMoney = 1,
	dwGameID = 1,
	lInsureSilverScore = 1,
	lDrawCount = 1,
	dwGroupID = 1,
	lBodyChip = 1,
	szUserAddress = 2,
	wGender = 1,
	cbUserStatus = 1,
	szGroupName = 2,
	lHappyBear = 1,
	lFleeCount = 1,
	lWinCount = 1,
	szUnderWrite = 2,
	wFaceID = 1,
	lLostCount = 1,
	lInsureScore = 1,
	szNickName = 2,
	dwMasterRight = 1,
	szName = 2,
	dwPropResidualTime = {
		_t = 1,
		_l = {
			15
		}
	}
}
tagTaskStatus = {
	cbTaskStatus = 1,
	wTaskProgress = 1,
	wTaskID = 1
}
tagMobileUserInfoHead = {
	wTableID = 1,
	cbMemberOrder = 1,
	cbGender = 1,
	lScore = 1,
	dwCustomID = 1,
	dwWinCount = 1,
	dwLostCount = 1,
	dwDrawCount = 1,
	wFaceID = 1,
	dwFleeCount = 1,
	dwExperience = 1,
	wChairID = 1,
	cbUserStatus = 1,
	dwGameID = 1,
	dwUserID = 1
}
tagTaskParameter = {
	cbPlayerType = 1,
	szTaskDescribe = 2,
	dwTimeLimit = 1,
	wTaskType = 1,
	lMemberAwardMedal = 1,
	wKindID = 1,
	szTaskName = 2,
	lMemberAwardGold = 1,
	lStandardAwardGold = 1,
	lStandardAwardMedal = 1,
	wTaskObject = 1,
	wTaskID = 1
}
tagPropertyPackage = {
	wTrumpetCount = 1,
	wTyphonCount = 1
}
tagColumnItem = {
	cbDataDescribe = 1,
	szColumnName = 2,
	cbColumnWidth = 1
}
tagGameServer = {
	dwMinEnterScore = 1,
	szServerAddr = 2,
	wServerID = 1,
	wServerPort = 1,
	dwOnLineCount = 1,
	szServerName = 2,
	wKindID = 1,
	dwFullCount = 1,
	wSortID = 1,
	wNodeID = 1
}
tagGameServer_MB = {
	dwMinEnterScore = 1,
	szServerAddr = 2,
	wServerID = 1,
	wServerPort = 1,
	dwOnLineCount = 1,
	dwCellScore = 1,
	szServerName = 2,
	wKindID = 1,
	dwFullCount = 1,
	wSortID = 1,
	wNodeID = 1
}
tagMemberItem = {
	szMemberName = 2,
	cbMemberOrder = 1
}
CMD_S_HHSW_StatusFree = {
	CheckImage = 1,
	wBankerUser = 1,
	bEnableSysBanker = 3,
	lApplyBankerCondition = 1,
	szGameRoomName = 2,
	lBankerWinScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lAreaLimitScore = 1,
	lBankerScore = 1,
	cbTimeLeave = 1
}
HHsw_HHSWtagServerGameRecord = {
	bWinMen = {
		_t = 1,
		_l = {
			9
		}
	}
}
CMD_S_HHSW_SystemStorage = {
	lStorage = 1,
	lStorageDeduct = 1
}
CMD_S_HHSW_GameFree = {
	cbTimeLeave = 1
}
CMD_S_HHSW_StatusPlay = {
	cbTimeLeave = 1,
	lEndUserScore = 1,
	bEnableSysBanker = 3,
	wBankerUser = 1,
	lBankerScore = 1,
	lBankerWinScore = 1,
	cbGameStatus = 1,
	CheckImage = 1,
	szGameRoomName = 2,
	lEndRevenue = 1,
	lEndBankerScore = 1,
	lEndUserReturnScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lAreaLimitScore = 1,
	lApplyBankerCondition = 1,
	lAllJettonScore = {
		_t = 1,
		_l = {
			9
		}
	},
	lUserJettonScore = {
		_t = 1,
		_l = {
			9
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			1,
			1
		}
	}
}
HHsw_CMD_S_StatusPlay_Ex = {
	cbTimeLeave = 1,
	lEndUserScore = 1,
	bEnableSysBanker = 3,
	wBankerUser = 1,
	lBankerScore = 1,
	lBankerWinScore = 1,
	cbGameStatus = 1,
	CheckImage = 1,
	szGameRoomName = 2,
	cbRankCount = 1,
	lEndRevenue = 1,
	lEndBankerScore = 1,
	lEndUserReturnScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lAreaLimitScore = 1,
	lApplyBankerCondition = 1,
	lAllJettonScore = {
		_t = 1,
		_l = {
			9
		}
	},
	lUserJettonScore = {
		_t = 1,
		_l = {
			9
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			1,
			1
		}
	},
	RankUser = {
		_t = "HHsw_tagRankUser",
		_l = {
			5
		}
	}
}
CMD_S_HHSW_GameEnd = {
	lRevenue = 1,
	lUserScore = 1,
	lUserReturnScore = 1,
	cbLeftCardCount = 1,
	bcFirstCard = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			1,
			1
		}
	}
}
HHsw_tagRankUser = {
	szUserName = 2,
	lWinScore = 1
}
CMD_S_HHSW_GameStart = {
	cbTimeLeave = 1,
	wBankerUser = 1,
	nChipRobotCount = 1,
	lBankerScore = 1,
	bContiueCard = 3,
	lUserMaxScore = 1
}
CMD_S_HHSW_CancelBanker = {
	wChairID = 1
}
HHsw_CMD_S_GameEnd_Ex = {
	lRevenue = 1,
	lUserScore = 1,
	lUserReturnScore = 1,
	cbLeftCardCount = 1,
	bcFirstCard = 1,
	cbRankCount = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			1,
			1
		}
	},
	RankUser = {
		_t = "HHsw_tagRankUser",
		_l = {
			5
		}
	}
}
CMD_S_HHSW_PlaceJettonFail = {
	wPlaceUser = 1,
	lJettonArea = 1,
	lPlaceScore = 1
}
CMD_C_HHSW_CheckImage = {
	Index = 1
}
CMD_S_HHSW_ApplyBanker = {
	wApplyUser = 1
}
CMD_S_HHSW_ControlReturns = {
	cbControlTimes = 1,
	cbControlArea = 1,
	cbReturnsType = 1
}
CMD_C_HHSW_UpdateStorage = {
	lStorage = 1,
	lStorageDeduct = 1
}
CMD_S_HHSW_ChangeUserScore = {
	lScore = 1,
	cbBankerTime = 1,
	lCurrentBankerScore = 1,
	wChairID = 1,
	wCurrentBankerChairID = 1
}
CMD_S_HHSW_ChangeBanker = {
	wBankerUser = 1,
	lBankerScore = 1
}
CMD_S_HHSW_PlaceJetton = {
	lJettonScore = 1,
	wChairID = 1,
	cbJettonArea = 1,
	IsAndroid = 3,
	cbAndroid = 1
}
CMD_C_HHSW_PlaceJetton = {
	cbJettonArea = 1,
	nSerivalValue = 1,
	lJettonScore = 1
}
CMD_C_HHSW_ControlApplication = {
	cbControlAppType = 1,
	cbControlTimes = 1,
	cbControlArea = 1
}
TCP_Validate = {
	szValidateKey = 2
}
TCP_Head = {
	TCPInfo = "TCP_Info",
	CommandInfo = "TCP_Command"
}
TCP_Command = {
	dwIPAdress = 1,
	wMainCmdID = 1,
	wSubCmdID = 1
}
TCP_Info = {
	dwIPAdress = 1,
	cbDataKind = 1,
	wPacketSize = 1,
	cbCheckCode = 1
}
TCP_Buffer = {
	Head = "TCP_Head",
	cbBuffer = {
		_t = 1,
		_l = {
			16368
		}
	}
}
CMD_S_SK_ChangeCard = {
	wChairID = 1,
	nCardCount = 1,
	byCardData = {
		_t = 1,
		_l = {
			27
		}
	}
}
CMD_C_SK_Trustee = {
	wChairID = 1,
	bTrustee = 3
}
CMD_S_SK_GameEnd_Mobile = {
	nCardCount = 1,
	lGameTax = 1,
	wWinner = 1,
	lGongxian = {
		_t = 1,
		_l = {
			2
		}
	},
	nTimes = {
		_t = 1,
		_l = {
			2
		}
	},
	lGameScore = {
		_t = 1,
		_l = {
			2
		}
	},
	szName = {
		_t = 2,
		_l = {
			2
		}
	},
	byCardData = {
		_t = 1,
		_l = {
			27
		}
	}
}
CMD_S_SK_GameStart = {
	lCellScore = 1,
	byFirstCard = 1,
	wBankerUser = 1,
	byCardCount = 1,
	wCurrentUser = 1,
	lMaxScore = 1,
	byCardData = {
		_t = 1,
		_l = {
			27
		}
	}
}
CMD_S_SK_PassCard = {
	wCurrentUser = 1,
	wPassCardUser = 1
}
CMD_C_SK_ManageControl = {
	bManageControl = 3,
	ClientSerial = "SK_tagClientSerial",
	cbControlArea = 1
}
SK_tagMatchTopTen = {
	b = 1
}
SK_tagClientSerial = {
	Serial = {
		_t = 1,
		_l = {
			33
		}
	}
}
CMD_C_SK_YuYin = {
	wChairID = 1,
	nIndex = 1
}
CMD_S_SK_GameEnd = {
	szName = 2,
	nCardCount = 1,
	lGameTax = 1,
	wWinner = 1,
	lGongxian = {
		_t = 1,
		_l = {
			2
		}
	},
	nTimes = {
		_t = 1,
		_l = {
			2
		}
	},
	lGameScore = {
		_t = 1,
		_l = {
			2
		}
	},
	byCardData = {
		_t = 1,
		_l = {
			27
		}
	}
}
CMD_S_SK_OutCard = {
	bIsGameEnd = 3,
	lGongxian = 1,
	wOutCardUser = 1,
	wCurrentUser = 1,
	nCardCount = 1,
	nTimes = {
		_t = 1,
		_l = {
			2
		}
	},
	byCardData = {
		_t = 1,
		_l = {
			27
		}
	}
}
SK_CMD_S_UserRank = {
	TopTen = "SK_tagMatchTopTen"
}
CMD_S_SK_StatusFree = {
	wCurrentUser = 1,
	lCellScore = 1,
	wBankerUser = 1,
	TopTen = "SK_tagMatchTopTen"
}
CMD_S_SK_SendCard = {
	wCurrentUser = 1,
	byCardData = 1
}
CMD_C_SK_PassCard = {
	wCompareUser = 1
}
CMD_C_SK_OutCard = {
	wCurrentUser = 1,
	nCardCount = 1,
	byCardData = {
		_t = 1,
		_l = {
			27
		}
	}
}
CMD_S_SK_StatusPlay = {
	lCellScore = 1,
	lGongXian = 1,
	wCurrentUser = 1,
	wOutCardUser = 1,
	TopTen = "SK_tagMatchTopTen",
	nOutCardCount = 1,
	nTimes = {
		_t = 1,
		_l = {
			2
		}
	},
	cbPlayStatus = {
		_t = 1,
		_l = {
			2
		}
	},
	byCardData = {
		_t = 1,
		_l = {
			27
		}
	},
	nCardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	byOutCardData = {
		_t = 1,
		_l = {
			27
		}
	}
}
CMD_S_SK_ShowCard = {
	wChairID = 1,
	nCardCount = 1,
	byCardData = {
		_t = 1,
		_l = {
			27
		}
	}
}
CMD_MB_Guest_LogonSuccess = {
	dwLoveLiness = 1,
	cbGender = 1,
	nGuestState = 1,
	szNickName = 2,
	szToken = 2,
	lUserScore = 1,
	szVersion = 2,
	dwVersion = 1,
	wFaceID = 1,
	dwExperience = 1,
	dwGameID = 1,
	dwUserID = 1
}
CMD_GP_UserIndividual = {
	dwUserID = 1
}
CMD_GP_LogonAccounts = {
	dwPlazaVersion = 1,
	szPassword = 2,
	szMachineID = 2,
	szAccounts = 2,
	cbValidateFlags = 1,
	szPassPortID = 2
}
CMD_SC_MB_SignInRes = {
	szDescribeString = 2,
	lInsureScore = 1,
	nResultCode = 1
}
CMD_GP_CustomFaceInfo = {
	szMachineID = 2,
	szPassword = 2,
	dwUserID = 1,
	dwCustomFace = {
		_t = 1,
		_l = {
			2304
		}
	}
}
CMD_GP_LotteryResult = {
	wKindID = 1,
	lUserScore = 1,
	bWined = 3,
	LotteryItem = "tagLotteryItem",
	dUserBeans = 1,
	dwUserID = 1
}
CMD_GP_TaskLoadInfo = {
	szPassword = 2,
	dwUserID = 1
}
CMD_GP_TaskReward = {
	szMachineID = 2,
	szPassword = 2,
	dwUserID = 1,
	wTaskID = 1
}
TransRecdinfo = {
	szSendNickName = 2,
	lMyScore = 1,
	szDateTime1 = 2,
	lBeforeScore = 1,
	szDateTime2 = 2,
	lAfterScore = 1,
	wChangType = 1,
	dwSendUserID = 1
}
CMD_GP_CheckInDone = {
	szMachineID = 2,
	dwUserID = 1
}
CMD_GP_LogonGameID = {
	dwPlazaVersion = 1,
	szPassword = 2,
	szMachineID = 2,
	cbValidateFlags = 1,
	dwGameID = 1
}
CMD_GP_QueryUserGameData = {
	wKindID = 1,
	szDynamicPass = 2,
	dwUserID = 1
}
CMD_GP_QueryGameInsureInfo = {
	wKindID = 1,
	szToken = 2,
	dwUserID = 1
}
CMD_GP_QueryUserInfoRequest = {
	cbByNickName = 1,
	szAccounts = 2
}
CMD_GP_UserInsureLogon_MB = {
	szMachineID = 2,
	szPassword = 2,
	dwUserID = 1
}
CMD_GP_LotteryUserInfo = {
	wKindID = 1,
	lChargeFee = 1,
	cbFreeCount = 1,
	cbAlreadyCount = 1,
	dwUserID = 1
}
CMD_GP_TaskTake = {
	szMachineID = 2,
	szPassword = 2,
	dwUserID = 1,
	wTaskID = 1
}
CMD_GP_ExchangeResult = {
	dCurrBeans = 1,
	lCurrScore = 1,
	szNotifyContent = 2,
	lCurrIngot = 1,
	bSuccessed = 3
}
CMD_GP_ModifyIndividual = {
	szPassword = 2,
	cbGender = 1,
	dwUserID = 1
}
CMD_GP_LogonFinish = {
	wOnLineCountTime = 1,
	wIntermitTime = 1
}
CMD_MB_LogonFailure = {
	szDescribeString = 2,
	lErrorCode = 1
}
CMD_MB_SC_ClickLikesInfo = {
	nSigns = 1,
	nClickLikes = 1
}
CMD_GP_BaseEnsureResult = {
	szNotifyContent = 2,
	lGameScore = 1,
	bSuccessed = 3
}
CMD_MB_UpdateNotify = {
	cbAdviceUpdate = 1,
	cbMustUpdate = 1,
	dwCurrentVersion = 1
}
CMD_GP_ModifyUnderWrite = {
	szUnderWrite = 2,
	szPassword = 2,
	dwUserID = 1
}
CMD_GP_UserInsureInfo = {
	cbEnjoinTransfer = 1,
	lUserScore = 1,
	wRevenueTransferMember = 1,
	wServerID = 1,
	wRevenueTransfer = 1,
	lUserInsure = 1,
	lTransferPrerequisite = 1,
	wRevenueTake = 1
}
CMD_GP_BaseEnsureTake = {
	szMachineID = 2,
	szPassword = 2,
	dwUserID = 1
}
DBO_CheckBindMobileAndInvali = {
	isAddInvali = 1,
	isBindMobile = 1,
	isBindWechat = 1
}
CMD_GP_TaskResult = {
	lCurrScore = 1,
	wCommandID = 1,
	szNotifyContent = 2,
	lCurrIngot = 1,
	bSuccessed = 3
}
CMD_GP_UserInsureFailure_MB = {
	lResultCode = 1,
	szDescribeString = 2
}
CMD_GP_UserTransferScore = {
	szMachineID = 2,
	szPassword = 2,
	szAccounts = 2,
	szTransRemark = 2,
	lTransferScore = 1,
	dwUserID = 1
}
CMD_GP_MatchUnSignup = {
	wServerID = 1,
	szPassword = 2,
	szMachineID = 2,
	dwMatchNO = 1,
	dwMatchID = 1,
	dwUserID = 1
}
CMD_MB_KindOnline = {
	wKindCount = 1,
	OnLineInfoKind = {
		_t = "tagOnLineInfoKind",
		_l = {
			256
		}
	}
}
CMD_GP_VerifyIndividual = {
	dwPlazaVersion = 1,
	wVerifyMask = 1
}
CMD_GP_ExchangeScoreByBean = {
	szMachineID = 2,
	dExchangeBean = 1,
	dwUserID = 1
}
CMD_GP_LogonSuccess = {
	cbMoorMachine = 1,
	szAccounts = 2,
	dUserBeans = 1,
	dwGroupID = 1,
	dwCustomID = 1,
	dwLoveLiness = 1,
	lUserScore = 1,
	szNickName = 2,
	cbShowServerStatus = 1,
	lUserInsure = 1,
	szGroupName = 2,
	dwUserID = 1,
	cbGender = 1,
	lUserIngot = 1,
	wFaceID = 1,
	cbInsureEnabled = 1,
	szDynamicPass = 2,
	dwExperience = 1,
	dwGameID = 1
}
CMD_GP_UserSaveScore = {
	szMachineID = 2,
	lSaveScore = 1,
	dwUserID = 1
}
UserRank = {
	wFaceID = 1,
	GameID = 1,
	UserType = 1,
	lData = 1,
	wGender = 1,
	szNickName = 2,
	Tel = {
		_t = 1,
		_l = {
			12
		}
	},
	UnWrite = {
		_t = 1,
		_l = {
			128
		}
	}
}
CMD_MB_OnlineCheck = {
	dwUserID = 1
}
CMD_GP_BaseEnsureParamter = {
	cbTakeTimes = 1,
	lScoreCondition = 1,
	lScoreAmount = 1
}
CMD_GP_GrowLevelParameter = {
	lUpgradeRewardIngot = 1,
	lUpgradeRewardGold = 1,
	dwUpgradeExperience = 1,
	dwExperience = 1,
	wCurrLevelID = 1
}
CMD_GP_LogonFailure = {
	lResultCode = 1,
	szDescribeString = 2
}
CMD_GP_UserTransferScore_MB = {
	szMachineID = 2,
	szNickName = 2,
	cbByNickName = 1,
	szToken = 2,
	lTransferScore = 1,
	dwUserID = 1
}
CMD_S_GP_Rank = {
	wRankCount = 1,
	userRank = {
		_t = "UserRank",
		_l = {
			50
		}
	}
}
CMD_GP_UserInsureSuccess_MB = {
	lUserInsure = 1,
	lUserScore = 1,
	szDescribeString = 2,
	dwUserID = 1
}
CMD_GP_ModifyLogonPass = {
	szDesPassword = 2,
	szScrPassword = 2,
	dwUserID = 1
}
CMD_GP_UserInsureSuccess = {
	lUserInsure = 1,
	lUserScore = 1,
	szDescribeString = 2,
	dwUserID = 1
}
CMD_GP_UserTakeScore_MB = {
	wKindID = 1,
	szMachineID = 2,
	lTakeScore = 1,
	szToken = 2,
	dwUserID = 1
}
DTP_GP_GroupInfo = {
	dwGroupID = 1,
	szGroupName = 2
}
CMD_GP_UserSpreadInfo = {
	dwSpreadCount = 1,
	lSpreadReward = 1
}
CMD_GP_UserSpreadQuery = {
	dwUserID = 1
}
CMD_MB_ServerOnline = {
	wServerCount = 1,
	OnLineInfoServer = {
		_t = "tagOnLineInfoServer",
		_l = {
			1024
		}
	}
}
CMD_MB_GetServerList_Lua = {
	dwDevice = 1
}
CMD_GP_VerifyIndividualResult = {
	bVerifyPassage = 3,
	wVerifyMask = 1,
	szErrorMsg = 2
}
CMD_GP_MB_CheckBindMobileAndInvali = {
	szTempPassWord = 2,
	dwUserID = 1
}
CMD_GP_UserSaveScore_MB = {
	wKindID = 1,
	szMachineID = 2,
	lSaveScore = 1,
	szToken = 2,
	dwUserID = 1
}
CMD_GP_OperateSuccess = {
	lResultCode = 1,
	szDescribeString = 2
}
CMD_GP_GrowLevelQueryInfo = {
	szMachineID = 2,
	szPassword = 2,
	dwUserID = 1
}
CMD_GP_QueryInsureInfo = {
	szPassword = 2,
	dwUserID = 1
}
CMD_GP_RESULT_MB = {
	lResultCode = 1,
	szDescribeString = 2
}
CMD_GP_ModifyMachine = {
	szMachineID = 2,
	cbBind = 1,
	szPassword = 2,
	dwUserID = 1
}
CMD_GP_UserTransferResult_MB = {
	szSourceNickName = 2,
	lUserScore = 1,
	szTargetNickName = 2,
	dwSourceUserID = 1,
	lScore = 1,
	lUserInsure = 1,
	dwRecordID = 1,
	dwTargetUserID = 1
}
CMD_SYSTEMTIME = {
	wDay = 1,
	wSecond = 1,
	wMonth = 1,
	wHour = 1,
	wDayOfWeek = 1,
	wMinute = 1,
	wYear = 1,
	wMilliseconds = 1
}
CMD_GP_UserTransferResult_MB1 = {
	szTargetNickName = 2,
	lUserScore = 1,
	dtTime = "CMD_SYSTEMTIME",
	dwSourceUserID = 1,
	szSourceNickName = 2,
	lScore = 1,
	lUserInsure = 1,
	dwRecordID = 1,
	dwTargetUserID = 1
}
CMD_GP_ServerOnline = {
	wServerCount = 1,
	OnLineInfoServer = {
		_t = "tagOnLineInfoServer",
		_l = {
			1024
		}
	}
}
CMD_GP_UserSetSpreaderID = {
	dwSpreaderID = 1,
	dwMyUserID = 1
}
CMD_GP_OperateFailure = {
	lResultCode = 1,
	szDescribeString = 2
}
CMD_MB_GetOnline = {
	wServerCount = 1,
	wOnLineServerID = {
		_t = 1,
		_l = {
			1024
		}
	}
}
CMD_S_GP_TopMsgInfo = {
	m_MsgCount = 1,
	szTopMsg = 2
}
CMD_GP_OperateSuccess_MB = {
	lResultCode = 1,
	szDescribeString = 2
}
DTP_GP_MemberInfo = {
	MemberOverDate = 1,
	cbMemberOrder = 1
}
CMD_GP_ModifyInsurePass = {
	szDesPassword = 2,
	szScrPassword = 2,
	dwUserID = 1
}
CMD_GP_GrowLevelConfig = {
	wLevelCount = 1,
	GrowLevelItem = {
		_t = "tagGrowLevelConfig",
		_l = {
			60
		}
	}
}
CMD_GP_UserInsureFailure = {
	lResultCode = 1,
	szDescribeString = 2
}
CMD_GP_UserEnableInsure = {
	szMachineID = 2,
	szLogonPass = 2,
	szInsurePass = 2,
	dwUserID = 1
}
CMD_GP_QueryUserInfoRequest_MB = {
	dwTargetGameID = 1
}
CMD_GP_LotteryConfigReq = {
	wKindID = 1,
	szLogonPass = 2,
	dwUserID = 1
}
CMD_GP_KindOnline = {
	wKindCount = 1,
	OnLineInfoKind = {
		_t = "tagOnLineInfoKind",
		_l = {
			256
		}
	}
}
CMD_GP_UserTakeScore = {
	szMachineID = 2,
	szPassword = 2,
	lTakeScore = 1,
	dwUserID = 1
}
CMD_MB_LogonVisitor = {
	szMachineID = 2,
	dwPlazaVersion = 1,
	cbDeviceType = 1,
	wModuleID = 1,
	szMobilePhone = 2
}
CMD_MB_LogonAccounts_Lua = {
	dwDeviceType = 1,
	szAccounts = 2,
	szPassword550 = 2,
	dwPlazaVersion = 1,
	cbPassPortID = 1,
	szUnionID = 2,
	szVersion = 2,
	dwVersion = 1,
	szAccounts850 = 2,
	szPassword2050 = 2,
	szPassPortID = 2,
	szMachineID = 2,
	wModuleID = 1,
	szNickName = 2,
	szMobilePhone = 2,
	cbGenter = 1
}
CMD_MB_LogonPotato = {
	dwDeviceType = 1,
	lReserved = 1,
	dwSpreaderID = 1,
	szVersion = 2,
	dwVersion = 1,
	dwPlazaVersion = 1,
	wModuleID = 1,
	szAccounts = {
		_t = 1,
		_l = {
			32
		}
	},
	szOpenID = {
		_t = 1,
		_l = {
			50
		}
	},
	szMachineID = {
		_t = 1,
		_l = {
			33
		}
	},
	szSpreaderCode = {
		_t = 1,
		_l = {
			33
		}
	}
}
CMD_MB_LogonOppo = {
	dwDeviceType = 1,
	lReserved = 1,
	dwSpreaderID = 1,
	szVersion = 2,
	dwVersion = 1,
	dwPlazaVersion = 1,
	wModuleID = 1,
	szAccounts = {
		_t = 1,
		_l = {
			32
		}
	},
	szOpenID = {
		_t = 1,
		_l = {
			50
		}
	},
	szMachineID = {
		_t = 1,
		_l = {
			33
		}
	},
	szSpreaderCode = {
		_t = 1,
		_l = {
			33
		}
	}
}
CMD_MB_LogonVivo = {
	dwDeviceType = 1,
	lReserved = 1,
	dwSpreaderID = 1,
	szVersion = 2,
	dwVersion = 1,
	dwPlazaVersion = 1,
	wModuleID = 1,
	szAccounts = {
		_t = 1,
		_l = {
			32
		}
	},
	szOpenID = {
		_t = 1,
		_l = {
			50
		}
	},
	szMachineID = {
		_t = 1,
		_l = {
			33
		}
	},
	szSpreaderCode = {
		_t = 1,
		_l = {
			33
		}
	}
}
CMD_MB_LogonAccounts_Trump = {
	dwDeviceType = 1,
	szToken = 2,
	dwPlazaVersion = 1,
	dwUserID = 1
}
CMD_GP_ExchangeScoreByIngot = {
	szMachineID = 2,
	lExchangeIngot = 1,
	dwUserID = 1
}
CMD_GP_TransferRecord_MB = {
	szToken = 2,
	dwUserID = 1
}
CMD_GP_GetOnline = {
	wServerCount = 1,
	wOnLineServerID = {
		_t = 1,
		_l = {
			1024
		}
	}
}
CMD_GP_C_SearchCorrespond = {
	dwGameID = 1,
	szNickName = 2
}
CMD_GP_UserTransferUserInfo = {
	dwTargetGameID = 1,
	szAccounts = 2
}
CMD_GP_UpdateUserData = {
	wKindID = 1,
	dwUserID = 1
}
CMD_GP_QueryIndividual = {
	szPassword = 2,
	dwUserID = 1
}
CMD_GP_UserInsureEnableResult = {
	szDescribeString = 2,
	cbInsureEnabled = 1
}
CMD_GP_UpdateNotify = {
	cbAdviceUpdate = 1,
	cbMustUpdate = 1,
	dwCurrentVersion = 1
}
CMD_GP_MatchSignup = {
	wServerID = 1,
	szPassword = 2,
	szMachineID = 2,
	dwMatchNO = 1,
	dwMatchID = 1,
	dwUserID = 1
}
CMD_GP_UserTakeResult = {
	lUserInsure = 1,
	lUserScore = 1,
	dwUserID = 1
}
CMD_MB_LogonAccounts_Validate = {
	szMachineID = 2,
	szAccounts = 2,
	wModuleID = 1,
	szChooseIndex = 2,
	cbPassPortID = 1,
	szUnionID = 2,
	szAccounts850 = 2,
	szPassPortID = 2,
	cbGenter = 1,
	szPassword2050 = 2,
	szIdentityID = 2,
	cbDeviceType = 1,
	szPassword550 = 2,
	szNickName = 2,
	szMobilePhone = 2,
	dwPlazaVersion = 1
}
CMD_GP_ExchangeParameter = {
	wRateGold = 1,
	wMemberCount = 1,
	wPresentExchangeRate = 1,
	wExchangeRate = 1,
	MemberParameter = {
		_t = "tagMemberParameter",
		_l = {
			10
		}
	}
}
CMD_GP_ModifyInsurePass_MB = {
	szDesPassword = 2,
	szScrPassword = 2,
	dwUserID = 1
}
CMD_GP_ValidateMBCard = {
	uMBCardID = 1
}
CMD_MB_RegisterAccountsWithSpreaderID_Lua = {
	dwSpreaderID = 1,
	cbGender = 1,
	szQQ = 2,
	dwDeviceType = 1,
	szPassPortID = 2,
	szAccounts = 2,
	szVersion = 2,
	dwVersion = 1,
	dwPlazaVersion = 1,
	szMachineID = 2,
	szInsurePass = 2,
	wModuleID = 1,
	szLogonPass = 2,
	szMobilePhone = 2
}
CMD_MB_LogonOtherPlatform = {
	szUserUin = 2,
	cbGender = 1,
	dwPlazaVersion = 1,
	szMachineID = 2,
	cbPlatformID = 1,
	cbDeviceType = 1,
	wModuleID = 1,
	szNickName = 2,
	szMobilePhone = 2,
	zsCompellation = {
		_t = 1,
		_l = {
			16
		}
	}
}
CMD_GP_OperateFailure_MB = {
	lResultCode = 1,
	szDescribeString = 2
}
CMD_GP_CheckInResult = {
	cbSign = {
		_t = 1,
		_l = {
			7
		}
	},
	nScorePresent = {
		_t = 1,
		_l = {
			7
		}
	}
}
CMD_GP_TaskInfo = {
	wTaskCount = 1,
	TaskStatus = {
		_t = "tagTaskStatus",
		_l = {
			128
		}
	}
}
CMD_GP_CheckInQueryInfo = {
	dwUserID = 1
}
CMD_GP_UserTransferRecordResult_MB = {
	wYear = 1,
	szTargetNickName = 2,
	wDay = 1,
	dwSourceUserID = 1,
	wMinu = 1,
	wSecd = 1,
	szSourceNickName = 2,
	wMonth = 1,
	wHour = 1,
	lScore = 1,
	dwRecordID = 1,
	dwTargetUserID = 1
}
CMD_GP_LotteryStart = {
	wKindID = 1,
	szLogonPass = 2,
	szMachineID = 2,
	dwUserID = 1
}
CMD_MB_WeiXin_LogonSuccess = {
	dwLoveLiness = 1,
	cbGender = 1,
	cbChangeInsurePass = 1,
	szNickName = 2,
	szLogonPass = 2,
	lUserScore = 1,
	szVersion = 2,
	dwVersion = 1,
	wFaceID = 1,
	dwExperience = 1,
	dwGameID = 1,
	dwUserID = 1
}
CMD_MB_QQ_LogonSuccess = {
	dwLoveLiness = 1,
	cbGender = 1,
	cbChangeInsurePass = 1,
	szNickName = 2,
	szLogonPass = 2,
	lUserScore = 1,
	szVersion = 2,
	dwVersion = 1,
	wFaceID = 1,
	dwExperience = 1,
	dwGameID = 1,
	dwUserID = 1
}
CMD_MB_Vivo_LogonSuccess = {
	dwLoveLiness = 1,
	cbGender = 1,
	cbChangeInsurePass = 1,
	szNickName = 2,
	szLogonPass = 2,
	lUserScore = 1,
	szVersion = 2,
	dwVersion = 1,
	wFaceID = 1,
	dwExperience = 1,
	dwGameID = 1,
	dwUserID = 1
}
CMD_MB_Oppo_LogonSuccess = {
	dwLoveLiness = 1,
	cbGender = 1,
	cbChangeInsurePass = 1,
	szNickName = 2,
	szLogonPass = 2,
	lUserScore = 1,
	szVersion = 2,
	dwVersion = 1,
	wFaceID = 1,
	dwExperience = 1,
	dwGameID = 1,
	dwUserID = 1
}
CMD_MB_RegisterAccountsWithSMS_Lua = {
	dwDeviceType = 1,
	szAccounts = 2,
	szQQ = 2,
	dwSpreaderID = 1,
	szPassPortID = 2,
	szNickName = 2,
	szVersion = 2,
	dwVersion = 1,
	szSMSCode = 2,
	dwPlazaVersion = 1,
	szMachineID = 2,
	szInsurePass = 2,
	wModuleID = 1,
	szLogonPass = 2,
	szMobilePhone = 2,
	cbGender = 1
}
CMD_GP_MatchSignupResult = {
	bSignup = 3,
	szDescribeString = 2,
	bSuccessed = 3
}
CMD_GP_UserTransferUserInfo_MB = {
	dwTargetGameID = 1,
	szNickName = 2
}
CMD_GP_S_SearchCorrespond = {
	wUserCount = 1,
	UserRemoteInfo = {
		_t = "tagUserRemoteInfo",
		_l = {
			16
		}
	}
}
CMD_MB_ClickLikesInfo = {
	szMachineID = 2,
	dwUserID = 1
}
CMD_GP_GrowLevelUpgrade = {
	szNotifyContent = 2,
	lCurrScore = 1,
	lCurrIngot = 1
}
CMD_GP_RegisterAccounts = {
	dwPlazaVersion = 1,
	szAccounts = 2,
	szLogonPass = 2,
	szMachineID = 2,
	szPassPortID = 2,
	szCompellation = 2,
	cbGender = 1,
	szSpreader = 2,
	wFaceID = 1,
	cbValidateFlags = 1,
	szNickName = 2
}
CMD_GP_MB_BindMobile = {
	szSMSCode = 2,
	szTempPassword = 2,
	szMobilePhone = 2,
	dwUserID = 1
}
CMD_MB_LogonSuccess = {
	dwLoveLiness = 1,
	cbGender = 1,
	szNickName = 2,
	szToken = 2,
	lUserScore = 1,
	szVersion = 2,
	dwVersion = 1,
	wFaceID = 1,
	dwExperience = 1,
	dwGameID = 1,
	dwUserID = 1
}
CMD_GP_SetSpreaderID_Rst = {
	lResultCode = 1,
	szDescribeString = 2
}
CMD_GP_UserGameInsureInfo = {
	lUserInsure = 1,
	lUserScore = 1
}
CMD_GP_LotteryConfig = {
	wLotteryCount = 1,
	LotteryItem = {
		_t = "tagLotteryItem",
		_l = {
			16
		}
	}
}
CMD_GP_Activity_Request = {
	szMessage = 2,
	dwMessageID = 1,
	dwActivityID = 1
}
CMD_GP_Activity_Response = {
	szMessage = 2,
	dwMessageID = 1,
	dwActivityID = 1
}
CMD_CS_S_BroadCast_Activity_Message = {
	szMessage = 2,
	dwMessageID = 1,
	dwActivityID = 1
}
CMD_GP_LotteryInfoRequest = {
	dwUserID = 1
}
CMD_GP_LotteryInfoResponse = {
	lReward = 1,
	lLastReward = 1,
	szLastWinner = 2,
	dwPeriod = 1,
	dwStateTime = 1,
	dwRemainCount = 1,
	wState = 1,
	lUnitPrice = 1,
	dwWinnerID = 1,
	dwTotalCount = 1,
	szWinner = 2,
	dwWinningNumber = 1
}
CMD_GP_DrawALotteryRequest = {
	szMachineID = 2,
	szToken = 2,
	dwCount = 1,
	dwUserID = 1
}
CMD_GP_DrawALotteryResponse = {
	szUser = 2,
	dwLeftCount = 1,
	dwCount = 1,
	dwResult = 1,
	dwUserID = 1,
	numbers = {
		_t = 1,
		_l = {
			20
		}
	}
}
CMD_GP_BRAODCAST_ACTIVITY_MESSAGE = {
	szMessage = 2,
	dwID = 1
}
CMD_GP_BroadcastLotteryInfo = {
	lReward = 1,
	lLastReward = 1,
	szLastWinner = 2,
	dwPeriod = 1,
	dwStateTime = 1,
	dwRemainCount = 1,
	wState = 1,
	lUnitPrice = 1,
	dwWinnerID = 1,
	dwTotalCount = 1,
	szWinner = 2,
	dwWinningNumber = 1
}
CMD_GP_BroadcastDrawALottery = {
	szUser = 2,
	dwLeftCount = 1,
	dwCount = 1,
	dwUserID = 1,
	numbers = {
		_t = 1,
		_l = {
			20
		}
	}
}
BRNN_CMD_S_StatusFree = {
	dwServerID = 1,
	wBankerUser = 1,
	bEnableSysBanker = 3,
	lQiangConition = 1,
	lApplyBankerCondition = 1,
	lBankerWinScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lQiangScore = 1,
	lAreaLimitScore = 1,
	lBankerScore = 1,
	cbTimeLeave = 1
}
BRNN_tagControlInfo = {
	cbControlArea = {
		_t = 1,
		_l = {
			3
		}
	}
}
BRNN_CMD_C_AdminReq = {
	cbReqType = 1,
	cbExtendData = {
		_t = 1,
		_l = {
			20
		}
	}
}
BRNN_CMD_S_StatusPlay = {
	lEndBankerScore = 1,
	bEnableSysBanker = 3,
	lQiangConition = 1,
	wBankerUser = 1,
	lBankerWinScore = 1,
	cbGameStatus = 1,
	cbTimeLeave = 1,
	dwServerID = 1,
	cbRankCount = 1,
	lBankerScore = 1,
	lEndRevenue = 1,
	lEndUserScore = 1,
	lEndUserReturnScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lQiangScore = 1,
	lAreaLimitScore = 1,
	lApplyBankerCondition = 1,
	lAllJettonScore = {
		_t = 1,
		_l = {
			5
		}
	},
	lUserJettonScore = {
		_t = 1,
		_l = {
			5
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			5,
			5
		}
	},
	RankUser = {
		_t = "BRNN_tagRankUser",
		_l = {
			5
		}
	},
	lAreaScore = {
		_t = 1,
		_l = {
			4
		}
	}
}
BRNN_CMD_S_UpdateStorage = {
	lStorage = 1,
	lStorageDeduct = 1
}
BRNN_CMD_C_UpdateStorage = {
	cbReqType = 1,
	lStorageDeduct = 1,
	lStorage = 1
}
BRNN_CMD_S_ChangeBanker = {
	wBankerUser = 1,
	lBankerScore = 1
}
BRNN_tagRankUser = {
	szUserName = 2,
	lWInScore = 1
}
BRNN_CMD_C_PlaceJetton = {
	cbJettonArea = 1,
	lJettonScore = 1
}
BRNN_CMD_S_CancelBanker = {
	wCancelUser = 1
}
BRNN_CMD_S_PlaceJetton = {
	bIsAndroid = 3,
	lJettonScore = 1,
	cbJettonArea = 1,
	wChairID = 1,
	bAndroid = 3
}
BRNN_CMD_S_ChangeUserScore = {
	lScore = 1,
	cbBankerTime = 1,
	lCurrentBankerScore = 1,
	wChairID = 1,
	wCurrentBankerChairID = 1
}
BRNN_tagAdminReq = {
	m_cbControlStyle = 1,
	m_cbExcuteTimes = 1,
	m_bWinArea = {
		_t = 3,
		_l = {
			3
		}
	}
}
BRNN_tagServerGameRecord = {
	bWinTian = 3,
	bWinXuan = 3,
	bWinDi = 3,
	bWinHuang = 3
}
BRNN_CMD_S_GameStart = {
	cbTimeLeave = 1,
	wBankerUser = 1,
	nChipRobotCount = 1,
	lBankerScore = 1,
	bContiueCard = 3,
	lUserMaxScore = 1
}
BRNN_CMD_S_PlaceJettonFail = {
	wPlaceUser = 1,
	lJettonArea = 1,
	lPlaceScore = 1
}
BRNN_CMD_S_GameFree = {
	nListUserCount = 1,
	lStorageStart = 1,
	cbTimeLeave = 1
}
BRNN_CMD_S_GameEnd = {
	lRevenue = 1,
	lUserScore = 1,
	lUserReturnScore = 1,
	cbLeftCardCount = 1,
	bcFirstCard = 1,
	cbRankCount = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			5,
			5
		}
	},
	RankUser = {
		_t = "BRNN_tagRankUser",
		_l = {
			5
		}
	},
	lAreaScore = {
		_t = 1,
		_l = {
			4
		}
	}
}
BRNN_tagClientGameRecord = {
	bWinDiMen = 3,
	bWinXuanMen = 3,
	bWinHuangMen = 3,
	bWinTianMen = 3
}
BRNN_CMD_S_ApplyBanker = {
	wApplyUser = 1
}
BRNN_CMD_S_CommandResult = {
	cbAckType = 1,
	cbResult = 1,
	cbExtendData = {
		_t = 1,
		_l = {
			20
		}
	}
}
BCHI_CMD_S_BENCHI_StatusFree = {
	CheckImage = 1,
	wBankerUser = 1,
	bEnableSysBanker = 3,
	lApplyBankerCondition = 1,
	szGameRoomName = 2,
	lBankerWinScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lAreaLimitScore = 1,
	lBankerScore = 1,
	cbTimeLeave = 1
}
BCHI_CMD_S_BENCHI_ChangeUserScore = {
	lScore = 1,
	cbBankerTime = 1,
	lCurrentBankerScore = 1,
	wChairID = 1,
	wCurrentBankerChairID = 1
}
BCHI_CMD_S_GameEnd_Ex = {
	lRevenue = 1,
	lUserScore = 1,
	lUserReturnScore = 1,
	cbLeftCardCount = 1,
	bcFirstCard = 1,
	cbRankCount = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			1,
			1
		}
	},
	RankUser = {
		_t = "BCHI_tagRankUser",
		_l = {
			5
		}
	}
}
BCHI_CMD_S_BENCHI_ApplyBanker = {
	wApplyUser = 1
}
BCHI_CMD_S_BENCHI_StatusPlay = {
	cbTimeLeave = 1,
	lEndUserScore = 1,
	bEnableSysBanker = 3,
	wBankerUser = 1,
	lBankerScore = 1,
	lBankerWinScore = 1,
	cbGameStatus = 1,
	CheckImage = 1,
	szGameRoomName = 2,
	lEndRevenue = 1,
	lEndBankerScore = 1,
	lEndUserReturnScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lAreaLimitScore = 1,
	lApplyBankerCondition = 1,
	lAllJettonScore = {
		_t = 1,
		_l = {
			9
		}
	},
	lUserJettonScore = {
		_t = 1,
		_l = {
			9
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			1,
			1
		}
	}
}
BCHI_CMD_S_BENCHI_PlaceJettonFail = {
	wPlaceUser = 1,
	lJettonArea = 1,
	lPlaceScore = 1
}
BCHI_CMD_S_BENCHI_PlaceJetton = {
	wChairID = 1,
	lJettonScore = 1,
	cbJettonArea = 1,
	cbAndroid = 1
}
BCHI_CMD_C_BENCHI_UpdateStorage = {
	lStorage = 1,
	lStorageDeduct = 1
}
BCHI_BENCHItagServerGameRecord = {
	bWinMen = {
		_t = 1,
		_l = {
			9
		}
	}
}
BCHI_CMD_C_BENCHI_CheckImage = {
	Index = 1
}
BCHI_tagRankUser = {
	szUserName = 2,
	lWinScore = 1
}
BCHI_CMD_S_StatusPlay_Ex = {
	cbTimeLeave = 1,
	lEndUserScore = 1,
	bEnableSysBanker = 3,
	wBankerUser = 1,
	lBankerScore = 1,
	lBankerWinScore = 1,
	cbGameStatus = 1,
	CheckImage = 1,
	szGameRoomName = 2,
	cbRankCount = 1,
	lEndRevenue = 1,
	lEndBankerScore = 1,
	lEndUserReturnScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lAreaLimitScore = 1,
	lApplyBankerCondition = 1,
	lAllJettonScore = {
		_t = 1,
		_l = {
			9
		}
	},
	lUserJettonScore = {
		_t = 1,
		_l = {
			9
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			1,
			1
		}
	},
	RankUser = {
		_t = "BCHI_tagRankUser",
		_l = {
			5
		}
	}
}
BCHI_CMD_C_BENCHI_ControlApplication = {
	cbControlAppType = 1,
	nSerivalValue = 1,
	cbControlTimes = 1,
	cbControlArea = 1
}
BCHI_CMD_S_BENCHI_CancelBanker = {
	wChairID = 1
}
BCHI_CMD_S_BENCHI_SystemStorage = {
	lStorage = 1,
	lStorageDeduct = 1
}
BCHI_CMD_S_BENCHI_GameStart = {
	cbTimeLeave = 1,
	wBankerUser = 1,
	nChipRobotCount = 1,
	lBankerScore = 1,
	bContiueCard = 3,
	lUserMaxScore = 1,
	bRealUser = {
		_t = 3,
		_l = {
			150
		}
	}
}
BCHI_CMD_S_BENCHI_ControlReturns = {
	cbControlTimes = 1,
	cbControlArea = 1,
	cbReturnsType = 1
}
BCHI_CMD_S_BENCHI_ChangeBanker = {
	wBankerUser = 1,
	lBankerScore = 1
}
BCHI_CMD_S_BENCHI_GameFree = {
	cbTimeLeave = 1
}
BCHI_CMD_C_BENCHI_PlaceJetton = {
	cbJettonArea = 1,
	nSerivalValue = 1,
	lJettonScore = 1
}
BCHI_CMD_S_BENCHI_GameEnd = {
	lRevenue = 1,
	lUserScore = 1,
	lUserReturnScore = 1,
	cbLeftCardCount = 1,
	bcFirstCard = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			1,
			1
		}
	}
}
tagPropertyAttrib = {
	szPropertyName = 2,
	szRegulationsInfo = 2,
	szMeasuringunit = 2,
	wServiceArea = 1,
	wPropertyType = 1,
	wIndex = 1
}
tagPropertyItem = {
	PropertyInfo = "tagPropertyInfo",
	PropertyAttrib = "tagPropertyAttrib"
}
tagPropertyInfo = {
	lPropertyGold = 1,
	lRecvLoveLiness = 1,
	dPropertyCash = 1,
	lSendLoveLiness = 1,
	wIssueArea = 1,
	wDiscount = 1,
	wIndex = 1
}
CMD_C_Ox6_AdminFloatDelete = {
	lStorage = 1
}
CMD_S_Ox6_StatusPlay = {
	wBankerUser = 1,
	lTurnMaxScore = 1,
	lCellScore = 1,
	bCaiJin = 3,
	lCaijin = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			6
		}
	},
	lTableScore = {
		_t = 1,
		_l = {
			6
		}
	},
	caijinInfo = {
		_t = "Ox6_CajinInfo",
		_l = {
			10
		}
	},
	lAllCaijin = {
		_t = 1,
		_l = {
			6
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			6,
			5
		}
	},
	bOxCard = {
		_t = 1,
		_l = {
			6
		}
	}
}
CMD_C_Ox6_AdminControlAdd = {
	szMachineID = 2,
	nPercent = 1,
	cbType = 1,
	dwGameID = 1,
	nTimes = 1
}
CMD_S_Ox6_StatusCall = {
	wCallBanker = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			6
		}
	}
}
CMD_S_Ox6_GameEnd = {
	wWinUser = 1,
	lGetCaijin = 1,
	lCaijin = 1,
	lGameTax = {
		_t = 1,
		_l = {
			6
		}
	},
	lGameScore = {
		_t = 1,
		_l = {
			6
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			6
		}
	},
	caijinInfo = {
		_t = "Ox6_CajinInfo",
		_l = {
			10
		}
	}
}
CMD_S_Ox6_AdminControl = {
	szMachineID = 2,
	nPercent = 1,
	cbType = 1,
	dwGameID = 1,
	nTimes = 1
}
CMD_S_Ox6_CallBanker = {
	bFirstTimes = 3,
	wCallBanker = 1
}
Ox6_CajinInfo = {
	lGetCajin = 1,
	nickName = 2,
	cardType = 2
}
CMD_S_Ox6_PlayerExit = {
	wPlayerID = 1
}
CMD_C_Ox6_AdminFloatEnableUpdate = {
	cbEnable = 1
}
CMD_C_Ox6_AdminControlEnableUpdate = {
	cbEnable = 1
}
CMD_S_Ox6_StatusFree = {
	lCaijin = 1,
	bCaiJin = 3,
	lCellScore = 1,
	caijinInfo = {
		_t = "Ox6_CajinInfo",
		_l = {
			10
		}
	},
	lAllCaijin = {
		_t = 1,
		_l = {
			6
		}
	}
}
CMD_S_Ox6_AddScore = {
	wAddScoreUser = 1,
	lAddScoreCount = 1
}
CMD_S_Ox6_StatusScore = {
	lTurnMaxScore = 1,
	wBankerUser = 1,
	lTableScore = {
		_t = 1,
		_l = {
			6
		}
	},
	cbPlayStatus = {
		_t = 1,
		_l = {
			6
		}
	}
}
CMD_S_Ox6_AdminFloat = {
	lStorage = 1,
	nPercent = 1
}
CMD_C_Ox6_OxCard = {
	bOX = 1,
	nServriValue = 1
}
CMD_S_Ox6_AllCaijin = {
	lCaijin = 1
}
CMD_C_Ox6_AdminStorageUpdate = {
	lStorage = 1,
	nStorageDeduct = 1
}
CMD_S_Ox6_Open_Card = {
	wPlayerID = 1,
	bOpen = 1
}
CMD_C_Ox6_AdminControlDelete = {
	szMachineID = 2,
	cbType = 1,
	dwGameID = 1
}
CMD_S_Ox6_AdminStorage = {
	lStorage = 1,
	nStorageDeduct = 1
}
CMD_S_Ox6_SendCard = {
	cbCardData = {
		_t = 1,
		_l = {
			6,
			5
		}
	},
	cbPlayStatus = {
		_t = 1,
		_l = {
			6
		}
	}
}
CMD_C_Ox6_CallBanker = {
	bBanker = 1
}
CMD_C_Ox6_AddScore = {
	lScore = 1,
	nServriValue = 1
}
CMD_C_Ox6_AdminFloatAdd = {
	lStorage = 1,
	nPercent = 1
}
CMD_S_Ox6_GameStart = {
	wBankerUser = 1,
	lTurnMaxScore = 1
}
CMD_S_Ox6_AdminControlEnable = {
	cbEnable = 1
}
CMD_S_Ox6_AdminFloatEnable = {
	cbEnable = 1
}
CMD_S_HLZZ_AdminFloat = {
	lStorage = 1,
	nPercent = 1
}
HLZZ_CajinInfo = {
	lGetCajin = 1,
	nickName = {
		_t = 1,
		_l = {
			64
		}
	},
	cardType = {
		_t = 1,
		_l = {
			30
		}
	}
}
CMD_C_HLZZ_OxCard = {
	bOX = 1,
	nServriValue = 1
}
CMD_C_HLZZ_AdminFloatEnableUpdate = {
	cbEnable = 1
}
CMD_C_HLZZ_AdminStorageUpdate = {
	lStorage = 1,
	nStorageDeduct = 1
}
CMD_S_HLZZ_AdminStorage = {
	lStorage = 1,
	nStorageDeduct = 1
}
CMD_S_HLZZ_Open_Card = {
	wPlayerID = 1,
	bOpen = 1
}
CMD_S_HLZZ_AllCaijin = {
	lCaijin = 1
}
CMD_C_HLZZ_AdminControlDelete = {
	szMachineID = 2,
	cbType = 1,
	dwGameID = 1
}
CMD_C_HLZZ_AdminFloatAdd = {
	lStorage = 1,
	nPercent = 1
}
CMD_S_HLZZ_AddScore = {
	wAddScoreUser = 1,
	lAddScoreCount = 1
}
CMD_S_HLZZ_StatusCall = {
	wCallBanker = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			6
		}
	}
}
CMD_S_HLZZ_CallBanker = {
	bFirstTimes = 3,
	wCallBanker = 1
}
CMD_S_HLZZ_SendCard = {
	cbCardData = {
		_t = 1,
		_l = {
			6,
			5
		}
	},
	cbPlayStatus = {
		_t = 1,
		_l = {
			6
		}
	}
}
CMD_C_HLZZ_AdminControlAdd = {
	szMachineID = 2,
	nPercent = 1,
	cbType = 1,
	dwGameID = 1,
	nTimes = 1
}
CMD_S_HLZZ_StatusScore = {
	lTurnMaxScore = 1,
	wBankerUser = 1,
	lTableScore = {
		_t = 1,
		_l = {
			6
		}
	},
	cbPlayStatus = {
		_t = 1,
		_l = {
			6
		}
	}
}
CMD_S_HLZZ_AdminControlEnable = {
	cbEnable = 1
}
CMD_S_HLZZ_AdminFloatEnable = {
	cbEnable = 1
}
CMD_C_HLZZ_AdminFloatDelete = {
	lStorage = 1
}
CMD_C_HLZZ_CallBanker = {
	bBanker = 1
}
CMD_S_HLZZ_PlayerExit = {
	wPlayerID = 1
}
CMD_C_HLZZ_AdminControlEnableUpdate = {
	cbEnable = 1
}
CMD_C_HLZZ_AddScore = {
	lScore = 1,
	nServriValue = 1
}
CMD_S_HLZZ_AdminControl = {
	szMachineID = 2,
	nPercent = 1,
	cbType = 1,
	dwGameID = 1,
	nTimes = 1
}
CMD_S_SDB_StatusPlace = {
	lTotalJetton = 1,
	StatusFree = "CMD_S_SDB_StatusFree",
	lPlaceJetton = {
		_t = 1,
		_l = {
			150
		}
	}
}
CMD_S_SDB_GameStart = {
	lAreaLimitScore = 1,
	lUserMaxScore = 1,
	wBankerUser = 1,
	byTimeLeave = 1
}
CMD_C_SDB_ManageControl = {
	wChairID = 1,
	wTableID = 1,
	bWin = 3
}
CMD_S_SDB_RobBanker = {
	nRobBanker = 1,
	wApplyUser = 1
}
SDB_CMD_S_RobotGetMoney = {
	lMoney = 1
}
CMD_S_SDB_AddScoreFailed = {
	lAddScore = 1,
	wAddUser = 1
}
CMD_S_SDB_PlaceJetton = {
	wChairID = 1,
	lJettonScore = 1,
	lMaxScore = 1
}
CMD_S_SDB_SendCard = {
	wCurrentUser = 1,
	byCardData = 1
}
CMD_S_SDB_ApplyBanker = {
	nRobBanker = 1,
	wApplyUser = 1
}
CMD_S_SDB_GameEnd = {
	byTimeLeave = 1,
	lPlayerRevenue = 1,
	nBankerCardCount = 1,
	lBankerRevenue = 1,
	lBankerWinScore = 1,
	iBankerTotallScore = 1,
	cbRankCount = 1,
	nBankerTime = 1,
	nWinType = 1,
	lPlayerWinScore = 1,
	byBankerCardData = {
		_t = 1,
		_l = {
			5
		}
	},
	RankUser = {
		_t = "SDB_tagRankUser",
		_l = {
			5
		}
	}
}
CMD_S_SDB_CheckPlaceJetton = {
	llPlaceScore = 1
}
CMD_S_SDB_GameFree = {
	wBankerTimes = 1,
	lBankerWinScore = 1,
	byTimeLeave = 1
}
CMD_S_SDB_CheckState = {
	lPlaceJetton = 1,
	cbStopGet = 1,
	cbCardCount = 1,
	cbCardData = {
		_t = 1,
		_l = {
			5
		}
	}
}
SDB_tagGameResult = {
	wChairID = 1,
	byCardPoint = 1,
	byCardType = 1,
	lWinScore = 1
}
CMD_S_SDB_GetCard = {
	wCurrentUser = 1,
	byCardData = 1
}
CMD_S_SDB_StatusBanker = {
	lTotalJetton = 1,
	nBankerCardCount = 1,
	nPlayerCardCount = 1,
	bStopGet = 3,
	StatusFree = "CMD_S_SDB_StatusFree",
	lPlaceJetton = {
		_t = 1,
		_l = {
			150
		}
	},
	byBankerCardData = {
		_t = 1,
		_l = {
			5
		}
	},
	byPlayerCardData = {
		_t = 1,
		_l = {
			5
		}
	}
}
SDB_tagRankUser = {
	szUserName = 2,
	lWInScore = 1
}
CMD_S_SDB_ScoreFull = {
	byTimeLeave = 1
}
CMD_S_SDB_StatusFree = {
	nRobBanker = 1,
	lAreaLimitScore = 1,
	wBankerUser = 1,
	byTimeLeave = 1,
	wBankerTimes = 1,
	lBankerWinScore = 1,
	lApplyBankerCondition = 1
}
CMD_S_SDB_CancelApply = {
	nRobBanker = 1,
	wApplyUser = 1
}
CMD_C_SDB_CheckState = {
	cbWantedCardCount = 1,
	cbStopGet = 1,
	cbClientState = 1
}
CMD_S_SDB_BeginGet = {
	bBankerUser = 3,
	byTimeLeave = 1
}
CMD_S_SDB_ChangeBanker = {
	wBankerUser = 1,
	nRobBanker = 1
}
CMD_S_SDB_StatusGameEnd = {
	lTotalJetton = 1,
	nBankerCardCount = 1,
	nPlayerCardCount = 1,
	cbRankCount = 1,
	StatusFree = "CMD_S_SDB_StatusFree",
	lPlaceJetton = {
		_t = 1,
		_l = {
			150
		}
	},
	byBankerCardData = {
		_t = 1,
		_l = {
			5
		}
	},
	byPlayerCardData = {
		_t = 1,
		_l = {
			5
		}
	},
	RankUser = {
		_t = "SDB_tagRankUser",
		_l = {
			5
		}
	}
}
CMD_S_SDB_StopGet = {
	bSendCard = 1,
	bStopGet = 3
}
CMD_C_SDB_PlaceJetton = {
	lJettonScore = 1
}
CMD_S_SDB_StatusPlayer = {
	lTotalJetton = 1,
	nBankerCardCount = 1,
	nPlayerCardCount = 1,
	bStopGet = 3,
	StatusFree = "CMD_S_SDB_StatusFree",
	lPlaceJetton = {
		_t = 1,
		_l = {
			150
		}
	},
	byBankerCardData = {
		_t = 1,
		_l = {
			5
		}
	},
	byPlayerCardData = {
		_t = 1,
		_l = {
			5
		}
	}
}
ZaJinHuaBattle_CMD_S_CancelBanker = {
	wCancelUser = 1
}
ZaJinHuaBattle_CMD_S_GameStart = {
	lUserMaxScore = 1,
	wBankerUser = 1,
	nChipRobotCount = 1,
	lBankerScore = 1,
	nAndriodApplyCount = 1,
	cbTimeLeave = 1
}
ZaJinHuaBattle_tagCustomAndroid = {
	nEnableRobotBanker = 3,
	lRobotBetMaxCount = 1,
	lRobotMinBetTime = 1,
	lRobotListMaxCount = 1,
	lRobotScoreMin = 1,
	lRobotBankGetMin = 1,
	lRobotBankGetBankerMax = 1,
	lRobotBankGetBankerMin = 1,
	lRobotBankStoMul = 1,
	lRobotAreaLimit = 1,
	lRobotWaitBanker = 1,
	lRobotBankerCountMin = 1,
	lRobotScoreMax = 1,
	lRobotBankerCountMax = 1,
	lRobotMaxBetTime = 1,
	lRobotMinJetton = 1,
	lRobotBankGetMax = 1,
	lRobotBetMinCount = 1,
	lRobotListMinCount = 1,
	lRobotApplyBanker = 1,
	lRobotMaxJetton = 1
}
ZaJinHuaBattle_CMD_S_PlaceBet = {
	wChairID = 1,
	lBetScore = 1,
	cbBetArea = 1,
	lAllAreaBet = {
		_t = 1,
		_l = {
			4
		}
	},
	lPlayerAreaBet = {
		_t = 1,
		_l = {
			100,
			4
		}
	}
}
ZaJinHuaBattle_CMD_C_AdminReq = {
	cbExcuteTimes = 1,
	cbControlStyle = 1,
	cbReqType = 1,
	bWinArea = {
		_t = 3,
		_l = {
			4
		}
	}
}
ZaJinHuaBattle_CMD_S_PlaceBetFail = {
	bFleeFlag = 3,
	wPlaceUser = 1,
	lBetScore = 1,
	cbBetArea = 1
}
ZaJinHuaBattle_CMD_S_OccupyVIP_Fail = {
	wAlreadyOccupyVIPChairID = 1,
	cbAlreadyOccupyVIPIndex = 1,
	wVIPChairID = {
		_t = 1,
		_l = {
			4
		}
	}
}
ZaJinHuaBattle_CMD_S_GameEnd = {
	bSysReturnBonus = 3,
	lUserScore = 1,
	lBankerScore = 1,
	lUserReturnBonus = 1,
	cbTimeLeave = 1,
	cbCardDataItem = {
		_t = 1,
		_l = {
			5,
			3
		}
	},
	sheetRecord = {
		_t = "ZaJinHuaBattle_SHEET_RECORD",
		_l = {
			10
		}
	},
	AreaConclude = {
		_t = 1,
		_l = {
			4
		}
	}
}
ZaJinHuaBattle_CMD_S_StatusBet = {
	lEndGameMul = 1,
	occupyvipConfig = "ZaJinHuaBattle_OCCUPYVIPCONFIG",
	lApplyBankerCondition = 1,
	bEnableSysBanker = 3,
	lSysBankerScore = 1,
	cbGameStatus = 1,
	lBankerScore = 1,
	lCurrentBonus = 1,
	wBankerUser = 1,
	CustomAndroid = "ZaJinHuaBattle_tagCustomAndroid",
	lUserMaxScore = 1,
	lAreaLimitScore = 1,
	cbTimeLeave = 1,
	sheetRecord = {
		_t = "ZaJinHuaBattle_SHEET_RECORD",
		_l = {
			10
		}
	},
	lAllAreaBet = {
		_t = 1,
		_l = {
			4
		}
	},
	lPlayerAreaBet = {
		_t = 1,
		_l = {
			100,
			4
		}
	},
	wVIPChairID = {
		_t = 1,
		_l = {
			4
		}
	},
	bExistUser = {
		_t = 3,
		_l = {
			100
		}
	}
}
ZaJinHuaBattle_CMD_S_UserScroeNotify = {
	bEnableSysBanker = 3,
	wBankerUser = 1,
	lSysBankerScore = 1
}
ZaJinHuaBattle_CMD_S_ApplyBanker = {
	wApplyUser = 1
}
ZaJinHuaBattle_OCCUPYVIPCONFIG = {
	lOccupyVipConsume = 1,
	lOccupyVipFree = 1,
	lForceStandUpCondition = 1,
	occupyvipType = 1
}
ZaJinHuaBattle_CMD_S_UpdateUser = {
	bExistUser = {
		_t = 3,
		_l = {
			100
		}
	}
}
ZaJinHuaBattle_CMD_S_OccupyVIP = {
	wOccupyVIPChairID = 1,
	cbOccupyVIPIndex = 1,
	wVIPChairID = {
		_t = 1,
		_l = {
			4
		}
	}
}
ZaJinHuaBattle_CMD_C_UpdateStorage = {
	lStorageDeduct = 1,
	lStorageMax1 = 1,
	lStorageCurrent = 1,
	lStorageMul1 = 1,
	cbReqType = 1,
	lStorageMul2 = 1,
	lStorageMax2 = 1
}
ZaJinHuaBattle_CMD_S_CommandResult = {
	cbExcuteTimes = 1,
	cbControlStyle = 1,
	cbAckType = 1,
	cbResult = 1,
	bWinArea = {
		_t = 3,
		_l = {
			4
		}
	}
}
ZaJinHuaBattle_CMD_C_OccupyVIP = {
	cbOccupyVIPIndex = 1,
	wOccupyChairID = 1
}
ZaJinHuaBattle_SHEET_RECORD = {
	bInvalid = 3,
	AreaConclude = {
		_t = 1,
		_l = {
			4
		}
	}
}
ZaJinHuaBattle_CMD_S_UpdateStorage = {
	lStorageStart = 1,
	lStorageDeduct = 1,
	lStorageCurrent = 1,
	lStorageMax1 = 1,
	cbReqType = 1,
	lStorageMul1 = 1,
	lStorageMul2 = 1,
	lStorageMax2 = 1
}
ZaJinHuaBattle_CMD_S_StatusFree = {
	lEndGameMul = 1,
	lCurrentBonus = 1,
	lSysBankerScore = 1,
	bEnableSysBanker = 3,
	CustomAndroid = "ZaJinHuaBattle_tagCustomAndroid",
	cbGameStatus = 1,
	lUserMaxScore = 1,
	wBankerUser = 1,
	lAreaLimitScore = 1,
	lBankerScore = 1,
	occupyvipConfig = "ZaJinHuaBattle_OCCUPYVIPCONFIG",
	lApplyBankerCondition = 1,
	cbTimeLeave = 1,
	sheetRecord = {
		_t = "ZaJinHuaBattle_SHEET_RECORD",
		_l = {
			10
		}
	},
	wVIPChairID = {
		_t = 1,
		_l = {
			4
		}
	},
	bExistUser = {
		_t = 3,
		_l = {
			100
		}
	}
}
ZaJinHuaBattle_CMD_C_PlaceBet = {
	lBetScore = 1,
	cbBetArea = 1
}
ZaJinHuaBattle_CMD_S_GameFree = {
	lSysBankerScore = 1,
	lCurrentBonus = 1,
	lListUserCount = 1,
	cbTimeLeave = 1
}
ZaJinHuaBattle_CMD_S_StatusEnd = {
	lUserMaxScore = 1,
	lApplyBankerCondition = 1,
	bEnableSysBanker = 3,
	lSysBankerScore = 1,
	cbGameStatus = 1,
	lEndGameMul = 1,
	bSysReturnBonus = 3,
	occupyvipConfig = "ZaJinHuaBattle_OCCUPYVIPCONFIG",
	lBankerScore = 1,
	lCurrentBonus = 1,
	wBankerUser = 1,
	CustomAndroid = "ZaJinHuaBattle_tagCustomAndroid",
	lAreaLimitScore = 1,
	cbTimeLeave = 1,
	sheetRecord = {
		_t = "ZaJinHuaBattle_SHEET_RECORD",
		_l = {
			10
		}
	},
	lAllAreaBet = {
		_t = 1,
		_l = {
			4
		}
	},
	lPlayerAreaBet = {
		_t = 1,
		_l = {
			100,
			4
		}
	},
	AreaConclude = {
		_t = 1,
		_l = {
			4
		}
	},
	cbCardDataItem = {
		_t = 1,
		_l = {
			5,
			3
		}
	},
	wVIPChairID = {
		_t = 1,
		_l = {
			4
		}
	},
	bExistUser = {
		_t = 3,
		_l = {
			100
		}
	}
}
ZaJinHuaBattle_CMD_S_SendUserBetInfo = {
	lUserStartScore = {
		_t = 1,
		_l = {
			100
		}
	},
	lPlayerAreaBet = {
		_t = 1,
		_l = {
			100,
			4
		}
	}
}
ZaJinHuaBattle_CMD_S_UpdateVIP = {
	wQuitVIPChairID = 1,
	wVIPChairID = {
		_t = 1,
		_l = {
			4
		}
	}
}
ZaJinHuaBattle_CMD_S_ChangeBanker = {
	lBankerScore = 1,
	lSysBankerScore = 1,
	wBankerUser = 1
}
WZMJ_CMD_C_Listen_WZMJ = {
	cbListen = 1
}
WZMJ_CMD_S_Trustee_WZMJ = {
	bTrustee = 3,
	wChairID = 1
}
WZMJ_CMD_S_GameStart_WZMJ = {
	cbQuanFeng = 1,
	wBankerUser = 1,
	wHeapHead = 1,
	wCurrentUser = 1,
	lSiceCount = 1,
	cbUserAction = 1,
	cbHeapMagic = 1,
	wReplaceUser = 1,
	bMagicIndex = 1,
	cbLianZhuangCount = 1,
	wHeapTail = 1,
	wMagicPos = 1,
	cbCardData = {
		_t = 1,
		_l = {
			17
		}
	},
	cbHeapCardInfo = {
		_t = 1,
		_l = {
			4,
			2
		}
	}
}
WZMJ_CMD_C_Chip_WZMJ = {
	bMaiDi = 1
}
WZMJ_CMD_WeaveItem_WZMJ = {
	cbCenterCard = 1,
	wProvideUser = 1,
	cbPublicCard = 1,
	cbWeaveKind = 1,
	cbCardData = {
		_t = 1,
		_l = {
			4
		}
	}
}
WZMJ_CMD_S_OperateNotify_WZMJ = {
	cbActionCard = 1,
	wResumeUser = 1,
	cbActionMask = 1
}
WZMJ_CMD_S_ReplaceCard_WZMJ = {
	cbReplaceCard = 1,
	wReplaceUser = 1
}
WZMJ_CMD_C_ReplaceCard_WZMJ = {
	cbCardData = 1
}
WZMJ_CMD_S_GameEnd_WZMJ = {
	cbProvideCard = 1,
	cbFanCount = 1,
	lGameTax = 1,
	bIsEscape = 3,
	wProvideUser = 1,
	cbHuaCardCount = 1,
	dwChiHuKind = {
		_t = 1,
		_l = {
			2
		}
	},
	dwChiHuRight = {
		_t = 1,
		_l = {
			3
		}
	},
	lGameScore = {
		_t = 1,
		_l = {
			2
		}
	},
	cbCardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			2,
			17
		}
	}
}
WZMJ_CMD_S_Chip_WZMJ = {
	lCellScore = 1,
	wBankerUser = 1,
	cbLianZhuangCount = 1
}
WZMJ_CMD_S_StatusChip_WZMJ = {
	szGameRoomName = 2,
	wBankerUser = 1,
	cbLianZhuangCount = 1,
	lCellScore = 1,
	bTrustee = {
		_t = 3,
		_l = {
			2
		}
	},
	bMaiDi = {
		_t = 1,
		_l = {
			2
		}
	},
	bHaveMaiDi = {
		_t = 3,
		_l = {
			2
		}
	}
}
WZMJ_CMD_S_OutCard_WZMJ = {
	cbOutCardData = 1,
	wOutCardUser = 1
}
WZMJ_CMD_S_Chip_Result_WZMJ = {
	wMaiDiUser = 1,
	bTotal = 3,
	bMaidi = {
		_t = 1,
		_l = {
			2
		}
	}
}
WZMJ_CMD_S_StatusFree_WZMJ = {
	lMinEnterScore = 1,
	szGameRoomName = 2,
	wBankerUser = 1,
	lCellScore = 1,
	bTrustee = {
		_t = 3,
		_l = {
			2
		}
	}
}
WZMJ_CMD_S_StatusPlay_WZMJ = {
	cbLeftCardCount = 1,
	cbQuanFeng = 1,
	lCellScore = 1,
	cbActionCard = 1,
	cbActionMask = 1,
	cbHeapMagic = 1,
	cbOutCardData = 1,
	wOutCardUser = 1,
	wHeapTail = 1,
	wHeapHead = 1,
	bTuoPai = 3,
	wBankerUser = 1,
	cbCardCount = 1,
	wCurrentUser = 1,
	cbSendCardData = 1,
	wReplaceUser = 1,
	bMagicIndex = 1,
	wMagicPos = 1,
	cbFengCardCount = 1,
	szGameRoomName = 2,
	cbHuaCardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbHuaCardData = {
		_t = 1,
		_l = {
			2,
			8
		}
	},
	cbHuaCardInfo = {
		_t = 1,
		_l = {
			2,
			8
		}
	},
	cbHearStatus = {
		_t = 1,
		_l = {
			2
		}
	},
	bTrustee = {
		_t = 3,
		_l = {
			2
		}
	},
	cbDiscardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbDiscardCard = {
		_t = 1,
		_l = {
			2,
			60
		}
	},
	cbFengCardData = {
		_t = 1,
		_l = {
			8
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			17
		}
	},
	cbWeaveCount = {
		_t = 1,
		_l = {
			2
		}
	},
	WeaveItemArray = {
		_t = "WZMJ_CMD_WeaveItem_WZMJ",
		_l = {
			2,
			5
		}
	},
	cbHeapCardInfo = {
		_t = 1,
		_l = {
			4,
			2
		}
	}
}
WZMJ_CMD_S_SendCard_WZMJ = {
	cbActionMask = 1,
	wReplaceUser = 1,
	wSendCardUser = 1,
	bTail = 3,
	wCurrentUser = 1,
	cbCardData = 1
}
WZMJ_CMD_C_OperateCard_WZMJ = {
	cbOperateCode = 1,
	cbOperateCard = {
		_t = 1,
		_l = {
			3
		}
	}
}
WZMJ_CMD_S_OperateResult_WZMJ = {
	bTuoPai = 3,
	wOperateUser = 1,
	cbOperateCode = 1,
	wProvideUser = 1,
	cbOperateCard = {
		_t = 1,
		_l = {
			3
		}
	}
}
WZMJ_CMD_C_Trustee_WZMJ = {
	bTrustee = 3
}
WZMJ_CMD_C_OutCard_WZMJ = {
	cbCardData = 1
}
WZMJ_CMD_S_Listen_WZMJ = {
	wChairId = 1
}
WZMJ_CMD_S_TopUserCard_WZMJ = {
	cbCount = 1,
	cbCard = {
		_t = 1,
		_l = {
			17
		}
	}
}
CMD_CM_SystemMessage = {
	wLength = 1,
	wType = 1,
	szString = 2
}
CMD_S_HLZZ_ApplyBanker = {
	wApplyUser = 1
}
CMD_S_GameEnd = {
	wCurrentBanker = 1,
	lUserScore = 1,
	lRevenue = 1,
	lUserReturnScore = 1,
	cbLeftCardCount = 1,
	bcFirstCard = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			4,
			2
		}
	}
}
CMD_S_HLZZ_CancelBanker = {
	szCancelUser = 1
}
HLZZtagClientGameRecord = {
	bWinDuiMen = 3,
	bWinDaoMen = 3,
	bInit = 3,
	bWinShunMen = 3
}
HLZZtagServerGameRecord = {
	bWinDuiMen = 3,
	bWinDaoMen = 3,
	bWinShunMen = 3
}
CMD_S_HLZZ_GameEnd = {
	wCurrentBanker = 1,
	lUserScore = 1,
	lRevenue = 1,
	lUserReturnScore = 1,
	cbLeftCardCount = 1,
	bcFirstCard = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			4,
			2
		}
	}
}
HLZZ_tagControlInfo = {
	cbControlArea = {
		_t = 1,
		_l = {
			3
		}
	}
}
tagRankUser = {
	szUserName = 2,
	lWinScore = 1
}
CMD_S_HLZZ_ChangeBanker = {
	wBankerUser = 1,
	lBankerScore = 1
}
HLZZ_C_HLZZ_AdminReq = {
	nServerValue = 1,
	cbReqType = 1,
	cbExtendData = {
		_t = 1,
		_l = {
			20
		}
	}
}
CMD_S_HLZZ_PlaceJettonFail = {
	wPlaceUser = 1,
	lJettonArea = 1,
	lPlaceScore = 1
}
CMD_S_HLZZ_TagRankUser = {
	szUserName = 2,
	lWinScore = 1
}
CMD_S_StatusPlay = {
	lEndBankerScore = 1,
	bEnableSysBanker = 3,
	lQiangConition = 1,
	wBankerUser = 1,
	lBankerWinScore = 1,
	cbGameStatus = 1,
	cbTimeLeave = 1,
	dwServerID = 1,
	lBankerScore = 1,
	lEndRevenue = 1,
	lEndUserScore = 1,
	lEndUserReturnScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lQiangScore = 1,
	lAreaLimitScore = 1,
	lApplyBankerCondition = 1,
	lAllJettonScore = {
		_t = 1,
		_l = {
			7
		}
	},
	lUserJettonScore = {
		_t = 1,
		_l = {
			7
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			4,
			2
		}
	}
}
CMD_S_HLZZ_GameFree = {
	nBankerTime = 1,
	wCurrentBanker = 1,
	cbTimeLeave = 1
}
CMD_S_HLZZ_AccountResult = {
	szAccount = 2
}
CMD_S_HLZZ_StatusFree = {
	lApplyBankerCondition = 1,
	wBankerUser = 1,
	bEnableSysBanker = 3,
	lQiangConition = 1,
	dwServerId = 1,
	lBankerWinScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lQiangScore = 1,
	lAreaLimitScore = 1,
	lBankerScore = 1,
	cbTimeLeave = 1
}
CMD_C_HLZZ_PlaceJetton = {
	cbJettonArea = 1,
	lJettonScore = 1
}
CMD_S_HLZZ_SystemStorage = {
	lStorage = 1,
	lStorageDeduct = 1
}
CMD_S_HLZZ_ChangeUserScore = {
	lScore = 1,
	cbBankerTime = 1,
	lCurrentBankerScore = 1,
	wChairID = 1,
	wCurrentBankerChairID = 1
}
HLZZ_tagAdminReq = {
	m_cbControlStyle = 1,
	m_cbExcuteTimes = 1,
	m_bWinArea = {
		_t = 3,
		_l = {
			3
		}
	}
}
CMD_S_HLZZ_GameStart = {
	cbTimeLeave = 1,
	wBankerUser = 1,
	nChipRobotCount = 1,
	lBankerScore = 1,
	bContiueCard = 3,
	lUserMaxScore = 1
}
CMD_S_HLZZ_ScoreResult = {
	lUserJettonScore = {
		_t = 1,
		_l = {
			7
		}
	}
}
CMD_S_GameEnd_Ex = {
	wCurrentBanker = 1,
	lUserScore = 1,
	lRevenue = 1,
	lUserReturnScore = 1,
	cbLeftCardCount = 1,
	bcFirstCard = 1,
	cbRankCount = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			4,
			2
		}
	},
	RankUser = {
		_t = "tagRankUser",
		_l = {
			5
		}
	},
	lAreaScore = {
		_t = 1,
		_l = {
			7
		}
	}
}
CMD_S_HLZZ_StatusPlay = {
	lEndBankerScore = 1,
	bEnableSysBanker = 3,
	lQiangConition = 1,
	wBankerUser = 1,
	lBankerWinScore = 1,
	cbGameStatus = 1,
	cbTimeLeave = 1,
	dwServerId = 1,
	lBankerScore = 1,
	lEndRevenue = 1,
	lEndUserScore = 1,
	lEndUserReturnScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lQiangScore = 1,
	lAreaLimitScore = 1,
	lApplyBankerCondition = 1,
	lAllJettonScore = {
		_t = 1,
		_l = {
			7
		}
	},
	lUserJettonScore = {
		_t = 1,
		_l = {
			7
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			4,
			2
		}
	}
}
CMD_S_HLZZ_GameEnd_Ex = {
	wCurrentBanker = 1,
	lUserScore = 1,
	lRevenue = 1,
	lUserReturnScore = 1,
	cbLeftCardCount = 1,
	bcFirstCard = 1,
	cbRankCount = 1,
	nBankerTime = 1,
	lBankerScore = 1,
	lBankerTotallScore = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			4,
			2
		}
	},
	RankUser = {
		_t = "CMD_S_HLZZ_TagRankUser",
		_l = {
			5
		}
	},
	lAreaScore = {
		_t = 1,
		_l = {
			7
		}
	}
}
CMD_C_HLZZ_UpdateStorage = {
	lStorage = 1,
	lStorageDeduct = 1
}
CMD_S_StatusPlay_Ex = {
	lEndBankerScore = 1,
	bEnableSysBanker = 3,
	lQiangConition = 1,
	wBankerUser = 1,
	lBankerWinScore = 1,
	cbGameStatus = 1,
	cbTimeLeave = 1,
	dwServerID = 1,
	cbRankCount = 1,
	lBankerScore = 1,
	lEndRevenue = 1,
	lEndUserScore = 1,
	lEndUserReturnScore = 1,
	lUserMaxScore = 1,
	cbBankerTime = 1,
	lQiangScore = 1,
	lAreaLimitScore = 1,
	lApplyBankerCondition = 1,
	lAllJettonScore = {
		_t = 1,
		_l = {
			7
		}
	},
	lUserJettonScore = {
		_t = 1,
		_l = {
			7
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			4,
			2
		}
	},
	RankUser = {
		_t = "tagRankUser",
		_l = {
			5
		}
	},
	lAreaScore = {
		_t = 1,
		_l = {
			7
		}
	}
}
CMD_S_HLZZ_Cheat = {
	cbTableCardArray = {
		_t = 1,
		_l = {
			4,
			2
		}
	}
}
CMD_S_HLZZ_PlaceJetton = {
	wChairID = 1,
	lJettonScore = 1,
	cbJettonArea = 1,
	bIsAndroid = 3
}
FISH_CMD_S_CANNON_SET = {
	cannonType = 1,
	cannonMul = 1,
	cannonSet = 1,
	wChairID = 1
}
FISH_CMD_S_BULLET_SET = {
	nMaxCatch = 1,
	nSpeed = 1,
	nCannonType = 1,
	nBulletSize = 1,
	bFirst = 3,
	nCatchRadio = 1,
	nMulriple = 1
}
FISH_CMD_S_SEND_DES = {
	nCount = 1,
	szDes = {
		_t = 2,
		_l = {
			4
		}
	}
}
FISH_CMD_C_NETCAST = {
	dwData = 1,
	dwFishID = 1,
	dwBulletID = 1
}
FISH_CMD_S_MATCH_END = {
	lScore = 1,
	lCatchScore = 1,
	dwRanking = 1
}
FISH_CMD_C_CHANGE_CANNON = {
	wChairID = 1,
	bAdd = 3
}
FISH_CMD_S_FISH_MUL = {
	nMul = 1,
	nFishID = 1
}
FISH_CMD_S_LOCK_FISH = {
	wChairID = 1,
	dwLockID = 1
}
FISH_CMD_S_SEND_BULLET = {
	nMultiply = 1,
	wChairID = 1,
	nCannonType = 1,
	fYPos = 1,
	fXpos = 1,
	dwID = 1,
	bNew = 3,
	IsDouble = 3,
	dwCreateTick = 1,
	lScore = 1,
	fDirection = 1,
	dwServerTick = 1
}
FISH_CMD_S_SWITCH_SCENE = {
	nst = 1,
	bSwitching = 3
}
FISH_CMD_S_SCORE_SYNC = {
	wChairID = 1,
	lScore = 1
}
FISH_CMD_C_CHANGE_CANNONSET = {
	wChairID = 1,
	bAdd = 3
}
FISH_CMD_C_LOCK_SOME_FISH = {
	dwFishID = 1
}
FISH_CMD_C_SPEEDUP = {
	cbMulti = 1
}
FISH_CMD_S_SPEEDUP = {
	wChairID = 1,
	dwStartTick = 1,
	cbSpeedMul = 1
}
FISH_CMD_S_ADD_BUFFER = {
	fBufferTime = 1,
	nBufferType = 1,
	fBufferParam = 1
}
FISH_CMD_C_CHANGE_SCORE = {
	wChairID = 1,
	bAdd = 3,
	bAddAll = 3
}
FISH_CMD_S_SendFish = {
	FishSpeed = 1,
	fDir = 1,
	FisType = 1,
	fOffestX = 1,
	nTypeID = 1,
	nRefershID = 1,
	nPathID = 1,
	fDelay = 1,
	bTroop = 3,
	dwCreateTick = 1,
	dwFishID = 1,
	fOffestY = 1,
	dwServerTick = 1
}
FISH_CMD_C_TREASURE_END = {
	wChairID = 1,
	lScore = 1
}
FISH_CompetitionRanking = {
	dwCatchScore = 1,
	szNickName = 2,
	dwCatchFishCount = 1,
	dwRanking = 1,
	dwUserId = 1
}
FISH_CMD_S_KILL_BULLET = {
	wChairID = 1,
	dwBulletID = 1
}
FISH_AndroidUpdata = {
	FishCount = 1,
	dir = 1
}
FISH_CMD_S_USER_INFO = {
	lScore = 1,
	nCannonType = 1,
	nCannonMul = 1,
	wChairID = 1,
	lWastage = 1
}
FISH_CMD_C_FIRE = {
	wChairID = 1,
	fDirection = 1,
	dwFireTime = 1,
	dwClientID = 1
}
FISH_CMD_S_UPDATE_RANKING = {
	dwCatchScore = 1,
	lScore = 1,
	szNickName = 2,
	dwCatchFishCount = 1,
	dwRanking = 1,
	dwUserId = 1
}
FISH_CMD_C_LOCK_FISH = {
	wChairID = 1,
	bLock = 3
}
FISH_CMD_S_CUR_RANKING = {
	MatchUserCount = 1,
	dwRanking = 1,
	wChairId = 1,
	lScore = 1,
	lMaxScore = 1
}
FISH_CMD_S_TIME_SYNC = {
	wChiarID = 1,
	dwClientTick = 1,
	dwServerTick = 1
}
FISH_CMD_S_CHANGE_SCORE = {
	lFishScore = 1,
	wChairID = 1,
	lWastageScore = 1
}
FISH_CMD_C_TIME_SYNC = {
	wChairID = 1,
	dwClientTick = 1
}
FISH_CMD_S_ALLOW_FIRE = {
	m_bAllowFire = 3
}
FISH_CMD_S_KILL_FISH = {
	lScore = 1,
	wChairID = 1,
	dwFishID = 1,
	nBScoe = 1
}
FISH_CMD_S_ACTIVITY_NOTIFY = {
	nActivityTime = 1,
	bStart = 3,
	szFishName = 2
}
FISH_CMD_S_EFFECT_KILL = {
	dwFishID = 1,
	effectType = 1,
	nBScoe = 1,
	wChairID = 1,
	fishes = {
		_t = 1,
		_l = {
			100
		}
	},
	scores = {
		_t = 1,
		_l = {
			100
		}
	}
}
FISH_CMD_S_ADD_BUFFER_EX = {
	nBufferType = 1,
	fBufferTime = 1,
	fBufferParam = 1,
	caster = 1,
	fishes = {
		_t = 1,
		_l = {
			100
		}
	}
}
FISH_CMD_S_GameConfig = {
	nMaxInterval = 1,
	nFireInterval = 1,
	nChangeRatioFishScore = 1,
	nMinInterval = 1,
	nShowGoldMinMul = 1,
	nChangeRatioUserScore = 1,
	wServerID = 1,
	nExchangeOnce = 1,
	nMaxCannon = 1,
	nMaxBulletCount = 1
}
FISHINGJOY_CMD_S_CANNON_SET = {
	cannonType = 1,
	cannonMul = 1,
	cannonSet = 1,
	wChairID = 1
}
FISHINGJOY_CMD_S_BULLET_SET = {
	nMaxCatch = 1,
	nSpeed = 1,
	nCannonType = 1,
	nBulletSize = 1,
	bFirst = 3,
	nCatchRadio = 1,
	nMulriple = 1
}
FISHINGJOY_CMD_S_SEND_DES = {
	nCount = 1,
	szDes = {
		_t = 2,
		_l = {
			4
		}
	}
}
FISHINGJOY_CMD_C_NETCAST = {
	dwData = 1,
	dwFishID = 1,
	dwBulletID = 1
}
FISHINGJOY_CMD_S_MATCH_END = {
	lScore = 1,
	lCatchScore = 1,
	dwRanking = 1
}
FISHINGJOY_CMD_C_CHANGE_CANNON = {
	wChairID = 1,
	bAdd = 3
}
FISHINGJOY_CMD_S_FISH_MUL = {
	nMul = 1,
	nFishID = 1
}
FISHINGJOY_CMD_S_LOCK_FISH = {
	wChairID = 1,
	dwLockID = 1
}
FISHINGJOY_CMD_S_SEND_BULLET = {
	nMultiply = 1,
	wChairID = 1,
	nCannonType = 1,
	fYPos = 1,
	fXpos = 1,
	dwID = 1,
	bNew = 3,
	IsDouble = 3,
	dwCreateTick = 1,
	lScore = 1,
	fDirection = 1,
	dwServerTick = 1
}
FISHINGJOY_CMD_S_SWITCH_SCENE = {
	nst = 1,
	bSwitching = 3
}
FISHINGJOY_CMD_S_SCORE_SYNC = {
	wChairID = 1,
	lScore = 1
}
FISHINGJOY_CMD_C_CHANGE_CANNONSET = {
	wChairID = 1,
	bAdd = 3
}
FISHINGJOY_CMD_C_LOCK_SOME_FISH = {
	dwFishID = 1
}
FISHINGJOY_CMD_C_SPEEDUP = {
	cbMulti = 1
}
FISHINGJOY_CMD_S_SPEEDUP = {
	wChairID = 1,
	dwStartTick = 1,
	cbSpeedMul = 1
}
FISHINGJOY_CMD_S_ADD_BUFFER = {
	fBufferTime = 1,
	nBufferType = 1,
	fBufferParam = 1
}
FISHINGJOY_CMD_C_CHANGE_SCORE = {
	wChairID = 1,
	bAdd = 3,
	bAddAll = 3
}
FISHINGJOY_CMD_S_SendFish = {
	FishSpeed = 1,
	fDir = 1,
	FisType = 1,
	fOffestX = 1,
	nTypeID = 1,
	nRefershID = 1,
	nPathID = 1,
	fDelay = 1,
	bTroop = 3,
	dwCreateTick = 1,
	dwFishID = 1,
	fOffestY = 1,
	dwServerTick = 1
}
FISHINGJOY_CMD_C_TREASURE_END = {
	wChairID = 1,
	lScore = 1
}
FISH_CompetitionRanking = {
	dwCatchScore = 1,
	szNickName = 2,
	dwCatchFishCount = 1,
	dwRanking = 1,
	dwUserId = 1
}
FISHINGJOY_CMD_S_KILL_BULLET = {
	wChairID = 1,
	dwBulletID = 1
}
FISH_AndroidUpdata = {
	FishCount = 1,
	dir = 1
}
FISHINGJOY_CMD_S_USER_INFO = {
	lScore = 1,
	nCannonType = 1,
	nCannonMul = 1,
	wChairID = 1,
	lWastage = 1
}
FISHINGJOY_CMD_C_FIRE = {
	wChairID = 1,
	fDirection = 1,
	dwFireTime = 1,
	dwClientID = 1
}
FISHINGJOY_CMD_S_UPDATE_RANKING = {
	dwCatchScore = 1,
	lScore = 1,
	szNickName = 2,
	dwCatchFishCount = 1,
	dwRanking = 1,
	dwUserId = 1
}
FISHINGJOY_CMD_C_LOCK_FISH = {
	wChairID = 1,
	bLock = 3
}
FISHINGJOY_CMD_S_CUR_RANKING = {
	MatchUserCount = 1,
	dwRanking = 1,
	wChairId = 1,
	lScore = 1,
	lMaxScore = 1
}
FISHINGJOY_CMD_S_TIME_SYNC = {
	wChiarID = 1,
	dwClientTick = 1,
	dwServerTick = 1
}
FISHINGJOY_CMD_S_CHANGE_SCORE = {
	lFishScore = 1,
	wChairID = 1,
	lWastageScore = 1
}
FISHINGJOY_CMD_C_TIME_SYNC = {
	wChairID = 1,
	dwClientTick = 1
}
FISHINGJOY_CMD_S_ALLOW_FIRE = {
	m_bAllowFire = 3
}
FISHINGJOY_CMD_S_KILL_FISH = {
	lScore = 1,
	wChairID = 1,
	dwFishID = 1,
	nBScoe = 1
}
FISHINGJOY_CMD_S_ACTIVITY_NOTIFY = {
	nActivityTime = 1,
	bStart = 3,
	szFishName = 2
}
FISHINGJOY_CMD_S_EFFECT_KILL = {
	dwFishID = 1,
	effectType = 1,
	nBScoe = 1,
	wChairID = 1,
	fishes = {
		_t = 1,
		_l = {
			100
		}
	},
	scores = {
		_t = 1,
		_l = {
			100
		}
	}
}
FISHINGJOY_CMD_S_ADD_BUFFER_EX = {
	nBufferType = 1,
	fBufferTime = 1,
	fBufferParam = 1,
	caster = 1,
	fishes = {
		_t = 1,
		_l = {
			100
		}
	}
}
FISHINGJOY_CMD_S_GameConfig = {
	nMaxInterval = 1,
	nFireInterval = 1,
	nChangeRatioFishScore = 1,
	nMinInterval = 1,
	nShowGoldMinMul = 1,
	nChangeRatioUserScore = 1,
	wServerID = 1,
	nExchangeOnce = 1,
	nMaxCannon = 1,
	nMaxBulletCount = 1
}
FISH_LK_CMD_S_TIME_SYNC_FORCE = {
	dwServerTick = 1
}
FISH_LK_CMD_S_LANGLAILE = {
	nFishID = 1
}
FISH_LK_CMD_S_CHANGE_SPEED = {
	fSpeed = 1,
	dwServerTick = 1,
	nFishID = 1
}
FISH_LK_CMD_S_CANNON_SET = {
	cannonType = 1,
	cannonSet = 1,
	wChairID = 1,
	cannonMul = 1,
	dwServerTick = 1
}
FISH_LK_CMD_S_BULLET_SET = {
	nMaxCatch = 1,
	nSpeed = 1,
	nCannonType = 1,
	nBulletSize = 1,
	bFirst = 3,
	nCatchRadio = 1,
	nMulriple = 1
}
FISH_LK_CMD_S_SEND_DES = {
	nCount = 1,
	szDes = {
		_t = 2,
		_l = {
			4
		}
	}
}
FISH_LK_CMD_C_NETCAST = {
	dwData = 1,
	dwFishID = 1,
	dwBulletID = 1
}
FISH_LK_CMD_S_MATCH_END = {
	lScore = 1,
	lCatchScore = 1,
	dwRanking = 1
}
FISH_LK_CMD_C_CHANGE_CANNON = {
	wChairID = 1,
	bAdd = 3
}
FISH_LK_CMD_S_FISH_MUL = {
	nMul = 1,
	nFishID = 1
}
FISH_LK_CMD_S_LOCK_FISH = {
	wChairID = 1,
	dwLockID = 1
}
FISH_LK_CMD_S_SEND_BULLET = {
	nMultiply = 1,
	wChairID = 1,
	nCannonType = 1,
	fYPos = 1,
	fXpos = 1,
	dwID = 1,
	bNew = 3,
	IsDouble = 3,
	dwCreateTick = 1,
	lScore = 1,
	fDirection = 1,
	dwServerTick = 1
}
FISH_LK_CMD_S_SWITCH_SCENE = {
	nst = 1,
	bSwitching = 3
}
FISH_LK_CMD_S_SCORE_SYNC = {
	wChairID = 1,
	lScore = 1
}
FISH_LK_CMD_C_CHANGE_CANNONSET = {
	wChairID = 1,
	bAdd = 3
}
FISH_LK_CMD_C_LOCK_SOME_FISH = {
	dwFishID = 1
}
FISH_LK_CMD_C_SPEEDUP = {
	cbMulti = 1
}
FISH_LK_CMD_S_SPEEDUP = {
	wChairID = 1,
	dwStartTick = 1,
	cbSpeedMul = 1
}
FISH_LK_CMD_S_ADD_BUFFER = {
	fBufferTime = 1,
	nBufferType = 1,
	dwServerTick = 1,
	fBufferParam = 1
}
FISH_LK_CMD_C_CHANGE_SCORE = {
	wChairID = 1,
	bAdd = 3,
	bAddAll = 3
}
FISH_LK_CMD_S_SendFish = {
	FishSpeed = 1,
	fDir = 1,
	FisType = 1,
	fOffestX = 1,
	nTypeID = 1,
	nRefershID = 1,
	nPathID = 1,
	fDelay = 1,
	bTroop = 3,
	dwCreateTick = 1,
	dwFishID = 1,
	fOffestY = 1,
	dwServerTick = 1
}
FISH_LK_CMD_C_TREASURE_END = {
	wChairID = 1,
	lScore = 1
}
FISH_CompetitionRanking = {
	dwCatchScore = 1,
	szNickName = 2,
	dwCatchFishCount = 1,
	dwRanking = 1,
	dwUserId = 1
}
FISH_LK_CMD_S_KILL_BULLET = {
	wChairID = 1,
	dwBulletID = 1
}
FISH_AndroidUpdata = {
	FishCount = 1,
	dir = 1
}
FISH_LK_CMD_S_USER_INFO = {
	lScore = 1,
	nCannonSet = 1,
	nCannonType = 1,
	nCannonMul = 1,
	wChairID = 1,
	lWastage = 1
}
FISH_LK_CMD_C_FIRE = {
	wChairID = 1,
	fDirection = 1,
	dwFireTime = 1,
	dwClientID = 1
}
FISH_LK_CMD_S_UPDATE_RANKING = {
	dwCatchScore = 1,
	lScore = 1,
	szNickName = 2,
	dwCatchFishCount = 1,
	dwRanking = 1,
	dwUserId = 1
}
FISH_LK_CMD_C_LOCK_FISH = {
	wChairID = 1,
	bLock = 3
}
FISH_LK_CMD_S_CUR_RANKING = {
	MatchUserCount = 1,
	dwRanking = 1,
	wChairId = 1,
	lScore = 1,
	lMaxScore = 1
}
FISH_LK_CMD_S_TIME_SYNC = {
	wChiarID = 1,
	dwClientTick = 1,
	dwServerTick = 1
}
FISH_LK_CMD_S_CHANGE_SCORE = {
	lFishScore = 1,
	wChairID = 1,
	lWastageScore = 1
}
FISH_LK_CMD_C_TIME_SYNC = {
	wChairID = 1,
	dwClientTick = 1
}
FISH_LK_CMD_S_ALLOW_FIRE = {
	m_bAllowFire = 3
}
FISH_LK_CMD_S_KILL_FISH = {
	wChairID = 1,
	lScore = 1,
	lTotalScore = 1,
	nBScoe = 1,
	dwFishID = 1,
	dwServerTick = 1
}
FISH_LK_CMD_S_ACTIVITY_NOTIFY = {
	nActivityTime = 1,
	bStart = 3,
	szFishName = 2
}
FISH_LK_CMD_S_EFFECT_KILL = {
	dwFishID = 1,
	effectType = 1,
	nBScoe = 1,
	wChairID = 1,
	fishes = {
		_t = 1,
		_l = {
			100
		}
	},
	scores = {
		_t = 1,
		_l = {
			100
		}
	}
}
FISH_LK_CMD_S_ADD_BUFFER_EX = {
	nBufferType = 1,
	fBufferTime = 1,
	fBufferParam = 1,
	caster = 1,
	fishes = {
		_t = 1,
		_l = {
			100
		}
	}
}
FISH_LK_CMD_S_GameConfig = {
	nMaxInterval = 1,
	nFireInterval = 1,
	nChangeRatioFishScore = 1,
	nMinInterval = 1,
	nShowGoldMinMul = 1,
	nChangeRatioUserScore = 1,
	wServerID = 1,
	nExchangeOnce = 1,
	nMaxCannon = 1,
	nMaxBulletCount = 1
}
FISH_LK_CMD_S_LIKUI_KILL_FISH = {
	dwServerTick = 1,
	lTotalScore = 1,
	dwKillID = 1,
	dwFishID = {
		_t = 1,
		_l = {
			256
		}
	}
}
FISH_LK_CMD_S_UPDATE_POSE = {
	y = 1,
	dwServerTick = 1,
	x = 1,
	nFishID = 1
}
FISH_LK_CMD_S_KILL_SPECIAL = {
	wChairID = 1,
	lScore = 1,
	lTotalScore = 1,
	nBScoe = 1,
	dwFishID = 1,
	dwServerTick = 1,
	dwTargetID = {
		_t = 1,
		_l = {
			100
		}
	}
}
WZMJ_WeaveItem_Array_New = {
	WeaveItemArray = {
		_t = "WZMJ_CMD_WeaveItem_WZMJ",
		_l = {
			2,
			5
		}
	}
}
HHDZ_CMD_S_Status = {
	lPlayAllScore = 1,
	cbWinner = 1,
	lPlayFreeSocre = 1,
	dwServerId = 1,
	cbGameStatus = 1,
	lPlayBetScore = 1,
	lUserLimitScore = 1,
	cbTimeLeave = 1,
	lAllBet = {
		_t = 1,
		_l = {
			3
		}
	},
	lPlayBet = {
		_t = 1,
		_l = {
			3
		}
	},
	lAllPlayScore = {
		_t = 1,
		_l = {
			3
		}
	},
	lPlayScore = {
		_t = 1,
		_l = {
			3
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			2,
			3
		}
	},
	cbTableCardType = {
		_t = 1,
		_l = {
			2
		}
	},
	lAreaLimitScore = {
		_t = 1,
		_l = {
			3
		}
	},
	dwResultHistory = {
		_t = 1,
		_l = {
			100
		}
	},
	dwCardHistory = {
		_t = 1,
		_l = {
			20
		}
	}
}
HHDZ_CMD_S_PlaceBet = {
	wChairID = 1,
	lBetScore = 1,
	cbBetArea = 1
}
HHDZ_CMD_S_PlaceBetEx = {
	wChairID = 1,
	bSucees = 3,
	bFailureDesc = 2,
	cbBetArea = 1,
	lBetScore = {
		_t = 1,
		_l = {
			10
		}
	},
	lBetNumber = {
		_t = 1,
		_l = {
			10
		}
	}
}
HHDZ_CMD_S_PlaceBetFail = {
	lBetArea = 1,
	wPlaceUser = 1,
	lPlaceScore = 1
}
HHDZ_CMD_S_GameFree = {
	cbTimeLeave = 1
}
HHDZ_CMD_S_GameStart = {
	lUserLimitScore = 1,
	lPlayBetScore = 1,
	nChipRobotCount = 1,
	lPlayFreeSocre = 1,
	cbTimeLeave = 1,
	lAreaLimitScore = {
		_t = 1,
		_l = {
			3
		}
	}
}
HHDZ_CMD_S_GameEnd = {
	lPlayAllScore = 1,
	cbWinner = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			2,
			3
		}
	},
	cbTableCardType = {
		_t = 1,
		_l = {
			2
		}
	},
	lAllPlayScore = {
		_t = 1,
		_l = {
			3
		}
	},
	lPlayScore = {
		_t = 1,
		_l = {
			3
		}
	}
}
HHDZ_CMD_C_PlaceBet = {
	lBetScore = 1,
	cbBetArea = 1
}
HHDZ_CMD_C_PlaceBetEx = {
	cbBetArea = 1,
	lBetScore = {
		_t = 1,
		_l = {
			10
		}
	},
	lBetNumber = {
		_t = 1,
		_l = {
			10
		}
	}
}
LHD_CMD_S_Status = {
	lPlayBetScore = 1,
	lPlayAllScore = 1,
	cbWinner = 1,
	lPlayFreeSocre = 1,
	cbGameStatus = 1,
	lBetMin = 1,
	dwServerId = 1,
	dwResultIndex = 1,
	lUserLimitScore = 1,
	cbTimeLeave = 1,
	lAllBet = {
		_t = 1,
		_l = {
			3
		}
	},
	lPlayBet = {
		_t = 1,
		_l = {
			3
		}
	},
	lAllPlayScore = {
		_t = 1,
		_l = {
			3
		}
	},
	lPlayScore = {
		_t = 1,
		_l = {
			3
		}
	},
	cbTableCardArray = {
		_t = 1,
		_l = {
			2
		}
	},
	lAreaLimitScore = {
		_t = 1,
		_l = {
			3
		}
	},
	dwResultHistory = {
		_t = 1,
		_l = {
			100
		}
	}
}
LHD_CMD_S_PlaceBet = {
	wChairID = 1,
	lBetScore = 1,
	cbBetArea = 1
}
LHD_CMD_S_PlaceBetEx = {
	wChairID = 1,
	bSucees = 3,
	bFailureDesc = 2,
	cbBetArea = 1,
	lBetScore = {
		_t = 1,
		_l = {
			10
		}
	},
	lBetNumber = {
		_t = 1,
		_l = {
			10
		}
	}
}
LHD_CMD_S_PlaceBetFail = {
	lBetArea = 1,
	wPlaceUser = 1,
	lPlaceScore = 1
}
LHD_CMD_S_GameFree = {
	cbTimeLeave = 1
}
LHD_CMD_S_GameStart = {
	lUserLimitScore = 1,
	lPlayBetScore = 1,
	nChipRobotCount = 1,
	lPlayFreeSocre = 1,
	cbTimeLeave = 1,
	lAreaLimitScore = {
		_t = 1,
		_l = {
			3
		}
	}
}
LHD_CMD_S_GameEnd = {
	lPlayAllScore = 1,
	cbWinner = 1,
	dwResultIndex = 1,
	cbTimeLeave = 1,
	cbTableCardArray = {
		_t = 1,
		_l = {
			2
		}
	},
	lAllPlayScore = {
		_t = 1,
		_l = {
			3
		}
	},
	lPlayScore = {
		_t = 1,
		_l = {
			3
		}
	}
}
LHD_CMD_C_PlaceBet = {
	lBetScore = 1,
	cbBetArea = 1
}
LHD_CMD_C_PlaceBetEx = {
	cbBetArea = 1,
	lBetScore = {
		_t = 1,
		_l = {
			10
		}
	},
	lBetNumber = {
		_t = 1,
		_l = {
			10
		}
	}
}
DDZ_CMD_S_TRUSTEE = {
	wTrusteeUser = 1,
	bTrustee = 1
}
DDZ_CMD_S_StatusCall = {
	cbTimeStartGame = 1,
	wCurrentUser = 1,
	cbTimeCallScore = 1,
	lCellScore = 1,
	wStartUser = 1,
	cbBankerScore = 1,
	cbTimeAddTimes = 1,
	cbTimeHeadOutCard = 1,
	szGuid = 2,
	cbTimeOutCard = 1,
	cbScoreInfo = {
		_t = 1,
		_l = {
			3
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			17
		}
	},
	cbUserTrustee = {
		_t = 1,
		_l = {
			3
		}
	},
	lTurnScore = {
		_t = 1,
		_l = {
			3
		}
	},
	lCollectScore = {
		_t = 1,
		_l = {
			3
		}
	}
}
DDZ_CMD_C_AddTimes = {
	cbTimes = 1
}
DDZ_CMD_S_CallScore = {
	wCurrentUser = 1,
	wCallScoreUser = 1,
	cbUserCallScore = 1,
	cbCurrentScore = 1
}
DDZ_CMD_C_CallScore = {
	cbCallScore = 1
}
DDZ_CMD_S_GameConclude = {
	bChunTian = 1,
	cbBombCount = 1,
	bFanChunTian = 1,
	lCellScore = 1,
	cbBankerScore = 1,
	lGameScore = {
		_t = 1,
		_l = {
			3
		}
	},
	cbEachBombCount = {
		_t = 1,
		_l = {
			3
		}
	},
	cbCardCount = {
		_t = 1,
		_l = {
			3
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			54
		}
	},
	cbAddTimes = {
		_t = 1,
		_l = {
			3
		}
	},
	lRevenue = {
		_t = 1,
		_l = {
			3
		}
	}
}
DDZ_CMD_S_CheatCard = {
	cbUserCount = 1,
	wCardUser = {
		_t = 1,
		_l = {
			3
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			3,
			20
		}
	},
	cbCardCount = {
		_t = 1,
		_l = {
			3
		}
	}
}
DDZ_CMD_S_OpenCard = {
	cbPlusTimes = 1,
	wOpenUser = 1,
	cbCardData = {
		_t = 1,
		_l = {
			20
		}
	}
}
DDZ_CMD_S_GameStart = {
	lCellScore = 1,
	cbTimeStartGame = 1,
	wStartUser = 1,
	cbTimeCallScore = 1,
	wCurrentUser = 1,
	cbTimeAddTimes = 1,
	cbTimeHeadOutCard = 1,
	cbValidCardData = 1,
	cbValidCardIndex = 1,
	szGuid = 2,
	cbTimeOutCard = 1,
	cbCardData = {
		_t = 1,
		_l = {
			17
		}
	}
}
DDZ_CMD_S_PassCard = {
	wCurrentUser = 1,
	cbTurnOver = 1,
	wPassCardUser = 1
}
DDZ_CMD_S_StatusFree = {
	cbTimeAddTimes = 1,
	cbTimeStartGame = 1,
	cbTimeCallScore = 1,
	lCellScore = 1,
	cbTimeHeadOutCard = 1,
	szGuid = 2,
	cbTimeOutCard = 1,
	lTurnScore = {
		_t = 1,
		_l = {
			3
		}
	},
	lCollectScore = {
		_t = 1,
		_l = {
			3
		}
	}
}
DDZ_CMD_S_StartCard = {
	wCurrentUser = 1
}
DDZ_CMD_S_StatusPlay = {
	cbTimeHeadOutCard = 1,
	cbTimeStartGame = 1,
	wTurnWiner = 1,
	cbTimeCallScore = 1,
	lCellScore = 1,
	cbBankerScore = 1,
	cbBombCount = 1,
	cbBankerCardType = 1,
	cbBankerCardTimes = 1,
	szGuid = 2,
	wBankerUser = 1,
	wCurrentUser = 1,
	cbTurnCardCount = 1,
	wOpenUser = 1,
	cbTimeOutCard = 1,
	cbTurnCardData = {
		_t = 1,
		_l = {
			20
		}
	},
	cbBankerCard = {
		_t = 1,
		_l = {
			3
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			20
		}
	},
	cbHandCardCount = {
		_t = 1,
		_l = {
			3
		}
	},
	lTurnScore = {
		_t = 1,
		_l = {
			3
		}
	},
	lCollectScore = {
		_t = 1,
		_l = {
			3
		}
	},
	cbUserTrustee = {
		_t = 1,
		_l = {
			3
		}
	},
	cbAddTimes = {
		_t = 1,
		_l = {
			3
		}
	}
}
DDZ_CMD_S_AddTimes = {
	cbTimes = 1,
	wAddUser = 1
}
DDZ_CMD_S_OutCard = {
	wCurrentUser = 1,
	wOutCardUser = 1,
	cbCardCount = 1,
	cbCardData = {
		_t = 1,
		_l = {
			20
		}
	}
}
DDZ_CMD_C_TRUSTEE = {
	bTrustee = 1
}
DDZ_CMD_C_OutCard = {
	cbCardCount = 1,
	cbCardData = {
		_t = 1,
		_l = {
			20
		}
	}
}
DDZ_CMD_S_AndroidCard = {
	wCurrentUser = 1,
	cbHandCard = {
		_t = 1,
		_l = {
			3,
			17
		}
	},
	cbBankerCard = {
		_t = 1,
		_l = {
			3
		}
	}
}
DDZ_CMD_S_StatusAddTimes = {
	cbTimeHeadOutCard = 1,
	cbTimeStartGame = 1,
	cbTimeCallScore = 1,
	cbTimeAddTimes = 1,
	lCellScore = 1,
	cbBankerScore = 1,
	cbBankerCardType = 1,
	cbBankerCardTimes = 1,
	szGuid = 2,
	wBankerUser = 1,
	wCurrentUser = 1,
	wStartUser = 1,
	cbTimeOutCard = 1,
	cbScoreInfo = {
		_t = 1,
		_l = {
			3
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			20
		}
	},
	cbHandCardCount = {
		_t = 1,
		_l = {
			3
		}
	},
	cbBankerCard = {
		_t = 1,
		_l = {
			3
		}
	},
	cbAddTimes = {
		_t = 1,
		_l = {
			3
		}
	},
	lTurnScore = {
		_t = 1,
		_l = {
			3
		}
	},
	lCollectScore = {
		_t = 1,
		_l = {
			3
		}
	},
	cbUserTrustee = {
		_t = 1,
		_l = {
			3
		}
	}
}
DDZ_CMD_S_BankerInfo = {
	cbBankerTimes = 1,
	wBankerUser = 1,
	wCurrentUser = 1,
	cbBankerCardType = 1,
	cbBankerScore = 1,
	cbBankerCard = {
		_t = 1,
		_l = {
			3
		}
	}
}
DDZ_CMD_C_OpenCard = {}
DDZ_CMD_S_Rembercard = {
	cbCount = {
		_t = 1,
		_l = {
			20
		}
	}
}
PDK_CMD_S_StatusFree = {
	lCellScore = 1,
	cbTimeStartGame = 1,
	cbTimeHeadOutCard = 1,
	cbTimeOutCard = 1
}
PDK_CMD_S_StatusPlay = {
	cbTimeStartGame = 1,
	wCurrentUser = 1,
	wTurnWiner = 1,
	lCellScore = 1,
	cbTurnCardCount = 1,
	cbPass = 1,
	cbTimeHeadOutCard = 1,
	cbTimeOutCard = 1,
	cbTurnCardData = {
		_t = 1,
		_l = {
			16
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			16
		}
	},
	cbHandCardCount = {
		_t = 1,
		_l = {
			3
		}
	},
	cbUserTrustee = {
		_t = 1,
		_l = {
			3
		}
	}
}
PDK_CMD_S_StartCard = {
	wCurrentUser = 1
}
PDK_CMD_S_GameStart = {
	cbTimeOutCard = 1,
	cbTimeStartGame = 1,
	wCurrentUser = 1,
	cbTimeHeadOutCard = 1,
	lCellScore = 1,
	cbCardData = {
		_t = 1,
		_l = {
			16
		}
	}
}
PDK_CMD_S_OutCard = {
	wOutCardUser = 1,
	cbPass = 1,
	cbCardCount = 1,
	wCurrentUser = 1,
	cbCardData = {
		_t = 1,
		_l = {
			16
		}
	},
	lScore = {
		_t = 1,
		_l = {
			3
		}
	}
}
PDK_CMD_S_PassCard = {
	wPassCardUser = 1,
	cbPass = 1,
	wCurrentUser = 1,
	cbTurnOver = 1,
	lScore = {
		_t = 1,
		_l = {
			3
		}
	}
}
PDK_CMD_S_TRUSTEE = {
	wTrusteeUser = 1,
	bTrustee = 1
}
PDK_CMD_S_GameConclude = {
	lCellScore = 1,
	wBaoPei = 1,
	lGameScore = {
		_t = 1,
		_l = {
			3
		}
	},
	cbChuntian = {
		_t = 1,
		_l = {
			3
		}
	},
	cbCardCount = {
		_t = 1,
		_l = {
			3
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			48
		}
	}
}
PDK_CMD_C_TRUSTEE = {
	bTrustee = 1
}
PDK_CMD_C_OutCard = {
	cbCardCount = 1,
	cbCardData = {
		_t = 1,
		_l = {
			16
		}
	}
}
PDK_CMD_S_AndroidCard = {
	wCurrentUser = 1,
	cbHandCardCount = {
		_t = 1,
		_l = {
			3
		}
	},
	cbHandCard = {
		_t = 1,
		_l = {
			3,
			16
		}
	}
}
OxQZB_CMD_S_Status = {
	cbStatus = 1,
	cbMaxBetMultiple = 1,
	wBankerUser = 1,
	lCellScore = 1,
	wServerId = 1,
	cbDaojishi = 1,
	cbMaxCallMultiple = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			5
		}
	},
	cbCallMultiple = {
		_t = 1,
		_l = {
			5
		}
	},
	cbBetMultiple = {
		_t = 1,
		_l = {
			5
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			5,
			5
		}
	},
	bOxCard = {
		_t = 1,
		_l = {
			5
		}
	},
	cbFleeInfo = {
		_t = 1,
		_l = {
			5
		}
	}
}
OxQZB_CMD_S_GameStartCallBanker = {
	cbMaxCallMultiple = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			5
		}
	}
}
OxQZB_CMD_S_GameStartBet = {
	bAndroid = 3,
	cbMaxBetMultiple = 1,
	wBankerUser = 1
}
OxQZB_CMD_S_GameStartOpenCard = {
	cbCardData = {
		_t = 1,
		_l = {
			5,
			5
		}
	}
}
OxQZB_CMD_S_GameEnd = {
	lGameScore = {
		_t = 1,
		_l = {
			5
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			5,
			5
		}
	},
	cbFleeInfo = {
		_t = 1,
		_l = {
			5
		}
	}
}
OxQZB_CMD_S_CallBanker = {
	bMultiple = 1,
	wCallBanker = 1
}
OxQZB_CMD_S_Bet = {
	wBetUser = 1,
	lBetMultiple = 1
}
OxQZB_CMD_S_OpenCard = {
	wPlayerID = 1,
	bOpen = 1
}
OxQZB_CMD_S_PlayerExit = {
	wPlayerID = 1
}
OxQZB_CMD_S_Daojishi = {
	cbSec = 1,
	cbOpen = 1
}
OxQZB_CMD_C_CallBanker = {
	bMultiple = 1
}
OxQZB_CMD_C_Bet = {
	bMultiple = 1
}
OxQZB_CMD_C_OpenCard = {
	bOX = 1
}
OxQZ_CMD_S_Status = {
	cbStatus = 1,
	cbMaxBetMultiple = 1,
	wBankerUser = 1,
	lCellScore = 1,
	wServerId = 1,
	cbMaxCallMultiple = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			5
		}
	},
	cbCallMultiple = {
		_t = 1,
		_l = {
			5
		}
	},
	cbBetMultiple = {
		_t = 1,
		_l = {
			5
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			5,
			5
		}
	},
	bOxCard = {
		_t = 1,
		_l = {
			5
		}
	},
	cbFleeInfo = {
		_t = 1,
		_l = {
			5
		}
	}
}
OxQZ_CMD_S_GameStartCallBanker = {
	cbMaxCallMultiple = 1,
	cbCardData = {
		_t = 1,
		_l = {
			5
		}
	},
	cbPlayStatus = {
		_t = 1,
		_l = {
			5
		}
	}
}
OxQZ_CMD_S_GameStartBet = {
	bAndroid = 3,
	cbMaxBetMultiple = 1,
	wBankerUser = 1
}
OxQZ_CMD_S_GameStartOpenCard = {
	cbCardData = {
		_t = 1,
		_l = {
			5,
			5
		}
	}
}
OxQZ_CMD_S_GameEnd = {
	lGameScore = {
		_t = 1,
		_l = {
			5
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			5,
			5
		}
	},
	cbFleeInfo = {
		_t = 1,
		_l = {
			5
		}
	}
}
OxQZ_CMD_S_CallBanker = {
	bMultiple = 1,
	wCallBanker = 1
}
OxQZ_CMD_S_Bet = {
	wBetUser = 1,
	lBetMultiple = 1
}
OxQZ_CMD_S_OpenCard = {
	wPlayerID = 1,
	bOpen = 1
}
OxQZ_CMD_S_PlayerExit = {
	wPlayerID = 1
}
OxQZ_CMD_C_CallBanker = {
	bMultiple = 1
}
OxQZ_CMD_C_Bet = {
	bMultiple = 1
}
OxQZ_CMD_C_OpenCard = {
	bOX = 1
}
OxJD_CMD_C_CALL_BANKER = {
	cbOp = 1
}
OxJD_CMD_C_ADD_SCORE = {
	lScore = 1
}
OxJD_CMD_C_OxCard = {
	bOX = 1,
	nServriValue = 1
}
OxJD_CMD_S_StatusGame = {
	cbState = 1,
	cbCanCallBanker = 1,
	lCellScore = 1,
	wBankerUser = 1,
	cbMaxScore = 1,
	cbCallStatus = {
		_t = 1,
		_l = {
			5
		}
	},
	bOpenCardStatus = {
		_t = 1,
		_l = {
			5
		}
	},
	cbScore = {
		_t = 1,
		_l = {
			5
		}
	},
	lGameScore = {
		_t = 1,
		_l = {
			5
		}
	},
	bOxCard = {
		_t = 1,
		_l = {
			5
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			5,
			5
		}
	},
	cbPlayStatus = {
		_t = 1,
		_l = {
			5
		}
	},
	cbFleeInfo = {
		_t = 1,
		_l = {
			5
		}
	}
}
OxJD_CMD_S_GAMESTART = {
	wServerID = 1,
	cbCanCallBanker = 1,
	cbPlayStatus = {
		_t = 1,
		_l = {
			5
		}
	}
}
OxJD_CMD_S_CALL_BANKER = {
	wChairID = 1,
	cbOp = 1
}
OxJD_CMD_S_SCORE = {
	wBankerUser = 1,
	cbMaxScore = 1
}
OxJD_CMD_S_ADD_SCORE = {
	wChairID = 1,
	lScore = 1
}
OxJD_CMD_S_SEND_CARD = {
	cbCard = {
		_t = 1,
		_l = {
			5
		}
	}
}
OxJD_CMD_S_OPEN_CARD = {
	wChairID = 1
}
OxJD_CMD_S_GameEnd = {
	lGameTax = {
		_t = 1,
		_l = {
			5
		}
	},
	lGameScore = {
		_t = 1,
		_l = {
			5
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			5,
			5
		}
	},
	cbFleeInfo = {
		_t = 1,
		_l = {
			5
		}
	}
}
OxJD_CMD_S_PlayerExit = {
	wPlayerID = 1
}
CMD_MB_LockServer = {
	dwServerID = 1
}
CMD_GP_AddInvali_MB_WithSMS_Lua = {
	szMachineID = 2,
	szAccounts = 2,
	szQQ = 2,
	dwDevice = 2,
	szPassPortID = 2,
	szToken = 2,
	szNickName = 2,
	szSMSCode = 2,
	szPassword = 2,
	cbType = 1,
	szMobilePhone = 2,
	dwUserID = 1
}
CMD_GP_Wechat_AddInvali_MB_WithSMS_Lua = {
	szMachineID = 2,
	szAccounts = 2,
	szQQ = 2,
	dwDevice = 2,
	szPassPortID = 2,
	szToken = 2,
	szNickName = 2,
	szSMSCode = 2,
	szPassword = 2,
	cbType = 1,
	szMobilePhone = 2,
	dwUserID = 1
}
CMD_GP_SetGuest_Rev = {
	nReturnCode = 1,
	szAccounts = 2,
	szDescribeString = 2
}
DBO_GP_SetWechat_Rev = {
	nReturnCode = 1,
	szAccounts = 2,
	szDescribeString = 2
}
CMD_GP_SystemFaceInfo = {
	wFaceID = 1,
	szPassword = 2,
	szMachineID = 2,
	dwUserID = 1
}
CMD_GP_UserFaceInfo = {
	wFaceID = 1,
	dwCustomID = 1
}
DBO_GP_OperateFailure = {
	lResultCode = 1,
	szDescribeString = 2
}
CMD_GP_ModifyInsurePassWithSms_MB = {
	szMobileNumber = 2,
	szPassword = 2,
	szSmsCode = 2,
	dwUserID = 1
}
FISH3D_CompetitionRanking = {
	dwCatchScore = 1,
	szNickName = 2,
	dwCatchFishCount = 1,
	dwRanking = 1,
	dwUserId = 1
}
FISH3D_CMD_S_MATCH_END = {
	lScore = 1,
	lCatchScore = 1,
	dwRanking = 1
}
FISH3D_CMD_S_CUR_RANKING = {
	MatchUserCount = 1,
	dwRanking = 1,
	wChairId = 1,
	lScore = 1,
	lMaxScore = 1
}
FISH3D_CMD_S_UPDATE_RANKING = {
	dwCatchScore = 1,
	lScore = 1,
	szNickName = 2,
	dwCatchFishCount = 1,
	dwRanking = 1,
	dwUserId = 1
}
FISH3D_CMD_S_FISH_MUL = {
	nMul = 1,
	nFishID = 1
}
FISH3D_CMD_S_ACTIVITY_NOTIFY = {
	nActivityTime = 1,
	bStart = 3,
	szFishName = 2
}
FISH3D_CMD_S_ADD_BUFFER = {
	nBufferType = 1,
	fBufferTime = 1,
	fBufferParam = 1,
	caster = 1,
	fishes = {
		_t = 1,
		_l = {
			100
		}
	}
}
FISH3D_CMD_S_BULLET_SET = {
	nMaxCatch = 1,
	nSpeed = 1,
	nCannonType = 1,
	nBulletSize = 1,
	bFirst = 3,
	nCatchRadio = 1,
	nMulriple = 1
}
FISH3D_CMD_S_SEND_DES = {
	isBoss = 3,
	nCount = 1,
	szDes = {
		_t = 1,
		_l = {
			4
		}
	}
}
FISH3D_CMD_S_LOCK_FISH = {
	wChairID = 1,
	dwLockID = 1
}
FISH3D_AndroidUpdata = {
	FishCount = 1,
	dir = 1
}
FISH3D_CMD_S_ALLOW_FIRE = {
	m_bAllowFire = 3
}
FISH3D_CMD_S_SWITCH_SCENE = {
	nst = 1,
	bSwitching = 3
}
FISH3D_CMD_S_KILL_BULLET = {
	wChairID = 1,
	dwBulletID = 1
}
FISH3D_CMD_S_KILL_FISH = {
	wChairID = 1,
	lScore = 1,
	nBScoe = 1,
	dwFishID = 1,
	totalScore = 1
}
FISH3D_CMD_S_SEND_BULLET = {
	nMultiply = 1,
	wChairID = 1,
	nCannonType = 1,
	fYPos = 1,
	fXpos = 1,
	dwID = 1,
	bNew = 1,
	IsDouble = 1,
	dwCreateTick = 1,
	lScore = 1,
	fDirection = 1,
	dwServerTick = 1
}
FISH3D_CMD_S_CANNON_SET = {
	cannonType = 1,
	cannonMul = 1,
	cannonSet = 1,
	wChairID = 1
}
FISH3D_CMD_S_CHANGE_SCORE = {
	wChairID = 1,
	lFishScore = 1
}
FISH3D_CMD_S_USER_INFO = {
	lWastage = 1,
	nCannonType = 1,
	nCannonSet = 1,
	wChairID = 1,
	szUserName = 2,
	nFrequencyMultiply = 1,
	nBulletID = 1,
	lockFish = 1,
	nCannonMul = 1,
	lScore = 1,
	dwUserID = 1
}
FISH3D_CMD_S_SEND_FISH = {
	nParentID = 1,
	FishSpeed = 1,
	fDelay = 1,
	fOffestX = 1,
	bBelong = 3,
	nRefershID = 1,
	fDirZ = 1,
	nPathID = 1,
	lockLevel = 1,
	lifetime = 1,
	fDirX = 1,
	dwCreateTick = 1,
	dwServerTick = 1,
	fOffestZ = 1,
	nTypeID = 1,
	fDirY = 1,
	bTroop = 3,
	FisType = 1,
	dwFishID = 1,
	fOffestY = 1
}
FISH3D_CMD_S_GAME_CONFIG = {
	nMaxInterval = 1,
	nFireInterval = 1,
	nChangeRatioFishScore = 1,
	nMinInterval = 1,
	nShowGoldMinMul = 1,
	nChangeRatioUserScore = 1,
	wServerID = 1,
	nExchangeOnce = 1,
	nMaxCannon = 1,
	nMaxBulletCount = 1
}
FISH3D_CMD_S_TIME_SYNC = {
	wChiarID = 1,
	dwClientTick = 1,
	dwServerTick = 1
}
FISH3D_CMD_S_SCORE_SYNC = {
	lScore = 1,
	wChiarID = 1,
	lTotalScore = 1
}
FISH3D_CMD_C_TREASURE_END = {
	wChiarID = 1,
	lScore = 1
}
FISH3D_CMD_C_CHANGE_CANNONSET = {
	wChiarID = 1,
	bAdd = 3
}
FISH3D_CMD_C_NETCAST = {
	dwData = 1,
	dwFishID = 1,
	dwBulletID = 1
}
FISH3D_CMD_C_LOCK_FISH = {
	wChairID = 1,
	bLock = 3
}
FISH3D_CMD_C_FIRE = {
	wChairID = 1,
	fDirection = 1,
	dwFireTime = 1,
	dwClientID = 1
}
FISH3D_CMD_C_CHANGE_CANNON = {
	wChairID = 1,
	bAdd = 3
}
FISH3D_CMD_C_CHANGE_SCORE = {
	wChairID = 1,
	bAdd = 3,
	bAddAll = 3
}
FISH3D_CMD_C_TIME_SYNC = {
	wChairID = 1,
	dwClientTick = 1
}
FISH3D_CMD_S_DIFF_END = {
	dwRemainTime = 1
}
FISH3D_CMD_S_DIFF_START = {
	dwRemainTime = 1
}
FISH3D_CMD_S_BULLET_SPEED_UP = {
	wChairID = 1,
	nFrequencyMultiply = 1
}
FISH3D_CMD_S_LOCK_ONE_FISH = {
	wChairID = 1,
	dwFishID = 1
}
FISH3D_CMD_C_LOCK_ONE_FISH = {
	wChairID = 1,
	dwFishID = 1
}
FISH3D_CMD_C_BULLET_SPEED_UP = {
	wChairID = 1,
	nFrequencyMultiply = 1
}
FISH3D_CMD_S_UPDATE_POSITION = {
	y = 1,
	z = 1,
	dirX = 1,
	type = 1,
	dirY = 1,
	dwID = 1,
	x = 1,
	dirZ = 1
}
FISH3D_CMD_S_SEND_GROUP = {
	nParentID = 1,
	nTypeID = 1,
	lifetime = 1,
	fOffestX = 1,
	dwGroupID = 1,
	bBelong = 3,
	fDirZ = 1,
	nPathID = 1,
	fDirY = 1,
	fDirX = 1,
	dwCreateTick = 1,
	Speed = 1,
	fOffestY = 1,
	dwServerTick = 1,
	fOffestZ = 1
}
FISH3D_CMD_S_KILL_GROUP = {
	dwGroupID = 1
}
FISH3D_CMD_S_KILL_SPECIAL_FISH = {
	wChairID = 1,
	effectType = 1,
	lScore = 1,
	nBScoe = 1,
	dwFishID = 1,
	totalScore = 1,
	fishes = {
		_t = 1,
		_l = {
			100
		}
	},
	scores = {
		_t = 1,
		_l = {
			100
		}
	}
}
FISH3D_CMD_S_EFFECT_KILL = {
	dwFishID = 1,
	effectType = 1,
	nBScoe = 1,
	wChairID = 1,
	fishes = {
		_t = 1,
		_l = {
			100
		}
	},
	scores = {
		_t = 1,
		_l = {
			100
		}
	}
}
FISH3D_CMD_C_GET_STATIISTICS_INFO = {
	wChairID = 1
}
FISH3D_CMD_S_GET_STATIISTICS_INFO = {
	dwKillNumber = 1,
	lExpenditure = 1,
	wChairID = 1,
	dwCount = 1,
	lIncome = 1,
	fishes = {
		_t = 1,
		_l = {
			100
		}
	},
	dwKillCounts = {
		_t = 1,
		_l = {
			100
		}
	}
}
FISH3D_CMD_S_ENTER_SCENE = {
	sceneID = 1,
	userSet = {
		_t = "FISH3D_CMD_S_USER_INFO",
		_l = {
			4
		}
	},
	bulletSet = {
		_t = "FISH3D_CMD_S_BULLET_SET",
		_l = {
			10
		}
	}
}
FISH3D_CMD_S_LEAVE_GAME = {
	wChairID = 1,
	bKickout = 3,
	dwUserID = 1
}
FISH3D_CMD_S_TIMEOUT_ALARM = {
	wChairID = 1,
	dwTimeLeft = 1
}
FISH3D_CMD_S_EFFECT_WHEELSURF = {
	dwFishID = 1,
	nBaseMultiple = 1,
	nBMultiple = 1,
	nBScoe = 1,
	wChairID = 1,
	lScore = 1,
	nBaseScore = 1
}
SERIAL_CMD_S_STATUS = {
	lTotalWinScore = 1,
	dwLine = 1,
	lCellScore = 1,
	lJackpot = 1,
	lSpecialAward = 1,
	dwMultiple = 1,
	cbBrickCount = 1,
	cbCardArray = {
		_t = 1,
		_l = {
			240
		}
	},
	wBetMultiple = {
		_t = 1,
		_l = {
			12
		}
	},
	lTreasure = {
		_t = 1,
		_l = {
			4
		}
	}
}
SERIAL_CMD_S_BET = {
	lJettonScore = 1,
	lJackpot = 1,
	lWinScore = 1,
	lTotalWinScore = 1,
	cbBrickCount = 1,
	cbCardArray = {
		_t = 1,
		_l = {
			240
		}
	}
}
SERIAL_CMD_S_BROADCAST_JACKPOT = {
	lJackpot = 1,
	dwUserID = 1
}
SERIAL_CMD_S_TREASURE = {
	wWinTreasure = 1
}
SERIAL_CMD_S_TREASUREINFO = {
	lSpecialAward = 1,
	lTreasure = {
		_t = 1,
		_l = {
			4
		}
	}
}
SERIAL_CMD_S_BROADCAST_AWARDS = {
	szServerName = 2,
	szNickName = 2,
	lJackpot = 1,
	lWinScore = 1
}
SERIAL_CMD_C_BET = {
	wLine = 1,
	wMultiple = 1
}
SERIAL_CMD_S_STORAGE = {
	bSave = 3
}
SERIAL_CMD_C_STORAGE = {
	bSave = 3
}
JackpotRecord = {
	dwCleapUpBrick = 1,
	dwID = 1,
	dwPopularity = 1,
	syTime = "SYSTEMTIME",
	lJackpot = 1,
	lJetton = 1,
	dwBrick = 1,
	lScore = 1,
	szNickName = 2,
	cbCardArray = {
		_t = 1,
		_l = {
			240
		}
	}
}
ChatRecord = {
	szContent = 2,
	szNickName = 2,
	dwUserID = 1
}
SERIAL_CMD_S_LoadJackpotRecord = {
	record = {
		_t = "JackpotRecord",
		_l = {
			30
		}
	}
}
SERIAL_CMD_S_UpdatePopularity = {
	dwPopularity = 1,
	dwID = 1
}
SERIAL_CMD_S_Chat = {
	chat = "ChatRecord",
	dwID = 1
}
SERIAL_CMD_C_UpdatePopularity = {
	dwID = 1
}
SERIAL_CMD_C_Chat = {
	szContent = 2,
	dwID = 1
}
SERIAL_CMD_S_LOAD_CHAT = {
	dwID = 1,
	chats = {
		_t = "ChatRecord",
		_l = {
			20
		}
	}
}
SERIAL_CMD_C_LOAD_CHAT = {
	dwID = 1
}
SLWH_OpenAward = {
	nTimes = 1,
	nType = 1,
	nAwardIndex = {
		_t = 1,
		_l = {
			15
		}
	},
	nJettonAreaTimes = {
		_t = 1,
		_l = {
			15
		}
	}
}
SLWH_AwardRecord = {
	cbType = 1,
	cbAwardIndex = 1,
	cbZHX = 1
}
SLWH_CMD_C_Jetton = {
	nJettonArea = 1,
	lBet = 1
}
SLWH_CMD_C_Jetton_Continue = {
	lBet = {
		_t = 1,
		_l = {
			15
		}
	}
}
SLWH_CMD_S_Jetton = {
	wChairID = 1,
	lTotalJetton = 1,
	cbRet = 1,
	lScore = 1,
	lJetton = 1,
	nArea = 1
}
SLWH_CMD_S_Jetton_Continue = {
	wChairID = 1,
	cbRet = 1,
	lBet = {
		_t = 1,
		_l = {
			15
		}
	},
	lTotalJetton = {
		_t = 1,
		_l = {
			15
		}
	}
}
SLWH_CMD_S_GameStart = {
	cbTimeLeave = 1,
	lJettonConfig = {
		_t = 1,
		_l = {
			5
		}
	},
	nJettonAreaTimes = {
		_t = 1,
		_l = {
			15
		}
	}
}
SLWH_CMD_S_GameStatus = {
	cbStatus = 1,
	cbTimeLeave = 1
}
SLWH_CMD_S_GameScene = {
	nSeed = 1,
	tAward = "SLWH_OpenAward",
	cbStatus = 1,
	cbTimeLeave = 1,
	lJettonConfig = {
		_t = 1,
		_l = {
			5
		}
	},
	lJettoned = {
		_t = 1,
		_l = {
			15
		}
	},
	nJettonAreaTimes = {
		_t = 1,
		_l = {
			15
		}
	},
	lPlayerJettoned = {
		_t = 1,
		_l = {
			15
		}
	},
	tAwardRecord = {
		_t = "SLWH_AwardRecord",
		_l = {
			40
		}
	}
}
SLWH_CMD_S_PlaceBetFail = {
	wChairID = 1,
	lJettonScore = {
		_t = 1,
		_l = {
			15
		}
	},
	lPlayerJettoned = {
		_t = 1,
		_l = {
			15
		}
	}
}
SLWH_CMD_S_GameEnd = {
	tAward = "SLWH_OpenAward",
	lScore = 1,
	lCaijin = 1,
	lJettoned = 1,
	lEndScore = 1,
	nSeed = 1,
	cbTimeLeave = 1,
	tAwardRecord = {
		_t = "SLWH_AwardRecord",
		_l = {
			40
		}
	}
}
TGPD_CMD_S_Status = {
	lCellScore = 1,
	nFreeTimes = 1,
	lMiniJackpot = 1,
	lMinorJackpot = 1,
	nCookies = 1,
	lTotalWinScore = 1,
	lGrandJackpot = 1,
	lMajorJackpot = 1,
	cbCardArray = {
		_t = 1,
		_l = {
			240
		}
	},
	wBetMultiple = {
		_t = 1,
		_l = {
			12
		}
	}
}
TGPD_CMD_S_Bet = {
	lJettonScore = 1,
	nFreeTimes = 1,
	lWinScore = 1,
	lTotalWinScore = 1,
	lJackpot = 1,
	nCookies = 1,
	lJettonScoreEx = 1,
	cbCardArray = {
		_t = 1,
		_l = {
			240
		}
	}
}
TGPD_CMD_S_BroadcastJackpot = {
	lMinorJackpot = 1,
	lGrandJackpot = 1,
	lMiniJackpot = 1,
	lMajorJackpot = 1,
	dwUserID = 1
}
TGPD_CMD_S_BroadcastAwards = {
	szServerName = 2,
	szNickName = 2,
	lJackpot = 1,
	lWinScore = 1
}
TGPD_CMD_C_Bet = {
	wLine = 1,
	wMultiple = 1
}
CMD_C_SGJ_Exchange = {
	lExchangeScore = 1
}
CMD_C_SGJ_BigSmall = {
	lJettonScore = 1,
	cbBigSmall = 1
}
CMD_C_SGJ_PlaceJetton = {
	lJettonScore = {
		_t = 1,
		_l = {
			8
		}
	}
}
CMD_S_SGJ_BigSmall = {
	lWinScore = 1,
	cbBigSmall = 1,
	lUserScore = 1,
	bWin = 3
}
CMD_S_SGJ_GameStart = {
	wExchangeRatio = 1,
	lUserScore = 1
}
CMD_S_SGJ_BroadcastAward = {
	lScore = 1,
	szNickName = 2,
	szEventName = 2,
	szServerName = 2
}
SGJ_tagEventData = {
	cbCount = 1,
	wEventId = 1,
	cbStep = {
		_t = 1,
		_l = {
			24
		}
	},
	cbArea = {
		_t = 1,
		_l = {
			24
		}
	},
	wTimes = {
		_t = 1,
		_l = {
			24
		}
	},
	lScore = {
		_t = 1,
		_l = {
			24
		}
	}
}
CMD_S_SGJ_GameSqueeze = {
	cbStep = 1,
	wTimes = 1,
	lUserScore = 1,
	lWinScore = 1,
	wChairID = 1,
	cbArea = 1,
	stEvents = "SGJ_tagEventData",
	cbRecord = {
		_t = 1,
		_l = {
			8
		}
	}
}
WZMJex_CMD_C_Listen_WZMJex = {
	cbListen = 1
}
WZMJex_CMD_ListenCard_WZMJex = {
	cbOutCard = 1,
	cbCanHuCard = {
		_t = 1,
		_l = {
			9
		}
	},
	cbPoint = {
		_t = 1,
		_l = {
			9
		}
	},
	cbLeftCount = {
		_t = 1,
		_l = {
			9
		}
	}
}
WZMJex_CMD_S_Trustee_WZMJex = {
	bTrustee = 3,
	wChairID = 1
}
WZMJex_CMD_S_GameStart_WZMJex = {
	cbQuanFeng = 1,
	wBankerUser = 1,
	wHeapHead = 1,
	wCurrentUser = 1,
	cbUserAction = 1,
	wReplaceUser = 1,
	wHeapTail = 1,
	wSiceCount = 1,
	szGuid = 2,
	cbCardData = {
		_t = 1,
		_l = {
			14
		}
	},
	cbTailCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbHeapCardInfo = {
		_t = 1,
		_l = {
			2,
			2
		}
	}
}
WZMJex_CMD_WeaveItem_WZMJex = {
	cbCenterCard = 1,
	wProvideUser = 1,
	cbPublicCard = 1,
	cbWeaveKind = 1,
	cbCardData = {
		_t = 1,
		_l = {
			4
		}
	}
}
WZMJex_CMD_S_OperateNotify_WZMJex = {
	cbActionCard = 1,
	wResumeUser = 1,
	cbActionMask = 1
}
WZMJex_CMD_S_ReplaceCard_WZMJex = {
	cbReplaceCard = 1,
	wReplaceUser = 1
}
WZMJex_CMD_C_ReplaceCard_WZMJex = {
	cbCardData = 1
}
WZMJex_CMD_S_GameEnd_WZMJex = {
	cbProvideCard = 1,
	cbFanCount = 1,
	cbWeaveCount = 1,
	lGameTax = 1,
	wTimesCount = 1,
	bIsEscape = 1,
	wProvideUser = 1,
	dwChiHuKind = {
		_t = 1,
		_l = {
			2
		}
	},
	dwChiHuRight = {
		_t = 1,
		_l = {
			3
		}
	},
	lGameScore = {
		_t = 1,
		_l = {
			2
		}
	},
	cbCardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			2,
			14
		}
	},
	WeaveItemArray = {
		_t = "WZMJex_CMD_WeaveItem_WZMJex",
		_l = {
			4
		}
	}
}
WZMJex_CMD_S_OutCard_WZMJex = {
	cbOutCardData = 1,
	wOutCardUser = 1
}
WZMJex_CMD_S_StatusFree_WZMJex = {
	wBankerUser = 1,
	lCellScore = 1,
	lTurnScore = {
		_t = 1,
		_l = {
			2
		}
	},
	lCollectScore = {
		_t = 1,
		_l = {
			2
		}
	},
	bTrustee = {
		_t = 3,
		_l = {
			2
		}
	}
}
WZMJex_CMD_S_StatusPlay_WZMJex = {
	lCellScore = 1,
	cbQuanFeng = 1,
	cbLeftCardCount = 1,
	cbActionCard = 1,
	cbActionMask = 1,
	cbCardCount = 1,
	cbOutCardData = 1,
	wOutCardUser = 1,
	wHeapTail = 1,
	szGuid = 2,
	wHeapHead = 1,
	wResumeUser = 1,
	wBankerUser = 1,
	wCurrentUser = 1,
	cbSendCardData = 1,
	wReplaceUser = 1,
	lTurnScore = {
		_t = 1,
		_l = {
			2
		}
	},
	lCollectScore = {
		_t = 1,
		_l = {
			2
		}
	},
	cbHearStatus = {
		_t = 1,
		_l = {
			2
		}
	},
	bTrustee = {
		_t = 3,
		_l = {
			2
		}
	},
	cbDiscardCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbDiscardCard = {
		_t = 1,
		_l = {
			2,
			60
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			14
		}
	},
	cbFlowerCardData = {
		_t = 1,
		_l = {
			2,
			8
		}
	},
	cbWeaveCount = {
		_t = 1,
		_l = {
			2
		}
	},
	WeaveItemArray = {
		_t = "WZMJex_CMD_WeaveItem_WZMJex",
		_l = {
			2,
			4
		}
	},
	cbTailCount = {
		_t = 1,
		_l = {
			2
		}
	},
	cbHeapCardInfo = {
		_t = 1,
		_l = {
			2,
			2
		}
	}
}
WZMJex_CMD_S_SendCard_WZMJex = {
	cbActionMask = 1,
	wReplaceUser = 1,
	wSendCardUser = 1,
	bTail = 3,
	wCurrentUser = 1,
	cbCardData = 1
}
WZMJex_CMD_C_OperateCard_WZMJex = {
	cbOperateCode = 1,
	cbOperateCard = {
		_t = 1,
		_l = {
			3
		}
	}
}
WZMJex_CMD_S_OperateResult_WZMJex = {
	cbListenCode = 1,
	wOperateUser = 1,
	cbOperateCode = 1,
	wProvideUser = 1,
	cbOperateCard = {
		_t = 1,
		_l = {
			3
		}
	}
}
WZMJex_CMD_C_Trustee_WZMJex = {
	bTrustee = 3
}
WZMJex_CMD_C_OutCard_WZMJex = {
	cbCardData = 1
}
WZMJex_CMD_S_Listen_WZMJex = {
	wChairId = 1
}
WZMJex_CMD_S_TopUserCard_WZMJex = {
	cbCount = 1,
	cbCard = {
		_t = 1,
		_l = {
			17
		}
	}
}
WZMJex_CMD_CanHuCard_WZMJex = {
	cbLeftCount = 1,
	cbPoint = 1,
	cbCanHuCard = 1
}
SHZ_CMD_S_Status = {
	cbMaryGames = 1,
	lWinScore = 1,
	cbFullID = 1,
	lMaryScore = 1,
	lJettonScore = 1,
	cbExternalData = 1,
	cbCardArray = {
		_t = 1,
		_l = {
			15
		}
	},
	cbLines = {
		_t = 1,
		_l = {
			9,
			5
		}
	},
	cbInternalArray = {
		_t = 1,
		_l = {
			4
		}
	},
	cbBigSmallRecord = {
		_t = 1,
		_l = {
			10
		}
	},
	lBetScore = {
		_t = 1,
		_l = {
			5
		}
	}
}
SHZ_CMD_S_Bet = {
	cbMaryGames = 1,
	lWinScore = 1,
	cbFullID = 1,
	cbCardArray = {
		_t = 1,
		_l = {
			15
		}
	},
	cbLines = {
		_t = 1,
		_l = {
			9,
			5
		}
	}
}
SHZ_CMD_S_GetScore = {
	lUserScore = 1,
	lWinScore = 1
}
SHZ_CMD_S_Mary = {
	lMaryScore = 1,
	cbMaryGames = 1,
	lWinScore = 1,
	cbExternalData = 1,
	cbInternalArray = {
		_t = 1,
		_l = {
			4
		}
	}
}
SHZ_CMD_S_BigSmall = {
	lScore = 1,
	lWinScore = 1,
	cbBigSmall = {
		_t = 1,
		_l = {
			2
		}
	}
}
SHZ_CMD_C_Bet = {
	lJettonScore = 1
}
SHZ_CMD_C_BigSmall = {
	cbBigSmall = 1
}
JXLW_CMD_S_Status = {
	lCellScore = 1,
	lJackpot = 1,
	lToltalWinScore = 1,
	dwFreeGames = 1
}
JXLW_CMD_S_Bet = {
	dwFreeGames = 1,
	lWinScore = 1,
	lToltalWinScore = 1,
	cbCardDatas = {
		_t = 1,
		_l = {
			15
		}
	},
	cbLineDatas = {
		_t = 1,
		_l = {
			9
		}
	},
	dwMultiple = {
		_t = 1,
		_l = {
			9
		}
	}
}
JXLW_CMD_S_BroadcastJackpot = {
	lJackpot = 1
}
JXLW_CMD_C_Bet = {
	lJettonScore = 1,
	cbLineCount = 1
}
JXLW_CMD_S_BroadcastGetJackpot = {
	lJackpot = 1,
	szNickName = 2
}
CMD_C_FQZS_Request_Banker = {
	nOp = 1
}
CMD_C_FQZS_Jetton = {
	nJettonArea = 1,
	lBet = 1
}
CMD_S_FQZS_Refresh_Status = {
	cbStatus = 1,
	cbLeftTime = 1
}
CMD_S_FQZS_Request_Banker = {
	nTotal = 1,
	nOp = 1,
	wChairID = 1,
	nRet = 1
}
CMD_S_FQZS_Jetton = {
	nJettonArea = 1,
	nRet = 1,
	lBet = 1,
	wChairID = 1,
	lTotalJetton = 1,
	lAreaInvalid = {
		_t = 1,
		_l = {
			11
		}
	}
}
CMD_S_FQZS_GameEnd = {
	cbEnough = 1,
	cbAwardAreaIndex = 1,
	cbAwardArea = 1,
	lAllPlayScore = {
		_t = 1,
		_l = {
			150
		}
	}
}
CMD_S_FQZS_StatusGame = {
	cbAwardArea = 1,
	lBankerScore = 1,
	cbGameStatus = 1,
	cbAwardAreaIndex = 1,
	lMaxScore = 1,
	wServerID = 1,
	lRequestBankerCoin = 1,
	wBankerUser = 1,
	lQiangZhuangCoin = 1,
	lQiangZhuangMinCoin = 1,
	nBankerPlayTimes = 1,
	cbTimeLeave = 1,
	lAllJettonScore = {
		_t = 1,
		_l = {
			14
		}
	},
	lAllPlayScore = {
		_t = 1,
		_l = {
			150
		}
	},
	cbHistory = {
		_t = 1,
		_l = {
			20
		}
	},
	lJettonScore = {
		_t = 1,
		_l = {
			14
		}
	},
	lJettonChoice = {
		_t = 1,
		_l = {
			6
		}
	}
}
CMD_S_FQZS_GameStart = {
	nRequestBankerCount = 1,
	nBankerPlayTimes = 1,
	lMaxScore = 1
}
CMD_S_FQZS_Refresh_List = {
	nTotal = 1,
	nCurPose = 1
}
CMD_S_FQZS_Update_Banker = {
	lBankerScore = 1,
	nBankerUser = 1
}
DZPK_CMD_S_Status = {
	lPot = 1,
	wCurrentUser = 1,
	wActionTimeLeft = 1,
	lSmallBlind = 1,
	lBigBlind = 1,
	cbStatus = 1,
	lAnte = 1,
	wRaiseCount = 1,
	wButton = 1,
	cbUserAction = {
		_t = 1,
		_l = {
			6
		}
	},
	lUserBetScore = {
		_t = 1,
		_l = {
			6
		}
	},
	lUserTotalBetScore = {
		_t = 1,
		_l = {
			6
		}
	},
	lUserWinScore = {
		_t = 1,
		_l = {
			6
		}
	},
	lMainSidePot = {
		_t = 1,
		_l = {
			10
		}
	},
	cbHandCardData = {
		_t = 1,
		_l = {
			6,
			7
		}
	}
}
DZPK_CMD_S_GameStartPreflop = {
	lBigBlind = 1,
	lSmallBlind = 1,
	wCurrentUser = 1,
	wRaiseCount = 1,
	wButton = 1,
	cbUserAction = {
		_t = 1,
		_l = {
			6
		}
	},
	lUserBetScore = {
		_t = 1,
		_l = {
			6
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			7
		}
	}
}
DZPK_CMD_S_GameRound = {
	wNextUser = 1,
	cbStatus = 1,
	cbCardData = {
		_t = 1,
		_l = {
			6,
			7
		}
	},
	lMainSidePot = {
		_t = 1,
		_l = {
			10
		}
	}
}
DZPK_CMD_S_SendAllCard = {
	cbCardData = {
		_t = 1,
		_l = {
			7
		}
	},
	lMainSidePot = {
		_t = 1,
		_l = {
			10
		}
	}
}
DZPK_CMD_S_GameEnd = {
	lUserWinScore = {
		_t = 1,
		_l = {
			6
		}
	},
	cbCardData = {
		_t = 1,
		_l = {
			6,
			7
		}
	},
	lMainSidePot = {
		_t = 1,
		_l = {
			10
		}
	},
	wWinner = {
		_t = 1,
		_l = {
			10,
			6
		}
	},
	cbUserAction = {
		_t = 1,
		_l = {
			6
		}
	},
	cbBiggestCardData = {
		_t = 1,
		_l = {
			6,
			5
		}
	}
}
DZPK_CMD_S_Bet = {
	lScore = 1,
	wChairID = 1,
	wNextUser = 1
}
DZPK_CMD_S_Raise = {
	wChairID = 1,
	wRaiseCount = 1,
	lScore = 1,
	wNextUser = 1
}
DZPK_CMD_S_Call = {
	lScore = 1,
	wChairID = 1,
	wNextUser = 1
}
DZPK_CMD_S_Fold = {
	wChairID = 1,
	wNextUser = 1,
	cbCardData = {
		_t = 1,
		_l = {
			7
		}
	}
}
DZPK_CMD_S_Check = {
	wChairID = 1,
	wNextUser = 1
}
DZPK_CMD_S_Allin = {
	lScore = 1,
	wChairID = 1,
	wNextUser = 1
}
DZPK_CMD_S_PlayerRound = {
	wChairID = 1,
	cbActonMask = 1
}
DZPK_CMD_S_PlayerExit = {
	wChairID = 1
}
DZPK_CMD_C_Raise = {
	lScore = 1
}
DZPK_CMD_C_Bet = {
	lScore = 1
}
DZPK_CMD_S_UpdateUserScore = {
	bGameEnd = 3,
	lUserScore = 1,
	lAddedScore = 1,
	wChairID = 1,
	lRemainScore = 1,
	dwUserID = 1
}
CMD_MB_LoadTexasHoldemMatchRequest = {
	dwUserID = 1
}
CMD_MB_LoadTexasHoldemJoinMatchRequest = {
	dwUserID = 1
}
CMD_MB_LoadTexasHoldemBlindRequest = {
	wMatchID = 1
}
CMD_MB_LoadTexasHoldemFixedBonusRequest = {
	wMatchID = 1
}
CMD_MB_JoinTexasHoldemMatchRequest = {
	wServerID = 1,
	wUserID = 1,
	szMachineID = 2,
	wMatchID = 1,
	szTempPassword = 2
}
CMD_MB_QuitTexasHoldemMatchRequest = {
	wServerID = 1,
	wUserID = 1,
	szMachineID = 2,
	wMatchID = 1,
	szTempPassword = 2
}
CMD_MB_LoadTexasHoldemMatchRecordRequest = {
	dwUserID = 1
}
CMD_MB_LoadTexasHoldemMatchResultRequest = {
	dwUserID = 1,
	dwPeriodID = 1
}
CMD_MB_LoadTexasHoldemMatchResponse = {
	dwRegistrationEndTime = 1,
	lRegistrationFee = 1,
	bEnd = 3,
	wRebuyFee = 1,
	wRebuyMinLevel = 1,
	wRebuyMaxLevel = 1,
	bStart = 3,
	dwMinUserCount = 1,
	lLoseCip = 1,
	wState = 1,
	szMatchName = 2,
	wAddOnTimes = 1,
	wAddOnMinLevel = 1,
	wAddOnMaxLevel = 1,
	lInitChip = 1,
	lTotalAward = 1,
	dwMaxUserCount = 1,
	wAddOnFee = 1,
	wAddOnCount = 1,
	wRebuyCount = 1,
	CycleTime = 1,
	wAwardType = 1,
	dwRegistrationStartTime = 1,
	wRebuyTimes = 1,
	wServerID = 1,
	wJoinUserCount = 1,
	wSortID = 1,
	wMatchType = 1,
	lServiceFee = 1,
	bJoin = 3,
	wMatchID = 1,
	StartTime = 1
}
CMD_MB_LoadTexasHoldemJoinMatchResponse = {
	dwRegistrationEndTime = 1,
	lRegistrationFee = 1,
	bEnd = 3,
	wRebuyFee = 1,
	wRebuyMinLevel = 1,
	wRebuyMaxLevel = 1,
	bStart = 3,
	dwMinUserCount = 1,
	lLoseCip = 1,
	wState = 1,
	szMatchName = 2,
	wAddOnTimes = 1,
	wAddOnMinLevel = 1,
	wAddOnMaxLevel = 1,
	lInitChip = 1,
	lTotalAward = 1,
	dwMaxUserCount = 1,
	wAddOnFee = 1,
	wAddOnCount = 1,
	wRebuyCount = 1,
	CycleTime = 1,
	wAwardType = 1,
	dwRegistrationStartTime = 1,
	wRebuyTimes = 1,
	wServerID = 1,
	wJoinUserCount = 1,
	wSortID = 1,
	wMatchType = 1,
	lServiceFee = 1,
	wMatchID = 1,
	StartTime = 1
}
CMD_MB_LoadTexasHoldemBlindResponse = {
	bStart = 3,
	lBigBlind = 1,
	bEnd = 3,
	lSmallBlind = 1,
	dwGrowthTime = 1,
	wLevel = 1,
	wMatchID = 1,
	lAnte = 1
}
CMD_MB_LoadTexasHoldemFixedBonusResponse = {
	lAward = 1,
	bStart = 3,
	bEnd = 3,
	wMatchID = 1,
	wRank = 1
}
CMD_MB_LoadTexasHoldemMatchRecordResponse = {
	lAward = 1,
	szMatchName = 2,
	bEnd = 3,
	dwPeriodID = 1,
	bStart = 3,
	wMatchID = 1,
	StartTime = "CMD_SYSTEMTIME"
}
CMD_MB_LoadTexasHoldemMatchResultResponse = {
	wRank = 1,
	bEnd = 3,
	dwPeriodID = 1,
	lScore = 1,
	szNickName = 2,
	bStart = 3,
	dwUserID = 1
}
CMD_MB_JoinTexasHoldemMatchResponse = {
	wServerID = 1,
	lResultCode = 1,
	wMatchID = 1,
	szDescribeString = 2
}
CMD_MB_QuitTexasHoldemMatchResponse = {
	wServerID = 1,
	lResultCode = 1,
	wMatchID = 1,
	szDescribeString = 2
}
CMD_GR_TexasHoldem_Waiting = {
	dwTimeRemaining = 1
}
CMD_GR_TexasHoldem_Waiting_Other_Player = {
	dwTimeRemaining = 1
}
CMD_GR_TexasHoldem_Rebuy_Request = {
	lChip = 1
}
CMD_GR_TexasHoldem_Rebuy_Response = {
	lResultCode = 1,
	lRemainTimes = 1,
	lChip = 1
}
CMD_GR_TexasHoldem_Addon_Request = {
	lChip = 1
}
CMD_GR_TexasHoldem_Addon_Response = {
	lResultCode = 1,
	lRemainTimes = 1,
	lChip = 1
}
CMD_GR_TexasHoldem_Info = {
	wAddonMaxLevel = 1,
	wRebuyCount = 1,
	wAddOnFee = 1,
	wRebuyFee = 1,
	wAddOnCount = 1,
	wAddonMinLevel = 1,
	wRebuyMaxLevel = 1,
	wRebuyTimes = 1,
	wRebuyMinLevel = 1,
	wAddonTimes = 1,
	lInitChip = 1
}
CMD_GR_TexasHoldem_UpdateBlindLevel = {
	dwTotalUserCount = 1,
	lBigBlind = 1,
	dwGrowthTime = 1,
	lSmallBlind = 1,
	dwUserCount = 1,
	wLevel = 1,
	lAverageChip = 1,
	lAnte = 1
}
CMD_GR_TexasHoldem_MatchDetailInfo = {
	dwUpdateBlindTime = 1,
	lSmallBlind = 1,
	dwTotalUserCount = 1,
	lNextBigBlind = 1,
	lTotalChip = 1,
	lAnte = 1,
	dwTotalRank = 1,
	lBigBlind = 1,
	dwElapsedTime = 1,
	dwRank = 1,
	dwCurrentBlindLevel = 1,
	lNextSmallBlind = 1,
	dwUserCount = 1,
	lNextAnte = 1,
	dwTotalAwardCount = 1,
	dwAwardCount = 1,
	lAverageChip = 1
}
CMD_GR_TexasHoldem_MatchOver = {
	dwRank = 1
}
CMD_GR_TexasHoldem_NextBlindLevel = {
	lBigBlind = 1,
	dwGrowthTime = 1,
	lSmallBlind = 1,
	wLevel = 1,
	lAnte = 1
}
CMD_GR_TexasHoldem_PushMessage = {
	szNickName = 2,
	lTotalScore = 1,
	dwID = 1,
	wType = 1,
	szMatchName = 2,
	lScore = 1,
	dwRank = 1,
	wMatchID = 1,
	StartTime = "SYSTEMTIME"
}
SJB_MatchInfo = {
	pk_europe_disable = 1,
	pk_asian_disable = 1,
	pk_europe_lost_areaid = 1,
	pk_europe_lost = 1,
	pk_asian_vteam_areaid = 1,
	pk_asian_match_minjetton = 1,
	match_id = 1,
	pk_asian_hteam_areaid = 1,
	pk_asian_handicap = 1,
	pk_europe_won = 1,
	pk_asian_typeid = 1,
	pk_asian_vteam = 1,
	pk_bs_minjetton = 1,
	pk_bs_small = 1,
	pk_bs_small_areaid = 1,
	pk_bs_typeid = 1,
	cbActive = 1,
	pk_europe_drawn = 1,
	match_start_date = 1,
	pk_asian_id = 1,
	pk_europe_drawn_areaid = 1,
	pk_bs_big = 1,
	pk_asian_totalpool = 1,
	match_disable = 1,
	pk_europe_won_areaid = 1,
	match_opened_time = 1,
	match_state = 1,
	pk_bs_totalpool = 1,
	pk_asian_hteam = 1,
	pk_bs_disable = 1,
	pk_europe_typeid = 1,
	pk_europe_id = 1,
	pk_europe_minjetton = 1,
	pk_europe_totalpool = 1,
	pk_bs_id = 1,
	pk_bs_handicap = 1,
	pk_bs_big_areaid = 1,
	szStartTime = 2
}
SJB_MatchMenu = {
	match_disable = 1,
	match_vteam_logo_id = 1,
	match_settle_status = 1,
	match_opened_time = 1,
	match_start_date = 1,
	match_state = 1,
	match_end_time = 1,
	match_groupname = 2,
	match_guessing_id = 1,
	match_hteam_logo_id = 1,
	wMatchID = 1,
	szStartTime = 2
}
SJB_CMD_S_JETTON = {
	pk_asian_vteam = 1,
	pk_europe_lost = 1,
	pk_europe_drawn = 1,
	pk_europe_id = 1,
	LastScore = 1,
	HandicapID = 1,
	pk_bs_small = 1,
	strErrorDescribe = 2,
	pk_asian_handicap = 1,
	pk_europe_won = 1,
	returnvalue = 1,
	nServerTime = 1,
	pk_asian_hteam = 1,
	MatchID = 1,
	dwUserID = 1,
	BeforeScore = 1,
	nAreaID = 1,
	pk_asian_id = 1,
	pk_bs_id = 1,
	pk_bs_handicap = 1,
	pk_bs_big = 1
}
SJB_CMD_S_Send_Jetton_Total = {
	cbActive = 1,
	nServerTime = 1,
	wJettonAreaID = 1,
	lVJettonTotalPlayerCount = 1,
	nMatchID = 1,
	lJettonSoloTotal = {
		_t = 1,
		_l = {
			3
		}
	},
	lVJettonAreaTotalPlayerCount = {
		_t = 1,
		_l = {
			3
		}
	},
	lForecastScore = {
		_t = 1,
		_l = {
			3
		}
	}
}
SJB_CMD_S_Send_Match_Info = {
	tInfo = "SJB_MatchInfo",
	nServerTime = 1
}
SJB_CMD_S_Send_Match_Menu = {
	nServerTime = 1,
	nCount = 1,
	cbActive = 1,
	tMenu = {
		_t = "SJB_MatchMenu",
		_l = {
			80
		}
	}
}
SJB_CMD_C_Request_Match_Info = {
	wMatchID = 1,
	cbActive = 1
}
SJB_CMD_C_Request_Menu = {
	cbActive = 1
}
SJB_CMD_C_Jetton = {
	wHandicapTypeID = 1,
	lJettonScore = 1,
	wHandicapID = 1,
	cbDeviceType = 1,
	wJettonAreaID = 1,
	strTempPassword = 2,
	wMatchID = 1
}
SJB_CMD_C_Request_Jetton_Total = {
	wMatchID = 1,
	cbActive = 1,
	cbJettonType = 1
}
SJB_CMD_C_Request_Guess_buy = {
	cbDeviceType = 1,
	strTempPassword = 2,
	dwGuessingID = 1
}
SJB_CMD_C_Request_GuessingInfo = {
	cbDeviceType = 1,
	strTempPassword = 2,
	cbActive = 1,
	dwGuessingID = 1
}
SJB_CMD_C_Request_Guess_Jetton = {
	dwVteamScore = 1,
	dwHteamScore = 1,
	cbDeviceType = 1,
	strTempPassword = 2,
	dwGuessingID = 1
}
SJB_CMD_S_Send_GuessingInfo = {
	guessing_id = 1,
	endtime = 1,
	hteam_logo_id = 1,
	guessing_price = 1,
	guessing_gifttimescore = 1,
	cbActive = 1,
	match_groupname = 2,
	guessing_surpluscount = 1,
	guessing_count = 1,
	vteam_logo_id = 1,
	returnvalue = 1,
	strErrorDescribe = 2,
	guessing_totalpool = 1
}
SJB_CMD_S_Send_GuessBuy = {
	Guessing_SurplusCount = 1,
	BeforeScore = 1,
	returnvalue = 1,
	strErrorDescribe = 2,
	LastScore = 1,
	GuessingID = 1
}
SJB_CMD_S_Send_GuessJetton = {
	Guessing_SurplusCount = 1,
	returnvalue = 1,
	strErrorDescribe = 2,
	Guessing_PartakeCount = 1,
	GuessingID = 1
}
SJB_CMD_S_BROADCAST_JETTON = {
	szName = 2,
	lJetton = 1,
	nMatchID = 1
}
SJB_CMD_S_BROADCAST_NOTICE = {
	nMatchID = 1
}

return
