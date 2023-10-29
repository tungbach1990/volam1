Include("\\script\\missions\\citywar_arena\\head.lua")
function InitMission()
	for i = 1, 40 do 
		SetMissionV(i,0);--��������
	end;
	
	for i = 1, 10 do 
		SetMissionS(i, "")
	end;
	WorldID = SubWorldIdx2ID(SubWorld);
	if (WorldID >= WORLDIDXBEGIN) then 
		SetMissionV(MS_ARENAID , WorldID - WORLDIDXBEGIN);
		tong1, tong2 = GetArenaBothSides(GetMissionV(MS_ARENAID));
		if (tong1 ~= "" and tong2 ~= "") then 
			SetMissionS(1, tong1)
			SetMissionS(2, tong2)
			SetMissionS(3, GetCityAreaName(GetArenaCityArea(WorldID - WORLDIDXBEGIN)) )
			SetMissionV(MS_STATE, 1);
			StartMissionTimer(MISSIONID, 16, TIMER_1);
			StartMissionTimer(MISSIONID, 17, TIMER_2);
		end;
	end;
end;

function RunMission()
	idx = 0;
	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
   			SetFightState(1);
		end
 	end;
 	SetMissionV(MS_STATE, 2);--��������
end;

function EndMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	
	for i  = 1, 10 do 
		SetMissionS(i, "")
	end;
	
	GameOver();
	StopMissionTimer(MISSIONID, 16);
	StopMissionTimer(MISSIONID, 17);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	str2 = GetName().."R�i kh�i chi�n tr��ng, ";
	-- SetLogoutRV(0);  ��ҵ���Ҳ���Mission��OnLeave����˲����ڴ˵���SetLogoutRV(0)�������ڰ����NewWorld��Mission��ͼ�ĵط����� Fanghao_Wu 2006-3-21
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	SetPKFlag(0)--�ر�PK����
	ForbidChangePK(0);
	Msg2MSAll(MISSIONID, str2);
	SetTaskTemp(200, 0);
end;