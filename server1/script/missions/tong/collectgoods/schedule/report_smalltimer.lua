Include([[\script\missions\tong\collectgoods\schedule\bombout.lua]]);

function OnTimer()
	local nNewsValue = GetMissionV(COLLG_MS_NEWSVALUE) + 1;
	SetMissionV(COLLG_MS_NEWSVALUE, nNewsValue);
	
	if (20 == nNewsValue) then
		CloseMission(COLLG_MISSIONID);
		return
	end;
	
	local i;
	for i = 1, COLLG_SMALLMAPCOUNT do
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
			SubWorld = SubWorldID2Idx(COLLG_MAPID[2]);
			Msg2MSAll(COLLG_MISSIONID, "Ho�t ��ng v�n c�n<color=yellow>"..nTime.."<color>ph�t k�t th�c!");
			SubWorld = OldSubWorld;
		end;
	end;
	--�����е�ը������
	bombout()
end;

--������(���ݵ�������ɶൽ��ȷ����һ���Ա������)��
function groupsort(nGroupId, bSave)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(COLLG_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, COLLG_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(COLLG_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(COLLG_COUNT_ONETIME);
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
			szMsg = szMsg.."<enter> <color=green>"..i.." "..GetName()..", nh�n ���c "..tabPlayer[i][2].." t�i h�ng h�a"
		end
	end
	--������ǰ����������ε��Ⱥ�
	nCount = nCount;
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		if (bSave == 1) then
			SetTask(COLLG_TK_RANK, i);
		end;
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		Msg2Player("Hi�n t�i thu th�p ���c <color=yellow>"..GetTask(COLLG_COUNT_ONETIME).."<color> t�i h�ng h�a, x�p h�ng th� <color=yellow>"..i.."<color>, ti�p t�c c� g�ng!");
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
