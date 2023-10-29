Include("\\script\\activitysys\\config\\35\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "finish songjing and mark >= 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,40,EVENT_LOG_TITLE,"TongKimDat3000DiemNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TongKimDat3000DiemNhanHatGiong", "40 H�t Gi�ng", 1}},
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"VuotQuaAi17NhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "VuotQuaAi17NhanHatGiong", "10 H�t Gi�ng", 1}},
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"VuotQuaAi28NhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "VuotQuaAi28NhanHatGiong", "10 H�t Gi�ng", 1}},
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "NpcOnDeath",
	szName = "fengling_leader",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinhNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietThuyTacDauLinhNhanHatGiong", "10 H�t Gi�ng", 1}},
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "fengling_bigleader",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinhNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietThuyTacDaiDauLinhNhanHatGiong", "20 H�t Gi�ng", 1}},
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ_10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"VuotQuaAi10ViemDeNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "VuotQuaAi10ViemDeNhanHatGiong", "20 H�t Gi�ng", 1}},
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "worldboss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,50,EVENT_LOG_TITLE,"TieuDietBossHoangKimNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietBossHoangKimNhanHatGiong", "50 H�t Gi�ng", 1}},
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "FinishKillerBoss",
	szName = "killer",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {90},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,3,EVENT_LOG_TITLE,"TieuDietBossSatThuNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietBossSatThuNhanHatGiong", "3 H�t Gi�ng", 1}},
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "killer monster",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{szName="M�m B�c",tbProp={6,1,3103,1,0,0},nExpiredTime=20120201,},1,"5"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "finish songjing and mark >= 1000 and mark < 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"TongKimDat1000DiemNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TongKimDat1000DiemNhanHatGiong", "20 H�t Gi�ng", 1}},
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "click npc named plutus",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i Th�n T�i"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"Trong ti�t tr�i xu�n �m �p n�y, c�c ��i hi�p c� th� ��n ch� c�a ta ��y l�y c�c lo�i tr�i c�y �� h�p th�nh <color=yellow> M�m B�c Ng� Qu� v� M�m V�ng Ng� Qu� <color>. Nh�n chu�t s� d�ng <color=yellow> M�m B�c Ng� Qu� v� M�m V�ng Ng� Qu� <color> s� c� ph�n th��ng h�u h�nh, n�u nh� may m�n c� th� nh�n ���c <color=yellow> Bao L� X� N�m M�i, n�u nh� ��i hi�p ��a Bao L� X� N�m M�i (nh�) <color> v� 10 v�n t�ng cho l�o n�p giao cho ta th� ta s� t�ng cho ng��i ph�n th��ng phong ph�. Trong su�t th�i gian ho�t ��ng ta s� lu�n � ��y �� cung h�u gi� ��o cua c�c ch� v� !"} },
		{"AddDialogOpt",	{"H�p th�nh M�m B�c Ng� Qu�",12} },
		{"AddDialogOpt",	{"H�p th�nh M�m V�ng Ng� Qu�",15} },
		{"AddDialogOpt",	{"Giao n�p Bao L� X� N�m M�i (nh�)",18} },
		{"AddDialogOpt",	{"��i Bao L� X� ��",22} },
		{"AddDialogOpt",	{"Mi�n ph� nh�n kinh nghi�m",28} },
		{"AddDialogOpt",	{"Giao n�p m�t n� h�nh r�ng",30} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "wuguobaiyinpan select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�p th�nh M�m B�c Ng� Qu� c� hai c�ch, c�ch th� 1: 1 N�i Chu�i + 1 Tr�i Cam + 1 Tr�i B��i + 1 Tr�i H�ng + 1 Tr�i L� + 1 M�m B�c; C�ch 2 l�: 1 Tr�i D�a + 1 Tr�i �u �� +1 Tr�i M�ng C�u + 1 Tr�i Sung + 1 Tr�i Xo�i + 1 M�m V�ng. ��i hi�p mu�n s� d�ng c�ch n�o. ",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"C�ch 1",13} },
		{"AddDialogOpt",	{"c�ch 2",14} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "wuguobaiyinpan plan_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M�m B�c Ng� Qu�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"N�i Chu�i",{tbProp={6,1,3098,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i Cam",{tbProp={6,1,3095,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i B��i",{tbProp={6,1,3097,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i H�ng",{tbProp={6,1,3099,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i L�",{tbProp={6,1,3096,1,0,0},},1} },
		{"AddOneMaterial",	{"M�m B�c",{tbProp={6,1,3103,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="M�m B�c Ng� Qu�",tbProp={6,1,3105,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamBacNguQua"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "wuguobaiyinpan plan_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M�m B�c Ng� Qu�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Xo�i",{tbProp={6,1,3093,1,0,0},},1} },
		{"AddOneMaterial",	{"D�a",{tbProp={6,1,3100,1,0,0},},1} },
		{"AddOneMaterial",	{"�u ��",{tbProp={6,1,3101,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i M�ng C�u",{tbProp={6,1,3094,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i Sung",{tbProp={6,1,3102,1,0,0},},1} },
		{"AddOneMaterial",	{"M�m B�c",{tbProp={6,1,3103,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="M�m B�c Ng� Qu�",tbProp={6,1,3105,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamBacNguQua"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "wuguohuangjinpan select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�p th�nh M�m V�ng Ng� Qu� c� hai c�ch, c�ch th� 1: 1 N�i Chu�i + 1 Tr�i Cam + 1 Tr�i B��i + 1 Tr�i H�ng + 1 Tr�i L� + 1 M�m V�ng; C�ch th� 2: 1 Tr�i D�a + 1 �u �� + 1 M�ng C�u + 1 Tr�i Sung + 1 Tr�i Xo�i + M�m V�ng. ��i hi�p mu�n s� d�ng c�ch n�o.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"C�ch 1",16} },
		{"AddDialogOpt",	{"c�ch 2",17} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "wuguohuangjinpan plan_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M�m V�ng Ng� Qu�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"N�i Chu�i",{tbProp={6,1,3098,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i Cam",{tbProp={6,1,3095,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i B��i",{tbProp={6,1,3097,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i H�ng",{tbProp={6,1,3099,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i L�",{tbProp={6,1,3096,1,0,0},},1} },
		{"AddOneMaterial",	{"M�m V�ng",{tbProp={6,1,3104,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3106,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamVangNguQua"} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "wuguohuangjinpan plan_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M�m V�ng Ng� Qu�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Xo�i",{tbProp={6,1,3093,1,0,0},},1} },
		{"AddOneMaterial",	{"D�a",{tbProp={6,1,3100,1,0,0},},1} },
		{"AddOneMaterial",	{"�u ��",{tbProp={6,1,3101,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i M�ng C�u",{tbProp={6,1,3094,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr�i Sung",{tbProp={6,1,3102,1,0,0},},1} },
		{"AddOneMaterial",	{"M�m V�ng",{tbProp={6,1,3104,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3106,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamVangNguQua"} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "handin redbag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",0,0,0,0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Bao L� X� N�m M�i (nh�)",{tbProp={6,1,3108,1,0,0},},1} },
		{"AddOneMaterial",	{"Ng�n l��ng",{nJxb=1},100000} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_REDBAG_DAILY,MAX_REDBAG_DAILY,"H�m nay ��i hi�p �� giao �� r�i, ��i ng�y mai h�y ti�p t�c nh�!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{1000000,1,EVENT_LOG_TITLE,"NopBaoLiXiNamMoiTaiNPCDaiThanTai"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "NopBaoLiXiNamMoiTaiNPCDaiThanTai", "1000000 �i�m kinh nghi�m", 1}},
		{"ThisActivity:AddTaskDaily",	{TSK_REDBAG_DAILY,1} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "use wuguodebaiyinpan",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3105,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },
		{"ThisActivity:CheckTask",	{TSK_USED_WUGUOBAIYINPAN,MAX_USED_WUGUOBAIYINPAN,"��i hi�p �� nh�n qu� nhi�u ph�n th��ng r�i, hay l� th� c�i kh�c xem sao!","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWuguobaiyinpan",	{nil} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "use wuguodehuangjinpan",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3106,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },
		{"ThisActivity:CheckTask",	{TSK_USED_WUGUOHUANGJINPAN,MAX_USED_WUGUOHUANGJINPAN,"��i hi�p �� nh�n qu� nhi�u ph�n th��ng r�i, hay l� th� c�i kh�c xem sao!","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWuguohuangjinpan",	{nil} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "use zhongzi",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3107,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:IsFightState",	{1, "Ch� c� th� s� d�ng t�i c�c khu v�c chi�n ��u."} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },
		{"ThisActivity:CheckUseZhongzi",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:UseZhongzi",	{nil} },
	},
}
tbConfig[22] = --��i bao l� x� ��
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "bao li xi do select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i Bao L� X� �� c� th� d�ng m�t trong c�c lo�i b�o th�ch sau:",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{2918,2,"H�m nay ��i hi�p �� ��i �� r�i, ��i ng�y mai h�y ti�p t�c nh�!","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"D�ng Tinh H�ng B�o Th�ch",23} },
		{"AddDialogOpt",	{"D�ng Lam Th�y Tinh",24} },
		{"AddDialogOpt",	{"D�ng T� Th�y Tinh",25} },
		{"AddDialogOpt",	{"D�ng L�c Th�y Tinh",26} },
	},
}
tbConfig[23] = --d�ng tinh h�ng ��i bao l� x� ��
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "baolixido_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l� x� ��",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"Tinh H�ng B�o Th�ch",{tbProp={4,353,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{		
		{"ThisActivity:ComposeRedEvelop",	{"DungTinhHongBaoThachDoiBaoLiXiDo"} },
	},
}
tbConfig[24] = --d�ng Lam Th�y Tinh ��i bao l� x� ��
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "baolixido_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l� x� ��",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"Lam Th�y Tinh",{tbProp={4,238,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{			
		{"ThisActivity:ComposeRedEvelop",	{"DungLamThuyTinhDoiBaoLiXiDo"} },
	},
}
tbConfig[25] = --d�ng T� Th�y Tinh ��i bao l� x� ��
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "baolixido_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l� x� ��",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"T� Th�y Tinh",{tbProp={4,239,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeRedEvelop",	{"DungTuThuyTinhDoiBaoLiXiDo"} },		
	},
}
tbConfig[26] = --d�ng L�c Th�y Tinh ��i bao l� x� ��
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "baolixido_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l� x� ��",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"L�c Th�y Tinh",{tbProp={4,240,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeRedEvelop",	{"DungLucThuyTinhDoiBaoLiXiDo"} },		
	},
}
tbConfig[27] = --S� d�ng bao l� x� ��
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "use red evelop",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30169,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{2500000,1,EVENT_LOG_TITLE,"SuDungBaoLiXiDo"} },
	},
}
tbConfig[28] =
{
	nId = 28,
	szMessageType = "CreateDialog",
	szName = "��i tho�i nh�n ph�n th��ng free exp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V�o l�c 0:00-16-1-2012 ��n 24:00-17-1-2012, c�c ��i hi�p c�p 150 v� 150 tr� l�n (tr�ng sinh kh�ng gi�i h�n) c� th� ��n g�p ta �� nh�n m�n qu�  l� 100 tri�u �i�m kinh nghi�m kh�ng c�ng d�n, m�i nh�n v�t ch� c� th� nh�n m�t l�n duy nh�t.",0},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n nh�n th��ng",29} },
	},
}
tbConfig[29] = 
{
	nId = 29,
	szMessageType = "nil",
	szName = "nh�n ph�n th��ng free exp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetFreeExp",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2912,nStartBit = 21,nBitCount = 1,nMaxValue = 1}, 0, "M�i nh�n v�t ch� ���c nh�n th��ng 1 l�n", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2912,nStartBit = 21,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{100e6,0,EVENT_LOG_TITLE,"MienPhiNhanThuongDiemKinhNghiem"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "MienPhiNhanThuongDiemKinhNghiem", "100000000 �i�m kinh nghi�m", 1}},
	},
}
tbConfig[30] = --n�p m�t n� r�ng
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "give dragon mask",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��i �i�m kinh nghi�m",1,1,1,0.02},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"M�t n� - Long Ch�u",{tbProp={0,11,75,1,0,0},},1} },
		{"AddOneMaterial",	{"M�t n� - ��u R�ng",{tbProp={0,11,76,1,0,0},},1} },
		{"AddOneMaterial",	{"M�t n� - Th�n R�ng",{tbProp={0,11,77,1,0,0},},1} },
		{"AddOneMaterial",	{"M�t n� - �u�i R�ng",{tbProp={0,11,78,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeDragonMask",	{nil} },		
	},
	tbActition = 
	{
		{"ThisActivity:ComposeDragonMask",	{nil} },		
	},
}