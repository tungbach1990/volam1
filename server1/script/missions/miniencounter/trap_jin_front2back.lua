Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function main(sel)
	local tbTargetPos = 
	{
		[1] = {1857, 3115},
	};

	local nTargetPosNum = getn(tbTargetPos);
	local nRandom = random(1, nTargetPosNum);

	-- �ж���Ӫ
	local nMapId = GetWorldPos();
	local tbMap  = EncounterMapManager:FindInMapList(nMapId);

	if tbMap then
		local tbPlayer = tbMap:GetPlayer(GetName());
		if tbPlayer.nCamp == 2 then
			SetFightState(0);		   -- ����ս��״̬
			SetPos(tbTargetPos[nRandom][1], tbTargetPos[nRandom][2]);
			SetTmpCamp(2);
			SetCurCamp(2);
		else
			Msg2Player("Ph�a tr��c l� h�u doanh c�a ��ch, t�t nh�t kh�ng n�n ti�n s�u v�o n�a!");
		end
	end
end


