----------------------------------------------------------------
--FileName:	headinfo.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	��ĩ�������ս��֮�������
--			����1���ͷ�ļ��Զ��峣��
-----------------------------------------------------------------
IncludeLib("FILESYS");


--print(date("%w"))				--��õ�ǰ���������� 1--Monday��2--Tuesday��3--Wednesday��4--Thursday��5--Frieday��6--Saturday��0--Sunday
GV_TSK_CD_OPEN = 35
FIRE_OPENDAY_SATURDAY = 6;		--
FIRE_OPENDAY_SUNDAY = 0;		--
CD_LEVEL_LIMIT = 80		--��Ͳμ��سǵȼ�
TASKID_FIRE_KEY = 1185;--random(1000000);					--ÿ���εĹؼ��֣��ɴ��ж��Ƿ�Ϊ���ִβμӵ����
TASKID_FIRE_DAY = 1186;--tonumber(date("%m%d"));			--���һ��ֻ�ܲμ�һ������ս������¼����
TASKID_FIRE_ADDR = 1187;--����ĵĳ���ID
--1189
FIRE_1RSTNPC_COUNT = 15000;
FIRE_2CNDNPC_COUNT = 2000;
FIRE_3RDNPC_COUNT = 1000;
FIRE_4THNPC_COUNT = 100;
FIRE_5THNPC_COUNT = 10;
tbNPC_COUNT = { 15000, 2000, 1000, 100, 10 }

TNPC_DOCTOR1 = 55;			--�ξ�ҽ��Npcģ��ID��
TNPC_DOCTOR2 = 49;			--���ҽ��Npcģ��ID��
TNPC_DEPOSIT = 625;			--������NPCģ��ID
TNPC_CHEFU = 393;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;

					--�б�	С�ӳ�	����	��	Ԫ˧
tbTNPC_SOLDIER = {	{1067,	1068,	1069,	1070,	1080},	--��
					{1072,	1073,	1074,	1075,	1090}}	--��
tbSOLDIER_NAME = {	"Ti�u hi�u", "��i tr��ng", "Ti�n phong", "Ch� t��ng", "Ch� so�i"	}
tbSOLDIER_LEVEL = {	95, 95, 95, 100, 120 }
tbFILE_NPCDEATH = 
	{
	"\\script\\missions\\citydefence\\npcdeath_1.lua",
	"\\script\\missions\\citydefence\\npcdeath_2.lua",
	"\\script\\missions\\citydefence\\npcdeath_3.lua",
	"\\script\\missions\\citydefence\\npcdeath_4.lua",
	"\\script\\missions\\citydefence\\npcdeath_5.lua",
	"\\script\\missions\\citydefence\\npcdeath_6.lua"
	};
tbDEFENCE_MAPID = { 516, 517 }
tbDEFENCE_SIGNMAP = { 518, 519 }
tbREVIVAL_POS = {
					{1621,3792},
					{1660,3853},
					{1646,3910},
					{1698,3898},
					{1659,3957}
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

FILE_PLAYERDEATH = 		"\\script\\missions\\citydefence\\playerdeath.lua";
FILE_DOCTOR = 			"\\script\\missions\\citydefence\\npc\\cd_doctor.lua";
FILE_BOX = 				"\\script\\missions\\citydefence\\npc\\cd_box.lua";
FILE_DOCTOR1 = 			"\\script\\missions\\citydefence\\npc\\cd_doctor.lua";
FILE_DOCTOR2 = 			"\\script\\missions\\citydefence\\npc\\cd_doctor.lua";
FILE_CENTERTRAP1 = 		"\\script\\missions\\citydefence\\trap\\hometrap1.lua";
FILE_CENTERTRAP2 = 		"\\script\\missions\\citydefence\\trap\\hometrap2.lua";
FILE_CENTERTRAP3 = 		"\\script\\missions\\citydefence\\trap\\hometrap3.lua";
FILE_CD_TRANSER = 		"\\script\\missions\\citydefence\\npc\\cd_transer.lua"
FILE_SYMBOLNPC =		"";

FRAME2TIME = 18;				--18֡��Ϸʱ���൱��1����
MISSIONID = 23;					--mission���
MAX_MEMBERCOUNT = 600;			--���ǵ�ͼ�����������

SMALLTIMERID = 45;				--��ʱ�����
TOTALTIMERID = 46;				--��ʱ�����

SMALL_TIME = 20 * FRAME2TIME;				--ÿ20���ʱһ��
TOTAL_TIME = 150 * 60 * FRAME2TIME;			--150���Ӽ�ʱһ�Σ������
RUNGAME_TIME = 30 * 60 * FRAME2TIME / SMALL_TIME; --����30����֮������
LASTREPORT_TIME = 145 * 60 * FRAME2TIME / SMALL_TIME;	--�س����5����û���ӣ���ʾһ��ʱ��

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

MS_1RSTNPC_CCNT = 11;		--��¼��ǰ10�����ڣ�ɱ���İ׹�����
MS_2CNDNPC_CCNT = 12;		--��¼��ǰ10�����ڣ�ɱ������������
MS_3RDNPC_CCNT = 13;			--��¼��ǰ10�����ڣ�ɱ����ɱ�ּ�������
MS_4THNPC_CCNT = 14;			--��¼��ǰ10�����ڣ�ɱ����СBOSS����
MS_5THNPC_CCNT = 15;			--��¼��ǰ10�����ڣ�ɱ���Ĵ�BOSS����

MS_1RSTNPC_TCNT = 16;		--��¼һ��ɱ���İ׹�����
MS_2CNDNPC_TCNT = 17;		--��¼һ��ɱ������������
MS_3RDNPC_TCNT = 18;		--��¼һ��ɱ����ɱ�ּ�������
MS_4THNPC_TCNT = 19;		--��¼һ��ɱ����СBOSS����
MS_5THNPC_TCNT = 20;		--��¼һ��ɱ���Ĵ�BOSS����

MS_HOMEOUT_X1 = 21;			--Ұ������Ӫ�Ĵ�������X����һ��Trap
MS_HOMEOUT_Y1 = 22;
MS_HOMEOUT_X2 = 23;			--Ұ������Ӫ�Ĵ�������X���ڶ���Trap
MS_HOMEOUT_Y2 = 24;
MS_HOMEOUT_X3 = 25;			--Ұ������Ӫ�Ĵ�������X��������Trap
MS_HOMEOUT_Y3 = 26;

MS_CENTER_X1 = 27;			--��Ӫ��Ұ��Ĵ�������X����һ��Trap
MS_CENTER_Y1 = 28;
MS_CENTER_X2 = 29;			--��Ӫ��Ұ��Ĵ�������X����һ��Trap
MS_CENTER_Y2 = 30;
MS_CENTER_X3 = 31;			--��Ӫ��Ұ��Ĵ�������X����һ��Trap
MS_CENTER_Y3 = 32;

MS_S_CMNPCFILE = 1;			--��¼��ͨ�ֵ���ļ�
MS_S_JRNPCFILE = 2;			--��¼СBOSS������ļ�
MS_S_SRNPCFILE = 3;			--��¼��BOSS������ļ�
MS_S_CD_NAME = 4;			--��ǰ�س�ս�۵�����
