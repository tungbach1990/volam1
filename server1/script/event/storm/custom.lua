--====��Զ��岿��,һ����GameID��ΪTable�±�====--

STORM_GAMEID_MAX	= 4	--���ܴ��ڵ�GameID���ֵ

TB_STORM_POINT = {}	--���ֱ�

TB_STORM_POINT[1] = {	--�ν���ֱ�
	{	--�̶�����ģʽ
		{60, 16000},
		{50, 10000},
		{40, 5500},
		{30, 4000},
		{20, 2000},
		{10, 500},
		{0, 0}
	}, {--�������ģʽ
		{60, 15000},
		{50, 10000},
		{40, 4500},
		{30, 3000},
		{20, 1500},
		{10, 300},
		{0, 0}
	}, {--Ԫ˧ģʽ
		{60, 14500},
		{50, 10000},
		{40, 4500},
		{30, 2000},
		{20, 500},
		{10, 200},
		{0, 0}
	}, {--ɱ¾ģʽ
		{60, 14000},
		{50, 9000},
		{40, 4000},
		{30, 1500},
		{20, 300},
		{10, 50},
		{0, 0}
	}
}

TB_STORM_POINT[2] = {	--ɱ���������ֱ�
	{60, 1350},
	{59, 1200},
	{50, 950},
	{40, 700},
	{30, 400},
	{20, 200},
	{10, 0},
}

TB_STORM_POINT[3] = {	--��ʹ������ֱ�
	{60, 500},
	{50, 400},
	{40, 300},
	{30, 200},
	{20, 100},
	{10, 30},
	{0, 0}
}

TB_STORM_POINT[4] = {	--Ұ��������ֱ�
	{60, 30000000},
	{55, 18000000},
	{50, 12000000},
	{40, 6000000},
	{30, 3000000},
	{20, 500000},
	{10, 300000},
	{0, 0}
}

--���ֻ����������
TB_STORM_DESCRIBE = {"Chi�n tr��ng T�ng Kim", "s�t th� ", "Nhi�m v� T�n S� ", "Nhi�m v� D� T�u"}

--���ֻ���տ��Խ��еĴ���
TB_STORM_TRYTIMES = {1, 2, 1, 1}

--��ʼ��ս��ĶԻ�
TB_STORM_DIALOG = {
	"  Sau khi khi�u chi�n, ng��i nh�n �i�m t�ch l�y T�ng Kim l�n n�y s� ���c ��i th�nh �i�m t�ch l�y Phong Ba. �i�m t�ch l�y T�ng Kim c�a b�n hi�n t�i l�: <color=yellow>%d<color>",
	"Kh�ng truy h�i nhi�m v� s�t th� ",
	"Nhi�m v� T�n S� ch�a b�t ��u",
	"  Sau khi khi�u chi�n, h� th�ng s� c�n c� trong m�t gi�, s� l��ng ho�n th�nh nhi�m v� v� �� kh� chuy�n ��i th�nh t�ch l�y Phong Ba h�m nay."
}

--����Npc������
TB_STORM_HELP = {
	"  Sau khi chi�n tr��ng T�ng Kim b�t ��u t� ph�t ph�t th� 10, 20, 30, b�n s� nh�n ���c khi�u chi�n Phong Ba qua c�c giai �o�n <color=red> tham gia nh�n th��ng <color>___t�ch l�y Phong Ba, t�ng c�ng <color=yellow>40<color> ph�t. Nh�n ���c <color=red>t�ch l�y T�ng Kim <color>c�ng c� th� ��i ra t�ch l�y Phong Ba (Cao nh�t<color=yellow>60<color>�i�m) .%s<enter>",
	"  Tham gia nhi�m v� s�t th� c� th� nh�n ���c <color=red>ph�n th��ng tham gia <color>___t�ch l�y Phong Ba <color=yellow>40<color> �i�m. Th�nh c�ng x�ng �i <color=red>tr��c th�i gian<color>, c� th� ��i th�nh t�ch l�y Phong Ba (Cao nh�t <color=yellow>60<color> �i�m) . M�i ng�y hai tr�n s�t th�, l�y tr�n <color=red>th�nh t�ch t�t nh�t<color> t�nh t�ch l�y Phong Ba. S�t th� cao c�p m�i ng��i m�i ng�y ch� nh�n ���c cao nh�t <color=yellow>100<color> �i�m t�ch l�y Phong Ba, s�t th� s� c�p cao nh�t nh�n ���c <color=yellow>90<color> �i�m.",
	"Nhi�m v� T�n S� ",
	"  B�t ��u khi�u chi�n Phong Ba l�p t�c nh�n ���c <color=red>ph�n th��ng tham gia <color>___T�ch l�y Phong Ba <color=yellow>40<color> �i�m. ��ng th�i c�n c� theo b�n trong <color=red>v�ng m�t gi� <color> (Th�i gian tr�n m�ng, th�i gian r�i m�ng v�n t�ng kinh nghi�m) , ho�n th�nh nhi�m v� <color=red>s� l��ng v� �� kh�<color>, c� th� nh�n ���c t�ch l�y Phong Ba t��ng �ng (Cao nh�t <color=yellow>60<color> �i�m) . Trong h� th�ng chu�i nhi�m v� D� T�u, m�i ng��i m�i ng�y nh�n ���c t�ch l�y Phong Ba cao nh�t <color=yellow>100<color>�i�m.<enter>"
}

--====Task Value====--
STORM_TASKID_BASE	= 1661-1	--TaskID��ʼֵ
--������Ŀ���Task�����ռ䣬�ݶ�ÿ�����Ҫ7��Task����
TB_STORM_TASKID = {
	{STORM_TASKID_BASE + 21, STORM_TASKID_BASE + 22, STORM_TASKID_BASE + 23, STORM_TASKID_BASE + 24, STORM_TASKID_BASE + 25, STORM_TASKID_BASE + 26, STORM_TASKID_BASE + 45},
	{STORM_TASKID_BASE + 27, STORM_TASKID_BASE + 28, STORM_TASKID_BASE + 29, STORM_TASKID_BASE + 30, STORM_TASKID_BASE + 31, STORM_TASKID_BASE + 32, STORM_TASKID_BASE + 46},
	nil,	--��ʹ������ͣ	{STORM_TASKID_BASE + 33, STORM_TASKID_BASE + 34, STORM_TASKID_BASE + 35, STORM_TASKID_BASE + 36, STORM_TASKID_BASE + 37, STORM_TASKID_BASE + 38},
	{STORM_TASKID_BASE + 39, STORM_TASKID_BASE + 40, STORM_TASKID_BASE + 41, STORM_TASKID_BASE + 42, STORM_TASKID_BASE + 43, STORM_TASKID_BASE + 44, STORM_TASKID_BASE + 47}
}

--====ʱ��/�����жϺ���====--
--���ݲ�ͬgameid��������Ӧ��nowtime
function storm_gettime(gameid)
	if (gameid == 1) then
		return BT_GetGameData(GAME_KEY)
	elseif (gameid == 2) then
		return GetTask(STORM_TASKID_GAMEID_SS)
	elseif (gameid == 3) then
		return GetGameTime()
	elseif (gameid == 4) then
		return 1
	else
		print("error gameid!")
		return nil
	end
end

--�Ƚ� nowtime �� starttime ���ж��Ƿ�����Ϸʱ����
--����1��ʾ�����Լ�¼���֣�����nil��ʾ�Ѿ���ʱ
function storm_gametime(gameid, starttime, nowtime)
	if (gameid == 1) then
		return starttime == nowtime	--ͬһ���ν��ս
	elseif (gameid == 2) then
		return starttime == nowtime	--ͬһ��ɱ������
	elseif (gameid == 3) then
		return nowtime > starttime - 3600	--����ʱû�г���1Сʱ
	elseif (gameid == 4) then
		--return nowtime < starttime + 3600	--ϵͳʱ��û�г���1Сʱ
		return TM_GetRestCount(STORM_TIMERID_YS) ~= nil	--��ʱ��������
	else
		print("error gameid!")
		return nil
	end
end

--====��������====--
--��Ʒ��ʽ��{{��Ʒ���ͣ�������Ʒ������}��{��Ʒ���ͣ�������Ʒ������}��......}
--	��Ʒ���ͣ�	1��AddItem��2��AddGoldItem��3������Ʒ��4�������Ʒ
--	������Ʒ��	��Ʒ���͵Ĳ�ͬ���в�ͬ����͸�ʽ
--		AddItem��		��6�����������飬��ʾAddItem(x1,x2,x3,x4,x5,x6)��6������
--		AddGoldItem��	��2�����������飬��ʾAddGoldItem(x1,x2)��2������
--		����Ʒ��		1��AddOwnExp
--		�����Ʒ��		��ʽͬ��Ʒ��ʽ������ƽ��
--	������	�����AddOwnExp�����ʾ�Ǿ���ֵ

--�շ籩���ֽ���
TB_STORM_AWARD_DAY = {
	--��Ҫ����	��������	��Ʒ
	{300,	"1 vi�n Huy�n Tinh c�p 10 + 3000w kinh nghi�m",	{{1,{6,1,147,10,0,0},1},{3,1,30000000}}},
	{270,	"1 Th�n B� Kho�ng th�ch + 1200w kinh nghi�m",	{{1,{6,1,398,0,0,0},1},	{3,1,12000000}}},
	{240,	"1 vi�n Huy�n Tinh c�p 6 + 800w kinh nghi�m",		{{1,{6,1,147,6,0,0},1},	{3,1,8000000}}},
	{210,	"M�t h�ng bao th�n b� + 500w kinh nghi�m",	{{1,{6,1,402,0,0,0},1},	{3,1,5000000}}},
	{180,	"1 vi�n Huy�n Tinh c�p 5 + 300w kinh nghi�m",		{{1,{6,1,147,5,0,0},1},	{3,1,3000000}}},
	{150,	"Ba Ti�n Th�o l� + 150 kinh nghi�m",		{{1,{6,1,71,0,0,0},3},	{3,1,1500000}}},
	{120,	"Hai Ti�n Th�o l� + 100w kinh nghi�m",		{{1,{6,1,71,0,0,0},2},	{3,1,1000000}}},
	{80,	"1 Ti�n Th�o l� + 50w kinh nghi�m ",		{{1,{6,1,71,0,0,0},1},	{3,1,500000}}}
}

--��ʱ���飺һ�װ���
tmp_ab = {
	{2,{0,164},1},
	{2,{0,165},1},
	{2,{0,166},1},
	{2,{0,167},1}
}
--�ܷ籩��������
TB_STORM_AWARD_WEEK = {
	--��Ҫ������������	��������	��Ʒ
	{-1,	"M�t b� An Bang", 	tmp_ab},
	{-10,	"Nh�n ���c m�t b� An Bang", {{4,tmp_ab,1}}}
}

--��ʱ���飺����+1��ƽ�
tmp_jydhj = {
	{2,{0,4},1},	{2,{0,9},1},	{2,{0,15},1},	{2,{0,19},1},	{2,{0,24},1},
	{2,{0,30},1},	{2,{0,35},1},	{2,{0,38},1},	{2,{0,43},1},	{2,{0,50},1},
	{2,{0,55},1},	{2,{0,59},1},	{2,{0,63},1},	{2,{0,68},1},	{2,{0,74},1},
	{2,{0,80},1},	{2,{0,84},1},	{2,{0,88},1},	{2,{0,95},1},	{2,{0,100},1},
	{2,{0,105},1},	{2,{0,109},1},	{2,{0,113},1},	{2,{0,120},1},	{2,{0,125},1},
	{2,{0,130},1},	{2,{0,135},1},	{2,{0,138},1}
}
--��ʱ���飺��ƽ�
tmp_dhj = {
	{2,{0,2},1},	{2,{0,6},1},	{2,{0,11},1},	{2,{0,16},1},	{2,{0,21},1},
	{2,{0,26},1},	{2,{0,31},1},	{2,{0,39},1},	{2,{0,42},1},	{2,{0,46},1},
	{2,{0,51},1},	{2,{0,60},1},	{2,{0,61},1},	{2,{0,67},1},	{2,{0,71},1},
	{2,{0,76},1},	{2,{0,81},1},	{2,{0,87},1},	{2,{0,92},1},	{2,{0,96},1},
	{2,{0,101},1},	{2,{0,106},1},	{2,{0,115},1},	{2,{0,119},1},	{2,{0,121},1},
	{2,{0,126},1},	{2,{0,132},1},	{2,{0,136},1}
}
--�·籩��������
TB_STORM_AWARD_MONTH = {
	--��Ҫ������������	��������	��Ʒ
	{-1,	"Nh�n ��i M� H� m�t c�p",		{{2,{0,197},1},	{2,{0,202},1}}},
	{-1,	"K� n�ng ng�u nhi�u + 1 Ho�ng Kim",	{{4,tmp_jydhj,1}}},
	{-10,	"Ng�u nhi�n m�t Ho�ng Kim",		{{4,tmp_dhj,1}}}
}

--�����ܱ�
TB_STORM_AWARD = {
	--1��������	2������ʽ	3�Ƿ���ȡ����TaskID		4����TaskID/����LadderID	5������
	{"H�m nay",	0,		STORM_TASKID_DAY_AWARD,		STORM_TASKID_DAY_POINT,		TB_STORM_AWARD_DAY},
	{"Tu�n tr��c",	1,		STORM_TASKID_WEEK_AWARD,	2,							TB_STORM_AWARD_WEEK},
	{"Th�ng tr��c",	1,		STORM_TASKID_MONTH_AWARD,	3,							TB_STORM_AWARD_MONTH},
	{"h�m qua",	0,		STORM_TASKID_DAY_LASTAWARD,	STORM_TASKID_DAY_LASTPOINT,	TB_STORM_AWARD_DAY}
	--������ʽ��	0�������֣�1��������
	--����LadderID����ʱ��2��3�ֱ�������ܡ��ϸ�������
}

