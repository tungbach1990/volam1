Include("\\script\\activitysys\\config\\1016\\variables.lua")
Include("\\script\\activitysys\\config\\1016\\awardlist.lua")
Include("\\script\\activitysys\\config\\1016\\extend.lua")
tbConfig = {}
tbConfig[1] = --��nh qu�i r�t Item
{
	nId = 1,
	szMessageType = "NpcOnDeath",	
	szName = "B�n �� ��nh qu�i nh�n Lam Th�ch",
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
		{"NpcFunLib:DropSingleItem",	{ITEM_MATERIAL_2,1,"8"} },		
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,30,EVENT_LOG_TITLE,"TongKim1000"} },
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,1,EVENT_LOG_TITLE,"VuotquamoiAi"} },
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,5,EVENT_LOG_TITLE,"VuotAi17"} },
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,5,EVENT_LOG_TITLE,"VuotAi28"} },
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,5,EVENT_LOG_TITLE,"HoanThanhPLD"} },
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,5,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,2,EVENT_LOG_TITLE,"QuaAiViemDe"} },
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"QuaAi10ViemDe"} },
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"HoanThanhBossST90"} },
	},
}

--Chuong Dang Cung Nu
tbConfig[12] = 
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch��ng ��ng Cung N�"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"Th�ng 7 nhi�u ho�t ��ng s�i n�i, h�y nhanh ch�n ��n ch�  tham gia ho�t ��ng gh�p Tinh Th�ch �� nh�n nhi�u ph�n th��ng h�p d�n."} },			
		{"AddDialogOpt",	{format("Mua %s",ITEM_MATERIAL_1.szName),13} },
		{"AddDialogOpt",	{"Gh�p Nguy�n Li�u ",14} },
		{"AddDialogOpt",	{"Nh�n th��ng m�c s� d�ng Huy�n B�ng Tinh",24} },
	},
}
tbConfig[13] = 
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Mua Huy�n Tinh Th�ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_MATERIAL_1.szName,1,1,1,0.04,0,250},	
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{MONEY.szName,MONEY,20000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,1,EVENT_LOG_TITLE,"MuaHuyenTinhThach"} },
	},
}

tbConfig[14] =
{
	nId = 14,
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
		{"AddDialogOpt",	{"Gh�p Ti�u Lam B�ng Tinh",15} },
		{"AddDialogOpt",	{"Gh�p ��i Lam B�ng Tinh",16} },
		{"AddDialogOpt",	{"Gh�p Ti�u Ho�ng B�ng Tinh",17} },
		{"AddDialogOpt",	{"Gh�p ��i Ho�ng B�ng Tinh",18} },
		{"AddDialogOpt",	{"Gh�p Ti�u Huy�n B�ng Tinh",19} },
		{"AddDialogOpt",	{"Gh�p ��i Huy�n B�ng Tinh",20} },
	},
}
tbConfig[15] = 
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n Gh�p Ti�u Lam B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ti�u Lam B�ng Tinh",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },		
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_1,1,EVENT_LOG_TITLE,"GhepTieuLamBangTinh"} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n Gh�p ��i Lam B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i Lam B�ng Tinh",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
			{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} },
			{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_2,1,EVENT_LOG_TITLE,"GhepDaiLamBangTinh"} },
	},
}

tbConfig[17] = 
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n Gh�p Ti�u Ho�ng B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ti�u Ho�ng B�ng Tinh",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
			{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} },
			{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_3,1,EVENT_LOG_TITLE,"GhepTieuHoangBangTinh"} },
	},
}
tbConfig[18] = 
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n Gh�p ��i Ho�ng B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i Ho�ng B�ng Tinh",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
			{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} },
			{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_4,1,EVENT_LOG_TITLE,"GhepDaiHoangBangTinh"} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n Gh�p Ti�u Huy�n B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ti�u Huy�n B�ng Tinh",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
			{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} },
			{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_5,1,EVENT_LOG_TITLE,"GhepTieuHuyenBangTinh"} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n Gh�p ��i Huy�n B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {" ��i Huy�n B�ng Tinh",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
			{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} },
			{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_6,1,EVENT_LOG_TITLE,"GhepDaiHuyenBangTinh"} },
	},
}
--S� d�ng Item
tbConfig[21] = 
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "S� d�ng Ti�u Lam B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_1, 1000, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_1, 1}},
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"SuDungTieuLamBangTinh"} },
	},
}
tbConfig[22] = 
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "S� d�ng Ti�u Ho�ng B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_2, 2000, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_2, 1}},
		{"PlayerFunLib:AddExp",	{2e6,0,EVENT_LOG_TITLE,"SuDungTieuHoangBangTinh"} },
	},
}
tbConfig[23] = 
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "S� d�ng Ti�u Huy�n B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_5},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_3, 15000, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_3_COUNT, 1}},	
		{"ThisActivity:UseTieuHuyenBT",	{nil} },	
	},
}
--Nhan thuong moc su dung
tbConfig[24] =
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "Ghep phan thuong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>S� d�ng Ti�u Huy�n B�ng Tinh v� ��i Ho�ng B�ng Tinh ��t t�ng s� 500, 1000, 2000 ��n ��y ta s� t�ng th�m ph�n th��ng cho c�c h�, Hi�n t�i c�c h� �� s� d�ng ���c: <color=yellow><lua GetBitTask(3013, 17, 12) /><color> c�i"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Nh�n th��ng m�c 500",25} },
		{"AddDialogOpt",	{"Nh�n th��ng m�c 1000",26} },
		{"AddDialogOpt",	{"Nh�n th��ng m�c 2000",27} },
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 500  Huy�n B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_3_COUNT,500,"Y�u c�u s� d�ng t�ng Ti�u Huy�n B�ng Tinh v� ��i Huy�n B�ng Tinh <color=red>500<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_1,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_1,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Limit_Old["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDung500Lan"} },
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 1000  Huy�n B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_3_COUNT,1000,"Y�u c�u s� d�ng t�ng Ti�u Huy�n B�ng Tinh v� ��i Huy�n B�ng Tinh <color=red>1000<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_2,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_2,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Limit_Old["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDung1000Lan"} },
	},
}
tbConfig[27] = 
{
	nId = 27,
	szMessageType = "nil",
	szName = "Th��ng ��t m�c 2000  Huy�n B�ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_3_COUNT,2000,"Y�u c�u s� d�ng t�ng Ti�u Huy�n B�ng Tinh v� ��i Huy�n B�ng Tinh <color=red>2000<color> l�n tr� l�n m�i nh�n ���c ph�n th��ng n�y.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_3,0,"Ng��i �� nh�n ph�n th��ng n�y r�i","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_3,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Limit_Old["2000"],1,EVENT_LOG_TITLE,"NhanThuongSuDung2000Lan"} },
	},
}