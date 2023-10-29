Include([[\script\missions\chrismas\ch_head.lua]]);

function OnTimer()
	local nNewsValue = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, nNewsValue);
	
	gb_SetTask("Ho�t ��ng Gi�ng Sinh", 1, 2);
	if (20 == nNewsValue) then
		CloseMission(CH_MISSIONID);
		return
	end;
	
	local i;
	for i = 1, CH_SMALLMAPCOUNT do
		if (nNewsValue >= 18) then
			groupsort(i, 1);
		else
			groupsort(i, 0);
		end;
	end;
	
	if (0 == mod(nNewsValue, 2)) then
		local nTime = floor(nNewsValue / 2);
		nTime = 10 - nTime;
		if (nTime > 0) then
			local OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(CH_MAPID[2]);
			Msg2MSAll(CH_MISSIONID, "Ho�t ��ng v�n c�n<color=yellow>"..nTime.."<color>ph�t k�t th�c!");
			SubWorld = OldSubWorld;
		end;
	end;
end;

--������(���ݵ�������ɶൽ��ȷ����һ���Ա������)��
function groupsort(nGroupId, bSave)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CH_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, CH_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(CH_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(TK_COUNT_ONETIME);
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	
	local j;
	local temptab = {};
	local nCount = getn(tabPlayer);
	for i = 2, nCount do	--����һ��ð������
		for j = nCount, i, -1 do
			if (tabPlayer[j][2] > tabPlayer[j - 1][2]) then	--���ý�������
				temptab = tabPlayer[j];
				tabPlayer[j] = tabPlayer[j - 1];
				tabPlayer[j - 1] = temptab;
			end;
		end;
	end;

	local szMsg = ""
	local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1]
			szMsg = szMsg.."<enter> <color=green>"..i.." "..GetName()..", t�m ���c"..tabPlayer[i][2].."m�n qu�"
		end
	end
	--������ǰ����������ε��Ⱥ�
	nCount = nCount;
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		if (bSave == 1) then
			SetTask(TK_RANK, i);
		end;
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		Msg2Player("Hi�n b�n t�m ���c <color=yellow>"..GetTask(TK_COUNT_ONETIME).."<color>m�n qu�, hi�n t�i x�p h�ng <color=yellow>"..i.."<color>, ti�p t�c c� g�ng!");
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
