

-------�ֲ��������� ��ʼ---------
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "nil",
	szName = "Ph�n th��ng sau khi chuy�n sinh ��t ��n c�p 160 l� phi�n v�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTransLifeCount",	{3,"Ch� c� th� � c�p 190 ti�n h�nh tr�ng sinh l�n 3, ��ng th�i ��t ��n c�p 160 m�i c� th� nh�n ���c ph�n th��ng n�y","=="} },
		{"PlayerFunLib:CheckLevel",	{160,"Ch� c� th� � c�p 190 ti�n h�nh tr�ng sinh l�n 3, ��ng th�i ��t ��n c�p 160 m�i c� th� nh�n ���c ph�n th��ng n�y","=="} },
		{"PlayerFunLib:CheckTaskBit",	{"2582",1,1,"Ch� c� th� � c�p 190 ti�n h�nh tr�ng sinh l�n 3, ��ng th�i ��t ��n c�p 160 m�i c� th� nh�n ���c ph�n th��ng n�y"} },
		{"PlayerFunLib:CheckTaskBit",	{"2582",2,0,"��i hi�p �� nh�n ph�n th��ng n�y r�i."} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,10,7,5,5,0},nExpiredTime=259200,},1,"3rdTransAward"} },
		{"PlayerFunLib:SetTaskBit",	{"2582",2,1} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "Ph�n th��ng sau khi chuy�n sinh ��t ��n c�p 160 l� phi�n v�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�c ��u L�o Nh�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ph�n th��ng sau khi chuy�n sinh ��t ��n c�p 160 l� phi�n v�",1} },
	},
}
