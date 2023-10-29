-- description	: ������ʱ��
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\dragonboat\\include.lua")
Include("\\script\\missions\\dragonboat\\npc.lua")

function cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "���۱���ȡ����")
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
		-- ͨ��
		broadcast("Cu�c �ua thuy�n R�ng �� ch�nh th�c b�t ��u, c�c h�o th� �ang ra s�c tranh t�i!");

		-- ��ʼ������
		SetMissionV(VARV_NPC_BATCH, 1);	-- �ֵ�����
    	
		-- �����ͼ
		world = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(world);
		ClearMapTrap(world); 
		ClearMapObj(world);
    	
		-- ���ɵ�1����
		create_npc(1);
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
