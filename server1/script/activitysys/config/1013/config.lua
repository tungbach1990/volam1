Include("\\script\\activitysys\\config\\1013\\variables.lua")
Include("\\script\\activitysys\\config\\1013\\awardlist.lua")
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
		--{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		--{"SetDialogTitle",	{"<npc>B�t ��u t� th�ng 10/2012, ��ng ��o c� th� t�i g�p <npc> � Bi�n Kinh �� n�p ch� c�i �� nh�n th��ng"} },
		{"AddDialogOpt",	{"��i m�nh ch� c�i",2} },
		{"AddDialogOpt",	{"N�p ch� c�i",11} },
		{"AddDialogOpt",	{"Danh S�ch top 10 n�p B� 4 ch�",24} },
		{"AddDialogOpt",	{"Nh�n th��ng n�p �� hai B� Ch�",18} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "��i m�nh ch� c�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C�c h� mu�n ��i m�nh ch� c�i n�o?"},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"M�nh ch� V�",3} },
		{"AddDialogOpt",	{"M�nh ch� L�m",4} },
		{"AddDialogOpt",	{"M�nh ch� Truy�n",5} },
		{"AddDialogOpt",	{"M�nh ch� K�",6} },
		{"AddDialogOpt",	{"M�nh ch� B�t",7} },
		{"AddDialogOpt",	{"M�nh ch� M�ch",8} },
		{"AddDialogOpt",	{"M�nh ch� Ch�n",9} },
		{"AddDialogOpt",	{"M�nh ch� Kinh",10} },
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
		{"AddOneMaterial",	{"M�nh ch� L�m",MANH_LAM,9} },
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
		{"AddOneMaterial",	{"M�nh ch� Truy�n",MANH_TRUYEN,9} },
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
		{"AddOneMaterial",	{"M�nh ch� K�",MANH_KY,9} },
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
	szName = "��i M�nh ch� B�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� B�t",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� B�t",MANH_BAT,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_BAT,1,EVENT_LOG_TITLE,"DoiManhChuBat"} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� M�ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� M�ch",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� M�ch",MANH_MACH,9} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_MACH,1,EVENT_LOG_TITLE,"DoiManhChuMach"} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� Ch�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� Ch�n",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� Ch�n",MANH_CHAN,9} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_CHAN,1,EVENT_LOG_TITLE,"DoiManhChuChan"} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "��i M�nh ch� Kinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��i M�nh ch� Kinh",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M�nh ch� Kinh",MANH_KINH,9} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_KINH,1,EVENT_LOG_TITLE,"DoiManhChuKinh"} },
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
		--{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"N�p ch� Truy�n K�",12} },
		{"AddDialogOpt",	{"N�p ch� L�m Truy�n K�",13} },
		{"AddDialogOpt",	{"N�p ch� V� L�m Truy�n K�",14} },
		{"AddDialogOpt",	{"N�p ch� Ch�n Kinh",15} },
		{"AddDialogOpt",	{"N�p ch� M�ch Ch�n Kinh",16} },
		{"AddDialogOpt",	{"N�p ch� B�t M�ch Ch�n Kinh",17} },
--		{"AddDialogOpt",	{"N�p ch� B�t M�ch Ch�n Kinh V� L�m Truy�n K�",18} },
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
		{"ThisActivity:CheckVatPhamLimit", {"NopTruyenKy",501,TASK_TRUYENKY.nMaxValue,TASK_TRUYENKY}},
		{"AddOneMaterial",	{"Truy�n",CHU_TRUYEN,1} },
		{"AddOneMaterial",	{"K�",CHU_KY,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopTruyenKy", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "N�p ch� L�m - Truy�n - K�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p ch� L�m Truy�n K�",1,1,2,0.02},
	tbCondition = 
	{
		{"ThisActivity:CheckVatPhamLimit", {"NopLamTruyenKy",69,TASK_LAMTRUYENKY.nMaxValue,TASK_LAMTRUYENKY}},
		{"AddOneMaterial",	{"L�m",CHU_LAM,1} },
		{"AddOneMaterial",	{"Truy�n",CHU_TRUYEN,1} },
		{"AddOneMaterial",	{"K�",CHU_KY,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopLamTruyenKy", {nil}},
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
		{"ThisActivity:CheckVatPhamLimit", {"NopVoLamTruyenKy",9,TASK_VOLAMTRUYENKY.nMaxValue,TASK_VOLAMTRUYENKY}},
		{"AddOneMaterial",	{"V�",CHU_VO,1} },
		{"AddOneMaterial",	{"L�m",CHU_LAM,1} },
		{"AddOneMaterial",	{"Truy�n",CHU_TRUYEN,1} },
		{"AddOneMaterial",	{"K�",CHU_KY,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopVoLamTruyenKy", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "N�p ch� Ch�n - Kinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p ch� Ch�n Kinh",1,1,2,0.02},
	tbCondition = 
	{
		{"ThisActivity:CheckVatPhamLimit", {"NopChanKinh",501,TASK_CHANKINH.nMaxValue,TASK_CHANKINH}},
		{"AddOneMaterial",	{"Ch�n",CHU_CHAN,1} },
		{"AddOneMaterial",	{"Kinh",CHU_KINH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopChanKinh", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "N�p ch� M�ch - Ch�n - Kinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p ch� M�ch Ch�n Kinh",1,1,2,0.02},
	tbCondition = 
	{
		{"ThisActivity:CheckVatPhamLimit", {"NopMachChanKinh",69,TASK_MACHCHANKINH.nMaxValue,TASK_MACHCHANKINH}},
		{"AddOneMaterial",	{"M�ch",CHU_MACH,1} },
		{"AddOneMaterial",	{"Ch�n",CHU_CHAN,1} },
		{"AddOneMaterial",	{"Kinh",CHU_KINH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopMachChanKinh", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "N�p ch� B�t - M�ch - Ch�n - Kinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"N�p ch� B�t M�ch Ch�n Kinh",1,1,2,0.02},
	tbCondition = 
	{
		{"ThisActivity:CheckVatPhamLimit", {"NopBatMachChanKinh",9,TASK_BATMACHCHANKINH.nMaxValue,TASK_BATMACHCHANKINH}},
		{"AddOneMaterial",	{"B�t",CHU_BAT,1} },
		{"AddOneMaterial",	{"M�ch",CHU_MACH,1} },
		{"AddOneMaterial",	{"Ch�n",CHU_CHAN,1} },
		{"AddOneMaterial",	{"Kinh",CHU_KINH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBatMachChanKinh", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "nil",
	szName = "Nh�n th��ng n�p �� B�t - M�ch - Ch�n - Kinh - VLTK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckAwardLimit", {nil}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {TASK_BMCK_VLTK, 1}},
		{"PlayerFunLib:AddExp",	{2e9,0,EVENT_LOG_TITLE,"NopDu2BoChu"} },
	},
}
tbConfig[19] = --Load Npc
{
	nId = 19,
	szMessageType = "ServerStart",
	szName = "K�ch Ho�t Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:StartServer",	{nil} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "HuoYueDu",
	szName = "HuoYueDu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:GetAwardEvent",	{1} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "HarvestPlants",
	szName = "Plant tree award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"tianlu_tree"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:GetAwardEvent",	{2} },
	},
}
tbConfig[22] = 
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "Thi�n long v� c�c �an",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {THIENLONG_VCD},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a c�c h� kh�ng �� �� s� d�ng ��o c�, h�y c� g�ng luy�n t�p th�m.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TASK_TL_VCD,8,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Kh�ng gian h�nh trang c�a ng��i kh�ng ��."} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {TASK_TL_VCD, 1}},
		{"PlayerFunLib:AddTask",	{4000,2000} },
		{"PlayerFunLib:GetItem",	{ITEM_HMD_1000,1,EVENT_LOG_TITLE,"SuDungThienLongVoCucDan"} },
	},
}
tbConfig[23] = 
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "H�n nguy�n v� c�c �an",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {HONNGUYEN_VCD},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a c�c h� kh�ng �� �� s� d�ng ��o c�, h�y c� g�ng luy�n t�p th�m.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TASK_HN_VCD,8,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Kh�ng gian h�nh trang c�a ng��i kh�ng ��."} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {TASK_HN_VCD, 1}},
		{"PlayerFunLib:AddTask",	{4000,500} },
		{"PlayerFunLib:GetItem",	{ITEM_HMD_500,1,EVENT_LOG_TITLE,"SuDungHonNguyenVoCucDan"} },
	},
}
tbConfig[24] =
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "hi�n th� top 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��i hi�p mu�n xem top b� ch� n�o?"},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Xem x�p h�ng b� ch� V� L�m Truy�n K�",25} },
		{"AddDialogOpt",	{"Xem x�p h�ng b� ch� B�t M�ch Ch�n Kinh",26} },
		{"AddDialogOpt",	{"Xem x�p h�ng n�p �� 2 b� ch�",27} },
	},
}
tbConfig[25] =
{
	nId = 25,
	szMessageType = "nil",
	szName = "Xem th�ng tin TOP 10 n�p �� b� ch� VLTK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:ShowTop",	{"V� L�m Truy�n K�","VoLamTruyenKy"} },
	},
}
tbConfig[26] =
{
	nId = 26,
	szMessageType = "nil",
	szName = "Xem th�ng tin TOP 10 n�p �� b� ch� B�t M�ch Ch�n Kinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:ShowTop",	{"B�t M�ch Ch�n Kinh","BatMachChanKinh"} },
	},
}
tbConfig[27] =
{
	nId = 27,
	szMessageType = "nil",
	szName = "Xem th�ng tin TOP 10 n�p �� 2 b� ch�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Show_BMCK_VLTK",	{nil} },
	},
}