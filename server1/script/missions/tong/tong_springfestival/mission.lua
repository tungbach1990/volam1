Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(MS_SF_TIMERSTATE, 1);

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SF_MAPID[2]);
	
	StartMissionTimer(SF_MISSIONID, SF_FAIRY_SMALLTIMERID, SF_INTERVER);	--ˢ�ּ�ʱ��
	StartMissionTimer(SF_MISSIONID, SF_REPORT_SMALLTIMERID, SF_RUNINTERVER);     --������ʱ��
end;

function EndMission()
	local i;
	for i = 1, SF_SMALLMAPCOUNT do
		if (GetMSPlayerCount(SF_MISSIONID, i + SF_SMALLMAPCOUNT) > 0 or
		    GetMSPlayerCount(SF_MISSIONID, i) > 0) then
			groupsort(i);
		end;
	end;
	festival_gameover(SF_MAPID[2], SF_MISSIONID);	--����������������ͼ
	strGlbNews = format("C�c d�ng s� bang h�i �i truy �u�i %s �� tr� v�, l�n n�y tuy �� di�t tr� ���c %s, nh�ng t� kh� c�a n� v�n c�n t�n t�i.", SF_ANIMALNAME, SF_ANIMALNAME);
	AddGlobalNews(strGlbNews);
	
	ClearMapObj(SF_MAPID[2]);

	StopMissionTimer(SF_MISSIONID, SF_FAIRY_SMALLTIMERID);
	StopMissionTimer(SF_MISSIONID, SF_REPORT_SMALLTIMERID);
	SetGlbValue(GLB_SF_PHASE, 0); 
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 0);
end;

function OnLeave()
	SetLogoutRV(0);
end

--������(���ݵ�������ɶൽ��ȷ����һ���Ա������)��
function groupsort(nGroupId)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SF_MAPID[2]);
	
	local nGroupId_nianshou = festival_getgroupid(nGroupId);
	
	local OldPlayer = PlayerIndex;
	local tabNormalPlayer = {};
	tabNormalPlayer = festival_sort(nGroupId);
	local tabMsg = {}
	local nMsgCount;
	tabMsg, nMsgCount = festival_getsz(tabMsg, 0, tabNormalPlayer, nGroupId);
	
	local tabNianshouPlayer = {};
	tabNianshouPlayer = festival_sort(nGroupId_nianshou);
	tabMsg, nMsgCount = festival_getsz(tabMsg, nMsgCount, tabNianshouPlayer, nGroupId_nianshou);
	
	festival_broadcast(tabMsg, nMsgCount, tabNormalPlayer);
	festival_broadcast(tabMsg, nMsgCount, tabNianshouPlayer);
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;

function festival_sort(nGroupId)
    local tabPlayer = {};
    local idx = 0;
	local pidx;
    local i;
	for i = 1, SF_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(SF_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(SF_COUNT_ONETIME);
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
	return tabPlayer;
end;

function festival_getsz(tabMsg, nMsgCount, tabPlayer, nGroupId)
    local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	local i;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1];
			if (nGroupId > SF_SMALLMAPCOUNT) then
			    tabMsg[i + nMsgCount] = format("<color=green>X�p h�ng %d: %s, b�t ���c %d %s", i, GetName(), tabPlayer[i][2], SF_MOUSENAME);
			else
			    tabMsg[i + nMsgCount] = format("<color=orange>X�p h�ng %d: %s, ��nh tr�ng %s %d l�n",i,GetName(),SF_ANIMALNAME, tabPlayer[i][2]);
			end;
		end
	end
	nMsgCount = getn(tabMsg);
	if (nMsgCount > 0) then
	    tabMsg[nMsgCount] = tabMsg[nMsgCount];
	end;
	return tabMsg, nMsgCount;
end;

function festival_broadcast(tabMsg, nMsgCount, tabPlayer)
    nCount = getn(tabPlayer);
    local i, j;
    --������ǰ����������ε��Ⱥ�
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(SF_TK_RANK, i);
		for j = 1, nMsgCount do
		    Msg2Player(tabMsg[j]);
		end;
		if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT) then
    		Msg2Player("B�n l� ng��i th� <color=yellow>"..i.."<color> nh�n s� tham gia b�t ni�n th� c� th� ��n <color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color> �� nh�n th��ng!");
    	else
    	    Msg2Player("B�n l� ng��i ��nh tr�ng Qu�i th� <color=yellow>"..i.."<color>, c� th� ��n g�p <color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color> �� nh�n th��ng!");
    	end;
	end;
end;