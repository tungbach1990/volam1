Include("\\script\\activitysys\\config\\15\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Load NPC",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{tbLvTongXinPos.szName,tbLvTongXinPos.nId,tbLvTongXinPos} },
		--{"NpcFunLib:AddDialogNpc",	{tbShiJianZongGuanPos.szName,tbShiJianZongGuanPos.nId,tbShiJianZongGuanPos} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "NPC LvTongXin dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbLvTongXinPos.szName},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Tham gia t�m nguy�n li�u",3} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "nil",
	szName = "Open flipcard",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a c�c h� kh�ng �� �� tham gia ho�t ��ng, h�y c� g�ng luy�n t�p th�m.",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:OpenUI",	{nil} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "NPC ShiJianZongGuan dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T�ng Qu�n S� Ki�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{format("H�p th�nh %s", tbAward_1.szName),5} },
		{"AddDialogOpt",	{format("H�p th�nh %s", tbAward_2.szName),6} },
		{"AddDialogOpt",	{format("H�p th�nh %s", tbAward_3.szName),12} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "Compose award_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_1.szName,1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a c�c h� kh�ng �� �� tham gia ho�t ��ng, h�y c� g�ng luy�n t�p th�m.",">="} },
		{"AddOneMaterial",	{tbMaterail_4.szName,tbMaterail_4,1} },
		{"AddOneMaterial",	{tbMaterail_5.szName,tbMaterail_5,1} },
		{"AddOneMaterial",	{tbMaterail_1.szName,tbMaterail_1,1} },
		{"AddOneMaterial",	{tbMaterail_3.szName,tbMaterail_3,1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�p th�nh th�t b�i, h�nh trang c�a c�c h� kh�ng �� � tr�ng."} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAward_1,1,EVENT_LOG_TITLE,"GhepQuocKhanhVang"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "Compose award_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_2.szName,1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a c�c h� kh�ng �� �� tham gia ho�t ��ng, h�y c� g�ng luy�n t�p th�m.",">="} },
		{"AddOneMaterial",	{tbMaterail_4.szName,tbMaterail_4,1} },
		{"AddOneMaterial",	{tbMaterail_5.szName,tbMaterail_5,1} },
		{"AddOneMaterial",	{tbMaterail_1.szName,tbMaterail_1,1} },
		{"AddOneMaterial",	{tbMaterail_6.szName,tbMaterail_6,1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�p th�nh th�t b�i, h�nh trang c�a c�c h� kh�ng �� � tr�ng."} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAward_2,1,EVENT_LOG_TITLE,"GhepQuocKhanhDo"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "ItemScript",
	szName = "Use award_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a c�c h� kh�ng �� �� s� d�ng ��o c�, h�y c� g�ng luy�n t�p th�m.",">="} },
		{"ThisActivity:CheckTask",	{TSKI_AWARD_NUM_1,MAX_USE_LIMIT_AWARD_1,"C�c h� s� d�ng Qu�c Kh�nh (v�ng) �� ��t ��n 1000 c�i, kh�ng th� ti�p t�c s� d�ng.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Kh�ng gian h�nh trang c�a ng��i kh�ng ��."} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKI_AWARD_NUM_1,1} },
		{"ThisActivity:UseAward1",	{EXP_OPEN_AWARD_1} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "Use award_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a c�c h� kh�ng �� �� s� d�ng ��o c�, h�y c� g�ng luy�n t�p th�m.",">="} },
		{"ThisActivity:CheckTask",	{TSKI_AWARD_NUM_2,MAX_USE_LIMIT_AWARD_2,"C�c h� s� d�ng Qu�c Kh�nh (��) �� ��t ��n 2000 c�i, kh�ng th� ti�p t�c s� d�ng.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"Kh�ng gian h�nh trang c�a ng��i kh�ng ��."} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKI_AWARD_NUM_2,1} },
		{"ThisActivity:UseAward2",	{EXP_OPEN_AWARD_2} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "HarvestPlants",
	szName = "Plant tree award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"tianlu_tree"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{tbMaterail_4,10,"",""} },
	},
}
tbConfig[10] = --s� d�ng t�i qu� m�ng Qu�c Kh�nh
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "Use award_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_4},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a c�c h� kh�ng �� �� s� d�ng ��o c�, h�y c� g�ng luy�n t�p th�m.",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Kh�ng gian h�nh trang c�a ng��i kh�ng ��."} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{tbMaterail_2,5,EVENT_LOG_TITLE,"SuDungTuiMungQuocKhanh"} },
	},
}
tbConfig[11] = --s� d�ng qu�c khanh xanh
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "Use award_3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a c�c h� kh�ng �� �� s� d�ng ��o c�, h�y c� g�ng luy�n t�p th�m.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{BITTSK_AWARD_NUM_3,MAX_USE_LIMIT_AWARD_3,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Kh�ng gian h�nh trang c�a ng��i kh�ng ��."} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {BITTSK_AWARD_NUM_3, 1}},
		{"PlayerFunLib:AddExp",	{EXP_OPEN_AWARD_3,0,EVENT_LOG_TITLE,"SuDungQuocKhanhXanh"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Compose award_3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_3.szName,1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a c�c h� kh�ng �� �� tham gia ho�t ��ng, h�y c� g�ng luy�n t�p th�m.",">="} },
		{"AddOneMaterial",	{tbMaterail_2.szName,tbMaterail_2,1} },
		{"AddOneMaterial",	{tbAward_1.szName,tbAward_1,1} },		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�p th�nh th�t b�i, h�nh trang c�a c�c h� kh�ng �� � tr�ng."} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAward_3,1,EVENT_LOG_TITLE,"GhepQuocKhanhXanh"} },
	},
}