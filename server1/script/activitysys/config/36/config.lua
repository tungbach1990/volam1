tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "Chuanguan",
	szName = "����28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"shijiandetiaozhan"} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "�ν���ֳ���1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"songjin"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CaiJiHuiHuangZhiGuo",
	szName = "Nh�t qu� huy ho�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"huihuangzhiguo"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "YDBZguoguan",
	szName = "�׵۱��ش���10��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"yandibaozang"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "FinishMail",
	szName = "Nhi�m v� T�n S� ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,3},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"xinshirenwu"} },
	},
}
