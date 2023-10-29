Include("\\vng_script\\activitysys\\config\\1031\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1031\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1031\\awardlist.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")

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
		{"ThisActivity:OnServerStart", {}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "ChiHang",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {" "},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition =
	{	
		{"SetDialogTitle",	{"<npc>N�m nay l� h�i Trung Thu c� ch� H�ng gi�ng tr�n, hi�n di�n �� ��n tr�ng r�m c�ng c�c ��ng ��o to�n c�i v� l�m v�i nhi�u ho�t ��ng s�i n�i t� <color=yellow>09/09/2015 - 23/09/2015<color>."} },	
		{"AddDialogOpt",	{"Thu th�p l�ng ��n",3} },		
		{"AddDialogOpt",	{"��i b�nh trung thu Minh Nguy�t",4} },		
		{"AddDialogOpt",	{"��i b�nh trung thu Vi�n Nguy�t",5} },			
		{"AddDialogOpt",	{"Nh�n ph�n th��ng m�c s� d�ng b�nh trung thu Vi�n nguy�t",6} },	
		{"AddDialogOpt",	{"Nh�n ph�n th��ng m�c s� d�ng b�nh trung thu Ho�ng nguy�t",7} },	
	},
}

tbConfig[3] =
{
	nId = 3,
	szMessageType = "nil",
	szName = "Thu Thap Long Den",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },				
	},
	
	tbActition =
	{
		{"ThisActivity:ThuThapLongDen",	{} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "��i v�t ph�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BANH_TT_MINHNGUYET.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },		
		{"AddOneMaterial",	{ITEM_LD_NGOISAO.szName,ITEM_LD_NGOISAO,1} },		
		{"AddOneMaterial",	{ITEM_LD_ONG.szName,ITEM_LD_ONG,1} },
		{"AddOneMaterial",	{ITEM_LD_TRON.szName,ITEM_LD_TRON,1} },
		{"AddOneMaterial",	{ITEM_LD_CACHEP.szName,ITEM_LD_CACHEP,1} },
	},
	
	tbActition =
	{
		{"PlayerFunLib:GetItem",	{ITEM_BANH_TT_MINHNGUYET,1,EVENT_LOG_TITLE,"Doi_ITEM_BANH_TT_MINHNGUYET"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "��i v�t ph�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BANH_TT_VIENNGUYET.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"��ng c�p c�a ng��i kh�ng ��, h�y luy�n t�p th�m!",">="} },		
		{"AddOneMaterial",	{ITEM_LD_NGOISAO.szName,ITEM_LD_NGOISAO,1} },		
		{"AddOneMaterial",	{ITEM_LD_ONG.szName,ITEM_LD_ONG,1} },
		{"AddOneMaterial",	{ITEM_LD_TRON.szName,ITEM_LD_TRON,1} },
		{"AddOneMaterial",	{ITEM_LD_BUOM_BUOM.szName,ITEM_LD_BUOM_BUOM,1} },		
	},
	
	tbActition =
	{
		{"PlayerFunLib:GetItem",	{ITEM_BANH_TT_VIENNGUYET,1,EVENT_LOG_TITLE,"Doi_ITEM_BANH_TT_VIENNGUYET"} },
	},
}
--nhan thuong moc

tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "��i tho�i s� ki�n mini event th�ng 9",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ng h�u �� s� d�ng B�nh Trung Thu Vi�n Nguy�t : <color=yellow><lua GetBitTask(2708, 13, 10) /><color> c�i."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta �� s� d�ng h�n  500 B�nh Trung Thu Vi�n Nguy�t",8} },
		{"AddDialogOpt",	{"Ta �� s� d�ng ���c 1000  B�nh Trung Thu Vi�n Nguy�t",9} },		
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "��i tho�i s� ki�n mini event th�ng 9",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ng h�u �� s� d�ng B�nh Trung Thu Vi�n Nguy�t : <color=yellow><lua GetBitTask(2709, 0, 12) /><color> c�i."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta �� s� d�ng h�n  500 B�nh Trung Thu Ho�ng Nguy�t",10} },
		{"AddDialogOpt",	{"Ta �� s� d�ng ���c 1000  B�nh Trung Thu Ho�ng Nguy�t",11} },		
	},
}

---phan thuong moc
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
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_500_BTT_VienNguyet, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_VienNguyet, MOC_500, "B�n ch�a d�ng �� 500 c�i.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_500_BTT_VienNguyet, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VienNguyet["500"],1,{EVENT_LOG_TITLE,"PT_Moc500_BTT_VienNguyet"}} },
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
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_BTT_VienNguyet, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_VienNguyet, MOC_1000, "B�n ch�a d�ng �� 1000 c�i.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_BTT_VienNguyet, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VienNguyet["1000"],1,{EVENT_LOG_TITLE,"PT_Moc1000_BTT_VienNguyet"}} },
	},
}

---Nhan thuong moc su dung
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
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_500_BTT_HoangNguyet, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_HoangNguyet, MOC_500, "B�n ch�a d�ng �� 500 c�i.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_500_BTT_HoangNguyet, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_HoangNguyet["500"],1,{EVENT_LOG_TITLE,"PhanThuongMoc500_BTT_HoangNguyet"}} },
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
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_BTT_HoangNguyet, 1, "B�ng h�u �� nh�n th��ng r�i", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_HoangNguyet, MOC_1000, "B�n ch�a d�ng �� 1000 c�i.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_BTT_HoangNguyet, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_HoangNguyet["1000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1000_BTT_HoangNguyet"}} },
	},
}

--Su dung Item
tbConfig[12] = 
{
	nId = 12,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = 201509100000,
	nEndDate  = 201509242400,
	tbMessageParam = {ITEM_BANH_TT_MINHNGUYET},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_MinhNguyet, MOC_2000, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BTT_MinhNguyet, 1}},
		{"tbAwardTemplet:Give",{tbAward_Use_MinhNguyet,1,{EVENT_LOG_TITLE,"Use_BTT_MinhNguyet"}} },
	},
}
tbConfig[13] = 
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = 201509100000,
	nEndDate  = 201509242400,
	tbMessageParam = {ITEM_BANH_TT_VIENNGUYET},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_VienNguyet, MOC_1000, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BTT_VienNguyet, 1}},
		{"tbAwardTemplet:Give",{tbAward_Use_VienNguyet,1,{EVENT_LOG_TITLE,"Use_BTT_VienNguyet"}} },
	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = 201509100000,
	nEndDate  = 201509242400,
	tbMessageParam = {ITEM_BANH_TT_HOANGNGUYET},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_HoangNguyet, MOC_1000, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BTT_HoangNguyet, 1}},
		{"tbAwardTemplet:Give",{tbAward_Use_HoangNguyet,1,{EVENT_LOG_TITLE,"Use_BTT_HoangNguyet"}} },
	},
}
tbConfig[15] = 
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = 201509100000,
	nEndDate  = 201509242400,
	tbMessageParam = {ITEM_HOP_LD_BUOMBUOM},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph�i c� �t nh�t 5 � tr�ng m�i c� th� s� d�ng."} },			
		
	},
	tbActition = 
	{			
		{"tbAwardTemplet:Give",{tbAward_HopLDBuomBuom,1,{EVENT_LOG_TITLE,"Use_HOP_LD_BUOMBUOM"}} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = 201509100000,
	nEndDate  = 201509242400,
	tbMessageParam = {ITEM_HOP_LD_KEOQUAN},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,2,1,"default"} },
		
	},
	tbActition = 
	{			
		{"tbAwardTemplet:Give",{tbAward_HopLDKeoQuan,1,{EVENT_LOG_TITLE,"Use_HOP_LD_KEOQUAN"}} },
	},
}
