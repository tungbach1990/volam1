Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")


-------�ֲ��������� ��ʼ---------
-------�ֲ��������� ����---------

local tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "nil",
	szName = "Test",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:CheckItemInBag",	{"return {szName = \"Ũ���ɿ���\",tbProp = {6,1,445,1,0,0},}",1,"���ϲ���"} },
	},
	tbActition = 
	{
		{"lib:ConsumeEquiproomItem",	{"return {szName = \"Ũ���ɿ���\",tbProp = {6,1,445,1,0,0},}",1} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(1, tbConfig)
