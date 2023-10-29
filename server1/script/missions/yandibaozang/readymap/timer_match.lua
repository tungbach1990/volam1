-- description	: ������ʱ��
-- author		: wangbin
-- datetime		: 2005-06-04
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")

-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..

function YDBZ_cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "����ȡ����")
end

-- ��ʼ����
function YDBZ_ready_start_match()
	-- ����Ϊ����״̬
	local oldworld = SubWorld
	SetMissionV(YDBZ_READY_STATE, 3);

	local player_count = GetMSPlayerCount(YDBZ_READY_MISSION);
	local teams_count = GetMissionV(YDBZ_READY_TEAM)
	if (player_count == 0 or teams_count < YDBZ_TEAM_START_LIMIT) then
		-- ȡ������
		Msg2MSAll(YDBZ_READY_MISSION,"Do v� t� ��i kh�ng ��, kh�ng th� m� b�o t�ng Vi�m ��")
		YDBZ_cancel_match();
	else
		broadcast("Ho�t ��ng b�o t�ng Vi�m �� �� ch�nh th�c b�t ��u, c�c cao th� �ang trong tr�ng th�i thi ��u");
		SubWorld = oldworld
		YDBZ_ready_start_missions(YDBZ_MAP_MAP, SubWorld,YDBZ_MISSION_MATCH,YDBZ_READY_MISSION);	
		
		-- ��������������ʱ��
--		YDBZ_start_close_timer();
		
		-- ͨ��
		SubWorld = oldworld
		

		-- ��ʼ������
--		SetMissionV(VARV_NPC_BATCH, 1);	-- �ֵ�����
--		SetMissionV(VARV_MISSION_RESULT, 0);
--		SetMissionV(VARV_PLAYER_USE_INDEX, 0);
--		SetMissionV(VARV_NPC_USE_INDEX, 0);
		
--		-- ���������Ϣ
--		save_player_info();
--    	
--		-- �����ͼ
		SetMissionV(YDBZ_READY_STATE, 0);
		SetMissionV(YDBZ_READY_TEAM, 0);
		--YDBZ_ready_close_match()
--    	
--		-- ���ɵ�1����
--		create_batch_npc(1);
	end
	
	-- �����������
	--SetMissionV(VARV_PLAYER_COUNT, player_count);
	YDBZ_ready_close_match_timer()
	YDBZ_ready_close_match()
end
function YDBZ_ready_match()
	broadcast(format("Th�i gian b�o danh v��t �i b�o t�ng vi�m �� �� k�t th�c, xin m�i c�c v� l�m nh�n s� h�y chu�n b� l�n cu�i, c�n %s b�t ��u.",YDBZ_READY_LIMIT_WAIT));
	Msg2MSAll(YDBZ_READY_MISSION,format("Th�i gian b�o danh b�o t�ng Vi�m �� k�t th�c, xin m�i c�c v� v� l�m cao th� chu�n b� l�n cu�i. C�n <color=yellow>%s gi�y<color> b�t ��u tranh �o�t.",YDBZ_READY_LIMIT_WAIT))
	StartMissionTimer(YDBZ_READY_MISSION, YDBZ_READY_TIMER, YDBZ_READY_LIMIT_WAIT * 18);
	SetMissionV(YDBZ_READY_STATE, 2);
end

function YDBZ_ready_broad_talk()
	local broadstate = GetMissionV(YDBZ_READY_BROAD_STATE)
	local nlimittime = floor((YDBZ_READY_LIMIT_SIGNUP - (broadstate * YDBZ_READY_LIMIT_BROAD))/60)
	Msg2MSAll(YDBZ_READY_MISSION,format("V��t �i b�o t�ng vi�m �� c�n <color=yellow>%s ph�t<color> k�t th�c th�i gian b�o danh, h�y nhanh nhanh b�o danh.",nlimittime))
	SetMissionV(YDBZ_READY_BROAD_STATE,broadstate + 1)
end
-- �رձ�����ʱ��
function YDBZ_ready_close_match_timer()
	StopMissionTimer(YDBZ_READY_MISSION, YDBZ_READY_TIMER);
end

function OnTimer()
	local state = GetMissionV(YDBZ_READY_STATE)
	local broadstate = GetMissionV(YDBZ_READY_BROAD_STATE)
	if state == 1 then
		-- ��������
		if ( broadstate * YDBZ_READY_LIMIT_BROAD ) >= YDBZ_READY_LIMIT_SIGNUP then
			YDBZ_ready_close_match_timer();
			-- ׼���׶�
			YDBZ_ready_match();
			--print("��������")
		else
			YDBZ_ready_broad_talk()
		end
	elseif state == 2 then
		--print("׼������")
		YDBZ_ready_close_match_timer();
		YDBZ_ready_start_match();
	end
--	start_board_timer();
end
