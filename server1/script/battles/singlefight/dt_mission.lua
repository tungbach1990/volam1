Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\singlefight\\dt_head.lua")

function InitMission()

end

function RunMission()
	StartMissionTimer(MISSIONID, 26, TIMER_1);-----10��
	StartMissionTimer(MISSIONID, 27, TIMER_2);-----3����
end;

function EndMission()
	StopMissionTimer(MISSIONID, 26);		--�ر�TIMER_1,10���ʱ
	StopMissionTimer(MISSIONID ,27);		--�ر�TIMER_2,3����
	Exit_DT();
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
end;

function GameOver(nWinnerCamp)

end

function Exit_DT()
	dtworld = SubWorld
	
	WriteLog("dantiao is ending. players are "..GetMissionS(1).." and "..GetMissionS(2))
	----  �õ���������ҵ�INDEX
	local tbPlayer = {};
	idx = 0;
	
	--����������
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(DTMISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	tbPlayer[i] = pidx
	end
 	
 	----������ͻ��ν�ս��Ӫ
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	l_curcamp = GetCurCamp();
	 	if (l_curcamp == 1) then
			JoinMission(GetMissionV(MS_ORGMISSION),1)
		else	
			JoinMission(GetMissionV(MS_ORGMISSION),2)
		end;
	end;
	SubWorld = dtworld
end;

function OnLeave(RoleIndex)
	dtworld = SubWorld
	SubWorld = GetMissionV(MS_ORGWORLDINDEX)
	level = BT_GetGameData(GAME_LEVEL)
	PlayerIndex = RoleIndex;
	-- SetLogoutRV(0);  ��ҵ���Ҳ���Mission��OnLeave����˲����ڴ˵���SetLogoutRV(0)�������ڰ����NewWorld��Mission��ͼ�ĵط����� Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0)
	SubWorld = dtworld
	
	SubWorld = GetMissionV(MS_ORGWORLDINDEX)	
	SubWorld = dtworld
	if (GetMSPlayerCount(MISSIONID, 0) > 0) then
		if (GetCurCamp() == 1) then
			dt_winbonus(2)
		else
			dt_winbonus(1)
		end
	end
	
	CloseMission(MISSIONID)
end;

