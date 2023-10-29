Include("\\vng_script\\activitysys\\config\\1030\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1030\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1030\\awardlist.lua")


tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "when ServerStart",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:OnServerStart", {}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "TQSK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T�ng Qu�n S� Ki�n"},
	tbCondition =
	{		
				
	},
	tbActition =
	{			
		{"AddDialogOpt",	{"��i B�ch Ni�n Tr�n L�",3} },
		{"AddDialogOpt",	{"��i Thi�n Ni�n Tr�n L�",4} },			
		{"AddDialogOpt",	{"Nh�n ph�n th��ng m�c",5} },		
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "��i ITEM_BACHNIEN_TL",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BACHNIEN_TL.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },		
		{"AddOneMaterial",	{ITEM_BINH_RUOU.szName,ITEM_BINH_RUOU,5 }},	
		{"AddOneMaterial",	{MONEY.szName,MONEY,MONEY_5Van }},
	},	
	tbActition =
	{		
		{"PlayerFunLib:GetItem",	{ITEM_BACHNIEN_TL,1,EVENT_LOG_TITLE,"Doi - ITEM_BACHNIEN_TL"} },	
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "��i ITEM_THIENNIEN_TL",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_THIENNIEN_TL.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },		
		{"AddOneMaterial",	{ITEM_BINH_RUOU.szName,ITEM_BINH_RUOU,5 }},	
		{"AddOneMaterial",	{ITEM_MEN_RUOU.szName,ITEM_MEN_RUOU,1 }},			
	},	
	tbActition =
	{		
		{"PlayerFunLib:GetItem",	{ITEM_THIENNIEN_TL,1,EVENT_LOG_TITLE,"Doi - ITEM_THIENNIEN_TL"} },	
	},
}

--nhan thuong moc
tbConfig[5] =
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "��i tho�i s� ki�n event ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"C�c h� �� d�ng ���c :\n	- Thi�n Ni�n Tr�n L� : <color=yellow><lua GetBitTask(2737, 12, 12) /><color> c�i.\n	- V�n Ni�n Tr�n L� : <color=yellow><lua GetBitTask(2738, 0, 12) /><color> c�i."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Nh�n m�c 1000 Thi�n Ni�n Tr�n L�",6} },
		{"AddDialogOpt",	{"Nh�n m�c 1500 Thi�n Ni�n Tr�n L�",7} },	
		{"AddDialogOpt",	{"Nh�n m�c 500 V�n Ni�n Tr�n L�",8} },
		{"AddDialogOpt",	{"Nh�n m�c 1000 V�n Ni�n Tr�n L�",9} },	
		{"AddDialogOpt",	{"Nh�n m�c 2000 V�n Ni�n Tr�n L�",10} },
		{"AddDialogOpt",	{"Nh�n m�c 3000 V�n Ni�n Tr�n L�",11} },				
	},
}

---phan thuong moc 
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_THIENNIEN_TL, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_THIENNIEN_TL, MOC_1000, "B�n ch�a d�ng �� 1000 Thi�n Ni�n Tr�n L�.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_THIENNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_ThienNienTL["1000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1000_ThienNienTL"}} },
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 1500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1500_THIENNIEN_TL, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_THIENNIEN_TL, MOC_1500, "B�n ch�a d�ng �� 1500 Thi�n Ni�n Tr�n L�.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1500_THIENNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_ThienNienTL["1500"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1500_ThienNienTL"}} },
	},
}
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_500_VANNIEN_TL, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_VANNIEN_TL, MOC_500, "B�n ch�a d�ng �� 500 V�n Ni�n Tr�n L�.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_500_VANNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VanNienTL["500"],1,{EVENT_LOG_TITLE,"PhanThuongMoc500_VanNienTL"}} },
	},
}
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_VANNIEN_TL, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_VANNIEN_TL, MOC_1000, "B�n ch�a d�ng �� 1000 V�n Ni�n Tr�n L�.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_VANNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VanNienTL["1000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1000_VanNienTL"}} },
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 2000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_2000_VANNIEN_TL, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_VANNIEN_TL, MOC_2000, "B�n ch�a d�ng �� 2000 V�n Ni�n Tr�n L�.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_2000_VANNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VanNienTL["2000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc2000_VanNienTL"}} },
	},
}
tbConfig[11] = 
{
	nId = 11,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_3000_VANNIEN_TL, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_VANNIEN_TL, MOC_3000, "B�n ch�a d�ng �� 3000 V�n Ni�n Tr�n L�.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_3000_VANNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VanNienTL["3000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc3000_VanNienTL"}} },
	},
}
--Su dung Item
tbConfig[12] = 
{
	nId = 12,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_BACHNIEN_TL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BACHNIEN_TL, MOC_2000, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},		
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BACHNIEN_TL, 1}},		
		{"tbAwardTemplet:Give",{tbAward_Use_BACHNIEN_TL,1,{EVENT_LOG_TITLE,"Use - ITEM_BACHNIEN_TL"}} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_THIENNIEN_TL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_THIENNIEN_TL, MOC_1500, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},		
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_THIENNIEN_TL, 1}},		
		{"tbAwardTemplet:Give",{tbAward_Use_THIENNIEN_TL,1,{EVENT_LOG_TITLE,"Use - ITEM_THIENNIEN_TL"}} },
	},
}
tbConfig[17] = 
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_VANNIEN_TL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },			
		{"ThisActivity:CheckLimitUseTienDon",{}},
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_VANNIEN_TL, 1}},		
		{"tbAwardTemplet:Give",{tbAward_Use_VanNienTL,1,{EVENT_LOG_TITLE,"Use - ITEM_VANNIEN_TL"}} },	
	},
}
tbConfig[18] = 
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_TIENDON},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_TIENDON, 1, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},			
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_TIENDON, 1}},	
		{"Msg2Player",{"Gi�i h�n s� d�ng V�n Ni�n Tr�n L� t�ng l�n 3000 c�i."}},	
		{"Talk",{1,"","S� d�ng Ti�n ��n t�ng gi�i h�n s� d�ng V�n Ni�n Tr�n L� t�ng l�n 3000 c�i."}},	
	},
}
tbConfig[19] = --��nh qu�i r�t Item
{
	nId = 19,
	szMessageType = "NpcOnDeath",
	szName = "B�n �� ��nh qu�i nh�n nguy�n li�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,340,322,225,226,227,75"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_BINH_RUOU,1,"5"} },
	},
}
--Hoan Thanh Da Tau
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "HoanThanhDaTau",
	szName = "ho�n th�nh nv d� t�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEN_RUOU,3,EVENT_LOG_TITLE,"HoanThanh_DaTau"} },	
	},
}

tbConfig[21] = 
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_HOP_VANNIEN_TL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph�i c� �t nh�t 5 � tr�ng m�i c� th� s� d�ng."} },			
	},
	tbActition = 
	{			
		{"tbAwardTemplet:Give",{tbAward_Use_HOP_VANNIEN_TL,1,{EVENT_LOG_TITLE,"Use - ITEM_HOP_VANNIEN_TL"}} },
	},
}