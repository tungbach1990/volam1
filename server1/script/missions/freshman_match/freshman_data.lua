LEVELTOP10 = "\\data\\bestlevel.dat"
MISSIONID_OUTER = 18
MISSIONID_INNER = 19

FRAME2TIME = 18;	--18֡��Ϸʱ���൱��1����

TITLETIME = 30 * 24 * 60 * 60 * 18

TRYOUT_TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TRYOUT_TIMER_2 = 3 * 60 * 60 * FRAME2TIME; --Ϊ4Сʱ
TIMERID_SMALL_OUTER = 33
TIMERID_TOTAL_OUTER = 34


MATCH_TIMER_1 = 10 * FRAME2TIME; --5�빫��һ��ս��
MATCH_TIMER_2 = 15 * 60 * FRAME2TIME; --Ϊ10����
TIMERID_SMALL_INNER = 35
TIMERID_TOTAL_INNER = 36


CP_ONEDAY_MAXROUND = floor(TRYOUT_TIMER_2  / (MATCH_TIMER_2 + 5 * 60 * FRAME2TIME))

FactionData = {
			{	"\\data\\shaolin_fresh.dat", "ShaoLin_Top5", "Thi�u L�m"	},
			{	"\\data\\tianwang_fresh.dat", "TianWang_Top5", "Thi�n V��ng"	},
			{	"\\data\\tangmen_fresh.dat", "TangMen_Top5", "���ng M�n"	},
			{	"\\data\\wudu_fresh.dat", "Wudu_Top5", "Ng� ��c"	},
			{	"\\data\\emei_fresh.dat", "EMei_Top5", "Nga Mi"	},
			{	"\\data\\cuiyan_fresh.dat", "CuiYan_Top5", "Th�y Y�n"	},
			{	"\\data\\gaibang_fresh.dat", "GaiBang_Top5", "C�i Bang"	},
			{	"\\data\\tianren_fresh.dat", "TianRen_Top5", "Thi�n Nh�n"	},
			{	"\\data\\wudang_fresh.dat", "WuDang_Top5", "V� �ang"	},
			{	"\\data\\kunlun_fresh.dat", "KunLun_Top5", "C�n L�n"	}
		  }

FactionTitle = {
				"Thi�u L�m ki�t xu�t",
				"Thi�n V��ng ki�t xu�t",
				"���ng M�n  ki�t xu�t",
				"Ng� ��c ki�t xu�t",
				"Nga Mi  ki�t xu�t",
				"Th�y Y�n ki�t xu�t",
				"C�i Bang ki�t xu�t",
				"Thi�n Nh�n  ki�t xu�t",
				"V� �ang  ki�t xu�t",
				"C�n L�n  ki�t xu�t"
				}
				
CP_MAPTAB = {
				{	396, 397, "Thi�u L�m"	},
				{	398, 399, "Thi�n V��ng"	},
				{	400, 401, "���ng M�n"	},
			 	{	402, 403, "Ng� ��c"	},
			 	{	404, 405, "Nga Mi"	},
			 	{	406, 407, "Th�y Y�n"	},
			 	{	408, 409, "C�i Bang"	},
			 	{	410, 411, "Thi�n Nh�n"	},
			 	{	412, 413, "V� �ang"	},
			 	{	414, 415, "C�n L�n"	}
			 }

CP_TASKID_REGIST = 1095		--1����������9��ȡ����Ԥѡ���ʸ�
CP_TASKID_POINT = 1096		--��¼Ԥѡ���÷�
CP_TASKID_TITLE = 1097		--9����¼��ȡ�þ���Ȧ�ʸ�
CP_TASKID_BID = 1098		--
CP_TASKID_ENEMY = 1099		--Ԥ��ʱ���ֵ���Ӫ��
CP_TASKID_ROUND = 1100		--�����Ĵ���
CP_TASKID_WIN = 1101		--Ӯ�Ĵ���
CP_TASKID_LOSE = 1102		--��Ĵ������������䣬���޷���¼
CP_TASKID_TIE = 1103		--ƽ�ֵĴ���
CP_TASKID_FLAG = 1104		--�����˳������ı�ǣ�����һ�볡ʱˢ��
CP_TASKID_BACKCONT = 1105	--���ڲ���Ͷ�����Ҹ���Ͷ���ܽ��ж���ȡ����
CP_TASKID_LOGOUT = 1094		--Ϊ 0 ʱ���������˳���Ϊ 1 ʱ��ʾ�������˳����統����δ�������ݡ�������ԭ��
CP_CASH = 100000
CP_MAXROUND = 40
CP_PLNUM_LIMT = 4
CP_MAPPOS_IN = {1508,3026}
CP_MAPPOS_OUT = {1472,3243}
CP_MAPPOS_PRE = {1596,2977}

CP_AWARD_ITEM = {
					{"T� Th�y Tinh", {4, 239}, 2},
					{"Lam Th�y Tinh", {4, 238}, 2},
					{"L�c Th�y Tinh", {4, 240}, 2},
					{"Tinh H�ng B�o Th�ch", {4, 353}, 2},
					{"Huy�n Tinh Kho�ng Th�ch c�p 4", {6, 1, 147, 4, 0, 0}, 200},
					{"Huy�n Tinh Kho�ng Th�ch c�p 5", {6, 1, 147, 5, 0, 0}, 50},
					{"Huy�n Tinh Kho�ng Th�ch c�p 6", {6, 1, 147, 6, 0, 0}, 1},
					{"��i Ph�c Duy�n L� ", {6, 1, 124, 1, 0, 0}, 50},
					{"Trung  Ph�c Duy�n L� ", {6, 1, 123, 1, 0, 0}, 100},
					{"Ti�u Ph�c Duy�n L� ", {6, 1, 122, 1, 0, 0}, 200},
					{"Ti�n Th�o L� ", {6, 1, 71, 1, 0, 0}, 1500},
					{"Thi�n s�n  B�o L� ", {6, 1, 72, 1, 0, 0}, 1991},
					{"��i B�ch C�u ho�n", {6, 1, 130, 1, 0, 0}, 100},
					{"Hoa h�ng", {6, 0, 20, 1, 0, 0}, 2000},
					{"T�m T�m T��ng �nh ph� ", {6, 1, 18, 1, 0, 0}, 2000},
					{"L�nh b�i Phong L�ng ��", {4, 489}, 100},
					{"Ph�o Hoa", {6, 0, 11, 1, 0, 0}, 1700},
				}

CP_FORBID_ITEM = {
					{	"C�ng T�c ho�n", {6, 1, 218, 1, 0, 0}, 511	},
					{	"B�o T�c ho�n", {6, 1, 219, 1, 0, 0}, 512	},
					{	"Ph� Ph�ng ho�n", {6, 1, 220, 1, 0, 0}, 513	},
					{	"��c Ph�ng ho�n", {6, 1, 221, 1, 0, 0}, 514	},
					{	"B�ng Ph�ng ho�n", {6, 1, 222, 1, 0, 0}, 515	},
					{	"H�a Ph�ng ho�n", {6, 1, 223, 1, 0, 0}, 516	},
					{	"L�i Ph�ng ho�n", {6, 1, 224, 1, 0, 0}, 517	},
					{	"Gi�m Th��ng ho�n", {6, 1, 225, 1, 0, 0}, 518	},
					{	"Gi�m H�n ho�n", {6, 1, 226, 1, 0, 0}, 519	},
					{	"Gi�m ��c ho�n", {6, 1, 227, 1, 0, 0}, 520	},
					{	"Gi�m B�ng ho�n", {6, 1, 228, 1, 0, 0}, 521	},
					{	"Ph� C�ng ho�n", {6, 1, 229, 1, 0, 0}, 522	},
					{	"��c C�ng ho�n", {6, 1, 230, 1, 0, 0}, 523	},
					{	"B�ng C�ng ho�n", {6, 1, 231, 1, 0, 0}, 524	},
					{	"H�a C�ng ho�n", {6, 1, 232, 1, 0, 0}, 525	},
					{	"L�i C�ng ho�n", {6, 1, 233, 1, 0, 0}, 526	},
					{	"Tr��ng M�nh ho�n", {6, 1, 234, 1, 0, 0}, 527	},
					{	"Tr��ng N�i ho�n", {6, 1, 235, 1, 0, 0}, 528	},
					{	"Y�n H�ng �an", {6, 1, 115, 1, 0, 0}, 450	},
					{	"X� Lam �an", {6, 1, 116, 1, 0, 0}, 451	},
					{	"N�i Ph� ho�n", {6, 1, 117, 1, 0, 0}, 453	},
					{	"N�i ��c ho�n", {6, 1, 118, 1, 0, 0}, 454	},
					{	"N�i B�ng ho�n", {6, 1, 119, 1, 0, 0}, 455	},
					{	"N�i H�a ho�n", {6, 1, 120, 1, 0, 0}, 456	},
					{	"N�i L�i ho�n", {6, 1, 121, 1, 0, 0}, 457	},
					{	"Tr��ng M�nh ho�n", {6, 0, 1, 1, 0, 0}, 256	},
					{	"Gia B�o ho�n", {6, 0, 2, 1, 0, 0}, 257	},
					{	"��i L�c ho�n", {6, 0, 3, 1, 0, 0}, 258	},
					{	"Cao Thi�m ho�n", {6, 0, 4, 1, 0, 0}, 259	},
					{	"Cao Trung ho�n", {6, 0, 5, 1, 0, 0}, 260	},
					{	"Phi T�c ho�n", {6, 0, 6, 1, 0, 0}, 261	},
					{	"B�ng Ph�ng ho�n", {6, 0, 7, 1, 0, 0}, 262	},
					{	"L�i Ph�ng ho�n", {6, 0, 8, 1, 0, 0}, 263	},
					{	"H�a Ph�ng ho�n", {6, 0, 9, 1, 0, 0}, 264	},
					{	"��c Ph�ng ho�n", {6, 0, 10, 1, 0, 0}, 265	},
					{	"B�nh ch�ng H�t d� ", {6, 0, 60, 1, 0, 0}, 401	},
					{	"B�nh ch�ng Th�t heo", {6, 0, 61, 1, 0, 0}, 402	},
					{	"B�nh ch�ng Th�t b� ", {6, 0, 62, 1, 0, 0}, 403	},
					{	"B�ch Qu� L� ", {6, 1, 73, 1, 0, 0}, 442	},
					{	"C�t t��ng h�ng bao", {6, 1, 19, 1, 0, 0}, 442	},
					{"Ho�ng Kim B�o r��ng",	{6,	1,	69,	1,	0,	0},	442}
				}

CP_TRAPIN = "\\settings\\maps\\championship\\linantoplace_trap.txt"
CP_TRAPOUT = ""
CP_MATCH_POS = "\\settings\\maps\\championship\\champion_gmpos.txt"
CP_TRAPIN_FILE = "\\script\\missions\\freshman_match\\trap\\trap_linantoplace.lua"
CP_TRAPOUT_FILE = "\\script\\missions\\freshman_match\\trap\\trap_placetolinan.lua"


CP_UPTO_TRYOUT = 5060120
CP_END_TRYOUT = 5061023