

-------�ֲ��������� ��ʼ---------
local fn		= function(nItemIndex) local szMsg=format("Ch�c m�ng cao th� %s �� nh�n ���c %s",GetName(),GetItemName(nItemIndex)) AddGlobalNews(szMsg) Msg2SubWorld(szMsg) end
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "CreateDialog",
	szName = "��i ho�n m� h�ng �nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C�c h� mu�n ��i lo�i trang b� n�o?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��i [Ho�n m�] H�ng �nh h�ng t� chi�u",2} },
		{"AddDialogOpt",	{"��i [Ho�n m�] H�ng �nh qua ki�m t�y ph��ng",3} },
		{"AddDialogOpt",	{"��i [Ho�n m�] H�ng �nh th�m vi�n uy�n",4} },
		{"AddDialogOpt",	{"Ta mu�n ��i [Ho�n M�] H�ng �nh M�c T�c",5} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "��i [Ho�n m�] H�ng �nh h�ng t� chi�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Ho�n M�] H�ng �nh H�ng T� Chi�u",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho�n M� Kim B�i",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,437},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "��i [Ho�n m�] H�ng �nh qua ki�m t�y ph��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Ho�n M�] H�ng �nh Ki�m Qua T�y Ph��ng",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho�n M� Kim B�i",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,435},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "��i [Ho�n m�] H�ng �nh th�m vi�n uy�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Ho�n M�] H�ng �nh Tr�m Vi�n V�n T�y",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho�n M� Kim B�i",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,434},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n ��i [Ho�n M�] H�ng �nh M�c T�c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Ho�n M�] H�ng �nh M�c T�c T��ng Vong",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho�n M� Kim B�i",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,436},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "��i kim b�i th�nh trang b� ho�ng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ex_goldequp_coin",	{nil} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "��i c�c ph�m h�ng �nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C�c h� mu�n ��i lo�i trang b� n�o?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n ��i [C�c ph�m] H�ng �nh H�ng T� Chi�u",8} },
		{"AddDialogOpt",	{"Ta mu�n ��i [C�c ph�m] H�ng �nh Ki�m Qua T�y Ph��ng",9} },
		{"AddDialogOpt",	{"Ta mu�n ��i [C�c ph�m] H�ng �nh Tr�m Vi�n V�n T�y",10} },
		{"AddDialogOpt",	{"Ta mu�n ��i [C�c ph�m] H�ng �nh M�c T�c T��ng Vong",11} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n ��i [C�c ph�m] H�ng �nh H�ng T� Chi�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[C�c ph�m] H�ng �nh H�ng T� Chi�u",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho�n M� Kim B�i",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,535},nQuality=1,CallBack=fn},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n ��i [C�c ph�m] H�ng �nh Ki�m Qua T�y Ph��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[C�c ph�m]H�ng �nh Ki�m Qua T�y Ph��ng",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho�n M� Kim B�i",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,533},nQuality=1,CallBack=fn},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n ��i [C�c ph�m] H�ng �nh Tr�m Vi�n V�n T�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[C�c ph�m] H�ng �nh Tr�m Vi�n V�n T�y",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho�n M� Kim B�i",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,532},nQuality=1,CallBack=fn,},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n ��i [C�c ph�m] H�ng �nh M�c T�c T��ng Vong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[C�c ph�m] H�ng �nh M�c T�c T��ng Vong",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho�n M� Kim B�i",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,534},nQuality=1,CallBack=fn,},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "B�m v�o L� Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L� Quan"},
	tbCondition = 
	{
		{"NpcFunLib:IsInCity",	{nil} },
	},
	tbActition = 
	{
--Change request 04/06/2011, ��ng ch� t�o trang b� b�ch kim - Modified by DinhHQ - 20110605
--		{"AddDialogOpt",	{"��i kim b�i th�nh trang b� ho�ng kim",6} },
--		{"AddDialogOpt",	{"��i c�c ph�m h�ng �nh",7} },
--		{"AddDialogOpt",	{"��i ho�n m� h�ng �nh",1} },
--		{"AddDialogOpt",	{"��i kim b�i trang b� ho�ng kim (ti�p theo)",13} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "nil",
	szName = "��i kim b�i trang b� ho�ng kim (ti�p theo)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ex_goldequp_coin_2",	{nil} },
	},
}
