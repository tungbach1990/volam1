Include("\\vng_script\\activitysys\\config\\1032_questdaily\\extend.lua")
Include("\\script\\lib\\log.lua")

tbConfig = {}

tbConfig[1] = --��nh qu�i
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t qu�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckInMapQuestDaily",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:AddNumKillNPC",	{nil} },
	},
}
tbConfig[2] = 
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_LB_NANGDONG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_LB_NANG_DONG, MAX_USE_LB, "M�i ng�y ch� s� d�ng ���c 2 l�n.", "<"}},	
	},
	tbActition = 
	{			
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_LB_NANG_DONG, 1}},
		{"tbLog:PlayerActionLog",{EVENT_LOG_TITLE,"USE_ITEM_LB_NANGDONG"}}	,
		{"Talk",{1,"","S� d�ng L�nh b�i n�ng ��ng t�ng gi�i h�n nhi�m v� h�ng ng�y th�m 10 nhi�m v�."}},
		{"Msg2Player",{"S� d�ng L�nh B�i N�ng ��ng th�nh c�ng."}},
	},
}
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "S� d�ng ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_HOAN_THANH_NHIEM_VU},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {TASK_INFO_QUEST, 1, "Ch�a nh�n nhi�m v� kh�ng th� s� d�ng.", "=="}},	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {TASK_INFO_QUEST, 2, "�� ho�n th�nh nhi�m v�, s� d�ng s� b� l�ng ph�.", "<= "}},	
	},
	tbActition = 
	{			
		{"tbVNG_BitTask_Lib:setBitTask", {TASK_INFO_QUEST, 2}},
		{"tbLog:PlayerActionLog",{EVENT_LOG_TITLE,"USE_ITEM_HOAN_THANH_NHIEM_VU"}}	,
		{"Talk",{1,"","Ho�n th�nh nhi�m v� ���c giao, nhanh ch�ng v� nh�n th��ng.."}},
		{"Msg2Player",{"Ho�n th�nh nhi�m v� ���c giao."}},
	},
}
