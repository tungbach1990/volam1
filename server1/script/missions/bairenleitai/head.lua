-- ====================== �ļ���Ϣ ======================

-- ������Ե������½�� - ������̨ͷ�ļ�
-- �ļ�������head.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2011-04-24 15:08:47

-- ======================================================

tbArena_Info = {
	
	[1] = {
		nIndex = 1,
		InPos = {1784,3099},	-- ����̨����
		OutPos = {
					{1776,3087},
					{1776,3115},
					{1796,3086},
					{1796,3116},
				},	-- ����̨����
		NpcPos = {1789,3103},	-- ��̨ˢNPC��
		RevivalPos = {1749, 3135},
	},
	[2] = {
		nIndex = 2,
		InPos = {1744,3061},
		OutPos = {
					{1737,3051},
					{1737,3077},
					{1757,3050},
					{1758,3077},
				},
		NpcPos = {1750,3065},
		RevivalPos = {1749, 3135},
	},
	[3] = {
		nIndex = 3,
		InPos = {1822,3138},
		OutPos = {
					{1816,3125},
					{1814,3153},
					{1836,3127},
					{1835,3153},

		},
		NpcPos = {1828,3142},
		RevivalPos = {1749, 3135},

	},
	[4] = {
		nIndex = 4,
		InPos = {1705,3101},

		OutPos = {
					{1699,3087},
					{1698,3116},
					{1720,3088},
					{1719,3117},

		},
		NpcPos = {1710,3104},
		RevivalPos = {1749, 3135},

	},
	[5] = {
		nIndex = 5,
		InPos = {1781,3178},

		OutPos = {
					{1774,3192},
					{1776,3163},
					{1795,3164},
					{1795,3190},

		},	-- 
		NpcPos = {1788,3181},	-- 
		RevivalPos = {1749, 3135},
	},
};


tbTimerInfo = {
	nApply = 30*18,		-- ������̨���ȴ�ʱ��
	nPrepare = 3*18,		-- ����׼��ʱ��
	nFight = 3*60*18,--3*60*18,	-- ����ʱ��
	nSchedule = 1*60*18,	-- ����ʱ��
	
};

tbTrapFile = {
	szPosFile = "\\settings\\maps\\missions\\bairenleitai\\arena%d.txt",
	szScriptFile = "\\script\\missions\\bairenleitai\\trap_arena.lua",
	
	szBeautyFile = "\\settings\\maps\\missions\\bairenleitai\\drummer.txt",
	szObstacleFile = "\\settings\\maps\\missions\\bairenleitai\\obstacle.txt",
	szEnterMapFile = "\\settings\\maps\\missions\\bairenleitai\\inmap.txt",
};

tbNpcFile = {
	szFightNpc = "\\script\\missions\\bairenleitai\\npc_death.lua",
	szTranserNpc = "\\script\\missions\\bairenleitai\\npc_trans.lua",
	szBeautyNpc = "\\script\\missions\\bairenleitai\\npc_beauty.lua",
	szBox = "\\script\\missions\\bairenleitai\\npc_chuwuxiang.lua",
	szDrugstore = "\\script\\missions\\bairenleitai\\npc_store.lua",
	
};

tbNpcTypeList = {--npc������
	[1] = {
			nNpcId = 1786,
			szName = "Cao th� Thi�n V��ng B�ch Nh�n L�i ��i",
			nLevel = 90,
			nSeries = 0,
			nIsboss = 1, --�Ի�npc���Բ���Ҫ���
	},
	[2] = {
			nNpcId = 1787,
			szName = "Cao th� Thi�u L�m B�ch Nh�n L�i ��i",
			nLevel = 90,
			nSeries = 0,
			nIsboss = 1, --�Ի�npc���Բ���Ҫ���
	},
	[3] = {
			nNpcId = 1788,
			szName = "Cao th� Ng� ��c B�ch Nh�n L�i ��i",
			nLevel = 90,
			nSeries = 1,
			nIsboss = 1, --�Ի�npc���Բ���Ҫ���
	},
	[4] = {
			nNpcId = 1789,
			szName = "Cao th� ���ng M�n B�ch Nh�n L�i ��i",
			nLevel = 90,
			nSeries = 1,
			nIsboss = 1, --�Ի�npc���Բ���Ҫ���
	},
	[5] = {
			nNpcId = 1790,
			szName = "Cao th� Nga Mi B�ch Nh�n L�i ��i",
			nLevel = 90,
			nSeries = 2,
			nIsboss = 1, --�Ի�npc���Բ���Ҫ���
	},
	[6] = {
			nNpcId = 1791,
			szName = "Cao th� Th�y Y�n B�ch Nh�n L�i ��i",
			nLevel = 90,
			nSeries = 2,
			nIsboss = 1, --�Ի�npc���Բ���Ҫ���
	},
	[7] = {
			nNpcId = 1792,
			szName = "Cao th� Thi�n Nh�n B�ch Nh�n L�i ��i",
			nLevel = 90,
			nSeries = 3,
			nIsboss = 1, --�Ի�npc���Բ���Ҫ���
	},
	[8] = {
			nNpcId = 1793,
			szName = "Cao th� C�i Bang B�ch Nh�n L�i ��i",
			nLevel = 90,
			nSeries = 3,
			nIsboss = 1, --�Ի�npc���Բ���Ҫ���
	},
	[9] = {
			nNpcId = 1794,
			szName = "Cao th� V� �ang B�ch Nh�n L�i ��i",
			nLevel = 90,
			nSeries = 4,
			nIsboss = 1, --�Ի�npc���Բ���Ҫ���
	},
	[10] = {
			nNpcId = 1795,
			szName = "Cao th� C�n L�n B�ch Nh�n L�i ��i",
			nLevel = 90,
			nSeries = 4,
			nIsboss = 1, --�Ի�npc���Բ���Ҫ���
	},
	[11] = {
			nNpcId = 1571,
			szName = "C� Th�",
			nLevel = 90,
			szScriptPath = tbNpcFile.szBeautyNpc,
			nTime = 15*60,
	},
};

TSK_LEAVERMAPID = 2323	--�洢�뿪�������mapid
TSK_LEAVERPOSX = 2324	--�洢�뿪�������x�����
TSK_LEAVERPOSY = 2325	--�洢�뿪�������y�����

HA_MAXSTAYTIME = 90*60	-- 90�����ͣ��ʱ��
HA_DOUBLETIME = 30*60	-- 30����˫��Ч��
