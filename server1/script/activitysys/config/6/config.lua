

-------�ֲ��������� ��ʼ---------
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "B�n th�ng t�ng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {1,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTaskDaily",	{1926,0,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{"5000000*(mod(GetTask(1926),256)+1)",0,"sonjin"} },
		{"ThisActivity:ExecActivityDetail",	{4} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "B�n thua t�ng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"-1",3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTaskDaily",	{1926,0,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{"3000000*(mod(GetTask(1926),256)+1)",0,"sonjin"} },
		{"ThisActivity:ExecActivityDetail",	{4} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "B�n h�a t�ng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {0,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTaskDaily",	{1926,0,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{"4000000*(mod(GetTask(1926),256)+1)",0,"sonjin"} },
		{"ThisActivity:ExecActivityDetail",	{4} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "��t s� l�n T�ng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{1926,3,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{1926,1} },
	},
}
