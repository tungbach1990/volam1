Include("\\vng_script\\activitysys\\config\\1033\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1033\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1033\\awardlist.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "when ServerStart",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:OnServerStart", {}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "T�ng Qu�n S� Ki�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T�ng Qu�n S� Ki�n"},
	tbCondition =
	{		
		
	},
	tbActition =
	{		
		{"AddDialogOpt",	{"��i Ho�ng Kim Th�ch",3} },		
		{"AddDialogOpt",	{"��i R��ng Ho�ng Kim M�n Ph�i",4} },	
		{"AddDialogOpt",	{"��i Nh�n Kim Quang",5} },		
		{"AddDialogOpt",	{"��i Kim Quang th�n b� b�o r��ng",6} },	
	},
}
--Doi Hoang Kim Thach
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "��i v�t ph�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_HOANGKIMTHACH.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },		
		{"AddOneMaterial",	{ITEM_HUYENKIMTHACH.szName,ITEM_HUYENKIMTHACH,4} },	
	},	
	tbActition =
	{
		{"PlayerFunLib:GetItem",	{ITEM_HOANGKIMTHACH,1,EVENT_LOG_TITLE,"Doi - ITEM_HOANGKIMTHACH"} },
	},
}
--doi Ruong HKMP
tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "��i tho�i s� ki�n event th�ng 12",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"\n Thu th�p Ho�ng Kim Th�ch �� ��i ng�u nhi�n nh�n ���c c�c b�o r��ng Ho�ng Kim M�n ph�i:\n:<color=yellow>R��ng 5 ph�i c�:<color> Thi�n V��ng, Ng� ��c, Th�y Y�n, C�n L�n, Thi�n Nh�n.\n:<color=yellow>R��ng 5 ph�i m�i:<color> Thi�u L�m, ���ng M�n, Nga My, V� �ang, C�i Bang."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"��i r��ng 5 ph�i c�",7} },
		{"AddDialogOpt",	{"��i r��ng 5 ph�i m�i",8} },	
				
	},
}
--Doi Nhan Kim Quan
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "��i v�t ph�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nh�n Kim Quang",szName,1,1,1,0},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },		
		{"AddOneMaterial",	{ITEM_KIMQUANG_THACH.szName,ITEM_KIMQUANG_THACH,600} },	 --600 Kim quang thach
	},	
	tbActition =
	{
		{"tbAwardTemplet:Give",{tbAward_Nhan_KimQuang,1,{EVENT_LOG_TITLE,"DoiNhanKimQuang"}} },
		{"Talk",{1,"","Ch�c m�ng c�c h� ��i th�nh c�ng Nh�n Kim Quang."}},
	},
}
--Doi Kim quang ruong
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "��i v�t ph�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_KIMQUANG_TB_RUONG.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },		
		{"AddOneMaterial",	{ITEM_KIMQUANG_THACH.szName,ITEM_KIMQUANG_THACH,100} },	 --100 Kim quang thach
	},	
	tbActition =
	{
		{"PlayerFunLib:GetItem",	{ITEM_KIMQUANG_TB_RUONG,1,EVENT_LOG_TITLE,"Doi_ITEM_KIMQUANG_TB_RUONG"} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "nil",
	szName = "��i v�t ph�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },			
	},
	
	tbActition =
	{
		{"ThisActivity:DoiRuongHKMP_UI",	{OLDBOX} }, 
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "nil",
	szName = "��i v�t ph�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },			
	},
	
	tbActition =
	{
		{"ThisActivity:DoiRuongHKMP_UI",	{NEWBOX} }, 
	},
}
--Use Item
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_KIMQUANG_TB_RUONG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },					
	},
	tbActition = 
	{			
		{"tbAwardTemplet:Give",{tbAward_Use_KimQuang_Ruong,1,{EVENT_LOG_TITLE,"Use_ITEM_KIMQUANG_TB_RUONG"}} },	
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_KIMQUANG_LENH},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"ThisActivity:CheckUseInMap",{}}		,
	},
	tbActition = 
	{			
		{"ThisActivity:Call_Gold_Boss",	{} },
	},
}