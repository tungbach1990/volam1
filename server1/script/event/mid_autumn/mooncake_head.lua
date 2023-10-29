-- mooncake_head.lua
-- �±��ͷ�ļ�
-- 2005-09-07 by steve

IncludeLib("TIMER")

-- ȫ�ֱ���
GBL_VAR_MOONCAKE_EXCHANGING		 = 801	-- �Ƿ����ڶһ�����
GBL_VAR_MOONCAKE_MARTERIAL_TYPE	 = 802	-- �һ����ϵ����
GBL_VAR_MOONCAKE_MARTERIAL_COUNT = 803	-- �һ����ϵ���Ŀ
GBL_VAR_MOONCAKE_CITY 			 = 804	-- �һ����ϵĳ���
GBL_VAR_MOONCAKE_EXCHANGETIME	 = 805	-- ���ζһ��Ŀ�ʼʱ��

TIMER_MOONCAKE_EXCHANGE			= 47	-- �һ����϶�ʱ��
TIMER_MOONCAKE					= 48	-- �����±���ʱ��
TIMER_MOONCAKE_HINT				= 49	-- ������ȡ�±��Ķ�ʱ��
MISSION_MOONCAKE_EXCHANGE		= 8		-- �һ���������

VARV_MOONCAKE_EXCHANGETIME		= 1566	-- ����ϴζһ����ϵ�ʱ��
VARV_MOONCAKE_EXCHANGECOUNT		= 1567	-- ��Ҷһ����ϵĴ���
VARV_MOONCAKE 					= 1569	-- �±�ʹ�õ�������������������±�������״̬ == �±���� * 1000 + �±�״̬


STAT_MIN				= 1		-- ��С״̬
STAT_PARCHED			= 1		-- �濾��ʱ�Ŀ������±�
STAT_HUOMIAN_PARCHED	= 2		--���桢���� ��ʱ�Ŀ������±�
STAT_HUOMIAN_MAKING 	= 3		-- ���ں���
STAT_HUOMIAN_FINISH 	= 4		-- �������
STAT_BAOXIAN_MAKING 	= 5		-- ���ڰ���
STAT_BAOXIAN_FINISH 	= 6		-- �������
STAT_HONGKAO_MAKING 	= 7		-- ���ں濾
STAT_HONGKAO_FINISH 	= 8		-- �濾���
STAT_MAX				= 8		-- ���״̬

TYPE_MIN				= 1		-- ��С���
TYPE_SHIJIN				= 1		-- ʲ���±�
TYPE_GUOREN				= 2		-- �����±�
TYPE_DANHUANGLIANRONG	= 3		-- ���������±�
TYPE_DANHUANGDOUSHA		= 4		-- ���ƶ�ɳ�±�
TYPE_LIANRONG			= 5		-- �����±�
TYPE_DOUSHA				= 6 	-- ��ɳ�±�
TYPE_MAX				= 6		-- ������

-- �ߴ����
tbl_cities = {
    [1] = "Ph��ng T��ng",
    [11] = "Th�nh ��",
    [37] = "Bi�n Kinh",
    [78] = "T��ng D��ng",
    [80] = "D��ng Ch�u",
    [162] = "��i L�",
    [176] = "L�m An", 
};

-- ��������
tbl_material = {
    {"Tr�ng ",		4,	522},
    {"H�nh nh�n ",	4,	525},
    {"��u ph�ng ",	4,	526},
    {"C�m d�a",	4,	527},
    {"B�t m� ",	4,	520},
    {"���ng c�t",	4,	521},
    {"B�t sen ",	4,	523},
    {"��u xanh",	4,	524},
};

-- �һ���������
tbl_exchange_limitcount = {
	10,		-- ��
	4,		-- ����
	2,		-- ����
	1,		-- Ҭ˿
};

-- �һ���
tbl_exchange = {
   	--��	����	����	Ҭ˿
	{0,		1,		2,		24},	-- ���һ�������Ʒ
	{0,		0,		2,		16},	-- ���ʶһ�������Ʒ
	{0,		0,		0, 		8},		-- �����һ�������Ʒ
	{0,		0,		0,		0},		-- Ҭ˿�һ�������Ʒ
	{50,	75,		150,	1500},	-- ��۶һ�������Ʒ
	{50,	75,		150,	1500},	-- ɰ�Ƕһ�������Ʒ
	{6,		8,		16,		160},	-- ���ضһ�������Ʒ
	{6,		8,		16,		160},	-- ��ɳ�һ�������Ʒ
};

-- ֪ͨ
tbl_notice = {
	[STAT_HUOMIAN_FINISH] = "<#> B�nh c�a ng��i �� <color=yellow>nh�o b�t xong<color>, mau ��n l�y!",		-- �������
	[STAT_BAOXIAN_FINISH] = "<#> B�nh c�a ng��i �� <color=yellow>l�m xong nh�n b�nh<color>, mau ��n l�y!",		-- �������
	[STAT_HONGKAO_FINISH] = "<#> B�nh c�a ng��i �� <color=yellow>n��ng xong <color>, mau ��n l�y!",	-- �濾���
};

-- ��ȡ�ɶһ�ĳ�ֲ��ϵĲ��������б�
function GetExchangeList(typeid)
	-- DEBUG
	print(format("GetExchangeList(%d)", typeid))
	local index = 1
	local result = {}
	for i = 1, getn(tbl_exchange) do
		local count = tbl_exchange[i][typeid]
		if (count ~= 0) then
			result[index] = {i, count}	-- {����, ����}
			index = index + 1
		end
	end
	if (getn(result) == 0) then
		return nil
	else
		return result
	end
end

function cancel()
	-- do nothing
end

-- ����������ȡ�±��Ķ�ʱ��
function start_hint()
	TM_SetTimer(18 * 10, TIMER_MOONCAKE_HINT, 30, 0)
end

-- �ر�������ȡ�±��Ķ�ʱ��
function close_hint()
	TM_StopTimer(TIMER_MOONCAKE_HINT)
end
