tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "B�m v�o long nhi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B� Long"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n ��i phi phong",2} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "Ta mu�n ��i phi phong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Ch� c� ��i hi�p danh ti�ng l�y l�ng, m�i x�ng ��ng nh�n ���c phi phong tuy�t ��p c�a ta, ��i hi�p ng�i mu�n chon lo�i n�o?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Phi phong L�ng V�n",4} },
		{"AddDialogOpt",	{"Phi phong Tuy�t Th�",5} },
		{"AddDialogOpt",	{"Phi phong Ph� Qu�n",6} },
		{"AddDialogOpt",	{"Phi phong Ng�o Tuy�t",10} },
		{"AddDialogOpt",	{"Phi phong Kinh L�i",11} },
		{"AddDialogOpt",	{"Trang k� ",3} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Ta mu�n ��i phi phong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Ch� c� ��i hi�p danh ti�ng l�y l�ng, m�i x�ng ��ng nh�n ���c phi phong tuy�t ��p c�a ta, ��i hi�p ng�i mu�n chon lo�i n�o?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Phi phong Ng� Phong",12} },
		{"AddDialogOpt",	{"Trang tr��c",2} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "Phi phong L�ng V�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong L�ng V�n",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},66} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3465},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "Phi phong Tuy�t Th�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Tuy�t Th�",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{2} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},462} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3466},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ph� Qu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ph� Qu�n",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{3} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},1386} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3467},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ngao tuy�t (D�ch chuy�n t�c th�i)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ngao tuy�t (D�ch chuy�n t�c th�i)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{4} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},2310} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3468},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Phi phong Kinh L�i (D�ch chuy�n t�c th�i)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Kinh L�i (D�ch chuy�n t�c th�i)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3470},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3473},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "Phi phong Ng�o Tuy�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>Phi phong Ng�o Tuy�t <color> c� m�y lo�i d��i ��y , ��i hi�p ng�i mu�n ch�n lo�i n�o?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Phi phong Ngao tuy�t (D�ch chuy�n t�c th�i)",7} },
		{"AddDialogOpt",	{"Phi phong Ng�o Tuy�t (X�c su�t h�a gi�i s�t th��ng)",13} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "CreateDialog",
	szName = "Phi phong Kinh L�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>Phi phong Kinh L�i <color>c� m�y lo�i d��i �ay, ��i hi�p ng�i mu�n ch�n lo�i n�o?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Phi phong Kinh L�i (D�ch chuy�n t�c th�i)",8} },
		{"AddDialogOpt",	{"Phi phong Kinh L�i (X�c su�t h�a gi�i s�t th��ng)",14} },
		{"AddDialogOpt",	{"Phi phong Kinh L�i ( Tr�ng k�ch )",15} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "Phi phong Ng� Phong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>Phi phong Ng� Phong<color> c� m�y lo�i d��i ��y, ��i hi�p ng�i mu�n ch�n lo�i n�o?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",9} },
		{"AddDialogOpt",	{"Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",16} },
		{"AddDialogOpt",	{"Phi phong Ng� Phong (Tr�ng k�ch)",17} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ng�o Tuy�t (X�c su�t h�a gi�i s�t th��ng)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ng�o Tuy�t (X�c su�t h�a gi�i s�t th��ng)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{4} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},2310} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3469},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "Phi phong Kinh L�i (X�c su�t h�a gi�i s�t th��ng)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Kinh L�i (X�c su�t h�a gi�i s�t th��ng)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3471},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Phi phong Kinh L�i ( Tr�ng k�ch )",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Kinh L�i ( Tr�ng k�ch )",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3472},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3474},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ng� Phong (Tr�ng k�ch)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ng� Phong (Tr�ng k�ch)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh l�c",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3475},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
