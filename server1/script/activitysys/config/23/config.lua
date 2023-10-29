Include("\\script\\activitysys\\config\\23\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "FinishYesou",
	szName = "Trong ng�y �� ho�n th�nh 10 nhi�m v� D� T�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_YeSou,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang c�a b�n kh�ng c�n ch� tr�ng, ph�n th��ng l�n n�y kh�ng nh�n ���c"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Trong ng�y �� ho�n th�nh 10 nhi�m v� D� T�u"} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_YeSou,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "LeagueResult",
	szName = "Trong ng�y c� tr�n li�n ��u th�ng ��u ti�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {2,1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_LeagueMatch,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang c�a b�n kh�ng c�n ch� tr�ng, ph�n th��ng l�n n�y kh�ng nh�n ���c"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Trong ng�y c� tr�n li�n ��u th�ng ��u ti�n"} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_LeagueMatch,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "Trong ng�y l�n ��u ti�n ���c 3000 �i�m t�ch l�y T�ng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_SongJin,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang c�a b�n kh�ng c�n ch� tr�ng, ph�n th��ng l�n n�y kh�ng nh�n ���c"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Trong ng�y l�n ��u ti�n ���c 3000 �i�m t�ch l�y T�ng Kim"} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_SongJin,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "Trong ng�y l�n ��u ti�n ho�n th�nh t�n s� Phong Chi K�",
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
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "FinishFengLingDu",
	szName = "Trong ng�y l�n ��u ti�n ho�n th�nh Phong L�ng ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_FengLingDu,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang c�a b�n kh�ng c�n ch� tr�ng, ph�n th��ng l�n n�y kh�ng nh�n ���c"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Trong ng�y l�n ��u ti�n ho�n th�nh Phong L�ng ��"} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_FengLingDu,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "Trong ng�y gi�t ���c 3 con qu�i xanh ��u ti�n c�p 95",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNpcPower",	{2} },
		{"NpcFunLib:CheckNpcLevel",	{"95"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_LanGuai,3,"","<"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang c�a b�n kh�ng c�n ch� tr�ng, ph�n th��ng l�n n�y kh�ng nh�n ���c"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},1,"Trong ng�y gi�t ���c 3 con qu�i xanh ��u ti�n c�p 95"} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_LanGuai,1} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,1} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "Chuanguan",
	szName = "Trong ng�y ho�n th�nh 1 l�n v��t �i ��u ti�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28", 2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_ChuangGuan,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang c�a b�n kh�ng c�n ch� tr�ng, ph�n th��ng l�n n�y kh�ng nh�n ���c"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Trong ng�y ho�n th�nh 1 l�n v��t �i ��u ti�n"} },
	--	{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_ChuangGuan,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "ɱ������(����)",
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
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "�׵۱���(����)",
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
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "nil",
	szName = "��������(����)",
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
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "FinishCangBaoTu",
	szName = "Trong ng�y 3 l�n v��t �i T�ng B�o �� ��u ti�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_CangBaoTu,3,"","<"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang c�a b�n kh�ng c�n ch� tr�ng, ph�n th��ng l�n n�y kh�ng nh�n ���c"} },
	},
	tbActition = 
	{
	--	{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},1,"Trong ng�y 3 l�n v��t �i T�ng B�o �� ��u ti�n"} },
	--	{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_CangBaoTu,1} },
	--	{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,1} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "nil",
	szName = "ɱ��BOSS(����)",
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
	szMessageType = "ClickNpc",
	szName = "M�i ng�y l�n m�ng l�nh th��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L� Quan"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"Nh�n h�nh hi�p l�nh",14} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "nil",
	szName = "Nh�n h�nh hi�p l�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_GetEveryDay,0,"Ng��i �� nh�n r�i!","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,format("M�i ng�y ch� ���c nh�n nhi�u nh�t %d H�nh hi�p k�, h�m ng��i �� nh�n �� r�i, ng�y mai l�i ��n nh�.", 25),"<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang c�a b�n kh�ng c�n ch� tr�ng, ph�n th��ng l�n n�y kh�ng nh�n ���c"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"M�i ng�y l�n m�ng l�nh th��ng"} },
	--	{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_GetEveryDay,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
