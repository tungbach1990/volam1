Include("\\script\\activitysys\\config\\1017\\variables.lua")
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
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_MATERIAL_1,1,"8"} },		
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "T�ng Qu�n S� Ki�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T�ng Qu�n S� Ki�n"},
	tbCondition ={},
	tbActition = 
	{
		{"AddDialogOpt",	{"M� � nh�n nh�n nguy�n li�u",9} },
	},
}
tbConfig[3] = --Hang rong
{
	nId = 3,
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
		{"AddDialogOpt",	{format("Mua %s",ITEM_AWARD_3.szName),4} },
	},
}
tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "buy material2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_3.szName,1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{MONEY.szName,MONEY,10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_3,1,EVENT_LOG_TITLE,"MuaRuongBacTaiHangRong"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "ItemScript",
	szName = "D�ng R��ng Ng� S�c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },
		{"PlayerFunLib:CheckFreeBagCell",	{30,"default"} },
		{"ThisActivity:CheckUseItem",	{"chiakhoangusac",TSK_USE_AWARD3} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD3,LIMIT_USE_BOX_SHINING,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_4,1,EVENT_LOG_TITLE,"SuDungRuongNguSacNhanHoMachDon"} },
		{"ThisActivity:UseItem",	{"chiakhoangusac",TSK_USE_AWARD3,EXP_AWARD_2} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "ItemScript",
	szName = "D�ng R��ng ��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },
		{"ThisActivity:CheckUseItem",	{"chiakhoadong",TSK_USE_AWARD1} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD1,TSK_LIMIT_USE_BRONZE_CHEST,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseItem",	{"chiakhoadong",TSK_USE_AWARD1,EXP_AWARD_1} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "ItemScript",
	szName = "D�ng R��ng B�c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },
		{"ThisActivity:CheckUseItem",	{"chiakhoabac",TSK_USE_AWARD2} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD2,TSK_LIMIT_USE_SILVER_CHEST,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{tbExpRate,1,EVENT_LOG_TITLE,"SuDungRuongBacNhanDiemExp"} },
		{"ThisActivity:UseItem",	{"chiakhoabac",TSK_USE_AWARD2,tbExpRate} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "OnLogin",
	szName = "on login",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "nil",
	szName = "M� �",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:OpenUI",	{nil} },
	},
}