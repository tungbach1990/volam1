Include("\\vng_script\\activitysys\\config\\1024\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1024\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1024\\extend_1.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\vng_script\\features\\huynhdelenhbai\\mainfuc.lua")
Include("\\script\\lib\\log.lua")
tbConfig = {}

tbConfig[1] = --��nh quai
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t qu�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"ThisActivity:CheckInMapThapNien",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:DropItemNpcInMap",	{nil} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "V� Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V� Danh"},
	tbCondition =
	{
		{"ThisActivity:CheckLevel_ShowDlg", {1} },
	},
	tbActition =
	{
		{"AddDialogOpt",	{"Nh�n Huynh �� T��ng Ph�ng l�nh b�i",3} },
		{"AddDialogOpt",	{"Nh�n nhi�m v� H��ng D�n T�n Th�",4} },
		{"AddDialogOpt",	{"Tr� nhi�m v�",5} },	
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "nil",
	szName = "Nh�n Huynh �� T��ng Ph�ng l�nh b�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"ThisActivity:CheckActiveCondition",	{2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_HDTP_LB,1,EVENT_LOG_TITLE,"NhanHuynhDeTPLenhBai"} },	
		{"tbVNG_BitTask_Lib:addTask", {TSK_NHAN_LB_HDTP, 1}},	
		{"ThisActivity:ResetBitCodeHDLB",	{} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "nil",
	szName = "Nh�n nhi�m v�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:Check_ItemHDLB", {} },		
	},
	tbActition = 
	{
		{"tbHuynhdelenhbai:onDialogNpcGiveTask",	{} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "nil",
	szName = "Tr� nhi�m v�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckLevel_ShowDlg", {1} },	
	},
	tbActition = 
	{
		{"tbHuynhdelenhbai:onDialogNpcGiveAward",{}},
	},
}
tbConfig[6] = --T�ng kim 500 �i�m
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "when FinishSongJin",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1, "1,2", 500, -1},
	tbCondition = 
	{
		{"ThisActivity:CheckFeatHuynhDe", {ID_NV_TK,1}},		
	},
	tbActition = 
	{
		{"ThisActivity:GiveFeatHuynhDe", {ID_NV_TK,1}},
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "ClickNpc",
	szName = "V� Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V� Danh"},
	tbCondition =
	{
		{"ThisActivity:CheckLevel_ShowDlg", {2} },
	},
	tbActition =
	{
		{"AddDialogOpt",	{"Nh�n Huynh �� T��ng Ph�ng l�nh b�i",3} },
	},
}

--su dung item hoan thanh nhiem vu
tbConfig[8] =
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "S� d�ng T�ng Kim - Ho�n Th�nh L�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_HOANTHANH_TK_LB},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"ThisActivity:ResetTaskDaily_LenhBai",	{nil}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_DAILY_LIMIT_TK,4,"M�i ng��i ch�i ch� s� d�ng 4 l�n duy nh�t trong ng�y","<"} },
		{"ThisActivity:CheckFeatHuynhDe", {ID_NV_TK,0}},
	},
	tbActition = 
	{
		{"ThisActivity:GiveFeatHuynhDe", {ID_NV_TK,1}},
		{"tbVNG_BitTask_Lib:addTask", {TSK_DAILY_LIMIT_TK, 1}},
		{"Msg2Player", {"Ho�n th�nh 1 nhi�m v� T�ng Kim c�a Huynh �� L�nh B�i"}}, 
		{"tbLog:PlayerActionLog", {EVENT_LOG_TITLE,"Use_ITEM_HOANTHANH_TK_LB"}},
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "S� d�ng ��nh Qu�i Ho�n Th�nh L�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_HOANTHANH_KILL_NPC_LB},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"ThisActivity:ResetTaskDaily_LenhBai",	{nil}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_DAILY_LIMIT_KILL_NPC,4,"M�i ng��i ch�i ch� s� d�ng 4 l�n duy nh�t trong ng�y","<"} },
		{"ThisActivity:CheckFeatHuynhDe_KilNpc", {0}},
	},
	tbActition = 
	{
		{"ThisActivity:GiveFeatHuynhDe_KillNpc", {NUM_ADD_KILL}},
		{"tbVNG_BitTask_Lib:addTask", {TSK_DAILY_LIMIT_KILL_NPC, 1}},
		{"Msg2Player", {"S� d�ng ��nh qu�i ho�n th�nh l�nh th�nh c�ng, h�y ki�m tra nhi�m v�."}}, 		
	},
}
--su dung item nhan bi kip 90 mon phai
tbConfig[10] =
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "S� d�ng B� K�p Th�p ��i Ph�i 90",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BK90_THAP_DAI_PHAI},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph�i c� �t nh�t 5 � tr�ng m�i c� th� nh�n th��ng."} },
		{"ThisActivity:HDTP_Check_Facion",	{}},
		{"ThisActivity:HDTP_BK_90_Dialog",	{}},
	},
	tbActition = 
	{	
	},
}
tbConfig[11] = --T�ng kim 1000 �i�m
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "when FinishSongJin",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1, "1,2", 1000, -1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="B�o R��ng T�ng Kim", tbProp={6,1,30547,1,0,0},nExpiredTime=7*24*60},10,"LOG_FEATURE_CTC","HoanThanhTK 1000"} },	
	},
}
tbConfig[12] = --T�ng kim 2000 �i�m
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "when FinishSongJin",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1, "1,2", 2000, -1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="B�o R��ng T�ng Kim", tbProp={6,1,30547,1,0,0},nExpiredTime=7*24*60},10,"LOG_FEATURE_CTC","HoanThanhTK 2000"} },	
	},
}
tbConfig[13] = --T�ng kim 500 �i�m
{
	nId = 13,
	szMessageType = "FinishSongJin",
	szName = "when FinishSongJin",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1, "1,2", 3000, -1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="B�o R��ng T�ng Kim", tbProp={6,1,30547,1,0,0},nExpiredTime=7*24*60},10,"LOG_FEATURE_CTC","HoanThanhTK 3000"} },	
	},
}
