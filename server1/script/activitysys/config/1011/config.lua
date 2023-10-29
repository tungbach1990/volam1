Include("\\script\\activitysys\\config\\1011\\variables.lua")
Include("\\script\\activitysys\\config\\1011\\awardlist.lua")
tbConfig = {}
tbConfig[1] = --��nh qu�i r�t Item
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "kill monster at field",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_EVENT_1,1,"7"} },
		{"NpcFunLib:DropSingleItem",	{ITEM_EVENT_5,1,"7"} },
	},
}
tbConfig[2] = --S� d�ng h�t gi�ng c�y Thi�n L�c
{
	nId = 2,
	szMessageType = "Use_Tianlu_Seed",
	szName = "Use seed get material",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_6,7,EVENT_LOG_TITLE,"SuDungHatGiongThienLocNhanThanHong"} },
	},
}
tbConfig[3] = --TK 1000 �i�m
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "songjin 1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_3,30,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "K�t th�c m�i �i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_3,1, EVENT_LOG_TITLE, "VuotquamoiAi"} },
	},
}
tbConfig[5] = --v��t �i 17
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_3,5,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[6] = --v��t �i 28
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_3,5,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "FinishFengLingDu",
	szName = "FinishFengLingDu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_3,5,EVENT_LOG_TITLE,"HoanThanhPLD"} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_3,20,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_big_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"ThisActivity:CheckLevelTranslife",	{""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_3,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "YDBZguoguan",
	szName = "YanDi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_3,2,EVENT_LOG_TITLE,"QuaAiViemDe"} },
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "YDBZguoguan",
	szName = "YanDi 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_3,20,EVENT_LOG_TITLE,"QuaAi10ViemDe"} },
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
		{"ThisActivity:CheckLevelTranslife",	{""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_3,5,EVENT_LOG_TITLE,"HoanThanhBossST90"} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�ng rong"},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{format("Mua %s",ITEM_EVENT_2.szName),14} },
	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "buy item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_EVENT_2.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
		{"AddOneMaterial",	{"Ng�n l��ng",{szName = "Ng�n l��ng", nJxb = 1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_2,1,EVENT_LOG_TITLE,"MuaChuoiKiem"} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i s� ho�t ��ng"},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"H�p th�nh ph�n th��ng",16} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c",23} },
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "CreateDialog",
	szName = "Ghep phan thuong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Xin ch�n lo�i ph�n th��ng?"},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"H�p th�nh [Long Ki�m]",17} },
		{"AddDialogOpt",	{"H�p th�nh [Qu�n L��ng]",18} },
		{"AddDialogOpt",	{"H�p th�nh [Qu�n Trang]",19} },
	},
}
tbConfig[17] = 
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "compose 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_EVENT_7.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
		{"AddOneMaterial",	{ITEM_EVENT_1.szName,ITEM_EVENT_1,1} },
		{"AddOneMaterial",	{ITEM_EVENT_2.szName,ITEM_EVENT_2,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_7,1,EVENT_LOG_TITLE,"GhepLongKiem"} },
	},
}
tbConfig[18] = 
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "compose 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_EVENT_9.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
		{"AddOneMaterial",	{ITEM_EVENT_5.szName,ITEM_EVENT_5,1} },
		{"AddOneMaterial",	{ITEM_EVENT_6.szName,ITEM_EVENT_6,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_9,1,EVENT_LOG_TITLE,"GhepQuanLuong"} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "compose 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_EVENT_8.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
		{"AddOneMaterial",	{ITEM_EVENT_1.szName,ITEM_EVENT_1,1} },
		{"AddOneMaterial",	{ITEM_EVENT_2.szName,ITEM_EVENT_2,1} },
		{"AddOneMaterial",	{ITEM_EVENT_3.szName,ITEM_EVENT_3,1} },
		{"AddOneMaterial",	{ITEM_EVENT_4.szName,ITEM_EVENT_4,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EVENT_8,1,EVENT_LOG_TITLE,"GhepQuanTrang"} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "D�ng Long Ki�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_EVENT_7},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_1,tbTSK_INFO_1.nMaxValue,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{1000000,0,EVENT_LOG_TITLE,"SuDungLongKiem"} },
		{"tbVNG_BitTask_Lib:addTask",	{tbTSK_INFO_1,1} },
	},
}
tbConfig[21] =
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "D�ng Qu�n L��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_EVENT_9},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_2,tbTSK_INFO_2.nMaxValue,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbEXP_AWARD_1,1,EVENT_LOG_TITLE,"SuDungQuanLuong"} },
		{"tbVNG_BitTask_Lib:addTask",	{tbTSK_INFO_2,1} },
	},
}
tbConfig[22] =
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "D�ng Qu�n Trang",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_EVENT_8},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_3,tbTSK_INFO_3.nMaxValue,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:CustomAward1",	{nil} },
	},
}
tbConfig[23] =
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi s� d�ng v�t ph�m Qu�n Trang ��t m�c 500, 1000, 1500, 2000 c� th� ��n g�p ta �� nh�n th��ng. Hi�n t�i ��i hi�p �� s� d�ng <color=yellow><lua GetBitTask(2992, 17, 14) /><color> v�t ph�m n�y."},
	tbCondition = 
	{
		{"ThisActivity:CheckLevelTranslife",	{""} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c 500",24} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c 1000",25} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c 1500",26} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c 2000",27} },
	},
}
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng ��t m�c 500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_4,500,"Y�u c�u s� d�ng v�t ph�m Qu�n Trang ��t <color=red>500<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_5,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_5,1} },
		{"PlayerFunLib:GetItem",{tbAward_3["500"],1,EVENT_LOG_TITLE,"SuDungQuanTrangDat500Lan"} },
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng ��t m�c 1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_4,1000,"Y�u c�u s� d�ng v�t ph�m Qu�n Trang ��t <color=red>1000<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_6,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_6,1} },
		{"PlayerFunLib:GetItem",	{tbAward_3["1000"],1,EVENT_LOG_TITLE,"SuDungQuanTrangDat1000Lan"} },
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng ��t m�c 1500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_4,1500,"Y�u c�u s� d�ng v�t ph�m Qu�n Trang ��t <color=red>1500<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_7,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2, 4, 1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_7,1} },
		{"PlayerFunLib:GetItem",	{tbAward_3["1500"],1,EVENT_LOG_TITLE,"SuDungQuanTrangDat1500Lan"} },
	},
}
tbConfig[27] = 
{
	nId = 27,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng ��t m�c 2000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_4,2000,"Y�u c�u s� d�ng v�t ph�m Qu�n Trang ��t <color=red>2000<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_8,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2, 4, 1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_8,1} },
		{"PlayerFunLib:GetItem",	{tbAward_3["2000"],1,EVENT_LOG_TITLE,"SuDungQuanTrangDat2000Lan"} },
	},
}
