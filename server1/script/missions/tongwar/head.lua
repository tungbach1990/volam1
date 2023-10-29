Include("\\script\\event\\tongwar\\headinfo.lua")
MISSIONID = 33
FRAME2TIME = 18;	--18֡��Ϸʱ���൱��1����			
TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TIMER_2 = 15* 6 * 60  * FRAME2TIME; -- ��սʱ��Ϊ2Сʱ
RUNGAME_TIME = 30 * 60 * FRAME2TIME / TIMER_1; --����30����֮���Զ�����ս���׶�

MAX_MEMBERCOUNT = 150
MIN_MEMBERCOUNT = 5
TIME_PLAYER_STAY = 120
TONGWAR_MAXDEATH = 10

BONUS_KILLPLAYER = 75
BONUS_MAXSERIESKILL = 150

tbNPCPOS = {"npcpos1", "npcpos2"}
TNPC_DOCTOR1 = 55;--��ҽ��Npcģ��ID��
TNPC_DOCTOR2 = 49;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;
TNPC_DEPOSIT = 625;
	
TNPC_FLAG0 = 626;
TNPC_FLAG1 = 628;
TNPC_FLAG2 = 627;
	
	
tbTONGWAR_SIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}
	
tbTONGWARMAP = {
						{605, 608, 609},
						{606, 610, 611},
						{607, 612, 613},
							}	

----------------Title Value-------------------------------------
	RA_KILL_PL_RANK = {10, 2.334, 0.934, 0.84, 0.56, 0.35}	
 	--7 ���ʿ��	--7/3 ���Уξ	--14/15 ���ͳ��	--21/25 ��Ҹ���	--14/25 ��Ҵ�	--7/20 ���Ԫ˧
 	
 	RANK_PKBONUS = {
 	{1,	6/5,7/5	,8/5,2	},
	{4/5,1,	6/5,7/5,8/5	},
	{3/5,4/5,1,	6/5,7/5	},
	{2/5,3/5,4/5,1,	6/5	},
	{1/5,2/5,3/5,4/5,1},
	};
	
	TAB_SERIESKILL =    --��¼��ͬrank����ң���PKʱ���Ƿ��¼ʵ����ն�ı�1��ʾ��¼��0��ʾ����¼
	{
		{1,1,1,1,1},
		{1,1,1,1,1},
		{1,1,1,1,1},
		{0,1,1,1,1},
		{0,0,1,1,1},
	};
	
	BALANCE_MAMCOUNT = 15
	TAB_RANKBONUS = {0, 1000, 3000, 6000,10000};
	RANK_SKILL = 661;
	TAB_RANKMSG = {
	"B�n ���c phong l� <color=white>Binh S�<color>!",
	"B�n ���c phong l� <color=0xff>Hi�u �y<color>! Sinh l�c t�ng20%",
	"B�n ���c phong l� <color=0xff>Th�ng L�nh<color>! Sinh l�c t�ng 30%, ph�ng th� t�ng 5%",
	"B�n ���c phong l� <color=yellow>Ph� T��ng<color>! Sinh l�c t�ng 40%, ph�ng th� t�ng 10% ",
	"B�n ���c phong l� <color=yellow><bclr=red>��i T��ng<bclr><color>! Sinh l�c t�ng 50%, ph�ng th� t�ng 15%.",
	"B�n ���c phong l� <color=yellow>Nguy�n So�i<color=>!"}
	
	tbRANKNAME={"<color=white>Binh S�<color>", "<color=0xa0ff>Hi�u �y<color>", "<color=0xff>Th�ng L�nh<color>", "<color=yellow>Ph� T��ng<color>", "<color=yellow><bclr=red>��i T��ng<bclr><color>" , "<color=black>Nguy�n So�i<color>"}
	
	TITLE_BONUSRANK1 = 0		--��Ϊ��Ӧͷ���������ֵ
	TITLE_BONUSRANK2 = 10000
	TITLE_BONUSRANK3 = 20000
	TITLE_BONUSRANK4 = 40000
	TITLE_BONUSRANK5 = 60000
	TITLE_BONUSRANK6 = 80000
	
	TITLE_PL2RANK1_N = 400		--��Ӧͷ�ε�����������
	TITLE_PL2RANK2_N = 60
	TITLE_PL2RANK3_N = 25
	TITLE_PL2RANK4_N = 10
	TITLE_PL2RANK5_N = 5
	TITLE_PL2RANK6_N = 1
	
---------------------------------------------------------------

FILE_HOMETRAP1 = "\\script\\missions\\tongwar\\match\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\missions\\tongwar\\match\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\missions\\tongwar\\match\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\missions\\tongwar\\match\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\missions\\tongwar\\match\\homeouttrap2.lua"

FILE_DOCTOR1 = 	"\\script\\missions\\tongwar\\npc\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\missions\\tongwar\\npc\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\missions\\tongwar\\npc\\openbox.lua"
FILE_DEATH = "\\script\\missions\\tongwar\\match\\npcdeath.lua"






