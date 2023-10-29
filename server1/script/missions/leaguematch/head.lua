
--if (WLLS_HEAD) then
--	return
--end
--
--WLLS_HEAD = 1


IL("FILESYS");
IL("ITEM");
IL("LEAGUE");
IL("SETTING");
IL("TITLE");
IL("RELAYLADDER");

Include("\\script\\lib\\common.lua")

-- 2006/04/21 ����װ���������� - ����˹
--Include("\\script\\task\\equipex\\head.lua");
Include("\\script\\tong\\tong_award_head.lua");--�����Ŀ��
Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

WLLS_TAB = {}

--Global Value--
GLB_WLLS_PHASE	= 820	--������ǰ�����׶�
GLB_WLLS_SID	= 821	--��ǰ�������
GLB_WLLS_MATCHID= 822	--��ǰ�������
GLB_WLLS_TYPE	= 823	--��ǰ����������ģʽ
GLB_WLLS_NEXT	= 824	--��һ����������ģʽ
GLB_WLLS_TIME	= 825	--��ʱ������
GLB_WLLS_CLOSE	= 826	--�رո߼�������2�� + �ر�����������1��

--LG Task ID--
WLLS_LGTASK_MTYPE	= 11	--��������
WLLS_LGTASK_LAST	= 1		--���μӵ����һ��������ţ�����׼�������㣩	
WLLS_LGTASK_SVRID	= 2 	--���μӵ����һ������������
WLLS_LGTASK_MSCAMP	= 3 	--���μӵ����һ������MS��Ӫ
WLLS_LGTASK_POINT	= 4		--ս�ӻ�û���
WLLS_LGTASK_RANK	= 5		--ս������
WLLS_LGTASK_WIN		= 6		--ʤ������
WLLS_LGTASK_TIE		= 7		--ƽ�ִ���
WLLS_LGTASK_TOTAL	= 8		--����������ʧ�ܴ��� = TOTAL - WIN - TIE��
WLLS_LGTASK_JOIN	= 9		--�Ѿ�����׼����������
WLLS_LGTASK_TIME	= 10	--ս��ʱ���ܼ�
WLLS_LGTASK_STYPE	= 12	--�齨ʱ������ģʽ
WLLS_LGTASK_EMY1	= 13	--����һ�����������Ķ��֣�ս����String2ID��
WLLS_LGTASK_EMY2	= 14	--�����ڶ������������Ķ���
WLLS_LGTASK_EMY3	= 15	--�������������������Ķ���
WLLS_LGTASK_TOTAL_EX= 16	--ʹ��Ѫս����ĸ���
WLLS_LGTASK_USE_LingQi_COUNT= 17	--��չ�����μӵļ���


WLLS_LGMTASK_JOB	= 1	--ְλ:0����Ա��1���ӳ�
WLLS_LGMTASK_STATE	= 2	--ս�ӳ�Ա״̬��0���ڳ��⣻1������׼������2��������
WLLS_LGMTASK_ADDSID	= 3	--���ĸ����������˱�ս��
WLLS_LGMTASK_WIN	= 4	--��Ҫ���ӵ�ʤ������
WLLS_LGMTASK_TIE	= 5	--��Ҫ���ӵ�ƽ�ִ���
WLLS_LGMTASK_TOTAL	= 6	--��Ҫ���ӵĲ�������
WLLS_LGMTASK_OVER	= 7	--���ĸ�����������Խ��

--Task ID--
WLLS_TB	=	1715
WLLS_TASKID_FROMMAP	= WLLS_TB	--���Ե�ͼID
WLLS_TASKID_FROM_X	= WLLS_TB+1	--��������X
WLLS_TASKID_FROM_Y	= WLLS_TB+2	--��������Y
WLLS_TASKID_ORGCAMP	= WLLS_TB+3	--�������ҷ���Mission Camp
WLLS_TASKID_GOTAWARD= WLLS_TB+4	--���һ����ȡ�Ľ��� Type:Level:Award:SID

WLLS_TASKID_WIN		= WLLS_TB+5	--����ʤ������
WLLS_TASKID_TIE		= WLLS_TB+6	--����ƽ�ִ���
WLLS_TASKID_TOTAL	= WLLS_TB+7	--���˲�������
WLLS_TASKID_POINT	= 2500		--�����ۼƻ���
WLLS_TASKID_HONOUR	= 2501		--�������������������Ļ��֣�

--WLLS_TASKID_AWIN	= WLLS_TB+8		--������ȡ���뽱����ʤ������
--WLLS_TASKID_ATOTAL	= WLLS_TB+9		--������ȡ���뽱���Ĳ�������
--WLLS_TASKID_AWARD	= WLLS_TB+10	--�Ѿ���ȡ���ĸ���0���ޣ�1��120����2��150��

WLLS_TASKID_LGTYPE	= WLLS_TB+11	--ս������
WLLS_TASKID_LGPOINT	= WLLS_TB+12	--ս�ӻ���
WLLS_TASKID_LGRANK	= WLLS_TB+13	--ս������
WLLS_TASKID_LGWIN	= WLLS_TB+14	--ս��ʤ������
WLLS_TASKID_LGTIE	= WLLS_TB+15	--ս��ƽ�ִ���
WLLS_TASKID_LGTOTAL	= WLLS_TB+16	--ս�Ӳ�������
WLLS_TASKID_LGTIME	= WLLS_TB+17	--ս��ս��ʱ��	(1732)
WLLS_TASKID_EX		= WLLS_TB+18	--���������0~10��
WLLS_TASKID_SWITCH	= WLLS_TB+19	--���أ�1.�Ӿ��飬2.�۳����־���
WLLS_TASKID_AWARDEX	= WLLS_TB+20	-- ��/�� ���� (Type:Level:AwardErr:Award)

WLLS_TEMPTASK		= 246
WLLS_STRINGTASK		= 5

--Mission--
WLLS_MSID_SCHEDULE	= 24	-- ׼���� MissionID
WLLS_MSID_COMBAT	= 25	-- ������ MissionID
WLLS_MSID_GLB		= 26	-- ȫ�� MissionID

WLLS_MSV_MSID	= 1	--��Mission��MissionID

--Mission Timer--
WLLS_TIMERID_SCHEDULE	= 50	--ȫ�ּ�ʱ��
WLLS_TIMERID_COMBAT		= 51	--��������ʱ��

WLLS_FRAME2TIME = 18	--18֡��Ϸʱ���൱��1����
WLLS_TIMER_PREP_FREQ	= 10	--׼������ʱ������Ƶ��10��
WLLS_TIMER_PREP_TOTAL	= 24	--׼��ʱ��4���ӣ�24������ս��ʱ�䣩
WLLS_TIMER_FIGHT_FREQ	= 5		--ս��������ս��Ƶ��5��
WLLS_TIMER_FIGHT_PREP	= 2		--ս��׼��ʱ��10�� ��2������ս��ʱ�䣩
WLLS_TIMER_FIGHT_TOTAL	= 120	--ս��ʱ��10���� ��10*60/5������ս��ʱ�䣩

--Const Value--
WLLS_LGTYPE		= 5	--ս������
WLLS_REG_LGTYPE	= 2	--�ǼǴ�ս������

WLLS_LEVEL_JUNIOR	= 80	--�μ�������������С����
WLLS_LEVEL_SENIOR	= 120	--�μ�������������С����

WLLS_MIN_TEAM	= 2	--���������ٶ��ٲ�������ſ��Կ�ս

WLLS_MAPPOS_SIGN	= { 1523, 3024 }	--�᳡��������
WLLS_MAPPOS_PRE		= { 1596, 2977 }	--׼������������

WLLS_LingQi_PerCOUNT = 4

--�ĸ����е���Ӧ��ͼ��Ϣ
WLLS_CITY_INDEX	= {
	[37]	= {1,1},
	[176]	= {1,2},
	[78]	= {1,3},
	[162]	= {2,1},
	[80]	= {2,2},
	[1]	= {2,3},
	[11]	= {2,4},
}

WLLS_MAX_COUNT	= 200	--ÿ��׼����������ɶ���ս��

WLLS_FILE_DEATHSCRIPT = "\\script\\missions\\leaguematch\\combat\\playerdeath.lua"

--Υ��ҩƷ
WLLS_FORBID_ITEM = {
	{	"C�ng T�c ho�n", {6, 1, 218, -1, 0, 0}, 511	},
	{	"B�o T�c ho�n", {6, 1, 219, -1, 0, 0}, 512	},
	{	"Ph� Ph�ng ho�n", {6, 1, 220, -1, 0, 0}, 513	},
	{	"��c Ph�ng ho�n", {6, 1, 221, -1, 0, 0}, 514	},
	{	"B�ng Ph�ng ho�n", {6, 1, 222, -1, 0, 0}, 515	},
	{	"H�a Ph�ng ho�n", {6, 1, 223, -1, 0, 0}, 516	},
	{	"L�i Ph�ng ho�n", {6, 1, 224, -1, 0, 0}, 517	},
	{	"Gi�m Th��ng ho�n", {6, 1, 225, -1, 0, 0}, 518	},
	{	"Gi�m H�n ho�n", {6, 1, 226, -1, 0, 0}, 519	},
	{	"Gi�m ��c ho�n", {6, 1, 227, -1, 0, 0}, 520	},
	{	"Gi�m B�ng ho�n", {6, 1, 228, -1, 0, 0}, 521	},
	{	"Ph� C�ng ho�n", {6, 1, 229, -1, 0, 0}, 522	},
	{	"��c C�ng ho�n", {6, 1, 230, -1, 0, 0}, 523	},
	{	"B�ng C�ng ho�n", {6, 1, 231, -1, 0, 0}, 524	},
	{	"H�a C�ng ho�n", {6, 1, 232, -1, 0, 0}, 525	},
	{	"L�i C�ng ho�n", {6, 1, 233, -1, 0, 0}, 526	},
	{	"Tr��ng M�nh ho�n", {6, 1, 234, -1, 0, 0}, 527	},
	{	"Tr��ng N�i ho�n", {6, 1, 235, -1, 0, 0}, 528	},
	{	"Y�n H�ng �an", {6, 1, 115, -1, 0, 0}, 450	},
	{	"X� Lam �an", {6, 1, 116, -1, 0, 0}, 451	},
	{	" N�i Ph� ho�n", {6, 1, 117, -1, 0, 0}, 453	},
	{	" N�i ��c ho�n", {6, 1, 118, -1, 0, 0}, 454	},
	{	" N�i B�ng ho�n", {6, 1, 119, -1, 0, 0}, 455	},
	{	" N�i H�a ho�n", {6, 1, 120, -1, 0, 0}, 456	},
	{	" N�i �i�n ho�n", {6, 1, 121, -1, 0, 0}, 457	},
	{	"Tr��ng M�nh ho�n", {6, 0, 1, -1, 0, 0}, 256	},
	{	"Gia B�o ho�n", {6, 0, 2, -1, 0, 0}, 257	},
	{	"��i L�c ho�n", {6, 0, 3, -1, 0, 0}, 258	},
	{	"Cao Thi�m ho�n", {6, 0, 4, -1, 0, 0}, 259	},
	{	"Cao Trung ho�n", {6, 0, 5, -1, 0, 0}, 260	},
	{	"Phi T�c ho�n", {6, 0, 6, -1, 0, 0}, 261	},
	{	"B�ng Ph�ng ho�n", {6, 0, 7, -1, 0, 0}, 262	},
	{	"L�i Ph�ng ho�n", {6, 0, 8, -1, 0, 0}, 263	},
	{	"H�a Ph�ng ho�n", {6, 0, 9, -1, 0, 0}, 264	},
	{	"��c Ph�ng ho�n", {6, 0, 10, -1, 0, 0}, 265	},
	{	"B�nh ch�ng H�t d� ", {6, 0, 60, -1, 0, 0}, 401	},
	{	"B�nh ch�ng Th�t heo", {6, 0, 61, -1, 0, 0}, 402	},
	{	"B�nh ch�ng Th�t b� ", {6, 0, 62, -1, 0, 0}, 403	},
	{	"B�ch Qu� L� ", {6, 1, 73, -1, 0, 0}, 442	},
	{	"C�t t��ng h�ng bao", {6, 1, 19, -1, 0, 0}, 442	},
	{	"Ho�ng Kim B�o H�p",	{6,	1,	69,	-1,	0,	0},	442},
	{	"T�n S� M�c y�u b�i",	{6,	1,	885,	-1,	0	,0},	542},
	{	"T�n S� ��ng y�u b�i",	{6,	1,	886,	-1,	0	,0},	543},
	{	"T�n S� Ng�n y�u b�i",	{6,	1,	887,	-1,	0	,0},	544},
	{	"T�n S� Kim y�u b�i",	{6,	1,	888,	-1,	0	,0},	545},
	{	"Ng� T� T�n S� y�u b�i",	{6,	1,	889,	-1,	0	,0},	546},
	{	"Bao D��c ho�n ",	{6,	1,	910,	-1,	0	,0},	635},
	{	"H�p l� v�t H�ng bao th�n b�",	{6,	1,	1074,	-1,	0	,0},	635},
	{	"H�p l� v�t [qu� Huy Ho�ng]",	{6,	1,	1075,	-1,	0	,0},	635},
	{	"H�nh n�m",		{6,	1,	1389,	-1,	0,	0},	635	},
	--tinhpn 20100720: forbid item
	{	"C�m nang thay ��i tr�i ��t", {6, 1, 1781, -1, 0, 0},635},	
	{	"M�c Ch� B�o H�p", {6, 1, 2318, -1, 0, 0},635},	
	{	"��ng Ch� B�o H�p", {6, 1, 2319, -1, 0, 0},635},	
	{	"Ng�n Ch� B�o H�p", {6, 1, 2320, -1, 0, 0},635},	
	{	"Ho�ng Kim B�o r��ng", {6, 1, 2321, -1, 0, 0},635},	
	{	"B�o r��ng B�ch Kim", {6, 1, 2322, -1, 0, 0},635},	
	{	"S�t Th� B� B�o", {6, 1, 2347, -1, 0, 0},635},	
	{	"B�o r��ng th�n b� c�a D� T�u", {6, 1, 2374, -1, 0, 0},635},	
	{	"Ch� T�n B� B�o", {6, 1, 2375, -1, 0, 0},635},	
	{	"T�i B�o Th�y T�c", {6, 1, 2376, -1, 0, 0},635},	
	{	"H�i thi�n t�i t�o l� bao", {6, 1, 2527, -1, 0, 0},635},
	{	"Phi t�c ho�n l� bao", {6, 1, 2520, -1, 0, 0},635},
	{	"��i l�c ho�n l� bao", {6, 1, 2517, -1, 0, 0},635},
	--Updated by DinhHQ - 20110425
	{	"C�ng Th�nh Chi�n L� Bao", {6, 1, 2377, -1, 0, 0},635},
	{	"��c ph�ng ho�n l� bao", {6, 1, 2524, -1, 0, 0},635},
	{	"Tr��ng m�nh ho�n l� bao", {6, 1, 2515, -1, 0, 0},635},
	{	"Gia t�c ho�n l� bao", {6, 1, 2516, -1, 0, 0},635},
	{	"Cao thi�m ho�n l� bao", {6, 1, 2518, -1, 0, 0},635},
	{	"Cao trung ho�n l� bao", {6, 1, 2519, -1, 0, 0},635},
	{	"Phi t�c ho�n l� bao", {6, 1, 2520, -1, 0, 0},635},
	{	"B�ng ph�ng ho�n l� bao", {6, 1, 2521, -1, 0, 0},635},
	{	"L�i ph�ng ho�n l� bao", {6, 1, 2522, -1, 0, 0},635},
	{	"H�a ph�ng ho�n l� bao", {6, 1, 2523, -1, 0, 0},635},
	{	"��c ph�ng ho�n l� bao", {6, 1, 2524, -1, 0, 0},635},
	{	"L�nh b�i vi s�n ��o l� bao", {6, 1, 2525, -1, 0, 0},635},
	{	"Ho�n H�n ��n L� Bao", {6, 1, 2830, -1, 0, 0},635},
	{	"Ti�u Di�u T�n", {6, 1, 2831, -1, 0, 0},635},
	{	"Ho�n H�n ��n", {6, 1, 2837, -1, 0, 0},635},
}

WLLS_FORBID_STATES = {
	{"B�t ��ng Minh V��ng ",	15},
	{"Nh� Lai Thi�n Di�p ",	273},
	{"T�nh T�m Quy�t",	33},
	{"Kim Chung Tr�o",	42},
	{"C�u Thi�n Cu�ng L�i ",	67},
	{"X�ch Di�m Th�c Thi�n",	70},
	{"B�ng Lam Huy�n Tinh",	64},
	{"Xuy�n Y Ph� Gi�p ",	356},
	{"V�n ��c Th�c T�m",	73},
	{"Xuy�n T�m ��c Th�ch",	72},
	{"�o�n C�n H� C�t ",	390},
	{"B�ng T�m Tr�i �nh",	269},
	{"H� Th� H�n B�ng ",	100},
	{"Tuy�t �nh",	109},
	--�˼����Ѹ�Ϊ�������ܣ��������	{"����",	124},
	{"Ho�t B�t L�u Th� ",	277},
	{"T�y �i�p Cu�ng V� ",	130},
	{"H�a Li�n Ph�n Hoa",	136},
	{"�o �nh Phi H� ",	137},
	{"Thi�n Ma Gi�i Th� ",	150},
	{"T�a V�ng V� Ng� ",	157},
	{"Thanh Phong ph� ",	171},
	{"Ki B�n ph� ",	174},
	{"Nh�t Kh� Tam Thanh",	178},
	{"B�c Minh ��o H�i",	393},
	{"Thi�n Thanh ��a Tr�c",	173},
	{"Khi H�n Ng�o Tuy�t",	175},
	{"T�y Ti�n T� C�t",	394},
	{"l�nh b�i k� n�ng 1",	631},
	{"l�nh b�i k� n�ng 2",	632},
	{"l�nh b�i k� n�ng 3",	633},
	{"l�nh b�i k� n�ng 4",	634},
	{"l�nh b�i k� n�ng 5",	635},
	-- ��ս�ν��ܲ�����������ʹ��=====>
	{"K� n�ng Ti�n Phong",	958},
	{"K� n�ng Nguy�n So�i",959},		
	{"K� n�ng Th�a T��ng",	960},
	{"K� n�ng Ho�ng ��",	961},
	{"K� n�ng Thi�n T�",	962},
	{"Ho�n H�n ��n k� n�ng",	462},
	{"Ti�u Di�u T�n k� n�ng",	1052},
	-- ��ս�ν��ܲ�����������ʹ��<=====
	--C�p nh�t th�m tr�ng th�i �m d��ng ho�t huy�t ��n v� k�ch c�ng tr� l�c ho�n - Modified By DinhHQ - 20110810
	{"K�ch C�ng Tr� L�c Ho�n",	1120},
	{"K�ch C�ng Tr� L�c Ho�n",261},		
	{"K�ch C�ng Tr� L�c Ho�n",	258},
	{"K�ch C�ng Tr� L�c Ho�n",	260},
	{"�m D��ng Ho�t Huy�t ��n",	1121},
	{"�m D��ng Ho�t Huy�t ��n",	256},
	{"�m D��ng Ho�t Huy�t ��n",	259},
	{"�m D��ng Ho�t Huy�t ��n",	257},
}

WLLS_LEVEL_DESC = {"V� l�m li�n ��u", "V� l�m li�n ��u"}
WLLS_AWARD_TITLE = {85, 81}	--���㡢�߼��ƺŽ����ֱ��� 85 86 87 88 �� 81 82 83 84


WLLS_AWARD_TITLE_EX = 
{
	[1] = {204,205,206,207},
	[2] = {200,201,202,203},
	[3] = {200,201,202,203},
	[4] = {204,205,206,207},
	[5] = {204,205,206,207},
	[6] = {200,201,202,203},
	[7] = {81, 82, 83,84},
}


--Include("\\script\\missions\\leaguematch\\macthtype\\double.lua")
--
--
--Include("\\script\\missions\\leaguematch\\macthtype\\faction.lua")
--
--
--Include("\\script\\missions\\leaguematch\\macthtype\\teacher.lua")
--
--Include("\\script\\missions\\leaguematch\\macthtype\\three.lua")
--
--Include("\\script\\missions\\leaguematch\\macthtype\\single.lua")
--
--Include("\\script\\missions\\leaguematch\\macthtype\\series.lua")
--
--Include("\\script\\missions\\leaguematch\\macthtype\\mixeddoubles.lua")


----��������----

--���ص�ǰ��ɫӦ�����ڵı������ͣ�0Ϊ���ܱ���
function wlls_player_type()
	local n_nexttype = GetGlbValue(GLB_WLLS_NEXT)
	return WLLS_TAB[n_nexttype].player_type()
end

--��鵱ǰ��ɫ�Ƿ���Լ���ָ����ս��
function wlls_check_addmem(n_capidx, n_lid, n_mtype)
	local n_nexttype = GetGlbValue(GLB_WLLS_NEXT)
	return WLLS_TAB[n_nexttype].check_addmem(n_capidx, n_lid, n_mtype)
end

--ÿ�������Ӿ���
function wlls_award_pl_exp(n_rate, n_alevel)
	if (GetUUID() == 0) then	--���ߵĲ���������
		wlls_award_log("B�i v� ng��i ch�i �� tho�t m�ng, kh�ng th� nh�n ph�n th��ng kinh nghi�m.")
		return
	end
	local n_level = GetLevel()
	if (n_level >= WLLS_LEVEL_SENIOR) then
		n_level = WLLS_LEVEL_SENIOR + n_alevel - 2
	elseif (n_level < 90) then
		n_level = 90
	end
	local n_exp = (700+floor((n_level*4-350)/5)*100)*60*0.6*n_rate
	wlls_add_exp(n_exp)
	local str = "Nh�n ���c ph�n th��ng thi ��u��<color=yellow>"..n_exp.."<color>�i�m kinh nghi�m"
	wlls_award_log(str)
	Msg2Player(str)
end

--���ݲ������ͣ�ȷ����������1�����㣻2��������
function wlls_get_level(n_mtype)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	return WLLS_TAB[n_type].match_type[n_mtype].level
end

--���Ϊnil��0������1�����򷵻�0
function FALSE(value)
	if (value == 0 or value == nil) then
		return 1
	else
		return nil
	end
end

--���ص�ǰ��ɫӦ�����ڵı�������0Ϊ���ܱ���
function wlls_player_level()
	local n_level = GetLevel()
	if (n_level >= WLLS_LEVEL_SENIOR) then
		return 2
	elseif (n_level >= WLLS_LEVEL_JUNIOR) then
		return 1
	else
		return 0
	end
end

--�õ�ָ����ͼ��n_whichmap��1���᳡��2��׼������3��������
--n_mtype, n_groupidĬ��Ϊ�뵱ǰ��ͼ��Ӧ��
function wlls_get_mapid(n_whichmap, n_mtype, n_groupid)
	if (FALSE(n_mtype)) then
		n_mtype, n_groupid = wlls_get_mapinfo()
		if (FALSE(n_mtype)) then
			return nil
		end
	end
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb = WLLS_TAB[n_type].match_type[n_mtype]
	if (not tb) then
		return nil
	end
	tb = tb.map[n_groupid]
	if (not tb) then
		return nil
	end
	return tb[n_whichmap]
end

--�õ���ǰ��ͼ�������Ϣ��Ĭ��Ϊȫ����Ϣ
--1���������ͣ�2���������ţ�3����������
function wlls_get_mapinfo(n_idx)
	local n_mapid = SubWorldIdx2ID(SubWorld)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb = WLLS_TAB[n_type].map_index[n_mapid]
	if (not tb) then
		return nil
	end
	if (n_idx) then
		return tb[n_idx]
	else
		return unpack(tb)
	end
end

--�õ���ǰ���е�ͼ����Ϣ������ֵ��1����/2���֣��ڼ���(1/2/3)��
function wlls_getcityinfo()
	local n_mapid = SubWorldIdx2ID(SubWorld)
	local tb = WLLS_CITY_INDEX[n_mapid]
	if (not tb) then
		return nil
	end
	return unpack(tb)
end

--�õ���ǰ/ָ����ͼ�ĺ�������
--n_style��1����������2��������+��������3��������+������+������
function wlls_get_desc(n_style, n_mtype, n_group, n_type)
	if (not n_mtype) then
		n_mtype, n_group = wlls_get_mapinfo()
		if (not n_mtype) then
			return WLLS_LEVEL_DESC[wlls_getcityinfo()]
		end
	end
	if not n_type then
		n_type = GetGlbValue(GLB_WLLS_TYPE)
	end
	local tb = WLLS_TAB[n_type].match_type[n_mtype]
	if (n_style == 2) then
		return WLLS_LEVEL_DESC[tb.level] .. tb.name
	elseif (n_style == 3) then
		return WLLS_LEVEL_DESC[tb.level] .. tb.name .. tb.map[n_group][4]
	else
		return WLLS_LEVEL_DESC[tb.level]
	end
end

--���str_plname�Ƿ���ָ�����ͱ����Ĳ���ѡ�֣����򷵻�n_lid�����򷵻�nil
function wlls_check_player(str_plname, n_level, n_needtype)
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		return nil
	end
	local n_stype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (n_stype ~= n_type) then
		return nil
	end
	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	if (n_needtype) then
		if (n_needtype ~= n_mtype) then
			return nil
		else
			return n_lid
		end
	elseif (n_level == wlls_get_level(n_mtype)) then
		return n_lid, n_mtype
	else
		return nil
	end
end

--��õ�ǰ������ڵ�ս��ID���������͡�����ְ��ս�����֡�ս������
function wlls_lg_info(str_plname)
	if (not str_plname) then
		str_plname = GetName()
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		return nil
	end
	
	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	local str_lgname, _, n_mcount = LG_GetLeagueInfo(n_lid)
	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_JOB)
	return n_lid, n_mtype, n_job, str_lgname, n_mcount
end

--��õ�ǰ������ڵ�ս����Ϣ�����������
function wlls_GetLGInfo(szPlayerName)
	if (not szPlayerName) then
		szPlayerName = GetName()
	end
	
	local tbLG	= {}
	
	tbLG.nLGID = LG_GetLeagueObjByRole(WLLS_LGTYPE, szPlayerName)
	if (FALSE(tbLG.nLGID)) then
		return nil
	end
	
	tbLG.szName, _, tbLG.nMemCount = LG_GetLeagueInfo(tbLG.nLGID)
	tbLG.nNameID= Number2Int(String2Id(tbLG.szName))
	tbLG.nMType	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_MTYPE)
	tbLG.nPoint	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_POINT)
	tbLG.nWin	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_WIN)
	tbLG.nTie	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_TIE)
	tbLG.nTotal	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_TOTAL)
	tbLG.tbEmys	= {}
	tbLG.tbEmys[LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY1)]	= 1
	tbLG.tbEmys[LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY2)]	= 2
	tbLG.tbEmys[LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY3)]	= 3
	return tbLG
end

--ȡ��ָ��Map�ϵ�MissionV
function wlls_getmapmissionv(n_mapid, n_valueid)
	local OldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(n_mapid)
	local n_value = GetMissionV(n_valueid) 
	SubWorld = OldSubWorld
	return n_value
end

--����ָ��Map�ϵ�MissionV
function wlls_setmapmissionv(n_mapid, n_valueid, n_value)
	local OldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(n_mapid)
	SetMissionV(n_valueid, n_value)
	SubWorld = OldSubWorld
end

--�������״̬
function wlls_set_pl_state()
	SetTaskTemp(200, 1)		--��ֹ������Ӫ
	SetLogoutRV(1);		--����������Ϊһ��������
	SetPunish(0);		--�������ͷ�
	DisabledStall(1)	--��ֹ��̯
	ForbitTrade(1);		--��ֹ����
	DisabledUseTownP(1)	--��������׼��ϯ�ͱ����õ���ʹ�ûسǷ�
	SetFightState(0);	--��Ϊ��ս��״̬
	ForbitStamina(1)	--��ֹ����
end

--�ָ����״̬
function wlls_clear_pl_state()
	SetCurCamp(GetCamp());	--��ʱ��Ӫ����ʵ��Ӫһ��
	DisabledStall(0);	--�����̯
	SetTaskTemp(200, 0);	--�������������Ӫ
	SetPunish(1);	--�������ͷ�
	ForbitTrade(0);		--������
	SetDeathScript("");--���������ű�Ϊ��
	RestoreOwnFeature();
	SetFightState(0);	--��Ϊ��ս��״̬
	DisabledUseTownP(0)
	ForbitStamina(0)	--�������
end

--����Mission�����в�Ϊ�յ���Ӫ
function wlls_get_ms_troop()
	local tb_troop = {}
	local n_msid = GetMissionV(WLLS_MSV_MSID);
	
	for i = 1, WLLS_MAX_COUNT do
		if (GetMSPlayerCount(n_msid, i) > 0) then
			tb_troop[getn(tb_troop)+1] = i
		end
	end
	return tb_troop
end

--�õ���Ӫ�����г�Ա
function wlls_get_ms_plidx(n_camp)
	local tb_idx = {}
	local n_msid = GetMissionV(WLLS_MSV_MSID)
	local n_idx = 0
	local n_pidx
	repeat
		n_idx, n_pidx = GetNextPlayer(n_msid, n_idx, n_camp)
		if (n_pidx > 0 ) then
			tb_idx[getn(tb_idx)+1] = n_pidx
		end
	until (n_idx == 0)
	return tb_idx
end

--��Mission Camp��ţ��õ�ս��ID������
function wlls_camp2league(n_camp)
	_M("wlls_camp2league", n_camp)
	local n_msid = GetMissionV(WLLS_MSV_MSID);
	local _, n_pidx = GetNextPlayer(n_msid, 0, n_camp);
	if (n_pidx <= 0) then
		wlls_error_log("wlls_camp2league", "n_pidx <= 0", n_pidx, n_camp)
		return 0, ""
	end
	
	local n_oldidx = PlayerIndex
	PlayerIndex = n_pidx
	local str_plname = GetName()
	PlayerIndex = n_oldidx
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_camp2league", "FALSE(n_lid)", str_plname)
		return 0, ""
	end

	return n_lid, LG_GetLeagueInfo(n_lid)
end

--�õ�һ����Ӫ��������ҵ���Ч�˺�����
function wlls_get_ms_damage(n_camp)
	_M("wlls_get_ms_damage", n_camp)
	
	local n_damage	= 0
	
	-- ÿ���ڳ���Ա�˺����ۼ�
	local n_oldidx	= PlayerIndex
	local tb_pidx	= wlls_get_ms_plidx(n_camp);
	for i = 1, getn(tb_pidx) do
	 	PlayerIndex = tb_pidx[i];
	 	n_damage	= n_damage + ST_GetDamageCounter();
	end
	PlayerIndex	= n_oldidx
	
	return n_damage
end

--��ָ����Ӫ�е�ȫ����������᳡
function wlls_remove_camp(n_camp)
	_M("wlls_remove_camp", n_camp)
	local tb_idx = wlls_get_ms_plidx(n_camp)
	local n_signmap = wlls_get_mapid(1)
	local n_oldidx = PlayerIndex
	for i = 1, getn(tb_idx) do
		PlayerIndex = tb_idx[i]
		SetLogoutRV(0);		--������������������㲻��ͬһ�ص�
		NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	end
	PlayerIndex = n_oldidx
end




--���˲�����¼
function wlls_award_pl(nLevel, nWin, nTie, nTotal)
	_M("wlls_award_pl", nLevel, nWin, nTie, nTotal)
	--��������
	if (nWin > 0) then	SetTask(WLLS_TASKID_WIN, GetTask(WLLS_TASKID_WIN) + nWin) end
	if (nTie > 0) then	SetTask(WLLS_TASKID_TIE, GetTask(WLLS_TASKID_TIE) + nTie) end
	if (nWin > 0 or nTie > 0) then
		local nPoint	= wlls_GetAddPoint(nLevel, nWin, nTie)
		SetTask(WLLS_TASKID_POINT, GetTask(WLLS_TASKID_POINT) + nPoint)
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		Msg2Player(format("Ch�c m�ng b�n �� nh�n ���c ph�n th��ng --- �i�m vinh d� l� %d �i�m", nPoint))
		wlls_award_log(format("Ch�c m�ng b�n �� nh�n ���c ph�n th��ng li�n ��u - �i�m vinh d� l� %d �i�m. T�ng c�ng c� %d �i�m", nPoint, GetTask(WLLS_TASKID_HONOUR)))
	end
	SetTask(WLLS_TASKID_TOTAL, GetTask(WLLS_TASKID_TOTAL) + nTotal)
end

--��¼ս����Ӱ������
function wlls_record_one_match_result(n_level, str_lgname, n_result, n_usedtime)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_award_lg: FALSE(n_lid)")
		return
	end
	local nWin, nTie	= 0, 0
	if (n_result == 1) then	--ʤ
		nWin = 1
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_WIN, 1)
	elseif (n_result == 0) then	--ƽ
		nTie = 1
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TIE, 1)
	end
	local n_point	= wlls_GetAddPoint(n_level, nWin, nTie)
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_POINT, n_point)
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TIME, n_usedtime)
	_M("Th�i gian thi ��u t�ng c�ng: "..(n_usedtime/18).." gi�y ")
	
	local _, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_oldidx = PlayerIndex
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_plidx = SearchPlayer(str_plname)
		if (n_plidx > 0) then
			PlayerIndex = n_plidx
			--start
			if (n_result == 1) then	--ʤ
				
				SetTask(WLLS_TASKID_LGWIN, GetTask(WLLS_TASKID_LGWIN) + 1)
				if n_level == 2 then --��������ȡ��ʤ���ӻ�Ծ��
					DynamicExecuteByPlayer(n_plidx, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "wulinliansai")
				end
			elseif (n_result == 0) then	--ƽ
				
				SetTask(WLLS_TASKID_LGTIE, GetTask(WLLS_TASKID_LGTIE) + 1)
			else	--��
				
			end
			wlls_award_pl(n_level, nWin, nTie, 1)
			SetTask(WLLS_TASKID_LGPOINT, GetTask(WLLS_TASKID_LGPOINT) + n_point)
			SetTask(WLLS_TASKID_LGTOTAL, GetTask(WLLS_TASKID_LGTOTAL) + 1)
			SetTask(WLLS_TASKID_LGTIME, GetTask(WLLS_TASKID_LGTIME) + n_usedtime)
			SyncTaskValueMore(WLLS_TASKID_WIN, WLLS_TASKID_LGTIME)
			SyncTaskValueMore(WLLS_TASKID_POINT, WLLS_TASKID_HONOUR)
		else	--�˲��ڣ����Ӳ�����¼
			if (n_result == 1) then	--ʤ
				LG_ApplyAppendMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_WIN, 1, "", "")
			elseif (n_result == 0) then	--ƽ
				LG_ApplyAppendMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TIE, 1, "", "")
			end
			LG_ApplyAppendMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TOTAL, 1, "", "")
		end
	end
	PlayerIndex = n_oldidx
end


function wlls_AddMatchCount(str_lgname, nCount)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_award_lg: FALSE(n_lid)")
		return
	end
	if LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL) >= 48 then --����48���Ļ���������չ��������������һ�βμӴ���
		
		
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TOTAL_EX, nCount)
	else
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TOTAL, nCount)	
	end
end


function wlls_award_pl_Respect(nRespect)
	
	AddRespect(nRespect)
	Msg2Player(format("Uy danh t�ng %d", nRespect))
	wlls_award_log(format("Nh�n ���c ph�n th��ng 1 tr�n li�n ��u��uy danh %d �i�m, t�ng c�ng c� %d �i�m uy danh", nRespect, GetRespect()))
end

--ս�Ӳ�����¼
function wlls_award_lg(n_level, str_lgname, n_result, n_usedtime)
	
	
	
	_M("wlls_award_lg", n_level, str_lgname, n_result, n_usedtime)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_award_lg: FALSE(n_lid)")
		return
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL) + 1
	local nTotalEx = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL_EX) + 1
	local nMaxCountEx = LG_GetLeagueTask(n_lid, WLLS_LGTASK_USE_LingQi_COUNT) * WLLS_LingQi_PerCOUNT
	
	wlls_AddMatchCount(str_lgname, 1)--����ע�����ʱ����������ܳ�������
	
	if n_total <= 48 then
		wlls_record_one_match_result(n_level, str_lgname, n_result, n_usedtime)
	end
	
	local _, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_oldidx = PlayerIndex
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_plidx = SearchPlayer(str_plname)
		if (n_plidx > 0) then
			PlayerIndex = n_plidx
			
			G_ACTIVITY:OnMessage("LeagueResult", n_level, n_result);
			
			tongaward_league()--�����Ŀ�꣬��������\script\tong\tong_award_head.lua
			--start
			if (n_result == 1) then	--ʤ
				wlls_award_pl_exp(20 * 4, n_level)
				wlls_award_pl_Respect(3)
				
				
			elseif (n_result == 0) then	--ƽ
				wlls_award_pl_exp(10 * 4, n_level)
				wlls_award_pl_Respect(2)
			else	--��
				wlls_award_pl_exp(8 * 4, n_level)
				wlls_award_pl_Respect(1)
			end
			--end
			
			SetTask(WLLS_TASKID_ORGCAMP, 0)
			ST_StopDamageCounter()	-- ֹͣ�˺�����
			if (n_total > 48 ) then
				local szMsg = format("�� tham gia %d tr�n li�n ��u m� r�ng v� c�n %d tr�n m� r�ng", nTotalEx, nMaxCountEx - nTotalEx)
				Msg2Player(szMsg)
			end
		end
	end
	PlayerIndex = n_oldidx
end

--�ó����ձ������
function wlls_matchresult(str_league1, str_league2, result, n_usedtime)
	_M("wlls_matchresult", str_league1, str_league2, result, n_usedtime)
	local n_mtype = wlls_get_mapinfo(1)
	local n_level = wlls_get_level(n_mtype)
	local str = wlls_get_desc(2, n_mtype)
	if (not str_league2) then
		--�ֿյģ�ע�⣺��ʱ����׼������
		str_league2 = ""
		result = 1
		str = str.." ��i ["..str_league1.."] gi�nh th�ng l�i"
		wlls_award_lg(n_level, str_league1, 1, n_usedtime)
	else
		if (result == 1) then	--ʤ
			str = str.." ��i ["..str_league1.."]chi�n th�ng ["..str_league2.."]!"
			wlls_award_lg(n_level, str_league1, 1, n_usedtime)
			wlls_award_lg(n_level, str_league2, 2, n_usedtime)
		else		--ƽ
			str = str.." ��i ["..str_league1.."]c�ng ��i ["..str_league2.."] h�a nhau!"
			wlls_award_lg(n_level, str_league1, 0, n_usedtime)
			wlls_award_lg(n_level, str_league2, 0, n_usedtime)
		end
	end
	Msg2SubWorld("<color=cyan>"..str)
	--Msg2MSAll(WLLS_MSID_COMBAT, "<color=cyan>"..str)
	local n_mid = GetGlbValue(GLB_WLLS_MATCHID)
	local szResult = n_mtype.." "..n_mid.." "..str_league1.." "..str_league2.." "..result 
	LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\log.lua", "OnReceiveMatchResult", szResult , "", "")
	WriteLog(n_mid.."\t"..szResult)
end

--�������Ƿ���Mission�ڣ����򷵻�mscamp
function wlls_in_mission(n_msid, str_plname)
	local n_plidx = SearchPlayer(str_plname)
	if (n_plidx > 0) then
		local n_plmsidx = PIdx2MSDIdx(n_msid, n_plidx)
		if (n_plmsidx > 0) then
			return GetMSIdxGroup(n_msid, n_plmsidx)
		end
	end
end

--�����Ƿ��ж�����ָ��Mission�ڣ����򷵻�mscamp, lgname
function wlls_findfriend(n_msid, str_plname)
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (n_lid == 0) then
		--wlls_error_log("wlls_findfriend", "n_lid == 0")
		return
	end
	
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	for i = 0, n_memcount-1 do
		local str_friendname = LG_GetMemberInfo(n_lid, i)
		local n_mscamp = wlls_in_mission(n_msid, str_friendname)
		if (n_mscamp) then
			return n_mscamp, str_lgname
		end
	end
	return nil, str_lgname
end

function OnCancel()
end

--�볡���
function wlls_en_check()
	local forbiditem_con = 0
	local forbiditem_key = 0
	local keyitem = {}
	local keyitem_g = {}
	local keyitem_d = {}
	local keyitem_p = {}
	for i = 1, 3 do
		keyitem[i] = ITEM_GetImmediaItemIndex (i)
		if (keyitem[i] ~= 0) then
			keyitem_g[i], keyitem_d[i], keyitem_p[i] = GetItemProp(keyitem[i])
		else
			keyitem_g[i] = 0
			keyitem_d[i] = 0
			keyitem_p[i] = 0
		end
	end
	for i = 1, getn(WLLS_FORBID_ITEM) do
		forbiditem_con = CalcEquiproomItemCount( WLLS_FORBID_ITEM[i][2][1], WLLS_FORBID_ITEM[i][2][2], WLLS_FORBID_ITEM[i][2][3], WLLS_FORBID_ITEM[i][2][4] )
		if (forbiditem_con > 0) then
			break
		end
		forbiditem_con = CalcItemCount( 1, WLLS_FORBID_ITEM[i][2][1], WLLS_FORBID_ITEM[i][2][2], WLLS_FORBID_ITEM[i][2][3], WLLS_FORBID_ITEM[i][2][4] )
		if (forbiditem_con > 0) then
			break
		end
		for j = 1, 3 do 
			if (keyitem_g[j] == WLLS_FORBID_ITEM[i][2][1] and keyitem_d[j] == WLLS_FORBID_ITEM[i][2][2] and keyitem_p[j] == WLLS_FORBID_ITEM[i][2][3]) then
				forbiditem_key = 1
				break
			end
		end
	end
	if(forbiditem_con > 0 or forbiditem_key > 0) then
		Say("Ng��i th�t to gan! D�m kh�ng tu�n l�nh c�a V� L�m Minh Ch�, t� � �em d��c ph�m c�m v�o, mau r�i kh�i ��y!", 0)
		return nil
	end
	
--	if (keyitem[1] == 0 and keyitem[2] == 0 and keyitem[3] == 0) then
--		Say("�᳡��Ա����Ŀ����Ŀǰû�аڷ��κ�ҩƷ���㻹�ǰ�ҩƷ���������ɣ�<color=red>�����󽫽�ֹ�ƶ��κ���Ʒ����ȷ����Ŀ������Ʒ�Ѿ��ڷ���ϣ�<color>", 0)
--		return nil
--	end
	
	return 1
end

--ͬ��ս����Ϣ������
function wlls_sync_lginfo(n_lid)
	_M("wlls_sync_lginfo("..tostring(n_lid)..")")
	if (n_lid ~= 0) then
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		SetTask(WLLS_TASKID_LGTYPE, WLLS_TAB[n_type].match_type[n_mtype].level)
		SetTask(WLLS_TASKID_LGRANK, LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK))
		SetTask(WLLS_TASKID_LGPOINT, LG_GetLeagueTask(n_lid, WLLS_LGTASK_POINT))
		SetTask(WLLS_TASKID_LGWIN, LG_GetLeagueTask(n_lid, WLLS_LGTASK_WIN))
		SetTask(WLLS_TASKID_LGTIE, LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIE))
		SetTask(WLLS_TASKID_LGTOTAL, LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL))
		SetTask(WLLS_TASKID_LGTIME, LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIME))
		SyncTaskValueMore(WLLS_TASKID_WIN, WLLS_TASKID_LGTIME)
	else
		SetTask(WLLS_TASKID_LGTYPE, 0)
		SyncTaskValue(WLLS_TASKID_LGTYPE)
		SyncTaskValueMore(WLLS_TASKID_WIN, WLLS_TASKID_TOTAL, 1)
	end
	SyncTaskValue(WLLS_TASKID_POINT)
	-- WLLS_TASKID_HONOUR ���Զ�ͬ��
end

--�������ļӾ���
function wlls_add_exp(n_exp)
	local n_switch	= GetTask(WLLS_TASKID_SWITCH)
	local b_expswt	= GetBit(n_switch, 1)
	local b_expsub	= GetBit(n_switch, 2)
	if (b_expswt ~= 0) then
		Msg2Player("B�n �� thi�t l�p ��ng ph�n th��ng kinh nghi�m li�n ��u, ph�n th��ng kinh nghi�m c�a b�n �� b� h�y b�. N�u c�n c� th� ��n g�p Quan vi�n li�n ��u thay ��i l�i thi�t l�p n�y.")
		return
	end
	if (b_expsub ~= 0) then
		n_exp	= n_exp - GetTaskTemp(WLLS_TEMPTASK)
		Msg2Player("B�n ch� nh�n ���c trong s� ��"..n_exp.."�i�m kinh nghi�m")
	end
	tl_addPlayerExp(n_exp)
end

--д�뽱����־
function wlls_award_log(str)
	_M(str)
	WriteLog("[WLLS_AWARD]"..date("%y-%m-%d,%H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t"..str)
end

--����Ƿ���Բμӱ��������������ܲμӷ���˵�����֣����Բμ��򷵻�nil
function wlls_levelcheck()
	local str_myname = GetName()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_myname)
	if (FALSE(n_lid)) then
		return nil
	end
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	if (GetGlbValue(GLB_WLLS_PHASE) == 1) then	--��Ъ������һ������
		n_sid = n_sid + 1
	end
	local tb = {}
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_over = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_OVER)
		if (n_over > 0 and n_sid > n_over) then	--�Ѿ�Խ������������ǰ����Խ����
			if (str_plname == str_myname) then
				return "Xin l�i, t� c�ch tham gia c�a b�n �� b� h�y b�. Nguy�n nh�n c� th� trong l�n thi ��u c�a b�n k� tr��c qu� <color=red>��ng c�p h�n ch�<color>, ��i thi ��u ho�c <color=red>��i tr��ng (s� ph�) c�a b�n �� r�i kh�i ��i thi ��u<color>. M�i b�n r�i kh�i ��i thi ��u hi�n t�i, n�u kh�ng ��i b�n s� kh�ng ���c tham gia thi ��u."
			end
			tb[getn(tb)+1] = str_plname
		end
	end
	if (getn(tb) == 0) then
		return nil
	end
	return "Xin l�i! m�t s� th�nh vi�n trong ��i �� qu� ��ng c�p h�n ch� trong thi ��u k� tr��c: <color=red>"..join(tb, "  ").."<color><enter>Nh�m c�a b�n kh�ng th� tham gia m�a thi ��u n�y. N�u mu�n b�n c� th� r�i nh�m."
end

--�õ���ǰ������������ָ�����͵ĵ�ͼ����ʽ��[SubWorld] = GroupIdx��
function wlls_get_subworld(nMapType)
	local tbSub = {}
	local nSType = GetGlbValue(GLB_WLLS_TYPE)
	local tb = WLLS_TAB[nSType].match_type
	for nMType = 1, getn(tb) do
		local tbMaps = tb[nMType].map
		local nGroups	= getn(tbMaps)
		for nGroupIdx = 1, nGroups do
			local nSubIdx = SubWorldID2Idx(tbMaps[nGroupIdx][nMapType])
			if (nSubIdx >= 0) then
				tbSub[nSubIdx] = (nMType-1)*nGroups + nGroupIdx
			end
		end
	end
	return tbSub
end

--�͵���������֮ǰ�ĵط�
function wlls_transback()
	SetLogoutRV(0);
	NewWorld(GetTask(WLLS_TASKID_FROMMAP), GetTask(WLLS_TASKID_FROM_X), GetTask(WLLS_TASKID_FROM_Y))
end

--���� ��������ʤƽ����������Ӧ�û���
function wlls_GetAddPoint(nLevel, nWin, nTie)
	return nWin * 5 * nLevel + nTie * 2 * nLevel
end

--�жϵ�ǰ�����Ƿ���
function wlls_CheckIsOpen(nLevel)
	local nClose = GetGlbValue(GLB_WLLS_CLOSE)
	if (nClose) then
		if (GetBit(nClose, nLevel) ~= 0) then
			Say(wlls_npcname().."Xin l�i! M�y ch� "..WLLS_LEVEL_DESC[nLevel].."hi�n �ang t�m d�ng!", 0)
			return nil
		end
	end
	return 1
end

--������־
function wlls_error_log(...)
	local str = "WLLS_ERROR["..tostring(GetName()).."]("..tostring(SubWorldIdx2ID(SubWorld))..")"..date("%y-%m-%d,%H:%M:%S")..": "..join(arg)
	WriteLog(str)
	_ERRORMESSAGE(str)
	--error(str)
end

--���������
function _M(...)
	--local str = join(arg)
	--Msg2Player("DEBUG:<color=white>"..str)
	--str = "DEBUG["..tostring(GetName()).."]("..tostring(SubWorldIdx2ID(SubWorld))..")"..date("%y-%m-%d,%H:%M:%S")..": "..str
	--print(str)
	--WriteLog(str)
end
