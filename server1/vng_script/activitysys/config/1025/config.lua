Include("\\vng_script\\activitysys\\config\\1025\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1025\\awardlist.lua")
Include("\\vng_script\\activitysys\\config\\1025\\extend.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")

tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click shijianzongguan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T�ng Qu�n S� Ki�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"L�m b�nh sinh nh�t",2} },
		{"AddDialogOpt",	{"Nh�n t�i nguy�n li�u",3} },
		{"AddDialogOpt",	{"Xem th�i gian t�ch l�y online",10} },									
		{"AddDialogOpt",	{"Nh�n ph�n th��ng m�c s� ki�n sinh nh�t",4} },		
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "Gh�p B�nh sinh nh�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BANH_SN.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },		
		{"AddOneMaterial",	{ITEM_DUONG.szName,ITEM_DUONG,1} },
		{"AddOneMaterial",	{ITEM_TRUNG.szName,ITEM_TRUNG,1} },
		{"AddOneMaterial",	{ITEM_BOT.szName,ITEM_BOT,1} },
		{"AddOneMaterial",	{ITEM_SUA.szName,ITEM_SUA,1} },
	},
	
	tbActition =
	{ 
		{"PlayerFunLib:GetItem",	{ITEM_BANH_SN,1,EVENT_LOG_TITLE,"GhetBanhSinhNhat"} },
	}, 
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "nil",
	szName = "��i tho�i s� ki�n event m�ng sinh nh�t ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Th�i gian online t�ch l�y ���c 5 ph�t b�ng h�u s� nh�n ���c 1 <color=yellow>T�i Nguy�n Li�u. L�u �: th�i gian t�ch l�y qua ng�y s� ���c t�nh l�i t� ��u."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"ThisActivity:GetAwardOnline",	{} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "��i tho�i s� ki�n event m�ng sinh nh�t ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>K� ni�m sinh nh�t l�n th� nh�t, l�n n�y \n<color=yellow>Qu� M�ng Sinh Nh�t<color> ch�a ��ng r�t nhi�u v�t ph�m qu� hi�m xu�t hi�n. C�c b�ng h�u h�y nhanh ch�ng t�m �� s� h�u nh�ng v�t ph�m qu� hay trang b� Ho�ng Kim hi�m.\n- ��c bi�t khi s� d�ng B�nh Sinh Nh�t ��t ��n c�c gi�i h�n ta s�  c� th�m ph�n th��ng.\n<color=yellow>S� B�nh Sinh Nh�t �� d�ng:<lua GetBitTask(2693, 1, 12) /><color>"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta �� s� d�ng h�n   100 c�i",5} },
		{"AddDialogOpt",	{"Ta �� s� d�ng ���c  800 c�i",6} },			
	},
}
---phan thuong moc
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 100",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_NhanMoc_100, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BANH_SN, MOC_100, "B�n ch�a d�ng �� 100 B�nh Sinh Nh�t.", ">="}},
	},
	tbActition =
	{			
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_NhanMoc_100, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit["100"],1,{EVENT_LOG_TITLE,"PhanThuongMoc100_BSN"}} },
	},
}
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng m�c s� d�ng 800",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_NhanMoc_800, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BANH_SN, MOC_800, "B�n ch�a d�ng �� 800 B�nh Sinh Nh�t.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_NhanMoc_800, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit["800"],1,{EVENT_LOG_TITLE,"PhanThuongMoc800_BSN"}} },		
	},
}

--su dung item script
tbConfig[7] =
{
	nId = 7,
	szMessageType = "ItemScript",
	szName = "S� d�ng Item",
	nStartDate = 201505160000,
	nEndDate  = 201506052400,
	tbMessageParam = {ITEM_TUI_NGUYEN_LIEU},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },		
	},
	tbActition =
	{			
		{"tbAwardTemplet:Give",{tbAward_TuiNguyenLieu,1,{EVENT_LOG_TITLE,"Use_TuiNguyenLieu"}} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "S� d�ng Item",
	nStartDate = 201505160000,
	nEndDate  = 201506052400,
	tbMessageParam = {ITEM_QUA_MUNG_SN},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_TUI_SN, MAX_USE_1000 , "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_TUI_SN, 1}},		
		{"tbAwardTemplet:Give",{tbAward_TuiQuaSinhNhat,1,{EVENT_LOG_TITLE,"SuDungTuiQuaSinhNhat"}} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "S� d�ng Item",
	nStartDate = 201505160000,
	nEndDate  = 201506052400,
	tbMessageParam = {ITEM_BANH_SN},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_BANH_SN, MAX_USE_1000 , "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_BANH_SN, 1}},		
		{"tbAwardTemplet:Give",{tbAward_BanhSinhNhat,1,{EVENT_LOG_TITLE,"SuDungBanhSinhNhat"}} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "nil",
	szName = "��i tho�i s� ki�n event m�ng sinh nh�t ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Th�i gian online t�ch l�y ���c 5 ph�t b�ng h�u s� nh�n ���c 1 <color=yellow>T�i Nguy�n Li�u<color>. L�u �: th�i gian t�ch l�y qua ng�y s� ���c t�nh l�i t� ��u."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"ThisActivity:ShowOnlineTime",	{} },
	},
}