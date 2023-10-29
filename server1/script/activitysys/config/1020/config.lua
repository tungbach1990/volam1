Include("\\script\\activitysys\\config\\1020\\variables.lua")
Include("\\script\\activitysys\\config\\1020\\awardlist.lua")
tbConfig = {}
tbConfig[1] = --��nh qu�i r�t Item
{
	nId = 1,
	szMessageType = "NpcOnDeath",	
	szName = "B�n �� ��nh qu�i nh�n B�t M�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"75,321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_MATERIAL_1,1,"8"} },		
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "songjin mark>=1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,30,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "K�t th�c m�i �i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,1,EVENT_LOG_TITLE,"VuotquamoiAi"} },
	},
}
tbConfig[4] = --v��t �i 17
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,10,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[5] = --v��t �i 28
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,10,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "FinishFengLingDu",
	szName = "FinishFengLingDu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,5,EVENT_LOG_TITLE,"HoanThanhPLD"} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_boss",
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,20,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_big_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "YanDi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,2,EVENT_LOG_TITLE,"QuaAiViemDe"} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "YDBZguoguan",
	szName = "YanDi 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,20,EVENT_LOG_TITLE,"QuaAi10ViemDe"} },
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,5,EVENT_LOG_TITLE,"HoanThanhBossST90"} },
	},
}

--Hang Rong
tbConfig[12] = --Hang rong
{
	nId = 12,
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
		{"SetDialogTitle",	{"C� th� d�ng 1 v�n l��ng �� mua nguy�n li�u B� �� gh�p th�nh b�nh Sinh Nh�t V� L�m Truy�n K�"} },	
		{"AddDialogOpt",	{format("Mua nguy�n li�u %s",ITEM_MATERIAL_3.szName),13} },
	},
}
tbConfig[13] = 
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Mua B� t�i H�ng rong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_MATERIAL_3.szName,1,1,1,0.04,0,250},	
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{MONEY.szName,MONEY,10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,1,EVENT_LOG_TITLE,"MuaBoTaiHangRong"} },
	},
}
--Dai su Hoat dong
tbConfig[14] =
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "click DaiSuHoatDong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i s� ho�t ��ng"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"Ch�c m�ng Sinh Nh�t V� L�m Truy�n K�. H�y ��n ch� ta tham gia ho�t ��ng l�m b�nh Sinh Nh�t v� nh�n nhi�u ph�n th��ng h�p d�n."} },			
		{"AddDialogOpt",	{"Gh�p Nguy�n Li�u ",15} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng ��t m�c",26} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng Sinh nh�t VLTK",21} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "Ghep phan thuong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Xin ch�n lo�i ph�n th��ng?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"��i B�t M� l�y  ���ng",16} },
		{"AddDialogOpt",	{"L�m B�nh kem th��ng",17} },
		{"AddDialogOpt",	{"L�m  B�nh kem Chocolate",18} },
		{"AddDialogOpt",	{"L�m  B�nh kem Tr�i C�y",19} },
		{"AddDialogOpt",	{"L�m  B�nh Sinh nh�t VLTK",20} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n ��i B�t M� th�nh ���ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�t M�",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },		
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_4,1,EVENT_LOG_TITLE,"DoiBotMi"} },
	},
}
tbConfig[17] = 
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n l�m B�nh Kem Th��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Kem Th��ng",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,2} }, -- 2 Bot mi
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} }, -- 1 Duong
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Sua
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,2} }, -- 2 Bo	
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_1,1,EVENT_LOG_TITLE,"GhepBanhKemThuong"} },
	},
}

tbConfig[18] = 
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n l�m B�nh Kem Chocolate",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Kem Chocolate",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,2} }, -- 2 Bot mi
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} }, -- 1 Duong
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Sua
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,2} }, -- 2 Bo
		{"AddOneMaterial",	{ITEM_MATERIAL_5.szName,ITEM_MATERIAL_5,1} }, -- 1 Chocolate
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_2,1,EVENT_LOG_TITLE,"GhepBanhKemChocolate"} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n l�m B�nh Kem Tr�i C�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Kem Tr�i C�y",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,2} }, -- 2 Bot mi
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} }, -- 1 Duong
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Sua
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,2} }, -- 2 Bo
		{"AddOneMaterial",	{ITEM_MATERIAL_6.szName,ITEM_MATERIAL_6,1} }, -- 1 Trai Cay	
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_3,1,EVENT_LOG_TITLE,"GhepBanhKemTraiCay"} },
	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n l�m B�nh Sinh Nh�t V� L�m Truy�n K�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Sinh Nh�t V� L�m Truy�n K�",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,2} }, -- 2 Bot mi
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} }, -- 1 Duong
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Sua
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,2} }, -- 2 Bo
		{"AddOneMaterial",	{ITEM_MATERIAL_5.szName,ITEM_MATERIAL_5,2} }, -- 2 Chocolate
		{"AddOneMaterial",	{ITEM_MATERIAL_6.szName,ITEM_MATERIAL_6,2} }, -- 2 Trai Cay
		 
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_4,1,EVENT_LOG_TITLE,"GhepBanhSinhNhatVLTK"} },
	},
}
tbConfig[21] =
{
	nId = 21,
	szMessageType = "nil",
	szName = "Nh�n th��ng Sinh Nh�t V� L�m Truy�n K�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"ThisActivity:CheckAwardExp", {"Nh�n th��ng trong th�i gian t� 0h00 ng�y 11/06/2013 ��n 24h00 ng�y 11/06/2013, M�i b�ng h�u ch� nh�n ���c 1 l�n duy nh�t. "},},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_GET_EXP,0,"Ng��i �� nh�n ph�n th��ng ho�t ��ng r�i, kh�ng th� nh�n th�m n�a!","=="} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_GET_EXP, 1}},
		{"PlayerFunLib:AddExp",	{500e6,0,EVENT_LOG_TITLE,"Nhan500trExpTaiNpcDaiSuHoatDong"} },
	},
}
--S� d�ng Item
tbConfig[22] = 
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "S� d�ng B�nh Kem Th��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_OFTEN_CAKE, 1000, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_OFTEN_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"SuDungBanhKemThuong"} },
	},
}
tbConfig[23] = 
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "S� d�ng B�nh Chocolate",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_CHOCOLATE, 800, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_CHOCOLATE, 1}},		
		{"PlayerFunLib:AddExp",	{12e6,0,EVENT_LOG_TITLE,"SuDungBanhChocolate"} },		
	},
}
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "S� d�ng B�nh Tr�i C�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_FRUIT, 10000, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"ThisActivity:UseFruitCake",	{nil} },	
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "S� d�ng B�nh Sinh Nh�t ��c bi�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_4},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE, 500, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{30e6,0,EVENT_LOG_TITLE,"SuDungBanhSinhNhatDacBietNhanExp"} },
		{"PlayerFunLib:GetItem",	{tbAward_BirthDayCake_Item,1,EVENT_LOG_TITLE,"SuDungBanhSinhNhatDacBietNhanItem"} },			
	},
}
--Nh�n th��ng ��t m�c
tbConfig[26] =
{
	nId = 26,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi s� d�ng v�t ph�m B�nh kem Tr�i C�y ��t m�c 500, 1000, ho�c B�nh kem ��c bi�t 250, 500 c� th� ��n g�p ta �� nh�n th��ng. Hi�n t�i ��i hi�p �� s� d�ng <color=yellow><lua GetBitTask(3000, 1, 16) /><color> B�nh kem Tr�i C�y, <color=yellow><lua GetBitTask(2999, 17, 14) /><color> B�nh kem ��c bi�t"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th��ng ��t m�c 500   B�nh Tr�i C�y",27} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 1000 B�nh Tr�i C�y",28} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 250 B�nh ��c bi�t",29} },
		{"AddDialogOpt",	{"Th��ng ��t m�c 500 B�nh ��c bi�t",30} },
	},
}
tbConfig[27] = 
{
	nId = 27,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 500   B�nh Tr�i C�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_FRUIT_COUNT,500,"Y�u c�u s� d�ng B�nh kem Tr�i C�y ��t <color=red>500<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_1,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{12,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_1,1} },
		{"PlayerFunLib:GetItem",	{tbAward_1["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhTraiCayDat500Lan"} },
	},
}
tbConfig[28] = 
{
	nId = 28,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 1000   B�nh Tr�i C�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_FRUIT_COUNT,1000,"Y�u c�u s� d�ng B�nh kem Tr�i C�y ��t <color=red>1000<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_2,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_2,1} },
		{"PlayerFunLib:GetItem",	{tbAward_1["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhTraiCayDat1000Lan"} },
	},
}
tbConfig[29] = 
{
	nId = 29,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 250   B�nh ��c bi�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE,250,"Y�u c�u s� d�ng B�nh kem  ��c bi�t <color=red>250<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_3,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_3,1} },
		{"PlayerFunLib:GetItem",	{tbAward_2["250"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDacBiett250Lan"} },
	},
}
tbConfig[30] = 
{
	nId = 30,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 500   B�nh ��c bi�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE,500,"Y�u c�u s� d�ng B�nh kem  ��c bi�t <color=red>500<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_4,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_4,1} },
		{"PlayerFunLib:GetItem",	{tbAward_2["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDacBiett500Lan"} },
	},
}