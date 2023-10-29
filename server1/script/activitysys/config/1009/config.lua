Include("\\script\\activitysys\\config\\1009\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "B�n �� ��nh qu�i nh�n m�nh chi�n c�ng l�nh",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		--{"NpcFunLib:DropSingleItem",	{ITEM_COMMAND_PIECE_2,1,"20"} },
		{"ThisActivity:DropItemRandom",	{nil} },
	},
}

tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {"H�ng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua m�nh Chi�n C�ng L�nh",3} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {"M�nh chi�n c�ng l�nh 1",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Ng�n l��ng",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_COMMAND_PIECE_1,1,EVENT_LOG_TITLE,"MuaManhChienCongLenh1"} },
	},
}
tbConfig[4] = --��i tho�i Ch��ng ��ng Cung N�
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "B�m v�o Ch��ng ��ng Cung N�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch��ng ��ng Cung N�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n ��i Chi�c M� H�a B�nh",5} },		
		{"AddDialogOpt",	{"Ta mu�n ��i Chi�c M� Tai B�o",6} },		
		{"AddDialogOpt",	{"Ta mu�n ��i Chi�c M� T� Do",7} },		
	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "��i Chi�c M� H�a B�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Chi�c M� H�a B�nh",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"M�nh chi�n c�ng 1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"M�nh chi�n c�ng 2",ITEM_COMMAND_PIECE_2,5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_HAT_PEACE,1,EVENT_LOG_TITLE,"DoiChiecMuHoaBinh"} },
	},
}
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "��i Chi�c M� Tai B�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Chi�c M� Tai B�o",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"M�nh chi�n c�ng 1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"M�nh chi�n c�ng 2",ITEM_COMMAND_PIECE_2,5} },
		{"AddOneMaterial",	{"T�i m�ng chi�n th�ng",ITEM_BAG_VICTORY,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EAR_HAT_DIRT,1,EVENT_LOG_TITLE,"DoiChiecMuTaiBeo"} },
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "��i Chi�c M� T� Do",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Chi�c M� T� Do",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"M�nh chi�n c�ng 1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"M�nh chi�n c�ng 2",ITEM_COMMAND_PIECE_2,5} },
		{"AddOneMaterial",	{"T�i m�ng chi�n th�ng",ITEM_BAG_VICTORY,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_HAT_FREEDOM,1,EVENT_LOG_TITLE,"DoiChiecMuTuDo"} },
	},
}
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "S� d�ng Chi�c M� Tai B�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30197,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_USING, 2000, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 2000 l�n.", "<"}},	
		--{"ThisActivity:UseLimitHat", {1}},
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"SuDungMuTaiBeo"} },
		{"ThisActivity:UseHatDirt",	{nil} },
	},
}
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "S� d�ng Chi�c M� T� Do",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30199,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_USING, 2000, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 2000 l�n.", "<"}},	
		--{"ThisActivity:UseLimitHat", {1}},
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{12e6,0,EVENT_LOG_TITLE,"SuDungMuTuDo"} },
		{"ThisActivity:UseHatFreedom",	{nil} },
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "S� d�ng Chi�c M� H�a B�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30198,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_PEACE_USING, 1000, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 1000 l�n.", "<"}},	
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"SuDungMuHoaBinh"} },
		--{"ThisActivity:UseHatPeace",	{nil} },
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_HAT_PEACE_USING, 1}},
	},
}
