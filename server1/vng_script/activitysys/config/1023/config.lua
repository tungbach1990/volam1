Include("\\vng_script\\activitysys\\config\\1023\\extend.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "server start",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{			
		{"ThisActivity:Init",	{nil} },
	},
}
--use item
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "S� d�ng Item",
	nStartDate = 201504210000,
	nEndDate  = 201505142400,
	tbMessageParam = {ITEM_RUONGTHANBI},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph�i c� �t nh�t 5 � tr�ng m�i c� th� nh�n th��ng."} },			
		{"ThisActivity:UseRuongTB",{nil }},		
	},
	tbActition =
	{			
		
	},
}
