tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "S� kh�i ��u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		{"tbBetInfo:Init",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "��i tho�i th�n t�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th�n T�i"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Xem v�ng thi n�y",3} },
		{"AddDialogOpt",	{"Xem con s� may m�n l�n tr��c",4} },
		{"AddDialogOpt",	{"Nh�n l�nh ph�n th��ng",5} },
		{"SetDialogTitle",	{"<npc>Ph� Qu� C�m H�p"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "nil",
	szName = "Xem v�ng thi n�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		{"tbBetInfo:CurBetInfo_dlg",	{nil} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "Xem con s� may m�n l�n tr��c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		{"tbBetInfo:LastBetInfo_dlg",	{nil} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "Nh�n l�nh ph�n th��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		{"tbBetInfo:GetAward_dlg",	{nil} },
	},
}
