-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - սʤ���
-- �ļ�������zhansheng_libao.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-04-14 14:08:44

-- ======================================================

Include("\\script\\lib\\pay.lua");
Include("\\script\\lib\\awardtemplet.lua");
IncludeLib("ITEM")

SONGJIN_LIBAO_TASK_NO = 2619
SONGJIN_LIBAO_LIMIT   = 20


if not TB_QIANQIU_YINGLIE0904 then
	Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\head.lua");
end


function main(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	
--	TB_QIANQIU_YINGLIE0904:reset_task()
	
	if IsCharged() == 0 or GetLevel() < 50 then
		Say("Ch� c� ng��i ch�i c�p tr�n 50 �� n�p th� m�i c� th� s� d�ng.", 0)
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 5) then
		Say(format("�� tr�nh m�t m�t t�i s�n, h�y b�o ��m h�nh trang c�n �� %d � tr�ng.", 5), 0);
		return 1;
	end
	
	local tb_award = {
		{szName = "Khi�u chi�n L� bao", tbProp = {6,1,2006,1,1,0}, nRate = 50},
		{szName = "Th�n b� kho�ng th�ch", tbProp = {6,1,398,1,0,0}, nRate = 0.05},
		{szName = "T� Th�y Tinh", tbProp = {4,239,1,1,1,0}, nRate = 0.2},
		{szName = "L�c Th�y Tinh", tbProp = {4,240,1,1,1,0}, nRate = 0.2},
		{szName = "Lam Th�y Tinh", tbProp = {4,238,1,1,1,0}, nRate = 0.2},
		{szName = "Tinh H�ng B�o Th�ch", tbProp = {4,353,1,1,1,0}, nRate = 0.5},
		{szName = "B�ch Ch�n ��n", tbProp = {6,1,1676,1,0,0}, nRate = 0.03, tbParam = {500000000}},
		{szName = "Huy�t Ch�n ��n", tbProp = {6,1,1677,1,0,0}, nRate = 0.02, tbParam = {1000000000}},
		{szName = "Huy�n Ch�n ��n", tbProp = {6,1,1678,1,0,0}, nRate = 0.01, tbParam = {1500000000}},
		{szName = "An Bang B�ng Tinh Th�ch H�ng Li�n", nQuality=1, tbProp = {0,164}, nRate = 0.01},
		{szName = "An Bang K� Huy�t Th�ch Gi�i Ch� ", nQuality=1, tbProp = {0,167}, nRate = 0.02},
		{szName = "An Bang C�c Hoa Th�ch Ch� ho�n", nQuality=1, tbProp = {0,165}, nRate = 0.02},
		{szName = "An Bang �i�n Ho�ng Th�ch Ng�c B�i", nQuality=1, tbProp = {0,166}, nRate = 0.02},
		{szName = "Hai tr�m v�n �i�m kinh nghi�m", nExp = 2000000, nRate = 48.72},
	}
	
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	local n_award_idx = 0;
	for i=1,getn(tb_award) do
		rstep=rstep+floor(tb_award[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			n_award_idx = i;
			break
		end
	end
	
	if (n_award_idx == 0 or n_award_idx > getn(tb_award)) then
		return 1;
	end
	
	-- ����ÿ��ʹ��20��
	local ndate = tonumber(GetLocalDate("%m%d"));
	local nUseTimes = GetBitTask(SONGJIN_LIBAO_TASK_NO, 0, 8) -- ʹ�ô���
	local nLastUseDate = GetBitTask(SONGJIN_LIBAO_TASK_NO, 8, 24) -- �ϴ�ʹ��ʱ��
	
	if( nLastUseDate ~= ndate) then
		nLastUseDate =  ndate;
		nUseTimes = 0;
	end
	
	if (nUseTimes >= SONGJIN_LIBAO_LIMIT) then
		Say(format("M�t ng�y ch� c� th� s� d�ng %d T�ng Kim l� bao", SONGJIN_LIBAO_LIMIT), 0)
		return 1;
	end
		
	nUseTimes = nUseTimes + 1;
	SetBitTask(SONGJIN_LIBAO_TASK_NO, 0, 8,  nUseTimes);
	SetBitTask(SONGJIN_LIBAO_TASK_NO, 8, 24, nLastUseDate);
	
	tbAwardTemplet:GiveAwardByList(tb_award[n_award_idx], "T�ng Kim l� bao");
end
