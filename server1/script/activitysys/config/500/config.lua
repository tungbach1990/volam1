Include("\\script\\activitysys\\config\\500\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Init",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		--{"tbBetInfo:Init",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "CaiShenDialogue",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th�n T�i"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"Mua ch�a Kh�a ��ng",6} },
--		{"AddDialogOpt",	{"Xem v�ng thi n�y",3} },
--		{"AddDialogOpt",	{"Xem con s� may m�n l�n tr��c",4} },
--		{"AddDialogOpt",	{"Nh�n l�nh ph�n th��ng",5} },
--		{"SetDialogTitle",	{"<npc>Ph� Qu� C�m H�p"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "nil",
	szName = "CurBetInfo_dlg",
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
	szName = "LastBetInfo_dlg",
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
	szName = "GetAward_dlg",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		--{"tbBetInfo:GetAward_dlg",	{nil} },
	},
}
--tbConfig[6] = --һ��ϸ��
--{
--	nId = 6,
--	szMessageType = "CreateCompose",
--	szName = "Buy_TongYaoShi",
--	nStartDate = nil,
--	nEndDate  = nil,
--	tbMessageParam = {"Ch�a kh�a  ��ng",1,1,1,1},
--	tbCondition = 
--	{
--		{"AddOneMaterial",	{"Ng�n l��ng",{nJxb=1,},100000} },
--	},
--	tbActition = 
--	{
--		{"PlayerFunLib:GetItem",	{tbTongyaoshi,1,"CaiShen_Buy_TongYaoShi"} },
--	},
--}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "ItemScript",
	szName = "S� d�ng t�i may m�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30111,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"tbAwardTemplet:Give",	{tbLuckyBagAward,1,{"PhuQuyCamHap","SuDungTuiMayMan"}} },
	},
}
