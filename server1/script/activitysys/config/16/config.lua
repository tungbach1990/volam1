

-------�ֲ��������� ��ʼ---------
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ItemScript",
	szName = "S� d�ng r��ng ��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2319,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{67,1,"Th� Luy�n ���ng"} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "S� d�ng r��ng m�c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2318,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{66,1,"Th� Luy�n ���ng"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "S� d�ng r��ng b�c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2320,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{68,1,"Th� Luy�n ���ng"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "ItemScript",
	szName = "S� d�ng r��ng ho�ng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2321,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{69,1,"Th� Luy�n ���ng"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "ItemScript",
	szName = "S� d�ng r��ng b�ch kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2322,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{70,1,"Th� Luy�n ���ng"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "ClickNpc",
	szName = "C�u h�i hoa ��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hoa ��ng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Tham gia �o�n Hoa ��ng",7} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "Tham gia �o�n Hoa ��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"Ch� c� C�p 50 (bao g�m c�p 50) ho�c nh�n v�t �� chuy�n sinh m�i c� th� tham gia �o�n hoa ��ng",">="} },
	},
	tbActition = 
	{
		{"tbRiddle:Show",	{"huadeng.txt",3,"","Ch�c m�ng ��i hi�p �� tr� l�i ��ng c�u h�i","tbJiaoShi2009:Award","","tbJiaoShi2009:WrongAnswer",0} },
	},
}
