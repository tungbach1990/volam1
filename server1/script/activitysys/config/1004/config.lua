Include("\\script\\activitysys\\config\\1004\\variables.lua")
tbConfig = {}
tbConfig[1] = --T�ng kim 4000 �i�m
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 4000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{4000,">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30133,1,0,0},},2,strEventName, "TongKim4000"} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},					
	},
	tbActition = 
	{		
		{"ThisActivity:Add_PaidCOT_Task", {nTSK_WEEKLY_CHUANGUAN, 1}},
		{"ThisActivity:Chuanguan28Action", {nil}},
	},
}
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "FinishFengLingDu",
	szName = "Ho�n th�nh Phong L�ng ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},
		{"ThisActivity:IsPaidBoat", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:VngAddTaskCounter", {nTSK_WEEKLY_FENGLINGDU, 1}},
	},
}
tbConfig[4] = --Vi�m ��
{
	nId = 4,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},
	},
	tbActition = 
	{
		{"ThisActivity:YDBZguoguanAction", {6}},
		{"ThisActivity:VngAddTaskCounter", {nTSK_WEEKLY_YDBZ, 1}},
	},
}
tbConfig[5] = --��i tho�i B�c ��u L�o Nh�n
{
	nId = 5,
	szMessageType = "ClickNpc",
	szName = "B�m v�o B�c ��u L�o Nh�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�c ��u L�o Nh�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nhi�m v� ��ng Tr�ng H� Th�o",6} },		
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "Nhi�m v� ��ng Tr�ng Th�o - main dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C�c h� t�m ta c� vi�c g�?"},
	tbCondition = 
	{
		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nhi�m v� giai �o�n 1",7} },
		{"AddDialogOpt",	{"Nhi�m v� giai �o�n 2",8} },
		{"AddDialogOpt",	{"Nhi�m v� giai �o�n 3",9} },
		--{"AddDialogOpt",	{"Nh�n ph�n th��ng tham gia t�nh n�ng tu�n",10} },
		--{"AddDialogOpt",	{"Ki�m tra t�nh h�nh tham gia t�nh n�ng tu�n",11} },
		{"AddDialogOpt",	{"Mi�n ph� nh�n v�t ph�m T�i Linh ��n",20} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "nil",
	szName = "Nhi�m v� ��ng Tr�ng Th�o - 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"ThisActivity:MainQuestDialog", {1},},
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "nil",
	szName = "Nhi�m v� ��ng Tr�ng Th�o - 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		
	},
	tbActition = 
	{
		{"ThisActivity:MainQuestDialog", {2},},
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "nil",
	szName = "Nhi�m v� ��ng Tr�ng Th�o - 3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		
	},
	tbActition = 
	{
		{"ThisActivity:MainQuestDialog", {3},},
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "Nh�n ph�n th��ng tham gia t�nh n�ng tu�n dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Xin h�y ch�n ph�n th��ng:"},
	tbCondition = 
	{
		{"ThisActivity:WeeklyAwardCondition", {nil},},
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ph�n th��ng ho�n th�nh 15 tr�n T�ng Kim ��t 3000 �i�m",12} },
		{"AddDialogOpt",	{"Ph�n th��ng ho�n th�nh 10 l�n V��t �i c� s� d�ng Long Huy�t Ho�n",13} },
		{"AddDialogOpt",	{"Ph�n th��ng ho�n th�nh 14 l�n �i thuy�n Phong L�ng �� s� d�ng L�nh B�i Th�y T�c",14} },
		{"AddDialogOpt",	{"Ph�n th��ng ho�n th�nh 10 l�n V��t �i 6 Vi�m ��",15} },
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "nil",
	szName = "Ki�m tra t�nh h�nh tham gia t�nh n�ng tu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"ThisActivity:CheckWeeklyTask", {nil},},		
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "nil",
	szName = "Ph�n th��ng T�ng Kim tu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTask", {nTSK_WEEKLY_SONGJIN_3000, 15,"Xin l�i, c�c h� kh�ng �� �i�u ki�n nh�n th��ng",">="}},		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:VngSubtractTaskCounter", {nTSK_WEEKLY_SONGJIN_3000, 15, "Xin l�i, c�c h� kh�ng �� �i�u ki�n nh�n th��ng"},},
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30134,1,0,0},},1,"NhiemVuDongTrungThao", "PhanThuongTKTuan"} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "nil",
	szName = "Ph�n th��ng V��t �i tu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTask", {nTSK_WEEKLY_CHUANGUAN, 10,"Xin l�i, c�c h� kh�ng �� �i�u ki�n nh�n th��ng",">="}},		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:VngSubtractTaskCounter", {nTSK_WEEKLY_CHUANGUAN, 10, "Xin l�i, c�c h� kh�ng �� �i�u ki�n nh�n th��ng"},},
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30134,1,0,0},},1,"NhiemVuDongTrungThao", "PhanThuongVuotAiTuan"} },
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "nil",
	szName = "Ph�n th��ng PLD tu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTask", {nTSK_WEEKLY_FENGLINGDU, 14,"Xin l�i, c�c h� kh�ng �� �i�u ki�n nh�n th��ng",">="}},		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:VngSubtractTaskCounter", {nTSK_WEEKLY_FENGLINGDU, 14, "Xin l�i, c�c h� kh�ng �� �i�u ki�n nh�n th��ng"},},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30134,1,0,0},},1,"NhiemVuDongTrungThao", "PhanThuongPLDTuan"} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "nil",
	szName = "Ph�n th��ng Vi�m �� tu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTask", {nTSK_WEEKLY_YDBZ, 10,"Xin l�i, c�c h� kh�ng �� �i�u ki�n nh�n th��ng",">="}},		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:VngSubtractTaskCounter", {nTSK_WEEKLY_YDBZ, 10, "Xin l�i, c�c h� kh�ng �� �i�u ki�n nh�n th��ng"},},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30134,1,0,0},},1,"NhiemVuDongTrungThao", "PhanThuongViemDeTuan"} },
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "nil",
	szName = "Nh�n nhi�m v� giai �o�n 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"ThisActivity:Stage1_QuestCondition", {nil}},
		
	},
	tbActition = 
	{
		{"ThisActivity:Stage1_QuestAccept", {nil}},	
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "nil",
	szName = "Ho�n th�nh nhi�m v� giai �o�n 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_STAGE_1, 1, "Ng��i ch�a nh�n nhi�m v� l�m sao m� ho�n th�nh!", "~="}},		
	},
	tbActition = 
	{
		{"ThisActivity:Stage1_QuestAccept", {nil}},	
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "ServerStart",
	szName = "Khi kh�i ��ng server s� t�i data",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:OnServerStart",	{nil} },
	},
}
tbConfig[19] = --T�ng kim 3000 �i�m
{
	nId = 19,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 3000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"ThisActivity:VngAddTaskCounter", {nTSK_WEEKLY_SONGJIN_3000, 1}},
	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "nil",
	szName = "Mi�n ph� nh�n t�i linh ��n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {"C�n ph�i nh�n nhi�m v� ��ng Tr�ng H� Th�o m�i c� th� nh�n v�t ph�m n�y!"},},		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30134,1,0,0},},1,strEventName, "MienPhiNhanTuiLinhDon"} },
	},
}
tbConfig[21] = 
{
	nId = 21,
	szMessageType = "FinishFengLingDu",
	szName = "Ho�n th�nh Phong L�ng ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},
		{"ThisActivity:IsPaidBoat", {nil}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30133,1,0,0},},3,strEventName, "HoanThanhPLD"} },
	},
}
