Include("\\script\\activitysys\\config\\18\\awardlist.lua")
EVENT_LOG_TITLE		= "EVENT_THANG3_2013"
MIN_LEVEL		= 150

END_DATE = 20130401

ITEM_ROSE_BAG		= {szName="T�i Hoa H�ng", tbProp={6,1,3474,1,0,0}, nExpiredTime=END_DATE}

ITEM_RED_ROSE = {szName="Hoa H�ng ��", tbProp={6,1,3469,1,0,0}, nExpiredTime=END_DATE}
ITEM_YELLOW_ROSE = {szName="Hoa H�ng V�ng", tbProp={6,1,3472,1,0,0}, nExpiredTime=END_DATE}
ITEM_GREEN_ROSE = {szName="Hoa H�ng L�c", tbProp={6,1,3471,1,0,0}, nExpiredTime=END_DATE}
ITEM_WHITE_ROSE		= {szName="Hoa H�ng Tr�ng", tbProp={6,1,3470,1,0,0}, nExpiredTime=END_DATE}

ITEM_BLUE_ROSE = {szName="Hoa H�ng Lam", tbProp={6,1,3473,1,0,0}, nExpiredTime=END_DATE}

ITEM_YELLOW_ROSE_BAG		= {szName="T�i H��ng Hoa H�ng V�ng", tbProp={6,1,3475,1,0,0}, nExpiredTime=END_DATE}
ITEM_GREEN_ROSE_BAG		= {szName="T�i H��ng Hoa H�ng Xanh", tbProp={6,1,3477,1,0,0}, nExpiredTime=END_DATE}
ITEM_RED_ROSE_BAG		= {szName="T�i H��ng Hoa H�ng ��", tbProp={6,1,3476,1,0,0}, nExpiredTime=END_DATE}

ITEM_YELLOW_ROSE_BAG_ADV		= {szName="T�i H��ng Hoa H�ng V�ng Cao C�p", tbProp={6,1,3478,1,0,0}, nExpiredTime=END_DATE}
ITEM_GREEN_ROSE_BAG_ADV		= {szName="T�i H��ng Hoa H�ng Xanh Cao C�p", tbProp={6,1,3480,1,0,0}, nExpiredTime=END_DATE}
ITEM_RED_ROSE_BAG_ADV		= {szName="T�i H��ng Hoa H�ng �� Cao C�p", tbProp={6,1,3479,1,0,0}, nExpiredTime=END_DATE}

TSK_YELLOW_BAG = 1
TSK_GREEN_BAG = 2
TSK_RED_BAG = 3

TSK_YELLOW_BAG_ADV = 4
TSK_GREEN_BAG_ADV = 5
TSK_RED_BAG_ADV = 6 

TSK_USE_YELLOW_BAG = 7
TSK_USE_GREEN_BAG = 8
TSK_USE_RED_BAG = 9

TSK_USE_YELLOW_BAG_ADV = 10
TSK_USE_GREEN_BAG_ADV = 11
TSK_USE_RED_BAG_ADV = 12

--MAX_YELLOW = {MAN, WOMAN}
MAX_YELLOW = {400, 480}
MAX_GREEN = {300, 360}
MAX_RED = {200, 240}

MAX_YELLOW_ADV = {800, 800}
MAX_GREEN_ADV = {400, 400}
MAX_RED_ADV = {400, 400}

MAX_EXCHANGE_YELLOW = {1200, 1280}
MAX_EXCHANGE_GREEN = {700, 760}
MAX_EXCHANGE_RED = {600, 640}

MAX_EXCHANGE_YELLOW_ADV = {800, 800}
MAX_EXCHANGE_GREEN_ADV = {400, 400}
MAX_EXCHANGE_RED_ADV = {400, 400}

TEXT_DLG_TITLE_1		= "Ng�y Qu�c T� Ph� N� l�i ��n r�i, ��ng ��o nhanh tay thu th�p Hoa H�ng �� ��i T�i Hoa H�ng �i"
TEXT_ACTIVITY_NPC_NAME		= "��i s� ho�t ��ng"
TEXT_DLG_OPT_ACT_INFO		= "Gi�i thi�u ho�t ��ng"
TEXT_DLG_OPT_ITEM_SOURCE		= "V�t ph�m sinh ra"
TEXT_DLG_OPT_AWARD		= "��i th�nh ph�n th��ng"
TEXT_DLG_TITLE_ACT_INFO		= "Th�i gian ho�t ��ng: sau khi b�o tr� ng�y 03/03/2013 ��n 24:00h ng�y 31/03/2013<enter>Gi�i h�n ho�t ��ng: c�p 150 tr� l�n, kh�ng gi�i h�n c�p tr�ng sinh<enter>Gi�i th�ch ho�t ��ng: trong th�i gian ho�t ��ng, ng��i ch�i th�ng qua tham gia c�c h� th�ng c�a game c� th� nh�n ���c T�i Hoa H�ng, m� T�i Hoa H�ng ra nh�n ng�u nhi�n m�u Hoa H�ng. T�i n�i c�c ��i s� ho�t ��ng (<color=red>th�nh ��i L� (202/198),Th�nh �� th�nh (393/316), L�m An (180/204)<color>) c� th� s� d�ng nh�m Hoa H�ng kh�c nhau ��i ph�n th��ng kh�c nhau. Chi ti�t T�i Hoa H�ng sinh ra m�i xem v�t ph�m sinh ra, <color=red> ��i Hi�p ph�i d� tr� kh�ng gian t�i �� nh�<enter><color>"
TEXT_DLG_TITLE_ITEM_SOURCE		= "V�t ph�m sinh ra: c�c v� ��i Hi�p tham gia ho�t ��ng h�ng ng�y c�a h� th�ng ��u c� th� nh�n ���c T�i Hoa H�ng, v� d�: T�ng Kim, v��t �i, Phong L�ng ��, Vi�m �ՅHoa H�ng Lam qu� b�u s� b�n � K� Tr�n C�c nh�"
TEXT_EHCANGE_ROSE_BAG_DIRECTLY		= "��i tr�c ti�p"
TEXT_EXCHANGE_ADV_BAG_YELLOW		= format("��i %s", ITEM_YELLOW_ROSE_BAG_ADV.szName)
TEXT_EXCHANGE_ADV_BAG_GREEN		= format("��i %s", ITEM_GREEN_ROSE_BAG_ADV.szName)
TEXT_EXCHANGE_ADV_BAG_RED		= format("��i %s", ITEM_RED_ROSE_BAG_ADV.szName)
TEXT_NO_ENOUGH_ITEM_CELL = "Do t�i c�a ng��i �� ��y kh�ng th� nh�n ph�n th��ng. L�n sau tham gia nh� ch� � �� tr�ng t�i"
TEXT_ACT_NOT_START = "Ho�t ��ng v�n ch�a b�t ��u"
TEXT_ACT_END = "Ho�t ��ng �� k�t th�c"
TEXT_ROSE_CANT_USE_MORE = "S� l�n s� d�ng lo�i T�i Hoa H�ng n�y �� ��t ��n gi�i h�n"
TEXT_ROSE_CANT_EXCHANGE_MORE = "S� l�n ��i lo�i T�i Hoa H�ng n�y �� ��t ��n gi�i h�n, ��i c�i kh�c �i"
TEXT_ROSE_SELECT_WAY = "L�a ch�n ph��ng th�c ��i:"
TEXT_DLG_EXCHANGED_TITLE = "T�i H��ng ng��i �� ��i nh� sau:"

LOG_FORMAT = {
	["6,1,3475"] = {
		nTaskId = TSK_YELLOW_BAG,
		szAll = "TuiHuongHoaHongVang",
		Sex = {"NhanVatNamNop%dTuiHuongHoaHongVang","NhanVatNuNop%dTuiHuongHoaHongVang"},
		[100] = 1,
		[200] = 1,
		[300] = 1,
		[400] = 1,
		[480] = 1,
	},
	["6,1,3476"] = {
		nTaskId = TSK_RED_BAG,
		szAll = "TuiHuongHoaHongDo",
		Sex = {"NhanVatNamNop%dTuiHuongHoaHongDo","NhanVatNuNop%dTuiHuongHoaHongDo"},
		[100] = 1,
		[200] = 1,
		[240] = 1,
	},
	["6,1,3477"] = {
		nTaskId = TSK_GREEN_BAG,
		szAll = "TuiHuongHoaHongXanh",
		Sex = {"NhanVatNamNop%dTuiHuongHoaHongXanh","NhanVatNuNop%dTuiHuongHoaHongXanh"},
		[100] = 1,
		[200] = 1,
		[300] = 1,
		[360] = 1,
	},
	["6,1,3478"] = {
		nTaskId = TSK_YELLOW_BAG_ADV,
		szAll = "TuiHuongHoaHongVangCaoCap",
		Sex = {"Nop%dTuiHuongHoaHongVangCaoCap","Nop%dTuiHuongHoaHongVangCaoCap"},
		[100] = 1,
		[200] = 1,
		[300] = 1,
	},
	["6,1,3479"] = {
		nTaskId = TSK_RED_BAG_ADV,
		szAll = "TuiHuongHoaHongDoCaoCap",
		Sex = {"Nop%dTuiHuongHoaHongDoCaoCap","Nop%dTuiHuongHoaHongDoCaoCap"},
		[100] = 1,
	},
	["6,1,3480"] = {
		nTaskId = TSK_GREEN_BAG_ADV,
		szAll = "TuiHuongHoaHongXanhCaoCap",
		Sex = {"Nop%dTuiHuongHoaHongXanhCaoCap","Nop%dTuiHuongHoaHongXanhCaoCap"},
		[100] = 1,
		[200] = 1,
	},
}

ROSE_BAG_AWARD = {
	{szName=ITEM_YELLOW_ROSE.szName, tbProp=ITEM_YELLOW_ROSE.tbProp, nExpiredTime=END_DATE, nRate=25},
	{szName=ITEM_GREEN_ROSE.szName, tbProp=ITEM_GREEN_ROSE.tbProp, nExpiredTime=END_DATE, nRate=25},
	{szName=ITEM_WHITE_ROSE.szName, tbProp=ITEM_WHITE_ROSE.tbProp, nExpiredTime=END_DATE, nRate=25},
	{szName=ITEM_RED_ROSE.szName, tbProp=ITEM_RED_ROSE.tbProp, nExpiredTime=END_DATE, nRate=25},
}

YELLOW_ROSE_BAG_AWARD = {szName = "�i�m kinh nghi�m", nExp = 1e6 }

GREEN_ROSE_BAG_AWARD = {szName = "�i�m kinh nghi�m", nExp = 2e6, }

RED_ROSE_BAG_AWARD = {
 	[1] = tbAward_C,
 	[2] = {
				{szName = "�i�m kinh nghi�m", nExp = 2e6, nRate = 50},
				{szName = "�i�m kinh nghi�m", nExp = 3e6, nRate = 35},
				{szName = "�i�m kinh nghi�m", nExp = 4e6, nRate = 15},
			}
 }

YELLOW_ROSE_BAG_ADV_AWARD = {
	{szName = "�i�m kinh nghi�m", nExp = 5e6, nRate = 50},
	{szName = "�i�m kinh nghi�m", nExp = 6e6, nRate = 30},
	{szName = "�i�m kinh nghi�m", nExp = 7e6, nRate = 20},
}

GREEN_ROSE_BAG_ADV_AWARD = {
	{szName = "�i�m kinh nghi�m", nExp = 5e6, nRate = 50},
	{szName = "�i�m kinh nghi�m", nExp = 6e6, nRate = 30},
	{szName = "�i�m kinh nghi�m", nExp = 7e6, nRate = 20},
}

RED_ROSE_BAG_ADV_AWARD = {
	{szName = "�i�m kinh nghi�m", nExp = 8e6, nRate = 50},
	{szName = "�i�m kinh nghi�m", nExp = 9e6, nRate = 30},
	{szName = "�i�m kinh nghi�m", nExp = 10e6, nRate = 20},
}
