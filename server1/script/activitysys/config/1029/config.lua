Include("\\script\\activitysys\\config\\1029\\variables.lua")
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
		{"ThisActivity:ServerStart",	{} },
	},
}

tbConfig[2] = 
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th�ng Cu�i "},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Trung Thu, ng��i nguy�t �o�n vi�n. T�t Trung Thu l�i ��n, ta ch�c c�c v� hi�p s� h�p gia hoan t� l�c �o�n vi�n! Trong th�i gian di�n ra ho�t ��ng, c�c v� ��i hi�p c� th� tham gia hai ho�t ��ng Th��ng Nguy�t �o�n Vi�n v� Th� Ti�n K�t Duy�n."}},
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng",	3} },
		{"AddDialogOpt",	{"Ta mu�n gh�p b�nh Trung Thu  ��u xanh",	10} },
		{"AddDialogOpt",	{"Ta mu�n th�ng c�p b�nh Trung Thu h�t sen",	11} },
		{"AddDialogOpt",	{"Ta mu�n th�ng c�p b�nh Trung Thu g� n��ng ",	12} },
		{"AddDialogOpt",	{"Ta mu�n mua ��u xanh ",	6} },
	},
}

tbConfig[3] = 
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Ho�t ��ng l�n n�y c� Th��ng Nguy�t �o�n Vi�n v� Th� Ti�n K�t Duy�n, hi�p s� mu�n tham gia ho�t ��ng n�o?"},
	tbCondition = 
	{
	},
	tbActition = {
		{"AddDialogOpt",	{"Th��ng Nguy�t �o�n Vi�n ",	4} },
		{"AddDialogOpt",	{"Th� Ti�n K�t Duy�n ",	5} },
	},
}

tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Trong th�i gian di�n ra ho�t ��ng, hi�p s� ��n b�n �� c�p 5x ��nh qu�i s� c� m�t l��ng b�t m�, ���ng tr�ng v� tr�ng r�i ra, NPC Th�ng Cu�i b�n ��u xanh, s� d�ng 5 t�i ���ng tr�ng, 5 t�i b�t m�, 5 qu� tr�ng v� 1 t�i ��u xanh, c� th� ��n ch� NPC Th�ng Cu�i gh�p b�nh Trung Thu ��u xanh, s� d�ng b�nh Trung Thu ��u xanh c� th� nh�n th��ng. C� th� � ch� NPC Th�ng Cu�i s� d�ng 3 b�nh Trung Thu ��u xanh �� th�ng c�p th�nh b�nh Trung Thu h�t sen, s� d�ng 3 b�nh Trung Thu h�t sen th�ng c�p th�nh b�nh Trung Thu g� n��ng, s� d�ng b�nh Trung Thu h�t sen c� th� nh�n ���c ph�n th��ng h�p d�n, s� d�ng b�nh Trung Thu g� n��ng c� th� nh�n ���c ph�n th��ng c� gi� tr�. Th�ng c�p c� x�c su�t th�t b�i, c�c hi�p s� ph�i c�n th�n. "},
	tbCondition = 
	{
	},
	tbActition =
	{
	},
}

tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> T�t Trung Thu, Th� Ng�c kh�ng ch�u n�i c� ��n ��n nh�n gian h��ng l�c c�ng m�i ng��i. M�i ng�y t� 12:00 ��n 24:00, V� L�m kh�p n�i ��u c� kh� n�ng xu�t hi�n Th� Ng�c, c� th� � tr�n ���ng L�m An, c�ng c� th� � b�n c� ��o hoang v�ng ngo�i r�ng, ho�c c�ng th� l� m�t n�i n�o �� � m�t tr�n nh�...N�u hi�p s� c� duy�n tr�n ���ng g�p ���c Th� Ng�c Ti�n T�, c� th� n�i chuy�n, ch� c�n tr� l�i ch�nh x�c m�t c�u h�i nh�, s� nh�n ���c qu� c�a Th� Ng�c Ti�n T� ho�c 1 gi� hi�u qu� Tuy�t Th� D�ch Vi�n. Tr� l�i ch�nh x�c c�u h�i xong, Th� Ng�c Ti�n T� l�p t�c bi�n m�t, kh�ng l�u sau c� �y s� xu�t hi�n � m�t n�i kh�c, ti�p t�c ��i ng��i c� duy�n. "},
	tbCondition = 
	{
	},
	tbActition = {
	},
}

tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Mua ��u xanh ",1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{"Ng�n l��ng",		{nJxb=5000},	1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM.LvDou, 1, pActivity.EVENT_LOG_TITLE, "Goumailvdou"} },
	},
}

tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"70"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["7xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn7xMap"} },
	},
}

tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"80"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["8xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn8xMap"} },
	},
}

tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["9xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn9xMap"} },
	},
}

tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {pActivity.ITEM.LvDouMoonCake.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{pActivity.ITEM.Tang.szName,	{tbProp = pActivity.ITEM.Tang.tbProp},	5} },
		{"AddOneMaterial",	{pActivity.ITEM.Fen.szName,		{tbProp = pActivity.ITEM.Fen.tbProp},	5} },
		{"AddOneMaterial",	{pActivity.ITEM.Egg.szName,		{tbProp = pActivity.ITEM.Egg.tbProp},	5} },
		{"AddOneMaterial",	{pActivity.ITEM.LvDou.szName,	{tbProp = pActivity.ITEM.LvDou.tbProp},	1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["CompseLvDouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Hechenglvdouyuebing"} },
	},
}

tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {pActivity.ITEM.LianZiMoonCake.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{pActivity.ITEM.LvDouMoonCake.szName,	{tbProp = pActivity.ITEM.LvDouMoonCake.tbProp},	3} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["CompseLianZiMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Shengjilianziyuebing"} },
	},
}

tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {pActivity.ITEM.JiRouMoonCake.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{pActivity.ITEM.LianZiMoonCake.szName,	{tbProp = pActivity.ITEM.LianZiMoonCake.tbProp},	3} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["CompseJiRouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Shengjikaojiyuebing"} },
	},
}

tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "LvDouMoonCake",
	nStartDate = pActivity.nStartDate,
	nEndDate  = pActivity.nEndDate,
	tbMessageParam = {pActivity.ITEM.LvDouMoonCake},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL, "default", ">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{pActivity.TASK.LvDouMoonCake, pActivity.MaxLvDouMoonCake, "�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.LvDouMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseLvDouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvlvdouyuebingjiangli"} },
	},
}

tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "LianZiMoonCake",
	nStartDate = pActivity.nStartDate,
	nEndDate  = pActivity.nEndDate,
	tbMessageParam = {pActivity.ITEM.LianZiMoonCake},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL, "default", ">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{pActivity.TASK.LianZiMoonCake, pActivity.MaxLianZiMoonCake, "�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.LianZiMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseLianZiMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvlianziyuebingjiangli"} },
	},
}

tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "JiRouMoonCake",
	nStartDate = pActivity.nStartDate,
	nEndDate  = pActivity.nEndDate,
	tbMessageParam = {pActivity.ITEM.JiRouMoonCake},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL, "default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{pActivity.TASK.JiRouMoonCake, pActivity.MaxJiRouMoonCake, "�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.JiRouMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseJiRouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvkaojiyuebingjiangli"} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"50"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["5xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn5xMap"} },
	},
}

tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"60"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["6xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn6xMap"} },
	},
}