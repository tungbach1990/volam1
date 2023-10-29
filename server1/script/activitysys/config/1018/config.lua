Include("\\script\\activitysys\\config\\1018\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "songjin 1000",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,30,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "K�t th�c m�i �i",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {nil},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,1, EVENT_LOG_TITLE, "VuotQuaMoiAiCOT"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_boss",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"NpcFunLib:CheckBoatBoss",	{nil} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,10,EVENT_LOG_TITLE,"ThuyTacDauLinh"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_big_boss",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,20,EVENT_LOG_TITLE,"ThuyTacDaiDauLinh"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "YDBZguoguan",
	szName = "YanDi",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,5,EVENT_LOG_TITLE,"VuotQuaMoiAiVD"} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "ClickNpc",
	szName = "B�m v�o Ch��ng ��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch��ng ��ng Cung N�"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"N�p L�nh B�i Ti�n C�",7} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "��i tho�i n�p l�nh b�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ta ph� tr�ch s� ki�n ti�n c� c� bang h�i cho gi�i ��u Thi�n H� �� Nh�t Bang 13, ng��i t�m ta c� ph�i l� mu�n tham gia?",0},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta mu�n n�p L�nh B�i Ti�n C� cho bang",8} },
		{"AddDialogOpt",	{"Xem b�ng x�p h�ng 10 bang ��ng ��u",9} },			
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "giao n�p l�nh b�i",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {"<npc>N�p v�t ph�m",1,1,1,0},
	tbCondition = 
	{			
		{"AddOneMaterial",	{"L�nh B�i Ti�n C� THDNB 13",{tbProp={6,1,30407,1,0,0},},1} },		
		{"ThisActivity:GiveItemCheckTime",	{nil} },
		{"ThisActivity:CheckTong",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveItem",	{nil} },
	},
}
tbConfig[9] =
{
	nId = 9,
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