----------------------------------------------------------------
--FileName:	headinfo.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	��ĩ�������ս��֮�������
--			����1���ͷ�ļ��Զ��峣��
-----------------------------------------------------------------
IncludeLib("FILESYS");
--IncludeLib("BATTLE");
IncludeLib("TITLE");
IncludeLib("RELAYLADDER")
Include( "\\script\\task\\system\\task_string.lua" );

--print(date("%w"))				--��õ�ǰ���������� 1--Monday��2--Tuesday��3--Wednesday��4--Thursday��5--Frieday��6--Saturday��0--Sunday
GV_TSK_CD_OPEN = 35
FIRE_OPENDAY_SATURDAY = 6;		--
FIRE_OPENDAY_SUNDAY = 0;		--
CD_LEVEL_LIMIT = 80		--��Ͳμ��سǵȼ�
TASKID_FIRE_KEY = 1185;--random(1000000);					--ÿ���εĹؼ��֣��ɴ��ж��Ƿ�Ϊ���ִβμӵ����
TASKID_FIRE_DAY = 1186;--tonumber(date("%m%d"));			--���һ��ֻ�ܲμ�һ������ս������¼����
TASKID_FIRE_ADDR = 1187;--����ĵĳ���ID
--1189
TSKID_FIRE_SIGNLVL = 1867	--����ʱ�ȼ�
TSKID_FIRE_SIGNEXP = 1868	--����ʱ����ֵ
TSKID_FIRE_SUMEXP = 1869	--��õľ���ֵ
TSKID_PLAYER_ZHANGONG = 1879 --��õ�ս��ֵ
FIRE_JOINUP_FEE = 100000;			--��������10w��
PL_TOTALPOINT = 1
--LADDER_ID_TEMP = 10255	--�ݴ����а�
--LADDER_ID_FANIEL = 10256--��������

MAX_NPC_COUNT = 500--1000--5000;	--���Ƶ�ͼ�������5000��npc

FIRE_1RSTNPC_COUNT = 13500--15000;
FIRE_2CNDNPC_COUNT = 3000--2000;
FIRE_3RDNPC_COUNT = 1500--1000;
FIRE_4THNPC_COUNT = 120;
FIRE_5THNPC_COUNT = 10;

TNPC_DOCTOR1 = 55;			--�ξ�ҽ��Npcģ��ID��
TNPC_DOCTOR2 = 49;			--���ҽ��Npcģ��ID��
TNPC_DEPOSIT = 625;			--������NPCģ��ID
TNPC_CHEFU = 393;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;
RANK_SKILL = 661;		--�ƺŹ⻷
					--�б�	С�ӳ�	����	��	Ԫ˧ ը����
tbTNPC_SOLDIER = {	{1067,	1068,	1069,	1070,	1080, 1337},	--��
										{1072,	1073,	1074,	1075,	1090, 1337}}	--��
tbSOLDIER_NAME = {	"Ti�u hi�u", "��i tr��ng", "Ti�n phong", "Ch� t��ng", "Ch� so�i", "C�ng Th�nh Chi�n Xa"	}
tbPlAYERER_NAME 		= {"Binh s� ","Hi�u �y ","Th�ng L�nh ","Ph� t��ng ","��i t��ng "} --ս���ﵽ��ν�⻷
tbPlAYERER_ZHANGONG = {     0,   300,   500,  1000,  2000} --����0Ϊʿ��������300ΪУξ....
tbPlAYERER_GUANGHUAN= { {89,   90,   91,   92,   93}, --�γƺ�ID
												{94,   95,   96,   97,   98}} --��
					--����	���� �سǲ��ֵĹ̶�npc
tbTNPC_SOLDIER1 = {	{1067,	1068},	--��
					{1072,	1073}}	--��
tbSOLDIER_NAME1 = {	"V� binh", "T��ng qu�n"}

tbSOLDIER_LEVEL = {	95, 95, 95, 100, 100 ,95}
tbSOLDIER_LEVEL1 = {	95, 95}--�سǹٱ��ļ���
                  --СУ	�ӳ�	�ȷ�	����	��˧ ը���� ȡ��
tbKILLNPC_AWARD = {2,8,10,40,60,30,10}	--ɱ��npc���ս��
tbKILLNPC_SHAREAWARD = {1,5,5,20,30,15,0}--���ѻ��ս��
tbFILE_NPCDEATH = 
	{
	"\\script\\missions\\newcitydefence\\npcdeath_1.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_2.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_3.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_4.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_5.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_6.lua",	
	};
FILE_SHOUCHENG_DEATH = {
		"\\script\\missions\\newcitydefence\\shouchengnpcdeath1.lua",
		"\\script\\missions\\newcitydefence\\shouchengnpcdeath2.lua",
	}

tbDEFENCE_MAPID = { 580, 581 }	--���ν��ͼ��by��־ɽ
tbDEFENCE_SIGNMAP = { 518, 519 }
tbREVIVAL_POS = {
					{1528,3321},
					{1557,3330},
					{1567,3358},
					{1537,3369},
				}
tbSIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}


tbDEFENCE_RETURN = {
						[1] = { 1520,3228, "Ph��ng T��ng Ph� ", 2 },	--����
						[11] = { 3018,5089, "Th�nh �� Ph� ", 1 },	--�ɶ�
						[37] = { 1632,3185, "Bi�n Kinh Ph� ", 2 },	--�꾩
						[78] = { 1439,3214, "T��ng D��ng Ph� ", 1 },	--����
						[80] = { 1593,3197, "D��ng Ch�u Ph� ", 1 },	--����
						[162] = { 1470,3269, "��i L�", 1 },	--����
						[176] = { 1392,3313, "L�m An Ph� ", 1 },	--�ٰ�
					}
					
tbDEFENCE_ANNOUNCE = {
			"Ng��i ch�i c� th� ��n Th�nh �� ph�, T��ng D��ng ph�, L�m An ph�, ��i L� ph�, D��ng Ch�u ph� ��i tho�i v�i V� binh th�nh m�n �� tham gia th� th�nh phe T�ng.",
			"Ng��i ch�i c� th� ��n Ph��ng T��ng ph�, Bi�n Kinh ph� ��i tho�i v�i V� binh th�nh m�n �� tham gia th� th�nh phe Kim."
}

FILE_PLAYERDEATH = 		"\\script\\missions\\newcitydefence\\playerdeath.lua";
FILE_DOCTOR = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_BOX = 				"\\script\\missions\\newcitydefence\\npc\\cd_box.lua";
FILE_DOCTOR1 = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_DOCTOR2 = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_CENTERTRAP1 = 		"\\script\\missions\\newcitydefence\\trap\\hometrap1.lua";
FILE_CENTERTRAP2 = 		"\\script\\missions\\newcitydefence\\trap\\hometrap2.lua";
FILE_CD_TRANSER = 		"\\script\\missions\\newcitydefence\\npc\\cd_transer.lua"
FILE_SYMBOLNPC =		"";

FRAME2TIME = 18;				--18֡��Ϸʱ���൱��1����
MISSIONID = 27;					--mission���
MAX_MEMBERCOUNT = 400;			--���ǵ�ͼ�����������

SMALLTIMERID = 52;				--��ʱ�����
TOTALTIMERID = 53;				--��ʱ�����

SMALL_TIME = 20 * FRAME2TIME;				--ÿ20���ʱһ��
TOTAL_TIME = 150 * 60 * FRAME2TIME;			--150���Ӽ�ʱһ�Σ������
RUNGAME_TIME = 30 * 60 * FRAME2TIME / SMALL_TIME; --����30����֮������
LASTREPORT_TIME = 145 * 60 * FRAME2TIME / SMALL_TIME;	--�س����5����û���ӣ���ʾһ��ʱ��
CALLBOSS_ZHUSHUAI = 120 * 60 * FRAME2TIME / SMALL_TIME;	--��˧����ʱ��

NHOMEDEFENCE = 24 --�Ƿ���ʼֵ
NHOMEDEFENCE_DAMAGE = 1  --�Ƿ��˺�ֵ�����ǳ��ԳǷ�

MS_STATE = 1;				--�����м�¼����״̬�ı���ID
MS_RANDKEY = 2;				--��¼��ǰ�����µ�key�������
MS_OPENDAY = 3;				--��¼��ǰ����ʼ���£���
MS_CITYCAMP = 4;			--��¼���ŵ�ͼ����Ӫ����-1����-2
MS_SMALL_TIME = 5;			--��¼smalltimer��ʱ���Ĵ���
MS_BOSS4_DOWN = 6;			--Ϊ1�Ѳ���Сboss��0��δ
MS_BOSS5_DOWN	=	7;		--Ϊ1�Ѳ�����boss��0��δ
MS_TLCOUNT_COMMON = 8;		--ɱ������ͨ�ֵ�����
MS_CITYDEFENCE = 9;			--Ϊ0��ʾ��ʱ��û���������Ϊ1��ʾ�������
MS_MISSIONID = 10;			--���뵱ǰmission��ID

MS_MAXCOUNTNPC_1 = 11;		--СУʣ������
MS_MAXCOUNTNPC_2 = 12;		--�ӳ�ʣ������
MS_MAXCOUNTNPC_3 = 13;			--�ȷ�ʣ������
MS_MAXCOUNTNPC_4 = 14;			--����ʣ������
MS_MAXCOUNTNPC_5 = 15;			--��˧ʣ������

MS_RESTCOUNTNPC_1 = 16;		--��¼һ��ɱ���İ׹�����
MS_RESTCOUNTNPC_2 = 17;		--��¼һ��ɱ������������
MS_RESTCOUNTNPC_3 = 18;		--��¼һ��ɱ����ɱ�ּ�������
MS_RESTCOUNTNPC_4 = 19;		--��¼һ��ɱ����СBOSS����
MS_RESTCOUNTNPC_5 = 20;		--��¼һ��ɱ���Ĵ�BOSS����

MS_HOMEOUT_X1 = 21;			--Ұ������Ӫ�Ĵ�������X����һ��Trap
MS_HOMEOUT_Y1 = 22;
MS_HOMEOUT_X2 = 23;			--Ұ������Ӫ�Ĵ�������X���ڶ���Trap
MS_HOMEOUT_Y2 = 24;

MS_CENTER_X1 = 27;			--��Ӫ��Ұ��Ĵ�������X����һ��Trap
MS_CENTER_Y1 = 28;
MS_CENTER_X2 = 29;			--��Ӫ��Ұ��Ĵ�������X����һ��Trap
MS_CENTER_Y2 = 30;

MS_SHOUCHENGWEIBING = 33
MS_SHOUCHENGJIANGJUN = 34

MS_HOMEDEFENCE = 35	--�Ƿ�

MS_S_GUAI1 = 1;			--��¼��һ��ˢ�ֵ�
MS_S_GUAI2 = 2;			--��¼�ڶ���ˢ�ֵ�
MS_S_GUAI3 = 3;			--��¼������ˢ�ֵ�
MS_S_CD_NAME = 4;			--��ǰ�س�ս�۵�����

CD_BASE_VALUE = 1000000

TB_CD_AWARDEXP = {600, 700, 800, 900, 1000}
TB_CD_AWARDITEM = {
			--{ itemname, itemvalue, itemlist},
				{"Ti�n Th�o L� ",0.719012,{ 6,1,71,0,1,1,1 }},
				{"B�ch Qu� L� ",0.02,{ 6,1,73,0,1,1,1 }},
				{"Thi�n s�n  B�o L� ",0.02,{ 6,1,72,0,1,1,1 }},
				{"Huy�n Tinh c�p 4",0.02,{ 6,1,147,0,4,1,1 }},
				{"Huy�n Tinh c�p 5",0.003,{ 6,1,147,0,5,1,1 }},
				{"Huy�n Tinh c�p 6",0.001,{ 6,1,147,0,6,1,1 }},
				{"Huy�n Tinh c�p 7",0.0003,{ 6,1,147,0,7,1,1 }},
				{"Huy�n Tinh c�p 8",0.0001,{ 6,1,147,0,8,1,1 }},
				{"��i L�c ho�n",0.02,{ 6,0,3,0,1,1,1 }},
				{"Phi T�c ho�n",0.02,{ 6,0,6,0,1,1,1 }},
				{"��c Ph�ng ho�n",0.02,{ 6,0,10,0,1,1,1 }},
				{"B�ng Ph�ng ho�n",0.02,{ 6,0,7,0,1,1,1 }},
				{"H�a Ph�ng ho�n",0.02,{ 6,0,9,0,1,1,1 }},
				{"L�i Ph�ng ho�n",0.02,{ 6,0,8,0,1,1,1 }},
				{"Cao Trung ho�n",0.02,{ 6,0,5,0,1,1,1 }},
				{"Gia B�o ho�n",0.02,{ 6,0,2,0,1,1,1 }},
				{"Cao Thi�m ho�n",0.02,{ 6,0,4,0,1,1,1 }},
				{"Tr��ng M�nh ho�n",0.02,{ 6,0,1,0,1,1,1 }},
				{"B�n Nh��c T�m Kinh",0.0005,{ 6,1,12,0,1,1,1 }},
				{"Lam Th�y Tinh",0.001,{ 238 }},
				{"L�c Th�y Tinh",0.001,{ 240 }},
				{"T� Th�y Tinh",0.001,{ 239 }},
				{"V� L�m M�t T�ch",0.0001,{ 6,1,26,0,1,1,1 }},
				{"T�y T�y Kinh",0.0001,{ 6,1,22,0,1,1,1 }},
				{"M�nh Hi�p C�t Thi�t Huy�t Sam (1/4) /4)",0.0001,{ 903 }},
				{"M�nh Hi�p C�t Thi�t Huy�t Sam (2/4) /4)",0.0001,{ 904 }},
				{"M�nh Hi�p C�t Thi�t Huy�t Sam (3/4) /4)",0.0001,{ 905 }},
				{"M�nh Hi�p C�t Thi�t Huy�t Sam (4/4) /4)",0.0001,{ 906 }},
				{"M�nh Hi�p C�t �a T�nh Ho�n (1/4) /4)",0.0002,{ 907 }},
				{"M�nh Hi�p C�t �a T�nh Ho�n (2/4) /4)",0.0002,{ 908 }},
				{"M�nh Hi�p C�t �a T�nh Ho�n (3/4) /4)",0.0002,{ 909 }},
				{"M�nh Hi�p C�t �a T�nh Ho�n (4/4) /4)",0.0002,{ 910 }},
				{"M�nh Hi�p C�t �an Tam Gi�i (1/4) /4)",0.0002,{ 911 }},
				{"M�nh Hi�p C�t �an Tam Gi�i (2/4) /4)",0.0002,{ 912 }},
				{"M�nh Hi�p C�t �an Tam Gi�i (3/4) /4)",0.0002,{ 913 }},
				{"M�nh Hi�p C�t �an Tam Gi�i (4/4) /4)",0.0002,{ 914 }},
				{"M�nh Hi�p C�t T�nh � K�t (1/6) /6)",0.00002,{ 771 }},
				{"M�nh Hi�p C�t T�nh � K�t (2/6) /6)",0.00002,{ 772 }},
				{"M�nh Hi�p C�t T�nh � K�t (3/6) /6)",0.00002,{ 773 }},
				{"M�nh Hi�p C�t T�nh � K�t (4/6) /6)",0.00002,{ 774 }},
				{"M�nh Hi�p C�t T�nh � K�t (5/6) /6)",0.00002,{ 775 }},
				{"M�nh Hi�p C�t T�nh � K�t (6/6) /6)",0.00002,{ 776 }},
				{"M�nh C�n Qu�c Ngh� Th��ng (1/6) /6)",0.00001,{ 777 }},
				{"M�nh C�n Qu�c Ngh� Th��ng (2/6) /6)",0.00001,{ 778 }},
				{"M�nh C�n Qu�c Ngh� Th��ng (3/6) /6)",0.00001,{ 779 }},
				{"M�nh C�n Qu�c Ngh� Th��ng (4/6) /6)",0.00001,{ 780 }},
				{"M�nh C�n Qu�c Ngh� Th��ng (5/6) /6)",0.00001,{ 781 }},
				{"M�nh C�n Qu�c Ngh� Th��ng (6/6) /6)",0.00001,{ 782 }},
				{"M�nh Nhu T�nh Th�c N� H�ng Li�n (1/4) /4)",0.0002,{ 915 }},
				{"M�nh Nhu T�nh Th�c N� H�ng Li�n (2/4) /4)",0.0002,{ 916 }},
				{"M�nh Nhu T�nh Th�c N� H�ng Li�n (3/4) /4)",0.0002,{ 917 }},
				{"M�nh Nhu T�nh Th�c N� H�ng Li�n (4/4) /4)",0.0002,{ 918 }},
				{"M�nh Nhu T�nh  Ph�ng Nghi Gi�i Ch� (1/4) /4)",0.0002,{ 919 }},
				{"M�nh Nhu T�nh  Ph�ng Nghi Gi�i Ch� (2/4) /4)",0.0002,{ 920 }},
				{"M�nh Nhu T�nh  Ph�ng Nghi Gi�i Ch� (3/4) /4)",0.0002,{ 921 }},
				{"M�nh Nhu T�nh  Ph�ng Nghi Gi�i Ch� (4/4) /4)",0.0002,{ 922 }},
				{"M�nh Nhu T�nh  Tu� T�m Ng�c B�i (1/4) /4)",0.00002,{ 923 }},
				{"M�nh Nhu T�nh  Tu� T�m Ng�c B�i (2/4) /4)",0.00002,{ 924 }},
				{"M�nh Nhu T�nh  Tu� T�m Ng�c B�i (3/4) /4)",0.00002,{ 925 }},
				{"M�nh Nhu T�nh  Tu� T�m Ng�c B�i (4/4) /4)",0.00002,{ 926 }},
				{"M�nh ��nh Qu�c Thanh Sa Tr��ng Sam (1/4) /4)",0.0001,{ 927 }},
				{"M�nh ��nh Qu�c Thanh Sa Tr��ng Sam (2/4) /4)",0.0001,{ 928 }},
				{"M�nh ��nh Qu�c Thanh Sa Tr��ng Sam (3/4) /4)",0.0001,{ 929 }},
				{"M�nh ��nh Qu�c Thanh Sa Tr��ng Sam (4/4) /4)",0.0001,{ 930 }},
				{"M�nh ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa (1/4) /4)",0.0002,{ 931 }},
				{"M�nh ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa (2/4) /4)",0.0002,{ 932 }},
				{"M�nh ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa (3/4) /4)",0.0002,{ 933 }},
				{"M�nh ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa (4/4) /4)",0.0002,{ 934 }},
				{"M�nh ��nh Qu�c T� ��ng H� uy�n (1/4) /4)",0.0002,{ 935 }},
				{"M�nh ��nh Qu�c T� ��ng H� uy�n (2/4) /4)",0.0002,{ 936 }},
				{"M�nh ��nh Qu�c T� ��ng H� uy�n (3/4) /4)",0.0002,{ 937 }},
				{"M�nh ��nh Qu�c T� ��ng H� uy�n (4/4) /4)",0.0002,{ 938 }},
				{"M�nh ��nh Qu�c Ng�n T�m Y�u ��i (1/4) /4)",0.0002,{ 939 }},
				{"M�nh ��nh Qu�c Ng�n T�m Y�u ��i (2/4) /4)",0.0002,{ 940 }},
				{"M�nh ��nh Qu�c Ng�n T�m Y�u ��i (3/4) /4)",0.0002,{ 941 }},
				{"M�nh ��nh Qu�c Ng�n T�m Y�u ��i (4/4) /4)",0.0002,{ 942 }},
				{"M�nh Tr�ch Tinh Ho�n (1/6) /6)",0.00005,{ 711 }},
				{"M�nh Tr�ch Tinh Ho�n (2/6) /6)",0.00005,{ 712 }},
				{"M�nh Tr�ch Tinh Ho�n (3/6) /6)",0.00005,{ 713 }},
				{"M�nh Tr�ch Tinh Ho�n (4/6) /6)",0.00005,{ 714 }},
				{"M�nh Tr�ch Tinh Ho�n (5/6) /6)",0.00005,{ 715 }},
				{"M�nh Tr�ch Tinh Ho�n (6/6) /6)",0.00005,{ 716 }},
				{"M�nh ���ng Ngh� Gi�p (1/6) /6)",0.00005,{ 717 }},
				{"M�nh ���ng Ngh� Gi�p (2/6) /6)",0.00005,{ 718 }},
				{"M�nh ���ng Ngh� Gi�p (3/6) /6)",0.00005,{ 719 }},
				{"M�nh ���ng Ngh� Gi�p (4/6) /6)",0.00005,{ 720 }},
				{"M�nh ���ng Ngh� Gi�p (5/6) /6)",0.00005,{ 721 }},
				{"M�nh ���ng Ngh� Gi�p (6/6) /6)",0.00005,{ 722 }},
				{"M�nh L�c Ph� Th�y H� Th�n Ph� (1/6) /6)",0.000005,{ 723 }},
				{"M�nh L�c Ph� Th�y H� Th�n Ph� (2/6) /6)",0.000005,{ 724 }},
				{"M�nh L�c Ph� Th�y H� Th�n Ph� (3/6) /6)",0.000005,{ 725 }},
				{"M�nh L�c Ph� Th�y H� Th�n Ph� (4/6) /6)",0.000005,{ 726 }},
				{"M�nh L�c Ph� Th�y H� Th�n Ph� (5/6) /6)",0.000005,{ 727 }},
				{"M�nh L�c Ph� Th�y H� Th�n Ph� (6/6) /6)",0.000005,{ 728 }},
				{"M�nh B�ch Kim Y�u ��i (1/6) /6)",0.00001,{ 729 }},
				{"M�nh B�ch Kim Y�u ��i (2/6) /6)",0.00001,{ 730 }},
				{"M�nh B�ch Kim Y�u ��i (3/6) /6)",0.00001,{ 731 }},
				{"M�nh B�ch Kim Y�u ��i (4/6) /6)",0.00001,{ 732 }},
				{"M�nh B�ch Kim Y�u ��i (5/6) /6)",0.00001,{ 733 }},
				{"M�nh B�ch Kim Y�u ��i (6/6) /6)",0.00001,{ 734 }},
				{"M�nh Thi�n T�m H� Uy�n (1/6) /6)",0.00001,{ 735 }},
				{"M�nh Thi�n T�m H� Uy�n (1/6) /6)",0.00001,{ 736 }},
				{"M�nh Thi�n T�m H� Uy�n (1/6) /6)",0.00001,{ 737 }},
				{"M�nh Thi�n T�m H� Uy�n (1/6) /6)",0.00001,{ 738 }},
				{"M�nh Thi�n T�m H� Uy�n (1/6) /6)",0.00001,{ 739 }},
				{"M�nh Thi�n T�m H� Uy�n (1/6) /6)",0.00001,{ 740 }},
				{"M�nh Thi�n T�m Ngoa (1/6) /6)",0.00001,{ 741 }},
				{"M�nh Thi�n T�m Ngoa (2/6) /6)",0.00001,{ 742 }},
				{"M�nh Thi�n T�m Ngoa (3/6) /6)",0.00001,{ 743 }},
				{"M�nh Thi�n T�m Ngoa (4/6) /6)",0.00001,{ 744 }},
				{"M�nh Thi�n T�m Ngoa (5/6) /6)",0.00001,{ 745 }},
				{"M�nh Thi�n T�m Ngoa (6/6) /6)",0.00001,{ 746 }},
				{"M�nh B�ng Tinh Th�ch H�ng Li�n (1/6) /6)",0.0001,{ 747 }},
				{"M�nh B�ng Tinh Th�ch H�ng Li�n (2/6) /6)",0.0001,{ 748 }},
				{"M�nh B�ng Tinh Th�ch H�ng Li�n (3/6) /6)",0.0001,{ 749 }},
				{"M�nh B�ng Tinh Th�ch H�ng Li�n (4/6) /6)",0.0001,{ 750 }},
				{"M�nh B�ng Tinh Th�ch H�ng Li�n (5/6) /6)",0.0001,{ 751 }},
				{"M�nh B�ng Tinh Th�ch H�ng Li�n (6/6) /6)",0.0001,{ 752 }},
				{"M�nh C�c Hoa Th�ch Ch� Ho�n (1/6) /6)",0.0001,{ 753 }},
				{"M�nh C�c Hoa Th�ch Ch� Ho�n (2/6) /6)",0.0001,{ 754 }},
				{"M�nh C�c Hoa Th�ch Ch� Ho�n (3/6) /6)",0.0001,{ 755 }},
				{"M�nh C�c Hoa Th�ch Ch� Ho�n (4/6) /6)",0.0001,{ 756 }},
				{"M�nh C�c Hoa Th�ch Ch� Ho�n (5/6) /6)",0.0001,{ 757 }},
				{"M�nh C�c Hoa Th�ch Ch� Ho�n (6/6) /6)",0.0001,{ 758 }},
				{"M�nh �i�n Ho�ng Th�ch Ng�c B�i (1/6) /6)",0.0001,{ 759 }},
				{"M�nh �i�n Ho�ng Th�ch Ng�c B�i (2/6) /6)",0.0001,{ 760 }},
				{"M�nh �i�n Ho�ng Th�ch Ng�c B�i (3/6) /6)",0.0001,{ 761 }},
				{"M�nh �i�n Ho�ng Th�ch Ng�c B�i (4/6) /6)",0.0001,{ 762 }},
				{"M�nh �i�n Ho�ng Th�ch Ng�c B�i (5/6) /6)",0.0001,{ 763 }},
				{"M�nh �i�n Ho�ng Th�ch Ng�c B�i (6/6) /6)",0.0001,{ 764 }},
				{"M�nh K� Huy�t Th�ch Gi�i Ch� (1/6) /6)",0.0001,{ 765 }},
				{"M�nh K� Huy�t Th�ch Gi�i Ch� (2/6) /6)",0.0001,{ 766 }},
				{"M�nh K� Huy�t Th�ch Gi�i Ch� (3/6) /6)",0.0001,{ 767 }},
				{"M�nh K� Huy�t Th�ch Gi�i Ch� (4/6) /6)",0.0001,{ 768 }},
				{"M�nh K� Huy�t Th�ch Gi�i Ch� (5/6) /6)",0.0001,{ 769 }},
				{"M�nh K� Huy�t Th�ch Gi�i Ch� (6/6) /6)",0.0001,{ 770 }},
				{"M�nh Hi�p C�t T�nh � K�t (1/6) /6)",0.0001,{ 783 }},
				{"M�nh Hi�p C�t T�nh � K�t (2/6) /6)",0.0001,{ 784 }},
				{"M�nh Hi�p C�t T�nh � K�t (3/6) /6)",0.0001,{ 785 }},
				{"M�nh Hi�p C�t T�nh � K�t (4/6) /6)",0.0001,{ 786 }},
				{"M�nh Hi�p C�t T�nh � K�t (5/6) /6)",0.0001,{ 787 }},
				{"M�nh Hi�p C�t T�nh � K�t (6/6) /6)",0.0001,{ 788 }},
				{"M�nh Kim Ti Ch�nh H�ng C� Sa (1/6) /6)",0.00001,{ 789 }},
				{"M�nh Kim Ti Ch�nh H�ng C� Sa (2/6) /6)",0.00001,{ 790 }},
				{"M�nh Kim Ti Ch�nh H�ng C� Sa (3/6) /6)",0.00001,{ 791 }},
				{"M�nh Kim Ti Ch�nh H�ng C� Sa (4/6) /6)",0.00001,{ 792 }},
				{"M�nh Kim Ti Ch�nh H�ng C� Sa (5/6) /6)",0.00001,{ 793 }},
				{"M�nh Kim Ti Ch�nh H�ng C� Sa (6/6) /6)",0.00001,{ 794 }},
				{"M�nh Huy�n V� Ho�ng Kim Kh�i (1/6) /6)",0.00001,{ 795 }},
				{"M�nh Huy�n V� Ho�ng Kim Kh�i (2/6) /6)",0.00001,{ 796 }},
				{"M�nh Huy�n V� Ho�ng Kim Kh�i (3/6) /6)",0.00001,{ 797 }},
				{"M�nh Huy�n V� Ho�ng Kim Kh�i (4/6) /6)",0.00001,{ 798 }},
				{"M�nh Huy�n V� Ho�ng Kim Kh�i (5/6) /6)",0.00001,{ 799 }},
				{"M�nh Huy�n V� Ho�ng Kim Kh�i (6/6) /6)",0.00001,{ 800 }},
				{"M�nh T�y T��ng Ng�c Kh�u (1/6) /6)",0.00001,{ 801 }},
				{"M�nh T�y T��ng Ng�c Kh�u (2/6) /6)",0.00001,{ 802 }},
				{"M�nh T�y T��ng Ng�c Kh�u (3/6) /6)",0.00001,{ 803 }},
				{"M�nh T�y T��ng Ng�c Kh�u (4/6) /6)",0.00001,{ 804 }},
				{"M�nh T�y T��ng Ng�c Kh�u (5/6) /6)",0.00001,{ 805 }},
				{"M�nh T�y T��ng Ng�c Kh�u (6/6) /6)",0.00001,{ 806 }},
				{"M�nh H�ng Truy Nhuy�n Th�p H�i (1/6) /6)",0.00001,{ 807 }},
				{"M�nh H�ng Truy Nhuy�n Th�p H�i (2/6) /6)",0.00001,{ 808 }},
				{"M�nh H�ng Truy Nhuy�n Th�p H�i (3/6) /6)",0.00001,{ 809 }},
				{"M�nh H�ng Truy Nhuy�n Th�p H�i (4/6) /6)",0.00001,{ 810 }},
				{"M�nh H�ng Truy Nhuy�n Th�p H�i (5/6) /6)",0.00001,{ 811 }},
				{"M�nh H�ng Truy Nhuy�n Th�p H�i (6/6) /6)",0.00001,{ 812 }},
				{"M�nh Thanh T�m H��ng Thi�n Ch�u (1/6) /6)",0.00001,{ 813 }},
				{"M�nh Thanh T�m H��ng Thi�n Ch�u (2/6) /6)",0.00001,{ 814 }},
				{"M�nh Thanh T�m H��ng Thi�n Ch�u (3/6) /6)",0.00001,{ 815 }},
				{"M�nh Thanh T�m H��ng Thi�n Ch�u (4/6) /6)",0.00001,{ 816 }},
				{"M�nh Thanh T�m H��ng Thi�n Ch�u (5/6) /6)",0.00001,{ 817 }},
				{"M�nh Thanh T�m H��ng Thi�n Ch�u (6/6) /6)",0.00001,{ 818 }},
				{"M�nh B�ch H�i H�ng Linh Ba (1/6) /6)",0.00001,{ 819 }},
				{"M�nh B�ch H�i H�ng Linh Ba (2/6) /6)",0.00001,{ 820 }},
				{"M�nh B�ch H�i H�ng Linh Ba (3/6) /6)",0.00001,{ 821 }},
				{"M�nh B�ch H�i H�ng Linh Ba (4/6) /6)",0.00001,{ 822 }},
				{"M�nh B�ch H�i H�ng Linh Ba (5/6) /6)",0.00001,{ 823 }},
				{"M�nh B�ch H�i H�ng Linh Ba (6/6) /6)",0.00001,{ 824 }},
				{"M�nh U Lung Kim X� Ph�t ��i (1/6) /6)",0.00001,{ 825 }},
				{"M�nh U Lung Kim X� Ph�t ��i (2/6) /6)",0.00001,{ 826 }},
				{"M�nh U Lung Kim X� Ph�t ��i (3/6) /6)",0.00001,{ 827 }},
				{"M�nh U Lung Kim X� Ph�t ��i (4/6) /6)",0.00001,{ 828 }},
				{"M�nh U Lung Kim X� Ph�t ��i (5/6) /6)",0.00001,{ 829 }},
				{"M�nh U Lung Kim X� Ph�t ��i (6/6) /6)",0.00001,{ 830 }},
				{"M�nh U Lung M�c Th� Nhuy�n L� (1/6) /6)",0.00001,{ 831 }},
				{"M�nh U Lung M�c Th� Nhuy�n L� (2/6) /6)",0.00001,{ 832 }},
				{"M�nh U Lung M�c Th� Nhuy�n L� (3/6) /6)",0.00001,{ 833 }},
				{"M�nh U Lung M�c Th� Nhuy�n L� (4/6) /6)",0.00001,{ 834 }},
				{"M�nh U Lung M�c Th� Nhuy�n L� (5/6) /6)",0.00001,{ 835 }},
				{"M�nh U Lung M�c Th� Nhuy�n L� (6/6) /6)",0.00001,{ 836 }},
				{"M�nh Ch� Ph��c Di�t L�i C�nh Ph� (1/6) /6)",0.00001,{ 837 }},
				{"M�nh Ch� Ph��c Di�t L�i C�nh Ph� (2/6) /6)",0.00001,{ 838 }},
				{"M�nh Ch� Ph��c Di�t L�i C�nh Ph� (3/6) /6)",0.00001,{ 839 }},
				{"M�nh Ch� Ph��c Di�t L�i C�nh Ph� (4/6) /6)",0.00001,{ 840 }},
				{"M�nh Ch� Ph��c Di�t L�i C�nh Ph� (5/6) /6)",0.00001,{ 841 }},
				{"M�nh Ch� Ph��c Di�t L�i C�nh Ph� (6/6) /6)",0.00001,{ 842 }},
				{"M�nh ��a Ph�ch H�c Di�m Xung Thi�n Li�n (1/6) /6)",0.00001,{ 843 }},
				{"M�nh ��a Ph�ch H�c Di�m Xung Thi�n Li�n (2/6) /6)",0.00001,{ 844 }},
				{"M�nh ��a Ph�ch H�c Di�m Xung Thi�n Li�n (3/6) /6)",0.00001,{ 845 }},
				{"M�nh ��a Ph�ch H�c Di�m Xung Thi�n Li�n (4/6) /6)",0.00001,{ 846 }},
				{"M�nh ��a Ph�ch H�c Di�m Xung Thi�n Li�n (5/6) /6)",0.00001,{ 847 }},
				{"M�nh ��a Ph�ch H�c Di�m Xung Thi�n Li�n (6/6) /6)",0.00001,{ 848 }},
				{"M�nh ��ng C�u Gi�ng Long C�i Y (1/6) /6)",0.00001,{ 849 }},
				{"M�nh ��ng C�u Gi�ng Long C�i Y (2/6) /6)",0.00001,{ 850 }},
				{"M�nh ��ng C�u Gi�ng Long C�i Y (3/6) /6)",0.00001,{ 851 }},
				{"M�nh ��ng C�u Gi�ng Long C�i Y (4/6) /6)",0.00001,{ 852 }},
				{"M�nh ��ng C�u Gi�ng Long C�i Y (5/6) /6)",0.00001,{ 853 }},
				{"M�nh ��ng C�u Gi�ng Long C�i Y (6/6) /6)",0.00001,{ 854 }},
				{"M�nh ��ng C�u Kh�ng Long H� Uy�n (1/6) /6)",0.00001,{ 855 }},
				{"M�nh ��ng C�u Kh�ng Long H� Uy�n (2/6) /6)",0.00001,{ 856 }},
				{"M�nh ��ng C�u Kh�ng Long H� Uy�n (3/6) /6)",0.00001,{ 857 }},
				{"M�nh ��ng C�u Kh�ng Long H� Uy�n (4/6) /6)",0.00001,{ 858 }},
				{"M�nh ��ng C�u Kh�ng Long H� Uy�n (5/6) /6)",0.00001,{ 859 }},
				{"M�nh ��ng C�u Kh�ng Long H� Uy�n (6/6) /6)",0.00001,{ 860 }},
				{"M�nh Ma Ho�ng Kim Gi�p Kh�i (1/6) /6)",0.00001,{ 861 }},
				{"M�nh Ma Ho�ng Kim Gi�p Kh�i (2/6) /6)",0.00001,{ 862 }},
				{"M�nh Ma Ho�ng Kim Gi�p Kh�i (3/6) /6)",0.00001,{ 863 }},
				{"M�nh Ma Ho�ng Kim Gi�p Kh�i (4/6) /6)",0.00001,{ 864 }},
				{"M�nh Ma Ho�ng Kim Gi�p Kh�i (5/6) /6)",0.00001,{ 865 }},
				{"M�nh Ma Ho�ng Kim Gi�p Kh�i (6/6) /6)",0.00001,{ 866 }},
				{"M�nh Ma Ho�ng �n Xu�t H� H�ng Khuy�n (1/6) /6)",0.00001,{ 867 }},
				{"M�nh Ma Ho�ng �n Xu�t H� H�ng Khuy�n (2/6) /6)",0.00001,{ 868 }},
				{"M�nh Ma Ho�ng �n Xu�t H� H�ng Khuy�n (3/6) /6)",0.00001,{ 869 }},
				{"M�nh Ma Ho�ng �n Xu�t H� H�ng Khuy�n (4/6) /6)",0.00001,{ 870 }},
				{"M�nh Ma Ho�ng �n Xu�t H� H�ng Khuy�n (5/6) /6)",0.00001,{ 871 }},
				{"M�nh Ma Ho�ng �n Xu�t H� H�ng Khuy�n (6/6) /6)",0.00001,{ 872 }},
				{"M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)",0.00001,{ 873 }},
				{"M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)",0.00001,{ 874 }},
				{"M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)",0.00001,{ 875 }},
				{"M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)",0.00001,{ 876 }},
				{"M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)",0.00001,{ 877 }},
				{"M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)",0.00001,{ 878 }},
				{"M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (1/6) /6)",0.00001,{ 879 }},
				{"M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (2/6) /6)",0.00001,{ 880 }},
				{"M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (3/6) /6)",0.00001,{ 881 }},
				{"M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (4/6) /6)",0.00001,{ 882 }},
				{"M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (5/6) /6)",0.00001,{ 883 }},
				{"M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (6/6) /6)",0.00001,{ 884 }},
				{"M�nh C�p Phong Tam Thanh Ph� (1/6) /6)",0.00001,{ 885 }},
				{"M�nh C�p Phong Tam Thanh Ph� (2/6) /6)",0.00001,{ 886 }},
				{"M�nh C�p Phong Tam Thanh Ph� (3/6) /6)",0.00001,{ 887 }},
				{"M�nh C�p Phong Tam Thanh Ph� (4/6) /6)",0.00001,{ 888 }},
				{"M�nh C�p Phong Tam Thanh Ph� (5/6) /6)",0.00001,{ 889 }},
				{"M�nh C�p Phong Tam Thanh Ph� (6/6) /6)",0.00001,{ 890 }},
				{"M�nh L�i Khung Thi�n ��a H� ph� (1/6) /6)",0.00001,{ 891 }},
				{"M�nh L�i Khung Thi�n ��a H� ph� (2/6) /6)",0.00001,{ 892 }},
				{"M�nh L�i Khung Thi�n ��a H� ph� (3/6) /6)",0.00001,{ 893 }},
				{"M�nh L�i Khung Thi�n ��a H� ph� (4/6) /6)",0.00001,{ 894 }},
				{"M�nh L�i Khung Thi�n ��a H� ph� (5/6) /6)",0.00001,{ 895 }},
				{"M�nh L�i Khung Thi�n ��a H� ph� (6/6) /6)",0.00001,{ 896 }},
				{"M�nh V� �o B�c Minh ��o Qu�n (1/6) /6)",0.00001,{ 897 }},
				{"M�nh V� �o B�c Minh ��o Qu�n (2/6) /6)",0.00001,{ 898 }},
				{"M�nh V� �o B�c Minh ��o Qu�n (3/6) /6)",0.00001,{ 899 }},
				{"M�nh V� �o B�c Minh ��o Qu�n (4/6) /6)",0.00001,{ 900 }},
				{"M�nh V� �o B�c Minh ��o Qu�n (5/6) /6)",0.00001,{ 901 }},
				{"M�nh V� �o B�c Minh ��o Qu�n (6/6) /6)",0.00001,{ 902 }},
				{"M�nh trang b� B�c Kinh chi M�ng (1/9) /9)",0.000002,{ 540 }},
				{"M�nh trang b� B�c Kinh chi M�ng (2/9) /9)",0.000002,{ 541 }},
				{"M�nh trang b� B�c Kinh chi M�ng (3/9) /9)",0.000002,{ 542 }},
				{"M�nh trang b� B�c Kinh chi M�ng (4/9) /9)",0.000002,{ 543 }},
				{"M�nh trang b� B�c Kinh chi M�ng (5/9) /9)",0.000002,{ 544 }},
				{"M�nh trang b� B�c Kinh chi M�ng (6/9) /9)",0.000002,{ 545 }},
				{"M�nh trang b� B�c Kinh chi M�ng (7/9) /9)",0.000002,{ 546 }},
				{"M�nh trang b� B�c Kinh chi M�ng (8/9) /9)",0.000002,{ 547 }},
				{"M�nh trang b� B�c Kinh chi M�ng (9/9) /9)",0.000002,{ 548 }},
				{"M�nh Ng� S�c Ng�c B�i (1/9) /9)",0.000002,{ 549 }},
				{"M�nh Ng� S�c Ng�c B�i (2/9) /9)",0.000002,{ 550 }},
				{"M�nh Ng� S�c Ng�c B�i (3/9) /9)",0.000002,{ 551 }},
				{"M�nh Ng� S�c Ng�c B�i (4/9) /9)",0.000002,{ 552 }},
				{"M�nh Ng� S�c Ng�c B�i (5/9) /9)",0.000002,{ 553 }},
				{"M�nh Ng� S�c Ng�c B�i (6/9) /9)",0.000002,{ 554 }},
				{"M�nh Ng� S�c Ng�c B�i (7/9) /9)",0.000002,{ 555 }},
				{"M�nh Ng� S�c Ng�c B�i (8/9) /9)",0.000002,{ 556 }},
				{"M�nh Ng� S�c Ng�c B�i (9/9) /9)",0.000002,{ 557 }},
				{"M�nh Nh� �i�n Chi H�n (1/9) /9)",0.000002,{ 558 }},
				{"M�nh Nh� �i�n Chi H�n (2/9) /9)",0.000002,{ 559 }},
				{"M�nh Nh� �i�n Chi H�n (3/9) /9)",0.000002,{ 560 }},
				{"M�nh Nh� �i�n Chi H�n (4/9) /9)",0.000002,{ 561 }},
				{"M�nh Nh� �i�n Chi H�n (5/9) /9)",0.000002,{ 562 }},
				{"M�nh Nh� �i�n Chi H�n (6/9) /9)",0.000002,{ 563 }},
				{"M�nh Nh� �i�n Chi H�n (7/9) /9)",0.000002,{ 564 }},
				{"M�nh Nh� �i�n Chi H�n (8/9) /9)",0.000002,{ 565 }},
				{"M�nh Nh� �i�n Chi H�n (9/9) /9)",0.000002,{ 566 }},
				{"M�nh B�n L�i To�n Long th��ng (1/9) /9)",0.000004,{ 567 }},
				{"M�nh B�n L�i To�n Long th��ng (2/9) /9)",0.000004,{ 568 }},
				{"M�nh B�n L�i To�n Long th��ng (3/9) /9)",0.000004,{ 569 }},
				{"M�nh B�n L�i To�n Long th��ng (4/9) /9)",0.000004,{ 570 }},
				{"M�nh B�n L�i To�n Long th��ng (5/9) /9)",0.000004,{ 571 }},
				{"M�nh B�n L�i To�n Long th��ng (6/9) /9)",0.000004,{ 572 }},
				{"M�nh B�n L�i To�n Long th��ng (7/9) /9)",0.000004,{ 573 }},
				{"M�nh B�n L�i To�n Long th��ng (8/9) /9)",0.000004,{ 574 }},
				{"M�nh B�n L�i To�n Long th��ng (9/9) /9)",0.000004,{ 575 }},
				{"M�nh Ph�c Ma T� Kim C�n (1/9) /9)",0.00001,{ 576 }},
				{"M�nh Ph�c Ma T� Kim C�n (2/9) /9)",0.00001,{ 577 }},
				{"M�nh Ph�c Ma T� Kim C�n (3/9) /9)",0.00001,{ 578 }},
				{"M�nh Ph�c Ma T� Kim C�n (4/9) /9)",0.00001,{ 579 }},
				{"M�nh Ph�c Ma T� Kim C�n (5/9) /9)",0.00001,{ 580 }},
				{"M�nh Ph�c Ma T� Kim C�n (6/9) /9)",0.00001,{ 581 }},
				{"M�nh Ph�c Ma T� Kim C�n (7/9) /9)",0.00001,{ 582 }},
				{"M�nh Ph�c Ma T� Kim C�n (8/9) /9)",0.00001,{ 583 }},
				{"M�nh Ph�c Ma T� Kim C�n (9/9) /9)",0.00001,{ 584 }},
				{"M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (1/9) /9)",0.00001,{ 585 }},
				{"M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (2/9) /9)",0.00001,{ 586 }},
				{"M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (3/9) /9)",0.00001,{ 587 }},
				{"M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (4/9) /9)",0.00001,{ 588 }},
				{"M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (5/9) /9)",0.00001,{ 589 }},
				{"M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (6/9) /9)",0.00001,{ 590 }},
				{"M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (7/9) /9)",0.00001,{ 591 }},
				{"M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (8/9) /9)",0.00001,{ 592 }},
				{"M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (9/9) /9)",0.00001,{ 593 }},
				{"M�nh ��i Nh�n Th�n Ch�y (1/9) /9)",0.000004,{ 594 }},
				{"M�nh ��i Nh�n Th�n Ch�y (2/9) /9)",0.000004,{ 595 }},
				{"M�nh ��i Nh�n Th�n Ch�y (3/9) /9)",0.000004,{ 596 }},
				{"M�nh ��i Nh�n Th�n Ch�y (4/9) /9)",0.000004,{ 597 }},
				{"M�nh ��i Nh�n Th�n Ch�y (5/9) /9)",0.000004,{ 598 }},
				{"M�nh ��i Nh�n Th�n Ch�y (6/9) /9)",0.000004,{ 599 }},
				{"M�nh ��i Nh�n Th�n Ch�y (7/9) /9)",0.000004,{ 600 }},
				{"M�nh ��i Nh�n Th�n Ch�y (8/9) /9)",0.000004,{ 601 }},
				{"M�nh ��i Nh�n Th�n Ch�y (9/9) /9)",0.000004,{ 602 }},
				{"M�nh B�n L�i To�n Long Th��ng (1/9) /9)",0.000004,{ 603 }},
				{"M�nh B�n L�i To�n Long Th��ng (2/9) /9)",0.000004,{ 604 }},
				{"M�nh B�n L�i To�n Long Th��ng (3/9) /9)",0.000004,{ 605 }},
				{"M�nh B�n L�i To�n Long Th��ng (4/9) /9)",0.000004,{ 606 }},
				{"M�nh B�n L�i To�n Long Th��ng (5/9) /9)",0.000004,{ 607 }},
				{"M�nh B�n L�i To�n Long Th��ng (6/9) /9)",0.000004,{ 608 }},
				{"M�nh B�n L�i To�n Long Th��ng (7/9) /9)",0.000004,{ 609 }},
				{"M�nh B�n L�i To�n Long Th��ng (8/9) /9)",0.000004,{ 610 }},
				{"M�nh B�n L�i To�n Long Th��ng (9/9) /9)",0.000004,{ 611 }},
				{"M�nh L��ng Ng�n B�o �ao (1/9) /9)",0.00001,{ 612 }},
				{"M�nh L��ng Ng�n B�o �ao (2/9) /9)",0.00001,{ 613 }},
				{"M�nh L��ng Ng�n B�o �ao (3/9) /9)",0.00001,{ 614 }},
				{"M�nh L��ng Ng�n B�o �ao (4/9) /9)",0.00001,{ 615 }},
				{"M�nh L��ng Ng�n B�o �ao (5/9) /9)",0.00001,{ 616 }},
				{"M�nh L��ng Ng�n B�o �ao (6/9) /9)",0.00001,{ 617 }},
				{"M�nh L��ng Ng�n B�o �ao (7/9) /9)",0.00001,{ 618 }},
				{"M�nh L��ng Ng�n B�o �ao (8/9) /9)",0.00001,{ 619 }},
				{"M�nh L��ng Ng�n B�o �ao (9/9) /9)",0.00001,{ 620 }},
				{"M�nh V� Gian � Thi�n Ki�m (1/9) /9)",0.00001,{ 621 }},
				{"M�nh V� Gian � Thi�n Ki�m (2/9) /9)",0.00001,{ 622 }},
				{"M�nh V� Gian � Thi�n Ki�m (3/9) /9)",0.00001,{ 623 }},
				{"M�nh V� Gian � Thi�n Ki�m (4/9) /9)",0.00001,{ 624 }},
				{"M�nh V� Gian � Thi�n Ki�m (5/9) /9)",0.00001,{ 625 }},
				{"M�nh V� Gian � Thi�n Ki�m (6/9) /9)",0.00001,{ 626 }},
				{"M�nh V� Gian � Thi�n Ki�m (7/9) /9)",0.00001,{ 627 }},
				{"M�nh V� Gian � Thi�n Ki�m (8/9) /9)",0.00001,{ 628 }},
				{"M�nh V� Gian � Thi�n Ki�m (9/9) /9)",0.00001,{ 629 }},
				{"M�nh T� Ho�ng Ph�ng Ngh�a �ao (1/9) /9)",0.00001,{ 630 }},
				{"M�nh T� Ho�ng Ph�ng Ngh�a �ao (2/9) /9)",0.00001,{ 631 }},
				{"M�nh T� Ho�ng Ph�ng Ngh�a �ao (3/9) /9)",0.00001,{ 632 }},
				{"M�nh T� Ho�ng Ph�ng Ngh�a �ao (4/9) /9)",0.00001,{ 633 }},
				{"M�nh T� Ho�ng Ph�ng Ngh�a �ao (5/9) /9)",0.00001,{ 634 }},
				{"M�nh T� Ho�ng Ph�ng Ngh�a �ao (6/9) /9)",0.00001,{ 635 }},
				{"M�nh T� Ho�ng Ph�ng Ngh�a �ao (7/9) /9)",0.00001,{ 636 }},
				{"M�nh T� Ho�ng Ph�ng Ngh�a �ao (8/9) /9)",0.00001,{ 637 }},
				{"M�nh T� Ho�ng Ph�ng Ngh�a �ao (9/9) /9)",0.00001,{ 638 }},
				{"M�nh B�ch H�i Uy�n ��ng Li�n Ho�n �ao (1/9) /9)",0.00001,{ 639 }},
				{"M�nh B�ch H�i Uy�n ��ng Li�n Ho�n �ao (2/9) /9)",0.00001,{ 640 }},
				{"M�nh B�ch H�i Uy�n ��ng Li�n Ho�n �ao (3/9) /9)",0.00001,{ 641 }},
				{"M�nh B�ch H�i Uy�n ��ng Li�n Ho�n �ao (4/9) /9)",0.00001,{ 642 }},
				{"M�nh B�ch H�i Uy�n ��ng Li�n Ho�n �ao (5/9) /9)",0.00001,{ 643 }},
				{"M�nh B�ch H�i Uy�n ��ng Li�n Ho�n �ao (6/9) /9)",0.00001,{ 644 }},
				{"M�nh B�ch H�i Uy�n ��ng Li�n Ho�n �ao (7/9) /9)",0.00001,{ 645 }},
				{"M�nh B�ch H�i Uy�n ��ng Li�n Ho�n �ao (8/9) /9)",0.00001,{ 646 }},
				{"M�nh B�ch H�i Uy�n ��ng Li�n Ho�n �ao (9/9) /9)",0.00001,{ 647 }},
				{"M�nh Minh �o T� S�t ��c Nh�n (1/9) /9)",0.00001,{ 648 }},
				{"M�nh Minh �o T� S�t ��c Nh�n (2/9) /9)",0.00001,{ 649 }},
				{"M�nh Minh �o T� S�t ��c Nh�n (3/9) /9)",0.00001,{ 650 }},
				{"M�nh Minh �o T� S�t ��c Nh�n (4/9) /9)",0.00001,{ 651 }},
				{"M�nh Minh �o T� S�t ��c Nh�n (5/9) /9)",0.00001,{ 652 }},
				{"M�nh Minh �o T� S�t ��c Nh�n (6/9) /9)",0.00001,{ 653 }},
				{"M�nh Minh �o T� S�t ��c Nh�n (7/9) /9)",0.00001,{ 654 }},
				{"M�nh Minh �o T� S�t ��c Nh�n (8/9) /9)",0.00001,{ 655 }},
				{"M�nh Minh �o T� S�t ��c Nh�n (9/9) /9)",0.00001,{ 656 }},
				{"M�nh Hoa V� M�n Thi�n (1/9) /9)",0.00001,{ 657 }},
				{"M�nh Hoa V� M�n Thi�n (2/9) /9)",0.00001,{ 658 }},
				{"M�nh Hoa V� M�n Thi�n (3/9) /9)",0.00001,{ 659 }},
				{"M�nh Hoa V� M�n Thi�n (4/9) /9)",0.00001,{ 660 }},
				{"M�nh Hoa V� M�n Thi�n (5/9) /9)",0.00001,{ 661 }},
				{"M�nh Hoa V� M�n Thi�n (6/9) /9)",0.00001,{ 662 }},
				{"M�nh Hoa V� M�n Thi�n (7/9) /9)",0.00001,{ 663 }},
				{"M�nh Hoa V� M�n Thi�n (8/9) /9)",0.00001,{ 664 }},
				{"M�nh Hoa V� M�n Thi�n (9/9) /9)",0.00001,{ 665 }},
				{"M�nh Phi Tinh �o�t H�n (1/9) /9)",0.00001,{ 666 }},
				{"M�nh Phi Tinh �o�t H�n (2/9) /9)",0.00001,{ 667 }},
				{"M�nh Phi Tinh �o�t H�n (3/9) /9)",0.00001,{ 668 }},
				{"M�nh Phi Tinh �o�t H�n (4/9) /9)",0.00001,{ 669 }},
				{"M�nh Phi Tinh �o�t H�n (5/9) /9)",0.00001,{ 670 }},
				{"M�nh Phi Tinh �o�t H�n (6/9) /9)",0.00001,{ 671 }},
				{"M�nh Phi Tinh �o�t H�n (7/9) /9)",0.00001,{ 672 }},
				{"M�nh Phi Tinh �o�t H�n (8/9) /9)",0.00001,{ 673 }},
				{"M�nh Phi Tinh �o�t H�n (9/9) /9)",0.00001,{ 674 }},
				{"M�nh L�c Ng�c Tr��ng (1/9) /9)",0.00001,{ 675 }},
				{"M�nh L�c Ng�c Tr��ng (2/9) /9)",0.00001,{ 676 }},
				{"M�nh L�c Ng�c Tr��ng (3/9) /9)",0.00001,{ 677 }},
				{"M�nh L�c Ng�c Tr��ng (4/9) /9)",0.00001,{ 678 }},
				{"M�nh L�c Ng�c Tr��ng (5/9) /9)",0.00001,{ 679 }},
				{"M�nh L�c Ng�c Tr��ng (6/9) /9)",0.00001,{ 680 }},
				{"M�nh L�c Ng�c Tr��ng (7/9) /9)",0.00001,{ 681 }},
				{"M�nh L�c Ng�c Tr��ng (8/9) /9)",0.00001,{ 682 }},
				{"M�nh L�c Ng�c Tr��ng (9/9) /9)",0.00001,{ 683 }},
				{"M�nh U Minh Th��ng (1/9) /9)",0.00001,{ 684 }},
				{"M�nh U Minh Th��ng (2/9) /9)",0.00001,{ 685 }},
				{"M�nh U Minh Th��ng (3/9) /9)",0.00001,{ 686 }},
				{"M�nh U Minh Th��ng (4/9) /9)",0.00001,{ 687 }},
				{"M�nh U Minh Th��ng (5/9) /9)",0.00001,{ 688 }},
				{"M�nh U Minh Th��ng (6/9) /9)",0.00001,{ 689 }},
				{"M�nh U Minh Th��ng (7/9) /9)",0.00001,{ 690 }},
				{"M�nh U Minh Th��ng (8/9) /9)",0.00001,{ 691 }},
				{"M�nh U Minh Th��ng (9/9) /9)",0.00001,{ 692 }},
				{"M�nh Ch�n V� Ki�m (1/9) /9)",0.000004,{ 693 }},
				{"M�nh Ch�n V� Ki�m (2/9) /9)",0.000004,{ 694 }},
				{"M�nh Ch�n V� Ki�m (3/9) /9)",0.000004,{ 695 }},
				{"M�nh Ch�n V� Ki�m (4/9) /9)",0.000004,{ 696 }},
				{"M�nh Ch�n V� Ki�m (5/9) /9)",0.000004,{ 697 }},
				{"M�nh Ch�n V� Ki�m (6/9) /9)",0.000004,{ 698 }},
				{"M�nh Ch�n V� Ki�m (7/9) /9)",0.000004,{ 699 }},
				{"M�nh Ch�n V� Ki�m (8/9) /9)",0.000004,{ 700 }},
				{"M�nh Ch�n V� Ki�m (9/9) /9)",0.000004,{ 701 }},
				{"M�nh Thi�n Ni�n H�n Thi�t (1/9) /9)",0.00001,{ 702 }},
				{"M�nh Thi�n Ni�n H�n Thi�t (2/9) /9)",0.00001,{ 703 }},
				{"M�nh Thi�n Ni�n H�n Thi�t (3/9) /9)",0.00001,{ 704 }},
				{"M�nh Thi�n Ni�n H�n Thi�t (4/9) /9)",0.00001,{ 705 }},
				{"M�nh Thi�n Ni�n H�n Thi�t (5/9) /9)",0.00001,{ 706 }},
				{"M�nh Thi�n Ni�n H�n Thi�t (6/9) /9)",0.00001,{ 707 }},
				{"M�nh Thi�n Ni�n H�n Thi�t (7/9) /9)",0.00001,{ 708 }},
				{"M�nh Thi�n Ni�n H�n Thi�t (8/9) /9)",0.00001,{ 709 }},
				{"M�nh Thi�n Ni�n H�n Thi�t (9/9) /9)",0.00001,{ 710 }},
	}