IncludeLib("BATTLE")
Include("\\script\\battles\\singlefight\\dt_head.lua")
Include("\\script\\battles\\battlehead.lua")


function OnDeath(Launcher)
--LauncherΪıɱ��.
	PlayerIndexPK = NpcIdx2PIdx(Launcher);
	PlayerIndexKO  = PlayerIndex;

	if (PlayerIndexPK > 0) then
		PlayerIndex = PlayerIndexPK
		dt_winbonus(GetCurCamp())
		PlayerIndex = PlayerIndexKO
	end;
	
	PlayerIndex = PlayerIndexKO
	CloseMission(DTMISSIONID)
end;

