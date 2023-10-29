Include("\\script\\missions\\olympic\\tong\\head.lua")
function InitMission()
	for i = 1, 40 do 
		SetMissionV(i,0);
	end;
	
	for i = 1, 10 do 
		SetMissionS(i, "")
	end;

	SetMissionV(MS_STATE, 3);
	StartMissionTimer(MISSIONID, TIME_NO3, TIMER_1);  --��ʼ������ʱ

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
 	SetMissionV(MS_STATE, 4);--��ʼս����
end;

function EndMission()
	GameOver();
	for i = 1, 40 do 
		SetMissionV(i , 0);
	end;
	
	for i  = 1, 10 do 
		SetMissionS(i, "")
	end;
	StopMissionTimer(MISSIONID, TIME_NO3);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	str2 = GetName().."<#>�˳���ս��";
	SetCurCamp(GetCamp())
	-- SetLogoutRV(0);  ��ҵ���Ҳ���Mission��OnLeave����˲����ڴ˵���SetLogoutRV(0)�������ڰ����NewWorld��Mission��ͼ�ĵط����� Fanghao_Wu 2006-3-21
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	SetPunish(1)--����PK�ͷ�
	SetPKFlag(0)--�ر�PK����
	ForbidChangePK(0);
	ForbitTrade(0);
	SetFightState(0);
	Msg2MSAll(MISSIONID, str2);
	SetTaskTemp(JOINSTATE, 0);
end;