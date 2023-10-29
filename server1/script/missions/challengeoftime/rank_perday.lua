Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\lib\\awardtemplet.lua")

tsk_rank_lastdate	= 2636	-- ������һ�βμӸ߼����ص�ʱ��
tsk_rank_lastscore 	= 2637	-- ������һ�βμӸ߼����صĳɼ�
tsk_rank_2thdate 	= 2638	-- �������ڶ��βμӸ߼����ص�ʱ��
tsk_rank_2thscore 	= 2639	-- �������ڶ��βμӸ߼����صĳɼ�

DailyRankLadderId	= 10235

nTIMERANK = "challengeoftime_ranklist";	-- ʱ����սÿ�������

tbQiannianlingyao = {szName = "Thi�n Ni�n Linh D��c", tbProp = {6, 1, 2116, 1, 1, 0}, nExpiredTime = 24 * 60};

function rank_award()
	ntime = tonumber(GetLocalDate("%H%M"))
	if (ntime < 4 or ntime > 2300) then
		Say("Nhi�p Th� Tr�n: ��n nh�n v�o th�i gian ch� ��nh", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("Nhi�p Th� Tr�n: V� s� an to�n cho ��i hi�p, xin h�y ch�a h�nh trang tr�n 1 � tr�ng", 0);
		return
	end
	
	update_gbtask(9999999);
	update_playertask();
end

function update_gbtask(nTime)
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	if (gb_GetTask(nTIMERANK, 1) ~= ndate) then
		if (gb_GetTask(nTIMERANK, 1) ~= nlastday) then
			gb_SetTask(nTIMERANK, 3, nlastday);
			gb_SetTask(nTIMERANK, 4, 0);
			
		else
			gb_SetTask(nTIMERANK, 3, gb_GetTask(nTIMERANK, 1));
			gb_SetTask(nTIMERANK, 4, gb_GetTask(nTIMERANK, 2));
		end
		gb_SetTask(nTIMERANK, 1, ndate);
		gb_SetTask(nTIMERANK, 2, nTime)
	else
		if (gb_GetTask(nTIMERANK, 2) > nTime) then
			gb_SetTask(nTIMERANK, 2, nTime);
		end
	end	
end

function update_playertask()
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	Msg2Player("Admin nlastday : "..nlastday)
	Msg2Player("GetTask(tsk_rank_lastdate): "..GetTask(tsk_rank_lastdate))
	Msg2Player("GetTask(tsk_rank_2thdate): "..GetTask(tsk_rank_2thdate))
	if (GetTask(tsk_rank_lastdate) ~= nlastday and GetTask(tsk_rank_2thdate) ~= nlastday) then
		Say("Nhi�p Th� Tr�n: ��i hi�p v�n ch�a �� �i�u ki�n nh�n th��ng", 0);
		return
	end
	
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	if (GetTask(tsk_rank_lastdate) == nlastday) then
		if (GetTask(tsk_rank_lastscore) == 0) then
			Say("Nhi�p Th� Tr�n: H�m nay ��i hi�p �� nh�n ph�n th��ng n�y r�i.", 0);
		else
			SetTask(tsk_rank_lastscore, 0);
			tbAwardTemplet:GiveAwardByList(tbQiannianlingyao, "Thi�n Ni�n Linh D��c");
		end
	else
		if (GetTask(tsk_rank_2thscore) == 0) then
			Say("Nhi�p Th� Tr�n: H�m nay ��i hi�p �� nh�n ph�n th��ng n�y r�i.", 0);
		else
			SetTask(tsk_rank_2thscore, 0);
			tbAwardTemplet:GiveAwardByList(tbQiannianlingyao, "Thi�n Ni�n Linh D��c");
		end
	end
end

function get_top5team()
	tbRoleName = {};
	for i = 1, 5 do
		RoleName, value = Ladder_GetLadderInfo(DailyRankLadderId, i);
		value = value * (-1);
		if (RoleName == "" and i == 1) then
			Say("B�ng x�p h�ng t�m th�i ch�a c� th�ng tin!", 0);
			return
		end
--		if (RoleName == "") then
--			break
--		end
		local szTime	= format("%s ph�t %s gi�y", floor(value/60), floor(mod(value, 60)));
		tinsert(tbRoleName, getn(tbRoleName)+1, format("H�ng %d: %s\tTh�nh t�ch: %s\n", i, RoleName, szTime));
	end
	tinsert(tbRoleName, getn(tbRoleName)+1, "Ta ch� ��n xem!/OnCancel");
	Say("B�ng x�p h�ng:", getn(tbRoleName), unpack(tbRoleName));
end
