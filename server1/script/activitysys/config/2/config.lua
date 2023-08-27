Include("\\script\\activitysys\\config\\2\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
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
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "OnClickNpc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"g Gi� Noel"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle", {"<npc>Gi竛g sinh  n, ch骳 c竎 i hi謕 c� m閠 m颽 gi竛g sinh vui v�. <enter>1. Trong th阨 gian di詎 ra ho箃 ng, m鏸 ng祔 v祇 l骳 19:00 - 24:00, c竎 v� i hi謕 c� th� n <color=yellow> Trng B筩h S琻 <color> thu th藀 C﹜ Gi竛g Sinh Nh� s� nh薾 頲 ph莕 thng. <enter>2. M鏸 ng祔 v祇 l骳 19:00 - 24:00, s� c� Tinh Linh Th竛h Фn ng蓇 nhi猲 xu蕋 hi謓 t筰 b猲 ngo礽 c竎 th祅h th� nh� Th祅h Й, Чi L�, Phng Tng, Dng Ch﹗. Ngi ch琲 c� th� i tho筰 v韎 C﹜ Gi竛g Sinh t筰 Trng B筩h S琻 жnh s� dc bi誸 i kh竔 v� tr� c馻 Tinh Linh Th竛h Хn xu蕋 hi謓. M鏸 l莕 xu蕋 hi謓, s� c� ph莕 thng cho 30 ngi t譵 頲 Tinh Linh Th竛h Фn nhanh nh蕋. C� 30 ph髏 Tinh Linh Th竛h Фn s� xu蕋 hi謓 1 l莕. <enter>3. Tuy誸 Nh﹏ Чi Chi課. Nh鱪g th玭g tin li猲 quan xin h穣 nh蕁 v祇 d遪g ch鋘 b猲 di."}},
		--{"AddDialogOpt", {"Giao n閜 K裲 Gi竛g Sinh", 4}},
		--{"AddDialogOpt", {"Giao n閜 T竜 Gi竛g Sinh", 5}},
		{"AddDialogOpt", {"Tuy誸 Nh﹏ Чi Chi課", 10}},
	},
}
tbConfig[3] = --一个细节
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
tbConfig[4] = --一个细节
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
		{"PlayerFunLib:CheckItemInBag", {ITEM_CHRISTMAS_CANDY, 1, "Ngi kh玭g c� K裲 Gi竛g Sinh"}},
		{"PlayerFunLib:CheckTaskDaily", {TSK_CANDY_LIMIT, MAX_CANDY, "H玬 nay ngi  giao n閜 s� lng t n gi韎 h筺.", "<"}},
		{"PlayerFunLib:CheckFreeBagCell", {1, "default"}},
		
	},
	tbActition = 
	{
		--{"PlayerFunLib:ConsumeEquiproomItem", {ITEM_CHRISTMAS_CANDY, 1}},
		--{"PlayerFunLib:AddTaskDaily", {TSK_CANDY_LIMIT, 1,}},
		--{"PlayerFunLib:GetItem", {tbCandyAward, 1, EVENT_LOG_TITLE, "hand_in_Christmas_candy"}},
	},
}
tbConfig[5] = --一个细节
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
		{"PlayerFunLib:CheckItemInBag", {ITEM_CHRISTMAS_APPLE, 1, "Ngi kh玭g c� T竜 Gi竛g Sinh"}},
		{"PlayerFunLib:CheckFreeBagCell", {1, "default"}},
		
	},
	tbActition = 
	{
		--{"PlayerFunLib:ConsumeEquiproomItem", {ITEM_CHRISTMAS_APPLE, 1}},
		--{"PlayerFunLib:GetItem", {tbAppleAward, 1, EVENT_LOG_TITLE, "hand_in_Christmas_apple"}},
	},
}
tbConfig[6] = --一个细节
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
tbConfig[7] = --一个细节
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
tbConfig[8] = --一个细节
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
tbConfig[9] = --一个细节
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
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Чi hi謕 c� th� nh薾 Tuy誸 C莡 t筰 y, s� d鬾g Tuy誸 C莡 s� l祄 cho nh鱪g ngi ch琲 kh竎 bi課 th祅h Ngi Tuy誸, ngi s� d鬾g s� nh薾 頲 ph莕 thng. M鏸 ng祔 v祇 l骳 10:15, 12:15, 20:35, 22:15 c� th� n t筰 y  tham gia Tuy誸 Nh﹏ Чi Chi課, c竎 i hi謕 tham gia Tuy誸 Nh﹏ Чi Chi課 u ph秈 b� n衜 tr髇g Tuy誸 C莡 trc, khi ngi ch琲 tham gia Tuy誸 Nh﹏ Чi Chi課 ch� c� th� t蕁 c玭g nh鱪g Ngi Tuy誸 v� g Gi� Noel c� m祏 s綾 kh玭g gi鑞g v韎 b秐 th﹏. Sau khi k誸 th骳, c竎 i hi謕 c� th� i tho筰 v韎 ta  nh薾 ph莕 thng. M鏸 v� i hi謕 m鏸 ng祔 nhi襲 nh蕋 ch� tham gia 頲 2 l莕.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt", {"Nh薾 Tuy誸 C莡", 11}},
		{"AddDialogOpt", {"Tr筺g th竔 bi課 th祅h Ngi Tuy誸", 6}},
		{"AddDialogOpt", {"Kh玦 ph鬰 nguy猲 tr筺g", 7}},
		{"AddDialogOpt", {"Tham gia Tuy誸 Nh﹏ Чi Chi課", 9}},
		{"AddDialogOpt", {"Nh薾 l穘h ph莕 thng", 8}},		
	},
}
tbConfig[11] = --一个细节
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
		{"ThisActivity:CheckTaskDaily", {TSK_GET_SNOW_BALL, 1, "H玬 nay ngi  nh薾 Tuy誸 C莡 r錳.", "<"}},
		{"PlayerFunLib:CheckFreeBagCell", {1, "default"}},
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily", {TSK_GET_SNOW_BALL, 1}},
		{"PlayerFunLib:GetItem", {ITEM_SNOW_BALL, 20, EVENT_LOG_TITLE, "GetSnowBall"}},
	},
}
tbConfig[12] = --一个细节
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
tbConfig[13] = --一个细节
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
tbConfig[14] = --一个细节
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
