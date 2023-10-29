Include("\\script\\activitysys\\config\\31\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "��������������npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "��ָ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	--Fix map ID Kh�a Lang ��ng - Modified by DinhHQ - 20110606
		{"NpcFunLib:CheckInMap",	{"321,322,340,75,93,144,225,226,227"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2862,1,0,0},nExpiredTime=20110630,},1,"8"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�÷ִ���1000С��3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_songjinggethongselihe", "TongKim1000Diem"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�÷ִ���3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {15, "jxshengri_songjinghuodehongselihe", "TongKim3000Diem"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "�߼����ع���17��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_chuangguanggetlihe", "VuotAiCaoCap(Ai17)"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "�߼����ع���28��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox",	{10, "jxshengri_chuangguanghuodelihe", "VuotAiCaoCap(Ai28)"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "��1��2��3��ͷ���",
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
		{"ThisActivity:GiveRedBox", {5, "jxshengri_shuizeitoulingdiaoluohongselihe", "TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Nhi�m v� s�t th� c�p 90",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {1, "jxshengri_shashouchanchuhongselihe", "TieuDietBossSatThu90"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "����BOSS",
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
		{"ThisActivity:GiveRedBox", {20, "jxshengri_bosschanchuhongselihe", "TieuDietBossTheGioi"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "YDBZguoguan",
	szName = "�׵۴���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveRedBox", {1, "jxshengri_yandichanchuhongselihe"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "YDBZ_KillMaxBoss",
	szName = "�׵�ɱ��BOSS",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:YDBZ_GiveRedBox",	{nil} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "FinishMail",
	szName = "�����ʹ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveRedBox", {5, "jxshengri_xinshichanchuhongselihe"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "ʹ����ɫ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2862,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseBlueBox",	{nil} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "ʹ�ú�ɫ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2863,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseRedBox",	{nil} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "ClickNpc",
	szName = "�뵰��Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Sinh Nh�t"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"H�p th�nh B�nh Kem",16} },
		{"AddDialogOpt",	{"H�p th�nh B�nh Sinh Nh�t",17} },
		{"AddDialogOpt",	{"H�p th�nh B�nh Sinh Nh�t ��c Bi�t",18} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh B�nh Kem",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Kem",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"S�a T��i",{tbProp={6,1,2851,1,0,0},},2} },
		{"AddOneMaterial",	{"���ng tinh",{tbProp={6,1,2852,1,0,0},},2} },
		{"AddOneMaterial",	{"B�t m� ",{tbProp={6,1,2853,1,0,0},},2} },
		{"AddOneMaterial",	{"Kem",{tbProp={6,1,2856,1,0,0},},1} },
		{"AddOneMaterial",	{"B�",{tbProp={6,1,2855,1,0,0},},2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2859,1,0,0},nExpiredTime=20110630,},1,"SinhNhatVoLamTruyenKy\tHopThanhBanhKem"} },
		{"AddStatData",	{"jxshengri_naiyoubing", 1} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh B�nh Sinh Nh�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�p th�nh B�nh Sinh Nh�t",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"S�a T��i",{tbProp={6,1,2851,1,0,0},},2} },
		{"AddOneMaterial",	{"���ng tinh",{tbProp={6,1,2852,1,0,0},},2} },
		{"AddOneMaterial",	{"B�t m� ",{tbProp={6,1,2853,1,0,0},},2} },
		{"AddOneMaterial",	{"Kem",{tbProp={6,1,2856,1,0,0},},1} },
		{"AddOneMaterial",	{"B�",{tbProp={6,1,2855,1,0,0},},2} },
		{"AddOneMaterial",	{"SoCoLa",{tbProp={6,1,2854,1,0,0},},1} },
		{"AddOneMaterial",	{"N�n Sinh Nh�t",{tbProp={6,1,2857,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GetCake",	{nil} },
		{"AddStatData",	{"jxshengri_dangao", 1} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh B�nh Sinh Nh�t ��c Bi�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Sinh Nh�t ��c Bi�t",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"B�nh Sinh Nh�t L�n",{tbProp={6,1,2861,1,0,0},},1} },
		{"AddOneMaterial",	{"Gi� Tr�i C�y",{tbProp={6,1,2858,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2864,1,0,0},nExpiredTime=20110630,},1,"SinhNhatVoLamTruyenKy\tHopThanhBanhSinhNhatDacBiet"} },
		{"AddStatData",	{"jxshengri_tebiedangao", 1} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "ʹ�����ͱ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2859,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"C�p 150 tr� l�n ho�c �� tr�ng sinh m�i ���c s� d�ng",">="} },
		{"ThisActivity:CheckTask",	{TSKG_NaiYouBing,1000,"Trong su�t th�i gian ho�t ��ng m�i nh�n v�t ch� ���c s� d�ng nhi�u nh�t 1000  B�nh Kem","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKG_NaiYouBing,1} },
		{"ThisActivity:UseNaiYouBing",	{nil} },		
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "ʹ��С����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2860,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"C�p 150 tr� l�n ho�c �� tr�ng sinh m�i ���c s� d�ng",">="} },
		{"ThisActivity:CheckTask",	{TKSG_XiaoDanGao,500,"Trong su�t th�i gian ho�t ��ng m�i nh�n v�t ch� ���c s� d�ng nhi�u nh�t 500  B�nh Sinh Nh�t nh�","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"H�nh trang kh�ng ��"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_XiaoDanGao,1} },
		{"ThisActivity:UseXiaoDanGao",	{nil} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "ʹ�ô󵰸�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2861,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"C�p 150 tr� l�n ho�c �� tr�ng sinh m�i ���c s� d�ng",">="} },
		{"ThisActivity:CheckTaskDaily",	{TKSG_DaDanGao,10,"M�i ng�y ch� ���c s� d�ng nhi�u nh�t 10  B�nh Sinh Nh�t l�n","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"H�nh trang kh�ng ��"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TKSG_DaDanGao,1} },
		{"ThisActivity:UseDaDanGao",	{nil} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "ʹ���ر����ձ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2864,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"C�p 150 tr� l�n ho�c �� tr�ng sinh m�i ���c s� d�ng",">="} },
		{"ThisActivity:CheckTask",	{TKSG_TeBieShengRiBing,400,"Trong su�t th�i gian ho�t ��ng m�i nh�n v�t ch� ���c s� d�ng nhi�u nh�t 400 B�nh Sinh Nh�t ��c Bi�t","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"H�nh trang kh�ng ��"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_TeBieShengRiBing,1} },
		{"ThisActivity:UseTeBieDanGao",	{nil} },
		{"ThisActivity:GetRabbit",	{nil} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "ClickNpc",
	szName = "L�ng Th� ��i l�y Phi�n V�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�o�n ��i Nh�n"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��i Phi�n V�",24} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh Phi�n V�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi�n V� ",0,2,3,1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"L�ng Th�",{tbProp={6,1,2865,1,0,0},},200} },
	},
	tbActition = 
	{
		{"ThisActivity:GetFanYu",	{nil}},
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "NpcOnDeath",
	szName = "ɱ��ˮ����ͷ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_shuizeidatoulingdiaoluohongselihe", "TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[26] = --һ��ϸ��
{
	nId = 26,
	szMessageType = "FinishSongJin",
	szName = "HoanThanhTranTK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{2725,1} },
		{"ThisActivity:Vn_AwardOnSJMatchCount",	{nil} },
	},
}
tbConfig[27] = --һ��ϸ��
{
	nId = 27,
	szMessageType = "Chuanguan",
	szName = "HoanThanhAi28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },		
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{2726,1} },
		{"ThisActivity:Vn_AwardOnCOTMatchCount",	{nil} },
	},
}
tbConfig[28] = 
{
	nId = 28,
	szMessageType = "FinishFengLingDu",
	szName = "Ho�n th�nh Phong L�ng �� t�n ph�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:Vn_CheckPLDTime", {nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,},10,"SinhNhatVoLamTruyenKy\tHoanThanhPLDTonPhi"} },
	},
}