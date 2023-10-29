-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..

Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")


-- ����������ʼ��ʱ��
function YDBZ_ready_match_timer()
	-- 5���Ӻ�������������
	StartMissionTimer(YDBZ_READY_MISSION, YDBZ_READY_TIMER, YDBZ_READY_LIMIT_BROAD * 18);
	SetMissionV(YDBZ_READY_BROAD_STATE,1)
end

-- ��ʼ����
function YDBZ_ready_signup()
	-- ����Ϊ����״̬
	SetMissionV(YDBZ_READY_STATE, 1);
	SetMissionV(YDBZ_READY_TEAM, 0);
	SetMissionV(YDBZ_READY_TEAM_MAX,0)
	local nKey = tonumber(GetLocalDate("%y%m%d%H%M"))
	SetMissionV(YDBZ_MISSION_KEY,nKey)
end

function InitMission()
	print("yandibaozang..initmission")
	StopMissionTimer(YDBZ_READY_MISSION,YDBZ_READY_TIMER)
	YDBZ_ready_signup();
	YDBZ_ready_match_timer();
end

function EndMission()
	SetMissionV(YDBZ_READY_STATE, 0);
	SetMissionV(YDBZ_READY_TEAM, 0);
	for i=1,GetMissionV(YDBZ_READY_TEAM_MAX) do
		SetMissionS(i,"")
	end
	SetMissionV(YDBZ_READY_TEAM_MAX,0)
	YDBZ_ready_close_match();
end

function OnLeave(index)
		--print("player leave!!")
		local oldplayindex = PlayerIndex
		PlayerIndex = index
		local oldworld = SubWorld
		local world = GetMissionV(YDBZ_READY_SIGNUP_WORLD);
		local pos_x = GetMissionV(YDBZ_READY_SIGNUP_POSX);
		local pos_y = GetMissionV(YDBZ_READY_SIGNUP_POSY); 
		local pyname = GetName()
		local nteams = GetTask(YDBZ_TEAMS_TASKID)
		local nteamsum = GetMSPlayerCount(YDBZ_READY_MISSION,nteams)
		local idx = 0
		local pidx,nj
		--print(nteamsum)
		local szteamname = GetMissionS(nteams)
		if nteamsum < YDBZ_TEAM_COUNT_LIMIT and GetMissionV(YDBZ_READY_STATE) ~= 3 and GetTaskTemp(200) == 1   then
			local tbplayer = {}
			for nj = 1, 10 do
				idx , pidx = GetNextPlayer(YDBZ_READY_MISSION, idx,nteams );
				if (pidx > 0) then
						tbplayer[getn(tbplayer)+1] = pidx
				end
				
				if (idx == 0) then
					break;
				end;
			end
			for nj = 1 , getn(tbplayer) do
						PlayerIndex = tbplayer[nj]
						YDBZ_restore(PlayerIndex,YDBZ_READY_MISSION,nteams)
						NewWorld(world, pos_x, pos_y);
						Msg2Player(format("Do v� <color=yellow>%s<color> r�i kh�i c�a ra v�o b�o t�ng vi�m ��, t� ��i c� s� ng��i �t h�n %s ng��i, s� kh�ng th� n�o tham gia ho�t ��ng v� s� ��y ra kh�i n�i n�y",pyname,YDBZ_TEAM_COUNT_LIMIT))
			end
			PlayerIndex = index	
			SetMissionV(YDBZ_READY_TEAM,GetMissionV(YDBZ_READY_TEAM)-1)
			Msg2MSAll(YDBZ_READY_MISSION,format("��i <color=blue>%s<color> r�i kh�i c�a v�o b�o t�ng Vi�m ��",szteamname))

		else
			local szstr = format("Ng��i ch�i c�a t� ��i<color=yellow>%s<color> r�i kh�i c�a v�o b�o t�ng Vi�m ��",GetName())
			Msg2MSGroup(YDBZ_READY_MISSION,szstr,nteams)
			--NewWorld(world, pos_x, pos_y);
			Msg2Player(szstr)
			YDBZ_restore(index,YDBZ_READY_MISSION,nteams)
		end
		PlayerIndex = oldplayindex
		SubWorld = oldworld
end

