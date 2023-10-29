Include("\\script\\activitysys\\config\\1003\\variables.lua")
Include("\\script\\activitysys\\config\\1003\\awardlist.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "songjin mark>=1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4, 30, EVENT_LOG_TITLE, "TongKim1000"} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "K�t th�c m�i �i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,1, EVENT_LOG_TITLE, "VuotquamoiAi"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "COT 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4, 5, EVENT_LOG_TITLE, "Change_Of_Time_17"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "COT 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4, 5, EVENT_LOG_TITLE, "Change_Of_Time_28"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "FinishFengLingDu",
	szName = "FinishFengLingDu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,5,EVENT_LOG_TITLE,"Feng_Ling_Du_Finish"} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,20,EVENT_LOG_TITLE,"Feng_Ling_Du_Boat_Boss"} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_big_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,20,EVENT_LOG_TITLE,"Feng_Ling_Du_Boat_Big_Boss"} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "YanDi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,2,EVENT_LOG_TITLE,"Yan_Di_Each"} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "YanDi 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,20,EVENT_LOG_TITLE,"Yan_Di_10"} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,5,EVENT_LOG_TITLE,"FinishKillerBoss90"} },
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�ng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{format("Mi�n ph� nh�n v�t ph�m %s",ITEM_1.szName),12} },
		{"AddDialogOpt",	{format("Mua %s",ITEM_3.szName),16} },
	},
}
tbConfig[12] = 
{
	nId = 12,
	szMessageType = "nil",
	szName = "get free item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTransLifeCount",	{2,"Y�u c�u tr�ng sinh 2 tr� l�n",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"Y�u c�u ��ng c�p 150 tr� l�n",">="} },	
		{"PlayerFunLib:CheckTaskDaily",	{TSK_DAILY_1,MAX_ITEM_1_DAILY,"H�m nay ng��i kh�ng th� nh�n n�a, ng�y mai h�y quay l�i.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{TSK_DAILY_1,1} },
		{"PlayerFunLib:GetItem",	{ITEM_1,1,EVENT_LOG_TITLE,"NhanHanhQuanLenhTaiHangRong"} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i s� ho�t ��ng"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },			
	},
	tbActition = 
	{
		{"AddDialogOpt",	{format("N�p v�t ph�m %s nh�n th��ng",ITEM_1.szName),14} },
		{"AddDialogOpt",	{"H�p th�nh ph�n th��ng",23} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng s� d�ng ��t m�c 200 Huy Hi�u ��i So�i",27} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng s� d�ng ��t m�c 3000 Huy Hi�u ��i So�i",33} },
		{"AddDialogOpt",	{"Ho�t ��ng �ua top server",28} },
	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "give item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p v�t ph�m H�nh Qu�n L�nh",1,0,0,0,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTransLifeCount",	{2,"Y�u c�u tr�ng sinh 2 tr� l�n",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"Y�u c�u ��ng c�p 150 tr� l�n",">="} },
		{"PlayerFunLib:CheckTaskDaily",	{TSK_DAILY_2,MAX_ITEM_1_DAILY,"H�m nay ng��i kh�ng th� n�p v�t ph�m n�a, ng�y mai h�y quay l�i.","<"} },
		{"ThisActivity:CheckGiveItemLimit", {nil}},
		{"AddOneMaterial",	{ITEM_1.szName,ITEM_1,1} },
	},
	tbActition = 
	{		
		{"ThisActivity:GiveItemGetExp", {nil}},
	},
}
tbConfig[15] = --��nh qu�i r�t Item
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "kill monster at field",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_2,1,"20"} },		
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "buy item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_3.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{MONEY.szName,MONEY,1000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3,1,EVENT_LOG_TITLE,"MuaHuyHieu3TaiHangRong"} },
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "D�ng H�p Huy Hi�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_5},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },		
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },				
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,20,EVENT_LOG_TITLE,"SuDungHopHuyHieu"} },
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "D�ng Huy Hi�u 4 sao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD1,TSK_USE_AWARD1.nMaxValue,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{		
		{"ThisActivity:UseItemGetExp", {ITEM_6.szName, 1e6, TSK_USE_AWARD1, "SuDungHuyHieu4Sao"}},
		{"tbVNG_BitTask_Lib:addTask",	{TSK_USE_AWARD1,1} },
	},
}
tbConfig[19] =
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "D�ng Huy Hi�u sao v�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_7},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD2,TSK_USE_AWARD2.nMaxValue,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{		
		{"ThisActivity:UseItemGetExp", {ITEM_7.szName, 2e6, TSK_USE_AWARD2, "SuDungHuyHieuSaoVang"}},
		{"tbVNG_BitTask_Lib:addTask",	{TSK_USE_AWARD2,2} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "D�ng Huy Hi�u sao ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_8},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD3,TSK_USE_AWARD3.nMaxValue,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{		
		{"ThisActivity:UseItemGetExp", {ITEM_8.szName, 3e6, TSK_USE_AWARD3, "SuDungHuyHieuSaoDo"}},
		{"tbVNG_BitTask_Lib:addTask",	{TSK_USE_AWARD3,3} },
	},
}
tbConfig[21] =
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "D�ng Huy Hi�u ��i So�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_9},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD4,TSK_USE_AWARD4.nMaxValue,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseItem1", {nil}},
	},
}
tbConfig[22] =
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "H�p Qu� Vui V�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_12},
	tbCondition = 
	{
		{"ThisActivity:HappyBoxCondition",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD6,1,"M�i ng��i ch�i ch� s� d�ng 1 l�n H�p qu� vui v�","~="} },
	},
	tbActition =
	{
		{"ThisActivity:UseHappyBox",	{nil} },
		{"tbVNG_BitTask_Lib:setBitTask", {TSK_USE_AWARD6, 1}},
	},
}
tbConfig[23] =
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "ch�n gh�p ph�n th��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Xin ch�n lo�i ph�n th��ng?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gh�p [Huy Hi�u 4 Sao]",24} },
		{"AddDialogOpt",	{"Gh�p [Huy Hi�u Sao V�ng - ��]",25} },
		{"AddDialogOpt",	{"Gh�p [Huy Hi�u ��i So�i]",26} },
	},
}
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "compose 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_6.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{ITEM_2.szName,ITEM_2,1} },
		{"AddOneMaterial",	{ITEM_3.szName,ITEM_3,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_6,1,EVENT_LOG_TITLE,"GhepHuyHieu4Sao"} },
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "compose 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Huy Hi�u Sao V�ng - ��",1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{ITEM_2.szName,ITEM_2,1} },
		{"AddOneMaterial",	{ITEM_4.szName,ITEM_4,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{COMPOSE_AWARD_1,1,EVENT_LOG_TITLE,"GhepHuyHieuSaoVangDo"} },
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "compose 3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_9.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{ITEM_3.szName,ITEM_3,1} },
		{"AddOneMaterial",	{ITEM_10.szName,ITEM_10,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_9,1,EVENT_LOG_TITLE,"GhepHuyHieuDaiSoai"} },
	},
}

tbConfig[27] = 
{
	nId = 27,
	szMessageType = "nil",
	szName = "s� d�ng ��t m�c nh�n h�o quang",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD5,200,"Y�u c�u s� d�ng v�t ph�m Huy Hi�u ��i So�i ��t <color=red>200<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD7,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{TSK_USE_AWARD7,1} },
		{"ThisActivity:GetTittleAward", {nil}},
	},
}

tbConfig[28] =
{
	nId = 28,
	szMessageType = "CreateDialog",
	szName = "�ua top",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Ng��i ch�i n�u thu th�p ���c v�t ph�m [T�i Chi�n Th�ng] c� th� �em ��n g�p ta �� tham gia ho�t ��ng �ua top server. Ng��i ch�i n�o n�p ���c nhi�u v�t ph�m nh�t s� nh�n ���c ph�n th��ng gi� tr�. Chi ti�t xem t�i trang ch� <color=blue>volam.zing.vn<color>. <enter>Ho�t ��ng n�y ch�nh th�c b�t ��u sau th�i gian b�o tr� ng�y 8/4/2013. H�y t�ch l�y ngay t� b�y gi� nh�!"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap", {"11", "Xin vui l�ng ��n Th�nh ��"}},
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"N�p v�t ph�m [T�i Chi�n Th�ng]",29} },
		{"AddDialogOpt",	{"Xem b�ng x�p h�ng",30} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng x�p h�ng",31} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ng��i ��u ti�n ��t top server",32} },
	},
}
tbConfig[29] =
{
	nId = 29,
	szMessageType = "CreateCompose",
	szName = "giao n�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>N�p v�t ph�m",1,1,1,0},
	tbCondition = 
	{			
		{"AddOneMaterial",	{ITEM_11.szName,ITEM_11,1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },	
		{"ThisActivity:Top10_CheckTime",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:Top10_GiveItem",	{nil} },		
	},
}
tbConfig[30] =
{
	nId = 30,
	szMessageType = "nil",
	szName = "xem b�ng x�p h�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{				
	},
	tbActition = 
	{
		{"ThisActivity:ShowTopList",	{nil} },
	},
}
tbConfig[31] =
{
	nId = 31,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng top 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{nil} },
	},
}
tbConfig[32] =
{
	nId = 32,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng top 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetFirstWinnerAward",	{nil} },
	},
}

tbConfig[33] = 
{
	nId = 33,
	szMessageType = "nil",
	szName = "s� d�ng ��t m�c 3000 huy hުu ��i so�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD5,3000,"Y�u c�u s� d�ng v�t ph�m Huy Hi�u ��i So�i ��t <color=red>3000<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD10,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{TSK_USE_AWARD10,1} },
		{"PlayerFunLib:GetItem",	{tbAward_3, 1, EVENT_LOG_TITLE, "PhanThuongDat3000HuyHieuDaiSoai"} },
	},
}