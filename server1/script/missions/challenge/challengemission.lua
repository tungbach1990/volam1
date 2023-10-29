Include("\\script\\missions\\challenge\\challengehead.lua")
function InitMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	SetMissionV(MS_STATE, 1);--��������
	StartMissionTimer(MISSIONID,10,  TIMER_1);
	StartMissionTimer(MISSIONID, 11, TIMER_2);
end;

function RunMission()
	SetMissionV(MS_STATE, 2)
	idx = 0;
	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
 			PlayerIndex = pidx;
			if (GetCurCamp() ~= 6) then
   				SetFightState(1);
				PutMessage("Tr�n chi�n ch�nh th�c b�t ��u, t�t c� h�nh ��ng ");
   			end
 		end;
 	end;
end;

function EndMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	GameOver();
	StopMissionTimer(MISSIONID, 10);
	StopMissionTimer(MISSIONID, 11);
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
	if (GetMissionV(MS_STATE) == 1) then
		if (GetMSPlayerCount(MISSIONID, GetCurCamp()) == 0) then
			SetMissionV(MS_S_JOINED + GetCurCamp() - 1, 0)
		end
	end
end;