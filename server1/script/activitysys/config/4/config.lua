Include("\\script\\activitysys\\config\\4\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "KillMonster",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"340,321,322,225,226,227,75"} },
	},
	tbActition = 
	{
		{"ThisActivity:KillMonster",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "SongJin1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "SongJin3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,30,EVENT_LOG_TITLE,"TongKim3000"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "ChuangGuan17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "ChuangGuan28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "FengLingDu_Boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "FengLingDu_BigBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,15,EVENT_LOG_TITLE,"VuotAiViemDe6"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "GoldenBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,30,EVENT_LOG_TITLE,"TieuDietBossTheGioi"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "KillerBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,3,EVENT_LOG_TITLE,"TieuDietBossSatThu"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "ClickNpc_QiuYun",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thu V�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng",23} },
		{"AddDialogOpt",	{"H�p th�nh Hoa Ph��ng ��",12} },
		{"AddDialogOpt",	{"H�p th�nh Hoa Ph��ng Tr�ng",13} },
		{"AddDialogOpt",	{"H�p th�nh Hoa Ph��ng T�m",14} },
		{"SetDialogTitle",	{"<npc>3/5/2012 ��n 24:00/31/52012, c�c ch� v� ��i hi�p c� th� ��n ch� c�a t�i s� d�ng H�t M�m, T�i Thu�c T�ng Tr��ng, B�nh N��c, Ph�m M�u S�c �� h�p th�nh c�c lo�i Hoa Ph��ng �� ��i l�y ph�n th��ng."} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "nil",
	szName = "ComposeRedFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"Red"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "nil",
	szName = "ComposeWhiteFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"White"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "nil",
	szName = "ComposePurpleFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"Purple"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "UseRedFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3161,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"ThisActivity:CheckTask",	{TSK_RED_FLOWER_COUNT,N_MAX_RED_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseRedFlower",	{nil} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "UseWhiteFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3163,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"ThisActivity:CanUseWhiteFlower",	{nil} },
		{"ThisActivity:CheckTask",	{TSK_2_FLOWER_COUNT,N_MAX_2_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWhiteFlower",	{nil} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "UsePurpleFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3162,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang �t nh�t c�n 1 ch� tr�ng"} },
		{"ThisActivity:CheckTask",	{TSK_2_FLOWER_COUNT,N_MAX_2_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UsePurpleFlower",	{nil} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "ServerStart",
	szName = "ServerStart",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{"Thu V�n",1907,{{11,3182,4951}}} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "ClickNpc_LingFan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�ng rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua T�i Thu�c T�ng Tr��ng",20} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Buy_NongYao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T�i Thu�c T�ng Tr��ng",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang �t nh�t c�n 1 ch� tr�ng"} },
		{"AddOneMaterial",	{"Ng�n l��ng",{nJxb=10000},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3158,1,0,0},nExpiredTime=20120601,},1,EVENT_LOG_TITLE,"BuyNongyao"} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "UseSeedBox",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3164,1,0,0}}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Kh�ng gian h�nh trang kh�ng �� ch� tr�ng, xin h�y s�p x�p l�i �t nh�t c�n hai ch� tr�ng trong h�nh trang"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3157,1,0,0},nExpiredTime=20120601},100,EVENT_LOG_TITLE,"UseSeedBox"} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "UseWaterBox",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3165,1,0,0}}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Kh�ng gian h�nh trang kh�ng �� ch� tr�ng, xin h�y s�p x�p l�i �t nh�t c�n hai ch� tr�ng trong h�nh trang"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3159,1,0,0},nExpiredTime=20120601},100,EVENT_LOG_TITLE,"UseWaterBox"} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>H�t M�m c� th� t�m th�y t�i M�c Cao Qu�t, Tr��ng B�ch S�n Nam, Tr��ng B�ch S�n B�c, Sa M�c 1, Sa M�c 2, Sa M�c 3, Kh�a Lang ��ng, T�i Thu�c T�ng Tr��ng c� th� t�m th�y t�i H�ng Rong, B�nh N��c c� th� th�ng qua tham gia T�ng Kim, V��t �i, Phong L�ng ��, Vi�m ��, Boss Ho�ng Kim, Boss S�t Th�. Ph�m M�u S�c c� t�i K� Tr�n C�c, khi ��i hi�p t�m �� 4 lo�i v�t ph�m n�y c� th� ��n ch� c�a ta ��y h�p th�nh c�c lo�i Hoa Ph��ng s�c m�u �� ��i ph�n th��ng phong ph�",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[26] = --һ��ϸ��
{
	nId = 26,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[27] = --һ��ϸ��
{
	nId = 27,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[28] = --һ��ϸ��
{
	nId = 28,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[29] = --һ��ϸ��
{
	nId = 29,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[30] = --һ��ϸ��
{
	nId = 30,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[31] = --һ��ϸ��
{
	nId = 31,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[32] = --һ��ϸ��
{
	nId = 32,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
