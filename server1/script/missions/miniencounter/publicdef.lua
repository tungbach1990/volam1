IncludeLib("TITLE");
DungeonGlobalData = {};

DungeonGlobalData.BATTLE_NAME						= "Ph� Li Xung ��t Chi�n";			 -- ս������
DungeonGlobalData.MAP_WAIT_TIME					  = 180					  -- ����׼��ʱ�䣺X��
DungeonGlobalData.MAP_FIGHT_TIME					 = 1800;					 -- ��������ʱ�䣺X��
--DungeonGlobalData.MAP_FIGHT_TIME				   = 180;					  -- ��������ʱ�䣺X��
DungeonGlobalData.MAP_WAIT_COUNT_SECOND			  = 10;					   -- ��������ʱ�䣺X��
DungeonGlobalData.MAP_REBORN_TIME					= 3;						-- ��������ʱ�䣺X��
DungeonGlobalData.BLACK_LIST_TIME					= 10;					   -- ������ʱ�䣺X����
DungeonGlobalData.MAP_WIN_SCORE					  = 15;					   -- Ӯ�ñ���Ҫ��ķ���
--DungeonGlobalData.MAP_WIN_SCORE					= 4;						-- Ӯ�ñ���Ҫ��ķ���
DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE		  = 150;					  -- ʤ����Ӫ��ѫ����
DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE		   = 60;					   -- ʧ����Ӫ��ѫ����

DungeonGlobalData.PLAYER_POINTS_TASK_VALUE		   = 3449;					 -- �����ͻս���˻����������
DungeonGlobalData.PLAYER_EXPLOIT_TASK_VALUE		  = 3450;					 -- �����ͻս���˹�ѫ�������
DungeonGlobalData.PLAYER_EXPLOIT_PER_WEEK_TASK_VALUE = 3473;					 -- �����ͻս����ÿ���ܹ�ѫ�������
DungeonGlobalData.PLAYER_WEEK_EXPLOIT_TIME_TASK	  = 3474;					 -- ��¼���һ�λ�ù�ѫ������
DungeonGlobalData.PLAYER_HISTORY_EXPLOIT_TASK_VALUE  = 3452;					 -- �����ͻս������ʷ��ѫ�ܺ��������
DungeonGlobalData.BROKEN_MEDAL_USE_PER_WEEK		  = 3453;					 -- ������ν�ѫ��ÿ��ʹ�ø���
DungeonGlobalData.COMPLETE_MEDAL_USE_PER_WEEK		= 3454;					 -- �������ν�ѫ��ÿ��ʹ�ø���

DungeonGlobalData.PLAYER_LEVEL_LIMIT				 = 120;					  -- 120����ת�����
DungeonGlobalData.MAX_EXPLOIT_VALUE				  = 3500;					 -- ��ѫֵ����

DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR		   = 2;						-- ��shi�м������õķ���

DungeonGlobalData.TASK_SCORE_TOTAL				   = 3457;					 -- ���Ϊ������ȡ������(������Ϣ)
DungeonGlobalData.TASK_KILL_ENEMY_NUM				= 3458;					 -- ���ɱ�������(������Ϣ)
DungeonGlobalData.TASK_KILL_MIDDLE_PILLAR_NUM		= 3459;					 -- ��Ҷ��������(������Ϣ)
DungeonGlobalData.TASK_KILL_ENEMY_PILLAR_NUM		 = 3460;					 -- ���ն��˧����(������Ϣ)
DungeonGlobalData.TASK_GET_ENEMY_BUFF_NUM			= 3461;					 -- ��Ҷ���䱦��(������Ϣ)
DungeonGlobalData.TASK_CUR_KILL_COMBO_NUM			= 3462;					 -- ��ҵ�ǰ��ն��(������Ϣ)
DungeonGlobalData.TASK_CUR_TITLE_INDEX			   = 3463;					 -- ���ս����������(������Ϣ)
DungeonGlobalData.TASK_DEATH_TOTAL_NUM			   = 3464;					 -- �����������(������Ϣ)
DungeonGlobalData.TASK_MAX_KILL_COMBO_NUM			= 3465;					 -- ��������ն��(������Ϣ)
DungeonGlobalData.TASK_PERSONAL_SCORE				= 3466;					 -- ��Ҹ��˻���(������Ϣ)
DungeonGlobalData.TASK_BATTLE_FINISH_TIME			= 3467;					 -- ս��������ʱ��(��ͼ��Ϣ)
DungeonGlobalData.TASK_BATTLE_SONG_NUM			   = 3468;					 -- �η��ڳ�����(��ͼ��Ϣ)
DungeonGlobalData.TASK_BATTLE_JIN_NUM				= 3469;					 -- ���ڳ�����(��ͼ��Ϣ)
DungeonGlobalData.TASK_BATTLE_SONG_SCORE			 = 3470;					 -- �η�����(��ͼ��Ϣ)
DungeonGlobalData.TASK_BATTLE_JIN_SCORE			  = 3471;					 -- �𷽷���(��ͼ��Ϣ)
DungeonGlobalData.TASK_BATTLE_PLAYER_CAMP			= 3472;					 -- �����Ӫ(������Ϣ)

DungeonGlobalData.tbCampName = 
{
	[1] = "T�ng",
	[2] = "Kim",
};

-- �����Լ��ȴ���ʼ�ĺϷ���ͼ
DungeonGlobalData.tbLegalPrepareMapList =
{
	[1]   = " Ph��ng T��ng"  ,
	[11]  = " Th�nh ��"  ,
	[37]  = " Bi�n Kinh"  ,
	[80]  = " D��ng Ch�u"  ,
	[78]  = " T��ng D��ng"  ,
	[162] = " ��i L� "  ,
	[176] = " L�m An"  ,
	[20]  = "Giang T�n Th�n",
	[53]  = "Ba L�ng huy�n",
	[54]  = "Nam Nh�c tr�n",
	[99]  = "V�nh L�c tr�n",
	[100] = "Chu Ti�n tr�n",
	[101] = "��o H��ng th�n",
	[121] = "Long M�n tr�n",
	[153] = "Th�ch C� tr�n",
	[174] = "Long Tuy�n th�n",
	[325] = "�i�m b�o danh T�ng Kim",
};

-- �����ͻս����ʱ��
DungeonGlobalData.tbActivityTime =
{
	[1] = {9, 23},
};

-- ��ս��NPCλ����Ϣ�������䣬ҩ��
DungeonGlobalData.tbNonFightNpcPos = 
{
	[1] = 
	{
		szName	   = "R��ng ch�a ��",
		nPosX		= 52096,
		nPosY		= 109920,
		nNpcId	   = 625,
		szScriptPath = "\\script\\battles\\openbox.lua",
	},	
	[2] = 
	{
		szName	   = "R��ng ch�a ��",
		nPosX		= 59488,
		nPosY		= 99328,
		nNpcId	   = 625,
		szScriptPath = "\\script\\battles\\openbox.lua",
	},
	[3] = 
	{
		szName	   = "Ch� d��c �i�m",
		nPosX		= 51872, 
		nPosY		= 109440,
		nNpcId	   = 203,
		szScriptPath = "\\script\\missions\\arena\\npc\\yaodian.lua",
	},
	[4] = 
	{
		szName	   = "Ch� d��c �i�m",
		nPosX		= 59840, 
		nPosY		= 99712,
		nNpcId	   = 203,
		szScriptPath = "\\script\\missions\\arena\\npc\\yaodian.lua",
	},
};

--DungeonGlobalData.tbBattleReplenishNpc = 
--{
--	[1] = 
--	{
--		szName	   = "ս��������",
--		nPosX		= 49568, 
--		nPosY		= 101376,
--		nNpcId	   = 2068,
--		szScriptPath = "\\script\\missions\\arena\\npc\\yaodian.lua",
--	},
--	[2] = 
--	{
--		szName	   = "ս��������",
--		nPosX		= 50112, 
--		nPosY		= 99040,
--		nNpcId	   = 2068,
--		szScriptPath = "\\script\\missions\\arena\\npc\\yaodian.lua",
--	},
--};

-- ս��NPCλ����Ϣ��ʿ��
DungeonGlobalData.tbFightNpcPos = 
{
	-- �η�ս��NPCλ��
	[1] = 
--	{
--		{1659, 3382}, {1656, 3386}, {1652, 3389}, {1663, 3397}, {1164, 3392}, {1669, 3388}, {1699, 3346}, {1701, 3343},
--		{1704, 3339}, {1706, 3336}, {1704, 3333}, {1701, 3334}, {1760, 3354}, {1755, 3354}, {1757, 3359}, {1755, 3363},
--		{1753, 3361}, {1751, 3359}, {1644, 3296}, {1646, 3299}, {1647, 3302}, {1644, 3304}, {1642, 3302}, {1639, 3302},
--		{1721, 3303}, {1719, 3307}, {1715, 3308}, {1713, 3306}, {1712, 3301}, {1714, 3289}, {1741, 3266}, {1743, 3269},
--		{1745, 3273}, {1741, 3276}, {1738, 3273}, {1735, 3270}, {1669, 3355}, {1670, 3357}, {1673, 3359}, {1674, 3364},
--		{1672, 3365}, {1669, 3368},
--	},
	{
		{1667, 3371}, {1663, 3379}, {1653, 3388}, {1659, 3393}, {1662, 3394}, {1666, 3390}, {1670, 3356}, {1672, 3358}, 
		{1674, 3359}, {1673, 3364}, {1676, 3360}, {1676, 3363}, {1700, 3336}, {1703, 3334}, {1705, 3333}, {1705, 3338},
		{1704, 3339}, {1708, 3334}, {1717, 3304}, {1719, 3306}, {1718, 3309}, {1737, 3263}, {1739, 3265}, {1743, 3268},
		{1746, 3267}, {1746, 3273}, {1739, 3360}, {1766, 3228}, {1768, 3229}, {1769, 3225}, {1778, 3193}, {1779, 3191},
		{1781, 3187}, {1785, 3187}, {1787, 3189}, {1792, 3193}, {1813, 3164}, {1816, 3166}, {1830, 3227}, {1833, 3228},
		{1836, 3226}, {1835, 3216}, {1839, 3218}, {1835, 3213}, {1733, 3193}, {1735, 3184}, {1734, 3188}, {1733, 3195},
	},
	-- ��ս��NPCλ��
	[2] = 
--	{
--		{1835, 3134}, {1837, 3141}, {1841, 3147}, {1836, 3152}, {1838, 3152}, {1825, 3152}, {1806, 3169}, {1808, 3172},
--		{1807, 3177}, {1804, 3175}, {1806, 3182}, {1803, 3180}, {1784, 3199}, {1781, 3200}, {1779, 3198}, {1782, 3190},
--		{1784, 3188}, {1784, 3190}, {1763, 3223}, {1764, 3229}, {1764, 3232}, {1761, 3231}, {1765, 3236}, {1744, 3248},
--		{1746, 3251}, {1748, 3254}, {1747, 3255}, {1750, 3259}, {1744, 3254}, {1728, 3185}, {1731, 3185}, {1730, 3190},
--		{1727, 3189}, {1724, 3191}, {1726, 3195}, {1830, 3219}, {1833, 3221}, {1832, 3224}, {1829, 3225}, {1834, 3226},
--		{1837, 3223}, {1782, 3194}, 
--	},
	{
		{1825, 3145}, {1828, 3141}, {1836, 3139}, {1840, 3145}, {1839, 3151}, {1834, 3152}, {1808, 3168}, {1809, 3172},
		{1808, 3176}, {1806, 3175}, {1802, 3175}, {1806, 3177}, {1790, 3191}, {1791, 3194}, {1790, 3197}, {1782, 3194},
		{1788, 3199}, {1789, 3194}, {1762, 3224}, {1765, 3227}, {1766, 3230}, {1743, 3247}, {1745, 3254}, {1746, 3255},
		{1746, 3260}, {1747, 3265}, {1745, 3267}, {1738, 3265}, {1723, 3299}, {1721, 3305}, {1720, 3308}, {1706, 3327},
		{1707, 3330}, {1707, 3335}, {1707, 3339}, {1707, 3342}, {1709, 3338}, {1672, 3353}, {1675, 3353}, {1641, 3304},
		{1643, 3306}, {1645, 3303}, {1762, 3355}, {1761, 3360}, {1759, 3363}, {1757, 3364}, {1753, 3364}, {1751, 3362},
	},
};

-- ս��NPCλ����Ϣ��ս��
DungeonGlobalData.tbPillarNpcPos = 
{
	-- �η�����Npcλ��
	[1] = 
	{
		{1661, 3389},
	},
	-- ������Npcλ��
	[2] =
	{
		{1835, 3145},
	},
	-- ��������Npcλ��
	[3] =
	{
		{1743, 3264},
	},
};

-- ս��NPC��Ϣ��ʿ��
DungeonGlobalData.tbFightNpcInfo = 
{
	-- �η�ս��NPC��Ϣ
	[1] = 
	{
		[1] = { szName  = "T�ng binh", nLevel  = 100, nNpcId  = 2025, nIsBoss = 0, nRate = 86, },
		[2] = { szName  = "T�ng Hi�u �y", nLevel  = 100, nNpcId  = 2026, nIsBoss = 0, nRate = 8,  },
		[3] = { szName  = "T�ng Th�ng l�nh", nLevel  = 100, nNpcId  = 2027, nIsBoss = 0, nRate = 3,  },
		[4] = { szName  = "T�ng Ph� t��ng", nLevel  = 100, nNpcId  = 2028, nIsBoss = 0, nRate = 2,  },
		[5] = { szName  = "T�ng ��i t��ng", nLevel  = 100, nNpcId  = 2029, nIsBoss = 0, nRate = 1,  },
	},
	-- ��ս��NPC��Ϣ
	[2] = 
	{
		[1] = { szName  = "Kim binh", nLevel  = 100, nNpcId  = 2031, nIsBoss = 0, nRate = 86, },
		[2] = { szName  = "Kim Hi�u �y", nLevel  = 100, nNpcId  = 2032, nIsBoss = 0, nRate = 8,  },
		[3] = { szName  = "Kim Th�ng L�nh", nLevel  = 100, nNpcId  = 2033, nIsBoss = 0, nRate = 3,  },
		[4] = { szName  = "Kim Ph� t��ng", nLevel  = 100, nNpcId  = 2034, nIsBoss = 0, nRate = 2,  },
		[5] = { szName  = "Kim ��i t��ng", nLevel  = 100, nNpcId  = 2035, nIsBoss = 0, nRate = 1,  },
	},
};

DungeonGlobalData.tbSoldierDropBuff = 
{
	["T�ng binh"] = {nRate = 1, nTimes = 1, },
	["Kim binh"] = {nRate = 1, nTimes = 1, },

	["T�ng Hi�u �y"] = {nRate = 10, nTimes = 2, },
	["Kim Hi�u �y"] = {nRate = 10, nTimes = 2, },

	["T�ng Th�ng l�nh"] = {nRate = 30, nTimes = 3, },
	["Kim Th�ng L�nh"] = {nRate = 30, nTimes = 3, },

	["T�ng Ph� t��ng"] = {nRate = 60, nTimes = 4, },
	["Kim Ph� t��ng"] = {nRate = 60, nTimes = 4, },

	["T�ng ��i t��ng"] = {nRate = 100, nTimes = 5, },
	["Kim ��i t��ng"] = {nRate = 100, nTimes = 5, },
};

-- ս��NPC��Ϣ��ս��
DungeonGlobalData.tbPillarNpcInfo = 
{
	-- �η�����Npc��Ϣ
	[1] = 
	{
		[1]  = { szName  = "C� Nguy�n So�i phe T�ng", nLevel  = 100, nNpcId  = 2037, nIsBoss = 1, },   -- ���boss�й⻷
		[2]  = { szName  = "C� Nguy�n So�i phe T�ng", nLevel  = 100, nNpcId  = 2038, nIsBoss = 1, },
		[3]  = { szName  = "C� Nguy�n So�i phe T�ng", nLevel  = 100, nNpcId  = 2039, nIsBoss = 1, },
		[4]  = { szName  = "C� Nguy�n So�i phe T�ng", nLevel  = 100, nNpcId  = 2040, nIsBoss = 1, },
		[5]  = { szName  = "C� Nguy�n So�i phe T�ng", nLevel  = 100, nNpcId  = 2041, nIsBoss = 1, },
		[6]  = { szName  = "C� Nguy�n So�i phe T�ng", nLevel  = 100, nNpcId  = 2042, nIsBoss = 1, },
		[7]  = { szName  = "C� Nguy�n So�i phe T�ng", nLevel  = 100, nNpcId  = 2043, nIsBoss = 1, },
		[8]  = { szName  = "C� Nguy�n So�i phe T�ng", nLevel  = 100, nNpcId  = 2044, nIsBoss = 1, },
		[9]  = { szName  = "C� Nguy�n So�i phe T�ng", nLevel  = 100, nNpcId  = 2045, nIsBoss = 1, },
		[10] = { szName  = "C� Nguy�n So�i phe T�ng", nLevel  = 100, nNpcId  = 2046, nIsBoss = 1, },
	},
	-- ������Npc��Ϣ
	[2] =
	{
		[1]  = { szName  = "C� Nguy�n So�i phe Kim", nLevel  = 100, nNpcId  = 2047, nIsBoss = 1, },
		[2]  = { szName  = "C� Nguy�n So�i phe Kim", nLevel  = 100, nNpcId  = 2048, nIsBoss = 1, },
		[3]  = { szName  = "C� Nguy�n So�i phe Kim", nLevel  = 100, nNpcId  = 2049, nIsBoss = 1, },
		[4]  = { szName  = "C� Nguy�n So�i phe Kim", nLevel  = 100, nNpcId  = 2050, nIsBoss = 1, },
		[5]  = { szName  = "C� Nguy�n So�i phe Kim", nLevel  = 100, nNpcId  = 2051, nIsBoss = 1, },
		[6]  = { szName  = "C� Nguy�n So�i phe Kim", nLevel  = 100, nNpcId  = 2052, nIsBoss = 1, },
		[7]  = { szName  = "C� Nguy�n So�i phe Kim", nLevel  = 100, nNpcId  = 2053, nIsBoss = 1, },
		[8]  = { szName  = "C� Nguy�n So�i phe Kim", nLevel  = 100, nNpcId  = 2054, nIsBoss = 1, },
		[9]  = { szName  = "C� Nguy�n So�i phe Kim", nLevel  = 100, nNpcId  = 2055, nIsBoss = 1, },
		[10] = { szName  = "C� Nguy�n So�i phe Kim", nLevel  = 100, nNpcId  = 2056, nIsBoss = 1, },
	},
	-- ��������Npcλ��
	[3] =
	{
		[1]  = { szName  = "C� R�ng", nLevel  = 100, nNpcId  = 2057, nIsBoss = 1, },
	},
};

-- ս�����˻��ֳƺ���Ϣ
DungeonGlobalData.tbBattleTitle = 
{
	-- �η��ƺ���Ϣ
	[1] = 
	{
		[1] = {"Binh s� phe T�ng", 306},
		[2] = {"Hi�u �y phe T�ng", 307},
		[3] = {"Th�ng l�nh phe T�ng", 308},
		[4] = {"Ph� t��ng phe T�ng", 309},
		[5] = {"��i t��ng phe T�ng", 310},
	},
	-- �𷽳ƺ���Ϣ
	[2] =
	{
		[1] = {"Binh s� phe Kim", 311},
		[2] = {"Hi�u �y phe Kim", 312},
		[3] = {"Th�ng l�nh phe Kim", 313},
		[4] = {"Ph� t��ng phe Kim", 314},
		[5] = {"��i t��ng phe Kim", 315},
	},
};

-- ս�����˻��ֵȼ���Ϣ�����ݳƺ���Ŀ����Ϊ����ȼ�
DungeonGlobalData.tbBattleTitleLvInfo = 
{
	[1] = {0 , 20},
	[2] = {20, 38},
	[3] = {38, 54},
	[4] = {54, 68},
	[5] = {68, -1},
};

-- �кţ�ɱ���ߵĳƺŵȼ�����������ɱ�ߵĳƺŵȼ�
DungeonGlobalData.tbIncreaseScore =
{
	[1] = {2, 4, 6, 8, 10},
	[2] = {0, 2, 4, 6, 8},
	[3] = {0, 0, 2, 4, 6},
	[4] = {0, 0, 1, 2, 4},
	[5] = {0, 0, 0, 1, 2},
};

-- �кţ�ɱ���ߵĳƺŵȼ�����������ɱ�ߵĳƺŵȼ�
DungeonGlobalData.tbDecreaseScore =
{
	[1] = {0, 2, 3, 4, 5},
	[2] = {0, 1, 2, 3, 4},
	[3] = {0, 0, 1, 2, 3},
	[4] = {0, 0, 0, 1, 2},
	[5] = {0, 0, 0, 0, 1},
};

-- �кţ�ɱ���ߵĳƺŵȼ�����������ɱ�ߵĳƺŵȼ�
DungeonGlobalData.tbValidCombo = 
{
	[1] = {1, 1, 1, 1, 1},
	[2] = {0, 1, 1, 1, 1},
	[3] = {0, 0, 1, 1, 1},
	[4] = {0, 0, 0, 1, 1},
	[5] = {0, 0, 0, 0, 1},
};

-- ��ѫ���㹫ʽ��Fn����
DungeonGlobalData.tbFn = 
{
	[1] = -0.1,
	[2] = 0,
	[3] = 0.1,
	[4] = 0.3,
	[5] = 0.5,
};

DungeonGlobalData.tbBuff = 
{
	[1]  = {szName = "T�ng Sinh l�c (%) "	, tbProp = {6, 1, 3534, 1, 0, 0}, nBuffID = 1298, },
	[2]  = {szName = "T�ng N�i l�c (%) "	, tbProp = {6, 1, 3535, 1, 0, 0}, nBuffID = 1299, },
	[3]  = {szName = "Gi�m th� th��ng"			, tbProp = {6, 1, 3536, 1, 0, 0}, nBuffID = 1300, },
	[4]  = {szName = "Gi�m th�i gian tr�ng ��c"			, tbProp = {6, 1, 3537, 1, 0, 0}, nBuffID = 1301, },
	[5]  = {szName = "Gi�m th�i gian tr� ho�n"			, tbProp = {6, 1, 3538, 1, 0, 0}, nBuffID = 1302, },
	[6]  = {szName = "Gi�m th�i gian cho�ng"			, tbProp = {6, 1, 3539, 1, 0, 0}, nBuffID = 1303, },
	[7]  = {szName = "T�ng kh�ng ho�n to�n"			  , tbProp = {6, 1, 3540, 1, 0, 0}, nBuffID = 1304, },
	[8]  = {szName = "N�ng cao gi�i h�n m�u trong c�a b�n th�n", tbProp = {6, 1, 3541, 1, 0, 0}, nBuffID = 1305, },
	[9]  = {szName = "T�ng t�c �� ch�y"				, tbProp = {6, 1, 3542, 1, 0, 0}, nBuffID = 1306, },
	[10] = {szName = "T�ng n� tr�nh"				, tbProp = {6, 1, 3543, 1, 0, 0}, nBuffID = 1307, },
	[11] = {szName = "H�p th�nh k� n�ng c�ng k�ch"		  , tbProp = {6, 1, 3544, 1, 0, 0}, nBuffID = 1310, },
	[12] = {szName = "H�p th�nh k� n�ng c�ng k�ch"		  , tbProp = {6, 1, 3545, 1, 0, 0}, nBuffID = 1310, },
	[13] = {szName = "T�ng t� l� tr�ng k�ch"			, tbProp = {6, 1, 3546, 1, 0, 0}, nBuffID = 1311, },
	[14] = {szName = "T�ng t� l� tr�ng k�ch ��i kh�ng"		, tbProp = {6, 1, 3547, 1, 0, 0}, nBuffID = 1312, },
};

DungeonGlobalData.tbValidWaitMap = 
{
	[1] = {1  , 43 },
	[2] = {45 , 196},
	[3] = {198, 207},
	[4] = {224, 234},
	[5] = {319, 325},
	[6] = {332, 333},
	[7] = {340, 340},
};

DungeonGlobalData.tbGameServerInfo =
{
	[1] = 11,				   -- �ɶ�
	[2] = 162,				  -- ����
	[3] = 80,				   -- ����
	[4] = 78,				   -- ����
	[5] = 1,					-- ����
	[6] = 37,				   -- �꾩
	[7] = 59,				   -- ������
	[8] = 176,				  -- �ٰ�
};

function DungeonGlobalData:BubbleSort(t, func)
	local n = getn(t);
	for i = 1, n do
		for j = 1, n - i do
			if func(t[j], t[j + 1]) then
				t[j + 1], t[j] = t[j], t[j + 1];
			end
		end
	end
end

function DungeonGlobalData:IsInValidWaitMap(nMapId)
	print("[Function Stack] - DungeonGlobalData:IsInValidWaitMap(szRoleName) - publicdef.lua");

	local nValidWaitMapGroupNum = getn(DungeonGlobalData.tbValidWaitMap);
	for i = 1, nValidWaitMapGroupNum do
		local tbValidWaitMapInterval = DungeonGlobalData.tbValidWaitMap[i];
		if nMapId >= tbValidWaitMapInterval[1] and nMapId <= tbValidWaitMapInterval[2] then
			return 1;
		end
	end
	
	return
end

function DungeonGlobalData:CheckPlayerState()
	local nMapId = GetWorldPos()
	if not DungeonGlobalData:IsInValidWaitMap(nMapId) then
		print(">> Debug : player is in invalid map:"..nMapId);
		return nil;
	end

	if ST_GetOffliveState() == 1 or
	   GetOnlineCommissionStatus() == 1 or
	   GetStallState() == 1 then
	   return nil;
	end
	return 1;
end

function DungeonGlobalData:GetFnByTitle(nTitleLv)
	return DungeonGlobalData.tbFn[nTitleLv];
end

function DungeonGlobalData:GetIncreaseScorePoint(nKillerRank, nDeadthRank)
--	print("[Function Stack] - DungeonGlobalData:GetIncreaseScorePoint(nKillerRank, nDeadthRank) - publicdef.lua");
--	print(">> Debug : nKillerRank = "..nKillerRank);
--	print(">> Debug : nDeadthRank = "..nDeadthRank);
	
	if nKillerRank == nil or nDeadthRank == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank] == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank][nDeadthRank] == nil then
		return 0;
	end

	return DungeonGlobalData.tbIncreaseScore[nKillerRank][nDeadthRank];
end

function DungeonGlobalData:GetDecreaseScorePoint(nKillerRank, nDeadthRank)
--	print("[Function Stack] - DungeonGlobalData:GetDecreaseScorePoint(nKillerRank, nDeadthRank) - publicdef.lua");
--	print(">> Debug : nKillerRank = "..nKillerRank);
--	print(">> Debug : nDeadthRank = "..nDeadthRank);
	if nKillerRank == nil or nDeadthRank == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank] == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank][nDeadthRank] == nil then
		return 0;
	end

	return DungeonGlobalData.tbDecreaseScore[nKillerRank][nDeadthRank];
end

function DungeonGlobalData:GetValidCombo(nKillerRank, nDeadthRank)
--	print("[Function Stack] - DungeonGlobalData:GetValidCombo(nKillerRank, nDeadthRank) - publicdef.lua");
--	print(">> Debug : nKillerRank = "..nKillerRank);
--	print(">> Debug : nDeadthRank = "..nDeadthRank);
	if nKillerRank == nil or nDeadthRank == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank] == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank][nDeadthRank] == nil then
		return 0;
	end

	return DungeonGlobalData.tbValidCombo[nKillerRank][nDeadthRank];
end

-- ���ݸ��˻��ֻ�ȡ�ƺŵȼ�
function DungeonGlobalData:ChooseTitleLv(nBattleScore)
	print("[Function Stack] - DungeonGlobalData:ChooseTitleLv(nBattleScore) - publicdef.lua");
	if nBattleScore == nil or nBattleScore < 0 then
		return 1;
	end

	local tbLvInfo = DungeonGlobalData.tbBattleTitleLvInfo;
	local nLvNum   = getn(tbLvInfo);
	for i = 1, nLvNum do
		if i == nLvNum and nBattleScore >= tbLvInfo[i][1] then
			return i;
		end

		if nBattleScore < tbLvInfo[i][2] and nBattleScore >= tbLvInfo[i][1] then
			return i;
		end
	end

	return 1;
end

function DungeonGlobalData:CreatePillarNpc(nMapID)
	print("[Function Stack] - DungeonGlobalData:CreatePillarNpc(nMapID) - publicdef.lua");

	if nMapID == nil or nMapID < 0 then
		print(">> Error : nMapID is invalid!");
		return nil;
	end
	print(">> Debug : nMapID = "..nMapID);

	local nMapIdx = SubWorldID2Idx(nMapID);
	if nMapIdx < 0 then
		print(">> Error : nMapIdx is invalid!");
		return nil;
	end
	print(">> Debug : nMapIdx = "..nMapIdx);

	-- �����η�����npc
	local tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[1];
	local tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[1];

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[1].nNpcId,
		tbNpcInfo[1].nLevel,
		random(0, 4),
		nMapIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[1].szName,
		tbNpcInfo[1].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- ������ʱ��Ӫ
		SetTmpCamp(1, nNpcIdx);
		-- ���������ű�
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_songpillar.lua");
	end

	-- ����������npc
	tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[2];
	tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[2];

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[1].nNpcId,
		tbNpcInfo[1].nLevel,
		random(0, 4),
		nMapIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[1].szName,
		tbNpcInfo[1].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- ������ʱ��Ӫ
		SetTmpCamp(2, nNpcIdx);
		-- ���������ű�
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_jinpillar.lua");
	end

	-- ������������
	tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[3];
	tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[3];

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[1].nNpcId,
		tbNpcInfo[1].nLevel,
		random(0, 4),
		nMapIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[1].szName,
		tbNpcInfo[1].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- ���������ű�
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_middlepillar.lua");
	end

	return 1;
end

function DungeonGlobalData:CreateFightNpc(nMapID)
	print("[Function Stack] - DungeonGlobalData:CreateFightNpc(nMapID) - publicdef.lua");
	print(">> Debug : nMapID = "..nMapID);
	
	local nMapIdx = SubWorldID2Idx(nMapID);
	if nMapIdx < 0 then
		return nil;
	end
	print(">> Debug : nMapIdx = "..nMapIdx);

	-- �����η�npc
	local tbNpcPos  = DungeonGlobalData.tbFightNpcPos[1];
	local tbNpcInfo = DungeonGlobalData.tbFightNpcInfo[1];
	local rtotal = 10000000;
	local i = 1;
	local j = 1;

	for i = 1, getn(tbNpcPos) do
		-- ���
		local rcur  = random(1, rtotal);
		local rstep = 0;

		for j = 1, getn(tbNpcInfo) do
			rstep = rstep + floor(tbNpcInfo[j].nRate * rtotal / 100);
			if(rcur <= rstep) then
				local nNpcIdx = AddNpcEx(
					tbNpcInfo[j].nNpcId,
					tbNpcInfo[j].nLevel,
					random(0, 4),
					nMapIdx,
					tbNpcPos[i][1] * 32,
					tbNpcPos[i][2] * 32,
					1,
					tbNpcInfo[j].szName,
					tbNpcInfo[j].nIsBoss
				);
				
				if nNpcIdx ~= nil and nNpcIdx > 0 then
					-- ������ʱ��Ӫ
					SetTmpCamp(1, nNpcIdx);
					-- ���������ű�
					SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_songsoldier.lua");
				end

				break;
			end
		end
	end

	-- ������npc
	tbNpcPos  = DungeonGlobalData.tbFightNpcPos[2];
	tbNpcInfo = DungeonGlobalData.tbFightNpcInfo[2];

	for i = 1, getn(tbNpcPos) do
		-- ���
		local rcur  = random(1, rtotal);
		local rstep = 0;

		for j = 1, getn(tbNpcInfo) do
			rstep = rstep + floor(tbNpcInfo[j].nRate * rtotal / 100);
			if(rcur <= rstep) then
				local nNpcIdx = AddNpcEx(
					tbNpcInfo[j].nNpcId,
					tbNpcInfo[j].nLevel,
					random(0, 4),
					nMapIdx,
					tbNpcPos[i][1] * 32,
					tbNpcPos[i][2] * 32,
					1,
					tbNpcInfo[j].szName,
					tbNpcInfo[j].nIsBoss
				);
				
				if nNpcIdx ~= nil and nNpcIdx > 0 then
					-- ������ʱ��Ӫ
					SetTmpCamp(2, nNpcIdx);
					-- ���������ű�
					SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_jinsoldier.lua");
				end

				break;
			end
		end
	end

	return 1;
end

function DungeonGlobalData:CheckActivityTime()					  -- ����Ƿ���ս�ۿ���ʱ��
	local nCurTime = tonumber(GetLocalDate("%H"));
	for i = 1, getn(DungeonGlobalData.tbActivityTime) do
		if self.tbActivityTime[i] ~= nil		 and
		   nCurTime <= self.tbActivityTime[i][2] and 
		   nCurTime >= self.tbActivityTime[i][1] then
			return 1;
		end
	end

	return nil;
end

function DungeonGlobalData:CheckLegalPrepareMap(nCurMapID)		  -- ����ս�Ϸ���ͼ
	if nCurMapID == nil then
		return nil;
	end

	if self.tbLegalPrepareMapList[nCurMapID] ~= nil then
		return 1;
	end

	return nil;
end

