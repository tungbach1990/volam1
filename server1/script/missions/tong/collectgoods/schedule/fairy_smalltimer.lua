Include([[\script\missions\tong\collectgoods\head.lua]]);

function OnTimer()
	local nTimerState = GetMissionV(COLLG_MS_TIMERSTATE) + 1;
	nTimerState = mod(nTimerState, 3);
	SetMissionV(COLLG_MS_TIMERSTATE, nTimerState);	--����0, 1, 2֮��ת��0������֣�1ˢ��
	
	if (1 == nTimerState) then
		collg_putfairy();
		return
	elseif (0 == nTimerState) then
		collg_clearfairy();
		return
	end;
end;