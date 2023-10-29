-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..

Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc.lua")
function cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "����ȡ����")
end

-- ��ʼ����
function YDBZ_start_match()
	-- ����Ϊ����״̬
	SetMissionV(YDBZ_VARV_STATE, 4);
	
	local player_count = GetMSPlayerCount(YDBZ_MISSION_MATCH);
	--print("call boss time:"..player_count.." map:"..SubWorldIdx2ID(SubWorld))
	if (player_count == 0) then
		-- ȡ������
		cancel_match();
	else

		local team = {}
		team[1] = GetMissionS(YDBZ_TEAM_NAME[1])
		team[2] = GetMissionS(YDBZ_TEAM_NAME[2])
		team[3] = GetMissionS(YDBZ_TEAM_NAME[3])
		local teamsum = 0
		local szstr = {}
		local szstr2 = ""
		
		for i=1,3 do
			if team[i] ~= "" then
				teamsum = teamsum + 1
				szstr[teamsum] = format("<color=yellow>%s<color>",team[i])
			end
		end
		szstr2 = szstr[1]
		for i=2,teamsum do
			szstr2 = szstr2 ..", ".. szstr[i]
		end
		local szstr = format("Tranh �o�t b�o t�ng Vi�m �� b�t ��u r�i, hi�n t�i s� t� ��i tham gia: %s",szstr2)
		Msg2MSAll(YDBZ_MISSION_MATCH,szstr)
		YDBZ_close_missions(YDBZ_READY_MAP, YDBZ_READY_MISSION, YDBZ_READY_STATE);
		YDBZ_create_all_npc()

		StartMissionTimer(YDBZ_MISSION_MATCH, YDBZ_TIMER_MATCH, YDBZ_LIMIT_BOARDTIME * 18);
		Msg2MSAll(YDBZ_MISSION_MATCH,format("V��t �i b�o t�ng vi�m �� b�t ��u, c�n <color=yellow>%s ph�t<color>.",floor(YDBZ_LIMIT_FINISH/60)))
	end
	
end

-- �رձ�����ʱ��
function YDBZ_close_match_timer()
	StopMissionTimer(YDBZ_MISSION_MATCH, YDBZ_TIMER_MATCH);
end

function YDBZ_close_mission_match()
	YDBZ_close_match_timer();
	Msg2MSAll(YDBZ_MISSION_MATCH,"V��t �i b�o t�ng vi�m �� k�t th�c, h�y l�u � th�i gian b�t ��u c�a ��t sau.")
	CloseMission(YDBZ_MISSION_MATCH)
end

function YDBZ_broad_limit_time()
	local nstate = GetMissionV(YDBZ_VARV_STATE)
	SetMissionV(YDBZ_VARV_STATE,(nstate+1))
	local szstr = format("V��t �i b�o t�ng vi�m �� c�n <color=yellow>%s ph�t<color>.",floor(   (YDBZ_LIMIT_FINISH-  (nstate-3)*YDBZ_LIMIT_BOARDTIME)  /60) )
	Msg2MSAll(YDBZ_MISSION_MATCH,szstr)
end

function OnTimer()

	-- ������ʼ
	local ns = floor(YDBZ_LIMIT_FINISH/YDBZ_LIMIT_BOARDTIME)
	local nstate = GetMissionV(YDBZ_VARV_STATE)
	--print("start mission onTime"..nstate)
	if nstate >= 4 and nstate < (3+ns) then
		YDBZ_broad_limit_time()
	elseif nstate == (3+ns) then
		YDBZ_close_mission_match()
	elseif nstate == 3 then
		YDBZ_close_match_timer();
		YDBZ_start_match();
	end

end
