Include([[\script\missions\tong\tong_disciple\head.lua]]);

function OnTimer()
	local nNewsValue = GetMissionV(MS_PREPARENEWSVALUE) + 1;
	SetMissionV(MS_PREPARENEWSVALUE, nNewsValue);
	
	local nRemain = 5 - floor(nNewsValue / 2);
	if (10 == nNewsValue) then --5���ӣ�����ҽ���
		local OldSubWorld = SubWorld;
		SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
		OpenMission(DIS_MISSIONID)
		SetGlbValue(GLB_DIS_PHASE, 2); --��ֹ�ٽ�������
		gb_SetTask(CHRISMAS_SHREWMOUSE, 1, 2);
		if (players_entrance() == 0) then
			SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
			CloseMission(DIS_MISSIONID);
		end;
		SubWorld = SubWorldID2Idx(DIS_MAPID[1]);
		CloseMission(DIS_PREPAREMISSIONID);
		SubWorld = OldSubWorld;
		return
	elseif (0 == mod(nNewsValue, 2)) then
		if (nRemain > 0) then
			Msg2MSAll(DIS_PREPAREMISSIONID, "c�n"..nRemain.." ph�t sau s� b�t ��u ho�t ��ng!");
		end;
	elseif (9 == nNewsValue) then
        Msg2MSAll(DIS_PREPAREMISSIONID, "ch� c�n 30 gi�y n�a ho�t ��ng s� b�t ��u!");
	end;
end;

--һ�º���ֻ������ļ��õ����ԣ���д��head��
function players_entrance() -- �������ҽ��뵽���أ�
	local tabPlayerIdx = {};
	local pidx = 0
	local idx = 0
	local i;
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(DIS_MAPID[1]);

	for i = 1, 500 do
		idx, pidx = GetNextPlayer(DIS_PREPAREMISSIONID, idx, 0);
		if (pidx > 0) then
			tinsert(tabPlayerIdx, pidx);
		end;
		
		if (idx == 0) then
			break;
		end;
	end;
	SubWorld = OldSubWorld;
	
	if (getn(tabPlayerIdx) < 5) then
		cancelgame(DIS_MAPID[1], DIS_PREPAREMISSIONID);
		return 0;
	end;
	--���л���
	local tabSubTeam = chaos(tabPlayerIdx, DIS_MAXPLAYERCOUNT);
	local nBeginMap = random(1, DIS_SMALLMAPCOUNT);
	SetMissionV(MS_BEGINGMAPID, nBeginMap);
	
--tabParam = {׼����ID, {��Ҫ�Ĺ��׶�, �����ļ�}, {����Ϊ����������...}, {groupֵ, ��ʼ��ͼmap, MissionID, �����map}}
	local tabParam = {};
	for i = 1, getn(tabSubTeam) do
		local nGroup = i;
		local nMap = nBeginMap + i - 1;
		nMap = mod(nMap, DIS_SMALLMAPCOUNT) + 1;
		tabParam = {DIS_MAPID[1], {TONGGXD[1][1], [[\settings\maps\chrismas\player.txt]]}, {DIS_COUNT_ONETIME, DIS_TK_RANK}, {nGroup, nMap, DIS_MISSIONID, DIS_MAPID[2]}};
		gogamemap(tabSubTeam[i], tabParam);
	end;
	return 1;
end;
