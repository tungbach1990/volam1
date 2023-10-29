Include("\\script\\activitysys\\config\\22\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "B�m v�o v� s�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V� S� "},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho�t ��ng b�o ��p �n s�",2} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "��i tho�i v�i v� s�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L�i m�t n�m s��ng phong m�a tuy�t, l�i m�t n�m ��o l� t�a h��ng,  Kh�ng bi�t �� t� c�a ta h�nh t�u giang h� ra sao r�i?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng b�o ��p �n s�",3} },
		{"AddDialogOpt",	{"M�i v� s� d�ng �� Khang T�u",4} },
		{"AddDialogOpt",	{"D�ng t�ng Ng� S�c H��ng Bao",23} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Gi�i thi�u ho�t ��ng b�o ��p �n s�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V�o th�i gian t� 18/11/2010 ��n 13/12/2010 l� th�i gian ho�t ��ng b�o ��p �n s�. C�c h� c� th� xem c�ch tham gia � trang ch�."},
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
	szName = "M�i v� s� d�ng �� Khang T�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2572,-1,-1,-1},},nDukangjiuCount,"H�nh trang kh�ng c� �� Khang T�u"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddDukangjiuAward",	{TSK_DuKangJiu,TSK_Date_DuKangJiu,nDukangjiuCount} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "ClickNpc",
	szName = "B�m v�o ch��ng ��ng cung n�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch��ng ��ng Cung N�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho�t ��ng b�o ��p �n s�",6} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "��i tho�i v�i ch��ng ��ng cung n�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"G�n ��y ta c�n 1 �t T�y H� long t�nh tr�, t� l�a, s�i ch� m�u, trung d��c , ta r�t c�n g�p nh�ng th� n�y, n�u nh� ng��i t�ng ta nh�ng th� tr�n, ta s� t�ng cho ng��i ph�n th��ng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng b�o ��p �n s�",3} },
		{"AddDialogOpt",	{"��i t� t�m h��ng bao",7} },
		{"AddDialogOpt",	{"��i ng� s�c h��ng bao",8} },
		{"AddDialogOpt",	{"��i trung d��c h��ng bao",9} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "��i t� t�m h��ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T� T�m H��ng Bao",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T�y H� Long T�nh Tr�",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"T� T�m",{tbProp={6,1,2574,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2577,1,0,0},nExpiredTime=20101220,},1,"Ng��i ch�i nh�n ���c T� T�m H��ng Bao"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "��i ng� s�c h��ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ng� S�c H��ng Bao",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T�y H� Long T�nh Tr�",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"S�i ch� m�u",{tbProp={6,1,2575,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2578,1,0,0},nExpiredTime=20101220,},1,"Ng��i ch�i nh�n ���c ng� s�c h��ng bao"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "��i trung d��c h��ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Trung D��c H��ng Bao",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T�y H� Long T�nh Tr�",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"Trung D��c",{tbProp={6,1,2576,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2579,1,0,0},nExpiredTime=20101220,},1,"Ng��i ch�i nh�n ���c trung d��c h��ng bao"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "T�ng Kim 500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",500,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"Event nh� gi�o_T�ng Kim"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "T�ng Kim 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"Event nh� gi�o_T�ng Kim"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
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
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},15,"100"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "V��t �i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"Event nh� gi�o_V��t �i"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "nil",
	szName = "��i tho�i v�i th� luy�n ���ng tr��ng l�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSK_ShiLianTang,nDailyShiliantang,"H�m nay kh�ng th� nh�n th�m","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng �� ch�, c�n �t nh�t kh�ng gian 1*1"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},1,"Event nh� gi�o_Th� luy�n ���ng"} },
		{"ThisActivity:AddTaskDaily",	{TSK_ShiLianTang,nDailyShiliantang} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "S�t th� c�p 90",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},2,"Event nh� gi�o_S�t th� c�p 90"} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "ClickNpc",
	szName = "B�m v�o h�ng rong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�ng rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua t� l�a",17} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Mua t� l�a",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T� T�m",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng�n l��ng",{nJxb=1},30000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2574,1,0,0},nExpiredTime=20101213,},1,"Event nh� gi�o_H�ng Rong"} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "S� d�ng �� Khang t�u l� bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2580,-1,-1,-1},nExpiredTime=20101213,}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng �� ch�, c�n �t nh�t kh�ng gian 1*1"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},2,"Event nh� gi�o_S� d�ng �� Khang T�u l� bao"} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "S� d�ng t� t�m h��ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2577,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_SiChouXiangBao,nSCXiangBaoUpExp,"S� d�ng t� t�m h��ng bao ��t ��n gi�i h�n cao nh�t, kh�ng th� s� d�ng th�m.","<"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"��i hi�p �� ��t gi�i h�n s� d�ng v�t ph�m n�y","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddSichouxiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "S� d�ng ng� s�c h��ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2578,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckFreeRoom",	{2,3,1,"H�nh trang kh�ng �� ch�, c�n �t nh�t kh�ng gian 2*3"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"��i hi�p �� ��t gi�i h�n s� d�ng v�t ph�m n�y","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddWucaixiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "S� d�ng trung d��c h��ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2579,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckFreeRoom",	{2,5,1,"H�nh trang kh�ng �� ch�, c�n �t nh�t kh�ng gian 2*5"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"��i hi�p �� ��t gi�i h�n s� d�ng v�t ph�m n�y","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddZhongyaoxiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
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
		{"AddDialogOpt",	{"Nh�n �� Khang T�u",14} },
	},
}

tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "nil",
	szName = "D�ng t�ng Ng� S�c H��ng Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2578,-1,-1,-1},},1,"H�nh trang kh�ng c� Ng� S�c H��ng Bao"} },
	},
	tbActition = 
	{
		{"ThisActivity:Give5SHB",	{nEXP_Give_NSHB, TSK_Date_Give_NSHB} },
	},
}