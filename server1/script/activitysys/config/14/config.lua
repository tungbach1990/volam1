

-------�ֲ��������� ��ʼ---------
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "BigBoss t� vong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckName",	{"��c C� Thi�n Phong"} },
	},
	tbActition = 
	{
		{"BigBoss:BigBossDeath",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "nil",
	szName = "Ph�n th��ng to�n server c�a [��c C� Thi�n Phong]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:CheckTimeAndWeekDay",	{2000,2100,"0,1,2,3,4,5,6","Hi�n t�i kh�ng ph�i l� th�i gian l�nh th��ng"} },
		{"PlayerFunLib:CheckLevel",	{90,format("C�p %d tr� l�n m�i c� th� nh�n th��ng!",90),">="} },
	},
	tbActition = 
	{
		{"dostring",	{"Include([[\\script\\missions\\boss\\bigboss.lua]]); BigBoss:BigBossGlobalReward()"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
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
		{"AddDialogOpt",	{"Ph�n th��ng to�n server c�a [��c C� Thi�n Phong]",2} },
	},
}
