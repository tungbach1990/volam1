Include("\\script\\activitysys\\config\\25\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "Click v�o Nguy�n ��n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nguy�n ��n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng ��p tr�ng vui v�",3} },
		{"AddDialogOpt",	{"D�ng Ch�y V�ng Nguy�n ��n ��p tr�ng",21} },
		{"AddDialogOpt",	{"D�ng Ch�y B�c Nguy�n ��n ��p tr�ng",22} },
		{"AddDialogOpt",	{"D�ng Ch�y ��ng Nguy�n ��n ��p tr�ng",23} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng s� d�ng Ch�y B�c v� Ch�y V�ng Nguy�n ��n ��t ��n 200 l�n",7} },
		{"SetDialogTitle",	{"<lua random(1,100) < 100 and [[ �au ]] or [[ ��i hi�p xin ��ng �]]/>"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Gi�i thi�u ho�t ��ng ��p tr�ng vui v�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T� 0h ng�y 21 th�ng 12 n�m 2010 ��n 24h ng�y 10 th�ng 1 n�m 2011,��i hi�p ng��i c� th� c�m Ch�y ��ng Nguy�n ��n, Ch�y B�c Nguy�n ��n, Ch�y V�ng Nguy�n ��n ��n ch� c�a 'Nguy�n ��n' �� ��p tr�ng, ng��i s� nh�n ���c ni�m vui b�t ng�, ��i hi�p n�u ng��i mu�n d�ng Ch�y B�c Nguy�n ��n, Ch�y ��ng Nguy�n ��n �� ��p tr�ng, ngo�i vi�c ng��i c�n c� ch�y t��ng �ng ra, c�n c�n ph�i th�a m�n 2 �i�u ki�n d��i ��y<enter>1, c�n ph�i t� ��i v�i 3 ng��i, t� ��i 3 ng��i c�n ph�i �eo M�t N� D� Dung nh�n � L� Quan t�i Bi�n Kinh, T��ng D��ng ho�c L�m An<enter>2, t� ��i 3 ng��i c�n ph�i �eo M�t N� D� Dung c� m�u s�c gi�ng nhau, h�nh d�ng b�n ngo�i th� kh�ng gi�ng nhau <enter> d�ng Ch�y V�ng Nguy�n ��n th� kh�ng c�n �i�u ki�n g� c�, trong �� Ch�y ��ng Nguy�n ��n ng��i c� th� nh�n � L� Quan, Ch�y B�c Nguy�n ��n ��i hi�p c� th� tham gia c�c h� th�ng tr� ch�i trong game th� nh�n ���c, Ch�y V�ng Nguy�n ��n b�n c� th� l�y n� � K� Tr�n C�c."},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "D�ng Ch�y V�ng Nguy�n ��n ��p tr�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"Ch�y B�c v� Ch�y V�ng Nguy�n ��n s� d�ng trong ho�t ��ng l�n n�y nhi�u nh�t 200 l�n","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2608,1,0,0},},1,format("Kh�ng c� <color=yellow>%s<color> kh�ng th� ��p tr�ng","Ch�y V�ng Nguy�n ��n")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemGoldAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Ch�y V�ng Nguy�n ��n")} },
		{"ThisActivity:GetGoldExp",	{GoldExpAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Ch�y V�ng Nguy�n ��n"),TaskVarIdx_GetGoldExpSum,GoldExpLimit} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2608,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "D�ng Ch�y B�c Nguy�n ��n ��p tr�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"Ch�y B�c v� Ch�y V�ng Nguy�n ��n s� d�ng trong ho�t ��ng l�n n�y nhi�u nh�t 200 l�n","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2607,1,0,0},},1,format("Kh�ng c� <color=yellow>%s<color> kh�ng th� ��p tr�ng","Ch�y B�c Nguy�n ��n")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemSilverAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Ch�y B�c Nguy�n ��n")} },
		{"PlayerFunLib:AddExp",	{SilverExpAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Ch�y B�c Nguy�n ��n")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2607,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "D�ng Ch�y ��ng Nguy�n ��n ��p tr�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,5,"Ch�y ��ng Nguy�n ��n m�i ng�y ch� s� d�ng nhi�u nh�t 5 l�n","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2606,1,0,0},},1,format("Kh�ng c� <color=yellow>%s<color> kh�ng th� ��p tr�ng","Ch�y ��ng Nguy�n ��n")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemBronzeAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Ch�y ��ng Nguy�n ��n")} },
		{"PlayerFunLib:AddExp",	{BronzeExpAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Ch�y ��ng Nguy�n ��n")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2606,1,0,0},},1} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,1} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng s� d�ng Ch�y B�c v� Ch�y V�ng Nguy�n ��n ��t ��n 200 l�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"��i hi�p ng��i ch�a s� d�ng �� 200 l�n Ch�y B�c v� Ch�y V�ng Nguy�n ��n, Ti�p t�c c� g�ng nh�!",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_IsGet300Award,0,"B�n ��  l�nh th��ng r�i","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{Get300Award,1,"Nh�n ph�n th��ng s� d�ng Ch�y B�c Nguy�n ��n ��t ��n 200 l�n"} },
		{"ThisActivity:AddTask",	{TaskVarIdx_IsGet300Award,1} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = format("Ph�n th��ng v��t �i ��t ��n %d �i",17),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("Ph�n th��ng v��t �i ��t ��n %d �i",17)} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "FinishSongJin",
	szName = format("Ph�n th��ng �i�m t�ch l�y T�ng Kim cao c�p ��t ��n %d",3000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("Ph�n th��ng �i�m t�ch l�y T�ng Kim cao c�p ��t ��n %d",3000)} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "B�m v�o th� luy�n ���ng tr��ng l�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr��ng l�o Th� Luy�n ���ng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho�t ��ng ��p Tr�ng vui v�",25} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Phong L�ng ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},10,"100"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "Nhi�m v� S�t th� ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("%s ph�n th��ng","Nhi�m v� S�t th� ")} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CaiJiHuiHuangZhiGuo",
	szName = "Nh�t qu� huy ho�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("%s ph�n th��ng","Nh�t qu� huy ho�ng")} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "Boss Th� Gi�i r�i ra",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},15,"100"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "nil",
	szName = "Nh�n Ch�y B�c Nguy�n ��n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,0,format("H�m nay ng��i �� nh�n � ch� c�a ta %s r�i","Ch�y B�c Nguy�n ��n"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,"Nh�n � Th� Luy�n ���ng"} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,1} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "Chuanguan",
	szName = format("Ph�n th��ng v��t �i ��t ��n %d �i",28),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("Ph�n th��ng v��t �i ��t ��n %d �i",28)} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "B�m v�o L� Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L� Quan"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho�t ��ng ��p Tr�ng vui v�",24} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "nil",
	szName = "Nh�n M�t N� D� Dung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetYiRongMianJu,0,format("H�m nay ng��i �� nh�n � ch� c�a ta %s r�i","M�t N� D� Dung Nguy�n ��n"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetYiRongMianJu,1} },
		{"PlayerFunLib:GetItem",	{ItemMianJuAward,1,"Nh�n t� L� Quan"} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "nil",
	szName = "Nh�n Ch�y ��ng Nguy�n ��n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetTongChui,0,format("H�m nay ng��i �� nh�n � ch� c�a ta %s r�i","Ch�y ��ng Nguy�n ��n"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetTongChui,1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2606,1,0,0},nExpiredTime=20110121,},5,"Nh�n t� L� Quan"} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ServerStart",
	szName = "Kh�i ��ng sever",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddYuanDanDialogNpc",	{nil} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "CreateDialog",
	szName = "Ph�i ch�ng s� d�ng Ch�y V�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("Ng��i x�c ��nh mu�n s� d�ng <color=yellow>%s<color> kh�ng?","Ch�y V�ng Nguy�n ��n")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X�c nh�n",4} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "Ph�i ch�ng s� d�ng Ch�y B�c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("Ng��i x�c ��nh mu�n s� d�ng <color=yellow>%s<color> kh�ng?","Ch�y B�c Nguy�n ��n")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X�c nh�n",5} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "Ph�i ch�ng s� d�ng Ch�y ��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("Ng��i x�c ��nh mu�n s� d�ng <color=yellow>%s<color> kh�ng?","Ch�y ��ng Nguy�n ��n")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X�c nh�n",6} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "��i tho�i L� Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Huan ngh�nh tham gia ho�t ��ng ��p Tr�ng vui v�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nh�n M�t N� D� Dung",18} },
		{"AddDialogOpt",	{"Nh�n Ch�y ��ng Nguy�n ��n",19} },
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "CreateDialog",
	szName = "��i tho�i Tr��ng L�o Th� Luy�n ���ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Hoan ngh�nh tham gia ho�t ��ng ��p Tr�ng vui v�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nh�n Ch�y B�c Nguy�n ��n",15} },
	},
}
