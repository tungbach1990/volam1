Include("\\script\\missions\\cs������\\���䳡head.lua");
function main()
	LeaveTeam()
	SetCurCamp(GetCamp());
	SetFightState(1);
	SetLogoutRV(0);
	SetRevPos(CS_RevId, CS_RevData)
	NewWorld(GetLeavePos());
end;