Include("\\script\\event\\storm\\head.lua")

function OnTimer()
	if (storm_valid_game(4)) then
		local restcount = TM_GetRestCount(44)
		if (restcount == 0) then
			storm_end(4)
		else
			Msg2Player(storm_gamename(4).."Khi�u chi�n Phong Ba c�n d� th�i gian:"..storm_point2str(STORM_TIMER_YS*restcount).."ph�t")
		end
	else
		TM_StopTimer(STORM_TIMERID_YS)
	end
end
