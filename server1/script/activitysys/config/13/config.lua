

-------�ֲ��������� ��ʼ---------
local TASK_TIME_LEFT_A		= 2662
local TASK_TIME_LEFT_B		= 2663
local TASK_ITEM_USED_A		= 2664
local TASK_ITEM_USED_B		= 2665
-------�ֲ��������� ����---------

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
	szMessageType = "nil",
	szName = "T�ch Huy�t C�c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"C�p b�c qu� th�p, e r�ng qu� nguy hi�m v�i ��i hi�p!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"Th�i gian tu luy�n c�a c�c h� �� h�t!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{917,1816,3392} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "nil",
	szName = "�c Nh�n C�c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"C�p b�c qu� th�p, e r�ng qu� nguy hi�m v�i ��i hi�p!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"Th�i gian tu luy�n c�a c�c h� �� h�t!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{918,1816,3392} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "Th�c C�t Nhai",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"C�p b�c qu� th�p, e r�ng qu� nguy hi�m v�i ��i hi�p!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"Th�i gian tu luy�n c�a c�c h� �� h�t!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{919,1608,3168} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "H�c M�c Nhai",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"C�p b�c qu� th�p, e r�ng qu� nguy hi�m v�i ��i hi�p!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"Th�i gian tu luy�n c�a c�c h� �� h�t!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{920,1608,3168} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "Thi�n Ph� S�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"C�p b�c qu� th�p, e r�ng qu� nguy hi�m v�i ��i hi�p!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"Th�i gian tu luy�n c�a c�c h� �� h�t!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{921,1560,3104} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "B�n Long S�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"C�p b�c qu� th�p, e r�ng qu� nguy hi�m v�i ��i hi�p!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"Th�i gian tu luy�n c�a c�c h� �� h�t!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{922,1560,3104} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "��a M�u S�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"C�p b�c qu� th�p, e r�ng qu� nguy hi�m v�i ��i hi�p!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"Th�i gian tu luy�n c�a c�c h� �� h�t!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{923,2008,4080} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "Uy�n Ph�ng S�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"C�p b�c qu� th�p, e r�ng qu� nguy hi�m v�i ��i hi�p!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"Th�i gian tu luy�n c�a c�c h� �� h�t!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{924,2008,4080} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "S� d�ng B�ch C�t L�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2255,1,0,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"Ph�i l� ng��i ch�i n�p th� v� c�p 130 tr� l�n m�i c� th� s� d�ng",">="} },
		{"PlayerFunLib:IsCharged",	{"Ph�i l� ng��i ch�i n�p th� v� c�p 130 tr� l�n m�i c� th� s� d�ng"} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,1020,"Th�i gian tu luy�n c�a b�ch c�t nhi�u nh�t ch� ���c t�ch l�y 1080 ph�t!","<="} },
		{"PlayerFunLib:CheckTaskDaily",	{TASK_ITEM_USED_A,3,"��o c� n�y m�i ng�y ch� ���c s� d�ng 3 l�n!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{TASK_ITEM_USED_A,1} },
		{"dostring",	{"local nLeftTime = GetTask(2662); if  nLeftTime < 0 then nLeftTime = 60; else nLeftTime = nLeftTime + 60; end SetTask(2662, nLeftTime);"} },
		{"dostring",	{"Msg2Player(format([[Th�i gian t�ch l�y tu luy�n c�a b�ch c�t l� %d ph�t]], GetTask(2662)))"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "S� d�ng Thi�n Long L�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2256,1,0,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"Ph�i l� ng��i ch�i n�p th� v� c�p 130 tr� l�n m�i c� th� s� d�ng",">="} },
		{"PlayerFunLib:IsCharged",	{"Ph�i l� ng��i ch�i n�p th� v� c�p 130 tr� l�n m�i c� th� s� d�ng"} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,1020,"Th�i gian t�ch l�y tu luy�n nhi�u nh�t c�a thi�n long l� 1080 ph�t","<="} },
		{"PlayerFunLib:CheckTaskDaily",	{TASK_ITEM_USED_B,3,"��o c� n�y m�i ng�y ch� ���c s� d�ng 3 l�n!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{TASK_ITEM_USED_B,1} },
		{"dostring",	{"local nLeftTime = GetTask(2663); if  nLeftTime < 0 then nLeftTime = 60; else nLeftTime = nLeftTime + 60; end SetTask(2663, nLeftTime);"} },
		{"dostring",	{"Msg2Player(format([[Th�i gian t�ch l�y tu luy�n c�a thi�n long l� %d ph�t]], GetTask(2663)))"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "B�m v�o xa phu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Xa phu"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�i ��n b�n �� m�i",13} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "Ch�n d�ng ch�n b�n ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Kh�ch quan mu�n �i ��u?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T�ch Huy�t C�c",2} },
		{"AddDialogOpt",	{"�c Nh�n C�c",3} },
		{"AddDialogOpt",	{"Th�c C�t Nhai",4} },
		{"AddDialogOpt",	{"H�c M�c Nhai",5} },
		{"AddDialogOpt",	{"Thi�n Ph� S�n",6} },
		{"AddDialogOpt",	{"B�n Long S�n",7} },
		{"AddDialogOpt",	{"��a M�u S�n",8} },
		{"AddDialogOpt",	{"Uy�n Ph�ng S�n",9} },
	},
}
