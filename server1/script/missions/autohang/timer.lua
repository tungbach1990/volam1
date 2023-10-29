Include("\\script\\missions\\autohang\\head.lua");

g_nPassTimes = 0;
g_bFreeTime = 0; -- ���ʱ��

function OnTimer()
	do return end
	g_bFreeTime = AEXP_IsFreeTimeDoubleExp();
	
	-- �����Ƿ���ѣ��Լ����鱶��(>=1)
	SetAutoHangFreeFlag(g_bFreeTime, AEXP_FREEDATE_EXPFACTOR);
	
	-- �����߳���汾��OnTimer������
	nRun = TimerFuncForAutoHang();
	
	-- ����������OnTimer����Ϊ����汾(��������ִ����)
	if (nRun > 0) then
		return 1;
	end

	PlayerTab = {};
	pidx = GetFirstPlayerAtSW();
	i = 1;
	while (pidx > 0) do
		PlayerTab[i] = pidx;		
		pidx = GetNextPlayerAtSW();
		i = i + 1;
	end
	
	PCount = getn(PlayerTab);
	
	-- print("��ǰ�һ�������: "..PCount);

	OldPlayer = PlayerIndex;
	-- �������������ң�����������Ʒ - start
	nLockNum = floor(PCount / 100);
	for i = 1, nLockNum do
		nTemp = random(1, PCount);
		PlayerIndex = PlayerTab[nTemp];
		if (g_bFreeTime == 1) then -- ���ʱ��
			AddItemForAutoHang(); -- ������Ʒ
		else
			nPointTime = GetTask(AEXP_TASKID);
			if (nPointTime >= AEXP_TIME_UPDATE) then -- �����˹һ��������㣬�Ͳ��ܵõ�������Ʒ��
				AddItemForAutoHang();
			end	
		end
	end
	-- �������������ң�����������Ʒ - end

	-- ���Ӿ���ֵ - start
	nValidCount = 0; -- ��Ч�һ��������
	nRet = 0;
	for i  = 1, PCount do
		PlayerIndex = PlayerTab[i];
		nRet = AEXP_AddHangExp();
		if (nRet > 0) then
			nValidCount = nValidCount + 1;
		end
	end
	-- ���Ӿ���ֵ - end	
	PlayerIndex = OldPlayer;
	
	-- ͳ���Զ��һ�����
	g_nPassTimes = g_nPassTimes + 1;
	if (g_nPassTimes >= AEXP_STAT_FREQ) then
		CalcAutoHangPlayerCount(SubWorldIdx2ID(), PCount, nValidCount);
		g_nPassTimes = 0;
	end
end;

-- ����ĳ���һ���ҵľ���ֵ
-- �˺�����OnTimerʱ��AutoAddExpForAllPlayers����
function AEXP_AddHangExp()

	nLevel = GetLevel();
	if (nLevel < AEXP_NEEDLEVEL) then
		Msg2Player("<#> C�ng l�c c�a ng��i c�n k�m qu�! ��n"..AEXP_NEEDLEVEL.."<#> c�p tr� l�n h�y quay l�i ��y nh�!");
		return -1;
	end
	
	nExp = 0;
	nPointTime = 0;
	-----------------------
	if (g_bFreeTime == 1) then-- ��Ѽӱ���������
		-- ����Ҫ������
		-- ����ӱ�
		nExp = GetAutoHangExpValue(nLevel);
		nExp = nExp * AEXP_FREEDATE_EXPFACTOR;
	else -- ��ͨ����
		nPointTime = GetTask(AEXP_TASKID);
	
		if (nPointTime == 0) then
			Msg2Player("Ch� c� Ch�o L�p B�t m�i h�p thu ���c tinh hoa c�a ��o n�y, m�i b�n ��n ch� �n S� ��o Hoa mua m�t �t ch�o."); -- Todo
			return -1;	
		elseif (nPointTime < AEXP_TIME_UPDATE) then
			Msg2Player("Hi�u l�c c�a Ch�o L�p B�t s�p h�t h�n, b�n c�n ph�i ��n ch� �n S� ��o Hoa mua th�m m�i c� th� gia t�ng c�ng l�c."); -- Todo
			return -1;
		end
		
		nExp = GetAutoHangExpValue(nLevel);
	end;
	-----------------------
	
	-- ��ʱ�� - start
	szHour = date("%H");
	nHour = tonumber(szHour);
	
	if (nHour < 9) then -- �賿(0~9)
		nExp = floor(nExp * 1.2);
	elseif (nHour < 18) then  -- ����(9~18)
		nExp = nExp;
	elseif (nHour < 24) then  -- ����(18~24)
		nExp = floor(nExp * 0.8);
	end;
	-- ��ʱ�� - end
	
	if (nExp > 0) then
		if (g_bFreeTime == 0) then -- ����ѣ���ʱ��
			SetTask(AEXP_TASKID, nPointTime - AEXP_TIME_UPDATE); -- ��ʱ��
		end
		
		AddOwnExp(nExp); -- �Ӿ���
		Msg2Player("<#> Kinh nghi�m c�a b�n t�ng th�m"..nExp.."<#> �i�m."); -- Todo
	else
		WriteLog(GetLoop()..date("%m%d-%H:%M").."Auto AddExp Error!")
	end

	return 1;
end;
