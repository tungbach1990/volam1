Include("\\vng_script\\activitysys\\config\\1028\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1028\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1028\\awardlist.lua")

tbConfig = {}

tbConfig[1] =
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "S� Gi� Trao Th��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"S� Gi� Trao Th��ng"},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
	},
	tbActition =
	{	
		--{"AddDialogOpt",	{"Nh�n th��ng Code V� l�m plus.",2} },		
		--{"AddDialogOpt",	{"Nh�n th��ng Code Thay ��i m�t kh�u.",3} },		
	},
}

tbConfig[2] = 
{
	nId = 2,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng VL Plus ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckFreeBagCell",{10,"Ph�i c� �t nh�t 10 � tr�ng m�i c� th� nh�n th��ng."} },			
		{"ThisActivity:CheckExtPointValue", {EXT_POINT_CODE_VL_PLUS}},	
	},
	tbActition =
	{		
		{"ThisActivity:SetBitExPoint_Success",{EXT_POINT_CODE_VL_PLUS}},
		{"tbAwardTemplet:Give",{tbAward_VLPlus,1,{EVENT_LOG_TITLE,"NhanThuong_CodeVLPlus"}} },
	},
}
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng Change Pass",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckFreeBagCell",{15,"Ph�i c� �t nh�t 15 � tr�ng m�i c� th� nh�n th��ng."} },			
		{"ThisActivity:CheckExtPointValue", {EXT_POINT_CODE_CHANGE_PASS}},	
	},
	tbActition =
	{		
		{"ThisActivity:SetBitExPoint_Success",{EXT_POINT_CODE_CHANGE_PASS}},
		{"tbAwardTemplet:Give",{tbAward_ChangePass,1,{EVENT_LOG_TITLE,"NhanThuong_CodeChangePass"}} },
	},
}