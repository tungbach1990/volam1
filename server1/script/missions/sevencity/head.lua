SCRIPT_WARRIORDEATH = "\\script\\missions\\sevencity\\warrior_death.lua"	-- ��������ű�
SCRIPT_MONSTERDEATH	= "\\script\\missions\\sevencity\\monster_death.lua"	-- ���������ű�

FIELD_CHENGDU	= 926	-- �ɶ�ս��
FIELD_BIANJING	= 927	-- �꾩ս��
FIELD_DALI		= 928	-- ����ս��
FIELD_FENGXIANG	= 929	-- ����ս��
FIELD_LINAN 	= 930	-- �ٰ�ս��
FIELD_XIANGYANG	= 931	-- ����ս��
FIELD_YANGZHOU	= 932	-- ����ս��

FIELD_LIST = {
	FIELD_CHENGDU,		-- �ɶ�ս��
	FIELD_BIANJING,		-- �꾩ս��
	FIELD_DALI,			-- ����ս��
	FIELD_FENGXIANG,	-- ����ս��
	FIELD_LINAN,		-- �ٰ�ս��
	FIELD_XIANGYANG,	-- ����ս��
	FIELD_YANGZHOU,		-- ����ս��
}

BATTLE_LIST = {
	[11	] = FIELD_CHENGDU,		-- �ɶ�ս��
	[37	] = FIELD_BIANJING,		-- �꾩ս��
	[162] = FIELD_DALI,			-- ����ս��
	[1	] = FIELD_FENGXIANG,	-- ����ս��
	[176] = FIELD_LINAN,		-- �ٰ�ս��
	[78	] = FIELD_XIANGYANG,	-- ����ս��
	[80	] = FIELD_YANGZHOU,		-- ����ս��
}

PARAM_LIST = {
	FIELD_TONGMEMBER 	= 100, 			-- ÿ������ÿ����������������
	WORLD_TONGMEMBER 	= 200,			-- ������սÿ����������������
	EXPTIMER_INTERVAL	= 1 * 60 * 18,	-- �����齱���ļ����֡����
	TIMEOUT_MONSTER		= 35 * 60 * 18,	-- �����޵�ʱ�䣨֡����
	TIMEOUT_SCORE		= 300 * 18,		-- �������ֽ���ʱ�䣨֡����
}

CAMP_MONSTER 				= 1
SIGNUP_MONEY 				= 20000000
SIGNUP_TIAOZHANLINGCOUNT	= 2000
TIMEAWARD_EXP				= 500000
TIMEAWARD_SCORE				= 1

MAP_INFO = {
	[FIELD_FENGXIANG] = {
		CityIndex = 1,
		CityName = "Ph��ng T��ng",
		Name = "Chi�n tr��ng Ph��ng T��ng",
		OutPos = {1, 1643, 3271},			-- ��ս��λ��
		MonsterPos = {56608, 112416},		-- ��������
		},
	[FIELD_CHENGDU	] = {
		CityIndex = 2,
		CityName = "Th�nh ��",
		Name = "Chi�n tr��ng Th�nh ��",
		OutPos = {11, 3187, 5183},			-- ��ս��λ��
		MonsterPos = {54976, 105600},		-- ��������
		},
	[FIELD_DALI		] = {
		CityIndex = 3,
		CityName = "��i L�",
		Name = "Chi�n tr��ng ��i L�",
		OutPos = {162, 1681, 3277},			-- ��ս��λ��
		MonsterPos = {55040, 105568},		-- ��������
		},
	[FIELD_BIANJING	] = {
		CityIndex = 4,
		CityName = "Bi�n Kinh",
		Name = "Chi�n tr��ng Bi�n Kinh",
		OutPos = {37, 1693, 3213},			-- ��ս��λ��
		MonsterPos = {56192, 108384},		-- ��������
		},
	[FIELD_XIANGYANG] = {
		CityIndex = 5,
		CityName = "T��ng D��ng",
		Name = "Chi�n tr��ng T��ng D��ng",
		OutPos = {78, 1583, 3381},			-- ��ս��λ��
		MonsterPos = {54944, 105568},		-- ��������
		},
	[FIELD_YANGZHOU	] = {
		CityIndex = 6,
		CityName = "D��ng Ch�u",
		Name = "Chi�n tr��ng D��ng Ch�u",
		OutPos = {80, 1693, 3219},			-- ��ս��λ��
		MonsterPos = {55008, 105568},		-- ��������
		},
	[FIELD_LINAN	]= {
		CityIndex = 7,
		CityName = "L�m An",
		Name = "Chi�n tr��ng L�m An",
		OutPos = {176, 1690, 3290},			-- ��ս��λ��
		MonsterPos = {56160, 108512},		-- ��������
		},
}
