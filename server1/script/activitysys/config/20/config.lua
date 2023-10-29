Include("\\script\\activitysys\\config\\20\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "server start",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{"Thu V�n",1907,{{11,3182,4951}}} },
		{"ThisActivity:InitRule",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thu V�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"T� ng�y 3 th�ng 6 ��n ng�y 30 th�ng 6 n�m 2012, c�c hi�p kh�ch c� th� ��n ch� c�a ta tham gia ho�t ��ng thu nh�t l�a n��c, sau khi thu nh�t l�a n��c c� th� ��n g�p ta �� ��i ph�n th��ng, m�i ng�y m�i ng��i ch� ���c tham gia nhi�u nh�t 2 v�ng, th�i gian t� 16h ��n 17h v� 20h ��n 21h"} },
		{"AddDialogOpt",	{"Tham gia ho�t ��ng thu nh�t l�a n��c",3} },		
		{"AddDialogOpt",	{"Nh�n th��ng x�p h�ng",5} },
		{"AddDialogOpt",	{"N�p v�t ph�m L�a Xanh",4} },
		{"AddDialogOpt",	{"N�p v�t ph�m L�a V�ng",8} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "nil",
	szName = "sign up",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:SignUp",	{nil} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "compose",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>N�p v�t ph�m",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L�a Xanh",{tbProp={6,1,3199}},1} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{300000,0,"Event_Thang6","NopVatPhamLuaXanh"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "get rank award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:GetRankAward",	{nil} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�ng rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"mua L��i Li�m S�t",7} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "buy item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L��i Li�m S�t",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng�n l��ng",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3197,1,0,0},nExpiredTime = 20120701},1,"Event_Thang6","buy tool"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "compose",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>N�p v�t ph�m",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L�a V�ng",{tbProp={6,1,3200}},1} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{3000000,0,"Event_Thang6","NopVatPhamLuaVang"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "S� d�ng T�i h��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3201,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{VN_TSK_USE_BAG_DAILY,2,"H�m nay ng��i kh�ng th� s� d�ng v�t ph�m n�y n�a, ng�y mai h�y s� d�ng ti�p.","<"} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddTaskDaily",	{VN_TSK_USE_BAG_DAILY,1} },
		{"Msg2Player",	{"Nh�n ���c th�m 1 l�n tham gia ho�t ��ng Tr� T�i Nh� N�ng."} },
		{"ThisActivity:UseBagLog",	{nil} }		
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
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
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
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
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
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
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
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
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
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
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
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
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
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
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
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
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
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
