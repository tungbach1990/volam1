-- description	: ��������
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\misc\\eventsys\\type\\npc.lua")

-- ����������ʼ��ʱ��
function start_match_timer()
	-- 10���Ӻ�������������
	StartMissionTimer(MISSION_MATCH, TIMER_MATCH, LIMIT_SIGNUP * 18);
end

-- ��ʼ����
function start_signup()
	-- ����Ϊ����״̬
	SetMissionV(VARV_STATE, 1);
	SetMissionV(VARV_BOARD_TIMER, 0);
	SetMissionS(VARS_TEAM_NAME, "");
	-- ͨ�����۱���������ʼ
	--��relayͨ�汨����ʼ��2��
	--local min = floor(LIMIT_SIGNUP / 60);
	--broadcast("<#>ʱ�����ս��������ʼ�ˣ���������7�������߱��������ɶӳ�����������ʱ��Ϊ" .. min .. "����");
end

function InitMission()
	start_signup();
	start_match_timer();
end

function EndMission()
	close_match();
	close_board_timer();
	close_close_timer();
end

function PlayerLeave()

	BigBoss:RemoveChuangGuanBonus()
	
	SetCurCamp(GetCamp())
	SetTaskTemp(200,0)
	SetFightState(0)
	SetPunish(1)
	SetCreateTeam(1)
	SetPKFlag(0)
	ForbidChangePK(0)
	SetDeathScript("")
	
	SetTask(1505, 0)
	DisabledUseTownP(0)
	
	Msg2MSAll(MISSION_MATCH, GetName().."R�i kh�i khu v�c nhi�m v� ")
	
	--Storm �ӽ�����
	if storm_valid_game(2) then	--�籩��սû�н����������������߸öδ��벻�������ã�
		storm_add_pointex(2, 40)
		storm_end(2)
	end
	SetTask(STORM_TASKID_GAMEID_SS, 0)	--���GameKey
end

function PlayerJoinMission(camp)
	LeaveTeam()
	AddMSPlayer(MISSION_MATCH,camp);
	SetCurCamp(camp);
	SetTaskTemp(200,1)
	SetFightState(1);
	SetLogoutRV(1);
	SetPunish(0);
	str = GetName().."Tham gia 'Nhi�m v� Th�ch th�c th�i gian'"
	local sf_mapid = SubWorldIdx2ID(SubWorld)
	NewWorld(sf_mapid, BOAT_POSX, BOAT_POSY);
	SetCreateTeam(0);
	Msg2MSAll(MISSION_MATCH,str);
	SetPKFlag(1)
	ForbidChangePK(1);
	SetDeathScript(SCRIPT_PLAYER_DEATH);
	SetTask(1505, 1)
	DisabledUseTownP(1)

	--Storm ����籩����
	SetTask(STORM_TASKID_GAMEID_SS, random(100000))	--ָ�������GameKey
end

-- ����˳�
function OnLeave(index)
	CallPlayerFunction(index, PlayerLeave)
end

--��ҽ���
function JoinMission(RoleIndex, camp)
	if (camp ~= 1) then
		return
	end
	CallPlayerFunction(RoleIndex, PlayerJoinMission, camp)
	EventSys:GetType("ChuanGuan"):OnPlayerEvent("OnEnter", RoleIndex, camp)
end

