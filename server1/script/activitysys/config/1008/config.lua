Include("\\script\\activitysys\\config\\1008\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Khi kh�i ��ng server s� t�i Nguy�t Nhi",
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
tbConfig[2] =
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "B�n �� ��nh qu�i nh�n ���c l� m�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_HONEY_BOTTLE,1,"7"} },
	},
}
--C�ch ki�m nguy�n li�u trong c�c ho�t ��ng
tbConfig[3] = --T�ng kim 1000 �i�m
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 1000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"TongKim1000"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim1000", "10 Qu� Song T�", 1}},
	},
}
tbConfig[4] = --T�ng kim 3000 �i�m
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 3000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,30,EVENT_LOG_TITLE,"TongKim3000"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim3000", "30 Qu� Song T�", 1}},
	},
}
tbConfig[5] =		--V��t �i 17
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{	
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"VuotAi17"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAi17", "10 Qu� Song T�", 1}},
	},
}
tbConfig[6] =  --V��t �i 28
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"VuotAi28"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAi28", "10 Qu� Song T�", 1}},
	},
}
tbConfig[7] = --Th�y t�c ��u l�nh
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "Gi�t ch�t 1 th�y t�c ��u l�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietThuyTacDauLinh", "10 Qu� Song T�", 1}},
	},
}
tbConfig[8] = --thu� t�c ��i ��u l�nh
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t thu� t�c ��i ��u l�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietThuyTacDaiDauLinh", "20 Qu� Song T�", 1}},
	},
}
tbConfig[9] = --Vi�m �� - v��t �i th� 10
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,20,EVENT_LOG_TITLE,"VuotAiViemDe10"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAiViemDe10", "20 Qu� Song T�", 1}},		
	},
}
tbConfig[10] = --Boss Ho�ng Kim
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t boss Ho�ng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,40,EVENT_LOG_TITLE,"TieuDietBossTheGioi"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossTheGioi", "40 Qu� Song T�", 1}},			
	},
}
tbConfig[11] = --boss s�t th�
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Nhi�m v� s�t th� c�p 90",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,3,EVENT_LOG_TITLE,"TieuDietBossSatThu"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossSatThu", "3 Qu� Song T�", 1}},				
	},
}

-----��i tho�i v�i Npc
tbConfig[12] =
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "B�m v�o Nguy�t Nhi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nguy�t Nhi"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"H�p th�nh v�t ph�m",13} },
		{"AddDialogOpt",	{"Online nh�n th��ng",17} },
		{"AddDialogOpt",	{"S� ki�n Hoa H�ng",22} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "��i tho�i h�p th�nh v�t ph�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>V� ��i hi�p n�y c� c�n ta gi�p g� kh�ng?",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"H�p th�nh Tr� Gi�i Nhi�t",14} },
		{"AddDialogOpt",	{"H�p th�nh H�p Qu� M�u Xanh",15} },	
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh Tr� gi�i nhi�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tr� gi�i nhi�t",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"L� m�t",ITEM_HONEY_BOTTLE,1} },
		{"AddOneMaterial",	{"Thanh Th�nh Tuy�t Nha",ITEM_THANH_THANH_TUYET_NHA,1} },
		{"AddOneMaterial",	{"Qu� song t�",ITEM_TWIN_PEANUT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_COOL_TEA,1,EVENT_LOG_TITLE, "GhepTraGiaiNhiet"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "GhepTraGiaiNhiet", "1 Tr� gi�i nhi�t", 1}},
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh Qu� m�u xanh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Qu� m�u Xanh",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"Qu� song t�",ITEM_TWIN_PEANUT,1} },
		{"AddOneMaterial",	{"L� m�t",ITEM_HONEY_BOTTLE,2} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BLUE_ROSE,1,EVENT_LOG_TITLE, "GhepQuaMauXanh"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "GhepTraGiaiNhiet", "1 Tr� gi�i nhi�t", 1}},
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "OnLogin",
	szName = "Ng��i ch�i tr�c tuy�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "CreateDialog",
	szName = "��i tho�i nh�n N�n ��",
	nStartDate = 201202130000,
	nEndDate  = 201202232400,
	tbMessageParam = {"Trong th�i gian di�n ra s� ki�n, c�c ��i hi�p c�p 150 tr� l�n (tr�ng sinh kh�ng gi�i h�n) c� th� tham gia ho�t ��ng online nh�n th��ng, c� m�i ti�ng ��ng h� oline tr�n m�ng s� nh�n ���c 1 N�n ��, m�i ng�y nhi�u nh�t ch� nh�n ���c 3 l�n",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Online nh�n ph�n th��ng",18} },
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "nil",
	szName = "Quy�t ��nh nh�n N�n ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckTaskDaily",	{TSK_ONLINE_AWARD_DAILY_LIMIT,3,"H�m nay ng��i kh�ng th� nh�n n�a, ng�y mai h�y quay l�i.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedCandle",	{nil} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "S� d�ng Tr� gi�i nhi�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30174,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_TEA_USING, 1500, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 1500 l�n.", "<"}},	
	},
	tbActition = 
	{		
		{"ThisActivity:UseCoolTea",	{nil} },
	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "S� d�ng H�p qu� tr�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30175,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },		
		{"PlayerFunLib:CheckTaskDaily",	{TSK_USE_WHITE_GIFT_DAILY_LIMIT,3,"H�m nay ng��i kh�ng th� s� d�ng v�t ph�m n�y n�a, ng�y mai h�y s� d�ng ti�p.","<"} },
	},
	tbActition = 
	{			
		{"PlayerFunLib:AddExp",	{5e6,0,EVENT_LOG_TITLE,"SuDungHopQuaTrang"} },
		{"ThisActivity:WhiteGiftAddTask", {nil}},
	},
}
tbConfig[21] = 
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "S� d�ng qu� m�u xanh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30179,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_BLUE_GIFT_USING, 1000, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 1000 l�n.", "<"}},	
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"SuDungQuaMauXanh"} },
		{"ThisActivity:CastSkillOnUsingBlueGift",	{nil} },
		{"ThisActivity:BlueGiftAddTask", {nil}},
	},
}
tbConfig[22] =
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "��i tho�i s� ki�n hoa h�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�u c�c h� c� v�t ph�m Hoa H�ng c� th� giao n�p cho ta �� tham gia s� ki�n Hoa H�ng. N�i dung s� ki�n nh� sau:<enter>- Th�i gian n�p v�t ph�m: <color=red>0h ng�y 2-2-12 ��n 24h ng�y 28-2-2012<color><enter>- Th�i gian t�ng k�t cu�i c�ng: <color=red>0h20 ng�y 29-2-12<color><enter>- Th�i gian nh�n th��ng: <color=red>9h ng�y 29-2-12 ��n 24h ng�y 29-2-2012<color>",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"C�p nh�t s� l��ng hoa �� n�p ng�y 27",29} },
		{"AddDialogOpt",	{"Giao n�p Hoa H�ng",23} },
		{"AddDialogOpt",	{"Xem b�ng x�p h�ng",24} },	
		{"AddDialogOpt",	{"Nh�n ph�n th��ng x�p h�ng",25} },
	},
}
tbConfig[23] = --n�p qu� m�u xanh
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "giao n�p Hoa H�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>N�p v�t ph�m",1,1,1,0.02},
	tbCondition = 
	{			
		{"AddOneMaterial",	{"Hoa H�ng",{tbProp={6,1,30172,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },	
		{"ThisActivity:GiveRoseCheckTime",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRose",	{nil} },		
	},
}
tbConfig[24] =
{
	nId = 24,
	szMessageType = "nil",
	szName = "xem b�ng x�p h�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{				
	},
	tbActition = 
	{
		{"ThisActivity:ShowTopList",	{nil} },
	},
}
tbConfig[25] =
{
	nId = 25,
	szMessageType = "CreateDialog",
	szName = "��i tho�i s� ki�n hoa h�ng nh�n th��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Xin ch�n ph�n th��ng:",0},
	tbCondition = 
	{
		{"ThisActivity:TopListAwardCheckTime",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ph�n th��ng x�p h�ng 1",26} },
		{"AddDialogOpt",	{"Ph�n th��ng x�p h�ng 2",27} },	
		{"AddDialogOpt",	{"Ph�n th��ng x�p h�ng 3",28} },
	},
}
tbConfig[26] =
{
	nId = 26,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng h�ng 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{1} },
	},
}
tbConfig[27] =
{
	nId = 27,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng h�ng 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{2} },
	},
}
tbConfig[28] =
{
	nId = 28,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng h�ng 3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{3} },
	},
}
tbConfig[29] =
{
	nId = 29,
	szMessageType = "nil",
	szName = "c�p nh�t th�ng tin n�p hoa",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
	},
	tbActition = 
	{
		{"ThisActivity:UpdateRoseNumber",	{nil} },
	},
}