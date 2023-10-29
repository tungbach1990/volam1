Include("\\script\\missions\\autohang\\head.lua");

-- ������Ҽ��𣬼��㾭��ֵ
-- �˺�����GameServer����ʱ�Զ����ã����ڽ����һ�������ֵ��
function AEXP_GetHangExpValue(nLevel)	

	nExp = 0;
	-- һСʱ�һ����飺e={3.5w+floor[(lv-50)/5]*0.5w}*1.2
	if (nLevel == 50) then 	-- 50
		nExp = 700; -- ÿ���ӻ�õľ���ֵ
	elseif (nLevel < 100) then 	-- 51~99
		nExp = 700 + floor((nLevel - 50)/5)*100; -- ÿ���ӻ�õľ���ֵ
	else -- 100����100������
		nExp = 1700; -- ÿ���ӻ�õľ���ֵ[700 + floor((100 - 50)/5)*100]
	end
	
	--2007-01-05 �������Ϊԭ����3��
	nExp = nExp * AEXP_FREQ * 3 / 2; -- (10)���ӻ�õľ���ֵ
	
	return nExp;
end;

-- ������Ҽ����Լ��һ�ʱ��(��СʱΪ��λ)����������Ľ�Ǯ
function AEXP_GetNeedMoney(nLevel, nTime)
	nTemp =  60 / AEXP_FREQ; -- һСʱ(60����)�������ξ���
	nMoney = AEXP_GetHangExpValue(nLevel) * nTemp * nTime / 2; -- ����ֵ:������ = 2:1
	return nMoney;
end;

-- �����һ���
-- ����ֵ��1��ʾ�ɹ���0��ʾʧ�ܣ�-1��ʾ��������
function aexp_gotothd(nSubWorldID)
	if (GetCash() < AEXP_TICKET) then
		return -1;
	end
	
	if(GetExtPoint( 0 ) <= 0 ) then
		Say("Xin l�i! Ch� c� n�p th� m�i �i ���c ��o Hoa ��o ",0)
		return -2
	end

	Pay(AEXP_TICKET)
	LeaveTeam(); -- �뿪����
	SetAutoHangMapFlag(1) -- ���ý���һ���ͼ���(���ι��ġ��سǵȹ���)
	
	-- ���˫����ʱ�䣬����У���һ�ʱ��
	if (AEXP_IsFreeTimeDoubleExp() == 0) then-- �����˫��������
		-- ʣ��ʱ��У�� - start
		-- ������뿪�һ���ʱ���������ҩ����Ч����Чʱ���Ի�����
		-- �������ٴν���ʱ��۳��ⲿ�ֹһ�ʱ��
		--06.06.13
		--�������ѱ��ڿ�ʱ���滻������뿪�һ���ʱ�䲻�����ģ�����۳�ʱ��
		--nTime = GetTask(AEXP_OLTIME_TASKID);
		--if (nTime > 0) then
		--	nTime = floor((GetGameTime() - nTime) / 60); -- ��λ������
		--	nPointTime = GetTask(AEXP_TASKID) - nTime;  -- ��ʱ��(��λ������)
		--	if (nPointTime < 0) then
		--		nPointTime = 0;
		--	end
		--	
		--	SetTask(AEXP_TASKID, nPointTime); -- �µ�ʣ��ʱ��
		--end
		-- ʣ��ʱ��У�� - end
	end
	
	NewWorld(nSubWorldID,1523,3237)
	SetFightState(0)
	Msg2Player("B�n �� ��t ch�n v�o m�t th� gi�i ri�ng bi�t. T�i ��y n�ng l�c c�a b�n s� b� �nh h��ng: Kh�ng th� t�n g�u th�nh th�, t�n g�u m�n ph�i, t�n g�u th� gi�i; kh�ng th� s� d�ng Th� ��a ph�, T�m T�m T��ng �nh Ph�; kh�ng th� t� ch�c ��i, kh�ng th� bu�n b�n. ");
	return 1;
end;
