Include("\\script\\activitysys\\config\\2\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "CreateBigTree",
	nStartDate = 201212170000,
	nEndDate  = 201301010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddObjNpc",	{BIG_TREE_NAME,BIG_TREE_ID,BIG_TREE_POS,BIG_TREE_SCRIPT} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "OnClickNpc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�ng Gi� Noel"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle", {"<npc>Gi�ng sinh �� ��n, ch�c c�c ��i hi�p c� m�t m�a gi�ng sinh vui v�. <enter>1. Trong th�i gian di�n ra ho�t ��ng, m�i ng�y v�o l�c 19:00 - 24:00, c�c v� ��i hi�p c� th� ��n <color=yellow> Tr��ng B�ch S�n <color> thu th�p C�y Gi�ng Sinh Nh� s� nh�n ���c ph�n th��ng. <enter>2. M�i ng�y v�o l�c 19:00 - 24:00, s� c� Tinh Linh Th�nh ��n ng�u nhi�n xu�t hi�n t�i b�n ngo�i c�c th�nh th� nh� Th�nh ��, ��i L�, Ph��ng T��ng, D��ng Ch�u. Ng��i ch�i c� th� ��i tho�i v�i C�y Gi�ng Sinh t�i Tr��ng B�ch S�n ��nh s� d��c bi�t ��i kh�i v� tr� c�a Tinh Linh Th�nh ��n xu�t hi�n. M�i l�n xu�t hi�n, s� c� ph�n th��ng cho 30 ng��i t�m ���c Tinh Linh Th�nh ��n nhanh nh�t. C� 30 ph�t Tinh Linh Th�nh ��n s� xu�t hi�n 1 l�n. <enter>3. Tuy�t Nh�n ��i Chi�n. Nh�ng th�ng tin li�n quan xin h�y nh�n v�o d�ng ch�n b�n d��i."}},
		--{"AddDialogOpt", {"Giao n�p K�o Gi�ng Sinh", 4}},
		--{"AddDialogOpt", {"Giao n�p T�o Gi�ng Sinh", 5}},
		{"AddDialogOpt", {"Tuy�t Nh�n ��i Chi�n", 10}},
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "ServerStart",
	szName = "creatSanta",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitAddNpc",	{nil} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "hand in Christmas candy",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
		{"PlayerFunLib:CheckItemInBag", {ITEM_CHRISTMAS_CANDY, 1, "Ng��i kh�ng c� K�o Gi�ng Sinh"}},
		{"PlayerFunLib:CheckTaskDaily", {TSK_CANDY_LIMIT, MAX_CANDY, "H�m nay ng��i �� giao n�p s� l��ng ��t ��n gi�i h�n.", "<"}},
		{"PlayerFunLib:CheckFreeBagCell", {1, "default"}},
		
	},
	tbActition = 
	{
		--{"PlayerFunLib:ConsumeEquiproomItem", {ITEM_CHRISTMAS_CANDY, 1}},
		--{"PlayerFunLib:AddTaskDaily", {TSK_CANDY_LIMIT, 1,}},
		--{"PlayerFunLib:GetItem", {tbCandyAward, 1, EVENT_LOG_TITLE, "hand_in_Christmas_candy"}},
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "hand in Christmas apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
		{"PlayerFunLib:CheckItemInBag", {ITEM_CHRISTMAS_APPLE, 1, "Ng��i kh�ng c� T�o Gi�ng Sinh"}},
		{"PlayerFunLib:CheckFreeBagCell", {1, "default"}},
		
	},
	tbActition = 
	{
		--{"PlayerFunLib:ConsumeEquiproomItem", {ITEM_CHRISTMAS_APPLE, 1}},
		--{"PlayerFunLib:GetItem", {tbAppleAward, 1, EVENT_LOG_TITLE, "hand_in_Christmas_apple"}},
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "to snowman",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
	},
	tbActition = 
	{
		{"ThisActivity:SB_ChangeToSnowman",	{} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "to human",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
	},
	tbActition = 
	{
		{"ThisActivity:SB_RestoreToHuwman",	{} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "get award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
	},
	tbActition = 
	{
		{"ThisActivity:SB_GetAward",	{0} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "join battle",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
	},
	tbActition = 
	{
		{"ThisActivity:SB_AskForEnter",	{} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��i hi�p c� th� nh�n Tuy�t C�u t�i ��y, s� d�ng Tuy�t C�u s� l�m cho nh�ng ng��i ch�i kh�c bi�n th�nh Ng��i Tuy�t, ng��i s� d�ng s� nh�n ���c ph�n th��ng. M�i ng�y v�o l�c 10:15, 12:15, 20:35, 22:15 c� th� ��n t�i ��y �� tham gia Tuy�t Nh�n ��i Chi�n, c�c ��i hi�p tham gia Tuy�t Nh�n ��i Chi�n ��u ph�i b� n�m tr�ng Tuy�t C�u tr��c, khi ng��i ch�i tham gia Tuy�t Nh�n ��i Chi�n ch� c� th� t�n c�ng nh�ng Ng��i Tuy�t v� �ng Gi� Noel c� m�u s�c kh�ng gi�ng v�i b�n th�n. Sau khi k�t th�c, c�c ��i hi�p c� th� ��i tho�i v�i ta �� nh�n ph�n th��ng. M�i v� ��i hi�p m�i ng�y nhi�u nh�t ch� tham gia ���c 2 l�n.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt", {"Nh�n Tuy�t C�u", 11}},
		{"AddDialogOpt", {"Tr�ng th�i bi�n th�nh Ng��i Tuy�t", 6}},
		{"AddDialogOpt", {"Kh�i ph�c nguy�n tr�ng", 7}},
		{"AddDialogOpt", {"Tham gia Tuy�t Nh�n ��i Chi�n", 9}},
		{"AddDialogOpt", {"Nh�n l�nh ph�n th��ng", 8}},		
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "nil",
	szName = "GetSnowBall",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--ITEM_SNOW_BALL
		{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
		{"ThisActivity:CheckTaskDaily", {TSK_GET_SNOW_BALL, 1, "H�m nay ng��i �� nh�n Tuy�t C�u r�i.", "<"}},
		{"PlayerFunLib:CheckFreeBagCell", {1, "default"}},
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily", {TSK_GET_SNOW_BALL, 1}},
		{"PlayerFunLib:GetItem", {ITEM_SNOW_BALL, 20, EVENT_LOG_TITLE, "GetSnowBall"}},
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
