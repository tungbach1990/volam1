Include("\\script\\activitysys\\config\\1019\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "��i tho�i v�i Th�n T�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th�n T�i"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>B�t ��u t� 20/05/2013 - 17/06/2013, ��ng ��o c� th� t�i g�p <npc> � Bi�n Kinh �� tham gia s� ki�n - <color=yellow>Truy T�m B�o V�t<color>"} },
		{"AddDialogOpt",	{"T�ch l�y B�o r��ng ��i ch� c�i t��ng �ng",24} },
		{"AddDialogOpt",	{"Gh�p m�nh ch� c�i ��i ch� c�i t��ng �ng",2} },
		{"AddDialogOpt",	{"T�ch l�y b� ch� c�i nh�n th��ng",11} },
		{"AddDialogOpt",	{"Danh S�ch top n�p B� ch�",20} },
		{"AddDialogOpt",	{"Nh�n th��ng n�p �� hai B� Ch�",18} },
		--{"AddDialogOpt",	{"Nh�n th��ng x�p h�ng b�o r��ng tu�n tr��c",40} },
		{"AddDialogOpt",	{"Nh�n Danh hi�u H�ng Binh L�u Danh",40} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "��i m�nh ch� c�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C�c h� mu�n gh�p m�nh ch� c�i n�o?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"M�nh ch� V�",3} },
		{"AddDialogOpt",	{"M�nh ch� L�m",4} },
		{"AddDialogOpt",	{"M�nh ch� Truy�n",5} },
		{"AddDialogOpt",	{"M�nh ch� K�",6} },
		{"AddDialogOpt",	{"M�nh ch� H�ng",7} },
		{"AddDialogOpt",	{"M�nh ch� Binh",8} },
		{"AddDialogOpt",	{"M�nh ch� L�u",9} },
		{"AddDialogOpt",	{"M�nh ch� Danh",10} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� V�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� V�",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� V�",MANH_VO,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_VO,1,EVENT_LOG_TITLE,"DoiManhChuVo"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� L�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� L�m",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� L�m",MANH_LAM,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_LAM,1,EVENT_LOG_TITLE,"DoiManhChuLam"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� Truy�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� Truy�n",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� Truy�n",MANH_TRUYEN,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_TRUYEN,1,EVENT_LOG_TITLE,"DoiManhChuTruyen"} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� K�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� K�",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� K�",MANH_KY,100} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_KY,1,EVENT_LOG_TITLE,"DoiManhChuKy"} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� H�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� H�ng",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� H�ng",MANH_HUNG,100} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_HUNG,1,EVENT_LOG_TITLE,"DoiManhChuHung"} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� Binh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� Binh",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� Binh",MANH_BINH,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_BINH,1,EVENT_LOG_TITLE,"DoiManhChuBinh"} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� L�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� L�u",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� L�u",MANH_LUU,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_LUU,1,EVENT_LOG_TITLE,"DoiManhChuLuu"} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� Danh",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� Danh",MANH_DANH,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_DANH,1,EVENT_LOG_TITLE,"DoiManhChuDanh"} },
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "CreateDialog",
	szName = "N�p ch� c�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C�c h� mu�n n�p ch� c�i n�o?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"N�p ch� V� L�m",13} },
		{"AddDialogOpt",	{"N�p ch� Truy�n K�",12} },
		{"AddDialogOpt",	{"N�p ch� V� L�m Truy�n K�",14} },
		{"AddDialogOpt",	{"N�p ch� L�u Danh",16} },
		{"AddDialogOpt",	{"N�p ch� H�ng Binh",15} },
		{"AddDialogOpt",	{"N�p ch� H�ng Binh L�u Danh",17} },
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "N�p ch� Truy�n - K�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p ch� Truy�n K�",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Truy�n",CHU_TRUYEN,1} },
		{"AddOneMaterial",	{"K�",CHU_KY,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"Truy�n K�","NopTruyenKy"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "N�p ch� V� - L�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p ch� V� L�m",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"V�",CHU_VO,1} },
		{"AddOneMaterial",	{"L�m",CHU_LAM,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"V� L�m", "NopVoLam"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "N�p ch� V� - L�m - Truy�n - K�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p ch� V� L�m Truy�n K�",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"V�",CHU_VO,1} },
		{"AddOneMaterial",	{"L�m",CHU_LAM,1} },
		{"AddOneMaterial",	{"Truy�n",CHU_TRUYEN,1} },
		{"AddOneMaterial",	{"K�",CHU_KY,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"V� L�m Truy�n K�", "NopVoLamTruyenKy"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "N�p ch� H�ng - Binh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p ch� H�ng Binh",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"H�ng",CHU_HUNG,1} },
		{"AddOneMaterial",	{"Binh",CHU_BINH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"H�ng Binh", "NopHungBinh"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "N�p ch� L�u - Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p ch� L�u Danh",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L�u",CHU_LUU,1} },
		{"AddOneMaterial",	{"Danh",CHU_DANH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"L�u Danh", "NopLuuDanh"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "N�p ch� H�ng Binh L�u Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p ch� H�ng Binh L�u Danh",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"H�ng",CHU_HUNG,1} },
		{"AddOneMaterial",	{"Binh",CHU_BINH,1} },
		{"AddOneMaterial",	{"L�u",CHU_LUU,1} },
		{"AddOneMaterial",	{"Danh",CHU_DANH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"H�ng Binh L�u Danh", "NopHungBinhLuuDanh"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "nil",
	szName = "Nh�n th��ng n�p �� 2 b� ch� VLTK v� HBLD",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"ThisActivity:CheckAwardLimit", {nil}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {TASK_VLTK_HBLD, 1}},
		{"PlayerFunLib:AddExp",	{2000e6,0,EVENT_LOG_TITLE,"HoanThanhVoLamTruyenKyHungBinhLuuDanh"} },
	},
}
tbConfig[19] = --Load Npc
{
	nId = 19,
	szMessageType = "ServerStart",
	szName = "K�ch Ho�t data",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:StartServer",	{nil} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "CreateDialog",
	szName = "hi�n th� top 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��i hi�p mu�n xem top b� ch� n�o?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Xem x�p h�ng b� ch� V� L�m Truy�n K�",21} },
		{"AddDialogOpt",	{"Xem x�p h�ng b� ch� H�ng Binh L�u Danh",22} },
		{"AddDialogOpt",	{"Xem x�p h�ng n�p �� 2 b� ch�",23} },
	},
}
tbConfig[21] =
{
	nId = 21,
	szMessageType = "nil",
	szName = "Xem th�ng tin TOP 10 n�p �� b� ch� VLTK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:ShowTop",	{"V� L�m Truy�n K�","NopVoLamTruyenKy"} },
	},
}
tbConfig[22] =
{
	nId = 22,
	szMessageType = "nil",
	szName = "Xem th�ng tin TOP 10 n�p �� b� ch� H�ng Binh L�u Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:ShowTop",	{"H�ng Binh L�u Danh","NopHungBinhLuuDanh"} },
	},
}
tbConfig[23] =
{
	nId = 23,
	szMessageType = "nil",
	szName = "Xem th�ng tin TOP 10 n�p �� 2 b� ch�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:Show_VLTK_HBLD",{nil} },
	},
}
tbConfig[24] =
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "T�ch l�y b�o r��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>M�t s� ho�t ��ng t�ch l�y B�o R��ng !"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho�t ��ng n�p r��ng b�o v�t",25} },
		{"AddDialogOpt",	{"Ho�t ��ng nh�n th��ng x�p h�ng tu�n",39} },
		{"AddDialogOpt",	{"Xem b�o r��ng �� t�ch l�y",26} },
		{"AddDialogOpt",	{"Xem b�ng x�p h�ng t�ch l�y b�o r��ng tu�n n�y",27} },
		{"AddDialogOpt",	{"Xem b�ng x�p h�ng t�ch l�y b�o r��ng tu�n tr��c",28} },
	},
}
tbConfig[25] =
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "N�p b�o r��ng",
	nStartDate = 201305200000,
	nEndDate  = 201306162400,
	tbMessageParam = {"N�p b�o r��ng",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"R��ng B�o V�t",ITEM_RUONG_BAOVAT,10} },
	},
	tbActition = 
	{
		{"ThisActivity:Tichluy", {TASK_BAORUONG}},
	},
}
tbConfig[26] =
{
	nId = 26,
	szMessageType = "nil",
	szName = "Xem th�ng tin t�ch l�y B�o r��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:Show_BaoRuong",	{TASK_BAORUONG} },
	},
}
tbConfig[27] =
{
	nId = 27,
	szMessageType = "nil",
	szName = "Xem th�ng tin X�p h�ng t�ch l�y B�o r��ng tu�n n�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:Show_XepHang",	{nil} },
	},
}
tbConfig[28] =
{
	nId = 28,
	szMessageType = "nil",
	szName = "Xem th�ng tin X�p h�ng t�ch l�y B�o r��ng tu�n tr��c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:Show_XepHangPr",	{nil} },
	},
}
tbConfig[29] =
{
	nId = 29,
	szMessageType = "FinishSongJin",
	szName = "songjin 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"TongKim3000"} },
	},
}
tbConfig[30] = 
{
	nId = 30,
	szMessageType = "NpcOnDeath",
	szName = "fenglingdu_boatboss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[31] = --thu� t�c ��i ��u l�nh
{
	nId = 31,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t thu� t�c ��i ��u l�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,5,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },		
	},
}
tbConfig[32] = --Boss Ho�ng Kim
{
	nId = 32,
	szMessageType = "NpcOnDeath",
	szName = "kill world boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,5,EVENT_LOG_TITLE,"TieuDietBossTheGioi"} },	
	},
}
tbConfig[33] = --Tr�ng c�y thi�n l�c
{
	nId = 33,
	szMessageType = "HarvestPlants",
	szName = "Plant tree award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"tianlu_tree"},
	tbCondition = { 
	},
	tbActition = 
	{
		{"ThisActivity:GetAwardEvent",	{nil}},
	},
}
tbConfig[34] =--V��t �i 17
{
	nId = 34,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{	
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"VuotAi17"} },	
	},
}
tbConfig[35] =--V��t �i 17
{
	nId = 35,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{	
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"VuotAi28"} },	
	},
}
tbConfig[36] = --Vi�m �� - v��t �i th� 10
{
	nId = 36,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 4",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {4},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"VuotAiviemde4"} },
	},
}
tbConfig[37] = --Vi�m �� - v��t �i th� 10
{
	nId = 37,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"VuotAiviemde6"} },
	},
}
tbConfig[38] =
{
	nId = 38,
	szMessageType = "ItemScript",
	szName = "D�ng r��ng B�o V�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_RUONG_BAOVAT},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAwardRuong,1,EVENT_LOG_TITLE,"Mobaoruong"} },
	},
}
tbConfig[39] =
{
	nId = 39,
	szMessageType = "nil",
	szName = "Nh�n th��ng T�ch l�y b�o r��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Nh�n th��ng t�ch l�y B�o R��ng theo h�ng!"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"ThisActivity:CheckXephang",	{nil}},
	},
	tbActition = 
	{
		{"ThisActivity:NhanThuongXephang",{nil}},
	},
}
tbConfig[40] =
{
	nId = 40,
	szMessageType = "nil",
	szName = "Nh�n th��ng T�ch l�y b�o r��ng tu�n tr��c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Nh�n th��ng t�ch l�y B�o R��ng tu�n tr��c!"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {TASK_DH_HBLD, 1, "��i hi�p �� nh�n danh hi�u n�y r�i, kh�ng th� nh�n l�i", "<"}},	
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Danh hi�u H�ng Binh L�u danh ch� ���c nh�n 1 l�n duy nh�t trong su�t th�i gian di�n ra s� ki�n ��i v�i 5 nh�n v�t �� t�ch l�y b� ch� c�i H�ng Binh L�u Danh ��u ti�n<color>"} },
		{"ThisActivity:TitleAwardEx",{nil}},
	},
}