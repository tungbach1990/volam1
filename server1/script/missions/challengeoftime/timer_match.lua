-- description	: ������ʱ��
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\npc.lua")

function cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "����ȡ����")
end

-- ��ʼ����
function start_match()
	-- ����Ϊ����״̬
	SetMissionV(VARV_STATE, 2);

	local player_count = GetMSPlayerCount(MISSION_MATCH);
	if (player_count == 0) then
		-- ȡ������
		cancel_match();
	else
		-- ��������������ʱ��
		start_close_timer();
		
		-- ͨ��
		broadcast("Nhi�m v� 'Th�ch th�c Th�i gian' �� ch�nh th�c b�t ��u, anh h�ng c�c n�i �ang ra s�c tranh t�i");

		-- ��ʼ������
		SetMissionV(VARV_NPC_BATCH, 1);	-- �ֵ�����
		SetMissionV(VARV_MISSION_RESULT, 0);
		SetMissionV(VARV_PLAYER_USE_INDEX, 0);
		SetMissionV(VARV_NPC_USE_INDEX, 0);
		
		-- С��߱�����ֵĹؿ�
		local nBossBatch = random(5, 15)
		SetMissionV(VARV_XIAONIESHICHEN_BATCH, nBossBatch)	-- ��5��15�������һ���ؿ�
		WriteLog(format("Ti�u Nhi�p Th� Tr�n xu�t hi�n th� �i l� %d",nBossBatch))
		
		-- ���������Ϣ
		save_player_info();
    	
		-- �����ͼ
		world = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(world);
		ClearMapTrap(world); 
		ClearMapObj(world);
    	
		-- ���ɵ�1����
		create_batch_npc(1);
	end
	
	-- �����������
	SetMissionV(VARV_PLAYER_COUNT, player_count);
end

-- �رձ�����ʱ��
function close_match_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_MATCH);
end

function OnTimer()
	-- ��������
	close_match_timer();
	-- ������ʼ
	start_match();
	start_board_timer();
end
