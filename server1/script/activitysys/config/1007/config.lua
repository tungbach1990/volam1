Include("\\script\\activitysys\\config\\1007\\variables.lua")
tbConfig = {}

--C�ch ki�m nguy�n li�u trong c�c ho�t ��ng
tbConfig[1] = --T�ng kim 1000 �i�m
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 1000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1500,">="} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,"<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,10,EVENT_LOG_TITLE, "TongKim1000"} },
	},
}

tbConfig[2] = --T�ng kim 3000 �i�m
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 3000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,15,EVENT_LOG_TITLE, "TongKim3000"} },
	},
}
tbConfig[3] =		--V��t �i 17
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,10,EVENT_LOG_TITLE, "VuotAi17"} },
	},
}
tbConfig[4] =  				--V��t �i 28
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,10,EVENT_LOG_TITLE, "VuotAi28"} },
	},
}
tbConfig[5] = --Th�y t�c ��u l�nh
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "Gi�t ch�t 1 th�y t�c ��u l�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,10,EVENT_LOG_TITLE, "TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[6] = --thu� t�c ��i ��u l�nh
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t thu� t�c ��i ��u l�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,20,EVENT_LOG_TITLE, "TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[7] = --Ti�u di�t Boss ti�u vi�m ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "yandibaozang boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1289,1290,1291,1292,1293,1294,1295,1296,1297,1298"} },
		{"NpcFunLib:CheckInMap",	{"853,854,855,856,857,858,859,860,861,862"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,2,EVENT_LOG_TITLE,"BossTieuViemDe"} },
	},
}
tbConfig[8] = --Boss ��i vi�m ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "yandibaozang boss sp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1310,1312,1317,1314,1318,1319,1311,1313,1315,1316"} },
		{"NpcFunLib:CheckInMap",	{"853,854,855,856,857,858,859,860,861,862"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,6,EVENT_LOG_TITLE,"BossDaiViemDe"} },
	},
}
tbConfig[9] = --Boss Ho�ng Kim
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t boss Ho�ng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,20,EVENT_LOG_TITLE, "TieuDietBossTheGioi"} },
	},
}
tbConfig[10] = --Thi�n tr� t�ng 3
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "tianchimijing floor3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"937,938,939,940,941,943,944,945,946"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_THIEP,1,"10"} },
	},
}
tbConfig[11] = --Ki�m gia m� cung
{
	nId = 11,
	szMessageType = "MazeTaskFinish",
	szName = "maze task",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,3,EVENT_LOG_TITLE,"KiemGiaMeCung"} },
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "B�n �� ��nh qu�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,75,225,226,227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_HOAHONG,1,"5"} },
	},
}
--------------------------------------------------------------------------------------------------------
---��i tho�i v�i Npc
tbConfig[13] =
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "B�m v�o T�ng Qu�n S� Ki�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T�ng Qu�n S� Ki�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gh�p H�p Qu�",14} },
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "CreateDialog",
	szName = "Gh�p H�p Qu�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C�c h� mu�n gh�p h�p qu� n�o?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gh�p h�p qu� l�n",15} },
		{"AddDialogOpt",	{"Gh�p h�p qu� nh�",16} },
	},
}
tbConfig[15] = --Gh�p h�p qu� l�n
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh H�p qu�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>H�p qu� l�n",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_HOAHONG.szName,ITEM_HOAHONG,1} },
		{"AddOneMaterial",	{ITEM_THIEP.szName,ITEM_THIEP,1} },
		{"AddOneMaterial",	{ITEM_EMPTY_BOX.szName,ITEM_EMPTY_BOX,1} },
		{"AddOneMaterial",	{ITEM_TRANGSUC.szName,ITEM_TRANGSUC,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BIG_BOX,1,EVENT_LOG_TITLE, "GhepHopQuaLon"} },
	},
}
tbConfig[16] = --Gh�p h�p qu� Nho
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh H�p qu�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>H�p qu� nh�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_HOAHONG.szName,ITEM_HOAHONG,1} },
		{"AddOneMaterial",	{ITEM_THIEP.szName,ITEM_THIEP,1} },
		{"AddOneMaterial",	{ITEM_EMPTY_BOX.szName,ITEM_EMPTY_BOX,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SMALL_BOX,1,EVENT_LOG_TITLE, "GhepHopQuaNho"} },
	},
}
tbConfig[17] = --s� d�ng H�p qu� nh�
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "S� d�ng H�p qu� nh�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_SMALL_BOX},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, kh�ng th� s� d�ng v�t ph�m",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbSmall_Box_Use_Limit,nSMALL_BOX_MAX,"S� d�ng H�p Qu� Nh� ��t ��n gi�i h�n, kh�ng th� s� \nd�ng ti�p","<"} },
		--{"ThisActivity:Use_Box_Limit", {tbSmall_Box_Use_Limit}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbSmall_Box_Use_Limit, 1}},
	--	{"ThisActivity:Use_Small_Box", {nil}},	
		{"PlayerFunLib:AddExp",	{nAWARD_NHO_HQ,0,EVENT_LOG_TITLE,"SuDungHopQuaNhoNhanExp"} },
	},
}
tbConfig[18] = --s� d�ng H�p qu� l�n
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "S� d�ng H�p qu� l�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BIG_BOX},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, kh�ng th� s� d�ng v�t ph�m",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBig_Box_Use_Limit,nBIG_BOX_MAX,"S� d�ng H�p Qu� l�n ��t ��n gi�i h�n, kh�ng th� s� \nd�ng ti�p","<"} },
		--{"ThisActivity:Use_Box_Limit", {tbBig_Box_Use_Limit}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBig_Box_Use_Limit, 1}},
		{"PlayerFunLib:AddExp",	{nAWARD_LON_HQ,0,EVENT_LOG_TITLE,"SuDungHopQuaLonNhanExp"} },
		{"PlayerFunLib:GetItem",	{nITEM_AWARD_LON_HQ,1,EVENT_LOG_TITLE, "SuDungHopQuaLonNhanVatPham"} },	
		{"ThisActivity:Use_Big_Box", {nil}},	
	},
}
tbConfig[19] = --Mua B�nh d�o t�i npc Hang rong
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "H�ng rong b�n H�p qu� tr�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�ng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua H�p qu� tr�ng",20} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Mua H�p qu� tr�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�p qu� tr�ng",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"100000 l��ng",{nJxb=10000,},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EMPTY_BOX,1,EVENT_LOG_TITLE,"MuaHopQuaTrongNpcHangRong"} },
	},
}