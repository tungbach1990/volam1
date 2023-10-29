Include("\\script\\activitysys\\config\\33\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "��������������npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "�ν�÷ִ���1000С��3000",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TongKim1000NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim1000", "10 D�y Th�ng", 1}},
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "�ν�÷ִ���3000",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_QuocKhanhVN","TongKim3000NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim3000", "30 D�y Th�ng", 1}},
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "���ع���17��",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","VuotAi17NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi17", "10 D�y Th�ng", 1}},
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "���ع���28��",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},15,"Event_QuocKhanhVN","VuotAi28NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi28", "15 D�y Th�ng", 1}},
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "�����ɱ��ˮ��ͷ��",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDauLinh", "10 D�y Th�ng", 1}},
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "�����ɱ��ˮ����ͷ��",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","TieuDietThuyTacDaiDauLinhNhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDaiDauLinh", "20 D�y Th�ng", 1}},
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "�׵۴�����ʮ��",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","VuotAiViemDe10NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAiViemDe10", "20 D�y Th�ng", 1}},
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "Nhi�m v� S�t th� ",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},2,"Event_QuocKhanhVN","TieuDietBossSatThu"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietBossSatThu", "2 D�y Th�ng", 1}},
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "ɱ���ƽ�BOSS",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_QuocKhanhVN","TieuDietBossTheGioi"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietBossTheGioi", "30 D�y Th�ng", 1}},
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "�ڶ��׶��ν����1000С��3000",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TongKim1000NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_QuocKhanhVN","TongKim1000NhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim1000", "10 D�y Th�ng v� 4 N�n Tr�ng", 1}},
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "�ڶ��׶��ν�÷ִ���3000",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_QuocKhanhVN","TongKim3000NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},8,"Event_QuocKhanhVN","TongKim3000NhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim3000", "30 D�y Th�ng v� 8 N�n Tr�ng", 1}},
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "�ڶ��׶δ��ع���17��",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","VuotAi17NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},2,"Event_QuocKhanhVN","VuotAi17NhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi17", "10 D�y Th�ng v� 2 N�n Tr�ng", 1}},
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "Chuanguan",
	szName = "�ڶ��׶δ��ع���28��",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},15,"Event_QuocKhanhVN","VuotAi28NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_QuocKhanhVN","VuotAi28NhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi28", "15 D�y Th�ng v� 4 N�n Tr�ng", 1}},
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "�ڶ��׶η����ɱ��ˮ��ͷ��",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},2,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDauLinh", "10 D�y Th�ng v� 2 N�n Tr�ng", 1}},
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "NpcOnDeath",
	szName = "�ڶ��׶η����ɱ��ˮ����ͷ��",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","TieuDietThuyTacDaiDauLinhNhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_QuocKhanhVN","TieuDietThuyTacDaiDauLinhNhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDaiDauLinh", "20 D�y Th�ng v� 4 N�n Tr�ng", 1}},
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "YDBZguoguan",
	szName = "�ڶ��׶��׵۴�����ʮ��",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","VuotAiViemDe10NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},5,"Event_QuocKhanhVN","VuotAiViemDe10NhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAiViemDe10", "20 D�y Th�ng v� 5 N�n Tr�ng", 1}},
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "ClickNpc",
	szName = "����̨�Ի�",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"T��ng ��i"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"N�p D�y Th�ng",19} },
		{"AddDialogOpt",	{"��i Ph�o Hoa Qu�c Kh�nh",20} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "N�p D�y Th�ng",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"N�p D�y Th�ng",1,0,0,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"D�y Th�ng",{tbProp={6,1,2976,1,0,0},},1} },
		{"ThisActivity:CheckTask",	{TKSG_HandinStringCount,"1000-<ComposeCount>","M�i nh�n v�t ch� n�p t�i �a 1000 v�t ph�m [D�y Th�ng] trong su�t th�i gian di�n ra ho�t ��ng","<="} },
	},
	tbActition = 
	{
		{"ThisActivity:HandinString",	{nil} },
		{"ThisActivity:AddTask",	{TKSG_HandinStringCount,1} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "��i Ph�o Hoa Qu�c Kh�nh",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"Ph�o Hoa Qu�c Kh�nh",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"D�y Th�ng",{tbProp={6,1,2976,1,0,0},},1} },
		{"AddOneMaterial",	{"D�i L�a M�u ��",{tbProp={6,1,2977,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKG_ConvertFireworksCount,1} },
		{"ThisActivity:ConvertFireworks",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2979,1,0,0},nExpiredTime=20111001,},1,"Event_QuocKhanhVN","GhepPhaoHoaQuocKhanh"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "GhepPhaoHoaQuocKhanh", "Ph�o Hoa Qu�c Kh�nh", 1}},
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ClickNpc",
	szName = "��i tho�i v�i H�ng Nga",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"H�ng Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��i B�nh Trung Thu H�n Nguy�t",22} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "��i B�nh Trung Thu H�n Nguy�t",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"B�nh Trung Thu H�n Nguy�t",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"N�n Tr�ng",{tbProp={6,1,2981,1,0,0},},1} },
		{"AddOneMaterial",	{"L�ng ��n �nh Tr�ng",{tbProp={6,1,2978,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_ConvertMooncakeCount,1} },
		{"ThisActivity:ConvertMooncake",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2980,1,0,0},nExpiredTime=20111001,},1,"Event_QuocKhanhVN","DoiBanhTrungThu"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "DoiBanhTrungThu", "B�nh Trung Thu H�n Nguy�t", 1}},
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "S� d�ng Ph�o Hoa Qu�c Kh�nh",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {{tbProp={6,1,2979,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"ThisActivity:CheckTask",	{TKSG_UseFireworksCount,1500,"M�i nh�n v�t ch� s� d�ng t�i �a 1500 v�t ph�m [Ph�o Hoa Qu�c Kh�nh] trong su�t th�i gian di�n ra ho�t ��ng","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"H�nh trang �t nh�t ph�i c�n 3 ch� tr�ng"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_UseFireworksCount,1} },
		{"ThisActivity:UseFirworks",	{nil} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "S� d�ng B�nh Trung Thu H�n Nguy�t",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {{tbProp={6,1,2980,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"ThisActivity:CheckTaskDaily",	{TKSG_UseMooncakeCount,15,"M�i ng�y m�i nh�n v�t ch� ���c s� d�ng t�i �a 15 v�t ph�m [B�nh Trung Thu H�n Nguy�t]","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"H�nh trang �t nh�t ph�i c�n 3 ch� tr�ng"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TKSG_UseMooncakeCount,1} },
		{"ThisActivity:UseMooncake",	{nil} },
	},
}
