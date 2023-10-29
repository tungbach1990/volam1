Include("\\script\\activitysys\\config\\11\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "T�i Nguy�n Li�u ��nh qu�i r�i ra",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321, 322, 227, 340"} },
	},
	tbActition = 
	{
		{"ThisActivity:DropMaterialBagInRandom",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "S� d�ng T�i Nguy�n Li�u",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {tbITEM_MATERIAL_BAG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng �� ch� tr�ng"} },
		{"lib:CheckDay",	{20120402, 20120501, szOUT_OF_DATE} },
	},
	tbActition = 
	{
		{"ThisActivity:UseMaterialBag",	{nil} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "S� d�ng Chi�c �o L�nh M�i",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {tbITEM_NEW_UNIFORM},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
		{"ThisActivity:CheckTowTask",	{nIdx_USED_NEW_UNIFORM_COUNT, nIdx_MAX_NEW_UNIFORM_CAN_USE,"Ng��i s� d�ng v�t ph�m n�y �� ��t ��n s� l��ng gi�i h�n","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng �� ch� tr�ng"} },
		{"lib:CheckDay",	{20120402, 20120501, szOUT_OF_DATE} },
	},
	tbActition = 
	{
		{"ThisActivity:UseNewUniform",	{nil} },
		{"ThisActivity:NewUniformExtraAward",	{nil} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "ItemScript",
	szName = "S� d�ng �o L�nh �� S�a",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {tbITEM_PATCHED_UNIFORM},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
		{"ThisActivity:CheckTask",	{nIdx_USED_PATCHED_UNIFORM_COUNT,nMAX_PATCHED_UNIFORM_CAN_USE,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng �� ch� tr�ng"} },
		{"lib:CheckDay",	{20120402, 20120501, szOUT_OF_DATE} },
	},
	tbActition = 
	{
		{"ThisActivity:UsePatchedUniform",	{nil} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "Ph�n th��ng T�ng Kim >=3000",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_GREEN_CLOTH,30,EVENT_LOG_TITLE,"TongKim3000"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "Ph�n th��ng T�ng Kim [1000,3000)",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_GREEN_CLOTH,10,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 17",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_GREEN_CLOTH,5,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 28",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_GREEN_CLOTH,10,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "Th�y T�c ��u L�nh Phong L�ng ��",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_GREEN_CLOTH,5,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Th�y T�c ��i ��u L�nh Phong L�ng ��",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_GREEN_CLOTH,10,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "YDBZguoguan",
	szName = "Ph�n th��ng Vi�m ��",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_GREEN_CLOTH,15,EVENT_LOG_TITLE,"VuotAiViemDe6"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "Ph�n th��ng boss Ho�ng Kim",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_GREEN_CLOTH,30,EVENT_LOG_TITLE,"TieuDietBossTheGioi"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "NpcOnDeath",
	szName = "Ph�n th��ng boss S�t Th�",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_GREEN_CLOTH,2,EVENT_LOG_TITLE,"TieuDietBossSatThu"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "S� d�ng H�a Th� B�ch",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {tbITEM_JADE},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
		{"ThisActivity:CheckTask",	{nIdx_USED_JADE_COUNT,nMAX_JADE_COUNT,"V�t ph�m n�y �� s� d�ng ��t ��n s� l��ng gi�i h�n, kh�ng th� ti�p t�c s� d�ng","<"} },
		{"lib:CheckDay",	{20120402, 20120501, szOUT_OF_DATE} },
	},
	tbActition = 
	{
		{"ThisActivity:UseJade",	{nil} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "ClickNpc",
	szName = "��i tho�i v�i Th� May",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Th� May"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��i M�nh V�i M�u Xanh L�",16} },
		{"AddDialogOpt",	{"H�p th�nh �o L�nh M�i",21} },
		{"AddDialogOpt",	{"H�p th�nh �o L�nh �� S�a",22} },
		{"AddDialogOpt",	{"H�p th�nh �o L�nh M�i (�i�m kinh nghi�m)",35} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "nil",
	szName = "��i M�nh V�i M�u Xanh L�",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
	},
	tbActition = 
	{
		{"ThisActivity:SelectGoldDlg",	{nil} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh �o L�nh M�i",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"�o L�nh M�i",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
		{"AddOneMaterial",	{"M�nh V�i",tbITEM_CLOTH,5} },
		{"AddOneMaterial",	{"Khuy �o",tbITEM_BUTTONHOLE,5} },
		{"AddOneMaterial",	{"�o L�nh B� R�ch",tbITEM_TATTERED_UNIFORM,5} },
		{"AddOneMaterial",	{"M�nh V�i M�u Xanh L�",tbITEM_GREEN_CLOTH,1} },
		{"AddOneMaterial",	{"Cu�n Ch�",tbITEM_SEWING_THREAD,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_NEW_UNIFORM,1,EVENT_LOG_TITLE,"GhepChiecAoLinhMoi"} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh �o L�nh �� S�a",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"�o L�nh �� S�a",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
		{"AddOneMaterial",	{"M�nh V�i",tbITEM_CLOTH,5} },
		{"AddOneMaterial",	{"Khuy �o",tbITEM_BUTTONHOLE,5} },
		{"AddOneMaterial",	{"�o L�nh B� R�ch",tbITEM_TATTERED_UNIFORM,5} },
		{"AddOneMaterial",	{"M�nh V�i M�u Xanh L�",tbITEM_GREEN_CLOTH,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_PATCHED_UNIFORM,1,EVENT_LOG_TITLE,"GhepAoLinhDaSua"} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ServerStart",
	szName = "Kh�i ��ng sever",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitFormula",	{nil} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "OnLogin",
	szName = "Ng��i ch�i ��ng nh�p",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"ThisActivity:CheckTask",	{nIdx_MAX_NEW_UNIFORM_CAN_USE,1500,"","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:SetTask",	{nIdx_MAX_NEW_UNIFORM_CAN_USE,1500} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "nil",
	szName = "Ki�m tra ��ng c�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ExecActivityDetail",	{17} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "nil",
	szName = "Ki�m tra ��ng c�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ExecActivityDetail",	{18} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
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
tbConfig[33] = --һ��ϸ��
{
	nId = 33,
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
tbConfig[34] =
{
	nId = 34,
	szMessageType = "ItemScript",
	szName = "S� d�ng Chi�c �o L�nh M�i (exp)",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {tbITEM_NEW_UNIFORM_EXP},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
		{"ThisActivity:CheckTowTask",	{nIdx_USED_NEW_UNIFORM_COUNT, nIdx_MAX_NEW_UNIFORM_CAN_USE,"Ng��i s� d�ng v�t ph�m n�y �� ��t ��n s� l��ng gi�i h�n","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng �� ch� tr�ng"} },
		{"lib:CheckDay",	{20120402, 20120501, szOUT_OF_DATE} },
	},
	tbActition = 
	{
		{"ThisActivity:UseNewUniformExp",	{nil} },	
		{"ThisActivity:NewUniformExpExtraAward",	{nil} },	
	},
}
tbConfig[35] = 
{
	nId = 35,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh �o L�nh M�i (�i�m kinh nghi�m)",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Chi�c �o L�nh M�i (�i�m kinh nghi�m)",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
		{"AddOneMaterial",	{"M�nh V�i",tbITEM_CLOTH,5} },
		{"AddOneMaterial",	{"Khuy �o",tbITEM_BUTTONHOLE,5} },
		{"AddOneMaterial",	{"�o L�nh B� R�ch",tbITEM_TATTERED_UNIFORM,5} },
		{"AddOneMaterial",	{"M�nh V�i M�u Xanh L�",tbITEM_GREEN_CLOTH,1} },
		{"AddOneMaterial",	{"Cu�n Ch�",tbITEM_SEWING_THREAD,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbITEM_NEW_UNIFORM_EXP,1,EVENT_LOG_TITLE,"GhepChiecAoLinhMoi(Exp)"} },
	},
}