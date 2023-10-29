Include("\\script\\activitysys\\config\\19\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click Nguy�t L�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nguy�t H� l�o nh�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T� H�ng Thi�n L� Nh�n Duy�n",3} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
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
		{"AddDialogOpt",	{"T� H�ng Thi�n L� Nh�n Duy�n",4} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "T� H�ngThi�n L� Nh�n Duy�n c�a Nguy�t L�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�ch Ni�n Tu ��c ��ng Thuy�n ��, Thi�n Ni�n Tu Lai C�ng Ch�m Mi�n, Ta s� d�ng D�y H�ng n�y �� r�ng bu�c nh�n duy�n tr�n th� gian n�y"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a Ng��i kh�ng ��, kh�ng th� tham gia ho�t ��ng",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng'T� H�ng Thi�n L� Nh�n Duy�n'",5} },
		{"AddDialogOpt",	{"Nh�n 'D�y H�ng'",6} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "T� H�ng Thi�n L� Nh�n Duy�n c�a Ch��ng ��ng Cung N�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�t Gi�ng C�y Hoa H�ng v� ��u T��ng T� ng��i ch� ��oc nh�n m�t trong 2 lo�i"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a Ng��i kh�ng ��, kh�ng th� tham gia ho�t ��ng",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng'T� H�ng Thi�n L� Nh�n Duy�n'",5} },
		{"AddDialogOpt",	{"Nh�n H�t Gi�ng Hoa H�ng",7} },
		{"AddDialogOpt",	{"Nh�n ��u T��ng T�",8} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "Gi�i Thi�u ho�t ��ng T� H�ng Thi�n L� Nh�n Duy�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V�o l�c 0h/13/02/2011 ��n 24h/23/02/2011, nh�ng hi�p s� c� ��ng c�p 150 v� 150 tr� l�n c� th� mua H�t Gi�ng C�y T�nh Nh�n t�i shop Tinh L�c, Hi�p s� ng��i c� th� �em H�t Gi�ng C�y T�nh Nh�n tr�ng C�y T�nh Nh�n � ngo�i Th�t ��i Th�nh Th� v� B�t ��i T�n Th� Th�n, khi H�t Gi�ng C�y T�nh Nh�n l�n l�n tr� th�nh C�y T�nh Nh�n, Hi�p S� c� th� thu ho�ch L� H�p T�nh Nh�n � tr�n C�y T�nh Nh�n, m�i ng�y Hi�p S� c� th� ��n ch� c�a Nguy�t H� L�o Nh�n �� nh�n m�t D�y H�ng, tr�n m�i D�y H�ng ��u c� m�t S� Nh�n Duy�n , khi Ng��i nh�n xong D�y H�ng th� c� th� ��n ch� c�a Ch��ng ��ng Cung N� nh�n ��u T��ng T� ho�c l� H�t Gi�ng Hoa H�ng, m�i ng�y Hi�p S� c�  2 c� h�i nh�n H�t Gi�ng Hoa H�ng ho�c ��u T��ng T�, m�i m�t c� h�i ng��i c� th� l�a ch�n nh�n 1 H�t Gi�ng Hoa H�ng ho�c ��u T��ng T�, n�u nh� trong ng�y c� h�i nh�n H�t Gi�ng Hoa H�ng ho�c ��u T��ng T� c�a Ng��i ch�a d�ng h�t , nh� v�y ng��i c� th� t�ch l�y c� h�i nh�n ��n ng�y h�m sau ti�p t�c nh�n, m�i Hi�p S� ch� ���c t�ch l�y c� h�i nh�n H�t Gi�ng Hoa H�ng ho�c ��u T��ng T� t�i �a l� 6 l�n, v��t qu� 6 l�n th� kh�ng th� ti�p t�c t�ch l�y ���c n�a, v�t ph�m Qu�nh T��ng Ng�c D�ch t�i shop Tinh L�c c� th� gi�p Ng��i t�ng th�m m�t l�n c� h�i nh�n H�t Gi�ng Hoa H�ng ho�c ��u T��ng T�, nh�n v� tr�ng ��u T��ng T� kh�ng c� h�n ch�, nh�n v� tr�ng H�t Gi�ng Hoa H�ng y�u c�u ph�i th�a m�n 1 trong hai �i�u ki�n d��i ��y.\n1. hai ng��i ch�i kh�c gi�i t�nh c�ng t� ��i v�i nhau s� Nh�n Duy�n tr�n D�y H�ng c�a 2 ng��i ch�i c�ng t� ��i ph�i h�p th�nh ��i ( s� c�p ch�n ). \n2.Phu th� 2 ng��i t� ��i \nhi�p s� ng��i c� th� c�ng v�i ng��i b�n kh�c gi�i c�a m�nh c�ng nhau ��n b�n ngo�i Th�t ��i Th�nh Th� v� B�t ��i T�n Th� Th�n �� tr�ng H�t Gi�ng Hoa H�ng, hai ng��i kh�c gi�i t�nh c�ng t� ��i s� c�ng nhau ch�m s�c M�m C�y Hoa H�ng m� ng��i kia tr�ng xu�ng, trong th�i gian M�m C�y Hoa H�ng l�n l�n th�nh C�y Hoa H�ng N� ��y Hoa, Hi�p s� ph�i k�p th�i ti�n h�nh t��i n��c, b�n ph�n, b�t s�u, nh� c� , vi�c m� ng��i b�t s�u t��i n��c, nh� c�, b�n ph�n c�ng k�p th�i nhanh ch�ng th� tr�n C�y Hoa H�ng cu�i c�ng ���c ch�m s�c s� cho c�ng nhi�u L� H�p Hoa H�ng, khi C�y Hoa H�ng l�n l�n th�nh C�y Hoa H�ng N� ��y Hoa, Ng��i c� th� thu ho�ch L� H�p Hoa H�ng � tr�n C�y Hoa H�ng c�a ng��i tr�ng, tr�ng ��u T��ng T� kh�ng c�n t� ��i , tr�ng C�y T��ng T� c�ng ph�i t��i n��c, b�t s�u, nh� c�, b�n ph�n, n�u vi�c Ng��i t��i n��c, nh� c�, b�n ph�n, b�t s�u c�ng k�p th�i ��ng l�c th� ph�n th��ng nh�n ��oc cu�i c�ng c�ng phong ph�, sau khi C�y T��ng T� tr��ng th�nh , Hi�p s� ng��i c� th� thu ho�ch L� H�p T��ng T� v�i s� l��ng t��ng �ng."},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "Nh�n D�y H�ng � ch� Nguy�t L�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{GetHongXian,0,"H�m nay ng��i �� nh�n D�y H�ng r�i","=="} },
		{"ThisActivity:CheckHongXian",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��, kh�ng th� nh�n ��o c�"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveHongXian",	{nil} },
		{"ThisActivity:SetValentineRandNumber",	{ValentineNumber} },
		{"ThisActivity:AddTaskDaily",	{GetHongXian,1} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "Nh�n H�t Gi�ng Hoa H�ng � ch� Ch��ng ��ng Cung N�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��u T��ng T� v� H�t Gi�ng C�y Hoa H�ng ti�u hi�p ng��i ch� ���c nh�n 1 trong hai lo�i, ti�u hi�p n�u ng��i mu�n nh�n H�t Gi�ng C�y Hoa H�ng, c�n ph�i th�a m�n 1 trong 2 �i�u ki�n d��i ��y<enter>1. Hai ng��i ch�i kh�c gi�i t�nh t� ��i v�i nhau, S� Nh�n Duy�n c�a 2 ng��i ch�i c�ng t� ��i ph�i l� s� ch�n ( s� c�p ch�n )<enter>2. Phu th� 2 ng��i t� ��i v�i nhau"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n nh�n H�t Gi�ng Hoa H�ng",9} },
		{"AddDialogOpt",	{"�� ta suy ngh� k� l�i xem",4} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateDialog",
	szName = "Nh�n ��u T��ng T� � ch� Ch��ng ��ng Cung N�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��u T��ng T� v� H�t Gi�ng C�y Hoa H�ng ti�u hi�p ng��i ch� c� th� nh�n 1 trong 2 lo�i n�y, ti�u hi�p ng��i ch�a t�m ���c nh�n duy�n c�a m�nh �, ng��i c� th� nh�n 1 ��u T��ng T� � ch� c�a ta r�i �i tr�ng, ch� c� �i�u ph�n th��ng tr�ng ��u T��ng T� kh�ng phong ph� b�ng tr�ng C�y Hoa H�ng, ti�u hi�p hay l� ng��i nhanh ch�ng �i t�m nh�n duy�n c�a m�nh �i."},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n nh�n ��u T��ng T�",10} },
		{"AddDialogOpt",	{"�� ta suy ngh� k� l�i xem",4} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "Nh�n H�t Gi�ng Hoa H�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckGetMeiGuiHuaZiCondition",	{nil} },
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"S� l�n nh�n �� d�ng h�t",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��, kh�ng th� nh�n ��o c�"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2697,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"L� T�nh Nh�n n�m 2011, nh�n ���c H�t Gi�ng Hoa H�ng"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "nil",
	szName = "Nh�n ��u T��ng T�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"S� l�n nh�n �� d�ng h�t",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��, kh�ng th� nh�n ��o c�"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2698,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"L� T�nh Nh�n n�m 2011, nh�n ���c ��u T��ng T�"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "S� d�ng Qu�nh T��ng Ng�c Di�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2703,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckQJYYTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a ��",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{QJYY_ExGetSeedTime,1} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
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
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
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
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
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
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
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
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
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
