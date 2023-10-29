Include("\\script\\activitysys\\config\\1001\\variables.lua")
tbConfig = {}
tbConfig[1] = --S� tr�n t�ng kim 2000 �i�m trong tu�n
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 2000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{2000,">="} },
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_TONGKIM_WEEKLY_MATCH_COUNT, 1}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "Ho�n th�nh v��t �i trong tu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VUOTAI_WEEKLY_MATCH_COUNT, 1}},		
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30162,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAi28"} },
	},
}
tbConfig[3] = --Vi�m ��
{
	nId = 3,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {5},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VIEMDE_WEEKLY_MATCH_COUNT, 1}},
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30163,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAiViemDe5"} },
	},
}
tbConfig[4] =		--V��t �i 17
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30162,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAi17"} },
	},
}
tbConfig[5] = --Vi�m �� - v��t �i th� 10
{
	nId = 5,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30163,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAiViemDe10"} },
	},
}
tbConfig[6] = --S� tr�n t�ng kim 3000 �i�m trong tu�n
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 3000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{
		
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30228,1,0,0},nBindState=-2},2,"KinhMach", "TongKim3000NhanNguyenLieu"} }, --Nguy�n lުu h� th�ng kinh m�ch
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "FinishFengLingDu",
	szName = "Ho�n th�nh Phong L�ng �� t�nh ph�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:IsPaidBoat", {nil}},
	},
	tbActition = 
	{
	},
}
tbConfig[8] =		--V��t �i 10 nh�n nguy�n li�u kinh m�ch
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"10"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30228,1,0,0},nBindState=-2},4,"KinhMach", "VuotAi10NhanNguyenLieu"} }, --Nguy�n lުu h� th�ng kinh m�ch
	},
}
tbConfig[9] = --Vi�m ��
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{		
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30228,1,0,0},nBindState=-2},4,"KinhMach", "VuotAi6ViemDeNhanNguyenLieu"} }, --Nguy�n lުu h� th�ng kinh m�ch
	},
}
tbConfig[10] = --Ho�n th�nh Ki�m Gia nh�n nguy�n li�u kinh m�ch
{
	nId = 10,
	szMessageType = "MazeTaskFinish",
	szName = "maze task",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
--		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{nTSK_MAZE_FINISH_TASK_GET_MERIDAN_DAILY_LIMIT,10,"nomsg","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{nTSK_MAZE_FINISH_TASK_GET_MERIDAN_DAILY_LIMIT,1} },
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30228,1,0,0},nBindState=-2},1,"KinhMach", "KiemGiaMeCungNhanNguyenLieu"} },
	},
}
tbConfig[11] = --Boss Ho�ng Kim nh�n nguy�n li�u kinh m�ch
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t boss Ho�ng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },	
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },	
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30228,1,0,0},nBindState=-2},2,"KinhMach", "BossHKNhanNguyenLieu"} },
	},
}
