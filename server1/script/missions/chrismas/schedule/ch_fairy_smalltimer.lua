Include([[\script\missions\chrismas\ch_head.lua]]);

function OnTimer()
	local nTimerState = GetMissionV(MS_TIMERSTATE) + 1;
	nTimerState = mod(nTimerState, 3);
	SetMissionV(MS_TIMERSTATE, nTimerState);	--����0, 1, 2֮��ת��0������֣�1ˢ��
	
	if (1 == nTimerState) then
		putfairy();
		return
	elseif (0 == nTimerState) then
		clearfairy();
		return
	end;
end;