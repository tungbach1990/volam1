Include([[\script\missions\tong\collectgoods\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(COLLG_MS_TIMERSTATE, 1);

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(COLLG_MAPID[2]);
	
	StartMissionTimer(COLLG_MISSIONID, COLLG_RUNTIMERID, COLLG_RUNINTERVER); --
	StartMissionTimer(COLLG_MISSIONID, COLLG_SMALLTIMERID, COLLG_INTERVER);	--
end;

function EndMission()
	local i;
	for i = 1, COLLG_SMALLMAPCOUNT do
		if (GetMSPlayerCount(COLLG_MISSIONID, i) > 0) then
			groupsort(i);
		end;
	end;
	collg_clearfairy();	--������������еĹ�
	collg_gameover(COLLG_MAPID[2], COLLG_MISSIONID);	--����������������ͼ
	local nTime = tonumber(GetLocalDate("%H%M"));
	local strGlbNews = "C�c hi�p kh�ch �i t�m h�ng h�a �� tr� v� r�i."
	AddGlobalNews(strGlbNews);

	StopMissionTimer(COLLG_MISSIONID, COLLG_SMALLTIMERID);
	StopMissionTimer(COLLG_MISSIONID, COLLG_RUNTIMERID);
	SetGlbValue(GLB_COLLG_PHASE, 3); 
	gb_SetTask(COLLG_NAME, 1, 3);
end;

function OnLeave()
	SetLogoutRV(0);
end

--������(���ݵ�������ɶൽ��ȷ����һ���Ա������)��
function groupsort(nGroupId)
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
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(COLLG_TK_RANK, i);
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		if (GetTask(COLLG_COUNT_ONETIME) == 0) then
			Msg2Player("Th�t ��ng ti�c, ng��i kh�ng c� t�i h�ng h�a n�o!");
		else
			Msg2Player("B�n x�p h�ng th� <color=yellow>"..i.."<color>, c� th� ��n g�p <color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color> �� nh�n th��ng!");
		end;
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
