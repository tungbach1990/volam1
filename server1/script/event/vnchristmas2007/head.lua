xmas2007_findgirl_taskID = 1859		--Ѱ��������Ů�������
xmas2007_findgirl_limit_taskID = 1862		--Ѱ��������Ů����
xmas2007_findgirl_gblvalue_taskID = 1245 --ȫ�ֿ�������
xmas2007_findgirl_exp = 10000000	--Ѱ��������Ů��þ���

tb_xmas2007_findgirl_item = --Ѱ��������Ů����
{
	100000,--�ܸ���
	{0.00625,{0,143},"��ng S�t B�ch Kim �i�u Long Gi�i"},
	{0.00625,{0,144},"��ng S�t B�ch Ng�c C�n Kh�n B�i"},
	{0.00625,{0,145},"��ng S�t B�ch Kim T� Ph�ng Gi�i"},
	{0.00625,{0,146},"��ng S�t Ph� Th�y Ng�c H�ng Khuy�n"},
}

tb_xmas2007_bossmap = 	--�����ͼ�����
{
	[1]=		--����
	{--x,y����(����ʥ����,��ɽ,����)
		{1420, 3275},
		{1800, 3069},
		{1810, 3384},
	},
	[37]=		--��
	{
		{2021,2821},
		{1600,2817},
		{1801,3411},
	},
	[80]=		--����
	{
		{1629, 2868},
		{1549, 3369},
		{1630, 2869},
	},
	[11]=		--�ɶ�
	{
		{2964, 4809},
		{2999, 5258},
		{3339, 5157},
	},
	[78]=		-- ����
	{
		{1719, 3355},
		{1690, 3550},
		{1391, 3052},
	},
	[176]=	-- �ٰ�
	{
		{1231,3348},
		{1203,3059},
		{1130,2693},
	},
	[162]=	-- ����
	{
		{1805,3322},
		{1784,2991},
		{1326,3134},
	},
	[321]=	-- ����ɽ��
	{
		{1019,2698},
		{1195,2759},
		{1321,2492},
		{1431,3011},
		{1540,2290},
		{1450,3133},
	},
	[322]=  -- ����ɽ��
	{
		{1609,4101},
		{1603,3509},
		{1705,3541},
		{1795,4054},
		{1831,3411},
		{1976,3586},
		{2049,3598},
	},
}
tb_xmas_city = 		--�����ͼ
{
	[1] 	= "Ph��ng T��ng",
	[37] 	= "Bi�n Kinh",
	[80]  = "D��ng Ch�u",
	[11]  = "Th�nh ��",
	[78]  = "T��ng D��ng",
	[176] = "L�m An",
	[162]	="��i L�",
	[321]	="Tr��ng B�ch S�n Nam",
	[322]	="Tr��ng B�ch S�n B�c",
}
tb_xmas_girl = 	--������Ů
{
	--bossID,�ȼ�,����(-1Ϊ���)
	{1326,95,-1,"��ng Nhi"},
	{1327,95,-1,"B�ch Nhi"},
	{1328,95,-1,"Tuy�t Nhi"},
}

tb_xmas_boss = 	--�ٻ��ƽ�boss
{
	--bossID,�ȼ�,����(-1Ϊ���)
	{1322,95,-1,"C�y gi�ng sinh th�n b�"},
	{1324,95,-1,"A S�n"},
	{1323,95,-1,"A H�ng"},
}

tbxmas2007_callboss_item =		--�ٻ��ƽ�boss�����
{
	100,--�ܸ���,��������
	--����,{��ƷID},����,����
	{100,{4,239,1},1,"T� Th�y Tinh"},
	{100,{4,240,1},1,"L�c Th�y Tinh"},
	{100,{4,238,1},1,"Lam Th�y Tinh"},
	{100,{4,353,1},6,"Tinh H�ng B�o Th�ch"},
	{100,{6,1,1007},1,"H�t Th�y Tinh"},
	{5,{0,142},1,"��ng s�t b�ch kim �i�u long gi�i"},
	{5,{0,143},1,"��ng s�t b�ch ng�c c�n long b�i"},
	{5,{0,144},1,"��ng s�t b�ch kim t� ph�ng gi�i"},
	{5,{0,145},1,"��ng S�t Ph� Th�y Ng�c H�ng Khuy�n"},
}

function xmas2007_sdl_writeLog(sztitle,szevent)	--��¼,sztitle=�¼���,szevent=�¼�����
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end

function xmas2007_findgirl_returndate()
	local nmin = tonumber(GetLocalDate("%M"))
	local ntasknim = 0
	if nmin >=0 and nmin < 20 then
		ntasknim = 0
	elseif nmin >=20 and nmin < 40 then
		ntasknim = 20
	elseif nmin >=40 and nmin < 60 then
		ntasknim = 40	
	end	
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	local ntaskdate = ndate * 100 + ntasknim
	return ntaskdate
end
