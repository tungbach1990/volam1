Include("\\script\\lib\\file.lua")
IncludeLib("RELAYLADDER")
IncludeLib("TITLE")
IncludeLib("ITEM")

BID_DATA = "\\data\\tongbid.dat"
LEVELTOP10 = "\\data\\bestlevel.dat"
LEADER_MEMBER = "\\data\\leadmember.dat"
BID_LEADER = "\\data\\bidleader.dat"

TITLETIME = 30 * 24 * 60 * 60 * 18
FRAME2TIME = 18
TRYOUT_TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TRYOUT_TIMER_2 = 4 * 60 * 60 * FRAME2TIME; --Ϊ4Сʱ

MATCH_TIMER_1 = 10 * FRAME2TIME; --5�빫��һ��ս��
MATCH_TIMER_2 = 10 * 60 * FRAME2TIME; --Ϊ10����

CP_ONEDAY_MAXROUND = floor(TRYOUT_TIMER_2  / (MATCH_TIMER_2 + 5 * 60 * FRAME2TIME))

Faction = {
			{"\\data\\shaolin_top5.dat", "ShaoLin_Top5", "Thi�u L�m"},
			{"\\data\\tianwang_top5.dat", "TianWang_Top5", "Thi�n V��ng"},
			{"\\data\\tangmen_top5.dat", "TangMen_Top5", "���ng M�n"},
			{"\\data\\wudu_top5.dat", "Wudu_Top5", "Ng� ��c"},
			{"\\data\\emei_top5.dat", "EMei_Top5", "Nga Mi"},
			{"\\data\\cuiyan_top5.dat", "CuiYan_Top5", "Th�y Y�n"},
			{"\\data\\gaibang_top5.dat", "GaiBang_Top5", "C�i Bang"},
			{"\\data\\tianren_top5.dat", "TianRen_Top5", "Thi�n Nh�n"},
			{"\\data\\wudang_top5.dat", "WuDang_Top5", "V� �ang"},
			{"\\data\\kunlun_top5.dat", "KunLun_Top5", "C�n L�n"}
		  }
FactionTitle = {
				"V� L�m ��i h�i Thi�u L�m cao th� ",
				"V� L�m ��i h�i Thi�n V��ng cao th� ",
				"V� L�m ��i h�i ���ng M�n cao th� ",
				"V� L�m ��i h�i Ng� ��c cao th� ",
				"V� L�m ��i h�i Nga Mi cao th� ",
				"V� L�m ��i h�i Th�y Y�n cao th� ",
				"V� L�m ��i h�i C�i Bang cao th� ",
				"V� L�m ��i h�i Thi�n Nh�n  cao th� ",
				"V� L�m ��i h�i V� �ang cao th� ",
				"V� L�m ��i h�i C�n L�n cao th� ",
				}
CP_TASKID_REGIST = 1083		--1����������9��ȡ����Ԥѡ���ʸ�
CP_TASKID_POINT = 1084		--��¼Ԥѡ���÷�
CP_TASKID_TITLE = 1085		--9����¼��ȡ�þ���Ȧ�ʸ�
CP_TASKID_BID = 1086		--
CP_TASKID_ENEMY = 1087		--Ԥ��ʱ���ֵ���Ӫ��
CP_TASKID_ROUND = 1088		--�����Ĵ���
CP_TASKID_WIN = 1089		--Ӯ�Ĵ���
CP_TASKID_LOSE = 1090		--��Ĵ������������䣬���޷���¼
CP_TASKID_TIE = 1091		--ƽ�ֵĴ���
CP_TASKID_FLAG = 1092		--�����˳������ı�ǣ�����һ�볡ʱˢ��
CP_TASKID_BACKCONT = 1093	--���ڲ���Ͷ�����Ҹ���Ͷ���ܽ��ж���ȡ����
CP_TASKID_LOGOUT = 1094		--Ϊ 0 ʱ���������˳���Ϊ 1 ʱ��ʾ�������˳����統����δ�������ݡ�������ԭ��
CP_CASH = 100000
CP_MAXROUND = 30
CP_PLNUM_LIMT = 10
CP_PLNUM_LIMT_ESPECIAL = 4	--�嶾�����š������������� ����4��
CP_MAPPOS_IN = {1508,3026}
CP_MAPPOS_OUT = {1472,3243}
CP_MAPPOS_PRE = {1596,2977}
CP_MAPTAB = {
				{396, 397, "Thi�u L�m"},
				{398, 399, "Thi�n V��ng"},
				{400, 401, "���ng M�n"},
			 	{402, 403, "Ng� ��c"},
			 	{404, 405, "Nga Mi"},
			 	{406, 407, "Th�y Y�n"},
			 	{408, 409, "C�i Bang"},
			 	{410, 411, "Thi�n Nh�n"},
			 	{412, 413, "V� �ang"},
			 	{414, 415, "C�n L�n"}
			 }
			 
CP_AWARD_ITEM = {
					{"T� Th�y Tinh", {4, 239}, 10},
					{"Lam Th�y Tinh", {4, 238}, 10},
					{"L�c Th�y Tinh", {4, 240}, 10},
					{"Tinh H�ng B�o Th�ch", {4, 353}, 10},
					{"Huy�n Tinh Kho�ng Th�ch c�p 4", {6, 1, 147, 4, 0, 0}, 5},
					{"Huy�n Tinh Kho�ng Th�ch c�p 5", {6, 1, 147, 5, 0, 0}, 100},
					{"Huy�n Tinh Kho�ng Th�ch c�p 6", {6, 1, 147, 6, 0, 0}, 300},
					{"��i Ph�c Duy�n L� ", {6, 1, 124, 1, 0, 0}, 100},
					{"Trung  Ph�c Duy�n L� ", {6, 1, 123, 1, 0, 0}, 200},
					{"Ti�u Ph�c Duy�n L� ", {6, 1, 122, 1, 0, 0}, 400},
					{"Ti�n Th�o L� ", {6, 1, 71, 1, 0, 0}, 1000},
					{"Thi�n s�n  B�o L� ", {6, 1, 72, 1, 0, 0}, 1125},
					{"��i B�ch C�u ho�n", {6, 1, 130, 1, 0, 0}, 200},
					{"Hoa h�ng", {6, 0, 20, 1, 0, 0}, 1700},
					{"T�m T�m T��ng �nh ph� ", {6, 1, 18, 1, 0, 0}, 1700},
					{"L�nh b�i Phong L�ng ��", {4, 489}, 300},
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
					{"Ho�ng Kim B�o H�p",	{6,	1,	69,	1,	0,	0},	442}
				}

CP_TRAPIN = "\\settings\\maps\\championship\\linantoplace_trap.txt"
CP_TRAPOUT = ""
CP_MATCH_POS = "\\settings\\maps\\championship\\champion_gmpos.txt"
CP_TRAPIN_FILE = "\\script\\missions\\championship\\trap\\trap_linantoplace.lua"
CP_TRAPOUT_FILE = "\\script\\missions\\championship\\trap\\trap_placetolinan.lua"
CP_BEGIN_BID_DATE = 5051200
CP_END_BID_DATE = 5051412
CP_UPTO_TRYOUT = 5051620
CP_END_TRYOUT = 5052224

CP_HELP_TRYOUT = {
					"<color=yellow>Tr�n d� tuy�n ��i h�i V� l�m ki�t xu�t<color>, ch�n ra <color=yellow>5 h�ng ��u<color> trong th�p ��i m�n ph�i � m�i khu v�c tham gia tr�n d� tuy�n tuy�n th� c�a '��i h�i V� L�m to�n khu v�c'. Tr�n d� tuy�n b�t ��u t� 16/5 ��n 22/5 k�t th�c. M� t� 20:00 ��n 24:00 m�i ng�y; th�i gian b�o danh 5 ph�t; th�i gian thi ��u 10 ph�t.",
					"Sau khi tr�n d� tuy�n b�t ��u, ng��i ch�i nh� h�n c�p 90 c� th� b�o danh thi ��u trong ��u tr��ng ��i h�i V� l�m.Ng��i ch�i m�i tham gia thi ��u c�n n�p 10 v�n l��ng ph� b�o danh. M�i ng��i ch�i �� b�o danh c� th� thi ��u nhi�u nh�t"..CP_MAXROUND.." tr�n. N�u b�n kh�ng h�i l�ng v�i th�nh t�ch c�a nh�n v�t n�y, c� th� x�a b� t� c�ch thi ��u c�a nh�n v�t, nh�ng nh�n v�t �� b� x�a b� t� c�ch thi ��u kh�ng th� ti�p t�c b�o danh thi ��u n�a.",
					"Tr�n d� tuy�n d�a tr�n h� th�ng �i�m t�ch l�y �� ch�n ra 5 h�ng ��u. Ng��i ch�i khi thi ��u "..CP_MAXROUND.."trong ��u tr��ng,  th�ng 1 tr�n ���c 3 �i�m, h�a 1 tr�n ���c 1 �i�m, b�i 1 tr�n kh�ng ���c �i�m. ��n ng�y 23/5, h� th�ng s� ch�n ra 5 ng��i ch�i c� s� �i�m t�ch ph�n cao nh�t � m�i m�n ph�i, nh�n ���c t� c�ch tham gia '��i h�i V� L�m to�n khu v�c'",
					"M�i ng��i ch�i tham gia b�o danh trong qu� tr�nh tham gia nh�n ���c gi�i th��ng nh�t ��nh. M�i l�n tham gia 1 v�ng s� �o�t ���c gi�i th��ng nh�t ��nh, ngo�i ra ng��i ch�i c�n nh�n ���c nh�ng v�t ph�m nh�: Ph�o hoa, Huy�n Tinh Kho�ng Th�ch, Ph�c Duy�n l�, Ti�n Th�o L�, Th�y Tinh) "
				}
				
CP_HELP_BID = {
				"<color=yellow>Tranh T�ng L�nh ��i ��i c�a khu v�c n�y<color>, nh�t thi�t l� Bang ch� m�i c� th� ��n ch� c�a ta tham gia tranh ch�c l�nh ��o ��i nh�m c�a to�n Server. Ti�n ��u gi� m�i l�n �t nh�t l� 100 v�n l��ng, m�i l�n l�y ��n v� 100 v�n l��ng �� t�ng th�m. Th�i gian ��u gi� b�t ��u t� 12/05/2005 ��n 12 h ng�y 14/05 k�t th�c.",
				"Bang ch� tham gia ��u gi� xem ng��i c� ti�n ��u gi� cao nh�t (Kh�ng c�ng b� s� ti�n c� th�) v� t� bi�t s� ti�n ��u gi� c�a m�nh. ��n 12h ng�y 14/5, Bang ch� ��a m�c ��u gi� cao nh�t tr� th�nh T�ng L�nh ��i c�a khu v�c n�y v� nh�n ���c t� c�ch ph�n quy�t thi ��u v�i danh hi�u l� T�ng L�nh ��i. C�nh tranh th�t b�i c�n ��n ch� ta nh�n l�i ti�n ��u gi�. M�i l�n l�nh nhi�u nh�t 50 v�n l��ng, ��m b�o ng��i ch�i lu�n c� �� ti�n.",
				"T�ng L�nh ��i c� th� ph�n ph�t 29 t�m V� l�m quy�t ��u l�nh b�i cho ng��i ch�i kh�c t�i Quan vi�n V� l�m ki�t xu�t. Ng��i ch�i �� c� ���c t� c�ch � v�ng chung k�t kh�ng th� nh�n t� c�ch n�a."
				}

CP_HELP_FINAL = "<color=yellow>V� L�m ��i h�i<color>, do 90 ng��i � m�i khu v�c l�m th�nh 1 nh�m tham gia V� l�m ��i h�i to�n khu v�c. Trong ��, 10 ng��i l� Th�p ��i cao th� c�a khu v�c; 50 ng��i l� 5 h�ng ��u trong Th�p ��i m�n ph�i; 30 ng��i c�n l�i s� b�u ra 1 ng��i l�m T�ng L�nh ��i. T�ng L�nh ��i c� quy�n quy�t ��nh ai trong s� 29 ng��i c�n l�i c� t� c�ch thi ��u v�ng chung k�t"

function transtoplace()
Say("Tr�n d� tuy�n ��i h�i V� l�m ki�t xu�t �� k�t th�c t�t ��p. Hi�n t�i c� th� ��n Quan vi�n V� l�m ki�t xu�t xem k�t qu� thi ��u v� nh�n danh hi�u t��ng �ng. Vui l�ng ch� ��i V� l�m ��i h�i b�t ��u.", 0)
do return end
	if (GetLevel() < 90) then
		Say("B�n ph�i ��t ���c c�p 90 tr� l�n m�i c� th� x�m nh�p ��u tr��ng V� l�m ��i h�i, h�y ti�p t�c luy�n th�m!", 0)
		return
	end
	if (GetLastFactionNumber() == -1) then
		Say("V� L�m Minh Ch� c� l�nh: Ch� c� ng��i c�a Th�p ��i ph�i ���c tham gia ��i h�i v� l�m, ng��i kh�ng m�n kh�ng ph�i kh�ng th� tham gia. Sau khi gia nh�p Th�p ��i ph�i m�i ���c tham gia thi ��u!", 0)
		return
	elseif(nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		Msg2Player("B�n ch�a b�o danh! H�y ��n Quan vi�n V� l�m ki�t xu�t b�o danh tham gia tr�n d� tuy�n!")
		NewWorld(176, 1444, 3256)
	else
		if(GetLastFactionNumber() == 0) then
			NewWorld(CP_MAPTAB[1][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 1) then
			NewWorld(CP_MAPTAB[2][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 2) then
			NewWorld(CP_MAPTAB[3][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 3) then
			NewWorld(CP_MAPTAB[4][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--�嶾
		elseif (GetLastFactionNumber() == 4) then
			NewWorld(CP_MAPTAB[5][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 5) then
			NewWorld(CP_MAPTAB[6][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 6) then
			NewWorld(CP_MAPTAB[7][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ؤ��
		elseif (GetLastFactionNumber() == 7) then
			NewWorld(CP_MAPTAB[8][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 8) then
			NewWorld(CP_MAPTAB[9][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--�䵱
		elseif (GetLastFactionNumber() == 9) then
			NewWorld(CP_MAPTAB[10][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		end
		Talk(1, "", "B�n �� v�o ��u tr��ng V� l�m ��i h�i, h�y ��n vi�n quan ��u tr��ng (189, 188) , (191, 190) , (185, 187) xin tham gia thi ��u v�ng n�y!")
	end
end

function checkmap(flag)
	local mapid = SubWorldIdx2ID(SubWorld)
	local ladder = 0
	if (mapid == 397 or mapid == 396) then
		mapname = "Thi�u L�m"
		ladder = 10120
	elseif (mapid == 399 or mapid == 398) then
		mapname = "Thi�n V��ng"
		ladder = 10121
	elseif (mapid == 401 or mapid == 400) then
		mapname = "���ng M�n"
		ladder = 10122
	elseif (mapid == 403 or mapid == 402) then
		mapname = "Ng� ��c"
		ladder = 10123
	elseif (mapid == 405 or mapid == 404) then
		mapname = "Nga Mi"
		ladder = 10124
	elseif (mapid == 407 or mapid == 406) then
		mapname = "Th�y Y�n"
		ladder = 10125
	elseif (mapid == 409 or mapid == 408) then
		mapname = "C�i Bang"
		ladder = 10126
	elseif (mapid == 411 or mapid == 410) then
		mapname = "Thi�n Nh�n"
		ladder = 10127
	elseif (mapid == 413 or mapid == 412) then
		mapname = "V� �ang"
		ladder = 10128
	elseif (mapid == 415 or mapid == 414) then
		mapname = "C�n L�n"
		ladder = 10129
	end
	if (flag == 1) then
		return mapname
	elseif(flag == 2) then
		return ladder
	end
end

function help_bid()
	Talk(1, "help_bid_2", CP_HELP_BID[1])
end

function help_bid_2()
	Talk(2, "", CP_HELP_BID[2], CP_HELP_BID[3])
end
function help_tryout()
	Talk(2, "help_tryout_2", CP_HELP_TRYOUT[1], CP_HELP_TRYOUT[2])
end;

function help_tryout_2()
	Talk(2, "", CP_HELP_TRYOUT[3], CP_HELP_TRYOUT[4])
end

function help_final()
	Talk(1, "", CP_HELP_FINAL)
end

function help_championship()
	Say("B�n mu�n nh�n ���c gi�p �� c�a b�n n�o?", 4, "Tranh ch�p T�ng L�nh ��i c�a khu v�c/help_bid", "tr�n d� tuy�n ��i h�i V� l�m ki�t xu�t/help_tryout", "V� L�m ��i h�i/help_final", "C�i n�y ta hi�u r�i!/OnCancel")
end

function validateDate(startt,endt)
	local now = tonumber(date("%y%m%d%H"))
	if(now >= startt and now < endt) then
		return 1
	end
	return nil
end

function AddAword(level, fac, result)
	local awardpro = {}
	if (level >120) then
		level = 120
	end
	aword = (700 + floor((level * 4 - 350) / 5) * 100) * 60 * fac
	AddOwnExp(aword)
	if( result == 0 )then
		return
	end
	for i = 1, getn(CP_AWARD_ITEM) do
		awardpro[i] = CP_AWARD_ITEM[i][3]
	end
	numth = randByProbability(awardpro)
	if (getn(CP_AWARD_ITEM[numth][2]) == 6 ) then
		AddItem(CP_AWARD_ITEM[numth][2][1], CP_AWARD_ITEM[numth][2][2], CP_AWARD_ITEM[numth][2][3], CP_AWARD_ITEM[numth][2][4], CP_AWARD_ITEM[numth][2][5], CP_AWARD_ITEM[numth][2][6])
	else
		AddEventItem(CP_AWARD_ITEM[numth][2][2])
	end
	Msg2Player("B�n nh�n ���c m�t"..CP_AWARD_ITEM[numth][1])
end

function randByProbability(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = mod( random( nSum ) + random( 1009 ), nSum ) + 1;
	for i = nArgCount, 1, -1 do
		nSum = nSum - aryProbability[i];
		if( nRandNum > nSum ) then
			return i;
		end
	end
end

-- ��������״̬
function nt_settask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

-- ��ȡ����״̬
function nt_gettask(nTaskID)
	return GetTask(nTaskID)
end


------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end


------------------------------------------------------------------------------------
-- ��һ���ļ�
function biwu_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
	end
end

--����ļ��е�szSection��key��ֵ
function biwu_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--�����ļ��е�szSection��keyֵΪszValue
function biwu_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function biwu_save(filename)
	IniFile_Save(filename, filename)
end

------------------------------------------------------------------------------------
function Sort_Point(array)
	local orgindex = PlayerIndex
	local point_1 = 0
	local point_2 = 0
	local wincount_1 = 0
	local wincount_2 = 0
	local winrate_1 = 0
	local winrate_2 = 0
	for i = 1, getn(array) do
		for j = getn(array), 2, -1 do
			PlayerIndex = array[j]
			point_1 = nt_gettask(CP_TASKID_ROUND)
			wincount_1 = nt_gettask(CP_TASKID_WIN)
			if (point_1 == 0 or wincount_1 == 0) then
				winrate_1 = 0
			else
				winrate_1 = wincount_1/point_1
			end
			
			PlayerIndex = array[j - 1]
			point_2 = nt_gettask(CP_TASKID_ROUND)
			wincount_2 = nt_gettask(CP_TASKID_WIN)
			if (point_2 == 0 or wincount_2 == 0) then
				winrate_2 = 0
			else
				winrate_2 = wincount_2/point_2
			end
			
			if (winrate_1 > winrate_2) then
				a = array[j]
				array[j] = array[j - 1]
				array[j - 1] = a
			end
		end
	end
	PlayerIndex = orgindex
	return array
end

function OnCancel()
end