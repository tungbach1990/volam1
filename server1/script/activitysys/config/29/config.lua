Include("\\script\\activitysys\\config\\29\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click v�o ng��i l�nh",
	nStartDate = nil,
	nEndDate  = nil,
--Move soldier's action to soldier statue - Modified by DinhHQ - 20110425
	tbMessageParam = {"T��ng ��i"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T�ng Hoa Lan",2} },
--		{"SetDialogTitle",	{"<npc>22/04/2011~22/05, Nh�n s� c�p 120 tr� l�n c� th� t�ng Hoa Lan R�ng, T�i G�o, Chi�c �o cho ta, ta s� h�u ��I ng��i chu ��o."} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "T�ng Hoa Lan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"��ng c�p ch�a �� 120",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_IDX_DAILY_GIVE_LANHUA,MAX_GIVE_LANHUA_PERDAY,"H�m nay �� giao �� Hoa Lan R�ng r�i","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,1977,1,0,0},},1,"Kh�ng �� hoa lan r�ng"} },
		{"AddOneMaterial",	{"Hoa Lan",{tbProp={6,1,1977,1,0,0},},1} },
		{"ThisActivity:Vng_LanHua_Limit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:Vng_OnGiveLanHua",	{nil} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 5,
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
