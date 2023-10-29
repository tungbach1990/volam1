Include("\\vng_script\\activitysys\\config\\1026\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1026\\awardlist.lua")
Include("\\vng_script\\activitysys\\config\\1026\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1026\\sale_item_event.lua")
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
	tbMessageParam = {"Th�m V�n Tam"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"",">="} },		
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"G�i v� r�t Ng�c l�c b�o",2} },	
		{"AddDialogOpt",	{"Trao ��i v�t ph�m qu� hi�m",3} },			
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "��i tho�i Tham Van Tam",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>Ng�c L�c B�o<color> l� th� duy nh�t ta mu�n.\n Ta nh�n k� g�i gi� gi�p Ng�c L�c B�o cho m�i ng��i.\n	Ng��i �� k� g�i: <color=yellow><lua GetTask(2783) /><color>  Ng�c L�c B�o" },
	tbCondition = 
	{
	},
	tbActition = 
	{			
		{"AddDialogOpt",	{"Ta mu�n g�i Ng�c l�c b�o",4} },
		{"AddDialogOpt",	{"Ta mu�n r�t 250 Ng�c l�c b�o",5} },			
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "��i tho�i Tham Van Tam",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>Ng�c L�c B�o<color> l� th� duy nh�t ta mu�n. Ng��i h�y mang ��n ��y cho ta, ta s� c� nhi�u th� qu� b�u trao ��i.\n	Ng��i �� k� g�i: <color=yellow><lua GetTask(2783) /><color>  Ng�c L�c B�o" },
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Trao ��i Ng�c l�c b�o l�y v�t ph�m",9} },
		{"AddDialogOpt",	{"Trao ��i Ng�c l�c b�o l�y trang b� qu�",7} },
		{"AddDialogOpt",	{"Xem b� m�t h�ng h�a c�a Th�m V�n Tam",8} },
	},
}
--ky gui ngoc luc bao
tbConfig[4] =
{
	nId = 4,
	szMessageType = "nil",
	szName = "K� g�i Ng�c L�c B�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },		
		{"ThisActivity:CheckSaving_Item",	{} },	
	},	
	tbActition =
	{
		{"ThisActivity:Add_Num_Saving_Item",	{} },	
	},
}
--Rut Ngoc Luc Bao
tbConfig[5] =
{
	nId = 5,
	szMessageType = "nil",
	szName = "R�t Ng�c L�c B�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ng�c L�c B�o",1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },
		{"ThisActivity:CheckWithdraw_Item",	{} },
	},	
	tbActition =
	{
		--{"ThisActivity:Withdraw_Item",	{} },
	},
}

--doi NLB l�y v�t ph�m th��ng
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "nil",
	szName = "��i v�t ph�m th��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },	
		{"ThisActivity:CheckSaleDate", {} },
	},
	tbActition =
	{			
		{"ThisActivity:SaleItemDailyDialog", {1} },
	},
}
--doi NLB l�y v�t ph�m qu�
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "nil",
	szName = "��i v�t ph�m qu�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },	
		{"ThisActivity:CheckSaleDate", {} },
	},
	tbActition =
	{			
		{"ThisActivity:SaleDialog", {} },
	},
}
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "nil",
	szName = "Xem danh s�ch b�n h�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{			
		{"ThisActivity:CheckSaleDate", {} },
	},
	tbActition =
	{			
		{"ThisActivity:ShowPlanSale", {} },
	},
}
--update them dong doi item event t8 Vu Lan trong shop NLB
tbConfig[9] =
{
	nId = 9,
	szMessageType = "CreateDialog",
	szName = "��i tho�i Tham Van Tam",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Ng��i mu�n d�ng <color=yellow>Ng�c L�c B�o<color> �� trao ��i g�?" },
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Trao ��i Ng�c l�c b�o l�y v�t ph�m",6} },
		{"AddDialogOpt",	{"Trao ��i Ng�c l�c b�o l�y V� Danh H�n Th�ch",10} },		
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "nil",
	szName = "��i v�t ph�m V� Danh H�n Th�ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckTask",	{TASK_SAVE_SL_NGOCLUCBAO,NLB_VODANH,"S� Ng�c l�c b�o kh�ng ��, c�n 50000 Ng�c L�c B�o �� ��i 1 V� Danh H�n Th�ch",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"nomsg"} },
	},
	tbActition =
	{			
		{"PlayerFunLib:AddTask",{TASK_SAVE_SL_NGOCLUCBAO, - NLB_VODANH }},
		{"PlayerFunLib:GetItem",	{ITEM_VODANH_HONTHACH,1,EVENT_LOG_TITLE,"DoiVoDanhHonThach_ThanhCong"} },	
	},
}