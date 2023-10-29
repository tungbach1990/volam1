Include("\\vng_script\\activitysys\\config\\1022\\head.lua")
Include("\\vng_script\\activitysys\\config\\1022\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1022\\awardlist.lua")
Include("\\vng_script\\activitysys\\config\\1022\\extend.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click TQSK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�ch Hi�u Sinh"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },		
	},
	tbActition = 
	{			
		{"SetDialogTitle",	{"<npc>T� 16/01/2016 ��n 31/01/2016 h�y ��n g�p <npc> � D��ng Ch�u �� tham gia: <color=yellow>s� ki�n �ua top Tinh Th�ch<color>"} },	
		{"AddDialogOpt",	{"N�p Tinh Th�ch",2} },		
		{"AddDialogOpt",	{"Xem B�ng X�p H�ng",3} },
		{"AddDialogOpt",	{"Nh�n Ph�n Th��ng X�p H�ng",4} },			
	},
}

tbConfig[2] = --n�p Hoa H�ng
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "N�p Tinh Th�ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>N�p v�t ph�m",1,1,1,0},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },
		{"AddOneMaterial",	{ITEM_TINH_THACH.szName, ITEM_TINH_THACH, 1} },				
		{"ThisActivity:GiveItemCheckTime",	{nil} },
	},
	tbActition = 
	{			
		{"ThisActivity:GiveItem",	{nil} },		
	},
}

tbConfig[3] =
{
	nId = 3,
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
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "��i tho�i s� ki�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Xin ch�n ph�n th��ng:",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },
		{"ThisActivity:TopListAwardCheckTime",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ph�n th��ng x�p h�ng 1",5} },
		{"AddDialogOpt",	{"Ph�n th��ng x�p h�ng 2",6} },	
		{"AddDialogOpt",	{"Ph�n th��ng x�p h�ng 3",7} },		
		{"AddDialogOpt",	{"Ph�n th��ng x�p h�ng 4",8} },		
		{"AddDialogOpt",	{"Ph�n th��ng x�p h�ng 5",9} },		
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng h�ng 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,10,1,"default"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{1} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng h�ng 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{2} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng h�ng 3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{3} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng h�ng 4",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{50,"C�n Ph�i c� 50 � tr�ng h�nh trang"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{4} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng h�ng 5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckFreeBagCell",	{50,"C�n Ph�i c� 50 � tr�ng h�nh trang"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{5} },
	},
}
