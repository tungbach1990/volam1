Include("\\script\\activitysys\\config\\28\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Ng��i choi click v�o L�o N�ng C�n C�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L�o N�ng C�n C�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>M�a xu�n �� ��n, ta mu�n tr�ng th�m m�t �t hoa m�u � ngo�i th�n ch�ng ta"} },
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng Ti�t Tr�ng C�y",2} },
		{"AddDialogOpt",	{"Nh�n Th�ng G�",3} },
		{"AddDialogOpt",	{"��a L�o N�ng m�t Th�ng N��c",4} },
		{"AddDialogOpt",	{"��a L�o N�ng Long �m Th�nh Th�y",5} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "Gi�i thi�u ho�t ��ng Ti�t Tr�ng C�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>M�a xu�n �� ��n, ta mu�n tr�ng th�m hoa m�u, v�o kho�ng th�i gian 0h/28/03/2011 ��n 24h/04/04/2011, ti�u hi�p ng��i c� th� ��n ch� c�a ta ��y �� l�y Th�ng G� sau �� ��n b�n ��m N��c t�i Chu Ti�n Tr�n (206,189), Long Tuy�n Th�n (223,189) ho�c Th�ch C� Tr�n (217,184) �� gi�p ta l�y n��c, m�i ng�y m�i ng��i ch� c� th� l�y n��c nhi�u nh�t 5 l�n, ti�u hi�p ng��i h�y l�y n��c ��y th�ng cho ta, ta s� cho ng��i ph�n th��ng th�t h�u h�nh; n�u nh� nh� ng��i c� th� �em Long �m Th�nh Th�y l�i ��y cho ta, ta s� t�ng ng��i ph�n th��ng phong ph�, khi ta nh�n ���c Long �m Th�nh Th�y ��t ��n s� l��ng 500 l�n, th� � ngo�i th�n c�a ch�ng ta s� xu�t hi�n 1 M�c Kh�ch r�t d�ng m�nh, n�u trong v�ng 15 ph�t nh� ng��i c� th� ��nh b�i h�n, th� s� nh�n ���c ph�n th��ng ��ng gi�, n�u trong v�ng 15 ph�t ng��i kh�ng ��nh b�i ���c h�n th� M�c Kh�ch s� r�i kh�i ��, Long �m Th�nh Th�y ng��i c� th� �i t�m � trong K� Tr�n C�c.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "nil",
	szName = "Nh�n Th�ng G�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"��ng c�p c�a ng��i kh�ng ��, kh�ng th� nh�n Th�ng G�",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��"} },
		{"ThisActivity:CheckMuTong",	{nil} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"H�m nay ng��i �� v�t v� l�m r�i, ng�y mai l�i ��n nh�","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGetMuTong",	{nil} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "��a L�o N�ng m�t Th�ng N��c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"��ng c�p c�a ng��i kh�ng ��, kh�ng th� tham gia ho�t ��ng",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2737,1,0,0},},1,"Nhanh ch�n �i l�y ��y n��c cho ta"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��"} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"H�m nay ng��i �� v�t v� l�m r�i, hay l� ngh� ng�i �i r�i ng�y mai l�i ��n nh�","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGiveMuTong",	{nil} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "��a L�o N�ng Long �m Th�nh Th�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"��ng c�p c�a ng��i kh�ng ��, kh�ng th� tham gia ho�t ��ng",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2738,1,0,0},},1,"Ta kh�ng c� Long �m Th�nh Th�y"} },
		{"AddOneMaterial",	{"Long �m Th�nh Th�y",{tbProp={6,1,2738,1,0,0},},1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGiveLongYinShengShui",	{nil} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "ServerStart",
	szName = "Sever m� s� ��ng t�i NPC",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
