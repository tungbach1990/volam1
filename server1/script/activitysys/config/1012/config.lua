Include("\\script\\activitysys\\config\\1012\\variables.lua")
tbConfig = {}
tbConfig[1] = --Load Npc
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "K�ch Ho�t Npc",
	nStartDate = 201209270000,
	nEndDate  = 201210312400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201209\\zhongqiu.lua"} },
	},
	tbActition = 
	{
		{"tbzhongqiu:AddTaskNpc",	{nil} },
	},
}
tbConfig[2] = --N�p L�ng ��n
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "��i tho�i v�i H�ng Nga",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�ng Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Trong th�i gian 0 gi� 30/09/2012 ��n 24 gi� 31/10/2012, ��ng ��o c� th� h�p th�nh c�c lo�i l�ng ��n � ch� H�ng, v� n�p l�ng ��n k�o qu�n cho ch� H�ng s� nh�n ���c ph�n th��ng kinh nghi�m, l�n n�p 1000, 2000, 3000,... s� nh�n ���c kinh nghi�m nhi�u h�n b�nh th��ng. �� l�n c�a h�ng nga s� t�y thu�c v�o s� l��ng l�ng ��n k�o qu�n �� n�p, m�i ng�y v�o l�c 20 gi� n�u nh� H�ng Nga � tr�ng th�i l�n nh�t s� xu�t hi�n hi�u �ng b�n ph�o hoa, c�c ��ng ��o ��ng xung quanh �� c� th� nh�n ���c ph�n th��ng kinh nghi�m. M�i ng�y 20 gi� 30 ph�t, h�ng nga s� tr� v� tr�ng th�i nh� nh�t, s� l��ng ��n k�o qu�n c�ng v� 0. Trong th�i gian ho�t ��ng m�i ng��i nhi�u nh�t ch� ���c n�p 2000 l�ng ��n."} },
		{"AddDialogOpt",	{"T�ng l�ng ��n k�o qu�n",17} },
		{"AddDialogOpt",	{"H�p th�nh L�ng ��n",4} },
	},
}
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "H�p B�nh Nh�n Th�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {BANH_NHANTHIT_BOX},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","Xin h�y s� d�ng t�i th�nh th� ho�c t�n th� th�n!"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BANH_NHANTHIT,5,EVENT_LOG_TITLE,"Nhan5BanhNhanThit"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "H�p th�nh L�ng ��n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C�c h� mu�n h�p th�nh lo�i l�ng ��n n�o?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"L�ng ��n B��m B��m",5} },
		{"AddDialogOpt",	{"L�ng ��n Con Th�",6} },
		{"AddDialogOpt",	{"L�ng ��n Ph��ng",7} },
		{"AddDialogOpt",	{"L�ng ��n R�ng",8} },
	},
}
tbConfig[5] = --L�ng ��n b��m b��m
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh l�ng ��n b��m b��m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L�ng ��n b��m b��m",1,1,1,0.02},
	tbCondition = 
	{
		{"lib:CheckDay",	{20120927, 20121101, "Th�i h�n ��i �� k�t th�c"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{BANH_HATSEN.szName,BANH_HATSEN,1} },
		{"AddOneMaterial",	{BANH_DAUXANH.szName,BANH_DAUXANH,1} },
		{"AddOneMaterial",	{BANH_KHOAIMON.szName,BANH_KHOAIMON,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{LONGDEN_BB,1,EVENT_LOG_TITLE,"HopthanhlongdenBuomBuom"} },
		--{"PlayerFunLib:AddExp",	{5e5,0,EVENT_LOG_TITLE,"HopthanhlongdenBuomBuomNhanDiemExp"} },
	},
}
tbConfig[6] = --L�ng ��n Con Th�
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh L�ng ��n Con Th�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L�ng ��n Con Th�",1,1,1,0.02},
	tbCondition = 
	{
		{"lib:CheckDay",	{20120927, 20121101, "Th�i h�n ��i �� k�t th�c"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{BANH_HATSEN.szName,BANH_HATSEN,1} },
		{"AddOneMaterial",	{BANH_DAUXANH.szName,BANH_DAUXANH,1} },
		{"AddOneMaterial",	{BANH_KHOAIMON.szName,BANH_KHOAIMON,1} },
		{"AddOneMaterial",	{BANH_DEO.szName,BANH_DEO,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{LONGDEN_CT,1,EVENT_LOG_TITLE,"HopthanhlongdenConTho"} },
		--{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"HopthanhlongdenConThoNhanDiemExp"} },
	},
}
tbConfig[7] = --L�ng ��n Ph��ng
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh L�ng ��n ph��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L�ng ��n ph��ng",1,1,1,0.02},
	tbCondition = 
	{
		{"lib:CheckDay",	{20120927, 20121101, "Th�i h�n ��i �� k�t th�c"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{BANH_HATSEN.szName,BANH_HATSEN,1} },
		{"AddOneMaterial",	{BANH_DAUXANH.szName,BANH_DAUXANH,1} },
		{"AddOneMaterial",	{BANH_KHOAIMON.szName,BANH_KHOAIMON,1} },
		{"AddOneMaterial",	{BANH_NHANTHIT.szName,BANH_NHANTHIT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{LONGDEN_PH,1,EVENT_LOG_TITLE,"HopthanhlongdenPhuong"} },
		--{"PlayerFunLib:AddExp",	{5e6,0,EVENT_LOG_TITLE,"HopthanhlongdenPhuongNhanDiemExp"} },
	},
}
tbConfig[8] = --L�ng ��n r�ng
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh L�ng ��n r�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L�ng ��n r�ng",1,1,1,0.02},
	tbCondition = 
	{
		{"lib:CheckDay",	{20120927, 20121101, "Th�i h�n ��i �� k�t th�c"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{BANH_HATSEN.szName,BANH_HATSEN,1} },
		{"AddOneMaterial",	{BANH_DAUXANH.szName,BANH_DAUXANH,1} },
		{"AddOneMaterial",	{BANH_KHOAIMON.szName,BANH_KHOAIMON,1} },
		{"AddOneMaterial",	{BANH_THAPCAM.szName,BANH_THAPCAM,1} },	
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{LONGDEN_R,1,EVENT_LOG_TITLE,"HopthanhlongdenRong"} },
		--{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"HopthanhlongdenRongNhanDiemExp"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "ClickNpc",
	szName = "T�ng Qu�n S� Ki�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T�ng Qu�n S� Ki�n"},
	tbCondition ={},
	tbActition = 
	{
		{"AddDialogOpt",	{"Tham gia t�m nguy�n li�u gh�p b�nh Trung Thu",10} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "nil",
	szName = "M� �",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:OpenUI",	{nil} },
	},
}
tbConfig[11] = --Mua B�nh d�o t�i npc Hang rong
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "H�ng rong b�n b�nh deo",
	nStartDate = 201209270000,
	nEndDate  = 201210312400,
	tbMessageParam = {"H�ng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua B�nh D�o",12} },
		{"AddDialogOpt",	{"Mua C� R�t",18} },
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Mua b�nh D�o",
	nStartDate = 201209270000,
	nEndDate  = 201210312400,
	tbMessageParam = {"B�nh D�o",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"20000 l��ng",{nJxb=20000,},1} },
		{"lib:CheckDay",	{20120927, 20121101, "Th�i h�n ��i �� k�t th�c"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BANH_DEO,1,EVENT_LOG_TITLE,"MuaBanhDeoNpcHangRong"} },
	},
}
tbConfig[13] = 
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "L�ng ��n B��m B��m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {LONGDEN_BB},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTask",	{nTask_ItemScript_BB,nLimit_LongDen_BB,"Trong su�t th�i gian ho�t ��ng m�i nh�n v�t ch� ���c s� d�ng nhi�u nh�t 1000 L�ng ��n B��m B��m","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_ItemScript_BB,1} },
		{"ThisActivity:Log_LongDenBB",	{nTask_ItemScript_BB}},
	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "L�ng ��n con th�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {LONGDEN_CT},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTask",	{nTask_ItemScript_CT,nLimit_LongDen_CT,"Trong su�t th�i gian ho�t ��ng m�i nh�n v�t ch� ���c s� d�ng nhi�u nh�t 1000 L�ng ��n Con Th�","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_ItemScript_CT,1} },
		--{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,format("SuDung%dLanLongDenConTho",GetTask(nTask_ItemScript_CT))} },
		{"ThisActivity:Log_LongDenCT",	{nTask_ItemScript_CT} },
	},
}
tbConfig[15] = 
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "L�ng ��n ph��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {LONGDEN_PH},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTask",	{nTask_ItemScript_P,nLimit_LongDen_P,"Trong su�t th�i gian ho�t ��ng m�i nh�n v�t ch� ���c s� d�ng nhi�u nh�t 2000 L�ng ��n Ph��ng","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_ItemScript_P,1} },
		--{"PlayerFunLib:AddExp",	{5e6,0,EVENT_LOG_TITLE,format("SuDung%dLanLongDenPhuong",GetTask(nTask_ItemScript_P))} },
		{"ThisActivity:Log_LongDenP",	{nTask_ItemScript_P} },
		{"ThisActivity:GetRabbit",{nil} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "L�ng ��n r�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {LONGDEN_R},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTask",	{nTask_ItemScript_R,nLimit_LongDen_R,"Trong su�t th�i gian ho�t ��ng m�i nh�n v�t ch� ���c s� d�ng nhi�u nh�t 2000 L�ng ��n R�ng","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_ItemScript_R,1} },
		--{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,format("SuDung%dLanLongDenRong",GetTask(nTask_ItemScript_R))} },
		{"ThisActivity:Log_LongDenR",	{nTask_ItemScript_R} },
		{"ThisActivity:Use_LongDenRong",{nil}},
		{"ThisActivity:GetRabbit",{nil} },
	},
}
tbConfig[17] = --t�ng C�u Ti�n Ng� Y�n
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "N�p l�ng ��n k�o qu�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>N�p l�ng ��n k�o qu�n",1,1,1,0.02},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201209\\zhongqiu.lua"} },
		{"lib:CheckTime",	{{{000000,200000},{203000,240000}}, "Kh�ng ph�i l� th�i gian ho�t ��ng"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"ThisActivity:ComposeLimit", {nil}},
		{"AddOneMaterial",	{"L�ng ��n K�o Qu�n",LONGDEN_KQ,1} },			
	},
	tbActition = 
	{
		{"ThisActivity:GiveCompose", {nil}},
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "Mua C� R�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"C� R�t",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"100000 l��ng",{nJxb=100000,},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_CAROT,1,EVENT_LOG_TITLE,"MuaCaRotNpcHangRong"} },
	},
}