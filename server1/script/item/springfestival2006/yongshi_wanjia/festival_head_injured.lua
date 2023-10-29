Include([[\script\missions\tong\tong_springfestival\head.lua]]);

function OnMagicAttrib(nCallState, nTargetNpcIndex, nLauncherNpcIndex)
	if NpcIdx2PIdx(nTargetNpcIndex) <= 0 then
		return 
	end
	PlayerIndex = NpcIdx2PIdx(nTargetNpcIndex)
	
    local nOldPlayer = PlayerIndex;
    
    local nAttackTimes = GetTask(TK_ATTACKED_TIMES) + 1;
    
    local idx = nLauncherNpcIndex;
    local nHurtPlayer = NpcIdx2PIdx(idx);
    
    PlayerIndex = nHurtPlayer;
    
    if (GetTask(TK_GROUPID) <= SF_SMALLMAPCOUNT) then
        SetTask(SF_COUNT_ONETIME, GetTask(SF_COUNT_ONETIME) + 1);
        Msg2Player("B�n ��nh tr�ng "..SF_ANIMALNAME..GetTask(SF_COUNT_ONETIME).."l�n!");
    end;
    
    PlayerIndex = nOldPlayer;
    if (nAttackTimes >= 20) then
        festival_go_other_place();
        AddSkillState(673, 20, 0, 20 * 18);
        AddSkillState(309, 10, 0, 20 * 18); --���ܹ���
        Msg2Player("Qu�i th� m�i khi b� ph�o n� tr�ng 20 l�n th� s� b� cho�ng trong <color=yellow>20 gi�y<color>!");
        nAttackTimes = 0;
    end;
    SetTask(TK_ATTACKED_TIMES, nAttackTimes);
    AddSkillState(674, 15, 0, 5 * 18);
end;