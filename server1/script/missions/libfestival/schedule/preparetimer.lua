if (not _H_PREPARETIMER_) then
	_H_PREPARETIMER_ = 1;

function OnTimer()
	local nNewsValue = GetMissionV(MS_CO_PREPARENEWSVALUE) + 1;
	SetMissionV(MS_CO_PREPARENEWSVALUE, nNewsValue);
	
	local nRemain = 5 - floor(nNewsValue / 2);
	if (10 == nNewsValue) then --5���ӣ�����ҽ���
		local OldSubWorld = SubWorld;
		SubWorld = SubWorldID2Idx(CO_MAPID[2]);
		OpenMission(CO_MISSIONID)
		players_entrance();
		SubWorld = SubWorldID2Idx(CO_MAPID[1]);
		CloseMission(CO_PREPAREMISSIONID);
		gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 2);
		SubWorld = OldSubWorld;
		return
	elseif (0 == mod(nNewsValue, 2)) then
		if (nRemain > 0) then
			Msg2MSAll(CO_PREPAREMISSIONID, "Ch� c�n"..nRemain.."ph�t n�a ho�t ��ng s� b�t ��u!");
		end;
	elseif (9 == nNewsValue) then
        Msg2MSAll(CO_PREPAREMISSIONID, "ch� c�n 30 gi�y n�a ho�t ��ng s� b�t ��u!");
	end;
end;

--һ�º���ֻ������ļ��õ����ԣ���д��head��
function players_entrance() -- �������ҽ��뵽���أ�
	local i, j = 1;
	local tab_P = {};
	
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CO_MAPID[1]);
	if (CO_MINIMUM >= GetMSPlayerCount(CO_PREPAREMISSIONID, 0)) then
		Msg2MSAll(CO_PREPAREMISSIONID, "Do s� ng��i tham gia ho�t ��ng �t h�n <color=yellow>"..CO_MINIMUM.." ng��i<color>?n�n ��t ho�t ��ng n�y b� h�y b�.");
		SubWorld = SubWorldID2Idx(CO_MAPID[2]);
		CloseMission(CO_MISSIONID)
		return
	end;

	local pidx = 0;
	local idx = 0;
	j = 1;
	for i = 1, 500 do
		idx, pidx = GetNextPlayer(CO_PREPAREMISSIONID, idx, 0);
		
		if (pidx > 0) then
			tab_P[j] = pidx;
			j = j + 1;
		end;
		
		if (idx == 0) then
			break;
		end;
	end;
	SubWorld = OldSubWorld;
	
	--���л���
	local tabSubTeam = chaos(tab_P);
	j = getn(tabSubTeam);
	local nBeginMap = random(1, CO_SMALLMAPCOUNT);
	SetMissionV(MS_CO_BEGINGMAPID, nBeginMap);
	for i = 1, j do
		local nGroup = i;
		local nMap = nBeginMap + i - 1;
		nMap = mod(nMap, CO_SMALLMAPCOUNT) + 1;
		startgame(tabSubTeam[i], nGroup, nMap);
	end;
end;

function chr_rand_tab(tab)
  local tab_size = getn(tab)
 for i = 1, tab_size do 
	m1 = random(1,tab_size)
	m2 = random(1,tab_size)
	m = tab[m1] ;
	tab[m1] = tab[m2]
	tab[m2] = m
 end
end

function chaos(tabPlayerIdx) --������ҵ�˳��,�ֳ�10���˵�һ��С�ֶ�
	local i, j;
	local nIndex;
	local nPCount = getn(tabPlayerIdx);
	local nBeginPlayer = random(1, nPCount);
	local subTabCount = floor(nPCount / CO_MAXPLAYERCOUNT);
	local tabSubTeam = {};
	
	chr_rand_tab(tabPlayerIdx);
	--���ܳ���10���˵��볡
	for i = 1, subTabCount do
		tabSubTeam[i] = {}
		for j = 1, CO_MAXPLAYERCOUNT do
			local nIndex = subTabCount * (j - 1) + i + nBeginPlayer - 1;
			nIndex = mod(nIndex - 1, nPCount) + 1
			tabSubTeam[i][j] = tabPlayerIdx[nIndex];
		end;
	end;
	--����10���˵Ľ����ֿ�
	tabSubTeam[subTabCount + 1] = {};
	j = 1;
	local nBegin = CO_MAXPLAYERCOUNT * subTabCount + 1;
	for i = nBegin, nPCount do
		nIndex = i  + nBeginPlayer - 1; 
		nIndex = mod(nIndex - 1, nPCount) + 1;
		tabSubTeam[subTabCount + 1][j] = tabPlayerIdx[nIndex];
		j = j + 1;
	end;
	SetMissionV(MS_CO_GAMECOUNT, getn(tabSubTeam));
	return tabSubTeam;
end;

function startgame(tabPlayerIdx, nGroupId, nBeginMap) --
	local i, j;
	local OldSubWorld = SubWorld;
	local OldPlayer = PlayerIndex;
	local nPCount = getn(tabPlayerIdx);

	SubWorld = SubWorldID2Idx(CO_MAPID[1]);
	for i = 1, nPCount do
		PlayerIndex = tabPlayerIdx[i];
		if (PlayerIndex > 0) then
    		SetTask(TK_CO_COUNT_ONETIME, 0);	--��һ�������ĸ�����0��
    		SetTask(TK_CO_RANK, 0);	--��������0
			SetTask(TK_CO_GROUPID, nGroupId);	--��¼��ҵ�groupid
			startgame_add(nBeginMap);
			SubWorld = SubWorldID2Idx(CO_MAPID[2]);
			AddMSPlayer(CO_MISSIONID, nGroupId);
		end;
	end;
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;

end;	--	end of _H_PREPARETIMER_