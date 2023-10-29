-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..

IncludeLib("RELAYLADDER")
IncludeLib("FILESYS")
IncludeLib("TITLE");
IncludeLib("SETTING");

-- Message khi gi�t ���c Boss cu�i t�nh n�ng Vi�m �� -Modifiled by AnhHH - 20110725
Include("\\script\\lib\\objbuffer_head.lua")

YDBZ_MISSION_MATCH			= 50		-- ����mission
YDBZ_TIMER_MATCH				= 87		-- ������ʼ��ʱ��
YDBZ_TIMER_FIGHTSTATE 	= 89		-- ������ս��״̬��ʱ��
YDBZ_NPC_BOSS_COUNT			= 1			-- �����boss��������
YDBZ_VARV_STATE 				= 4			-- mission״̬��1��ʾ������2׼���׶Σ�ֹͣ������3��ʼ����
YDBZ_SIGNUP_WORLD				= 5			-- ������ͼ
YDBZ_SIGNUP_POSX				= 6			-- �����ص��X����
YDBZ_SIGNUP_POSY				= 7			-- �����ص��Y���� 
YDBZ_NPC_COUNT					= {8,9,10}		-- ��С��С�ֵ���
YDBZ_NPC_BOSS_COUNT			= 11		-- �����boss
YDBZ_NPC_WAY						= {12,13,14}	-- �ﵽ�Ĺ�
YDBZ_STATE_SIGN					= 15 		--����,YDBZ_STATE_SIGN
YDBZ_TEAM_COUNT					= 16		--�μ�����Ķ�������������
YDBZ_TEAM_SUM						=	17		--�μ�����Ķ�������������
YDBZ_NPC_TYPE						= {
	{20,21,22,23,24,25,26,27,28,29},		--A·��¼��������			
	{30,31,32,33,34,35,36,37,38,39},		--B·��¼��������	
	{40,41,42,43,44,45,46,47,48,49},		--C·��¼��������	
}


YDBZ_TEAM_NAME					= {1,2,3}						--A������	--B������	--C������					

YDBZ_TEAMS_TASKID				=	1851			-- ��¼�������group�������
YDBZ_PLAY_LIMIT_COUNT   = 1852			-- �μӴ���������1������ĵڼ��ܣ�2���� ��3�� ��4����
YDBZ_ITEM_YANDILING			= 1853			-- �׵���ʹ�ñ�����¼,1�׵��� 2��¼��ʱ��Ӫ
YDBZ_MISSIOM_PLAYER_KEY = 1854			-- �׵ۼ�¼������ϵ�key
YDBZ_ITEM_YANDILING_SUM	= 1855			-- �׵���ʹ������
YDBZ_LIMIT_SIGNUP				= 5					-- ��ʼˢ��֮���ʱ�䣺10��
YDBZ_LIMIT_FINISH 			= 30 * 60		-- ����ʱ�����ޣ��룩��30����
YDBZ_LIMIT_BOARDTIME		= 5	* 60		-- ����ʱ��,ÿ5���ӹ���һ��ʱ��
YDBZ_TIME_WAIT_STATE1		= 10				-- ɱ�������boss��ȼ�10���������׶�
YDBZ_TIME_WAIT_STATE3		= 30				-- ���سɹ������󣬵ȴ�30�뱻���ͳ�����
YDBZ_LIMIT_SETFIGHTSTATE= 3					-- ����׶Σ���ұ�ɱ���޵�״̬ʱ��3��
YDBZ_LIMIT_TEAMS_COUNT	= 15				-- �����������������
YDBZ_LIMIT_PLAYER_LEVEL = 120				-- �����͵ȼ�����
YDBZ_LIMIT_WEEK_COUNT		= 10 				-- һ�ܲμ�������
YDBZ_LIMIT_DAY_COUNT		= 4 				-- ÿ��μ�������
YDBZ_PAIHANG_ID					=	10252			--���а�ID
YDBZ_LIMIT_ITEM					= {{6,1,1604},1,"Anh H�ng Thi�p"}	--��Ҫ���Ӣ������tb1��ͼ��ID��tb2����Ҫ����
YDBZ_LIMIT_DOUBEL_ITEM	= {{6,1,1617},1,"Vi�m �� L�nh"}	--�׵���ɻ��˫���Ľ���
YDBZ_AWARD_EXP 					= 600000									--ÿͨ��һ�����ӻ�õľ���
YDBZ_Faninl_AWARD_EXP		=	300000									--�����boss����
YDBZ_KILLPLAYER_EXP 		= 200000									--ɱ��һ�����˻�þ��飨ɱ��ҵþ��飩
YDBZ_KILLLASTBOSS_EXP		= 1000000									--ɱ������boss��þ���
YDBZ_BOAT_POS 					=													--��ұ����ͱ��س���3����x,y���ꡣ
{
	[1]={60032,104832},
	[2]={59744,123296},
	[3]={52960,121952},
}
YDBZ_FIGHTING_RELIFT = 		--������������͵�������㣬���
{
	[1]=
	{
		{57408,112000},
		{57504,112160},
		{57664,112160},
	},
	[2]=
	{
		{58016,114464},
		{57888,114688},
		{58048,114784},
	},
	[3]=
	{
		{56288,112544},
		{56160,112736},
		{56320,112736},
	},
}
-- ������ͼID
YDBZ_MAP_MAP = {
	853,
	854,
	855,
	856,
	857,
	858,
	859,
	860,
	861,
	862,
};

-- Message khi gi�t ���c Boss cu�i t�nh n�ng Vi�m �� -Modifiled by AnhHH - 20110725
local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("Ch�c m�ng cao th� <color=yellow>%s<color> thu�c t� ��i ti�u di�t [L��ng Mi Nhi] �� nh�n ���c ph�n th��ng [%s] " ,GetName(),GetItemName(nItemIndex))
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Tong(nTongId, msg)
	end
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
	Msg2Team(msg)
	Msg2SubWorld(msg)
	AddGlobalNews(msg)
end

--����
YDBZ_ZUANYONG_ITEM =				--ר����Ʒ
{
	[1] = {"H�nh nh�n",6,1,1605}, -- 1�̶�Ϊ����
	[2] = {"Vi�m �� tr��ng m�nh ho�n",	6,	0,	1607}, 
	[3] = {"Vi�m �� gia b�o ho�n",	6,	0,	1608}, 
	[4] = {"Vi�m �� ��i l�c ho�n",	6,	0,	1609}, 
	[5] = {"Vi�m �� cao thi�m ho�n",	6,	0,	1610}, 
	[6] = {"Vi�m �� cao trung ho�n",	6,	0,	1611}, 
	[7] = {"Vi�m �� phi t�c ho�n",	6,	0,	1612}, 
	[8] = {"Vi�m �� b�ng ph�ng ho�n",	6,	0,	1613}, 
	[9] = {"Vi�m �� l�i ph�ng ho�n",	6,	0,	1614}, 
	[10] = {"Vi�m �� h�a ph�ng ho�n",	6,	0,	1615}, 
	[11] = {"Vi�m �� ��c ph�ng ho�n",	6,	0,	1616}, 

}

-- ������Ʒ
YDBZ_tbaward_item ={
	[1]=--С��
	{
	},
	[2]=--С��boss
	{--����%,����,��ƷID,�Ƿ������(0,�����ϣ�1ֱ�������һ����Ա����),����,˫�����Ƿ���Ч
		{50,1,{6,1,1605,1,0,0},1,"H�nh nh�n",1},		--����
		{100,15,{1, 2, 0, 5, 0, 0},0,"Ng� Hoa Ng�c L� Ho�n",0}, --�廨
--		{10,1,{6,1,1606,1,0,0},1,"Vi�m �� �� ��ng",1},			--��Ƭ
--		{10,1,{6,0,1591,1,0,0},1,"�׵۱���ר�ó�����",0},
--		{10,1,{6,0,1592,1,0,0},1,"�׵۱���ר�ü�����",0},
--		{10,1,{6,0,1593,1,0,0},1,"�׵۱���ר�ô�����",0},
--		{10,1,{6,0,1594,1,0,0},1,"�׵۱���ר�ø�����",0},
--		{10,1,{6,0,1595,1,0,0},1,"�׵۱���ר�ø�����",0},
--		{10,1,{6,0,1596,1,0,0},1,"�׵۱���ר�÷�����",0},
--		{10,1,{6,0,1597,1,0,0},1,"�׵۱���ר�ñ�����",0},
--		{10,1,{6,0,1598,1,0,0},1,"�׵۱���ר���׷���",0},
--		{10,1,{6,0,1599,1,0,0},1,"�׵۱���ר�û����",0},
--		{10,1,{6,0,1600,1,0,0},1,"�׵۱���ר�ö�����",0},
	},
	[3]=--�����Сboss
	{
		{100,1,{6,1,1605,1,0,0},1,"H�nh nh�n",1},		--����
		{100,30,{1, 2, 0, 5, 0, 0},0,"Ng� Hoa Ng�c L� Ho�n",0},--�廨
--		{30,1,{6,1,1606,1,0,0},1,"Vi�m �� �� ��ng",1}			--��Ƭ
	},
	-- Thay ��i ph�n th��ng Boss cu�i t�nh n�ng Vi�m �� -Modifiled by ThanhLD - 20130417	
	[4]=--����boss
	{	
		-- [1] = {{szName="X�ch L�n L�nh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
		-- [2] = {{szName="M�nh X�ch L�n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
		-- [3] = {{szName="X�ch L�n Kim B�i",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
		-- [4] = {{szName="X�ch L�n Tr�o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
		-- [5] = {{szName="X�ch L�n Gi�c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
		-- [6] = {{szName="X�ch L�n T�nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
		-- [7] = {{szName="B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={2,0,0,0,0,0},CallBack = _Message},},
		-- [8] = {{szName="B�ch H� Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0},CallBack = _Message},},
		-- [9] = {{szName="B�ch H� Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={5,0,0,0,0,0},CallBack = _Message},},
		-- [10] = {{szName="B�ch H� H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={1,0,0,0,0,0},CallBack = _Message},},
		-- [11] = {{szName="B�ch H� Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={9,0,0,0,0,0},CallBack = _Message},},
		-- [12] = {{szName="B�ch H� H�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={8,0,0,0,0,0},CallBack = _Message},},
		-- [13] = {{szName="B�ch H� H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={4,0,0,0,0,0},CallBack = _Message},},
		-- [14] = {{szName="B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={3,0,0,0,0,0},CallBack = _Message},},
		-- [15] = {{szName="B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={10,0,0,0,0,0},CallBack = _Message},},
		-- [16] = {{szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0},CallBack = _Message},},
		-- [17] = {{szName="X�ch L�n Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={2,0,0,0,0,0},CallBack = _Message},},
		-- [18] = {{szName="X�ch L�n Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={6,0,0,0,0,0},CallBack = _Message},},
		-- [19] = {{szName="X�ch L�n Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={5,0,0,0,0,0},CallBack = _Message},},
		-- [20] = {{szName="X�ch L�n H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={1,0,0,0,0,0},CallBack = _Message},},
		-- [21] = {{szName="X�ch L�n Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={9,0,0,0,0,0},CallBack = _Message},},
		-- [22] = {{szName="X�ch L�n H�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={8,0,0,0,0,0},CallBack = _Message},},
		-- [23] = {{szName="X�ch L�n H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={4,0,0,0,0,0},CallBack = _Message},},
		-- [24] = {{szName="X�ch L�n Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={3,0,0,0,0,0},CallBack = _Message},},
		-- [25] = {{szName="X�ch L�n H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={10,0,0,0,0,0},CallBack = _Message},},
		-- [26] = {{szName="X�ch L�n Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={7,0,0,0,0,0},CallBack = _Message},},
		-- [27] = {{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
		-- [28] = {{szName="C�ng Hi�n L� bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
		-- [29] = {{szName="Ki�n Thi�t L� Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
		-- [30] = {{szName="Chi�n B� L� Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
		-- [31] = {{szName="Bao D��c ho�n ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
		-- [32] = {{szName="B�ch H� Tr�ng Luy�n Ng�c",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
		-- [33] = {{szName="M�c B�c Truy�n T�ng L�nh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
		-- [34] = {{szName="V� L�m M�t T�ch",tbProp={6,1,26,1,0,0},nCount=1,nRate=6},},
		-- [35] = {{szName="T�y T�y Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=6},},
		-- [36] = {{szName="Thi�n Linh ��n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
		-- [37] = {{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
		-- [38] = {{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
		-- [39] = {{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},

	},
}

-- 2011.03.23
YDBZ_tbaward_item_ex = 
{
	[1] = {szName="Vi�m �� B� B�o",tbProp={6,1,2805,1,0,0}},		-- �׵��ر�p�д��޸�
}

--
-- NPC����к���
-- NPC�������еĺ��壺��������ID�����֡��ȼ������С��Ƿ�BOSS(0,1)��������λ��
YDBZ_NPC_ATTRIDX_PROCEED		= 1			-- NPC��������
YDBZ_NPC_ATTRIDX_ID			= 2			-- NPC��ID
YDBZ_NPC_ATTRIDX_NAME		= 3			-- NPC����
YDBZ_NPC_ATTRIDX_LEVEL		= 4			-- NPC�ȼ�
YDBZ_NPC_ATTRIDX_SERIES		= 5			-- NPC����
YDBZ_NPC_ATTRIDX_ISBOSS		= 6			-- �Ƿ�BOSS
YDBZ_NPC_ATTRIDX_COUNT		= 7			-- NPC����
YDBZ_NPC_ATTRIDX_POSITION	= 8			-- NPCλ��
--

YDBZ_SCRIPT_NPC_DEATH 	= "\\script\\missions\\yandibaozang\\npc_death.lua"
YDBZ_SCRIPT_PLAYER_DEATH = "\\script\\missions\\yandibaozang\\player_death.lua"
--
---- ����
YDBZ_map_series = {
	0,	-- ��
	1,	-- ľ
	2,	-- ˮ
	3,	-- ��
	4,	-- ��
};


YDBZ_mapfile_trap =
{
	{"\\settings\\maps\\yandibaozang\\trap\\a","\\script\\missions\\yandibaozang\\trap\\a",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\a"},
	{"\\settings\\maps\\yandibaozang\\trap\\b","\\script\\missions\\yandibaozang\\trap\\b",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\b"},
	{"\\settings\\maps\\yandibaozang\\trap\\c","\\script\\missions\\yandibaozang\\trap\\c",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\c"},
}