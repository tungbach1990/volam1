Include("\\vng_script\\activitysys\\config\\1027\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1027\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1027\\awardlist.lua")

tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "when ServerStart",
	nStartDate = 201512160000,
	nEndDate  = 201512312400,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:OnServerStart", {}},
	},
}
tbConfig[2] = --��nh qu�i r�t Item
{
	nId = 2,
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
		{"NpcFunLib:DropSingleItem",	{ITEM_HOPQUA_GS,1,"2"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "ClickNpc",
	szName = "Npc Ng��i Tuy�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ng��i Tuy�t"},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition =
	{
		{"SetDialogTitle",	{"B�t ��u t� 16/12/2015 - 31/12/2015, B�ng h�u to�n c�i v� l�m c�ng tham gia  c�c ho�t ��ng h�p s�i ��ng �� ��n ch�o <color=yellow>Gi�ng Sinh <color> n�m nay.\n <color=yellow>Ch�c qu� ��ng ��o v� l�m m�t m�a Gi�ng sinh an l�nh!<color>"} },
		{"AddDialogOpt",	{"��i Ng��i Tuy�t V�ng",4} },
		{"AddDialogOpt",	{"��i Ng��i Tuy�t ��",5} },
		{"AddDialogOpt",	{"Nh�n th��ng m�c s� d�ng Ng��i Tuy�t V�ng",6} },
		{"AddDialogOpt",	{"Nh�n th��ng m�c s� d�ng Ng��i Tuy�t �� v� Ng��i Tuy�t",7} },
		{"AddDialogOpt",	{"5 Ph�n th��ng ��u ti�n ��t cho ng��i s� d�ng 1000 Ng��i Tuy�t �� v� Ng��i Tuy�t",16} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "��i ITEM_NGUOITUYET_VANG",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_NGUOITUYET_VANG.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },		
		{"AddOneMaterial",	{ITEM_HOATUYET.szName,ITEM_HOATUYET,1 }},	
		{"AddOneMaterial",	{ITEM_CANHTHONG.szName,ITEM_CANHTHONG,1 }},	
		{"AddOneMaterial",	{ITEM_CHUONG_GS.szName,ITEM_CHUONG_GS,1 }},	
		{"AddOneMaterial",	{ITEM_SAO_GS.szName,ITEM_SAO_GS,1 }},			
	},	
	tbActition =
	{		
		{"PlayerFunLib:GetItem",	{ITEM_NGUOITUYET_VANG,1,EVENT_LOG_TITLE,"Doi_ITEM_NGUOITUYET_VANG"} },	
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "��i ITEM_NGUOITUYET_DO",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_NGUOITUYET_DO.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },		
		{"AddOneMaterial",	{ITEM_HOATUYET.szName,ITEM_HOATUYET,1 }},	
		{"AddOneMaterial",	{ITEM_CANHTHONG.szName,ITEM_CANHTHONG,1 }},	
		{"AddOneMaterial",	{ITEM_CHUONG_GS.szName,ITEM_CHUONG_GS,1 }},	
		{"AddOneMaterial",	{ITEM_SAO_GS.szName,ITEM_SAO_GS,1 }},	
		{"AddOneMaterial",	{ITEM_THIEP_GS.szName,ITEM_THIEP_GS,1 }},	
	},	
	tbActition =
	{		
		{"PlayerFunLib:GetItem",	{ITEM_NGUOITUYET_DO,1,EVENT_LOG_TITLE,"Doi_ITEM_NGUOITUYET_DO"} },	
	},
}
--nhan thuong moc
tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "��i tho�i s� ki�n event Noel th�ng 12",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"C�c h� �� d�ng ���c :\n	- Ng��i Tuy�t V�ng : <color=yellow><lua GetBitTask(2725, 0, 12) /><color> c�i."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta �� s� d�ng h�n   1000 Ng��i Tuy�t V�ng",8} },
		{"AddDialogOpt",	{"Ta �� s� d�ng ���c 2000 Ng��i Tuy�t V�ng",9} },			
	},
}
tbConfig[7] =
{
	nId = 7,
		szMessageType = "CreateDialog",
	szName = "��i tho�i s� ki�n event th�ng 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"C�c h� �� d�ng ���c :\n	- Ng��i Tuy�t �� : <color=yellow><lua GetBitTask(2725, 12, 10) /><color> c�i."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta �� s� d�ng h�n   500 Ng��i Tuy�t �� v� Ng��i Tuy�t",10} },
		{"AddDialogOpt",	{"Ta �� s� d�ng ���c 1000  Ng��i Tuy�t �� v� Ng��i Tuy�t",11} },			
	},
}

---phan thuong moc Th� Li�n Hoa
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_NguoiTuyetVang, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NguoiTuyetVang, MOC_1000, "B�n ch�a d�ng �� 1000 Ng��i Tuy�t V�ng.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_NguoiTuyetVang, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_NguoiTuyetVang["1000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1000_NguoiTuyetVang"}} },
	},
}
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 2000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_2000_NguoiTuyetVang, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NguoiTuyetVang, MOC_2000, "B�n ch�a d�ng �� 2000 Ng��i Tuy�t V�ng.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_2000_NguoiTuyetVang, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_NguoiTuyetVang["2000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc2000_NguoiTuyetVang"}} },
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_500_NguoiTuyetDo, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NguoiTuyetDo, MOC_500, "B�n ch�a d�ng �� 500 Ng��i Tuy�t �� v� Ng��i Tuy�t", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_500_NguoiTuyetDo, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_NguoiTuyetDo["500"],1,{EVENT_LOG_TITLE,"PhanThuongMoc500_NguoiTuyetDo"}} },
	},
}
tbConfig[11] = 
{
	nId = 11,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_NguoiTuyetDo, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NguoiTuyetDo, MOC_1000, "B�n ch�a d�ng �� 1000 Ng��i Tuy�t �� v� Ng��i Tuy�t", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_NguoiTuyetDo, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_NguoiTuyetDo["1000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1000_NguoiTuyetDo"}} },
	},
}

--Su dung Item
tbConfig[12] = 
{
	nId = 12,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = 201512160000,
	nEndDate  = 201512312400,
	tbMessageParam = {ITEM_NGUOITUYET_VANG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"ThisActivity:CheckUseInMap",{}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_NguoiTuyetVang, MOC_2000 , "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},
	},
	tbActition = 
	{			
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_NguoiTuyetVang, 1}},		
		{"ThisActivity:Add_CayThong",	{ID_THONG_TT} },
	},
}

tbConfig[13] = 
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = 201512160000,
	nEndDate  = 201512312400,
	tbMessageParam = {ITEM_NGUOITUYET_DO},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"ThisActivity:CheckUseInMap",{}}	,
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_NguoiTuyetDo, MOC_1000 , "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_NguoiTuyetDo, 1}},			
		{"ThisActivity:Add_CayThong",	{ID_THONG_HK} },		
	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = 201512160000,
	nEndDate  = 201512312400,
	tbMessageParam = {ITEM_HOPQUA_GS},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph�i c� �t nh�t 5 � tr�ng m�i c� th� nh�n th��ng."} },					
	},
	tbActition = 
	{
		{"tbAwardTemplet:Give",{tbAward_Use_Hop_QuaGiangsSinh,1,{EVENT_LOG_TITLE,"Use_ITEM_HOPQUA_GS"}} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "S� d�ng Item",
	nStartDate = 201512160000,
	nEndDate  = 201512312400,
	tbMessageParam = {ITEM_NGUOI_TUYET},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_NguoiTuyetDo, MOC_1000 , "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_NguoiTuyet, MOC_200 , "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_NguoiTuyetDo, 1}},		
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_NguoiTuyet, 1}},		
		{"tbAwardTemplet:Give",{tbAward_Tree[ID_THONG_HK],1,{EVENT_LOG_TITLE,"Use_ITEM_NGUOI_TUYET"}} },
	},
}

--nhan phan thuogn top 5
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "nil",
	szName = "Nhan thuong top 5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph�i c� �t nh�t 5 � tr�ng m�i c� th� nh�n th��ng."} },					
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_RECV_TOP_5, 1 , "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NguoiTuyetDo, MOC_1000, "B�n ch�a d�ng �� 1000 Ng��i Tuy�t �� v� Ng��i Tuy�t.", ">="}},
	},
	tbActition = 
	{			
		{"ThisActivity:GetAwardTop5",	{} },
	},
}