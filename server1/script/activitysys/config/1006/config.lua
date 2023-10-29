Include("\\script\\activitysys\\config\\1006\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ItemScript",
	szName = "S� d�ng B�ch Ch�n ��n L� Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30149,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1676,1,0,0},tbParam={500000000}},1,"DCKyTranCacThang10", "SuDungBachChanDonLeBao"} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "S� d�ng Huy�t Ch�n ��n L� Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30150,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1677,1,0,0},tbParam={1000000000}},1,"DCKyTranCacThang10", "SuDungHuyetChanDonLeBao"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "S� d�ng Huy�n Ch�n ��n L� Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30151,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1678,1,0,0},tbParam={1500000000}},1,"DCKyTranCacThang10", "SuDungHuyenChanDonLeBao"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "ItemScript",
	szName = "S� d�ng T� Kim Ch�n ��n L� Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30152,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2263,1,0,0},tbParam={2000000000}},1,"DCKyTranCacThang10", "SuDungTuKimChanDonLeBao"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "ClickNpc",
	szName = "K� L�c Nh�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"K� L�c Nh�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��i trang b� B�ch H�",6} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "��i trang b� B�ch H�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C�c h� mu�n ��i trang b� n�o?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"B�ch h� ph�t qu�n",7} },
		{"AddDialogOpt",	{"B�ch h� kim kh�i",8} },
		{"AddDialogOpt",	{"B�ch h� h�ng li�n",9} },
		{"AddDialogOpt",	{"B�ch h� h� uy�n",10} },
		{"AddDialogOpt",	{"B�ch h� ng�c b�i",11} },
		{"AddDialogOpt",	{"B�ch h� h�i",12} },
		{"AddDialogOpt",	{"B�ch h� y�u ��i",13} },
		{"AddDialogOpt",	{"B�ch h� th��ng gi�i ch�",14} },
		{"AddDialogOpt",	{"B�ch h� h� gi�i ch�",15} },
		{"AddDialogOpt",	{"B�ch h� kh� gi�i",16} },
	},
}
tbConfig[7] = --B�ch h� ph�t qu�n
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "Mua B�ch h� ph�t qu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ch h� ph�t qu�n",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Hoa ��ng �i�p",ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_PHATQUAN,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanNonBH"} },
	},
}
tbConfig[8] = --B�ch H� Kim Kh�i
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Mua B�ch H� Kim Kh�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ch H� Kim Kh�i",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,400} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_KIMKHAI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanAoBH"} },
	},
}
tbConfig[9] = --B�ch H� H�ng Li�n
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "Mua B�ch H� H�ng Li�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ch H� H�ng Li�n",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_HANGLIEN,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanHangLienBH"} },
	},
}
tbConfig[10] = --B�ch H� H� Uy�n
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "Mua B�ch H� H� Uy�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ch H� H� Uy�n",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_HOUYEN,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanBaoTayBH"} },
	},
}
tbConfig[11] = --B�ch H� Ng�c B�i 
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "Mua B�ch H� Ng�c B�i ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ch H� Ng�c B�i ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_NGOCBOI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanNgocBoiBH"} },
	},
}
tbConfig[12] = --B�ch H� H�i 
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Mua B�ch H� H�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ch H� H�i ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_HAI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanHaiBH"} },
	},
}
tbConfig[13] = --B�ch H� Y�u ��i
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Mua B�ch H� Y�u ��i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ch H� Y�u ��i",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_YEUDAI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanYeuDaiBH"} },
	},
}
tbConfig[14] = --B�ch H� Th��ng Gi�i Ch�
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "Mua B�ch H� Th��ng Gi�i Ch�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ch H� Th��ng Gi�i Ch�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_T_GIOICHI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanThuongGioiBH"} },
	},
}
tbConfig[15] = --B�ch H� H� Gi�i Ch�
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Mua B�ch H� H� Gi�i Ch�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ch H� H� Gi�i Ch�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_H_GIOICHI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanHaGioiBH"} },
	},
}
tbConfig[16] = --B�ch H� Kh� Gi�i 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Mua B�ch H� Kh� Gi�i ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ch H� Kh� Gi�i ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,500} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_KHIGIOI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanKhiGioiBH"} },
	},
}
