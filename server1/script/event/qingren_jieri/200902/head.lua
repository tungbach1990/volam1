Include("\\script\\lib\\basic.lua");
Include("\\script\\lib\\pay.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\task\\system\\task_string.lua");

VALENTINE2009_START					= 20090213	-- ���ʼ����
VALENTINE2009_END					= 20090215	-- ���������
VALENTINE2009_ITEM_END				= 20090216	-- ��Ʒ��Ч��
VALENTINE2009_MAX_DRAW_NUM			= 9			-- �����ȡ����
VALENTINE2009_MAX_USE_NUM			= 9			-- ���ʹ������
VALENTINE2009_START_TIME			= 200000	-- ���ʼʱ��
VALENTINE2009_END_TIME				= 210000	-- �����ʱ��
VALENTINE2009_LEVEL_LIMIT			= 50		-- �ȼ�����
VALENTINE2009_AWARD_ROSENUM			= 9			-- ������õ����
VALENTINE2009_AWARD_EXP				= 2000000	-- �����ľ���ֵ
VALENTINE2009_AWARD_EXP_LIMIT		= 54000000	-- ���Ľ�������

VALENTINE2009_TIME_GROW_B			= 20*18		-- ��һ�γɳ�ʱ��			
VALENTINE2009_TIME_WATER_START		= 40*18		-- ��ʼ��ˮʱ��
VALENTINE2009_TIME_WATER_END		= 50*18		-- ������ˮʱ��
VALENTINE2009_TIME_GROW_C			= 70*18		-- �ڶ��γɳ�ʱ��
VALENTINE2009_TIME_GROW_D			= 90*18		-- ����ʱ��
VALENTINE2009_TIME_DISAPPEAR		= 120*18	-- ��ʧʱ��

VALENTINE2009_EDITION				= 1552		-- ��汾��
VALENTINE2009_DATE					= 1553		-- �����
VALENTINE2009_DRAW_NUM				= 1560		-- ������ȡ����Ŀ
VALENTINE2009_USE_NUM				= 1561		-- ����ʹ�õ���Ŀ
VALENTINE2009_EXPERIENCE			= 1562		-- �ܹ���õľ���

VALENTINE2009_NPC_NAME_BOY			= 1			-- �к���
VALENTINE2009_NPC_NAME_GIRL			= 2			-- Ů����
VALENTINE2009_NPC_HAS_WATER			= 3			-- �Ƿ��Ѿ���ˮ
VALENTINE2009_NPC_STEP				= 4			-- Ŀǰ���ڵĲ���
VALENTINE2009_NPC_NAME_BOY2			= 5		-- �к���2
VALENTINE2009_NPC_NAME_GIRL2		= 6			-- Ů����2
VALENTINE2009_NPC_STEP_A			= 1			-- ��̬A
VALENTINE2009_NPC_STEP_B			= 2			-- ��̬B
VALENTINE2009_NPC_STEP_WATER_START	= 3			-- ��ʼ��ˮ
VALENTINE2009_NPC_STEP_WATER_END	= 4			-- ������ˮ
VALENTINE2009_NPC_STEP_C			= 5			-- ��̬C
VALENTINE2009_NPC_STEP_D			= 6			-- ��̬D

VALENTINE2009_ITEM_ZHONGZI		= {6, 1, 1927, 1, 0, 0}		-- ��������
VALENTINE2009_ITEM_TIANXIAN		= {6, 1, 1928, 1, 0, 0}		-- ����ˮ
VALENTINE2009_ITEM_ROSE			= {6, 0, 20  , 1, 0, 0}		-- õ�廨
VALENTINE2009_NPC_ID 			= {1252, 1253, 1254, 1255} 	-- NPC��ID
VALENTINE2009_AREA 				= {11,1,37,176,162,78,80,174,121,153,101,99,100,20,53,54,175,55} -- ����ŵĵ�ͼ

VALENTINE2009_TALK_MAIN = 
{
	"<color=green>20:00 ��n 21:00<color> m�i ng�y t� 13-02-2009 ��n 15-02-2009, c�c v� v� l�m nh�n s� nh�n nhi�u nh�t <color=green>9<color> h�t gi�ng t�nh y�u ho�c Thi�n Ti�n Th�y, c�c h� c� mu�n nh�n kh�ng?",
	"Ta mu�n nh�n h�t c�y t�nh nh�n.",
	"Ta mu�n nh�n Thi�n Ti�n Th�y.",
	"Ta ch� ti�n ���ng ��n ch�i.",
}

VALENTINE2009_TALK_GOODS = 
{
	"H�t c�y t�nh nh�n",
	"Thi�n Ti�n Th�y",
	"Hoa H�ng",
}

VALENTINE2009_TALK_TREENAME			= "C�y t�nh nh�n"
VALENTINE2009_TALK_PLANT			= "Tr�ng ���c 1 C�y T�nh Nh�n"
VALENTINE2009_TALK_WATER			= "T��i n��c th�nh c�ng"

VALENTINE2009_TALK_ERROR_ANSWER 	= "Ta �� bi�t r�i. "
VALENTINE2009_TALK_ERROR_SEX		= "Hi�p kh�ch ch� c� th� nh�n h�t c�y t�nh nh�n, n� hi�p ch� c� th� nh�n Thi�n Ti�n Th�y, ng��i ��ng c� nh�n nh�m nh�!"
VALENTINE2009_TALK_ERROR_LEVEL		= "Ch� c� ng��i ch�i c�p 50 tr� l�n m�i c� th� tham gia ho�t ��ng, xin h�y c� g�ng h�n n�a!"
VALENTINE2009_TALK_ERROR_PAY		= "Ch� c� ng��i ch�i �� n�p th� m�i c� th� tham d� ho�t ��ng."
VALENTINE2009_TALK_ERROR_MAXNUM		= "M�i ng�y ch� nh�n nhi�u nh�t 9 l�n, xin h�y ��i ng�y mai r�i nh�n ti�p."
VALENTINE2009_TALK_ERROR_DATE		= "Ch� c� th� nh�n � th�i �i�m ho�t ��ng t� 13-02-2009 ��n 15-02-2009."
VALENTINE2009_TALK_ERROR_TIME		= "Ch� c� th� nh�n t� 20:00 ��n 21:00"
VALENTINE2009_TALK_ERROR_NOTMAN		= "Ch� hi�p kh�ch m�i c� th� s� d�ng h�t c�y t�nh nh�n!"
VALENTINE2009_TALK_ERROR_DIE		= "H�t c�y t�nh nh�n n�y �� � tr�ng th�i kh� h�o r�i."
VALENTINE2009_TALK_ERROR_MAXUSE		= "M�i ng�y ch� c� th� s� d�ng 9 l�n, xin m�i ��i ng�y mai r�i h�y ti�p t�c."
VALENTINE2009_TALK_ERROR_TEAM		= "Ch� c� 1 t� ��i g�m nh�n v�t nam v� n� m�i c� th� s� d�ng!"
VALENTINE2009_TALK_ERROR_AREA 		= "Ch� tr�ng c�y ���c � t�i th�n tr�n v� th�nh th�!"
VALENTINE2009_TALK_ERROR_FIGHT		= "Kh�ng th� tr�ng c�y � tr�ng th�i chi�n ��u!"
VALENTINE2009_TALK_ERROR_ARID		= "B�nh Thi�n Ti�n Th�y �� c�n n��c r�i!"
VALENTINE2009_TALK_ERROR_NOWATER	= "H�nh trang c�a ng��i v�n ch�a c� Thi�n Ti�n Th�y, xin h�y ki�m tra l�i nh�!"
