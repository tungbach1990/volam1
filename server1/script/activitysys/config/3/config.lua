

-------�ֲ��������� ��ʼ---------
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "nil",
	szName = "Ch�n d�ng ch�n t�ng v�n b�o r��ng",
	nStartDate = 200910150000,
	nEndDate  = 200911020000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2564,0,"M�i ng�y ch� ���c nh�n mi�n ph� 1 <color=yellow>v�n b�o r��ng<color> t�<color=yellow>Nam H�i K� Nh�n<color>","=="} },
		{"PlayerFunLib:CheckLevel",	{140,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{"return {tbProp={6,1,2157,1,0,0},nExpiredTime=10080,}",1,"wanbaoxiang,get from npc"} },
		{"PlayerFunLib:AddTaskDaily",	{2564,1} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "S� d�ng [V�n b�o r��ng mi�n ph�]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2157,-1,-1,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2565,9,"M�i ng�y ch� ���c s� d�ng t�i �a 9 <color=yellow> v�n b�o r��ng<color>","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{16,1,"wanbaoxiang,Use_Free_Box","",""} },
		{"PlayerFunLib:AddTaskDaily",	{2565,1} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "S� d�ng [V�n b�o r��ng thu ph�]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2158,-1,-1,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2565,9,"M�i ng�y ch� ���c s� d�ng t�i �a 9 <color=yellow> v�n b�o r��ng<color>","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{17,1,"wanbaoxiang,Use_Free_Box","",""} },
		{"PlayerFunLib:AddTaskDaily",	{2565,1} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "B�m v�o Nam H�i K� Nh�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nam H�i K� Nh�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T�ng v�n b�o r��ng",1} },
	},
}
