Include("\\script\\activitysys\\config\\1005\\variables.lua")
tbConfig = {}
tbConfig[1] = --T� l�c ng�ng th�n t�n
{
	nId = 1,
	szMessageType = "ItemScript",
	szName = "S� d�ng T� l�c ng�ng th�n t�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30142,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_TU_LUC_NGUNG_THAN_TAN_LIMIT_USE, 0, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 1 l�n.", "=="}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_TU_LUC_NGUNG_THAN_TAN_LIMIT_USE, 1}},
		{"PlayerFunLib:AddExp",	{500e6,0,strLOG_HEAD,"SuDungTuLucNgungThanTan"} },
	},
}
tbConfig[2] = --T� l�c ng�ng th�n ho�n
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "S� d�ng T� l�c ng�ng th�n ho�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30143,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_TU_LUC_NGUNG_THAN_HOAN_LIMIT_USE, 0, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 1 l�n.", "=="}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_TU_LUC_NGUNG_THAN_HOAN_LIMIT_USE, 1}},
		{"PlayerFunLib:AddExp",	{1000e6,0,strLOG_HEAD,"SuDungTuLucNgungThanHoan"} },
	},
}
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "S� d�ng Huy�n V� Kim C��ng T�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30278,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_HUYEN_VU_KIM_CUONG_TAN_LIMIT_USE, 0, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 1 l�n.", "=="}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_HUYEN_VU_KIM_CUONG_TAN_LIMIT_USE, 1}},
		{"PlayerFunLib:AddExp",	{2e9,0,strLOG_HEAD,"SuDungHuyenVuKimCuongTan"} },
		{"PlayerFunLib:AddTask",	{4000, 2000} },
		{"Msg2Player", {"Nh�n ���c 2000 �i�m ch�n nguy�n"}}, 
	},
}
tbConfig[4] = 
{
	nId = 4,
	szMessageType = "ItemScript",
	szName = "S� d�ng Th�ng Thi�n Minh Ng�c Ho�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30279,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_THONG_THIEN_MINH_NGOC_HOAN_LIMIT_USE, 0, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 1 l�n.", "=="}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_THONG_THIEN_MINH_NGOC_HOAN_LIMIT_USE, 1}},
		{"PlayerFunLib:AddExp",	{4e9,0,strLOG_HEAD,"SuDungThongThienMinhNgocHoan"} },
		{"PlayerFunLib:AddTask",	{4000, 5000} },
		{"Msg2Player", {"Nh�n ���c 5000 �i�m ch�n nguy�n"}}, 
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "FinishYesou",
	szName = "ho�n th�nh 1 nhi�m v� D� T�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {0},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_YESOU_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_YESOU_QUEST_COUNT, 1}},
	},
}
tbConfig[6] = --boss s�t th�
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "Nhi�m v� s�t th� c�p 90",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_KILLER_BOSS_QUEST_COUNT}},
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_KILLER_BOSS_QUEST_COUNT, 1}},
	},
}
tbConfig[7] = --T�ng kim 500 �i�m
{
	nId = 7,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 500 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{500,">="} },
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_SONGJIN_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_SONGJIN_QUEST_COUNT, 1}},
	},
}
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = "HoanThanhAi20",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"10"},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_COT_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_COT_QUEST_COUNT, 1}},		
	},
}
tbConfig[9] = --Vi�m ��
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {3},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_YDBZ_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_YDBZ_QUEST_COUNT, 1}},
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "FinishVLMC_VNG",
	szName = "ho�n th�nh 1 nhi�m v� V� L�m Minh Ch�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_VLMC_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_VLMC_QUEST_COUNT, 1}},
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "FLD_Collect_Item_VNG",
	szName = "ho�n th�nh 1 nhi�m v� thu th�p c�ng tr�ng l�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_FLD_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_FLD_QUEST_COUNT, 1}},		
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "OnLogin",
	szName = "Ng��i ch�i tr�c tuy�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "S� d�ng Ch�n Phong Th�y T�c Nghi�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30440,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_CHAN_PHONG_THUY, 0, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 1 l�n.", "=="}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_CHAN_PHONG_THUY, 1}},
		{"PlayerFunLib:AddExp",	{3e9,0,strLOG_HEAD,"SuDungChanPhongThuyTacNghiep"} },
		{"PlayerFunLib:AddTask",	{4000, 5000} },
		{"Msg2Player", {"Nh�n ���c 5000 �i�m ch�n nguy�n"}}, 
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "S� d�ng Ch�n Gi�c Kinh T�c V�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30441,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_CHAN_GIAC, 0, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y 1 l�n.", "=="}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_CHAN_GIAC, 1}},
		{"PlayerFunLib:AddExp",	{5e9,0,strLOG_HEAD,"SuDungChanPhongThuyTacNghiep"} },
		{"PlayerFunLib:AddTask",	{4000, 10000} },
		{"Msg2Player", {"Nh�n ���c 10000 �i�m ch�n nguy�n"}}, 
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "S� d�ng C�u Ni�n Vi�m �� L�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30463,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"ThisActivity:CanAutoFinishQuest",	{7} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_1, tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_1.nMaxValue, "S� d�ng v�t ph�m �� ��t gi�i h�n ng�y, mai r�i h�y s� d�ng ti�p", "<"}},		
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_1, 1}},
		{"ThisActivity:AutoFinishQuest",	{7} },
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "S� d�ng C�u Ni�n Th�y T�c L�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30464,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"ThisActivity:CanAutoFinishQuest",	{6} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_2, tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_2.nMaxValue, "S� d�ng v�t ph�m �� ��t gi�i h�n ng�y, mai r�i h�y s� d�ng ti�p", "<"}},		
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_2, 1}},
		{"ThisActivity:AutoFinishQuest",	{6} },
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "S� d�ng C�u Ni�n V��t �i L�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30465,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"ThisActivity:CanAutoFinishQuest",	{4} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_3, tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_3.nMaxValue, "S� d�ng v�t ph�m �� ��t gi�i h�n ng�y, mai r�i h�y s� d�ng ti�p", "<"}},		
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_3, 1}},
		{"ThisActivity:AutoFinishQuest",	{4} },
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "S� d�ng C�u Ni�n Phong V�n L�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30466,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"ThisActivity:CanAutoFinishQuest",	{5} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_4, tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_4.nMaxValue, "S� d�ng v�t ph�m �� ��t gi�i h�n ng�y, mai r�i h�y s� d�ng ti�p", "<"}},		
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_4, 1}},
		{"ThisActivity:AutoFinishQuest",	{5} },
	},
}