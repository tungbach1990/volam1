--�����npc

--ÿ�ְ�˳�����4���Ƶ���ҿ��Ի�ý���
--+ǰ10������Ƶ���һ��10.000.000 EXP
--+ 11����11���Ժ����һ��2.000.000 EXP
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	local tbFnagxiang = 
	{
		[1] = "��n k�o qu�n ��ng",
		[2] = "��n k�o qu�n T�y",
		[3] = "��n k�o qu�n Nam",
		[4] = "��n k�o qu�n B�c",
	}
	local nNpcIndex = GetLastDiagNpc();
	local nCurNpcType = GetNpcParam(nNpcIndex, 1)
	local nTaskStep = GetNpcParam(nNpcIndex, 3)
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Ch� c� ng��i ch�i c�p 50 tr� l�n �� n�p th� m�i c� th� tham gia ho�t ��ng.", 0)
		return 
	end
	local tbItem = {szName="N�n ��", tbProp={6, 1, 1820, 1, 0, 0},nCount = 1}
	
	if (GetNpcParam(nNpcIndex, 4) == 1 ) then
		return
	end;
	
	SetNpcParam(nNpcIndex, 4, 1);
	
	local nTaskState = GetTask(zhongqiu0808_TSK_TaskState)
	
	if (nCurNpcType == 1 or nTaskStep - nTaskState == 1) and ((nTaskStep - nTaskState) < -4 or (nTaskStep - nTaskState) > 0) then
		if ConsumeEquiproomItem(tbItem.nCount, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4]) ~= 1 then
			
			Say("C�n 1 n�n �� �� th�p l�ng ��n.", 0)
		else
			SetTask(zhongqiu0808_TSK_TaskState, nTaskStep)
			Msg2Player(format("Th�p ���c %s", tbFnagxiang[nCurNpcType]))
			
			if nCurNpcType == 4 then
				local nRank = GetNpcParam(nNpcIndex, 2)
				nRank = nRank + 1
				Msg2Player(format("Xin ch�c m�ng, ��i hi�p l� ng��i th� %d �� th�p s�ng t�t c� l�ng ��n.", nRank))
				if nRank <= 10 then
					tbAwardTemplet:GiveAwardByList({nExp = 10000000}, "Ho�t ��ng ��n k�o qu�n." )
				else
					tbAwardTemplet:GiveAwardByList({nExp = 2000000}, "Ho�t ��ng ��n k�o qu�n." )
				end
				SetNpcParam(nNpcIndex, 2, nRank)
			end
		end
		
		
		
		
	elseif (nTaskStep - nTaskState) >= -4 and (nTaskStep - nTaskState) <= 0  then
		Msg2Player("��n k�o qu�n n�y �� ���c th�p s�ng r�i.")
	elseif tbFnagxiang[nCurNpcType-1] then
		Msg2Player(format("Tr��c ti�n c�n ph�i th�p s�ng %s", tbFnagxiang[nCurNpcType-1]))
	end
	
	
	SetNpcParam(nNpcIndex, 4, 0);
end

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	DelNpc(nNpcIdx)
end;