Include("\\script\\missions\\bw\\bwhead.lua")
function InitMission()
	for i = 1, 40 do 
		SetMissionV(i,0);--��������
	end;
	
	for i = 1, 10 do 
		SetMissionS(i, "")
	end;
	SetMissionV(MS_STATE, 1);
	SetMissionV(BW_KEY, random(10000000)+1);
	StartMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID, TIMER_1);
	StartMissionTimer(BW_MISSIONID, BW_TOTALTIME_ID, TIMER_2);
	CreateChannel("L�i ��i nhi�u ng��i b�n Gi�p", 11);
	CreateChannel("L�i ��i nhi�u ng��i b�n �t", 11);
	
	for i = 1, getn(CS_CamperPos) do
		local nNpcIdx = AddNpc(332, 1, SubWorld, CS_CamperPos[i][1] * 32, CS_CamperPos[i][2] * 32, 1, CS_CamperPos[i][3]);
		SetNpcScript(nNpcIdx, "\\script\\missions\\bw\\bwcamper.lua");
	end
end;

function RunMission()
	bw_group_to_fight(1);	--the param stand for group ID;
	bw_group_to_fight(2);

	SetMissionV(MS_STATE, 2);
end;

function EndMission()
	for i = 1, 40 do 
		SetMissionV(i , 0);
	end;
	
	for i  = 1, 10 do 
		SetMissionS(i, "")
	end;
	
	GameOver();
	StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
	StopMissionTimer(BW_MISSIONID, BW_TOTALTIME_ID);
	DeleteChannel("L�i ��i nhi�u ng��i b�n Gi�p");
	DeleteChannel("L�i ��i nhi�u ng��i b�n �t");
	local subworldid = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(subworldid);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;

	str2 = GetName().."R�i kh�i ��u tr��ng";
	LeaveGame();
	NewWorld(GetTask(BW_SIGNPOSWORLD), GetTask(BW_SIGNPOSX), GetTask(BW_SIGNPOSY));
end;

--��һ������˶����ս��״̬
function bw_group_to_fight(nGroupID)
	if (nGroupID < 0) then
		return
	end;
	local OldPlayer = PlayerIndex;

	local idx = 0;
	local pidx, i;
	for i = 1, 400 do
		idx , pidx = GetNextPlayer(BW_MISSIONID, idx, nGroupID);
		if (pidx > 0) then
		   	PlayerIndex = pidx;
		   	SetFightState(1);
		end;
		if (idx == 0) then
			break;
		end;
	end;
	PlayerIndex = OldPlayer;
end;